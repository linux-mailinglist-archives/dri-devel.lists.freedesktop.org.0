Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EDECDA58
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 03:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA76F6E447;
	Mon,  7 Oct 2019 01:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69FD6E446;
 Mon,  7 Oct 2019 01:58:01 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id c3so4634132plo.2;
 Sun, 06 Oct 2019 18:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lgT1IgUjQX5cfBLV670oukvqtEvHWYTOdQATFG0u1fQ=;
 b=NjbAqG1soEKAlFp88Kk2l+mkVo1D55N5aT6ttlBhwY/Q6PtQoU8vyy1OXa67i1GsLB
 IGHO1Bu+G3CtKDQk6Zrkc0WpCDWjCtPPvGemU05JCTsdmQVatjAoN0tN2h0Z/3ZUjDjd
 eMhiIpDEQArzGWx9QyO1AkvK/Um6I3ln06DkrGK9rBQh7onYAy4ZuP67l7np05pfRku+
 L7eClnfF85/ovGQZnQv7EiOX1glAnkSODE/i+m/oQZioYqXpJV5Hnro/D0qvp6FYU2rP
 70zvpgspMpEeBEX7u0zRB+JDVnEspAeQwi8fq39Le3sQbf9LcfdQf9sIU38jSYt9MyJ8
 chHg==
X-Gm-Message-State: APjAAAUGNoElMLDcqNB40CCMLKKtVwxzuu+YUsWFGySH/Hq+3XeO+1kR
 WzV4LSDdH1Vd+gU0VFdExCiegOCFBQ3/0Q==
X-Google-Smtp-Source: APXvYqzh84RAVh1ayBx3K20Y5hpUK0QaeQP5rzPi4m1/lxAuCnvJCHjuc5cSPOjDmlPUsE2O1rQk3w==
X-Received: by 2002:a17:902:968d:: with SMTP id
 n13mr21403180plp.261.1570413481264; 
 Sun, 06 Oct 2019 18:58:01 -0700 (PDT)
Received: from yuq-Aspire-4738G.lan (ah.ptr230.ptrcloud.net. [153.122.161.8])
 by smtp.gmail.com with ESMTPSA id
 b123sm18328536pgc.72.2019.10.06.18.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2019 18:58:00 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/6] drm/lima: use drm_gem_(un)lock_reservations
