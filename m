Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF4D8E6CE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85CA6E90D;
	Thu, 15 Aug 2019 08:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BDA6E0EF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 11:04:03 +0000 (UTC)
Received: by mail-qt1-x849.google.com with SMTP id j10so17266164qtl.23
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 04:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ip9lF/U/ATkDBCN52xa8MDYElKkFg+n6UubAPvcwdoQ=;
 b=PoJI795HY0e7Y/7ZcND+gayOjzC9ZZ0UJ/ScILWe5RAQOLyiDNtITRjXcn+ROk2yJ2
 mmh/WmV6CxrVSgmiruRkVt01nfyEhUgQ1uMnFhkgMAZ94actj9QiEPCa64XGHX72rmbs
 FOSA12C6IS4jOe5XW6FgiDYxyiRBbkT5JN0tTen58+fDfwrJyu9ISl78QbEAQGOxmH7T
 G28wy1PsdPwhiNXezlG7+ER+q6vCS7k0D6vYwH8NOqpH0YuzIfU/4JKpTkrhFGLmYoMi
 aRaGvG8ElInSfsErZVKLuBU0sjO8kegCfXsXyRtL4OhkFmYCvCL/hoXwBIq51wniFTSW
 XvMA==
X-Gm-Message-State: APjAAAU880diCghohhqfzhymm/jHADiLoUalZ/oiAYFFT9hlrM9SIB1D
 nKlcyjpzL6VXCBrCgPmFBv6Ubm8+kNPcbl3eBwZgi5BDdl/JfITDbrVXb9MyC52cOAiPV1TJWuk
 NzLziI0txh8DQKHudvT0UPhijtF3grb0m4wJlXqqRGMP1+K+oWRavzv8jfdNU2wP5eitNeTG5CQ
 ==
X-Google-Smtp-Source: APXvYqysSUrmxH++r5MmUXV4gWwiLxUMWPgS8nugFZzvIugrQ9MfQDgywxdIlcVe+Xz2GFVznywfU+Ysfvs=
X-Received: by 2002:ac8:6105:: with SMTP id a5mr15179523qtm.285.1565694242255; 
 Tue, 13 Aug 2019 04:04:02 -0700 (PDT)
Date: Tue, 13 Aug 2019 13:02:37 +0200
In-Reply-To: <20190813110300.83025-1-darekm@google.com>
Message-Id: <20190813110300.83025-6-darekm@google.com>
Mime-Version: 1.0
References: <20190813110300.83025-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v6 5/8] drm: sti: use cec_notifier_conn_(un)register
From: Dariusz Marcinkiewicz <darekm@google.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 hverkuil-cisco@xs4all.nl
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=ip9lF/U/ATkDBCN52xa8MDYElKkFg+n6UubAPvcwdoQ=;
 b=L8MnBJ66KutyhXM1pVJve1tTkI9eCP1J5jPB3Zz1KokSDUH6mh59HIERL2XGmcVUPr
 3WrIC6I9g5N127W9P+9Rp5VuHoeaKnvsC+8o341cSsS2xtEvgkrarWZA8QbeVAOjMGe1
 liVA/FbdyxZivqYi7Yr+irg6HA4OxJeMf/IF0alLg66zc6sUjvufCQCkDO3FCvv2e4Zv
 3SHnX+IE4HMfr4asT3FCECTYCwZKb0b2SKzJ3if+MCbZXG6GvmwgU3l8ogIEl6tkipYu
 e7wOP85XCH2b5SpFdqb7dERv+2Zz6z1h5BRtL99ey4tkpST978h96jVyK5Chw7JsPAFd
 Yfpw==
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Dariusz Marcinkiewicz <darekm@google.com>,
 Vincent Abriou <vincent.abriou@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSBuZXcgY2VjX25vdGlmaWVyX2Nvbm5fKHVuKXJlZ2lzdGVyKCkgZnVuY3Rpb25zIHRv
