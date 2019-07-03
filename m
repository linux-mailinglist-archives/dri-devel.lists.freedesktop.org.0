Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471B15E1BF
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 12:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E6D89916;
	Wed,  3 Jul 2019 10:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1385 seconds by postgrey-1.36 at gabe;
 Wed, 03 Jul 2019 10:14:48 UTC
Received: from metanate.com (dougal.metanate.com [90.155.101.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C6789916
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 10:14:48 +0000 (UTC)
Received: from dougal.metanate.com ([192.168.88.1] helo=localhost.localdomain)
 by shrek.metanate.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 (envelope-from <john@metanate.com>)
 id 1hibvN-0007n1-RF; Wed, 03 Jul 2019 10:51:37 +0100
From: John Keeping <john@metanate.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/rockchip: fix VOP_WIN_GET macro
Date: Wed,  3 Jul 2019 10:51:11 +0100
Message-Id: <20190703095111.29117-1-john@metanate.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Authenticated: YES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=simple/simple; d=metanate.com; 
 s=stronger; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FsG5of+uogpMKIH8K3uyNKGNXBJ5USBikcfZgWGQm/8=; b=Jf++4RD1yPfm9SobiBV3MgNpmS
 vWHTVY7UHqkPY13KYgZmuoO6/Y+955jVvtN7gf5IUXWQMQkukydG+5Kb3SHDHfS1Vm694kVfYPFq1
 wcc80C34pPUEAzvBD2ueaqkZ24hYOaeuhWOm40tDlNMM5ozdSrJdqNGDgIGD9kuvwXVUb1VcfyHVR
 U0TxBB58FtOfVJje6m/LMlfXmeH9ZFe/V4IbVdZRm8zEDdRXmCUFnYh2ixYC189f+Dub2Z1w7cMsw
 /EJf/Ple/didf0VyGP4ueggdtGGPuAWH+1YwPHbtyFCTuQgzygWpmXDZ+qz+j1fCH4B/uyC/CS0b6
 0ysU255A==;
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
Cc: linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29tbWl0IDlhNjFjNTRiOWJmZiAoImRybS9yb2NrY2hpcDogdm9wOiBncm91cCB2b3AgcmVnaXN0
ZXJzIikgc2VlbXMgdG8KaGF2ZSB1bmludGVudGlvbmFsbHkgY2hhbmdlZCB0aGUgZGVmaW50aW9u
IG9mIHRoaXMgbWFjcm8uICBTaW5jZSBpdCBpcwp1bnVzZWQsIHRoaXMgd2FzIG5vdCBzcG90dGVk
IGJ1dCBhbnkgYXR0ZW1wdCB0byB1c2UgaXQgcmVzdWx0cyBpbgpjb21waWxhdGlvbiBlcnJvcnMu
CgpSZXZlcnQgdG8gdGhlIHByZXZpb3VzIGRlZmluaXRpb24uCgpGaXhlczogOWE2MWM1NGI5YmZm
ICgiZHJtL3JvY2tjaGlwOiB2b3A6IGdyb3VwIHZvcCByZWdpc3RlcnMiKQpTaWduZWQtb2ZmLWJ5
OiBKb2huIEtlZXBpbmcgPGpvaG5AbWV0YW5hdGUuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9y
b2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9j
a2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tj
aGlwX2RybV92b3AuYwppbmRleCAwOWE3OTBjMmYzYTEuLmEzNDMwZGEzYzAwOCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jCkBAIC03OSw3ICs3OSw3IEBA
CiAJCXZvcF9nZXRfaW50cl90eXBlKHZvcCwgJnZvcC0+ZGF0YS0+aW50ci0+bmFtZSwgdHlwZSkK
IAogI2RlZmluZSBWT1BfV0lOX0dFVCh2b3AsIHdpbiwgbmFtZSkgXAotCQl2b3BfcmVhZF9yZWco
dm9wLCB3aW4tPm9mZnNldCwgd2luLT5waHktPm5hbWUpCisJCXZvcF9yZWFkX3JlZyh2b3AsIHdp
bi0+YmFzZSwgJndpbi0+cGh5LT5uYW1lKQogCiAjZGVmaW5lIFZPUF9XSU5fSEFTX1JFRyh3aW4s
IG5hbWUpIFwKIAkoISEod2luLT5waHktPm5hbWUubWFzaykpCi0tIAoyLjIyLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
