Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A179E1B3
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 10:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D868991A;
	Tue, 27 Aug 2019 08:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250F989915
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 08:14:30 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j16so17793609wrr.8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 01:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZKa+G+WNTHyk8o+xbr/dEWEAIM2ZkisNR8p1GVxWpVo=;
 b=hCezm2fYV/myyLo2dbIqjtG/slXW2V+Tf3JStIHiP+VDb5eqyDuBLKtc2Bd2y4pqUg
 /L6qtZD2iuH/yLoHVq97yz23i5Rn5aT9Db6ZDRojyyrbKRZtOlaovsl6r/htLHjMgrKA
 EhtSyfEJqEFp7v09fvnF0NMzkgqUca8JWaraMi5LkM8Z08fTlQQvk8DGtJA0FzpphYg4
 eTL3yv4q2GbrQhG3l0WLc36YOCpqzcte1oIAiGxGcgMcdfAxbtUOTSeTobKzrghfdIQS
 +D6z3xwGhJEvRbDHgWFvKCTe4iUCrMcdUBZPwN84dz1RsR0YB1eFvs3QK6BimJ3ARyeN
 /vjg==
X-Gm-Message-State: APjAAAU/Xf0wpEYqSYDze9XmMpRmPzJYMfk3zqWz/zigZroiEeQ8Fyt8
 Hwqc7O1xIf7xaQX2eqNHyJACJQ==
X-Google-Smtp-Source: APXvYqzpBpaNw1HlOn1Jl1PNM6gfssXbj4UcMPr8NMqOQJ/Czl/iUduxSNiZP+V231WzJ3FtdGIAng==
X-Received: by 2002:a5d:4d81:: with SMTP id b1mr26198331wru.27.1566893668403; 
 Tue, 27 Aug 2019 01:14:28 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f18sm11911792wrx.85.2019.08.27.01.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 01:14:27 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH RFC v2 0/8] drm/bridge: dw-hdmi: implement bus-format
 negotiation and YUV420 support
Date: Tue, 27 Aug 2019 10:14:17 +0200
Message-Id: <20190827081425.15011-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZKa+G+WNTHyk8o+xbr/dEWEAIM2ZkisNR8p1GVxWpVo=;
 b=0VeKXm8Af8pEVqLyMPQhZTzMrsz8jVxkUaD5N4qpJaKNrac9JiXxDZSi2OWY6CJWXH
 k5TbIKg5WQsbaPPeCNzPx5q65qXgXWpUZV626HZ+sCdW1tzeSmkqZVrkaEI7+Z+3zPbK
 UWO9sJlC4cwbiPfw8AoNHVhuCBhQl4gjU4uNNRNE8VIyHE7+6C1KSIxq6//YMwYgEOUA
 Y5gtfrxTpa+GeYTYY/8Ze3/m5eUSQrahDFgPWgCyd4xmDWJULzeglCAIyALZVUEMCX2b
 4UWdV38bJNagvtev1EUAI43EFYDNZyKZtN5fp51ZG77+1QiXjSdH0bWKye3oln5N1neH
 svkA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaHNldCBpcyBiYXNlZCBvbiBCb3JpcydzIHYyICJkcm06IEFkZCBzdXBwb3J0IGZv
