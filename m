Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 864C34910E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 22:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E7B6E095;
	Mon, 17 Jun 2019 20:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0246E094
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 20:13:31 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d17so7445861qtj.8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 13:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uNOx45kFSG/Yc9D3NQVx4HiI/G/jW8KW7kdSijKdY50=;
 b=XHlIdOLYIJx0rKYHs/h25lvwW2ePmlOuoW8CEJlHPLhu/NBYsIzBbzErl4ifr3hr5j
 lWF/ct8aScCY3dzx+NMt0K/z5JAr0Fwirw+68rfUhg1q1uy9RlU/c89xRbSjyTF3aR/k
 JLl3mDEWWo1cxe7LwvV601nqngquLpqW2+AA0Lk9j0QjYZotW18QSA/GqmZIH5ucrDMq
 3YqSFPtPloNbdLyYk/2VHgu4E4aHQRvMlyqsylREovHDcqyEKiXkh2JXfIVF8MHTL8ZW
 dZO0ltgjRsmZ3C9CeQxd9LLfqGYvm9k9gNUbHxrZO7skY8o536fU7tej9UFMk7jVALFw
 99Gw==
X-Gm-Message-State: APjAAAUkjXdfQlKO0a5Xv3Vyz1ULJIeT8JQYbqYLmGd9I2q5XiGAbW6j
 a9T5Ypq61AWK/x91GRh40JVLauhEzzg=
X-Google-Smtp-Source: APXvYqwEpErj+2U/OoJfqGOB2tT/tidvt52SvFAphs/SqZTqCnQIzDPyLz6+/84OKTLRvERkXF3Agw==
X-Received: by 2002:aed:3e3d:: with SMTP id l58mr46894640qtf.382.1560802410359; 
 Mon, 17 Jun 2019 13:13:30 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
 by smtp.gmail.com with ESMTPSA id r36sm7071563qte.71.2019.06.17.13.13.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 13:13:29 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 07/13] drm/msm/dsi: Split mode_flags out of
 msm_dsi_host_get_panel()
