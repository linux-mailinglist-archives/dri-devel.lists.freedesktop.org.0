Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F41BA9D931
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 00:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC326E320;
	Mon, 26 Aug 2019 22:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF3789CA8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 22:33:28 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id o6so13405481oic.9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 15:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2f3o189Bj9Dp2uZTE2x4J7wjSYnkVvJZDV1ZxRluuIQ=;
 b=bAZDIL2MM8zEXXRVAwJLzY6NOQ2m/qOYCTzUwLEUUrpTtTOniZ/S7mDIyFFv44sQkx
 BtFM5A9sym32G615yP7BcpNZFmdxsQyjy406nDwbO9JN+uCvesQ4tjZI7/1EDCO7MiVb
 SXaCC7p/G3MoufEEE/RxAoErE+3FKbX5048iKnaUUb/0pXJmSDNwYMPkhk7tg63dQySL
 9qbbkE8mKSDPlYYvIhyO1D1NmrH3LxDhrHWD60QJdf8V0J/TKjDmzdZMJaR8E3sobjHU
 5ui+f6G42yXBJ6Q+sJUB9EOwq6WE5sFCas19XNRUg8Pc30lF7d/QjdpbaUZUOwr0sV/O
 vA5w==
X-Gm-Message-State: APjAAAUVrkWIzIDKfQcOkyEkSFPtIfZ0QftBix4VODytx94zJJq485AT
 JakWJYk68nWbtrFknkwDjUozpFA=
X-Google-Smtp-Source: APXvYqwkjZLbxH8BgKwJV2Elzlkgb9JkMkoKw5eEL/Wytqv/T33KHY9B+gGn6Ybfl45M+EXvOEeMVg==
X-Received: by 2002:aca:4d85:: with SMTP id a127mr13779985oib.3.1566858807186; 
 Mon, 26 Aug 2019 15:33:27 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id e22sm3668959oii.7.2019.08.26.15.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 15:33:26 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 8/8] drm/panfrost: Remove unnecessary hwaccess_lock
 spin_lock
