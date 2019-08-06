Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3724A8349F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 17:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6CD6E3C7;
	Tue,  6 Aug 2019 15:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE1D6E3C1;
 Tue,  6 Aug 2019 15:01:40 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z1so88237780wru.13;
 Tue, 06 Aug 2019 08:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y/VgpN9KQ1OYN1RgMfMvxyKwysupVNNwVRv17BQOI18=;
 b=kS1HuSpgAR02f1tEubztaop9eAuUYUSRBTV/rDlRoOEocYapmzlgdXcjkEbVugldU5
 WxU4kjRqf6a/J40iqURJXVk5Vc0dAC9WK0DBsRgVag3n/NYg9xgBYCjIh+iu2RGCHYvR
 F4CsUu0xG2iyCoGdeKVltDD90W8tG2pKWK0mBS9vqFUG78lHt7odW82w+F5JwZHaAVkh
 Gb+3OTPdx7CG9ebcxTAQa86dg6eIgFFYeFqqv57Evn+GJlZFQSiDEuUM6wNTufxVHKiN
 Uho+hnivgaREVprv92ghSTnoogaQQPh1krLXWTlZ1CBGko0FOt0rf32++EI9lXOURTTf
 4vmw==
X-Gm-Message-State: APjAAAXSRkGGuyHMtriy0Xje6Y5atKEJP/zBMFJlIffbR9Sj544REyuu
 TSN2sJ8m3ZS+UBQRbMlWu0C8LFgN
X-Google-Smtp-Source: APXvYqySrehuax4d3UPx8f93fBn9dGfOVrfTSM3PKhCJVqFgq0+DDODLByQU0CF6Xj/N/Z0oG3Jptw==
X-Received: by 2002:a5d:4041:: with SMTP id w1mr5377756wrp.199.1565103699074; 
 Tue, 06 Aug 2019 08:01:39 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d1e0:fffc:b0e3:c66d])
 by smtp.gmail.com with ESMTPSA id g2sm78766828wmh.0.2019.08.06.08.01.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 08:01:38 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk
Subject: [PATCH 4/8] drm/i915: use new reservation_object_fences helper
Date: Tue,  6 Aug 2019 17:01:30 +0200
Message-Id: <20190806150134.104222-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806150134.104222-1-christian.koenig@amd.com>
References: <20190806150134.104222-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Y/VgpN9KQ1OYN1RgMfMvxyKwysupVNNwVRv17BQOI18=;
 b=K5gHGuknqyvj012sUTfbv23M2dYCJGSg6gEE1ySc73LWtbguGo/uqRGNzeaFwz1A8W
 t7pQhYrOc/VQVq8Bp/OXGF92PlrRSYHBU3LHMRuy80gFO+30QEjqllxALk+D7hT7JFpu
 G5IcKGbuAn28uPBL8JZGIhEadAn5HjCAJkyNGXaDBYZ3E6+cUDl2BpI/beC/Yc8NaG24
 YYW96Xhy9lvZIAgMCA5AYwGmBLOsFj54RvfkayH35NiBtBWt6uz8lzWsJ+41WNxjqh/V
 VoiBHqHogvlOvrEF+64DzbmkVvLXqnNLWeWgIiF9XolMmHNHI9UDhZNNBDnfk8b+Ibjk
 HEEg==
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

SW5zdGVhZCBvZiBvcGVuIGNvZGluZyB0aGUgc2VxdWVuY2UgbG9vcCB1c2UgdGhlIG5ldyBoZWxw
ZXIuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2J1c3kuYyB8IDEy
ICsrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fYnVz
eS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2J1c3kuYwppbmRleCA2YWQ5
M2EwOTk2OGMuLjhkYTA1OTRlZGE4OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z2VtL2k5MTVfZ2VtX2J1c3kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9n
ZW1fYnVzeS5jCkBAIC04Myw3ICs4Myw3IEBAIGk5MTVfZ2VtX2J1c3lfaW9jdGwoc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAlzdHJ1Y3QgZHJtX2k5MTVfZ2VtX2J1c3kgKmFy
Z3MgPSBkYXRhOwogCXN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmo7CiAJc3RydWN0IHJl
c2VydmF0aW9uX29iamVjdF9saXN0ICpsaXN0OwotCXVuc2lnbmVkIGludCBzZXE7CisJc3RydWN0
IGRtYV9mZW5jZSAqZXhjbDsKIAlpbnQgZXJyOwogCiAJZXJyID0gLUVOT0VOVDsKQEAgLTEwOSwx
NSArMTA5LDEyIEBAIGk5MTVfZ2VtX2J1c3lfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
dm9pZCAqZGF0YSwKIAkgKiB0byByZXBvcnQgdGhlIG92ZXJhbGwgYnVzeW5lc3MuIFRoaXMgaXMg
d2hhdCB0aGUgd2FpdC1pb2N0bCBkb2VzLgogCSAqCiAJICovCi1yZXRyeToKLQlzZXEgPSByYXdf
cmVhZF9zZXFjb3VudCgmb2JqLT5iYXNlLnJlc3YtPnNlcSk7CisJcmVzZXJ2YXRpb25fb2JqZWN0
X2ZlbmNlcyhvYmotPmJhc2UucmVzdiwgJmV4Y2wsICZsaXN0KTsKIAogCS8qIFRyYW5zbGF0ZSB0
aGUgZXhjbHVzaXZlIGZlbmNlIHRvIHRoZSBSRUFEICphbmQqIFdSSVRFIGVuZ2luZSAqLwotCWFy
Z3MtPmJ1c3kgPQotCQlidXN5X2NoZWNrX3dyaXRlcihyY3VfZGVyZWZlcmVuY2Uob2JqLT5iYXNl
LnJlc3YtPmZlbmNlX2V4Y2wpKTsKKwlhcmdzLT5idXN5ID0gYnVzeV9jaGVja193cml0ZXIoZXhj
bCk7CiAKIAkvKiBUcmFuc2xhdGUgc2hhcmVkIGZlbmNlcyB0byBSRUFEIHNldCBvZiBlbmdpbmVz
ICovCi0JbGlzdCA9IHJjdV9kZXJlZmVyZW5jZShvYmotPmJhc2UucmVzdi0+ZmVuY2UpOwogCWlm
IChsaXN0KSB7CiAJCXVuc2lnbmVkIGludCBzaGFyZWRfY291bnQgPSBsaXN0LT5zaGFyZWRfY291
bnQsIGk7CiAKQEAgLTEyOSw5ICsxMjYsNiBAQCBpOTE1X2dlbV9idXN5X2lvY3RsKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJCX0KIAl9CiAKLQlpZiAoYXJncy0+YnVzeSAm
JiByZWFkX3NlcWNvdW50X3JldHJ5KCZvYmotPmJhc2UucmVzdi0+c2VxLCBzZXEpKQotCQlnb3Rv
IHJldHJ5OwotCiAJZXJyID0gMDsKIG91dDoKIAlyY3VfcmVhZF91bmxvY2soKTsKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
