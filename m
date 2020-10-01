Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FCD27FE56
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 13:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26286E891;
	Thu,  1 Oct 2020 11:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191706E891
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 11:28:22 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id i26so7467349ejb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Oct 2020 04:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rGW1VKhK2gTXdeio8SdCtrz5PoSyJCKHMHzyXOz07VM=;
 b=rT9virqVSyqVBLZNANkLyrcZInRMPSlOxNZItHyTKUH4WVNHGLzWqr+aHJF/w8+nlE
 fD1jqTyikzMqbXtOErBqAN3iVEDQzZXbeSmGrsJi11PeaAgV+gvRiYlL30IOo5wNfWlV
 mri3/0VfsWSLIFbsUzzZYXXdvV7bsTB+Te4FGoaYKjv8duacw91jXBRzUlYVIZUXKj8y
 19lV6vIFGaeC5XZLHxpma5r/GE+JCA1v08GdfV4G3s7ne9SRJfCQW5dLw8kDWow3GjvU
 UH/ufBl7TH/5S4vCb/K4z/bTWvrbUjPcTuqqzpXwJUWLOChOn1MnAYkQcIDLhf4gn2pQ
 NoSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rGW1VKhK2gTXdeio8SdCtrz5PoSyJCKHMHzyXOz07VM=;
 b=kuQmiuw9g+1BRhEbZkkc28T8mEp9iAe3tbaNCDv01EyolNiQ5niU4Bt3UioSuNNbBc
 Z8VJaWXnz1D0piJKddkrFMKuy06Dg/S9hzpqeezlUsvOWXXT9dO9vq1KiOcAU1r3lLog
 t8oXISwwXoz6KNvQ6VpeETaREcuF9yYqaDBuY4Yo9vkFhrO9zAU1QqhsJKc34TTjDf4O
 5FyVwnsCkYpaVTVo/cjc11+gkwXtiGj7s9ShFv8/VNI60eBJtzUdUWRRr5ODhXq947ER
 EncF6DKFTAo/VunGZVIo+IUhsfvTjPcC1GI1cNqRPdSvGdRCbBKCHsqY2GfOYxKvM1cc
 LWZg==
X-Gm-Message-State: AOAM532SHD5+8j2HZZMtR+lm6o1IldWdtjpxiFkk0MK/RUblxPTYGrmP
 wMFLhkKrRB61aubYoMxz4OWibrYEd2o=
X-Google-Smtp-Source: ABdhPJzP0yYPSiktNwwP3NhH78ooSuMn20SXlvFv0iy9l8AYcWWq07ESULGkjxT2eWaplQS8BC5DLQ==
X-Received: by 2002:a17:906:7e4c:: with SMTP id
 z12mr7493812ejr.123.1601551700479; 
 Thu, 01 Oct 2020 04:28:20 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:36be:5a08:8c1d:6b2b])
 by smtp.gmail.com with ESMTPSA id p3sm3834892edp.28.2020.10.01.04.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 04:28:19 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, ray.huang@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 3/8] drm/ttm: cleanup ttm_handle_caching_state_failure
