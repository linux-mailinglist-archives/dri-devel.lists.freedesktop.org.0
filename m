Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70802A825D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 14:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B67C898C6;
	Wed,  4 Sep 2019 12:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1956E898C6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 12:31:40 +0000 (UTC)
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i5URk-0005Vd-QN; Wed, 04 Sep 2019 12:31:36 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3017C2742B45; Wed,  4 Sep 2019 13:31:36 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Qiang Yu <yuq825@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/lima: Fix regulator_get_optional() misuse
Date: Wed,  4 Sep 2019 13:31:29 +0100
Message-Id: <20190904123129.23351-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GJQS4gJTNCVjRGvUWvcmKFiWyiK9BNAlq0ggTUPKG2o=; b=ouXJU2+HFB3fD9w9XNx7iYXQr
 uN9s5R5ySnQlfrHgHJtW/lRO1ROvRY5xiDQmCHnlKS3j4a9r8TsviII2WkgFg4GFMVnNSATisBxuw
 pXvCkBVR7AmBNyWHxdmMp3pW11wKlBXQXUplxXLcPjvA9NWQa2HkTjp9Vh9IXJ4WnG7D4=;
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
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGxpbWEgZHJpdmVyIHJlcXVlc3RzIGEgc3VwcGx5IHVzaW5nIHJlZ3VsYXRvcl9nZXRfb3B0
aW9uYWwoKSBidXQKYm90aCB0aGUgbmFtZSBvZiB0aGUgc3VwcGx5IGFuZCB0aGUgdXNhZ2UgcGF0
dGVybiBzdWdnZXN0IHRoYXQgaXQgaXMKYmVpbmcgdXNlZCBmb3IgdGhlIG1haW4gcG93ZXIgZm9y
IHRoZSBkZXZpY2UgYW5kIGlzIG5vdCBhdCBhbGwgb3B0aW9uYWwKZm9yIHRoZSBkZXZpY2UgZm9y
IGZ1bmN0aW9uLCB0aGVyZSBpcyBubyBtZWFuaW5nZnVsIGhhbmRsaW5nIGZvciBhYnNlbnQKc3Vw
cGxpZXMuICBTdWNoIHJlZ3VsYXRvcnMgc2hvdWxkIHVzZSB0aGUgdmFuaWxsYSByZWd1bGF0b3Jf
Z2V0KCkKaW50ZXJmYWNlLCBpdCB3aWxsIGVuc3VyZSB0aGF0IGV2ZW4gaWYgYSBzdXBwbHkgaXMg
bm90IGRlc2NyaWJlZCBpbiB0aGUKc3lzdGVtIGludGVncmF0aW9uIG9uZSB3aWxsIGJlIHByb3Zp
ZGVkIGluIHNvZnR3YXJlLgoKU2lnbmVkLW9mZi1ieTogTWFyayBCcm93biA8YnJvb25pZUBrZXJu
ZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZGV2aWNlLmMgfCA4ICsrLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZGV2aWNlLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbGltYS9saW1hX2RldmljZS5jCmluZGV4IGQ4NmI4ZDgxYTQ4My4uZDcxOGFjNzBkZjFl
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2RldmljZS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZGV2aWNlLmMKQEAgLTE0MiwxMiArMTQyLDkgQEAgc3Rh
dGljIGludCBsaW1hX3JlZ3VsYXRvcl9pbml0KHN0cnVjdCBsaW1hX2RldmljZSAqZGV2KQogewog
CWludCByZXQ7CiAKLQlkZXYtPnJlZ3VsYXRvciA9IGRldm1fcmVndWxhdG9yX2dldF9vcHRpb25h
bChkZXYtPmRldiwgIm1hbGkiKTsKKwlkZXYtPnJlZ3VsYXRvciA9IGRldm1fcmVndWxhdG9yX2dl
dChkZXYtPmRldiwgIm1hbGkiKTsKIAlpZiAoSVNfRVJSKGRldi0+cmVndWxhdG9yKSkgewogCQly
ZXQgPSBQVFJfRVJSKGRldi0+cmVndWxhdG9yKTsKLQkJZGV2LT5yZWd1bGF0b3IgPSBOVUxMOwot
CQlpZiAocmV0ID09IC1FTk9ERVYpCi0JCQlyZXR1cm4gMDsKIAkJaWYgKHJldCAhPSAtRVBST0JF
X0RFRkVSKQogCQkJZGV2X2VycihkZXYtPmRldiwgImZhaWxlZCB0byBnZXQgcmVndWxhdG9yOiAl
ZFxuIiwgcmV0KTsKIAkJcmV0dXJuIHJldDsKQEAgLTE2NCw4ICsxNjEsNyBAQCBzdGF0aWMgaW50
IGxpbWFfcmVndWxhdG9yX2luaXQoc3RydWN0IGxpbWFfZGV2aWNlICpkZXYpCiAKIHN0YXRpYyB2
b2lkIGxpbWFfcmVndWxhdG9yX2Zpbmkoc3RydWN0IGxpbWFfZGV2aWNlICpkZXYpCiB7Ci0JaWYg
KGRldi0+cmVndWxhdG9yKQotCQlyZWd1bGF0b3JfZGlzYWJsZShkZXYtPnJlZ3VsYXRvcik7CisJ
cmVndWxhdG9yX2Rpc2FibGUoZGV2LT5yZWd1bGF0b3IpOwogfQogCiBzdGF0aWMgaW50IGxpbWFf
aW5pdF9pcChzdHJ1Y3QgbGltYV9kZXZpY2UgKmRldiwgaW50IGluZGV4KQotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