Date: Mon, 26 Aug 2019 17:33:17 -0500
Message-Id: <20190826223317.28509-9-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190826223317.28509-1-robh@kernel.org>
References: <20190826223317.28509-1-robh@kernel.org>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZSBhc19sb2NrIHRvIHNlcmlhbGl6ZSBhZGRyZXNz
IHNwYWNlIHJlZ2lzdGVycywKdGhlIGh3YWNjZXNzX2xvY2sgaXMgb25seSB1c2VkIHdpdGhpbiB0
aGUgam9iIGNvZGUgYW5kIGlzIG5vdCBwcm90ZWN0aW5nCmFueXRoaW5nLiBwYW5mcm9zdF9qb2Jf
aHdfc3VibWl0KCkgb25seSBhY2Nlc3NlcyByZWdpc3RlcnMgZm9yIDEgam9iIHNsb3QKYW5kIGl0
J3MgYWxyZWFkeSBzZXJpYWxpemVkIGJ5IGRybV9zY2hlZC4KCkZpeGVzOiA3MjgyZjc2NDVkMDYg
KCJkcm0vcGFuZnJvc3Q6IEltcGxlbWVudCBwZXIgRkQgYWRkcmVzcyBzcGFjZXMiKQpDYzogVG9t
ZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29sbGFib3JhLmNvbT4KQ2M6IFN0ZXZlbiBQcmljZSA8
c3RldmVuLnByaWNlQGFybS5jb20+CkNjOiBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3NhLnJvc2Vu
endlaWdAY29sbGFib3JhLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTogUm9iIEhl
cnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KLS0tCnYzOgogLSBOZXcgcGF0Y2gKCiBkcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMgfCAxIC0KIGRyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaCB8IDIgLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9qb2IuYyAgICB8IDQgLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCA3IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZp
Y2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYwppbmRleCA3
MzgwNTIxMDgzNGUuLjQ2YjBiMDJlNDI4OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9kZXZpY2UuYwpAQCAtMTI0LDcgKzEyNCw2IEBAIGludCBwYW5mcm9zdF9kZXZpY2Vf
aW5pdChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKIAlJTklUX0xJU1RfSEVBRCgmcGZk
ZXYtPnNjaGVkdWxlZF9qb2JzKTsKIAlJTklUX0xJU1RfSEVBRCgmcGZkZXYtPmFzX2xydV9saXN0
KTsKCi0Jc3Bpbl9sb2NrX2luaXQoJnBmZGV2LT5od2FjY2Vzc19sb2NrKTsKIAlzcGluX2xvY2tf
aW5pdCgmcGZkZXYtPmFzX2xvY2spOwoKIAllcnIgPSBwYW5mcm9zdF9jbGtfaW5pdChwZmRldik7
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmgg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmgKaW5kZXggYjdmYTA4
ZWQzYTIzLi45YzM5Yjk3OTQ4MTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9kZXZpY2UuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfZGV2aWNlLmgKQEAgLTYzLDggKzYzLDYgQEAgc3RydWN0IHBhbmZyb3N0X2RldmljZSB7CiAJ
c3RydWN0IGRybV9kZXZpY2UgKmRkZXY7CiAJc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldjsK
Ci0Jc3BpbmxvY2tfdCBod2FjY2Vzc19sb2NrOwotCiAJdm9pZCBfX2lvbWVtICppb21lbTsKIAlz
dHJ1Y3QgY2xrICpjbG9jazsKIAlzdHJ1Y3QgY2xrICpidXNfY2xvY2s7CmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMgYi9kcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMKaW5kZXggMThiY2M5YmFjNmQyLi5hNTg1NTE2NjhkOWEg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMKQEAgLTE0MSw3ICsxNDEs
NiBAQCBzdGF0aWMgdm9pZCBwYW5mcm9zdF9qb2Jfd3JpdGVfYWZmaW5pdHkoc3RydWN0IHBhbmZy
b3N0X2RldmljZSAqcGZkZXYsCiBzdGF0aWMgdm9pZCBwYW5mcm9zdF9qb2JfaHdfc3VibWl0KHN0
cnVjdCBwYW5mcm9zdF9qb2IgKmpvYiwgaW50IGpzKQogewogCXN0cnVjdCBwYW5mcm9zdF9kZXZp
Y2UgKnBmZGV2ID0gam9iLT5wZmRldjsKLQl1bnNpZ25lZCBsb25nIGZsYWdzOwogCXUzMiBjZmc7
CiAJdTY0IGpjX2hlYWQgPSBqb2ItPmpjOwogCWludCByZXQ7CkBAIC0xNTgsNyArMTU3LDYgQEAg
c3RhdGljIHZvaWQgcGFuZnJvc3Rfam9iX2h3X3N1Ym1pdChzdHJ1Y3QgcGFuZnJvc3Rfam9iICpq
b2IsIGludCBqcykKIAljZmcgPSBwYW5mcm9zdF9tbXVfYXNfZ2V0KHBmZGV2LCAmam9iLT5maWxl
X3ByaXYtPm1tdSk7CgogCXBhbmZyb3N0X2RldmZyZXFfcmVjb3JkX3RyYW5zaXRpb24ocGZkZXYs
IGpzKTsKLQlzcGluX2xvY2tfaXJxc2F2ZSgmcGZkZXYtPmh3YWNjZXNzX2xvY2ssIGZsYWdzKTsK
CiAJam9iX3dyaXRlKHBmZGV2LCBKU19IRUFEX05FWFRfTE8oanMpLCBqY19oZWFkICYgMHhGRkZG
RkZGRik7CiAJam9iX3dyaXRlKHBmZGV2LCBKU19IRUFEX05FWFRfSEkoanMpLCBqY19oZWFkID4+
IDMyKTsKQEAgLTE4Nyw4ICsxODUsNiBAQCBzdGF0aWMgdm9pZCBwYW5mcm9zdF9qb2JfaHdfc3Vi
bWl0KHN0cnVjdCBwYW5mcm9zdF9qb2IgKmpvYiwgaW50IGpzKQogCQkJCWpvYiwganMsIGpjX2hl
YWQpOwoKIAlqb2Jfd3JpdGUocGZkZXYsIEpTX0NPTU1BTkRfTkVYVChqcyksIEpTX0NPTU1BTkRf
U1RBUlQpOwotCi0Jc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmcGZkZXYtPmh3YWNjZXNzX2xvY2ss
IGZsYWdzKTsKIH0KCiBzdGF0aWMgdm9pZCBwYW5mcm9zdF9hY3F1aXJlX29iamVjdF9mZW5jZXMo
c3RydWN0IGRybV9nZW1fb2JqZWN0ICoqYm9zLAotLQoyLjIwLjEKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
