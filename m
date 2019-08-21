Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B104597970
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 14:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE88B6E31C;
	Wed, 21 Aug 2019 12:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECFD26E312
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 12:31:54 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id m125so1956871wmm.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 05:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aBOdo7ngpKvLwB2R8F0YqDeLvUKQK/TUC/pYnwwKah8=;
 b=iyv9CM3CT11gDy4Ze18IIfYNCI9hFjOtC+8Nkzk03UsCZ5pjyH/Vk9szhfstEcKe9D
 dkn0rxz7F9TmVFS3nE1J0p39uHXrBQ8ez61j7kSJOCbdJlTFfaFOnnQZyF9N7BLCsHOH
 D7uXm19s9vROIVHsvIPuN0/obUpwFNnhZl9vQ5mHiLtNjxawRKoqO5fmRuLkYBYv9/P/
 vDkjpR7KsukqJXJtG7Yn1trB5zEmTI+7Yky0f5rjATYE376Y4+3ZU4sbrfy+AN1uNYFP
 9j9PRBo56rt+stgrG7nT5G+sEPu8Q0Sjlg6Sf+hcQnD11szTIm0pgTtsceHxoPPTkYNi
 wgqA==
X-Gm-Message-State: APjAAAUuvp+M0dxpnh+OZNCee0Sanr/lqaCOSJLlupPkFaENQGEdMaT1
 alEjnla0QQbpm1zpXKqYxHk4tbCy
X-Google-Smtp-Source: APXvYqwEuIEXphvxpxYjDhq20FOa/v6eaOdT1hVDgfkrSbpNzJBD+iwrLeB+e+ZWQMlBkQWb+tOyIA==
X-Received: by 2002:a1c:f106:: with SMTP id p6mr5432870wmh.148.1566390712855; 
 Wed, 21 Aug 2019 05:31:52 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8189:dd33:a934:c4fa])
 by smtp.gmail.com with ESMTPSA id v3sm23084571wrq.34.2019.08.21.05.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 05:31:52 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 04/10] dma-buf: add dma_fence_array_for_each
Date: Wed, 21 Aug 2019 14:31:41 +0200
Message-Id: <20190821123147.110736-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821123147.110736-1-christian.koenig@amd.com>
References: <20190821123147.110736-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aBOdo7ngpKvLwB2R8F0YqDeLvUKQK/TUC/pYnwwKah8=;
 b=AT2N1Av231M7+QMYsNQRMtThUPT37JcPbuDiN+n/sf4fodmTNsAnQtRnffYDXw4r+E
 yQcR+oJ4JsOuUxnpTBES197pmFrFncSMBPm0t5qBayyPUaN+NbySpIMmEfcEBykfvt0p
 7Q10n4R//r4hoytphNEjuIW+5IUMQz28kGHx7sLy5MM/A4sDQ23C0r7Hzpz2gsO/h/EN
 lHR+MrsHM6Gwy4pSjXIsK7w0H+TdjjvrNoMZKnEzLwUB0h+sRZy2Mufo9F+l4tyRpIbP
 sI9ZoQELUh8IkUedSed+3/3D/Tklx4KX9IJVn2SaytD3pjm+9ZT4TQZ/vUhdcNH7Lm0T
 b91Q==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWFrZXMgaXQgZWFzaWVyIHRvIGV4dHJhY3QgdGhlIGZlbmNlcyBpbiBhIGRtYV9mZW5jZV9hcnJh
