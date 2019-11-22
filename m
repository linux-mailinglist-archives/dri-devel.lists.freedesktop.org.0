Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3F7107B8C
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2019 00:39:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736296F547;
	Fri, 22 Nov 2019 23:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 450 seconds by postgrey-1.36 at gabe;
 Fri, 22 Nov 2019 23:39:38 UTC
Received: from a27-10.smtp-out.us-west-2.amazonses.com
 (a27-10.smtp-out.us-west-2.amazonses.com [54.240.27.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F626F547;
 Fri, 22 Nov 2019 23:39:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A71CEC76F67
From: Jordan Crouse <jcrouse@codeaurora.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v2 7/8] drm/msm/a6xx: Support split pagetables
Date: Fri, 22 Nov 2019 23:32:07 +0000
Message-ID: <0101016e95755ea3-e899c9a4-5a3a-4902-bfa3-307ae3f6909b-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574465484-7115-1-git-send-email-jcrouse@codeaurora.org>
References: <1574465484-7115-1-git-send-email-jcrouse@codeaurora.org>
X-SES-Outgoing: 2019.11.22-54.240.27.10
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574465527;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
 bh=81ys/5oVCzoSQIqDE8l251BF02aMdA0az+eobjsIwPs=;
 b=aPIFIjn4xIjMafjhzESuHxdvYc5VRWpeb+Z1U1XWGkCMcIzYY2bHXtPhG8uZ+c5q
 ASSknGDFdWmQMis0KnDCtNwlxzX3pS6nvulc5n2pknVTXuljEbKlWUU6TpVxXjb+QFh
 Y8FbACf211gOYnmyyGd0Vyt1Cywd9f+YcWRaPx1E=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574465527;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
 bh=81ys/5oVCzoSQIqDE8l251BF02aMdA0az+eobjsIwPs=;
 b=XMOc/wVZY61Ga/jSAFiAvp2DV3lsskeucKDv+RrhMkZR7EeGleHPdvA7ik0rDa3d
 5PmMMHv2Gkcufe9gwYuNVdhVLALRDSnq79PXvUQOP4JJrT71RlQjDkZqkvouxDqtxLJ
 piVd0qHyCgJF8wtbaUnoiERxRixjSLBHfEvaIm2Q=
X-Mailman-Original-Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 will@kernel.org, robin.murphy@arm.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mamta Shukla <mamtashukla555@gmail.com>,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXR0ZW1wdCB0byBlbmFibGUgc3BsaXQgcGFnZXRhYmxlcyBpZiB0aGUgYXJtLXNtbXUgZHJpdmVy
IHN1cHBvcnRzIGl0LgpUaGlzIHdpbGwgbW92ZSB0aGUgZGVmYXVsdCBhZGRyZXNzIHNwYWNlIGZy
b20gdGhlIGRlZmF1bHQgcmVnaW9uIHRvCnRoZSBhZGRyZXNzIHJhbmdlIGFzc2lnbmVkIHRvIFRU
QlIxLiBUaGUgYmVoYXZpb3Igc2hvdWxkIGJlIHRyYW5zcGFyZW50CnRvIHRoZSBkcml2ZXIgZm9y
IG5vdyBidXQgaXQgZ2V0cyB0aGUgZGVmYXVsdCBidWZmZXJzIG91dCBvZiB0aGUgd2F5CndoZW4g
d2Ugd2FudCB0byBzdGFydCBzd2FwcGluZyBUVEJSMCBmb3IgY29udGV4dC1zcGVjaWZpYyBwYWdl
dGFibGVzLgoKU2lnbmVkLW9mZi1ieTogSm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVyb3Jh
Lm9yZz4KLS0tCgogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUuYyB8IDQ2ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNDUgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vYWRyZW5vL2E2eHhfZ3B1LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dw
dS5jCmluZGV4IDVkYzBiMmMuLjk2YjNiMjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vYWRyZW5vL2E2eHhfZ3B1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4
eF9ncHUuYwpAQCAtODExLDYgKzgxMSw1MCBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBhNnh4X2dw
dV9idXN5KHN0cnVjdCBtc21fZ3B1ICpncHUpCiAJcmV0dXJuICh1bnNpZ25lZCBsb25nKWJ1c3lf
dGltZTsKIH0KIAorc3RhdGljIHN0cnVjdCBtc21fZ2VtX2FkZHJlc3Nfc3BhY2UgKgorYTZ4eF9j
cmVhdGVfYWRkcmVzc19zcGFjZShzdHJ1Y3QgbXNtX2dwdSAqZ3B1LCBzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQoreworCXN0cnVjdCBpb21tdV9kb21haW4gKmlvbW11ID0gaW9tbXVfZG9t
YWluX2FsbG9jKCZwbGF0Zm9ybV9idXNfdHlwZSk7CisJc3RydWN0IG1zbV9nZW1fYWRkcmVzc19z
cGFjZSAqYXNwYWNlOworCXN0cnVjdCBtc21fbW11ICptbXU7CisJdTY0IHN0YXJ0LCBzaXplOwor
CXUzMiB2YWwgPSAxOworCWludCByZXQ7CisKKwlpZiAoIWlvbW11KQorCQlyZXR1cm4gRVJSX1BU
UigtRU5PTUVNKTsKKworCS8qIFRyeSB0byByZXF1ZXN0IHNwbGl0IHBhZ2V0YWJsZXMgKi8KKwlp
b21tdV9kb21haW5fc2V0X2F0dHIoaW9tbXUsIERPTUFJTl9BVFRSX1NQTElUX1RBQkxFUywgJnZh
bCk7CisKKwltbXUgPSBtc21faW9tbXVfbmV3KCZwZGV2LT5kZXYsIGlvbW11KTsKKwlpZiAoSVNf
RVJSKG1tdSkpIHsKKwkJaW9tbXVfZG9tYWluX2ZyZWUoaW9tbXUpOworCQlyZXR1cm4gRVJSX0NB
U1QobW11KTsKKwl9CisKKwkvKiBDaGVjayB0byBzZWUgaWYgc3BsaXQgcGFnZXRhYmxlcyB3ZXJl
IHN1Y2Nlc3NmdWwgKi8KKwlyZXQgPSBpb21tdV9kb21haW5fZ2V0X2F0dHIoaW9tbXUsIERPTUFJ
Tl9BVFRSX1NQTElUX1RBQkxFUywgJnZhbCk7CisJaWYgKCFyZXQgJiYgdmFsKSB7CisJCS8qCisJ
CSAqIFRoZSBhcGVydHVyZSBzdGFydCB3aWxsIGJlIGF0IHRoZSBiZWdpbm5pbmcgb2YgdGhlIFRU
QlIxCisJCSAqIHNwYWNlIHNvIHVzZSB0aGF0IGFzIGEgYmFzZQorCQkgKi8KKwkJc3RhcnQgPSBp
b21tdS0+Z2VvbWV0cnkuYXBlcnR1cmVfc3RhcnQ7CisJCXNpemUgPSAweGZmZmZmZmZmOworCX0g
ZWxzZSB7CisJCS8qIE90aGVyd2lzZSB1c2UgdGhlIGxlZ2FjeSAzMiBiaXQgcmVnaW9uICovCisJ
CXN0YXJ0ID0gU1pfMTZNOworCQlzaXplID0gMHhmZmZmZmZmZiAtIFNaXzE2TTsKKwl9CisKKwlh
c3BhY2UgPSBtc21fZ2VtX2FkZHJlc3Nfc3BhY2VfY3JlYXRlKG1tdSwgImdwdSIsIHN0YXJ0LCBz
aXplKTsKKwlpZiAoSVNfRVJSKGFzcGFjZSkpCisJCWlvbW11X2RvbWFpbl9mcmVlKGlvbW11KTsK
KworCXJldHVybiBhc3BhY2U7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYWRyZW5vX2dwdV9m
dW5jcyBmdW5jcyA9IHsKIAkuYmFzZSA9IHsKIAkJLmdldF9wYXJhbSA9IGFkcmVub19nZXRfcGFy
YW0sCkBAIC04MzIsNyArODc2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhZHJlbm9fZ3B1X2Z1
bmNzIGZ1bmNzID0gewogI2lmIGRlZmluZWQoQ09ORklHX0RSTV9NU01fR1BVX1NUQVRFKQogCQku
Z3B1X3N0YXRlX2dldCA9IGE2eHhfZ3B1X3N0YXRlX2dldCwKIAkJLmdwdV9zdGF0ZV9wdXQgPSBh
Nnh4X2dwdV9zdGF0ZV9wdXQsCi0JCS5jcmVhdGVfYWRkcmVzc19zcGFjZSA9IGFkcmVub19pb21t
dV9jcmVhdGVfYWRkcmVzc19zcGFjZSwKKwkJLmNyZWF0ZV9hZGRyZXNzX3NwYWNlID0gYTZ4eF9j
cmVhdGVfYWRkcmVzc19zcGFjZSwKICNlbmRpZgogCX0sCiAJLmdldF90aW1lc3RhbXAgPSBhNnh4
X2dldF90aW1lc3RhbXAsCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