ciBidXMtZm9ybWF0IG5lZ290aWF0aW9uIiBhdCBbMV0KcGF0Y2hzZXQgdG8gaW1wbGVtZW50IGZ1
bGwgYnVzLWZvcm1hdCBuZWdvdGlhdGlvbiBmb3IgRFctSERNSSwgaW5jbHVkaW5nIFlVVjQyMCBz
dXBwb3J0IGFuZAoxMC8xMi8xNmJpdCBZVVY0NDQsIFlVVjQyMiBhbmQgUkdCLiBUaGUgQ29sb3Ig
U3BhY2UgQ29udmVydGVyIHN1cHBvcnQgaXMgYWxyZWFkeSBpbXBsZW1lbnRlZC4KCkFuZCB0aGUg
Y291bnRlcnBhcnQgaW1wbGVtZW50YXRpb24gaW4gdGhlIEFtbG9naWMgTWVzb24gVlBVIGR3LWhk
bWkgZ2x1ZSA6Ci0gYmFzaWMgYnVzLWZvcm1hdCBuZWdvdGlhdGlvbiB0byBzZWxlY3QgWVVWNDQ0
IGJ1cy1mb3JtYXQgYXMgRFctSERNSSBpbnB1dAotIFlVVjQyMCBzdXBwb3J0IHdoZW4gSERNSTIu
MCBZVVY0MjAgbW9kZXNldAoKVGhpcyBpcyBhIGZvbGxvdy11cCBmcm9tIHRoZSBwcmV2aW91cyBh
dHRlbXB0cyA6Ci0gImRybS9tZXNvbjogQWRkIHN1cHBvcnQgZm9yIEhETUkyLjAgWVVWNDIwIDRr
NjAiIGF0IFsyXQotICJkcm0vbWVzb246IEFkZCBzdXBwb3J0IGZvciBIRE1JMi4wIDRrNjAiIGF0
IFszXQoKQ2hhbmdlcyBzaW5jZSBSRkMgdjEgYXQgWzRdOgotIFJld3JvdGUgbmVnb2NpYXRpb24g
dXNpbmcgdGhlIHYyIHBhdGNoc2V0LCBpbmNsdWRpbmcgZnVsbCBEVy1IRE1JIGZtdCBuZWdvY2lh
dGlvbgoKWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8y
MDE5MDgyNjE1MjY0OS4xMzgyMC0xLWJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tClsyXSBo
dHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTA1MjAxMzM3
NTMuMjM4NzEtMS1uYXJtc3Ryb25nQGJheWxpYnJlLmNvbQpbM10gaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzE1NDkwMjI4NzMtNDA1NDktMS1naXQtc2VuZC1l
bWFpbC1uYXJtc3Ryb25nQGJheWxpYnJlLmNvbQpbNF0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwODIwMDg0MTA5LjI0NjE2LTEtbmFybXN0cm9uZ0Bi
YXlsaWJyZS5jb20KCk5laWwgQXJtc3Ryb25nICg4KToKICBkcm0vbWVzb246IHZlbmM6IG1ha2Ug
ZHJtX2Rpc3BsYXlfbW9kZSBjb25zdAogIGRybS9tZXNvbjogbWVzb25fZHdfaGRtaTogc3dpdGNo
IHRvIGRybV9icmlkZ2VfZnVuY3MKICBkcm0vYnJpZGdlOiBzeW5vcHN5czogZHctaGRtaTogYWRk
IGJ1cyBmb3JtYXQgbmVnb2NpYXRpb24KICBkcm0vbWVzb246IGR3LWhkbWk6IHN0b3AgZW5mb3Jj
aW5nIGlucHV0X2J1c19mb3JtYXQKICBkcm0vYnJpZGdlOiBkdy1oZG1pOiBhbGxvdyB5Y2JjcjQy
MCBtb2RlcyBmb3IgPj0gMHgyMDBhCiAgZHJtL21lc29uOiB2ZW5jOiBhZGQgc3VwcG9ydCBmb3Ig
WVVWNDIwIHNldHVwCiAgZHJtL21lc29uOiB2Y2xrOiBhZGQgc3VwcG9ydCBmb3IgWVVWNDIwIHNl
dHVwCiAgZHJtL21lc29uOiBBZGQgWVVWNDIwIG91dHB1dCBzdXBwb3J0CgogZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgfCAyNTEgKysrKysrKysrKysrKysrKysrKysr
LQogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYyAgICAgfCAxNjQgKysrKysr
KysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMgICAgICAgIHwgIDkz
ICsrKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmNsay5oICAgICAgICB8ICAg
NyArLQogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuYyAgICAgICAgfCAgMTAgKy0K
IGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmggICAgICAgIHwgICA0ICstCiBkcml2
ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuY19jdmJzLmMgICB8ICAgMyArLQogaW5jbHVkZS9k
cm0vYnJpZGdlL2R3X2hkbWkuaCAgICAgICAgICAgICAgfCAgIDEgKwogOCBmaWxlcyBjaGFuZ2Vk
LCA0NjYgaW5zZXJ0aW9ucygrKSwgNjcgZGVsZXRpb25zKC0pCgotLSAKMi4yMi4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
