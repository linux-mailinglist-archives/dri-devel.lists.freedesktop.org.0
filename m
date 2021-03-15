Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BAC33C81F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 22:05:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75F76E1B4;
	Mon, 15 Mar 2021 21:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75C56E1B4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 21:05:02 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 x7-20020a17090a2b07b02900c0ea793940so218221pjc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 14:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wcain8isGpID5TiDS3p2A/N5+StUg6lfh0Vw4Kh3Acs=;
 b=NgJDixSCiTx6FVyXIcJqTz/sRux1cv7gDETDTcrBxCsCZjtyAyLSwko+XFOHH+ZdAH
 n1mlhAT5QvaPPyh7TXpelRqXG+oiF79nufnmz7rs9WIBGvcoFnt5mOVkhK8fGQwXMiFH
 M7dlgckVl0sKEnPpqhvew9g+xytwz/uQhP99IPBqHPvBUa5eXsd9zJEF5G8jHRupqH8u
 39z1IW5w0eiuoeoZ6GBP8ijV63FGZDzc08mYV9d8lq0geNDMRl5YCfUraX8QOOR2DpD3
 7t1mIw7LJMPO/ZwgFN8oQDD+yrLzw/c261dUeNigu0PzOjt9JlvYK/H8cK7Gy1kqR8TK
 asWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wcain8isGpID5TiDS3p2A/N5+StUg6lfh0Vw4Kh3Acs=;
 b=WvK+1v+VMxCGTPDOqW+yrToCnRK3dtBTbhw+xidpZ512wPcbCT9a8AE7BsghXDx7PI
 L8zGdNcZOFk0+k1ifikQNVo6BvphUMmcXTgSCGD91WmI6t7khOOm5G0o/c0c4HOtYpRq
 uoEPaV7ePXN69hSCHHloqABa8cAMo4Cb7O3+Yo1iSLO7sTQXfpdnqq9KmzlpRLcI1hGj
 IiiXtCVVATa6+jq0jUqkdtlIUzkwc78I8COA1jwdWPa5bboIAvHNJar/aGY1qvs8LYiv
 PPYtRgU0B5GsV843XP3SOjg3JemMLbFgXpwEhnc9cnlUWyxWmncVz4U8R67qKzS080j7
 1MKw==
X-Gm-Message-State: AOAM531cWF1Teg+nrZDoOjBLn66DcI7Pg7T32BOEMeg+RGC8Viqof5Ow
 S/fUZSO//9aWToCM6BJkBCSek8lfa6uisw==
X-Google-Smtp-Source: ABdhPJzimnU7uJzN0+4IytHT3VVjnOMQSQeO+gCiqgZmQS7VD9+Gu6/jysx6gMJJTwCoSJr3nR2yeQ==
X-Received: by 2002:a17:90b:a0d:: with SMTP id
 gg13mr996208pjb.29.1615842301891; 
 Mon, 15 Mar 2021 14:05:01 -0700 (PDT)
Received: from omlet.com (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id t19sm13923609pgj.8.2021.03.15.14.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 14:05:01 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] dma-buf: add dma_fence_array_for_each (v2)
Date: Mon, 15 Mar 2021 16:04:51 -0500
Message-Id: <20210315210453.1667925-2-jason@jlekstrand.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210315210453.1667925-1-jason@jlekstrand.net>
References: <20200317212115.419358-1-jason@jlekstrand.net>
 <20210315210453.1667925-1-jason@jlekstrand.net>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+