Date: Mon,  7 Oct 2019 09:54:29 +0800
Message-Id: <20191007015430.20829-6-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007015430.20829-1-yuq825@gmail.com>
References: <20191007015430.20829-1-yuq825@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lgT1IgUjQX5cfBLV670oukvqtEvHWYTOdQATFG0u1fQ=;
 b=Oveq7lvbiIpvKgiSrv8RihAymHVXMG/hSNa2WV1EI5O8iw23qFwBeKX+IQIr4aWC53
 iRG6YUZ9zHP/7VxKZpqz8svqMq/bFh5GE2VCtSgVh2ps622+PggjzIp8oZSStHEpOlrx
 BO9pJNVc3xtjjfxriU4QMqpvLLcyEWCxgY5S7OBQfFgUBw7Zptyv2elPrUVdDvv4M0Db
 fExltFuKw/3B1zLY4UyonownnORJ5qZXzTXJz7gVPXAG3jRAzoa9UTmPi2xdcJ5Y0WBj
 6bZySN/9i16UAj8O9R1latV33Um9zo/ZaMLj9FtOJW8Bd8WujpREBt4g6z7pP7MVcIfl
 1BJg==
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>, Qiang Yu <yuq825@gmail.com>,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2ltcGxpZnkgdGhlIGRyaXZlciBjb2RlIHdpdGggRFJNIEdFTSBoZWxwZXIgZnVuY3Rpb24uCgp2
MjoKaW1wcm92ZSBjb21taXQgY29tbWVudC4KClNpZ25lZC1vZmYtYnk6IFFpYW5nIFl1IDx5dXE4
MjVAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZ2VtLmMgfCA2NCAr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDU4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9s
aW1hL2xpbWFfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2dlbS5jCmluZGV4IGVi
NzBlNDQyOTU4OC4uM2NjMTg3MDg2MmMzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbGlt
YS9saW1hX2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZ2VtLmMKQEAgLTE2
Niw2MSArMTY2LDYgQEAgc3RhdGljIGludCBsaW1hX2dlbV9zeW5jX2JvKHN0cnVjdCBsaW1hX3Nj
aGVkX3Rhc2sgKnRhc2ssIHN0cnVjdCBsaW1hX2JvICpibywKIAlyZXR1cm4gZHJtX2dlbV9mZW5j
ZV9hcnJheV9hZGRfaW1wbGljaXQoJnRhc2stPmRlcHMsICZiby0+YmFzZS5iYXNlLCB3cml0ZSk7
CiB9CiAKLXN0YXRpYyBpbnQgbGltYV9nZW1fbG9ja19ib3Moc3RydWN0IGxpbWFfYm8gKipib3Ms
IHUzMiBucl9ib3MsCi0JCQkgICAgIHN0cnVjdCB3d19hY3F1aXJlX2N0eCAqY3R4KQotewotCWlu
dCBpLCByZXQgPSAwLCBjb250ZW5kZWQsIHNsb3dfbG9ja2VkID0gLTE7Ci0KLQl3d19hY3F1aXJl
X2luaXQoY3R4LCAmcmVzZXJ2YXRpb25fd3dfY2xhc3MpOwotCi1yZXRyeToKLQlmb3IgKGkgPSAw
OyBpIDwgbnJfYm9zOyBpKyspIHsKLQkJaWYgKGkgPT0gc2xvd19sb2NrZWQpIHsKLQkJCXNsb3df
bG9ja2VkID0gLTE7Ci0JCQljb250aW51ZTsKLQkJfQotCi0JCXJldCA9IHd3X211dGV4X2xvY2tf
aW50ZXJydXB0aWJsZSgmbGltYV9ib19yZXN2KGJvc1tpXSktPmxvY2ssIGN0eCk7Ci0JCWlmIChy
ZXQgPCAwKSB7Ci0JCQljb250ZW5kZWQgPSBpOwotCQkJZ290byBlcnI7Ci0JCX0KLQl9Ci0KLQl3
d19hY3F1aXJlX2RvbmUoY3R4KTsKLQlyZXR1cm4gMDsKLQotZXJyOgotCWZvciAoaS0tOyBpID49
IDA7IGktLSkKLQkJd3dfbXV0ZXhfdW5sb2NrKCZsaW1hX2JvX3Jlc3YoYm9zW2ldKS0+bG9jayk7
Ci0KLQlpZiAoc2xvd19sb2NrZWQgPj0gMCkKLQkJd3dfbXV0ZXhfdW5sb2NrKCZsaW1hX2JvX3Jl
c3YoYm9zW3Nsb3dfbG9ja2VkXSktPmxvY2spOwotCi0JaWYgKHJldCA9PSAtRURFQURMSykgewot
CQkvKiB3ZSBsb3N0IG91dCBpbiBhIHNlcW5vIHJhY2UsIGxvY2sgYW5kIHJldHJ5Li4gKi8KLQkJ
cmV0ID0gd3dfbXV0ZXhfbG9ja19zbG93X2ludGVycnVwdGlibGUoCi0JCQkmbGltYV9ib19yZXN2
KGJvc1tjb250ZW5kZWRdKS0+bG9jaywgY3R4KTsKLQkJaWYgKCFyZXQpIHsKLQkJCXNsb3dfbG9j
a2VkID0gY29udGVuZGVkOwotCQkJZ290byByZXRyeTsKLQkJfQotCX0KLQl3d19hY3F1aXJlX2Zp
bmkoY3R4KTsKLQotCXJldHVybiByZXQ7Ci19Ci0KLXN0YXRpYyB2b2lkIGxpbWFfZ2VtX3VubG9j
a19ib3Moc3RydWN0IGxpbWFfYm8gKipib3MsIHUzMiBucl9ib3MsCi0JCQkJc3RydWN0IHd3X2Fj
cXVpcmVfY3R4ICpjdHgpCi17Ci0JaW50IGk7Ci0KLQlmb3IgKGkgPSAwOyBpIDwgbnJfYm9zOyBp
KyspCi0JCXd3X211dGV4X3VubG9jaygmbGltYV9ib19yZXN2KGJvc1tpXSktPmxvY2spOwotCXd3
X2FjcXVpcmVfZmluaShjdHgpOwotfQotCiBzdGF0aWMgaW50IGxpbWFfZ2VtX2FkZF9kZXBzKHN0
cnVjdCBkcm1fZmlsZSAqZmlsZSwgc3RydWN0IGxpbWFfc3VibWl0ICpzdWJtaXQpCiB7CiAJaW50
IGksIGVycjsKQEAgLTI4MCw3ICsyMjUsOCBAQCBpbnQgbGltYV9nZW1fc3VibWl0KHN0cnVjdCBk
cm1fZmlsZSAqZmlsZSwgc3RydWN0IGxpbWFfc3VibWl0ICpzdWJtaXQpCiAJCX0KIAl9CiAKLQll
cnIgPSBsaW1hX2dlbV9sb2NrX2Jvcyhib3MsIHN1Ym1pdC0+bnJfYm9zLCAmY3R4KTsKKwllcnIg
PSBkcm1fZ2VtX2xvY2tfcmVzZXJ2YXRpb25zKChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKiopYm9z
LAorCQkJCQlzdWJtaXQtPm5yX2JvcywgJmN0eCk7CiAJaWYgKGVycikKIAkJZ290byBlcnJfb3V0
MjsKIApAQCAtMzEzLDcgKzI1OSw4IEBAIGludCBsaW1hX2dlbV9zdWJtaXQoc3RydWN0IGRybV9m
aWxlICpmaWxlLCBzdHJ1Y3QgbGltYV9zdWJtaXQgKnN1Ym1pdCkKIAkJCWRtYV9yZXN2X2FkZF9z
aGFyZWRfZmVuY2UobGltYV9ib19yZXN2KGJvc1tpXSksIGZlbmNlKTsKIAl9CiAKLQlsaW1hX2dl
bV91bmxvY2tfYm9zKGJvcywgc3VibWl0LT5ucl9ib3MsICZjdHgpOworCWRybV9nZW1fdW5sb2Nr
X3Jlc2VydmF0aW9ucygoc3RydWN0IGRybV9nZW1fb2JqZWN0ICoqKWJvcywKKwkJCQkgICAgc3Vi
bWl0LT5ucl9ib3MsICZjdHgpOwogCiAJZm9yIChpID0gMDsgaSA8IHN1Ym1pdC0+bnJfYm9zOyBp
KyspCiAJCWRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZCgmYm9zW2ldLT5iYXNlLmJhc2UpOwpA
QCAtMzMwLDcgKzI3Nyw4IEBAIGludCBsaW1hX2dlbV9zdWJtaXQoc3RydWN0IGRybV9maWxlICpm
aWxlLCBzdHJ1Y3QgbGltYV9zdWJtaXQgKnN1Ym1pdCkKIGVycl9vdXQ0OgogCWxpbWFfc2NoZWRf
dGFza19maW5pKHN1Ym1pdC0+dGFzayk7CiBlcnJfb3V0MzoKLQlsaW1hX2dlbV91bmxvY2tfYm9z
KGJvcywgc3VibWl0LT5ucl9ib3MsICZjdHgpOworCWRybV9nZW1fdW5sb2NrX3Jlc2VydmF0aW9u
cygoc3RydWN0IGRybV9nZW1fb2JqZWN0ICoqKWJvcywKKwkJCQkgICAgc3VibWl0LT5ucl9ib3Ms
ICZjdHgpOwogZXJyX291dDI6CiAJZm9yIChpID0gMDsgaSA8IHN1Ym1pdC0+bnJfYm9zOyBpKysp
CiAJCWxpbWFfdm1fYm9fZGVsKHZtLCBib3NbaV0pOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
