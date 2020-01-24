Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 089A7148F76
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 21:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF296E027;
	Fri, 24 Jan 2020 20:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F8B6E030
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 20:42:01 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 20000575-1500050 
 for multiple; Fri, 24 Jan 2020 20:41:50 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu: Reduce global locking around filp release
Date: Fri, 24 Jan 2020 20:41:48 +0000
Message-Id: <20200124204149.550337-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIGxhcmdlbHkgbGVnYWN5IHJlYXNvbnMsIGEgZ2xvYmFsIG11dGV4IChkcm1fZ2xvYmFsX211
dGV4KSBpcyB0YWtlbgphcm91bmQgb3Blbi9jbG9zZSBvZiB0aGUgZHJtX2RldmljZSwgaW5jbHVk
aW5nIHNlcmlhbGlzaW5nIHRoZSBmaWxwCnJlbGVhc2UuIEZvciBkcml2ZXJzIHdpdGggdGhlaXIg
b3duIGZpbmUgZ3JhaW5lZCBsb2NraW5nLCBzdWNoIGdsb2JhbApjb29yZGluYXRpb24gaXMgYSBo
aW5kcmFuY2UsIGFsYmVpdCBvZmYgdGhlIGNvbW1vbiBob3QgcGF0aHMuCgpSZWZlcmVuY2VzOiA3
YTJjNjVkZDMyYjEgKCJkcm06IFJlbGVhc2UgZmlscCBiZWZvcmUgZ2xvYmFsIGxvY2siKQpTaWdu
ZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6IEFs
ZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPgpDYzogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kcnYuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwppbmRleCA5
NGUyZmQ3NThlMDEuLjliY2U5Y2ZhOTgyZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kcnYuYwpAQCAtMTM1MSw3ICsxMzUxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxl
X29wZXJhdGlvbnMgYW1kZ3B1X2RyaXZlcl9rbXNfZm9wcyA9IHsKIAkub3duZXIgPSBUSElTX01P
RFVMRSwKIAkub3BlbiA9IGRybV9vcGVuLAogCS5mbHVzaCA9IGFtZGdwdV9mbHVzaCwKLQkucmVs
ZWFzZSA9IGRybV9yZWxlYXNlLAorCS5yZWxlYXNlID0gZHJtX3JlbGVhc2Vfbm9nbG9iYWwsCiAJ
LnVubG9ja2VkX2lvY3RsID0gYW1kZ3B1X2RybV9pb2N0bCwKIAkubW1hcCA9IGFtZGdwdV9tbWFw
LAogCS5wb2xsID0gZHJtX3BvbGwsCi0tIAoyLjI1LjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
