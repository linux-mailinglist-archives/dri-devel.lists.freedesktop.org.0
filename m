Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A481726A6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255A46ED11;
	Thu, 27 Feb 2020 18:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396B789F01
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:16:09 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p18so4606659wre.9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fC4celYl+zitDraKVjI6Hb1oSvmWpkdE1ngLFdboeds=;
 b=CDTlMh0AnvNK/Hdxi9z0+dkNWm8+NXNvjG3KcbS/5D70aUNHTkzpvh5E//80MNm3QX
 v6QPodBCyFaiqwhon/unIZEHDcVM4hFWlUHegE04wF1G5wyU8IPHGrYlwNYlZaWmiQog
 QPJOBRvFrDHfvSzJ7RS1tXs/aihf0Hkie8JJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fC4celYl+zitDraKVjI6Hb1oSvmWpkdE1ngLFdboeds=;
 b=iAqdZLsv0g6d7xiImMJ6RenC53/orAXTRfOetpEce5IsB9cRb5tU8jCQJZqgSJiNI4
 UbXQfL09JYfeqKB3GvQMjey3JHVsB8SYTz/Co1O8dggiLv0eM9/jehkqGxSBWW3/Lha/
 ch5ne0mkU4Afje3PLePTKJvTOQsu0Ze4amnqVzZCLUidcvfV4uk0aXjKHI+mRKwDlX4y
 SP84pyI8sPwzboEQymXxkzb3wcr498U9e1w95AY7HH1LjaU+z6A4vT2tab5xxb5aAZQb
 8rgKhpI4T19leIM7fbFDVvcAWIeuC7hKCwo5i5eMLVPnXiKoPY9HCRm0aEciZM8O7ON0
 8AjQ==
X-Gm-Message-State: APjAAAW6OQtCwNyZIrH54gQl4LGNUuoHaN6LM63zY/iWi7DrVQcP/ChX
 3M1B/pMrvihr1KIKnjw8pospFmQoK5M=
X-Google-Smtp-Source: APXvYqxNOrW8nk0qHk7r0x8vuing2HlFzdeaEB/C5GOp5TbPM3tClNjG1oFjxsmUQ0qvF/kIebvtBA==
X-Received: by 2002:adf:82a3:: with SMTP id 32mr131227wrc.290.1582827367641;
 Thu, 27 Feb 2020 10:16:07 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q1sm8551152wrw.5.2020.02.27.10.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:16:06 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 30/51] drm/cirrus: Fully embrace devm_
