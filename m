Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D20F180EAB
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 04:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F336E40B;
	Wed, 11 Mar 2020 03:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9B189FE3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 03:44:07 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id i13so504082pfe.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 20:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P16W7ep8HpZEZbf2VCVYHJ7H+KUUPSbN1YkIr+6sSlQ=;
 b=tCu4TDguooR4tfYyACvCoI7MEVLwPSOiIShWk5/IPARU5TQg0GCHpx5pvxZfZ/2jdb
 vz0gO9H8hR1jEQgMkpKTiBJoiS7EtJ5+Re21/zT/7+dEqFcH4QhtEq7iklHDQz8aZ4ED
 h5o+fe9jj8aLNJTdEiFpmQESnjguXQE+DxAy48m+ri2NqUj0ck/EJ53Od44WbappO0u6
 M5PMHUWsJ1AUzq32iKUreC8B7vS4OMjdorltjcDguKGnPO99on/KtQaiHpEBS1en5UC6
 brO2nCR/2wZiFp6/kxIWfN0gQg4kxueOlrX2kwHyBurpODi7jr2aWxqMP0R/7BccEPV3
 ysWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P16W7ep8HpZEZbf2VCVYHJ7H+KUUPSbN1YkIr+6sSlQ=;
 b=aZ+edh3+1Yr0ne68jmVjOT7oDDZPfwGrhhOa6JRbiB9FmTUzKU9srGvCoJxoS02Dbf
 wTOhcwXuopzONN2/YEzJYci12Gv1aDFN7zs/zNjvuMmwgOpcuiv5J+vKI+mIjhQDIt6r
 ckA3RSaJZyqaB5pNdjeTYbvWgOgffF4uD5OpuoyexTuujrrH5siyoBxeWq2W2ErDk/y2
 F7vYt8AiImGlk+zBXagPpbWT7uV7C7G019Zd3ekCozVhJkhyIfU7wAql8gsqGKHP5cab
 0bcP6Y6UiUuGG4I+N3dJdCltbPqMffK93M0OWMB3/Ebn1qDSrkyquVMUB+j44QLjC/hP
 AvrA==
X-Gm-Message-State: ANhLgQ29feAQK6AF73dI2BJDR3qDmDm11dPPBfMQSDx8xOZOmwkztF7J
 vioSueanUp+BPPtkKOg1oi+2ig==
X-Google-Smtp-Source: ADFU+vuNjXuDPqhg8zCHX7akIbl+E1cdU/rjV0v8i4t9fu91z6NCzwwYTmCz8DLIFQqRHKFy7riJrw==
X-Received: by 2002:a63:7e1a:: with SMTP id z26mr900050pgc.226.1583898247079; 
 Tue, 10 Mar 2020 20:44:07 -0700 (PDT)
Received: from omlet.com ([2605:6000:1026:c273::ce4])
 by smtp.gmail.com with ESMTPSA id bb13sm3650846pjb.43.2020.03.10.20.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 20:44:06 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: 
