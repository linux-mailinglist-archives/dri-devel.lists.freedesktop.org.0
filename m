Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F06D7508
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 13:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B206E7B0;
	Tue, 15 Oct 2019 11:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435F36E2C8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 11:33:21 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id v17so19882640wml.4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 04:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uCg5k9ZAbrV4GjqeNyvcbYZv8xwqr0DzEBoAapcuUF4=;
 b=M13tISyZg+Su/rsYFtqpDpq9IjU3cE0h+VVq7TmzxWPa4J2WSLdpd5vTX6duRB41X+
 rV6zJ2ErWaN0Zwlwg02FlQNAX/8JsxQUqLYMgaGQXSMIzWJ3Aj8qxySRCBrKmGZm51J2
 C+hD55B9NLwWbj8aZJyEPD5fTEw8Hjshu5XpK1KmjZZntuJODpj8262iu1jIOtNy71Gq
 GJN2Comr90NtpePSBxbs3XYGoX5DUIS0bBjLeSJqArtP0dWvBctr8Nktlh1bxqSFNfIr
 eCkLMvseqWxNUZQaizc8yoJTwm4dbiM5KGyXWyxQositrDtgfFOTsranASkQ4JryWvAa
 Uh5A==
X-Gm-Message-State: APjAAAV8caf0eMDDJJacw4mQZv9tsBjXGRIpOgonviC1+swnZbjk4AyK
 je1ecDCJpqnjeFCGoVHfJg10UPdKXoeP2Q==
X-Google-Smtp-Source: APXvYqyIEaSI5PuyJnBq1t2p/C0YZ4qVez2hBxOerZiqkWm523CK/Be1suSrot9c87mv9lo9+TH4/g==
X-Received: by 2002:a7b:c313:: with SMTP id k19mr2446921wmj.6.1571139199425;
 Tue, 15 Oct 2019 04:33:19 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 63sm32395096wri.25.2019.10.15.04.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 04:33:18 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/meson: implement RDMA for AFBC reset on vsync
