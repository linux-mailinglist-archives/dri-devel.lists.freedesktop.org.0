Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A91816AF1
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 21:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1AE6E829;
	Tue,  7 May 2019 19:14:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DA36E7D7;
 Tue,  7 May 2019 19:14:16 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 4A18E60A33; Tue,  7 May 2019 19:14:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F3D8C609F3;
 Tue,  7 May 2019 19:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F3D8C609F3
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH] drm/atomic: Check that the config funcs exist drm_mode_alloc
Date: Tue,  7 May 2019 13:14:11 -0600
Message-Id: <1557256451-24950-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1557256456;
 bh=fOdzMX7nkWBq97wocFIszly8aNfD4psiyZU/x1LQois=;
 h=From:To:Cc:Subject:Date:From;
 b=R6OYhfE6g8aa0cZBAnPiB/JFrOV0itf15UMPQ2zQpb1LcYcCqEnPUmXHP+q9q8X/k
 LOcJCXJzysFIo2NHBF/6jWN+MGz6AP4IJgE4H4WznlEjalc1ls6Wr8iUsuK01+VOdN
 8Sb2mqcejGbeKAfbk0WhKQdKBNQnkojsZ148b6Mw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1557256455;
 bh=fOdzMX7nkWBq97wocFIszly8aNfD4psiyZU/x1LQois=;
 h=From:To:Cc:Subject:Date:From;
 b=lWdVLrBN2AlTjCxGhuxp6fugiuSz7j4xPZ5/SC/6JPZ8U8VBYDIfJQQ2CC9xVy0Wl
 Uxx2hU6ksXcgRdHfkc/HDBUMJyREpm1KoZLSbG8K/hPFGptuzRPc4PfVoNk5vrwWyW
 OSWFiOm9FHwznwXGv8ixPo8ZckrW1vBm4Qgmz4G8=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW4gZXJyb3Igd2hpbGUgaW5pdGlhbGl6aW5nIHRoZSBtc20gZHJpdmVyIGVuZHMgdXAgY2FsbGlu
Zwpkcm1fYXRvbWljX2hlbHBlcl9zaHV0ZG93bigpIHdpdGhvdXQgZmlyc3QgaW5pdGlhbGl6aW5n
IHRoZSBmdW5jcwppbiBtb2RlX2NvbmZpZy4gV2hpbGUgSSdtIG5vdCAxMDAlIHN1cmUgdGhpcyBp
c24ndCBhIG9yZGVyaW5nCnByb2JsZW0gaW4gbXNtIGFkZGluZyBhIGNoZWNrIHRvIGRybV9tb2Rl
X2FsbG9jIHNlZW1zIGxpa2UKYSBuaWNlIGFuZCBzYWZlIHNvbHV0aW9uLgoKU2lnbmVkLW9mZi1i
eTogSm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4KLS0tCgogZHJpdmVycy9n
cHUvZHJtL2RybV9hdG9taWMuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fYXRvbWljLmMKaW5kZXggNWViNDAxMy4uMTcyOTQyOCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0
b21pYy5jCkBAIC0xMTQsNiArMTE0LDkgQEAgZHJtX2F0b21pY19zdGF0ZV9hbGxvYyhzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2KQogewogCXN0cnVjdCBkcm1fbW9kZV9jb25maWcgKmNvbmZpZyA9ICZk
ZXYtPm1vZGVfY29uZmlnOwogCisJaWYgKCFjb25maWctPmZ1bmNzKQorCQlyZXR1cm4gTlVMTDsK
KwogCWlmICghY29uZmlnLT5mdW5jcy0+YXRvbWljX3N0YXRlX2FsbG9jKSB7CiAJCXN0cnVjdCBk
cm1fYXRvbWljX3N0YXRlICpzdGF0ZTsKIAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
