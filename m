Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 595059D225
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 16:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42EC06E096;
	Mon, 26 Aug 2019 14:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56D889F8E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 14:57:38 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id o4so15787475wmh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 07:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dory6iMos9l+mdyEwGPbTiqUtowdJaD3gd9QEEFvwxI=;
 b=lY2NGVvb9gU9nTonYWnkddj/QgcLvHJBJm0jNjXUkVvLzjFN9YMCbV/TzoDHqkiX/6
 jzK/h79xoLRVNkxchjnyZkRWyOQiCXlNr6lVLohsPfTwcsRdIqLkmzD1q5gChkG6tikW
 7wYYPQ1K8gWsFiE7UeDb7Ziz0jahwaZNENlvZOPFRo1DaC/CZW0GOkx/h54O5x3Wz5iz
 +ugBt4EfxgMwWECj7X5xY1KAUbE6rFb/aqsHyOl89KngS3b+flQy0PVLkzEHgapQV9KJ
 W2HwKtXxm25Nav9iycJ1GO142r8ZySvvybLlN3a611x/KMjiGkV11Z5qBvsEhQJHrSBJ
 PDQQ==
X-Gm-Message-State: APjAAAW5El++dHQRyBHfV36jYVnZJOS2jKegZl0qZA/t2AMCC1oZxRPt
 v7QhcbRv2+waTKQmJAoTbgPwPTNz
X-Google-Smtp-Source: APXvYqwhXrTJtyZKIS2GL7rEowiF10SZQSZs0Rr1NkojMwT7jKVx37M8QtLeMudXLnJlEvK3Ga8Seg==
X-Received: by 2002:a1c:8187:: with SMTP id c129mr21955469wmd.32.1566831457359; 
 Mon, 26 Aug 2019 07:57:37 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b0e3:7a12:98e5:ca6])
 by smtp.gmail.com with ESMTPSA id z8sm9865624wmi.7.2019.08.26.07.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 07:57:36 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 5/9] dma-buf: add dma_fence_array_for_each
Date: Mon, 26 Aug 2019 16:57:27 +0200
Message-Id: <20190826145731.1725-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826145731.1725-1-christian.koenig@amd.com>
References: <20190826145731.1725-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dory6iMos9l+mdyEwGPbTiqUtowdJaD3gd9QEEFvwxI=;
 b=m2Dhh3HuJShfKJ+CSaiYIChS8UGnuawoazbndF/CBXdeo2+PL9MBXpgmhSA40SIsz1
 ajNjVWaUKOAVxzmKlLB/rLXgxImiCO2WmJ74Kwq2rNoo5I2znpQt0EVEpTXBKfrnKO4k
 5oYhr8FJheeUyrNK67GJmnfytJn8WQ/UnraMMPRcSpnVXi06yDe1fIcLjoAHk9zCkO3v
 2LntgiS8MqF5852UKLT9wPNHRcW1jaAv77zu/iiHZfrMlQfOb71+uTaF/fHpRjyGK6kr
 1H6IFeMXlq0NKBSYGk9UEFWxe9BP00Y5jOyzcI5Cynu/SB/rUHNipTIp8o9bby9Gc7kJ
 /gIw==
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
aXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtYXJyYXkuYwppbmRleCBlYTc3MTNiNDA1MTQuLjNiYzI2
NjNhM2YzMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS1hcnJheS5jCisr
KyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtYXJyYXkuYwpAQCAtMjc2LDMgKzI3Niw0NSBA
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