Date: Thu,  1 Oct 2020 13:28:12 +0200
Message-Id: <20201001112817.20967-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201001112817.20967-1-christian.koenig@amd.com>
References: <20201001112817.20967-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVtb3ZlIHVudXNlZCBwYXJhbWV0ZXJzLCBzaG9ydGVuIHRoZSBmdW5jdGlvbiBuYW1lLgoKU2ln
bmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2MuYyB8IDIwICsrKysrKysrLS0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jLmMgYi9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jLmMKaW5kZXggOTEyYzMwZGNjOWRiLi4x
MTEwMzFjYmI2ZGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxs
b2MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jLmMKQEAgLTQ2Nywx
MSArNDY3LDExIEBAIHN0YXRpYyBpbnQgdHRtX3NldF9wYWdlc19jYWNoaW5nKHN0cnVjdCBwYWdl
ICoqcGFnZXMsCiAgKiBhbnkgcGFnZXMgdGhhdCBoYXZlIGNoYW5nZWQgdGhlaXIgY2FjaGluZyBz
dGF0ZSBhbHJlYWR5IHB1dCB0aGVtIHRvIHRoZQogICogcG9vbC4KICAqLwotc3RhdGljIHZvaWQg
dHRtX2hhbmRsZV9jYWNoaW5nX3N0YXRlX2ZhaWx1cmUoc3RydWN0IGxpc3RfaGVhZCAqcGFnZXMs
Ci0JCWludCB0dG1fZmxhZ3MsIGVudW0gdHRtX2NhY2hpbmdfc3RhdGUgY3N0YXRlLAotCQlzdHJ1
Y3QgcGFnZSAqKmZhaWxlZF9wYWdlcywgdW5zaWduZWQgY3BhZ2VzKQorc3RhdGljIHZvaWQgdHRt
X2hhbmRsZV9jYWNoaW5nX2ZhaWx1cmUoc3RydWN0IHBhZ2UgKipmYWlsZWRfcGFnZXMsCisJCQkJ
ICAgICAgIHVuc2lnbmVkIGNwYWdlcykKIHsKIAl1bnNpZ25lZCBpOworCiAJLyogRmFpbGVkIHBh
Z2VzIGhhdmUgdG8gYmUgZnJlZWQgKi8KIAlmb3IgKGkgPSAwOyBpIDwgY3BhZ2VzOyArK2kpIHsK
IAkJbGlzdF9kZWwoJmZhaWxlZF9wYWdlc1tpXS0+bHJ1KTsKQEAgLTUxNyw5ICs1MTcsOCBAQCBz
dGF0aWMgaW50IHR0bV9hbGxvY19uZXdfcGFnZXMoc3RydWN0IGxpc3RfaGVhZCAqcGFnZXMsIGdm
cF90IGdmcF9mbGFncywKIAkJCQlyID0gdHRtX3NldF9wYWdlc19jYWNoaW5nKGNhY2hpbmdfYXJy
YXksCiAJCQkJCQkJICBjc3RhdGUsIGNwYWdlcyk7CiAJCQkJaWYgKHIpCi0JCQkJCXR0bV9oYW5k
bGVfY2FjaGluZ19zdGF0ZV9mYWlsdXJlKHBhZ2VzLAotCQkJCQkJdHRtX2ZsYWdzLCBjc3RhdGUs
Ci0JCQkJCQljYWNoaW5nX2FycmF5LCBjcGFnZXMpOworCQkJCQl0dG1faGFuZGxlX2NhY2hpbmdf
ZmFpbHVyZShjYWNoaW5nX2FycmF5LAorCQkJCQkJCQkgICBjcGFnZXMpOwogCQkJfQogCQkJciA9
IC1FTk9NRU07CiAJCQlnb3RvIG91dDsKQEAgLTU0Miw5ICs1NDEsOCBAQCBzdGF0aWMgaW50IHR0
bV9hbGxvY19uZXdfcGFnZXMoc3RydWN0IGxpc3RfaGVhZCAqcGFnZXMsIGdmcF90IGdmcF9mbGFn
cywKIAkJCQlyID0gdHRtX3NldF9wYWdlc19jYWNoaW5nKGNhY2hpbmdfYXJyYXksCiAJCQkJCQlj
c3RhdGUsIGNwYWdlcyk7CiAJCQkJaWYgKHIpIHsKLQkJCQkJdHRtX2hhbmRsZV9jYWNoaW5nX3N0
YXRlX2ZhaWx1cmUocGFnZXMsCi0JCQkJCQl0dG1fZmxhZ3MsIGNzdGF0ZSwKLQkJCQkJCWNhY2hp
bmdfYXJyYXksIGNwYWdlcyk7CisJCQkJCXR0bV9oYW5kbGVfY2FjaGluZ19mYWlsdXJlKGNhY2hp
bmdfYXJyYXksCisJCQkJCQkJCSAgIGNwYWdlcyk7CiAJCQkJCWdvdG8gb3V0OwogCQkJCX0KIAkJ
CQljcGFnZXMgPSAwOwpAQCAtNTU1LDkgKzU1Myw3IEBAIHN0YXRpYyBpbnQgdHRtX2FsbG9jX25l
d19wYWdlcyhzdHJ1Y3QgbGlzdF9oZWFkICpwYWdlcywgZ2ZwX3QgZ2ZwX2ZsYWdzLAogCWlmIChj
cGFnZXMpIHsKIAkJciA9IHR0bV9zZXRfcGFnZXNfY2FjaGluZyhjYWNoaW5nX2FycmF5LCBjc3Rh
dGUsIGNwYWdlcyk7CiAJCWlmIChyKQotCQkJdHRtX2hhbmRsZV9jYWNoaW5nX3N0YXRlX2ZhaWx1
cmUocGFnZXMsCi0JCQkJCXR0bV9mbGFncywgY3N0YXRlLAotCQkJCQljYWNoaW5nX2FycmF5LCBj
cGFnZXMpOworCQkJdHRtX2hhbmRsZV9jYWNoaW5nX2ZhaWx1cmUoY2FjaGluZ19hcnJheSwgY3Bh
Z2VzKTsKIAl9CiBvdXQ6CiAJa2ZyZWUoY2FjaGluZ19hcnJheSk7Ci0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