Subject: [PATCH 1/3] dma-buf: add dma_fence_array_for_each (v2)
Date: Tue, 10 Mar 2020 22:43:46 -0500
Message-Id: <20200311034351.1275197-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200303190318.522103-1-jason@jlekstrand.net>
References: <20200303190318.522103-1-jason@jlekstrand.net>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, Richard Fontana <rfontana@redhat.com>,
 Jason Ekstrand <jason@jlekstrand.net>, jessehall@google.com,
 jajones@nvidia.com, Greg Hackmann <ghackmann@google.com>,
 Gustavo Padovan <gustavo@padovan.org>, airlied@redhat.com,
 linux-media@vger.kernel.org, daniels@collabora.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Chenbo Feng <fengc@google.com>, linaro-mm-sig@lists.linaro.org,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 linux-kernel@vger.kernel.org, hoegsberg@google.com, christian.koenig@amd.com
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
YS1mZW5jZS1hcnJheS5jCmluZGV4IGQzZmJkOTUwYmU5NC4uMmFjMWFmYzY5N2QwIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWFycmF5LmMKKysrIGIvZHJpdmVycy9kbWEt
YnVmL2RtYS1mZW5jZS1hcnJheS5jCkBAIC0yMDEsMyArMjAxLDMwIEBAIGJvb2wgZG1hX2ZlbmNl
X21hdGNoX2NvbnRleHQoc3RydWN0IGRtYV9mZW5jZSAqZmVuY2UsIHU2NCBjb250ZXh0KQogCXJl
dHVybiB0cnVlOwogfQogRVhQT1JUX1NZTUJPTChkbWFfZmVuY2VfbWF0Y2hfY29udGV4dCk7CisK
K3N0cnVjdCBkbWFfZmVuY2UgKmRtYV9mZW5jZV9hcnJheV9maXJzdChzdHJ1Y3QgZG1hX2ZlbmNl
ICpoZWFkKQoreworCXN0cnVjdCBkbWFfZmVuY2VfYXJyYXkgKmFycmF5OworCisJaWYgKCFoZWFk
KQorCQlyZXR1cm4gTlVMTDsKKworCWFycmF5ID0gdG9fZG1hX2ZlbmNlX2FycmF5KGhlYWQpOwor
CWlmICghYXJyYXkpCisJCXJldHVybiBoZWFkOworCisJcmV0dXJuIGFycmF5LT5mZW5jZXNbMF07
Cit9CitFWFBPUlRfU1lNQk9MKGRtYV9mZW5jZV9hcnJheV9maXJzdCk7CisKK3N0cnVjdCBkbWFf
ZmVuY2UgKmRtYV9mZW5jZV9hcnJheV9uZXh0KHN0cnVjdCBkbWFfZmVuY2UgKmhlYWQsCisJCQkJ
ICAgICAgIHVuc2lnbmVkIGludCBpbmRleCkKK3sKKwlzdHJ1Y3QgZG1hX2ZlbmNlX2FycmF5ICph
cnJheSA9IHRvX2RtYV9mZW5jZV9hcnJheShoZWFkKTsKKworCWlmICghYXJyYXkgfHwgaW5kZXgg
Pj0gYXJyYXktPm51bV9mZW5jZXMpCisJCXJldHVybiBOVUxMOworCisJcmV0dXJuIGFycmF5LT5m
ZW5jZXNbaW5kZXhdOworfQorRVhQT1JUX1NZTUJPTChkbWFfZmVuY2VfYXJyYXlfbmV4dCk7CmRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS1hcnJheS5oIGIvaW5jbHVkZS9saW51
eC9kbWEtZmVuY2UtYXJyYXkuaAppbmRleCAzMDNkZDcxMjIyMGYuLjU4OGFjODA4OWRkNiAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9saW51eC9kbWEtZmVuY2UtYXJyYXkuaAorKysgYi9pbmNsdWRlL2xp
bnV4L2RtYS1mZW5jZS1hcnJheS5oCkBAIC03NCw2ICs3NCwxOSBAQCB0b19kbWFfZmVuY2VfYXJy
YXkoc3RydWN0IGRtYV9mZW5jZSAqZmVuY2UpCiAJcmV0dXJuIGNvbnRhaW5lcl9vZihmZW5jZSwg
c3RydWN0IGRtYV9mZW5jZV9hcnJheSwgYmFzZSk7CiB9CiAKKy8qKgorICogZG1hX2ZlbmNlX2Fy
cmF5X2Zvcl9lYWNoIC0gaXRlcmF0ZSBvdmVyIGFsbCBmZW5jZXMgaW4gYXJyYXkKKyAqIEBmZW5j
ZTogY3VycmVudCBmZW5jZQorICogQGluZGV4OiBpbmRleCBpbnRvIHRoZSBhcnJheQorICogQGhl
YWQ6IHBvdGVudGlhbCBkbWFfZmVuY2VfYXJyYXkgb2JqZWN0CisgKgorICogVGVzdCBpZiBAYXJy
YXkgaXMgYSBkbWFfZmVuY2VfYXJyYXkgb2JqZWN0IGFuZCBpZiB5ZXMgaXRlcmF0ZSBvdmVyIGFs
bCBmZW5jZXMKKyAqIGluIHRoZSBhcnJheS4gSWYgbm90IGp1c3QgaXRlcmF0ZSBvdmVyIHRoZSBm
ZW5jZSBpbiBAYXJyYXkgaXRzZWxmLgorICovCisjZGVmaW5lIGRtYV9mZW5jZV9hcnJheV9mb3Jf
ZWFjaChmZW5jZSwgaW5kZXgsIGhlYWQpCQkJXAorCWZvciAoaW5kZXggPSAwLCBmZW5jZSA9IGRt
YV9mZW5jZV9hcnJheV9maXJzdChoZWFkKTsgZmVuY2U7CVwKKwkgICAgICsrKGluZGV4KSwgZmVu
Y2UgPSBkbWFfZmVuY2VfYXJyYXlfbmV4dChoZWFkLCBpbmRleCkpCisKIHN0cnVjdCBkbWFfZmVu
Y2VfYXJyYXkgKmRtYV9mZW5jZV9hcnJheV9jcmVhdGUoaW50IG51bV9mZW5jZXMsCiAJCQkJCSAg
ICAgICBzdHJ1Y3QgZG1hX2ZlbmNlICoqZmVuY2VzLAogCQkJCQkgICAgICAgdTY0IGNvbnRleHQs
IHVuc2lnbmVkIHNlcW5vLApAQCAtODEsNCArOTQsOCBAQCBzdHJ1Y3QgZG1hX2ZlbmNlX2FycmF5
ICpkbWFfZmVuY2VfYXJyYXlfY3JlYXRlKGludCBudW1fZmVuY2VzLAogCiBib29sIGRtYV9mZW5j
ZV9tYXRjaF9jb250ZXh0KHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlLCB1NjQgY29udGV4dCk7CiAK
K3N0cnVjdCBkbWFfZmVuY2UgKmRtYV9mZW5jZV9hcnJheV9maXJzdChzdHJ1Y3QgZG1hX2ZlbmNl
ICpoZWFkKTsKK3N0cnVjdCBkbWFfZmVuY2UgKmRtYV9mZW5jZV9hcnJheV9uZXh0KHN0cnVjdCBk
bWFfZmVuY2UgKmhlYWQsCisJCQkJICAgICAgIHVuc2lnbmVkIGludCBpbmRleCk7CisKICNlbmRp
ZiAvKiBfX0xJTlVYX0RNQV9GRU5DRV9BUlJBWV9IICovCi0tIAoyLjI0LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
