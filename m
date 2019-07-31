Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2417C1E6
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 14:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCED389DB0;
	Wed, 31 Jul 2019 12:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3C389DB0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 12:44:10 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C0D92089E;
 Wed, 31 Jul 2019 12:44:09 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org, Richard Gong <richard.gong@linux.intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 03/10] input: keyboard: gpio_keys: convert platform driver
 to use dev_groups
Date: Wed, 31 Jul 2019 14:43:42 +0200
Message-Id: <20190731124349.4474-4-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731124349.4474-1-gregkh@linuxfoundation.org>
References: <20190731124349.4474-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564577050;
 bh=9QHmlV3UC/Ih0nbNZ6S7QqAFc2A/UoarGKig2YK8eAI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sLmDhPMnwFa4bHwcL2y6xpUezufEHiDE7DhS2/7BfgfJWrIEYEYxH31VTQZEIsdIt
 YT+n/CCuy3wNxsvj2858TbE4QSuC4Sv1tSJpwLGWfyh3dJGiqycRYEnlAVsUUETR2P
 TcU5hYJ8Zp+lZ71ompEcetmnfk4b3G+DjeC9Iog8=
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGxhdGZvcm0gZHJpdmVycyBub3cgaGF2ZSB0aGUgb3B0aW9uIHRvIGhhdmUgdGhlIHBsYXRmb3Jt
IGNvcmUgY3JlYXRlCmFuZCByZW1vdmUgYW55IG5lZWRlZCBzeXNmcyBhdHRyaWJ1dGUgZmlsZXMu
ICBTbyB0YWtlIGFkdmFudGFnZSBvZiB0aGF0CmFuZCBkbyBub3QgcmVnaXN0ZXIgImJ5IGhhbmQi
IGEgYnVuY2ggb2Ygc3lzZnMgZmlsZXMuCgpDYzogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8
Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEdyZWcg
S3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Ci0tLQogZHJpdmVycy9p
bnB1dC9rZXlib2FyZC9ncGlvX2tleXMuYyB8IDEzICsrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvaW5wdXQva2V5Ym9hcmQvZ3Bpb19rZXlzLmMgYi9kcml2ZXJzL2lucHV0L2tleWJvYXJkL2dw
aW9fa2V5cy5jCmluZGV4IDAzZjRkMTUyZjZiNy4uMTM3M2RjNWIwNzY1IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2lucHV0L2tleWJvYXJkL2dwaW9fa2V5cy5jCisrKyBiL2RyaXZlcnMvaW5wdXQva2V5
Ym9hcmQvZ3Bpb19rZXlzLmMKQEAgLTM1MSwxMCArMzUxLDcgQEAgc3RhdGljIHN0cnVjdCBhdHRy
aWJ1dGUgKmdwaW9fa2V5c19hdHRyc1tdID0gewogCSZkZXZfYXR0cl9kaXNhYmxlZF9zd2l0Y2hl
cy5hdHRyLAogCU5VTEwsCiB9OwotCi1zdGF0aWMgY29uc3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91
cCBncGlvX2tleXNfYXR0cl9ncm91cCA9IHsKLQkuYXR0cnMgPSBncGlvX2tleXNfYXR0cnMsCi19
OworQVRUUklCVVRFX0dST1VQUyhncGlvX2tleXMpOwogCiBzdGF0aWMgdm9pZCBncGlvX2tleXNf
Z3Bpb19yZXBvcnRfZXZlbnQoc3RydWN0IGdwaW9fYnV0dG9uX2RhdGEgKmJkYXRhKQogewpAQCAt
ODUxLDEzICs4NDgsNiBAQCBzdGF0aWMgaW50IGdwaW9fa2V5c19wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQogCiAJZndub2RlX2hhbmRsZV9wdXQoY2hpbGQpOwogCi0JZXJyb3Ig
PSBkZXZtX2RldmljZV9hZGRfZ3JvdXAoZGV2LCAmZ3Bpb19rZXlzX2F0dHJfZ3JvdXApOwotCWlm
IChlcnJvcikgewotCQlkZXZfZXJyKGRldiwgIlVuYWJsZSB0byBleHBvcnQga2V5cy9zd2l0Y2hl
cywgZXJyb3I6ICVkXG4iLAotCQkJZXJyb3IpOwotCQlyZXR1cm4gZXJyb3I7Ci0JfQotCiAJZXJy
b3IgPSBpbnB1dF9yZWdpc3Rlcl9kZXZpY2UoaW5wdXQpOwogCWlmIChlcnJvcikgewogCQlkZXZf
ZXJyKGRldiwgIlVuYWJsZSB0byByZWdpc3RlciBpbnB1dCBkZXZpY2UsIGVycm9yOiAlZFxuIiwK
QEAgLTEwMjYsNiArMTAxNiw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGdwaW9f
a2V5c19kZXZpY2VfZHJpdmVyID0gewogCQkubmFtZQk9ICJncGlvLWtleXMiLAogCQkucG0JPSAm
Z3Bpb19rZXlzX3BtX29wcywKIAkJLm9mX21hdGNoX3RhYmxlID0gZ3Bpb19rZXlzX29mX21hdGNo
LAorCQkuZGV2X2dyb3Vwcwk9IGdwaW9fa2V5c19ncm91cHMsCiAJfQogfTsKIAotLSAKMi4yMi4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