CgpBZGQgYSBoZWxwZXIgdG8gaXRlcmF0ZSBvdmVyIGFsbCBmZW5jZXMgaW4gYSBkbWFfZmVuY2Vf
YXJyYXkgb2JqZWN0LgoKdjIgKEphc29uIEVrc3RyYW5kKQogLSBSZXR1cm4gTlVMTCBmcm9tIGRt
YV9mZW5jZV9hcnJheV9maXJzdCBpZiBoZWFkID09IE5VTEwuICBUaGlzIG1hdGNoZXMKICAgdGhl
IGl0ZXJhdG9yIGJlaGF2aW9yIG9mIGRtYV9mZW5jZV9jaGFpbl9mb3JfZWFjaCBpbiB0aGF0IGl0
IGl0ZXJhdGVzCiAgIHplcm8gdGltZXMgaWYgaGVhZCA9PSBOVUxMLgogLSBSZXR1cm4gTlVMTCBm
cm9tIGRtYV9mZW5jZV9hcnJheV9uZXh0IGlmIGluZGV4ID4gYXJyYXktPm51bV9mZW5jZXMuCgpT
aWduZWQtb2ZmLWJ5OiBKYXNvbiBFa3N0cmFuZCA8amFzb25Aamxla3N0cmFuZC5uZXQ+Ci0tLQog
ZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS1hcnJheS5jIHwgMjcgKysrKysrKysrKysrKysrKysr
KysrKysrKysrCiBpbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS1hcnJheS5oICAgfCAxNyArKysrKysr
KysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS1hcnJheS5jIGIvZHJpdmVycy9kbWEtYnVmL2Rt
YS1mZW5jZS1hcnJheS5jCmluZGV4IGQzZmJkOTUwYmU5NDQuLjJhYzFhZmM2OTdkMGYgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtYXJyYXkuYworKysgYi9kcml2ZXJzL2Rt
YS1idWYvZG1hLWZlbmNlLWFycmF5LmMKQEAgLTIwMSwzICsyMDEsMzAgQEAgYm9vbCBkbWFfZmVu
Y2VfbWF0Y2hfY29udGV4dChzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSwgdTY0IGNvbnRleHQpCiAJ
cmV0dXJuIHRydWU7CiB9CiBFWFBPUlRfU1lNQk9MKGRtYV9mZW5jZV9tYXRjaF9jb250ZXh0KTsK
Kworc3RydWN0IGRtYV9mZW5jZSAqZG1hX2ZlbmNlX2FycmF5X2ZpcnN0KHN0cnVjdCBkbWFfZmVu
Y2UgKmhlYWQpCit7CisJc3RydWN0IGRtYV9mZW5jZV9hcnJheSAqYXJyYXk7CisKKwlpZiAoIWhl
YWQpCisJCXJldHVybiBOVUxMOworCisJYXJyYXkgPSB0b19kbWFfZmVuY2VfYXJyYXkoaGVhZCk7
CisJaWYgKCFhcnJheSkKKwkJcmV0dXJuIGhlYWQ7CisKKwlyZXR1cm4gYXJyYXktPmZlbmNlc1sw
XTsKK30KK0VYUE9SVF9TWU1CT0woZG1hX2ZlbmNlX2FycmF5X2ZpcnN0KTsKKworc3RydWN0IGRt
YV9mZW5jZSAqZG1hX2ZlbmNlX2FycmF5X25leHQoc3RydWN0IGRtYV9mZW5jZSAqaGVhZCwKKwkJ
CQkgICAgICAgdW5zaWduZWQgaW50IGluZGV4KQoreworCXN0cnVjdCBkbWFfZmVuY2VfYXJyYXkg
KmFycmF5ID0gdG9fZG1hX2ZlbmNlX2FycmF5KGhlYWQpOworCisJaWYgKCFhcnJheSB8fCBpbmRl
eCA+PSBhcnJheS0+bnVtX2ZlbmNlcykKKwkJcmV0dXJuIE5VTEw7CisKKwlyZXR1cm4gYXJyYXkt
PmZlbmNlc1tpbmRleF07Cit9CitFWFBPUlRfU1lNQk9MKGRtYV9mZW5jZV9hcnJheV9uZXh0KTsK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZG1hLWZlbmNlLWFycmF5LmggYi9pbmNsdWRlL2xp
bnV4L2RtYS1mZW5jZS1hcnJheS5oCmluZGV4IDMwM2RkNzEyMjIwZmQuLjU4OGFjODA4OWRkNjEg
MTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvZG1hLWZlbmNlLWFycmF5LmgKKysrIGIvaW5jbHVk
ZS9saW51eC9kbWEtZmVuY2UtYXJyYXkuaApAQCAtNzQsNiArNzQsMTkgQEAgdG9fZG1hX2ZlbmNl
X2FycmF5KHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlKQogCXJldHVybiBjb250YWluZXJfb2YoZmVu
Y2UsIHN0cnVjdCBkbWFfZmVuY2VfYXJyYXksIGJhc2UpOwogfQogCisvKioKKyAqIGRtYV9mZW5j
ZV9hcnJheV9mb3JfZWFjaCAtIGl0ZXJhdGUgb3ZlciBhbGwgZmVuY2VzIGluIGFycmF5CisgKiBA
ZmVuY2U6IGN1cnJlbnQgZmVuY2UKKyAqIEBpbmRleDogaW5kZXggaW50byB0aGUgYXJyYXkKKyAq
IEBoZWFkOiBwb3RlbnRpYWwgZG1hX2ZlbmNlX2FycmF5IG9iamVjdAorICoKKyAqIFRlc3QgaWYg
QGFycmF5IGlzIGEgZG1hX2ZlbmNlX2FycmF5IG9iamVjdCBhbmQgaWYgeWVzIGl0ZXJhdGUgb3Zl
ciBhbGwgZmVuY2VzCisgKiBpbiB0aGUgYXJyYXkuIElmIG5vdCBqdXN0IGl0ZXJhdGUgb3ZlciB0
aGUgZmVuY2UgaW4gQGFycmF5IGl0c2VsZi4KKyAqLworI2RlZmluZSBkbWFfZmVuY2VfYXJyYXlf
Zm9yX2VhY2goZmVuY2UsIGluZGV4LCBoZWFkKQkJCVwKKwlmb3IgKGluZGV4ID0gMCwgZmVuY2Ug
PSBkbWFfZmVuY2VfYXJyYXlfZmlyc3QoaGVhZCk7IGZlbmNlOwlcCisJICAgICArKyhpbmRleCks
IGZlbmNlID0gZG1hX2ZlbmNlX2FycmF5X25leHQoaGVhZCwgaW5kZXgpKQorCiBzdHJ1Y3QgZG1h
X2ZlbmNlX2FycmF5ICpkbWFfZmVuY2VfYXJyYXlfY3JlYXRlKGludCBudW1fZmVuY2VzLAogCQkJ
CQkgICAgICAgc3RydWN0IGRtYV9mZW5jZSAqKmZlbmNlcywKIAkJCQkJICAgICAgIHU2NCBjb250
ZXh0LCB1bnNpZ25lZCBzZXFubywKQEAgLTgxLDQgKzk0LDggQEAgc3RydWN0IGRtYV9mZW5jZV9h
cnJheSAqZG1hX2ZlbmNlX2FycmF5X2NyZWF0ZShpbnQgbnVtX2ZlbmNlcywKIAogYm9vbCBkbWFf
ZmVuY2VfbWF0Y2hfY29udGV4dChzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSwgdTY0IGNvbnRleHQp
OwogCitzdHJ1Y3QgZG1hX2ZlbmNlICpkbWFfZmVuY2VfYXJyYXlfZmlyc3Qoc3RydWN0IGRtYV9m
ZW5jZSAqaGVhZCk7CitzdHJ1Y3QgZG1hX2ZlbmNlICpkbWFfZmVuY2VfYXJyYXlfbmV4dChzdHJ1
Y3QgZG1hX2ZlbmNlICpoZWFkLAorCQkJCSAgICAgICB1bnNpZ25lZCBpbnQgaW5kZXgpOworCiAj
ZW5kaWYgLyogX19MSU5VWF9ETUFfRkVOQ0VfQVJSQVlfSCAqLwotLSAKMi4yOS4yCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
