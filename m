Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A7A9A552
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 04:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8816EBAA;
	Fri, 23 Aug 2019 02:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5686EB21
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 02:12:23 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id l2so5938468oil.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 19:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k+NTlGr0d+34j78gJ1Mf4qbMv8Jq5bw97eaaB6YOzMs=;
 b=JWsXboN9HFM4o6+2Y1ad2KtW0INYTtdu6oW08DaDtn0mwSjZ8yTOQicv+XkExIV7Zp
 k80BYci+ylqOIXighVlygELESViMy/Wvo9S/AzpoB3X3PQnVr8A2KAHXbT9NtQUsFvU8
 c8TFQAEx8lCPWr3C+xGP+YqkMDa8Uz1UVreXn3I8aWdHvc93OYkMOmWfrJ4NtXsbI2tD
 om375rYvqCMEGFNMz0f4hjc7MJV79NFJHi044OuGF/SyQkKcL3o5Fj/aGOd1yrvz9/X3
 1J+jMjSDNuJx1dYmT+o7xv2ULMzvbj7HFXGbuqMBhoa7uvtrD7Dlw6kdeCVPUdtKxVZc
 Tk/Q==
X-Gm-Message-State: APjAAAXkZpFL3/4Mavsdd2iFQsyh4q0PTao6znahWXzpNSwR3CU2/vIL
 TNb96PO6+OoTWXdK2JV54MrVvXo=
X-Google-Smtp-Source: APXvYqxjzg9JgKSgbaMv0xGGENtnwIecQqREjpr0Kj735JJ8SnoUl2raiYt3gCdvfC9g4Aa4C+obsw==
X-Received: by 2002:aca:cd12:: with SMTP id d18mr1577251oig.68.1566526342081; 
 Thu, 22 Aug 2019 19:12:22 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id c1sm457747oic.31.2019.08.22.19.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 19:12:21 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/8] drm/panfrost: Hold runtime PM reference until jobs
 complete
Date: Thu, 22 Aug 2019 21:12:11 -0500
Message-Id: <20190823021216.5862-4-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190823021216.5862-1-robh@kernel.org>
References: <20190823021216.5862-1-robh@kernel.org>
MIME-Version: 1.0
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG9pbmcgYSBwbV9ydW50aW1lX3B1dCBhcyBzb29uIGFzIGEgam9iIGlzIHN1Ym1pdHRlZCBpcyB3
cm9uZyBhcyBpdCBzaG91bGQKbm90IGhhcHBlbiB1bnRpbCB0aGUgam9iIGNvbXBsZXRlcy4gSXQg
d29ya3MgYmVjYXVzZSB3ZSBhcmUgcmVseWluZyBvbiB0aGUKYXV0b3N1c3BlbmQgdGltZW91dCB0
byBrZWVwIHRoZSBoL3cgZW5hYmxlZC4KCkNjOiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bj
b2xsYWJvcmEuY29tPgpDYzogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KQ2M6
IEFseXNzYSBSb3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPgpDYzog
RGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgot
LS0KdjI6IG5ldyBwYXRjaAoKIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2Iu
YyB8IDE2ICsrKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyks
IDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3Bh
bmZyb3N0X2pvYi5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jCmlu
ZGV4IDA1Yzg1ZjQ1YTBkZS4uODBjOWNhYjlhMDFiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L3BhbmZyb3N0X2pvYi5jCkBAIC0xNTEsNyArMTUxLDcgQEAgc3RhdGljIHZvaWQgcGFuZnJvc3Rf
am9iX2h3X3N1Ym1pdChzdHJ1Y3QgcGFuZnJvc3Rfam9iICpqb2IsIGludCBqcykKIAkJcmV0dXJu
OwogCiAJaWYgKFdBUk5fT04oam9iX3JlYWQocGZkZXYsIEpTX0NPTU1BTkRfTkVYVChqcykpKSkK
LQkJZ290byBlbmQ7CisJCXJldHVybjsKIAogCWNmZyA9IHBhbmZyb3N0X21tdV9hc19nZXQocGZk
ZXYsICZqb2ItPmZpbGVfcHJpdi0+bW11KTsKIApAQCAtMTg3LDEwICsxODcsNiBAQCBzdGF0aWMg
dm9pZCBwYW5mcm9zdF9qb2JfaHdfc3VibWl0KHN0cnVjdCBwYW5mcm9zdF9qb2IgKmpvYiwgaW50
IGpzKQogCWpvYl93cml0ZShwZmRldiwgSlNfQ09NTUFORF9ORVhUKGpzKSwgSlNfQ09NTUFORF9T
VEFSVCk7CiAKIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZwZmRldi0+aHdhY2Nlc3NfbG9jaywg
ZmxhZ3MpOwotCi1lbmQ6Ci0JcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeShwZmRldi0+ZGV2KTsK
LQlwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChwZmRldi0+ZGV2KTsKIH0KIAogc3RhdGljIHZv
aWQgcGFuZnJvc3RfYWNxdWlyZV9vYmplY3RfZmVuY2VzKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAq
KmJvcywKQEAgLTM4OCw5ICszODQsMTMgQEAgc3RhdGljIHZvaWQgcGFuZnJvc3Rfam9iX3RpbWVk
b3V0KHN0cnVjdCBkcm1fc2NoZWRfam9iICpzY2hlZF9qb2IpCiAKIAltdXRleF9sb2NrKCZwZmRl
di0+cmVzZXRfbG9jayk7CiAKLQlmb3IgKGkgPSAwOyBpIDwgTlVNX0pPQl9TTE9UUzsgaSsrKQor
CWZvciAoaSA9IDA7IGkgPCBOVU1fSk9CX1NMT1RTOyBpKyspIHsKIAkJZHJtX3NjaGVkX3N0b3Ao
JnBmZGV2LT5qcy0+cXVldWVbaV0uc2NoZWQsIHNjaGVkX2pvYik7Ci0KKwkJaWYgKHBmZGV2LT5q
b2JzW2ldKSB7CisJCQlwbV9ydW50aW1lX3B1dF9ub2lkbGUocGZkZXYtPmRldik7CisJCQlwZmRl
di0+am9ic1tpXSA9IE5VTEw7CisJCX0KKwl9CiAJaWYgKHNjaGVkX2pvYikKIAkJZHJtX3NjaGVk
X2luY3JlYXNlX2thcm1hKHNjaGVkX2pvYik7CiAKQEAgLTQ1NSw3ICs0NTUsOSBAQCBzdGF0aWMg
aXJxcmV0dXJuX3QgcGFuZnJvc3Rfam9iX2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRhdGEp
CiAJCQlwZmRldi0+am9ic1tqXSA9IE5VTEw7CiAJCQlwYW5mcm9zdF9tbXVfYXNfcHV0KHBmZGV2
LCAmam9iLT5maWxlX3ByaXYtPm1tdSk7CiAJCQlwYW5mcm9zdF9kZXZmcmVxX3JlY29yZF90cmFu
c2l0aW9uKHBmZGV2LCBqKTsKKwogCQkJZG1hX2ZlbmNlX3NpZ25hbChqb2ItPmRvbmVfZmVuY2Up
OworCQkJcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQocGZkZXYtPmRldik7CiAJCX0KIAogCQlz
dGF0dXMgJj0gfm1hc2s7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
