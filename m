Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8387CDFEFB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 10:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5656E432;
	Tue, 22 Oct 2019 08:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECB36E436
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:05:56 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-h5_LunauPA-uTd6PBDMJPg-1; Tue, 22 Oct 2019 04:05:51 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95E5C2B7;
 Tue, 22 Oct 2019 08:05:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5878C5DA8D;
 Tue, 22 Oct 2019 08:05:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A75D09D72; Tue, 22 Oct 2019 10:05:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/virtio: move byteorder handling into
 virtio_gpu_cmd_transfer_to_host_2d function
Date: Tue, 22 Oct 2019 10:05:43 +0200
Message-Id: <20191022080546.19769-3-kraxel@redhat.com>
In-Reply-To: <20191022080546.19769-1-kraxel@redhat.com>
References: <20191022080546.19769-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: h5_LunauPA-uTd6PBDMJPg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571731555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HWju8v0ylZxHY2q8lIGnYZrlUnAZLYf6aSqluBMV1e4=;
 b=dJn2eEhau+exi4nYdLIK8NCwXRQ21q6v8wXPHAXBX11dqy266GxM+vFigK/zHtqOoip4HF
 hNrHs5KjPCv3dYAp5f3VQq+zhyp5qikBP21uyJJ/tYGRm6z+FTLGqFHEaMPQj2ckX56jTi
 boQnDgwqN9XwuaZ3nzkIvZHMIKcY9wk=
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QmUgY29uc2lzdGVudCB3aXRoIHRoZSByZXN0IG9mIHRoZSBjb2RlIGJhc2UuCk5vIGZ1bmN0aW9u
YWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oICAgfCAgNCArKy0t
CiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcGxhbmUuYyB8IDEyICsrKysrKy0tLS0t
LQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMgICAgfCAxMiArKysrKystLS0t
LS0KIDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oIGIvZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oCmluZGV4IDMxNGUwMmY5NGQ5Yy4uMGI1NmJh
MDA1ZTI1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oCkBAIC0yNjcsOCArMjY3
LDggQEAgdm9pZCB2aXJ0aW9fZ3B1X2NtZF91bnJlZl9yZXNvdXJjZShzdHJ1Y3QgdmlydGlvX2dw
dV9kZXZpY2UgKnZnZGV2LAogCQkJCSAgIHVpbnQzMl90IHJlc291cmNlX2lkKTsKIHZvaWQgdmly
dGlvX2dwdV9jbWRfdHJhbnNmZXJfdG9faG9zdF8yZChzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2Ug
KnZnZGV2LAogCQkJCQl1aW50NjRfdCBvZmZzZXQsCi0JCQkJCV9fbGUzMiB3aWR0aCwgX19sZTMy
IGhlaWdodCwKLQkJCQkJX19sZTMyIHgsIF9fbGUzMiB5LAorCQkJCQl1aW50MzJfdCB3aWR0aCwg
dWludDMyX3QgaGVpZ2h0LAorCQkJCQl1aW50MzJfdCB4LCB1aW50MzJfdCB5LAogCQkJCQlzdHJ1
Y3QgdmlydGlvX2dwdV9vYmplY3RfYXJyYXkgKm9ianMsCiAJCQkJCXN0cnVjdCB2aXJ0aW9fZ3B1
X2ZlbmNlICpmZW5jZSk7CiB2b2lkIHZpcnRpb19ncHVfY21kX3Jlc291cmNlX2ZsdXNoKHN0cnVj
dCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dmlydGlvL3ZpcnRncHVfcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9w
bGFuZS5jCmluZGV4IGY0YjczNjAyODJjZS4uMzkwNTI0MTQzMTM5IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcGxhbmUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
dmlydGlvL3ZpcnRncHVfcGxhbmUuYwpAQCAtMTMyLDEwICsxMzIsMTAgQEAgc3RhdGljIHZvaWQg
dmlydGlvX2dwdV9wcmltYXJ5X3BsYW5lX3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwK
IAkJCXZpcnRpb19ncHVfYXJyYXlfYWRkX29iaihvYmpzLCB2Z2ZiLT5iYXNlLm9ialswXSk7CiAJ
CQl2aXJ0aW9fZ3B1X2NtZF90cmFuc2Zlcl90b19ob3N0XzJkCiAJCQkJKHZnZGV2LCAwLAotCQkJ
CSBjcHVfdG9fbGUzMihwbGFuZS0+c3RhdGUtPnNyY193ID4+IDE2KSwKLQkJCQkgY3B1X3RvX2xl
MzIocGxhbmUtPnN0YXRlLT5zcmNfaCA+PiAxNiksCi0JCQkJIGNwdV90b19sZTMyKHBsYW5lLT5z
dGF0ZS0+c3JjX3ggPj4gMTYpLAotCQkJCSBjcHVfdG9fbGUzMihwbGFuZS0+c3RhdGUtPnNyY195
ID4+IDE2KSwKKwkJCQkgcGxhbmUtPnN0YXRlLT5zcmNfdyA+PiAxNiwKKwkJCQkgcGxhbmUtPnN0
YXRlLT5zcmNfaCA+PiAxNiwKKwkJCQkgcGxhbmUtPnN0YXRlLT5zcmNfeCA+PiAxNiwKKwkJCQkg
cGxhbmUtPnN0YXRlLT5zcmNfeSA+PiAxNiwKIAkJCQkgb2JqcywgTlVMTCk7CiAJCX0KIAl9IGVs
c2UgewpAQCAtMjM0LDggKzIzNCw4IEBAIHN0YXRpYyB2b2lkIHZpcnRpb19ncHVfY3Vyc29yX3Bs
YW5lX3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKIAkJdmlydGlvX2dwdV9hcnJheV9h
ZGRfb2JqKG9ianMsIHZnZmItPmJhc2Uub2JqWzBdKTsKIAkJdmlydGlvX2dwdV9jbWRfdHJhbnNm
ZXJfdG9faG9zdF8yZAogCQkJKHZnZGV2LCAwLAotCQkJIGNwdV90b19sZTMyKHBsYW5lLT5zdGF0
ZS0+Y3J0Y193KSwKLQkJCSBjcHVfdG9fbGUzMihwbGFuZS0+c3RhdGUtPmNydGNfaCksCisJCQkg
cGxhbmUtPnN0YXRlLT5jcnRjX3csCisJCQkgcGxhbmUtPnN0YXRlLT5jcnRjX2gsCiAJCQkgMCwg
MCwgb2JqcywgdmdmYi0+ZmVuY2UpOwogCQlkbWFfZmVuY2Vfd2FpdCgmdmdmYi0+ZmVuY2UtPmYs
IHRydWUpOwogCQlkbWFfZmVuY2VfcHV0KCZ2Z2ZiLT5mZW5jZS0+Zik7CmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0
aW8vdmlydGdwdV92cS5jCmluZGV4IDgwMTc2ZjM3OWFkNS4uNzRhZDNiYzNlYmU4IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vdmlydGlvL3ZpcnRncHVfdnEuYwpAQCAtNTQ5LDggKzU0OSw4IEBAIHZvaWQgdmlydGlv
X2dwdV9jbWRfcmVzb3VyY2VfZmx1c2goc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiwK
IAogdm9pZCB2aXJ0aW9fZ3B1X2NtZF90cmFuc2Zlcl90b19ob3N0XzJkKHN0cnVjdCB2aXJ0aW9f
Z3B1X2RldmljZSAqdmdkZXYsCiAJCQkJCXVpbnQ2NF90IG9mZnNldCwKLQkJCQkJX19sZTMyIHdp
ZHRoLCBfX2xlMzIgaGVpZ2h0LAotCQkJCQlfX2xlMzIgeCwgX19sZTMyIHksCisJCQkJCXVpbnQz
Ml90IHdpZHRoLCB1aW50MzJfdCBoZWlnaHQsCisJCQkJCXVpbnQzMl90IHgsIHVpbnQzMl90IHks
CiAJCQkJCXN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdF9hcnJheSAqb2JqcywKIAkJCQkJc3RydWN0
IHZpcnRpb19ncHVfZmVuY2UgKmZlbmNlKQogewpAQCAtNTcxLDEwICs1NzEsMTAgQEAgdm9pZCB2
aXJ0aW9fZ3B1X2NtZF90cmFuc2Zlcl90b19ob3N0XzJkKHN0cnVjdCB2aXJ0aW9fZ3B1X2Rldmlj
ZSAqdmdkZXYsCiAJY21kX3AtPmhkci50eXBlID0gY3B1X3RvX2xlMzIoVklSVElPX0dQVV9DTURf
VFJBTlNGRVJfVE9fSE9TVF8yRCk7CiAJY21kX3AtPnJlc291cmNlX2lkID0gY3B1X3RvX2xlMzIo
Ym8tPmh3X3Jlc19oYW5kbGUpOwogCWNtZF9wLT5vZmZzZXQgPSBjcHVfdG9fbGU2NChvZmZzZXQp
OwotCWNtZF9wLT5yLndpZHRoID0gd2lkdGg7Ci0JY21kX3AtPnIuaGVpZ2h0ID0gaGVpZ2h0Owot
CWNtZF9wLT5yLnggPSB4OwotCWNtZF9wLT5yLnkgPSB5OworCWNtZF9wLT5yLndpZHRoID0gY3B1
X3RvX2xlMzIod2lkdGgpOworCWNtZF9wLT5yLmhlaWdodCA9IGNwdV90b19sZTMyKGhlaWdodCk7
CisJY21kX3AtPnIueCA9IGNwdV90b19sZTMyKHgpOworCWNtZF9wLT5yLnkgPSBjcHVfdG9fbGUz
Mih5KTsKIAogCXZpcnRpb19ncHVfcXVldWVfZmVuY2VkX2N0cmxfYnVmZmVyKHZnZGV2LCB2YnVm
LCAmY21kX3AtPmhkciwgZmVuY2UpOwogfQotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
