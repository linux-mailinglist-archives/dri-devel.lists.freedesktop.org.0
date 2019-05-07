Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4E816B12
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 21:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123706E836;
	Tue,  7 May 2019 19:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907F76E836;
 Tue,  7 May 2019 19:18:21 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 335CA6141D; Tue,  7 May 2019 19:18:19 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0104B6122D;
 Tue,  7 May 2019 19:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0104B6122D
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 2/3] drm/msm/dpu: Avoid a null de-ref while recovering from
 kms init fail
Date: Tue,  7 May 2019 13:18:10 -0600
Message-Id: <1557256691-25798-3-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557256691-25798-1-git-send-email-jcrouse@codeaurora.org>
References: <1557256691-25798-1-git-send-email-jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1557256701;
 bh=WmAf8oFe6jYa0ZDJBfWK83oRQDbYixmX8SwEtCrRmRo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J842SbsUNGi43C0ZcefrYcJAiKXgRAnvHSM0h2ZOqg8w+7YClM78psIZJAGY3upmp
 q7JVB7RHaUL40Rj47pWB7X7NyTx1QzB8GtFzoMHEXCxFBsHysxQQyXiA69WfLNzi6w
 JDYnTGF+al7zS/gEi+RBS9Ru3ERax3UiARkP9DIY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1557256699;
 bh=WmAf8oFe6jYa0ZDJBfWK83oRQDbYixmX8SwEtCrRmRo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BP4m2EGtwQ8mxr/7UXXTDo0zZpiO9oFVEL2ql5XL1QYVf9ODAftOh7G6S6cqnbSaq
 TeTOu6iI9vOdnEEztUWhRqh8oD6Q69YQwxA7RTMhQJ0rJ7mlCvcEd+p0bT+btJU8C8
 DLcJTnL0Ih4V7/1pLLW3Cdw515RoChoUMRR0JL2k=
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
 Bruce Wang <bzwang@chromium.org>, Sean Paul <sean@poorly.run>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gdGhlIGZhaWx1cmUgcGF0aCBmb3IgZHB1X2ttc19pbml0KCkgaXQgaXMgcG9zc2libGUgdG8g
Z2V0IHRvIHRoZSBNTVUKZGVzdHJveSBmdW5jdGlvbiB3aXRoIHVuaW5pdGlhbGl6ZWQgTU1VIHN0
cnVjdHMuIENoZWNrIGZvciBOVUxsIGFuZCBza2lwCmlmIG5lZWRlZC4KClNpZ25lZC1vZmYtYnk6
IEpvcmRhbiBDcm91c2UgPGpjcm91c2VAY29kZWF1cm9yYS5vcmc+Ci0tLQoKIGRyaXZlcnMvZ3B1
L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYyB8IDkgKysrKysrLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlz
cC9kcHUxL2RwdV9rbXMuYwppbmRleCA4ODViZjg4Li4xYmVhZjI5IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jCkBAIC01Niw3ICs1Niw3IEBAIHN0YXRpYyBjb25zdCBj
aGFyICogY29uc3QgaW9tbXVfcG9ydHNbXSA9IHsKICNkZWZpbmUgRFBVX0RFQlVHRlNfSFdNQVNL
TkFNRSAiaHdfbG9nX21hc2siCiAKIHN0YXRpYyBpbnQgZHB1X2ttc19od19pbml0KHN0cnVjdCBt
c21fa21zICprbXMpOwotc3RhdGljIGludCBfZHB1X2ttc19tbXVfZGVzdHJveShzdHJ1Y3QgZHB1
X2ttcyAqZHB1X2ttcyk7CitzdGF0aWMgdm9pZCBfZHB1X2ttc19tbXVfZGVzdHJveShzdHJ1Y3Qg
ZHB1X2ttcyAqZHB1X2ttcyk7CiAKIHN0YXRpYyB1bnNpZ25lZCBsb25nIGRwdV9pb21hcF9zaXpl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCiAJCQkJICAgIGNvbnN0IGNoYXIgKm5hbWUp
CkBAIC03MjUsMTcgKzcyNSwyMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1zbV9rbXNfZnVuY3Mg
a21zX2Z1bmNzID0gewogI2VuZGlmCiB9OwogCi1zdGF0aWMgaW50IF9kcHVfa21zX21tdV9kZXN0
cm95KHN0cnVjdCBkcHVfa21zICpkcHVfa21zKQorc3RhdGljIHZvaWQgX2RwdV9rbXNfbW11X2Rl
c3Ryb3koc3RydWN0IGRwdV9rbXMgKmRwdV9rbXMpCiB7CiAJc3RydWN0IG1zbV9tbXUgKm1tdTsK
IAorCWlmICghZHB1X2ttcy0+YmFzZS5hc3BhY2UpCisJCXJldHVybjsKKwogCW1tdSA9IGRwdV9r
bXMtPmJhc2UuYXNwYWNlLT5tbXU7CiAKIAltbXUtPmZ1bmNzLT5kZXRhY2gobW11LCAoY29uc3Qg
Y2hhciAqKilpb21tdV9wb3J0cywKIAkJCUFSUkFZX1NJWkUoaW9tbXVfcG9ydHMpKTsKIAltc21f
Z2VtX2FkZHJlc3Nfc3BhY2VfcHV0KGRwdV9rbXMtPmJhc2UuYXNwYWNlKTsKIAotCXJldHVybiAw
OworCWRwdV9rbXMtPmJhc2UuYXNwYWNlID0gTlVMTDsKIH0KIAogc3RhdGljIGludCBfZHB1X2tt
c19tbXVfaW5pdChzdHJ1Y3QgZHB1X2ttcyAqZHB1X2ttcykKLS0gCjIuNy40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
