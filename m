Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6B743395
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A972B89369;
	Thu, 13 Jun 2019 07:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89ED08946E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:33:29 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id c85so9235640pfc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 01:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=igoVoB0OnXmy6EuJPmaIUyWNG2dIdSj4pnrf3gfv3+o=;
 b=rubRMXuFibRRdD9PeX/tyYER4DEQqBWGAB/r+hLuDCSEZiWOXSuIigDQyLt3+sZy+2
 meOAbzOFR+4JrBcJG/jBwY2ijCBFoY5NFLBMjrxaUUbZV0pt5JVQi7hxGfDaZ1C++8vo
 wJlpy0sKhpkjPwJeWfa29dJ9A4eVDrsWLqeW+vURT7FSdErKoKUjTtMHqlDJuvmqAXYJ
 xjFUo2qotYWCT4cgqauGe8+f45uTI6mpa0dyKTOXXO+MT8pVmEDyCHGtsOwHp3Oezg1y
 3MMk/IJl149wDbr8dodt3DBJgALeYeRkL5axF8qFYamE1+s30q1vTWJcwAgMrInk7ePv
 sCAw==
X-Gm-Message-State: APjAAAXi4S7/XDG7BnXOXDdi23L9ue0nBW57YmEG/eO6l6pIWt9naznL
 +3oDKTNpO/ZAh49hBfjA79dCceNSeSU=
X-Google-Smtp-Source: APXvYqw/eK2VeKXRRyWQlJOOIhkx61Jz2WsrzwZ54xiu4xqwThRJaSbrxMJ9eo5gT6QDFRMc9Cy51A==
X-Received: by 2002:a17:90a:a790:: with SMTP id
 f16mr31979845pjq.27.1560328408785; 
 Wed, 12 Jun 2019 01:33:28 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id d21sm18845991pfr.162.2019.06.12.01.33.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 01:33:28 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 15/15] drm/bridge: tc358767: Replace magic number in
 tc_main_link_enable()
Date: Wed, 12 Jun 2019 01:32:52 -0700
Message-Id: <20190612083252.15321-16-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190612083252.15321-1-andrew.smirnov@gmail.com>
References: <20190612083252.15321-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=igoVoB0OnXmy6EuJPmaIUyWNG2dIdSj4pnrf3gfv3+o=;
 b=teC0eGfzqUO3ALXtEZBFv+MKaGc6LEKWBQiJAEeODv6JYqxVtDS3W+4mJ3f/IM7Rrl
 /nBZFQW/Aq56XVyB0zHcWM5QjtZinq/CVvkfKJiR4fPOcL9mdpbCMRr+AlGWS8MgK5Lu
 0R8Wa2PgAroQB8xFNAqU4qYPFARBqwrwwAj7T4g2Pnmv4iQ4cRCCPdCUm55RjsHLDic4
 anxaURAwP4BsQnqPOrkO550RdpAva/9SivhuijKsP392SD0X3CbVvQuFiumZ4oXYX3mQ
 O6vdTFP7ugHku9MNcQ/gtReA2mwI9lY+z2AAJs/owk5UH8eCpE0BzTML6d4DIM9yaX+N
 L+ag==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgZG9uJ3QgbmVlZCA4IGJ5dGUgYXJyYXksIERQX0xJTktfU1RBVFVTX1NJWkUgKDYpIHNob3Vs
ZCBiZQplbm91Z2guIFRoaXMgYWxzbyBnZXRzIHJpZCBvZiBhIG1hZ2ljIG51bWJlciBhcyBhIGJv
bnVzLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IFNtaXJub3YgPGFuZHJldy5zbWlybm92QGdtYWls
LmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CkNj
OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgpDYzogTGF1cmVudCBQaW5jaGFy
dCA8TGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpDYzogVG9taSBWYWxrZWluZW4g
PHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KQ2M6IEFuZHJleSBHdXNha292IDxhbmRyZXkuZ3VzYWtv
dkBjb2dlbnRlbWJlZGRlZC5jb20+CkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJv
bml4LmRlPgpDYzogQ29yeSBUdXNhciA8Y29yeS50dXNhckB6aWkuYWVybz4KQ2M6IENocmlzIEhl
YWx5IDxjcGhlYWx5QGdtYWlsLmNvbT4KQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJv
bml4LmRlPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3Njcu
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwppbmRleCA4MWVkMzU5NDg3YzcuLmI0MDNjN2JhZDE1
NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwpAQCAtODc0LDcgKzg3NCw3IEBAIHN0YXRp
YyBpbnQgdGNfbWFpbl9saW5rX2VuYWJsZShzdHJ1Y3QgdGNfZGF0YSAqdGMpCiAJdTMyIGRwX3Bo
eV9jdHJsOwogCXUzMiB2YWx1ZTsKIAlpbnQgcmV0OwotCXU4IHRtcFs4XTsKKwl1OCB0bXBbRFBf
TElOS19TVEFUVVNfU0laRV07CiAKIAlkZXZfZGJnKHRjLT5kZXYsICJsaW5rIGVuYWJsZVxuIik7
CiAKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
