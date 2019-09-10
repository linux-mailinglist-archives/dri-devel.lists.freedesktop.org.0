Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC994AF64D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 09:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248076EA24;
	Wed, 11 Sep 2019 07:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7516E03A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 21:29:51 +0000 (UTC)
Received: from p200300ccff17ef001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff17:ef00:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1i7nho-0001iz-W6; Tue, 10 Sep 2019 23:29:45 +0200
Received: from andi by aktux with local (Exim 4.92)
 (envelope-from <andreas@kemnade.info>)
 id 1i7nho-0004in-Nd; Tue, 10 Sep 2019 23:29:44 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
 robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 2/2] backlight: lm3630a: add an enable gpio for the HWEN pin
Date: Tue, 10 Sep 2019 23:29:09 +0200
Message-Id: <20190910212909.18095-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190910212909.18095-1-andreas@kemnade.info>
References: <20190910212909.18095-1-andreas@kemnade.info>
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Wed, 11 Sep 2019 07:01:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EuNSm48CMbzA/IOyJAJF78zX5ZK+bFhFwE66o29+ttQ=; b=kPrtb/y95jmQGogILCuqeK/ieR
 szk3ONSSsy88GSFSCb/u1L0EBiBo///bR+zB4zcHHdUzijuNRFLsBOsQWHgJLQiATAE4eBpcu2dcz
 v0TC140uevcbTCzFAdbQL25J/1W4mnF20l0W/61WItA4upYj2dTUpV4HLNlIrWgirCQw=;
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
Cc: Andreas Kemnade <andreas@kemnade.info>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIG5vdyBqdXN0IGVuYWJsZSBpdCBpbiB0aGUgcHJvYmUgZnVuY3Rpb24gdG8gYWxsb3cgaTJj
CmFjY2Vzcy4gRGlzYWJsaW5nIGFsc28gbWVhbnMgcmVzZXR0aW5nIHRoZSByZWdpc3RlciB2YWx1
ZXMKdG8gZGVmYXVsdCBhbmQgYWNjb3JkaW5nIHRvIHRoZSBkYXRhc2hlZXQgZG9lcyBub3QgZ2l2
ZQpwb3dlciBzYXZpbmdzCgpUZXN0ZWQgb24gS29ibyBDbGFyYSBIRC4KClNpZ25lZC1vZmYtYnk6
IEFuZHJlYXMgS2VtbmFkZSA8YW5kcmVhc0BrZW1uYWRlLmluZm8+Ci0tLQpjaGFuZ2VzIGluIHYy
OgotIHNpbXBsaWZpY2F0aW9uCi0gY29ycmVjdCBncGlvIGRpcmVjdGlvbiBpbml0aWFsaXNhdGlv
bgoKIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtMzYzMGFfYmwuYyB8IDEwICsrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92
aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0z
NjMwYV9ibC5jCmluZGV4IDhmODRmMzY4NGYwNC4uOWQwNjM5ZDQyMDJkIDEwMDY0NAotLS0gYS9k
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2JsLmMKKysrIGIvZHJpdmVycy92aWRlby9i
YWNrbGlnaHQvbG0zNjMwYV9ibC5jCkBAIC0xMiw2ICsxMiw4IEBACiAjaW5jbHVkZSA8bGludXgv
dWFjY2Vzcy5oPgogI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgogI2luY2x1ZGUgPGxpbnV4
L3JlZ21hcC5oPgorI2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4KKyNpbmNsdWRlIDxs
aW51eC9ncGlvLmg+CiAjaW5jbHVkZSA8bGludXgvcHdtLmg+CiAjaW5jbHVkZSA8bGludXgvcGxh
dGZvcm1fZGF0YS9sbTM2MzBhX2JsLmg+CiAKQEAgLTQ4LDYgKzUwLDcgQEAgc3RydWN0IGxtMzYz
MGFfY2hpcCB7CiAJc3RydWN0IGxtMzYzMGFfcGxhdGZvcm1fZGF0YSAqcGRhdGE7CiAJc3RydWN0
IGJhY2tsaWdodF9kZXZpY2UgKmJsZWRhOwogCXN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpibGVk
YjsKKwlzdHJ1Y3QgZ3Bpb19kZXNjICplbmFibGVfZ3BpbzsKIAlzdHJ1Y3QgcmVnbWFwICpyZWdt
YXA7CiAJc3RydWN0IHB3bV9kZXZpY2UgKnB3bWQ7CiB9OwpAQCAtNTM1LDYgKzUzOCwxMyBAQCBz
dGF0aWMgaW50IGxtMzYzMGFfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwKIAl9CiAJ
cGNoaXAtPnBkYXRhID0gcGRhdGE7CiAKKwlwY2hpcC0+ZW5hYmxlX2dwaW8gPSBkZXZtX2dwaW9k
X2dldF9vcHRpb25hbCgmY2xpZW50LT5kZXYsICJlbmFibGUiLAorCQkJCQkJR1BJT0RfT1VUX0hJ
R0gpOworCWlmIChJU19FUlIocGNoaXAtPmVuYWJsZV9ncGlvKSkgeworCQlydmFsID0gUFRSX0VS
UihwY2hpcC0+ZW5hYmxlX2dwaW8pOworCQlyZXR1cm4gcnZhbDsKKwl9CisKIAkvKiBjaGlwIGlu
aXRpYWxpemUgKi8KIAlydmFsID0gbG0zNjMwYV9jaGlwX2luaXQocGNoaXApOwogCWlmIChydmFs
IDwgMCkgewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
