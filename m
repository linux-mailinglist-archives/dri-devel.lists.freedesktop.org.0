Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E25848E6B4
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5EB6E8F2;
	Thu, 15 Aug 2019 08:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa49.google.com (mail-vk1-xa49.google.com
 [IPv6:2607:f8b0:4864:20::a49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5466E586
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:46:07 +0000 (UTC)
Received: by mail-vk1-xa49.google.com with SMTP id a189so218769vkc.20
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 03:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ip9lF/U/ATkDBCN52xa8MDYElKkFg+n6UubAPvcwdoQ=;
 b=DMK261pt/2v6KZ8BSYlQ8LmNRvbZmR8gF4xdhP1eLNyowqxkNsvnbeoNoseKItZZtM
 h4yzNCBr7Z/GD5AQHIh/3eTJpY7GG9vaHWoJTfWz+ZUDkFTsq7HxOqcSvSW2aYZh1W5l
 hxKrXaGA5FdssmAXSncksa+2Em69XnMUITyw20p3OPjAER4Qo2PGHyma9gViEDFijAHd
 SWmahRLVa+iFZ2MTLQ1OW+s7Xbazx+zF/eQ8p+m6R5svTvejwHmhcVygxFaZznGzCIrv
 JBtTzQHyh/iwmIGvRQzfFyfbKKizl4ZyQtC0thNwUTGpF57lLzjcQcqZ5IoRFJnSgIiX
 T5Fw==
X-Gm-Message-State: APjAAAUOgBxsSmII9bTIkKI6BUdZQn8jZ50kRCGxEzCj2h2jJq2Ysb8v
 pNL3uChInnQLlqPQ0TASBEOXtHzgqbxYhJ780WnWcNl2l4c9chCaz6Lj4RSoR9jzPsWduwOt25i
 pXwEfiW6aUNKUC3tX3fxGnEotIw7S0yAbuTLwBB0a9V3XDSfCRLqU1qN8XKK4BjRc3YwnPfQGkw
 ==
X-Google-Smtp-Source: APXvYqwGg7hw59XwQ3AoqIYTskYl0MYRgXJ3/2BQi9vOdN3sJqPR7IXY8Z+n4jhAc2KsrudW5ux/QIYpifE=
X-Received: by 2002:a9f:31cb:: with SMTP id w11mr1312328uad.40.1565779566021; 
 Wed, 14 Aug 2019 03:46:06 -0700 (PDT)
Date: Wed, 14 Aug 2019 12:45:04 +0200
In-Reply-To: <20190814104520.6001-1-darekm@google.com>
Message-Id: <20190814104520.6001-7-darekm@google.com>
Mime-Version: 1.0
References: <20190814104520.6001-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v7 6/9] drm: sti: use cec_notifier_conn_(un)register
From: Dariusz Marcinkiewicz <darekm@google.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 hverkuil-cisco@xs4all.nl
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=ip9lF/U/ATkDBCN52xa8MDYElKkFg+n6UubAPvcwdoQ=;
 b=F2Wq7/qUI6063Ggfg3uy2V3WIYVkgW+HoapIrUNMvS/Au5Ol/B3SFcoj9sFM+0KgCc
 gQE4un4mzyXTwEQwzAcnUBqN9C+SR18fqVsQngsR7F4KNXrZvBjhZTdhpkxLn/izafXm
 BhC5HxllnxCQutzM3IO0JMWrPSAIlFmQslLTovcX2NXXe1wqmkL6r6wdgsBlpQILWXHo
 2ViQHXy2254GlWPNkq8h0euVbw3X1Y1tQ8euOn7iCvdz76QpJ24vR+Z94ANGtN9E/uwi
 W3fA0elafMMJGCcfZANHXF+xR8IoeRlkM0tMATTs0LOmj482BenDoUea4hWpgQ9uM/GA
 iH4w==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
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