Date: Tue, 15 Oct 2019 13:33:14 +0200
Message-Id: <20191015113317.8870-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uCg5k9ZAbrV4GjqeNyvcbYZv8xwqr0DzEBoAapcuUF4=;
 b=G3fnqlIagUgIzXqdwH5ad+9LBWcqrcYgJb30mqH/lJuHES/QADTo7Q79HHx38JFeTw
 iBIq6Rqp2ebm7x8t/kgaoAOp5et70+eGTzJos/0qlpHJndcaijozRSQnJL5Pb5SnNQQU
 76EUgt79m8OWixvlxO89x8wmWLHnZEU5HTqvG3Kx1S6J5F6MtbDiVsqaEh2P25bnBjQo
 1qCm1lmgxaAGgzHHdCzFXDtXxj8y9Fb4mYBGRibzBCvjCSpudY/a0KPWikrkqfo7SO1S
 Nfl6Yz5EX2IvwfF6VL7q8qnMU7bhNWi1lRgDZt45RxD56XeB/EerY8fY66o2NLxJt+pB
 NTzw==
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
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFZQVSBlbWJlZHMgYSAiUmVnaXN0ZXIgRE1BIiB0aGF0IGNhbiB3cml0ZSBhIHNlcXVlbmNl
IG9mIHJlZ2lzdGVycwpvbiB0aGUgVlBVIEFIQiBidXMsIGVpdGhlciBtYW51YWxseSBvciB0cmln
Z2VyZWQgYnkgYW4gaW50ZXJuYWwgSVJRCmV2ZW50IGxpa2UgVlNZTkMgb3IgYSBsaW5lIGlucHV0
IGNvdW50ZXIuCgpUaGUgaW5pdGlhbCBpbXBsZW1lbnRhdGlvbiBoYW5kbGVzIGEgc2luZ2xlIGNo
YW5uZWwgKG92ZXIgOCksIHRyaWdnZXJlZApieSB0aGUgVlNZTkMgaXJxIGFuZCBkb2VzIG5vdCBo
YW5kbGUgdGhlIFJETUEgaXJxLgoKVGhlIFJETUEgd2lsbCBiZSB1c2VmdWxsIHRvIHJlc2V0IGFu
ZCBwcm9ncmFtIHRoZSBBRkJDIGRlY29kZXIgdW5pdApvbiBlYWNoIHZzeW5jIHdpdGhvdXQgaW52
b2x2aW5nIHRoZSBpbnRlcnJ1cHQgaGFuZGxlciB0aGF0IGNhbgpiZSBtYXNrZWQgZm9yIGEgbG9u
ZyBwZXJpb2Qgb2YgdGltZSwgcHJvZHVjaW5nIGRpc3BsYXkgZ2xpdGNoZXMuCgpGb3IgdGhpcyB3
ZSB1c2UgdGhlIG1lc29uX3JkbWFfd3JpdGVsX3N5bmMoKSB3aGljaCBhZGRzIHRoZSByZWdpc3Rl
cgp3cml0ZSB0dXBsZSAoVlBVIHJlZ2lzdGVyIG9mZnNldCBhbmQgcmVnaXN0ZXIgdmFsdWUpIHRv
IHRoZSBSRE1BIGJ1ZmZlcgphbmQgd3JpdGUgdGhlIHZhbHVlIHRvIHRoZSBIVy4KCldoZW4gZW5h
YmxlZCwgdGhlIFJETUEgaXMgZW5hYmxlZCB0byByZXdyaXR0ZSB0aGUgc2FtZSBzZXF1ZW5jZSBh
dCB0aGUKbmV4dCBWU1lOQyBldmVudCwgdW50aWwgYSBuZXcgYnVmZmVyIGlzIGNvbW1pdHRlZCB0
byB0aGUgT1NEIHBsYW5lLgoKVGhlIHRoZSBBbWxvZ2ljIEcxMkEgaXMgc3dpdGNoZWQgdG8gUkRN
QSwgdGhlIEFtbG9naWMgR1hNIERlY29kZXIKZG9lc24ndCBuZWVkIGEgcmVzZXQvcmVwcm9ncmFt
IGF0IGVhY2ggdnN5bmMuCgpOZWlsIEFybXN0cm9uZyAoMyk6CiAgZHJtL21lc29uOiBhZGQgUkRN
QSByZWdpc3RlciBiaXRzIGRlZmluZXMKICBkcm0vbWVzb246IGFkZCBSRE1BIG1vZHVsZSBkcml2
ZXIKICBkcm0vbWVzb246IHVzZSBSRE1BIHRvIHJlY29uZmlndXJlIEFGQkMgb24gdnN5bmMKCiBk
cml2ZXJzL2dwdS9kcm0vbWVzb24vTWFrZWZpbGUgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMv
Z3B1L2RybS9tZXNvbi9tZXNvbl9jcnRjLmMgICAgICB8ICAyNyArKy0tLS0KIGRyaXZlcnMvZ3B1
L2RybS9tZXNvbi9tZXNvbl9kcnYuYyAgICAgICB8ICAxNCArKy0KIGRyaXZlcnMvZ3B1L2RybS9t
ZXNvbi9tZXNvbl9kcnYuaCAgICAgICB8ICAgNiArKwogZHJpdmVycy9ncHUvZHJtL21lc29uL21l
c29uX29zZF9hZmJjZC5jIHwgMTAwICsrKysrKysrKystLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9tZXNvbi9tZXNvbl9yZG1hLmMgICAgICB8IDEyMyArKysrKysrKysrKysrKysrKysrKysrKysK
IGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9yZG1hLmggICAgICB8ICAyMCArKysrCiBkcml2
ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fcmVnaXN0ZXJzLmggfCAgNDggKysrKysrKysrCiA4IGZp
bGVzIGNoYW5nZWQsIDI3MyBpbnNlcnRpb25zKCspLCA2NyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fcmRtYS5jCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3JkbWEuaAoKLS0gCjIuMjIuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
