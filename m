Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E8726C446
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 17:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB37D6EA3F;
	Wed, 16 Sep 2020 15:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F5B6EA3F;
 Wed, 16 Sep 2020 15:35:04 +0000 (UTC)
IronPort-SDR: RxhCcpbAmA+ZfzS99QUXgfvDb+TW+h396GUljr/9UMt3HaYnAIKgaNW0/kMnRxXFwMSupPQXki
 Yuqsi22hfBtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="160421588"
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="160421588"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 08:35:03 -0700
IronPort-SDR: qm/j2McsRoMnQcKfUSm76OLkWDZRwnDbmvi2SvVXXWrQ0P6qjOy8GxiZTnd2fdZAzTxpHk03XC
 uMOd4XiTpo3Q==
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="307081629"
Received: from karthik-2012-client-platform.iind.intel.com ([10.223.74.217])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 16 Sep 2020 08:34:58 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 2/8] drm/i915: Add support for async flips in I915
Date: Wed, 16 Sep 2020 20:38:18 +0530
Message-Id: <20200916150824.15749-3-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200916150824.15749-1-karthik.b.s@intel.com>
References: <20200916150824.15749-1-karthik.b.s@intel.com>
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
Cc: paulo.r.zanoni@intel.com, michel@daenzer.net,
 Karthik B S <karthik.b.s@intel.com>, dri-devel@lists.freedesktop.org,
 vandita.kulkarni@intel.com, uma.shankar@intel.com, daniel.vetter@intel.com,
 nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2V0IHRoZSBBc3luYyBBZGRyZXNzIFVwZGF0ZSBFbmFibGUgYml0IGluIHBsYW5lIGN0bAp3aGVu
IGFzeW5jIGZsaXAgaXMgcmVxdWVzdGVkLgoKdjI6IC1Nb3ZlIHRoZSBBc3luYyBmbGlwIGVuYWJs
ZW1lbnQgdG8gaW5kaXZpZHVhbCBwYXRjaCAoUGF1bG8pCgp2MzogLVJlYmFzZWQuCgp2NDogLUFk
ZCBzZXBhcmF0ZSBwbGFuZSBob29rIGZvciBhc3luYyBmbGlwIGNhc2UgKFZpbGxlKQoKdjU6IC1S
ZWJhc2VkLgoKdjY6IC1Nb3ZlIHRoZSBwbGFuZSBob29rIHRvIHNlcGFyYXRlIHBhdGNoLiAoUGF1
bG8pCiAgICAtUmVtb3ZlIHRoZSBlYXJseSByZXR1cm4gaW4gc2tsX3BsYW5lX2N0bC4gKFBhdWxv
KQoKdjc6IC1Nb3ZlIGFzeW5jIGFkZHJlc3MgdXBkYXRlIGVuYWJsZSB0byBza2xfcGxhbmVfY3Rs
X2NydGMoKSAoVmlsbGUpCgp2ODogLVJlYmFzZWQuCgp2OTogLVJlYmFzZWQuCgpTaWduZWQtb2Zm
LWJ5OiBLYXJ0aGlrIEIgUyA8a2FydGhpay5iLnNAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBW
YW5kaXRhIEt1bGthcm5pIDx2YW5kaXRhLmt1bGthcm5pQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6
IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgfCAzICsrKwogZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaCAgICAgICAgICAgICAgfCAxICsKIDIgZmlsZXMgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2Rpc3BsYXkuYwppbmRleCA4OTZmNmQzY2FiNDQuLjYyN2FlYWViZjk0ZiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKQEAgLTQ3ODUsNiArNDc4
NSw5IEBAIHUzMiBza2xfcGxhbmVfY3RsX2NydGMoY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3Rh
dGUgKmNydGNfc3RhdGUpCiAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0gdG9f
aTkxNShjcnRjX3N0YXRlLT51YXBpLmNydGMtPmRldik7CiAJdTMyIHBsYW5lX2N0bCA9IDA7CiAK
KwlpZiAoY3J0Y19zdGF0ZS0+dWFwaS5hc3luY19mbGlwKQorCQlwbGFuZV9jdGwgfD0gUExBTkVf
Q1RMX0FTWU5DX0ZMSVA7CisKIAlpZiAoSU5URUxfR0VOKGRldl9wcml2KSA+PSAxMCB8fCBJU19H
RU1JTklMQUtFKGRldl9wcml2KSkKIAkJcmV0dXJuIHBsYW5lX2N0bDsKIApkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5
MTVfcmVnLmgKaW5kZXggZDgwNWQ0ZGE2MTgxLi5lOTRjYTFmOGY2YjIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
aTkxNV9yZWcuaApAQCAtNjkyMyw2ICs2OTIzLDcgQEAgZW51bSB7CiAjZGVmaW5lICAgUExBTkVf
Q1RMX1RJTEVEX1gJCQkoMSA8PCAxMCkKICNkZWZpbmUgICBQTEFORV9DVExfVElMRURfWQkJCSg0
IDw8IDEwKQogI2RlZmluZSAgIFBMQU5FX0NUTF9USUxFRF9ZRgkJCSg1IDw8IDEwKQorI2RlZmlu
ZSAgIFBMQU5FX0NUTF9BU1lOQ19GTElQCQkJKDEgPDwgOSkKICNkZWZpbmUgICBQTEFORV9DVExf
RkxJUF9IT1JJWk9OVEFMCQkoMSA8PCA4KQogI2RlZmluZSAgIFBMQU5FX0NUTF9NRURJQV9ERUNP
TVBSRVNTSU9OX0VOQUJMRQkoMSA8PCA0KSAvKiBUR0wrICovCiAjZGVmaW5lICAgUExBTkVfQ1RM
X0FMUEhBX01BU0sJCQkoMHgzIDw8IDQpIC8qIFByZS1HTEsgKi8KLS0gCjIuMjIuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
