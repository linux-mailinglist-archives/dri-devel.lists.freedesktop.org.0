Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE22F41AE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48AA96F863;
	Fri,  8 Nov 2019 08:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906266E4FF;
 Thu,  7 Nov 2019 19:39:48 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 6E11460D7E; Thu,  7 Nov 2019 19:39:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from cohens-linux.qualcomm.com (global_nat1_iad_fw.qualcomm.com
 [129.46.232.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: cohens@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0692E602DD;
 Thu,  7 Nov 2019 19:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0692E602DD
From: Steve Cohen <cohens@codeaurora.org>
To: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/3] drm: add driver hook for create blob limitations
Date: Thu,  7 Nov 2019 14:39:12 -0500
Message-Id: <1573155554-16248-2-git-send-email-cohens@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573155554-16248-1-git-send-email-cohens@codeaurora.org>
References: <1573155554-16248-1-git-send-email-cohens@codeaurora.org>
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1573155588;
 bh=31/b4Xs9G9WqSr6r3aTPk2Jthp+uBa6h73JY5NDZ6Bk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cvQV0+EMWyS8SxUON+6k9M++S2pEZOqW0G7a4mVVRNI2O2rykk5gsNBmjs6+sQdr/
 fFYkVRRPrKh/fIw0y3TcvLjzs141l3qjOWQ9H3tZLj1bH6baBeGIoL19xE89Qi4BQd
 UvXnpxJCCE4hJH9gkDy8n3uYHbcUc0tPX627p0xA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1573155588;
 bh=31/b4Xs9G9WqSr6r3aTPk2Jthp+uBa6h73JY5NDZ6Bk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cvQV0+EMWyS8SxUON+6k9M++S2pEZOqW0G7a4mVVRNI2O2rykk5gsNBmjs6+sQdr/
 fFYkVRRPrKh/fIw0y3TcvLjzs141l3qjOWQ9H3tZLj1bH6baBeGIoL19xE89Qi4BQd
 UvXnpxJCCE4hJH9gkDy8n3uYHbcUc0tPX627p0xA=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=cohens@codeaurora.org
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
Cc: adelva@google.com, Steve Cohen <cohens@codeaurora.org>,
 pdhaval@codeaurora.org, seanpaul@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsb3cgZHJpdmVycyB3aXRoIGJsb2IgbGltaXRhdGlvbnMgdG8gcnVuIGNoZWNrcyBiZWZvcmUg
YmxvYnMKYXJlIGNyZWF0ZWQuIFRoaXMgY2FuIGJlIHVzZWQgdG8gbGltaXQgaG93IG11Y2ggbWVt
b3J5IGNhbiBiZQphbGxvY2F0ZWQgYmFzZWQgb24gZHJpdmVyIHJlcXVpcmVtZW50cy4KClNpZ25l
ZC1vZmYtYnk6IFN0ZXZlIENvaGVuIDxjb2hlbnNAY29kZWF1cm9yYS5vcmc+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2RybV9wcm9wZXJ0eS5jIHwgNyArKysrKysrCiBpbmNsdWRlL2RybS9kcm1fZHJ2
LmggICAgICAgICAgfCA5ICsrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcm9wZXJ0eS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9wcm9wZXJ0eS5jCmluZGV4IDg5MmNlNjMuLjUwN2E4YTEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJvcGVydHkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX3Byb3BlcnR5LmMKQEAgLTc5Myw2ICs3OTMsMTMgQEAgaW50IGRybV9tb2RlX2NyZWF0ZWJs
b2JfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAlpZiAoIWRybV9jb3JlX2NoZWNrX2Zl
YXR1cmUoZGV2LCBEUklWRVJfTU9ERVNFVCkpCiAJCXJldHVybiAtRU9QTk9UU1VQUDsKIAorCWlm
IChkZXYtPmRyaXZlci0+Y3JlYXRlYmxvYl9jaGVjaykgeworCQlyZXQgPSBkZXYtPmRyaXZlci0+
Y3JlYXRlYmxvYl9jaGVjaygKKwkJCQlkZXYsIG91dF9yZXNwLT5sZW5ndGgsIGZpbGVfcHJpdik7
CisJCWlmIChyZXQpCisJCQlyZXR1cm4gcmV0OworCX0KKwogCWJsb2IgPSBkcm1fcHJvcGVydHlf
Y3JlYXRlX2Jsb2IoZGV2LCBvdXRfcmVzcC0+bGVuZ3RoLCBOVUxMKTsKIAlpZiAoSVNfRVJSKGJs
b2IpKQogCQlyZXR1cm4gUFRSX0VSUihibG9iKTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2Ry
bV9kcnYuaCBiL2luY2x1ZGUvZHJtL2RybV9kcnYuaAppbmRleCA4OTc2YWZlLi43M2IzOWI4OSAx
MDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Rydi5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9k
cnYuaApAQCAtNzc2LDYgKzc3NiwxNSBAQCBzdHJ1Y3QgZHJtX2RyaXZlciB7CiAJaW50ICgqZG1h
X3F1aWVzY2VudCkgKHN0cnVjdCBkcm1fZGV2aWNlICopOwogCWludCAoKmNvbnRleHRfZHRvcikg
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGludCBjb250ZXh0KTsKIAlpbnQgZGV2X3ByaXZfc2l6
ZTsKKworCS8qKgorCSAqIEBjcmVhdGVibG9iX2NoZWNrOiBkcml2ZXIgY2hlY2sgZm9yIGNyZWF0
aW5nIGJsb2IgcHJvcGVydGllcworCSAqCisJICogSG9vayBmb3IgY2hlY2tpbmcgYmxvYiBsaW1p
dGF0aW9ucyBpbXBvc2VkIGJ5IGRyaXZlcnMKKwkgKi8KKwlpbnQgKCpjcmVhdGVibG9iX2NoZWNr
KSAoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKKwkJCQkgc2l6ZV90IGxlbmd0aCwKKwkJCQkgc3Ry
dWN0IGRybV9maWxlICpmaWxlX3ByaXYpOwogfTsKIAogZXh0ZXJuIHVuc2lnbmVkIGludCBkcm1f
ZGVidWc7Ci0tIApUaGUgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMgYSBtZW1i
ZXIgb2YgdGhlIENvZGUgQXVyb3JhIEZvcnVtLAphIExpbnV4IEZvdW5kYXRpb24gQ29sbGFib3Jh
dGl2ZSBQcm9qZWN0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
