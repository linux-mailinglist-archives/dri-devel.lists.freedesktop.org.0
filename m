Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE275F4C8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 10:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447E36E303;
	Thu,  4 Jul 2019 08:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D146E303
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 08:46:42 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 626A0218A6;
 Thu,  4 Jul 2019 08:46:41 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] input: keyboard: gpio_keys: convert platform driver to
 use dev_groups
Date: Thu,  4 Jul 2019 10:46:16 +0200
Message-Id: <20190704084617.3602-11-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704084617.3602-1-gregkh@linuxfoundation.org>
References: <20190704084617.3602-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562230001;
 bh=/nscaZ8tOKoA1xhpKbG/KBNAKedrtqbPGjp5wJ1TSpQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I+DCsUahJo9iDLvMN0Xcu4HnNamjXiAT94J/+uj5N3iNe97RaB4mbBXXducoiirEQ
 9SeyP2XeHF8q+au1V8zq5T3zJ5GQXBFD9ndhdnYrrDIQRlPEFKdmUcbbvpsZ3DwoIv
 P5TLC/YESUEnwbFOB7AJWeQG22osfis4URZS4F78=
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
aW9fa2V5cy5jCmluZGV4IDZjZDE5OWU4YTM3MC4uMWY2NTQ3NDQwZWRiIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2lucHV0L2tleWJvYXJkL2dwaW9fa2V5cy5jCisrKyBiL2RyaXZlcnMvaW5wdXQva2V5
Ym9hcmQvZ3Bpb19rZXlzLmMKQEAgLTM1NCwxMCArMzU0LDcgQEAgc3RhdGljIHN0cnVjdCBhdHRy
aWJ1dGUgKmdwaW9fa2V5c19hdHRyc1tdID0gewogCSZkZXZfYXR0cl9kaXNhYmxlZF9zd2l0Y2hl
cy5hdHRyLAogCU5VTEwsCiB9OwotCi1zdGF0aWMgY29uc3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91
cCBncGlvX2tleXNfYXR0cl9ncm91cCA9IHsKLQkuYXR0cnMgPSBncGlvX2tleXNfYXR0cnMsCi19
OworQVRUUklCVVRFX0dST1VQUyhncGlvX2tleXMpOwogCiBzdGF0aWMgdm9pZCBncGlvX2tleXNf
Z3Bpb19yZXBvcnRfZXZlbnQoc3RydWN0IGdwaW9fYnV0dG9uX2RhdGEgKmJkYXRhKQogewpAQCAt
ODU2LDEzICs4NTMsNiBAQCBzdGF0aWMgaW50IGdwaW9fa2V5c19wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQogCiAJZndub2RlX2hhbmRsZV9wdXQoY2hpbGQpOwogCi0JZXJyb3Ig
PSBkZXZtX2RldmljZV9hZGRfZ3JvdXAoZGV2LCAmZ3Bpb19rZXlzX2F0dHJfZ3JvdXApOwotCWlm
IChlcnJvcikgewotCQlkZXZfZXJyKGRldiwgIlVuYWJsZSB0byBleHBvcnQga2V5cy9zd2l0Y2hl
cywgZXJyb3I6ICVkXG4iLAotCQkJZXJyb3IpOwotCQlyZXR1cm4gZXJyb3I7Ci0JfQotCiAJZXJy
b3IgPSBpbnB1dF9yZWdpc3Rlcl9kZXZpY2UoaW5wdXQpOwogCWlmIChlcnJvcikgewogCQlkZXZf
ZXJyKGRldiwgIlVuYWJsZSB0byByZWdpc3RlciBpbnB1dCBkZXZpY2UsIGVycm9yOiAlZFxuIiwK
QEAgLTEwMjUsNiArMTAxNSw3IEBAIHN0YXRpYyB2b2lkIGdwaW9fa2V5c19zaHV0ZG93bihzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogfQogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2Ry
aXZlciBncGlvX2tleXNfZGV2aWNlX2RyaXZlciA9IHsKKwkuZGV2X2dyb3Vwcwk9IGdwaW9fa2V5
c19ncm91cHMsCiAJLnByb2JlCQk9IGdwaW9fa2V5c19wcm9iZSwKIAkuc2h1dGRvd24JPSBncGlv
X2tleXNfc2h1dGRvd24sCiAJLmRyaXZlcgkJPSB7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
