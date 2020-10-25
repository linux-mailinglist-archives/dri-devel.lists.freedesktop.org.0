Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0391A29824E
	for <lists+dri-devel@lfdr.de>; Sun, 25 Oct 2020 16:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A1D6E9CF;
	Sun, 25 Oct 2020 15:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FCC6E9CB
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:41:06 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id ce10so9881445ejc.5
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 08:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YDBIQ+Yfdfdw08vZW51lM6F7k5gI5BxTG2QR2nCBUjg=;
 b=YclveMbVXtGRkrvSg2qNW0iAkyQKsnz4k6eeFZ7OJ5Dedujhb59GgiPauvSCBaP/XD
 bZ16U6267AbZ/yCN0qsKW/YqcCwMUu8ws/z+beIecghxMV4iSJTvJepNZbOAT5eNY7vg
 BX/h5kfQR5bw23dqDm+FMKxqfMMiCscg+FaMm/0lI/g0uSVwYCXuBOsPNBKzDJdpjC0o
 fNaC/3skbxXCjdWT6UCtr3Hv9SLG92jl5I9sxwhgfD3E/Xoi5TQvePetsc4vkHBA7vFR
 dey9M7ryObmImlJ00IQFdA9/2fc5oQjajI4lH7Gq4vu7Ht0gnsW2+4iILf6md4iiway+
 Fp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YDBIQ+Yfdfdw08vZW51lM6F7k5gI5BxTG2QR2nCBUjg=;
 b=bykJ7MMt1eNjTNFbgWt+qOKUZS2hEMXD8EabKxiAHFajQ/TEbpRS1u22Ow0F6Hwd0x
 aN0vlow1zNlLXuXe54aDD/qDy2/A9+mrlhjSsIxiZFuu3VF1O+PAidCEkuLSK50nZZb3
 WzOgcNDMjLzRWi/v3d83bI8uKgHUHZ6mY6EtyZKtUEm7nAdceRKzs+izJJdUIAHUDVLk
 ptoENIxX6S3GsDb+4M/AcERIHIhsTKLeWeDHdQOy+o7yOJx+a+ZNnM9t5XhOb5XO2bJA
 5PgzVEYA1atIat3M1Xhuu+JsMafcqJc8Nq9h+SRrYDT9fGzqt4z+7VjhpKCdUtRUgaL7
 oufA==
X-Gm-Message-State: AOAM531Z1y4Vaz3+4PrSpDtXuXw0/FeNqqy17GRzlD9m54jaintESNSs
 9Tn7W8KfhhZLlok0QPp+Hb8=
X-Google-Smtp-Source: ABdhPJy++P+qHoWJp1hqJy2wXR41xzybctRkj6NcCrJ9kOybWDNqdjgb0OD08vLanDYWoNBYdufstA==
X-Received: by 2002:a17:906:141b:: with SMTP id
 p27mr12113928ejc.205.1603640465325; 
 Sun, 25 Oct 2020 08:41:05 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d13a:1a76:8d61:cf5c])
 by smtp.gmail.com with ESMTPSA id g8sm4141931ejp.73.2020.10.25.08.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 08:41:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Madhav.Chauhan@amd.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/13] drm/ttm: move swapin out of page alloc backend