Date: Thu, 27 Feb 2020 19:15:01 +0100
Message-Id: <20200227181522.2711142-31-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 m.felsch@pengutronix.de, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCB0aGUgZHJtX2RldmljZSBsaWZldGltZSBmdW4gY2xlYW5lZCB1cCB0aGVyZSdzIG5vdGhp
bmcgaW4gdGhlIHdheQphbnltb3JlIHRvIHVzZSBkZXZtXyBmb3IgZXZlcnl0aGluZyBodyByZWxl
YXRlZC4gRG8gaXQsIGFuZCBpbiB0aGUKcHJvY2VzcywgdGhyb3cgb3V0IHRoZSBlbnRpcmUgb25p
b24gdW53aW5kaW5nLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBpbnRlbC5jb20+CkNjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgpDYzogR2Vy
ZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPgpDYzogIk5vcmFsZiBUcsO4bm5lcyIgPG5vcmFsZkB0cm9ubmVzLm9y
Zz4KQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+CkNjOiBUaG9t
YXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IHZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJy
dXMuYyB8IDQ0ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDE0IGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1
cy5jCmluZGV4IDZhYzAyODY4MTBlYy4uMWI3OGEyZjg4ZjY5IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2ly
cnVzLmMKQEAgLTU1OCw3ICs1NTgsNyBAQCBzdGF0aWMgaW50IGNpcnJ1c19wY2lfcHJvYmUoc3Ry
dWN0IHBjaV9kZXYgKnBkZXYsCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCXJldCA9IHBj
aV9lbmFibGVfZGV2aWNlKHBkZXYpOworCXJldCA9IHBjaW1fZW5hYmxlX2RldmljZShwZGV2KTsK
IAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCkBAIC01NjksMzkgKzU2OSwzOCBAQCBzdGF0aWMg
aW50IGNpcnJ1c19wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsCiAJcmV0ID0gLUVOT01F
TTsKIAljaXJydXMgPSBremFsbG9jKHNpemVvZigqY2lycnVzKSwgR0ZQX0tFUk5FTCk7CiAJaWYg
KGNpcnJ1cyA9PSBOVUxMKQotCQlnb3RvIGVycl9wY2lfcmVsZWFzZTsKKwkJcmV0dXJuIHJldDsK
IAogCWRldiA9ICZjaXJydXMtPmRldjsKLQlyZXQgPSBkcm1fZGV2X2luaXQoZGV2LCAmY2lycnVz
X2RyaXZlciwgJnBkZXYtPmRldik7CisJcmV0ID0gZGV2bV9kcm1fZGV2X2luaXQoJnBkZXYtPmRl
diwgZGV2LCAmY2lycnVzX2RyaXZlcik7CiAJaWYgKHJldCkgewogCQlrZnJlZShjaXJydXMpOwot
CQlnb3RvIGVycl9wY2lfcmVsZWFzZTsKKwkJcmV0dXJuIHJldDsKIAl9CiAJZGV2LT5kZXZfcHJp
dmF0ZSA9IGNpcnJ1czsKIAlkcm1tX2FkZF9maW5hbF9rZnJlZShkZXYsIGNpcnJ1cyk7CiAKLQly
ZXQgPSAtRU5PTUVNOwotCWNpcnJ1cy0+dnJhbSA9IGlvcmVtYXAocGNpX3Jlc291cmNlX3N0YXJ0
KHBkZXYsIDApLAotCQkJICAgICAgIHBjaV9yZXNvdXJjZV9sZW4ocGRldiwgMCkpOworCWNpcnJ1
cy0+dnJhbSA9IGRldm1faW9yZW1hcCgmcGRldi0+ZGV2LCBwY2lfcmVzb3VyY2Vfc3RhcnQocGRl
diwgMCksCisJCQkJICAgIHBjaV9yZXNvdXJjZV9sZW4ocGRldiwgMCkpOwogCWlmIChjaXJydXMt
PnZyYW0gPT0gTlVMTCkKLQkJZ290byBlcnJfZGV2X3B1dDsKKwkJcmV0dXJuIC1FTk9NRU07CiAK
LQljaXJydXMtPm1taW8gPSBpb3JlbWFwKHBjaV9yZXNvdXJjZV9zdGFydChwZGV2LCAxKSwKLQkJ
CSAgICAgICBwY2lfcmVzb3VyY2VfbGVuKHBkZXYsIDEpKTsKKwljaXJydXMtPm1taW8gPSBkZXZt
X2lvcmVtYXAoJnBkZXYtPmRldiwgcGNpX3Jlc291cmNlX3N0YXJ0KHBkZXYsIDEpLAorCQkJCSAg
ICBwY2lfcmVzb3VyY2VfbGVuKHBkZXYsIDEpKTsKIAlpZiAoY2lycnVzLT5tbWlvID09IE5VTEwp
Ci0JCWdvdG8gZXJyX3VubWFwX3ZyYW07CisJCXJldHVybiAtRU5PTUVNOwogCiAJcmV0ID0gY2ly
cnVzX21vZGVfY29uZmlnX2luaXQoY2lycnVzKTsKIAlpZiAocmV0KQotCQlnb3RvIGVycl9jbGVh
bnVwOworCQlyZXR1cm4gcmV0OwogCiAJcmV0ID0gY2lycnVzX2Nvbm5faW5pdChjaXJydXMpOwog
CWlmIChyZXQgPCAwKQotCQlnb3RvIGVycl9jbGVhbnVwOworCQlyZXR1cm4gcmV0OwogCiAJcmV0
ID0gY2lycnVzX3BpcGVfaW5pdChjaXJydXMpOwogCWlmIChyZXQgPCAwKQotCQlnb3RvIGVycl9j
bGVhbnVwOworCQlyZXR1cm4gcmV0OwogCiAJZHJtX21vZGVfY29uZmlnX3Jlc2V0KGRldik7CiAK
QEAgLTYwOSwzMyArNjA4LDE4IEBAIHN0YXRpYyBpbnQgY2lycnVzX3BjaV9wcm9iZShzdHJ1Y3Qg
cGNpX2RldiAqcGRldiwKIAlwY2lfc2V0X2RydmRhdGEocGRldiwgZGV2KTsKIAlyZXQgPSBkcm1f
ZGV2X3JlZ2lzdGVyKGRldiwgMCk7CiAJaWYgKHJldCkKLQkJZ290byBlcnJfY2xlYW51cDsKKwkJ
cmV0dXJuIHJldDsKIAogCWRybV9mYmRldl9nZW5lcmljX3NldHVwKGRldiwgZGV2LT5tb2RlX2Nv
bmZpZy5wcmVmZXJyZWRfZGVwdGgpOwogCXJldHVybiAwOwotCi1lcnJfY2xlYW51cDoKLQlpb3Vu
bWFwKGNpcnJ1cy0+bW1pbyk7Ci1lcnJfdW5tYXBfdnJhbToKLQlpb3VubWFwKGNpcnJ1cy0+dnJh
bSk7Ci1lcnJfZGV2X3B1dDoKLQlkcm1fZGV2X3B1dChkZXYpOwotZXJyX3BjaV9yZWxlYXNlOgot
CXBjaV9yZWxlYXNlX3JlZ2lvbnMocGRldik7Ci0JcmV0dXJuIHJldDsKIH0KIAogc3RhdGljIHZv
aWQgY2lycnVzX3BjaV9yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCiB7CiAJc3RydWN0IGRy
bV9kZXZpY2UgKmRldiA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsKLQlzdHJ1Y3QgY2lycnVzX2Rl
dmljZSAqY2lycnVzID0gZGV2LT5kZXZfcHJpdmF0ZTsKIAogCWRybV9kZXZfdW5wbHVnKGRldik7
CiAJZHJtX2F0b21pY19oZWxwZXJfc2h1dGRvd24oZGV2KTsKLQlpb3VubWFwKGNpcnJ1cy0+bW1p
byk7Ci0JaW91bm1hcChjaXJydXMtPnZyYW0pOwotCWRybV9kZXZfcHV0KGRldik7Ci0JcGNpX3Jl
bGVhc2VfcmVnaW9ucyhwZGV2KTsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNl
X2lkIHBjaWlkbGlzdFtdID0gewotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