Cih1bilyZWdpc3RlciB0aGUgbm90aWZpZXIgZm9yIHRoZSBIRE1JIGNvbm5lY3RvciwgYW5kIGZp
bGwKaW4gdGhlIGNlY19jb25uZWN0b3JfaW5mby4KCkNoYW5nZXMgc2luY2UgdjI6CglEb24ndCBp
bnZhbGlkYXRlIHBoeXNpY2FsIGFkZHJlc3MgYmVmb3JlIHVucmVnaXN0ZXJpbmcgdGhlCglub3Rp
Zmllci4KClNpZ25lZC1vZmYtYnk6IERhcml1c3ogTWFyY2lua2lld2ljeiA8ZGFyZWttQGdvb2ds
ZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfaGRtaS5jIHwgMTkgKysrKysrKysr
KysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfaGRtaS5jIGIvZHJpdmVy
cy9ncHUvZHJtL3N0aS9zdGlfaGRtaS5jCmluZGV4IDk4NjJjMzIyZjBjNGEuLmJkMTU5MDJiODI1
YWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWkuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmMKQEAgLTEyNTYsNiArMTI1Niw3IEBAIHN0YXRpYyBp
bnQgc3RpX2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rl
ciwgdm9pZCAqZGF0YSkKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IGRhdGE7CiAJc3Ry
dWN0IGRybV9lbmNvZGVyICplbmNvZGVyOwogCXN0cnVjdCBzdGlfaGRtaV9jb25uZWN0b3IgKmNv
bm5lY3RvcjsKKwlzdHJ1Y3QgY2VjX2Nvbm5lY3Rvcl9pbmZvIGNvbm5faW5mbzsKIAlzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqZHJtX2Nvbm5lY3RvcjsKIAlzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdl
OwogCWludCBlcnI7CkBAIC0xMzE4LDYgKzEzMTksMTQgQEAgc3RhdGljIGludCBzdGlfaGRtaV9i
aW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRh
KQogCQlnb3RvIGVycl9zeXNmczsKIAl9CiAKKwljZWNfZmlsbF9jb25uX2luZm9fZnJvbV9kcm0o
JmNvbm5faW5mbywgZHJtX2Nvbm5lY3Rvcik7CisJaGRtaS0+bm90aWZpZXIgPSBjZWNfbm90aWZp
ZXJfY29ubl9yZWdpc3RlcigmaGRtaS0+ZGV2LCBOVUxMLAorCQkJCQkJICAgICZjb25uX2luZm8p
OworCWlmICghaGRtaS0+bm90aWZpZXIpIHsKKwkJaGRtaS0+ZHJtX2Nvbm5lY3RvciA9IE5VTEw7
CisJCXJldHVybiAtRU5PTUVNOworCX0KKwogCS8qIEVuYWJsZSBkZWZhdWx0IGludGVycnVwdHMg
Ki8KIAloZG1pX3dyaXRlKGhkbWksIEhETUlfREVGQVVMVF9JTlQsIEhETUlfSU5UX0VOKTsKIApA
QCAtMTMzMSw2ICsxMzQwLDkgQEAgc3RhdGljIGludCBzdGlfaGRtaV9iaW5kKHN0cnVjdCBkZXZp
Y2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQogc3RhdGljIHZvaWQg
c3RpX2hkbWlfdW5iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJc3RydWN0IGRldmljZSAqbWFz
dGVyLCB2b2lkICpkYXRhKQogeworCXN0cnVjdCBzdGlfaGRtaSAqaGRtaSA9IGRldl9nZXRfZHJ2
ZGF0YShkZXYpOworCisJY2VjX25vdGlmaWVyX2Nvbm5fdW5yZWdpc3RlcihoZG1pLT5ub3RpZmll
cik7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY29tcG9uZW50X29wcyBzdGlfaGRtaV9vcHMg
PSB7CkBAIC0xNDM2LDEwICsxNDQ4LDYgQEAgc3RhdGljIGludCBzdGlfaGRtaV9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlnb3RvIHJlbGVhc2VfYWRhcHRlcjsKIAl9CiAK
LQloZG1pLT5ub3RpZmllciA9IGNlY19ub3RpZmllcl9nZXQoJnBkZXYtPmRldik7Ci0JaWYgKCFo
ZG1pLT5ub3RpZmllcikKLQkJZ290byByZWxlYXNlX2FkYXB0ZXI7Ci0KIAloZG1pLT5yZXNldCA9
IGRldm1fcmVzZXRfY29udHJvbF9nZXQoZGV2LCAiaGRtaSIpOwogCS8qIFRha2UgaGRtaSBvdXQg
b2YgcmVzZXQgKi8KIAlpZiAoIUlTX0VSUihoZG1pLT5yZXNldCkpCkBAIC0xNDU5LDE0ICsxNDY3
LDExIEBAIHN0YXRpYyBpbnQgc3RpX2hkbWlfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCiB7CiAJc3RydWN0IHN0aV9oZG1pICpoZG1pID0gZGV2X2dldF9kcnZkYXRhKCZwZGV2
LT5kZXYpOwogCi0JY2VjX25vdGlmaWVyX3NldF9waHlzX2FkZHIoaGRtaS0+bm90aWZpZXIsIENF
Q19QSFlTX0FERFJfSU5WQUxJRCk7Ci0KIAlpMmNfcHV0X2FkYXB0ZXIoaGRtaS0+ZGRjX2FkYXB0
KTsKIAlpZiAoaGRtaS0+YXVkaW9fcGRldikKIAkJcGxhdGZvcm1fZGV2aWNlX3VucmVnaXN0ZXIo
aGRtaS0+YXVkaW9fcGRldik7CiAJY29tcG9uZW50X2RlbCgmcGRldi0+ZGV2LCAmc3RpX2hkbWlf
b3BzKTsKIAotCWNlY19ub3RpZmllcl9wdXQoaGRtaS0+bm90aWZpZXIpOwogCXJldHVybiAwOwog
fQogCi0tIAoyLjIzLjAucmMxLjE1My5nZGVlZDgwMzMwZi1nb29nCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