eS4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWFycmF5LmMgfCA0MiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS1hcnJheS5o
ICAgfCAyNCArKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNjYgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtYXJyYXkuYyBiL2Ry
aXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtYXJyYXkuYwppbmRleCAzMTRjZjBlODgxZDkuLjg4N2Uz
MmU4OTI2OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS1hcnJheS5jCisr
KyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtYXJyYXkuYwpAQCAtMjY1LDMgKzI2NSw0NSBA
QCBib29sIGRtYV9mZW5jZV9tYXRjaF9jb250ZXh0KHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlLCB1
NjQgY29udGV4dCkKIAlyZXR1cm4gdHJ1ZTsKIH0KIEVYUE9SVF9TWU1CT0woZG1hX2ZlbmNlX21h
dGNoX2NvbnRleHQpOworCisvKioKKyAqIGRtYV9mZW5jZV9hcnJheV9maXJzdCAtIHJldHVybiB0
aGUgZmlyc3QgZmVuY2UgaW4gYW4gYXJyYXkKKyAqIEBjdXJzb3I6IGN1cnNvciBmb3IgdGhlIGN1
cnJlbnQgcG9zaXRpb24KKyAqIEBhcnJheTogYXJyYXkgd2l0aCB0aGUgZmVuY2VzCisgKgorICog
UmV0dXJucyB0aGUgZmlyc3QgZmVuY2UgaW4gdGhlIGFycmF5IG9yIE5VTEwgaWYgdGhlIGFycmF5
IGlzIGVtcHR5LgorICogSWYgdGhlIGFycmF5IHBhcmFtZXRlciBpc24ndCBhIGRtYV9mZW5jZV9h
cnJheSByZXR1cm4gaXQgdW5tb2RpZmllZC4KKyAqLworc3RydWN0IGRtYV9mZW5jZSAqZG1hX2Zl
bmNlX2FycmF5X2ZpcnN0KHN0cnVjdCBkbWFfZmVuY2VfYXJyYXlfY3Vyc29yICpjdXJzb3IsCisJ
CQkJCXN0cnVjdCBkbWFfZmVuY2UgKmFycmF5KQoreworCWN1cnNvci0+YXJyYXkgPSB0b19kbWFf
ZmVuY2VfYXJyYXkoYXJyYXkpOworCWlmICghY3Vyc29yLT5hcnJheSkKKwkJcmV0dXJuIGFycmF5
OworCisJaWYgKCFjdXJzb3ItPmFycmF5LT5udW1fZmVuY2VzKQorCQlyZXR1cm4gTlVMTDsKKwor
CWN1cnNvci0+aW5kZXggPSAwOworCXJldHVybiBjdXJzb3ItPmFycmF5LT5mZW5jZXNbY3Vyc29y
LT5pbmRleCsrXTsKKworfQorRVhQT1JUX1NZTUJPTChkbWFfZmVuY2VfYXJyYXlfZmlyc3QpOwor
CisvKioKKyAqIGRtYV9mZW5jZV9hcnJheV9uZXh0IC0gcmV0dXJuIHRoZSBuZXh0IGZlbmNlIGlu
IHRoZSBhcnJheQorICogQGN1cnNvcjogY3Vyc29yIGZvciB0aGUgY3VycmVudCBwb3NpdGlvbgor
ICoKKyAqIFJldHVybnMgdGhlIG5leHQgZmVuY2UgZnJvbSB0aGUgYXJyYXkgb3IgTlVMTCBpZiB3
ZSBkb24ndCBoYXZlIGFueSBtb3JlCisgKi8KK3N0cnVjdCBkbWFfZmVuY2UgKmRtYV9mZW5jZV9h
cnJheV9uZXh0KHN0cnVjdCBkbWFfZmVuY2VfYXJyYXlfY3Vyc29yICpjdXJzb3IpCit7CisJaWYg
KCFjdXJzb3ItPmFycmF5KQorCQlyZXR1cm4gTlVMTDsKKworCWlmIChjdXJzb3ItPmluZGV4ID49
IGN1cnNvci0+YXJyYXktPm51bV9mZW5jZXMpCisJCXJldHVybiBOVUxMOworCisJcmV0dXJuIGN1
cnNvci0+YXJyYXktPmZlbmNlc1tjdXJzb3ItPmluZGV4KytdOworfQorRVhQT1JUX1NZTUJPTChk
bWFfZmVuY2VfYXJyYXlfbmV4dCk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2RtYS1mZW5j
ZS1hcnJheS5oIGIvaW5jbHVkZS9saW51eC9kbWEtZmVuY2UtYXJyYXkuaAppbmRleCAzNWQxZDFl
N2M5M2IuLjJhNzFmZDAwM2RmYSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9kbWEtZmVuY2Ut
YXJyYXkuaAorKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS1hcnJheS5oCkBAIC0xMjQsNCAr
MTI0LDI4IEBAIGRtYV9mZW5jZV9hcnJheV9jcmVhdGUoaW50IG51bV9mZW5jZXMsIHN0cnVjdCBk
bWFfZmVuY2UgKipmZW5jZXMsIHU2NCBjb250ZXh0LAogCiBib29sIGRtYV9mZW5jZV9tYXRjaF9j
b250ZXh0KHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlLCB1NjQgY29udGV4dCk7CiAKKy8qKgorICog
c3RydWN0IGRtYV9mZW5jZV9hcnJheV9jdXJzb3IgLSBjdXJzb3IgZm9yIHRoZSBmZW5jZXMgaW4g
YW4gYXJyYXkKKyAqLworc3RydWN0IGRtYV9mZW5jZV9hcnJheV9jdXJzb3IgeworCXN0cnVjdCBk
bWFfZmVuY2VfYXJyYXkgKmFycmF5OworCXVuc2lnbmVkIGludCBpbmRleDsKK307CisKK3N0cnVj
dCBkbWFfZmVuY2UgKmRtYV9mZW5jZV9hcnJheV9maXJzdChzdHJ1Y3QgZG1hX2ZlbmNlX2FycmF5
X2N1cnNvciAqY3Vyc29yLAorCQkJCQlzdHJ1Y3QgZG1hX2ZlbmNlICphcnJheSk7CitzdHJ1Y3Qg
ZG1hX2ZlbmNlICpkbWFfZmVuY2VfYXJyYXlfbmV4dChzdHJ1Y3QgZG1hX2ZlbmNlX2FycmF5X2N1
cnNvciAqY3Vyc29yKTsKKworLyoqCisgKiBkbWFfZmVuY2VfYXJyYXlfZm9yX2VhY2ggLSB3YWxr
IG92ZXIgYWxsIGZlbmNlcyBpbiBhIGZlbmNlIGFycmF5CisgKiBAZmVuY2U6IHRoZSBjdXJyZW50
IGZlbmNlCisgKiBAY3Vyc29yOiBjdXJzb3IgZm9yIHRoZSB3YWxrCisgKiBAYXJyYXk6IHBvdGVu
dGl0YWxseSBmZW5jZSBhcnJheQorICoKKyAqIFdhbGsgb3ZlciBhbGwgdGhlIGZlbmNlcyBpbiB0
aGUgYXJyYXkuCisgKi8KKyNkZWZpbmUgZG1hX2ZlbmNlX2FycmF5X2Zvcl9lYWNoKGZlbmNlLCBj
dXJzb3IsIGFycmF5KQkJXAorCWZvciAoZmVuY2UgPSBkbWFfZmVuY2VfYXJyYXlfZmlyc3QoJihj
dXJzb3IpLCBhcnJheSk7CVwKKwkgICAgIGZlbmNlOyBmZW5jZSA9IGRtYV9mZW5jZV9hcnJheV9u
ZXh0KCYoY3Vyc29yKSkpCisKICNlbmRpZiAvKiBfX0xJTlVYX0RNQV9GRU5DRV9BUlJBWV9IICov
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
