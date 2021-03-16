Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9FE33CCCF
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 06:00:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3B489C8D;
	Tue, 16 Mar 2021 05:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA7C89C8D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 05:00:46 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id d20so36884178oiw.10
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 22:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wcain8isGpID5TiDS3p2A/N5+StUg6lfh0Vw4Kh3Acs=;
 b=V7TndwpQhu+oiUPhkn0Az9On9YRq3u1BtO+zfx+aRFBBV8KyGKuib0eBcYRDvBs+fL
 COtzlufkp9SXSfq2DQ+IcesezUhNBly0PM4skxsH3S/xl8/La5XzWlZOrWLsxno3+bAV
 D0Ykj7QqTNTfN6ByUkfgKkbvD/IhR7jpMBUY8v/mgCCzqOAzE9ktQOugaCWXLMLgPAcT
 Jsi7Bsc31niKZnjDg5OL4+LtgF2n7ENwcmQhQe7kHSZHSx+tPEsoK4NvDGobTANsS7Ff
 L5GnyVf+m1zX7smeT5PDJJxD9TUTzhGN8pKe9MJsLLmG5K/u5+xLZLB1uKNAiHCODRx9
 lfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wcain8isGpID5TiDS3p2A/N5+StUg6lfh0Vw4Kh3Acs=;
 b=MhirwkjhF+7Rv4KkRMmM9ZC6aj+ZPxjbkLof1gmlP+C5XMds6N24zpoQ67mxxc95x2
 76wDPLN98zryY/ckOmiAzY8zGwt1Z7yIPCDDcaiTRm92A8wDeHZGGVc3SGpw+rSUoVYw
 1quPfiOm/k/FZx9lbVcV4Rh2ePaFtNhHqGVyKa5DH79NOxnIStG5YjVoTIGcGuNr6z9v
 YlE167uovGuawAobIHDAVpCMXFZ9FdNc0JCJmztB4q1Aw3txxsM2XOqUoYe+Qmh/6UdC
 mijIAk0z9qg46UY6YkzycYdAJ0gXT/k4zWIs1OUBigo/bfExgc0B3zhcn5fZgopxmHnt
 BM8g==
X-Gm-Message-State: AOAM531msV6WbKnpl7n/PeXz/OAYvwdl4bwlrQtK8dTtjfGbPXxu2Z4D
 iHt3nsHa8jBYGSCrXYOxHxHjpzon6evsdg==
X-Google-Smtp-Source: ABdhPJyzSSb9XXLuLbFJQFF44nOWoa2E8vzSjK7UwQDKfK6Q6JbS/iQ+lo85eRTbt0+GaNq5SFv60g==
X-Received: by 2002:a17:90a:c909:: with SMTP id
 v9mr2911617pjt.218.1615870409888; 
 Mon, 15 Mar 2021 21:53:29 -0700 (PDT)
Received: from omlet.com (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id w128sm15147785pfw.86.2021.03.15.21.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 21:53:29 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] dma-buf: add dma_fence_array_for_each (v2)
Date: Mon, 15 Mar 2021 23:53:20 -0500
Message-Id: <20210316045322.2020294-2-jason@jlekstrand.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210316045322.2020294-1-jason@jlekstrand.net>
References: <20210315210453.1667925-1-jason@jlekstrand.net>
 <20210316045322.2020294-1-jason@jlekstrand.net>
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