Date: Mon, 17 Jun 2019 16:12:52 -0400
Message-Id: <20190617201301.133275-4-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190617201301.133275-1-sean@poorly.run>
References: <20190617200405.131843-1-sean@poorly.run>
 <20190617201301.133275-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uNOx45kFSG/Yc9D3NQVx4HiI/G/jW8KW7kdSijKdY50=;
 b=Zqvo1ZzApoS+VMx0AyAw9fTnBJqSz0oHFbN/BkF1zoCdv1DXE6wUEOwlxf3v8nDcbb
 M8S7690MJAMScFNAmmhHtmbNb46FoAjzXcEbS6mWHkDn+r6J823VwBtlx4wlIJ/QJ4fU
 lOmXK/9A+Q/p6oTWB9amjHhoRgrqHJJxEgOlRqdODAvJhKU5VrhChs49kNq+ifY7uI68
 5fEyhER4UbzlsEXgilPeSpHRA/RiDV3d9DcA6vwy/y2M0tOyRPXHoeReQZhvdNui+MW3
 6OcP8a3livBABvBqN/dfMX7cNGJ7QBcMoy3nImcc4F96nkYE1+3J+1rkIGHhvNvb1QV0
 20+Q==
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpXZSB1c2UgdGhlIGZsYWdz
IGluIG1vcmUgcGxhY2VzIHRoYW4ganVzdCBnZXRfcGFuZWwsIHNvIHNwbGl0IHRoZW0gb3V0Cmlu
dG8gYSBzZXBhcmF0ZSBmdW5jdGlvbi4KClNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBh
dWxAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaS5oICAgICAg
ICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfaG9zdC5jICAgIHwgMTUg
KysrKysrLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfbWFuYWdlci5jIHwg
IDcgKysrKy0tLQogMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2kuaCBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vZHNpL2RzaS5oCmluZGV4IDljNmIzMWMyZDc5Zi4uOGJkYzQ4Y2EwYjY3
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2kuaAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vbXNtL2RzaS9kc2kuaApAQCAtMTY5LDggKzE2OSw4IEBAIGludCBtc21fZHNpX2hv
c3RfcG93ZXJfb24oc3RydWN0IG1pcGlfZHNpX2hvc3QgKmhvc3QsCiBpbnQgbXNtX2RzaV9ob3N0
X3Bvd2VyX29mZihzdHJ1Y3QgbWlwaV9kc2lfaG9zdCAqaG9zdCk7CiBpbnQgbXNtX2RzaV9ob3N0
X3NldF9kaXNwbGF5X21vZGUoc3RydWN0IG1pcGlfZHNpX2hvc3QgKmhvc3QsCiAJCQkJICBjb25z
dCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSk7Ci1zdHJ1Y3QgZHJtX3BhbmVsICptc21f
ZHNpX2hvc3RfZ2V0X3BhbmVsKHN0cnVjdCBtaXBpX2RzaV9ob3N0ICpob3N0LAotCQkJCQl1bnNp
Z25lZCBsb25nICpwYW5lbF9mbGFncyk7CitzdHJ1Y3QgZHJtX3BhbmVsICptc21fZHNpX2hvc3Rf
Z2V0X3BhbmVsKHN0cnVjdCBtaXBpX2RzaV9ob3N0ICpob3N0KTsKK3Vuc2lnbmVkIGxvbmcgbXNt
X2RzaV9ob3N0X2dldF9tb2RlX2ZsYWdzKHN0cnVjdCBtaXBpX2RzaV9ob3N0ICpob3N0KTsKIHN0
cnVjdCBkcm1fYnJpZGdlICptc21fZHNpX2hvc3RfZ2V0X2JyaWRnZShzdHJ1Y3QgbWlwaV9kc2lf
aG9zdCAqaG9zdCk7CiBpbnQgbXNtX2RzaV9ob3N0X3JlZ2lzdGVyKHN0cnVjdCBtaXBpX2RzaV9o
b3N0ICpob3N0LCBib29sIGNoZWNrX2RlZmVyKTsKIHZvaWQgbXNtX2RzaV9ob3N0X3VucmVnaXN0
ZXIoc3RydWN0IG1pcGlfZHNpX2hvc3QgKmhvc3QpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21zbS9kc2kvZHNpX2hvc3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9ob3N0
LmMKaW5kZXggNjEwMTgzZGIxZGFmLi5kYWEwOGEwMzNiNTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tc20vZHNpL2RzaV9ob3N0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kv
ZHNpX2hvc3QuYwpAQCAtMjQ0MiwxNyArMjQ0MiwxNCBAQCBpbnQgbXNtX2RzaV9ob3N0X3NldF9k
aXNwbGF5X21vZGUoc3RydWN0IG1pcGlfZHNpX2hvc3QgKmhvc3QsCiAJcmV0dXJuIDA7CiB9CiAK
LXN0cnVjdCBkcm1fcGFuZWwgKm1zbV9kc2lfaG9zdF9nZXRfcGFuZWwoc3RydWN0IG1pcGlfZHNp
X2hvc3QgKmhvc3QsCi0JCQkJdW5zaWduZWQgbG9uZyAqcGFuZWxfZmxhZ3MpCitzdHJ1Y3QgZHJt
X3BhbmVsICptc21fZHNpX2hvc3RfZ2V0X3BhbmVsKHN0cnVjdCBtaXBpX2RzaV9ob3N0ICpob3N0
KQogewotCXN0cnVjdCBtc21fZHNpX2hvc3QgKm1zbV9ob3N0ID0gdG9fbXNtX2RzaV9ob3N0KGhv
c3QpOwotCXN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsOwotCi0JcGFuZWwgPSBvZl9kcm1fZmluZF9w
YW5lbChtc21faG9zdC0+ZGV2aWNlX25vZGUpOwotCWlmIChwYW5lbF9mbGFncykKLQkJCSpwYW5l
bF9mbGFncyA9IG1zbV9ob3N0LT5tb2RlX2ZsYWdzOworCXJldHVybiBvZl9kcm1fZmluZF9wYW5l
bCh0b19tc21fZHNpX2hvc3QoaG9zdCktPmRldmljZV9ub2RlKTsKK30KIAotCXJldHVybiBwYW5l
bDsKK3Vuc2lnbmVkIGxvbmcgbXNtX2RzaV9ob3N0X2dldF9tb2RlX2ZsYWdzKHN0cnVjdCBtaXBp
X2RzaV9ob3N0ICpob3N0KQoreworCXJldHVybiB0b19tc21fZHNpX2hvc3QoaG9zdCktPm1vZGVf
ZmxhZ3M7CiB9CiAKIHN0cnVjdCBkcm1fYnJpZGdlICptc21fZHNpX2hvc3RfZ2V0X2JyaWRnZShz
dHJ1Y3QgbWlwaV9kc2lfaG9zdCAqaG9zdCkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vZHNpL2RzaV9tYW5hZ2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfbWFuYWdl
ci5jCmluZGV4IDk3OWE4ZTkyOTM0MS4uNTZiODA5MWI3NWU3IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbXNtL2RzaS9kc2lfbWFuYWdlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZHNpL2RzaV9tYW5hZ2VyLmMKQEAgLTI0NCw4ICsyNDQsOSBAQCBzdGF0aWMgZW51bSBkcm1fY29u
bmVjdG9yX3N0YXR1cyBkc2lfbWdyX2Nvbm5lY3Rvcl9kZXRlY3QoCiAKIAlEQkcoImlkPSVkIiwg
aWQpOwogCWlmICghbXNtX2RzaS0+cGFuZWwpIHsKLQkJbXNtX2RzaS0+cGFuZWwgPSBtc21fZHNp
X2hvc3RfZ2V0X3BhbmVsKG1zbV9kc2ktPmhvc3QsCi0JCQkJCQkmbXNtX2RzaS0+ZGV2aWNlX2Zs
YWdzKTsKKwkJbXNtX2RzaS0+cGFuZWwgPSBtc21fZHNpX2hvc3RfZ2V0X3BhbmVsKG1zbV9kc2kt
Pmhvc3QpOworCQltc21fZHNpLT5kZXZpY2VfZmxhZ3MgPSBtc21fZHNpX2hvc3RfZ2V0X21vZGVf
ZmxhZ3MoCisJCQkJCQltc21fZHNpLT5ob3N0KTsKIAogCQkvKiBUaGVyZSBpcyBvbmx5IDEgcGFu
ZWwgaW4gdGhlIGdsb2JhbCBwYW5lbCBsaXN0CiAJCSAqIGZvciBkdWFsIERTSSBtb2RlLiBUaGVy
ZWZvcmUgc2xhdmUgZHNpIHNob3VsZCBnZXQKQEAgLTI1NSw3ICsyNTYsNyBAQCBzdGF0aWMgZW51
bSBkcm1fY29ubmVjdG9yX3N0YXR1cyBkc2lfbWdyX2Nvbm5lY3Rvcl9kZXRlY3QoCiAJCWlmICgh
bXNtX2RzaS0+cGFuZWwgJiYgSVNfRFVBTF9EU0koKSAmJgogCQkJIUlTX01BU1RFUl9EU0lfTElO
SyhpZCkgJiYgb3RoZXJfZHNpKQogCQkJbXNtX2RzaS0+cGFuZWwgPSBtc21fZHNpX2hvc3RfZ2V0
X3BhbmVsKAotCQkJCQlvdGhlcl9kc2ktPmhvc3QsIE5VTEwpOworCQkJCQkJb3RoZXJfZHNpLT5o
b3N0KTsKIAogCiAJCWlmIChtc21fZHNpLT5wYW5lbCAmJiBrbXMtPmZ1bmNzLT5zZXRfZW5jb2Rl
cl9tb2RlKSB7Ci0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJv
bWl1bSBPUwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
