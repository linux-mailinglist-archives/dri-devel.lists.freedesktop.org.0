Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 071D3DDF8E
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 18:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78ECE8999A;
	Sun, 20 Oct 2019 16:43:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3759C8991E;
 Sun, 20 Oct 2019 16:43:52 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 18904091-1500050 
 for multiple; Sun, 20 Oct 2019 17:43:46 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] dma-buf: Report signaled links inside dma-fence-chain
Date: Sun, 20 Oct 2019 17:43:42 +0100
Message-Id: <20191020164343.11233-2-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.24.0.rc0
In-Reply-To: <20191020164343.11233-1-chris@chris-wilson.co.uk>
References: <20191020164343.11233-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbmV2ZXIgd2Ugd2FsayBhbG9uZyB0aGUgZG1hLWZlbmNlLWNoYWluLCB3ZSBwcnVuZSBzaWdu
YWxlZCBsaW5rcyB0bwprZWVwIHRoZSBjaGFpbiBuaWNlIGFuZCB0aWR5LiBUaGlzIGxlYWRzIHRv
IHNpdHVhdGlvbnMgd2hlcmUgd2UgY2FuCnBydW5lIGEgbGluayBhbmQgcmVwb3J0IHRoZSBlYXJs
aWVyIGZlbmNlIGFzIHRoZSB0YXJnZXQgc2Vxbm8gLS0KdmlvbGF0aW5nIG91ciBvd24gY29uc2lz
dGVuY3kgY2hlY2tzIHRoYXQgdGhlIHNlcW5vIGlzIG5vdCBtb3JlIGFkdmFuY2VkCnRoYW4gdGhl
IGxhc3QgZWxlbWVudCBpbiBhIGRtYS1mZW5jZS1jaGFpbi4KClJlcG9ydCBhIE5VTEwgZmVuY2Ug
YW5kIHN1Y2Nlc3MgaWYgdGhlIHNlcW5vIGhhcyBhbHJlYWR5IGJlZW4gc2lnbmFsZWQuCgpTaWdu
ZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLS0tCiBk
cml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWNoYWluLmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVu
Y2UtY2hhaW4uYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtY2hhaW4uYwppbmRleCAzZDEy
MzUwMmZmMTIuLjVkZDRlOWE2ZGRlZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1m
ZW5jZS1jaGFpbi5jCisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtY2hhaW4uYwpAQCAt
OTksNiArOTksMTIgQEAgaW50IGRtYV9mZW5jZV9jaGFpbl9maW5kX3NlcW5vKHN0cnVjdCBkbWFf
ZmVuY2UgKipwZmVuY2UsIHVpbnQ2NF90IHNlcW5vKQogCQlyZXR1cm4gLUVJTlZBTDsKIAogCWRt
YV9mZW5jZV9jaGFpbl9mb3JfZWFjaCgqcGZlbmNlLCAmY2hhaW4tPmJhc2UpIHsKKwkJaWYgKCgq
cGZlbmNlKS0+c2Vxbm8gPCBzZXFubykgeyAvKiBhbHJlYWR5IHNpZ25hbGVkICovCisJCQlkbWFf
ZmVuY2VfcHV0KCpwZmVuY2UpOworCQkJKnBmZW5jZSA9IE5VTEw7CisJCQlicmVhazsKKwkJfQor
CiAJCWlmICgoKnBmZW5jZSktPmNvbnRleHQgIT0gY2hhaW4tPmJhc2UuY29udGV4dCB8fAogCQkg
ICAgdG9fZG1hX2ZlbmNlX2NoYWluKCpwZmVuY2UpLT5wcmV2X3NlcW5vIDwgc2Vxbm8pCiAJCQli
cmVhazsKLS0gCjIuMjQuMC5yYzAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
