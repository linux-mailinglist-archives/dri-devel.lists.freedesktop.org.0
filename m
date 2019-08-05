Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF688819B3
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 14:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3586E448;
	Mon,  5 Aug 2019 12:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9196E448;
 Mon,  5 Aug 2019 12:43:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 27EC930EA1A9;
 Mon,  5 Aug 2019 12:43:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-81.ams2.redhat.com
 [10.36.116.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94E55194BB;
 Mon,  5 Aug 2019 12:43:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D99BF9D13; Mon,  5 Aug 2019 14:43:14 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 15/18] drm/nouveau: switch driver from bo->resv to
 bo->base.resv
Date: Mon,  5 Aug 2019 14:43:07 +0200
Message-Id: <20190805124310.3275-16-kraxel@redhat.com>
In-Reply-To: <20190805124310.3275-1-kraxel@redhat.com>
References: <20190805124310.3275-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Mon, 05 Aug 2019 12:43:17 +0000 (UTC)
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
Cc: thomas@shipmail.org, tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 ckoenig.leichtzumerken@gmail.com, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, bskeggs@redhat.com,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+ClJldmlld2Vk
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvd25kdy5jIHwgMiArLQogZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9iby5jICAgIHwgNSArKy0tLQogZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9mZW5jZS5jIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9nZW0uYyAgIHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52
NTAvd25kdy5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvd25kdy5jCmluZGV4
IDI4M2ZmNjkwMzUwZS4uODlmOGU3NmEyZDdkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9kaXNwbnY1MC93bmR3LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlz
cG52NTAvd25kdy5jCkBAIC00NTcsNyArNDU3LDcgQEAgbnY1MF93bmR3X3ByZXBhcmVfZmIoc3Ry
dWN0IGRybV9wbGFuZSAqcGxhbmUsIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnN0YXRlKQogCQlh
c3l3LT5pbWFnZS5oYW5kbGVbMF0gPSBjdHhkbWEtPm9iamVjdC5oYW5kbGU7CiAJfQogCi0JYXN5
dy0+c3RhdGUuZmVuY2UgPSByZXNlcnZhdGlvbl9vYmplY3RfZ2V0X2V4Y2xfcmN1KGZiLT5udmJv
LT5iby5yZXN2KTsKKwlhc3l3LT5zdGF0ZS5mZW5jZSA9IHJlc2VydmF0aW9uX29iamVjdF9nZXRf
ZXhjbF9yY3UoZmItPm52Ym8tPmJvLmJhc2UucmVzdik7CiAJYXN5dy0+aW1hZ2Uub2Zmc2V0WzBd
ID0gZmItPm52Ym8tPmJvLm9mZnNldDsKIAogCWlmICh3bmR3LT5mdW5jLT5wcmVwYXJlKSB7CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKaW5kZXggYWJiYmFiZDEyMjQxLi45OWUzOTFi
ZTkzNzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKQEAgLTI5OSw3ICsyOTks
NiBAQCBub3V2ZWF1X2JvX25ldyhzdHJ1Y3Qgbm91dmVhdV9jbGkgKmNsaSwgdTY0IHNpemUsIGlu
dCBhbGlnbiwKIAkJCSAgdHlwZSwgJm52Ym8tPnBsYWNlbWVudCwKIAkJCSAgYWxpZ24gPj4gUEFH
RV9TSElGVCwgZmFsc2UsIGFjY19zaXplLCBzZywKIAkJCSAgcm9iaiwgbm91dmVhdV9ib19kZWxf
dHRtKTsKLQludmJvLT5iby5iYXNlLnJlc3YgPSBudmJvLT5iby5yZXN2OwogCiAJaWYgKHJldCkg
ewogCQkvKiB0dG0gd2lsbCBjYWxsIG5vdXZlYXVfYm9fZGVsX3R0bSBpZiBpdCBmYWlscy4uICov
CkBAIC0xMzI1LDcgKzEzMjQsNyBAQCBub3V2ZWF1X2JvX3ZtX2NsZWFudXAoc3RydWN0IHR0bV9i
dWZmZXJfb2JqZWN0ICpibywKIHsKIAlzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSA9IG5vdXZlYXVf
YmRldihiby0+YmRldik7CiAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGRybS0+ZGV2OwotCXN0
cnVjdCBkbWFfZmVuY2UgKmZlbmNlID0gcmVzZXJ2YXRpb25fb2JqZWN0X2dldF9leGNsKGJvLT5y
ZXN2KTsKKwlzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSA9IHJlc2VydmF0aW9uX29iamVjdF9nZXRf
ZXhjbChiby0+YmFzZS5yZXN2KTsKIAogCW52MTBfYm9fcHV0X3RpbGVfcmVnaW9uKGRldiwgKm9s
ZF90aWxlLCBmZW5jZSk7CiAJKm9sZF90aWxlID0gbmV3X3RpbGU7CkBAIC0xNjU2LDcgKzE2NTUs
NyBAQCBub3V2ZWF1X3R0bV90dF91bnBvcHVsYXRlKHN0cnVjdCB0dG1fdHQgKnR0bSkKIHZvaWQK
IG5vdXZlYXVfYm9fZmVuY2Uoc3RydWN0IG5vdXZlYXVfYm8gKm52Ym8sIHN0cnVjdCBub3V2ZWF1
X2ZlbmNlICpmZW5jZSwgYm9vbCBleGNsdXNpdmUpCiB7Ci0Jc3RydWN0IHJlc2VydmF0aW9uX29i
amVjdCAqcmVzdiA9IG52Ym8tPmJvLnJlc3Y7CisJc3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAq
cmVzdiA9IG52Ym8tPmJvLmJhc2UucmVzdjsKIAogCWlmIChleGNsdXNpdmUpCiAJCXJlc2VydmF0
aW9uX29iamVjdF9hZGRfZXhjbF9mZW5jZShyZXN2LCAmZmVuY2UtPmJhc2UpOwpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9mZW5jZS5jIGIvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9mZW5jZS5jCmluZGV4IGQ0OTY0ZjMzOTdhMS4uZTVmMjQ5YWIy
MTZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2ZlbmNlLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9mZW5jZS5jCkBAIC0zMzUsNyAr
MzM1LDcgQEAgbm91dmVhdV9mZW5jZV9zeW5jKHN0cnVjdCBub3V2ZWF1X2JvICpudmJvLCBzdHJ1
Y3Qgbm91dmVhdV9jaGFubmVsICpjaGFuLCBib29sIGUKIHsKIAlzdHJ1Y3Qgbm91dmVhdV9mZW5j
ZV9jaGFuICpmY3R4ID0gY2hhbi0+ZmVuY2U7CiAJc3RydWN0IGRtYV9mZW5jZSAqZmVuY2U7Ci0J
c3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqcmVzdiA9IG52Ym8tPmJvLnJlc3Y7CisJc3RydWN0
IHJlc2VydmF0aW9uX29iamVjdCAqcmVzdiA9IG52Ym8tPmJvLmJhc2UucmVzdjsKIAlzdHJ1Y3Qg
cmVzZXJ2YXRpb25fb2JqZWN0X2xpc3QgKmZvYmo7CiAJc3RydWN0IG5vdXZlYXVfZmVuY2UgKmY7
CiAJaW50IHJldCA9IDAsIGk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9nZW0uYwppbmRl
eCBiMWU0ODUyODEwZWQuLmM3MzY4YWEwYmRlYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X2dlbS5jCkBAIC04ODcsNyArODg3LDcgQEAgbm91dmVhdV9nZW1faW9jdGxfY3B1X3ByZXAo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAkJcmV0dXJuIC1FTk9FTlQ7CiAJ
bnZibyA9IG5vdXZlYXVfZ2VtX29iamVjdChnZW0pOwogCi0JbHJldCA9IHJlc2VydmF0aW9uX29i
amVjdF93YWl0X3RpbWVvdXRfcmN1KG52Ym8tPmJvLnJlc3YsIHdyaXRlLCB0cnVlLAorCWxyZXQg
PSByZXNlcnZhdGlvbl9vYmplY3Rfd2FpdF90aW1lb3V0X3JjdShudmJvLT5iby5iYXNlLnJlc3Ys
IHdyaXRlLCB0cnVlLAogCQkJCQkJICAgbm9fd2FpdCA/IDAgOiAzMCAqIEhaKTsKIAlpZiAoIWxy
ZXQpCiAJCXJldCA9IC1FQlVTWTsKLS0gCjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