Date: Sun, 25 Oct 2020 16:40:49 +0100
Message-Id: <20201025154100.16400-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201025154100.16400-1-christian.koenig@amd.com>
References: <20201025154100.16400-1-christian.koenig@amd.com>
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
Cc: Ray.Huang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBub3QgcmVsYXRlZCB0byBhbGxvY2F0aW5nIHRoZSBiYWNraW5nIHN0b3JlIGluIGFu
eSB3YXkuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcGFnZV9hbGxvYy5jICAgICB8
IDggLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2NfZG1hLmMgfCA4
IC0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jICAgICAgICAgICAgIHwgOCAr
KysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2MuYyBiL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2MuYwppbmRleCAwNDA5OWRkZGNlMTYuLjY2
MWI3NWQxOWNhZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcGFnZV9hbGxv
Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2MuYwpAQCAtMTA3MSwx
NCArMTA3MSw2IEBAIGludCB0dG1fcG9vbF9wb3B1bGF0ZShzdHJ1Y3QgdHRtX3R0ICp0dG0sIHN0
cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4KQogCQl9CiAJfQogCi0JaWYgKHVubGlrZWx5KHR0
bS0+cGFnZV9mbGFncyAmIFRUTV9QQUdFX0ZMQUdfU1dBUFBFRCkpIHsKLQkJcmV0ID0gdHRtX3R0
X3N3YXBpbih0dG0pOwotCQlpZiAodW5saWtlbHkocmV0ICE9IDApKSB7Ci0JCQl0dG1fcG9vbF91
bnBvcHVsYXRlKHR0bSk7Ci0JCQlyZXR1cm4gcmV0OwotCQl9Ci0JfQotCiAJcmV0dXJuIDA7CiB9
CiBFWFBPUlRfU1lNQk9MKHR0bV9wb29sX3BvcHVsYXRlKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2NfZG1hLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9wYWdlX2FsbG9jX2RtYS5jCmluZGV4IDg1ZGFkNjk0MTlmNi4uYTlhYWVkN2U2MThhIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jX2RtYS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2NfZG1hLmMKQEAgLTk3NSwxNCArOTc1LDYg
QEAgaW50IHR0bV9kbWFfcG9wdWxhdGUoc3RydWN0IHR0bV9kbWFfdHQgKnR0bV9kbWEsIHN0cnVj
dCBkZXZpY2UgKmRldiwKIAkJLS1udW1fcGFnZXM7CiAJfQogCi0JaWYgKHVubGlrZWx5KHR0bS0+
cGFnZV9mbGFncyAmIFRUTV9QQUdFX0ZMQUdfU1dBUFBFRCkpIHsKLQkJcmV0ID0gdHRtX3R0X3N3
YXBpbih0dG0pOwotCQlpZiAodW5saWtlbHkocmV0ICE9IDApKSB7Ci0JCQl0dG1fZG1hX3VucG9w
dWxhdGUodHRtX2RtYSwgZGV2KTsKLQkJCXJldHVybiByZXQ7Ci0JCX0KLQl9Ci0KIAlyZXR1cm4g
MDsKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKHR0bV9kbWFfcG9wdWxhdGUpOwpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0
LmMKaW5kZXggYmViMWU4NzhmZWQ5Li5kYzFkYWQ5ODJmMjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX3R0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYwpA
QCAtMzM4LDYgKzMzOCwxNCBAQCBpbnQgdHRtX3R0X3BvcHVsYXRlKHN0cnVjdCB0dG1fYm9fZGV2
aWNlICpiZGV2LAogCiAJdHRtX3R0X2FkZF9tYXBwaW5nKGJkZXYsIHR0bSk7CiAJdHRtLT5wYWdl
X2ZsYWdzIHw9IFRUTV9QQUdFX0ZMQUdfUFJJVl9QT1BVTEFURUQ7CisJaWYgKHVubGlrZWx5KHR0
bS0+cGFnZV9mbGFncyAmIFRUTV9QQUdFX0ZMQUdfU1dBUFBFRCkpIHsKKwkJcmV0ID0gdHRtX3R0
X3N3YXBpbih0dG0pOworCQlpZiAodW5saWtlbHkocmV0ICE9IDApKSB7CisJCQl0dG1fdHRfdW5w
b3B1bGF0ZShiZGV2LCB0dG0pOworCQkJcmV0dXJuIHJldDsKKwkJfQorCX0KKwogCXJldHVybiAw
OwogfQogRVhQT1JUX1NZTUJPTCh0dG1fdHRfcG9wdWxhdGUpOwotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
