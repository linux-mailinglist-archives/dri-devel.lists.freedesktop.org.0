Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8DD71EF9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:22:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2516A6E345;
	Tue, 23 Jul 2019 18:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581BC6E1B7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 12:40:18 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d3700320000>; Tue, 23 Jul 2019 05:40:18 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 23 Jul 2019 05:40:17 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 23 Jul 2019 05:40:17 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 23 Jul
 2019 12:40:17 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 23 Jul 2019 12:40:17 +0000
Received: from viswanathl-pc.nvidia.com (Not Verified[10.24.34.161]) by
 hqnvemgw02.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5d37002f0001>; Tue, 23 Jul 2019 05:40:17 -0700
From: Viswanath L <viswanathl@nvidia.com>
To: <thierry.reding@gmail.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <jonathanh@nvidia.com>
Subject: [PATCH v3] drm/tegra: sor: Enable HDA interrupts at plug-in
Date: Tue, 23 Jul 2019 18:10:10 +0530
Message-ID: <1563885610-27198-1-git-send-email-viswanathl@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1563885618; bh=vnUMhGHFntFjRCg50dKxkbAv1jtTZ2lFJW7TPW4MlWE=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:Content-Type;
 b=BBFi9+pINJlcbCbMk3Ue+WDikjwc8qnvNr6wz/l0ep+fGOMDIByfvx54x9zncg50F
 kTSB7lNswhIkdH7bTrNS+1ijAN6LAJn+uGLqA2vrNKHlshm1RLUPhhcdgr/QBihY25
 epAJB73dNVrt5bMJq4DduZjXolzRif9pU87hAtRPalrl9iDcJTOQNlv2SF2O63qLLe
 B2SaiQMUrKv/xc6eZhbYOBJrHa/5fTQYj93GLAkr6m4Y9hh4Vu6z555A6Wfp21HqpO
 Of1Rm0TIOU+q1PE5kPJx6utVT+sjqojafp0G4vt0SLrtfUDr3wKbmHlVwDfM06UmN4
 hfhuyWQIpQl9g==
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
Cc: linux-tegra@vger.kernel.org, Viswanath L <viswanathl@nvidia.com>,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SERNSSBwbHVnb3V0IGNhbGxzIHJ1bnRpbWUgc3VzcGVuZCwgd2hpY2ggY2xlYXJzIGludGVycnVw
dCByZWdpc3RlcnMKYW5kIGNhdXNlcyBhdWRpbyBmdW5jdGlvbmFsaXR5IHRvIGJyZWFrIG9uIHN1
YnNlcXVlbnQgcGx1Zy1pbjsgc2V0dGluZwppbnRlcnJ1cHQgcmVnaXN0ZXJzIGluIHNvcl9hdWRp
b19wcmVwYXJlKCkgc29sdmVzIHRoZSBpc3N1ZS4KClNpZ25lZC1vZmYtYnk6IFZpc3dhbmF0aCBM
IDx2aXN3YW5hdGhsQG52aWRpYS5jb20+CkZpeGVzOiA4ZTI5ODhhNzZjMjYgKCJkcm0vdGVncmE6
IHNvcjogU3VwcG9ydCBmb3IgYXVkaW8gb3ZlciBIRE1JIikKQ2M6IDxzdGFibGVAdmdlci5rZXJu
ZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYyB8IDE4ICsrKysrKysrKy0t
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMgYi9kcml2ZXJzL2dwdS9k
cm0vdGVncmEvc29yLmMKaW5kZXggNWJlNWEwOC4uMDQ3MGNmZSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3RlZ3JhL3Nvci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwpA
QCAtMjE2NCw2ICsyMTY0LDE1IEBAIHN0YXRpYyB2b2lkIHRlZ3JhX3Nvcl9hdWRpb19wcmVwYXJl
KHN0cnVjdCB0ZWdyYV9zb3IgKnNvcikKIAogCXZhbHVlID0gU09SX0FVRElPX0hEQV9QUkVTRU5T
RV9FTERWIHwgU09SX0FVRElPX0hEQV9QUkVTRU5TRV9QRDsKIAl0ZWdyYV9zb3Jfd3JpdGVsKHNv
ciwgdmFsdWUsIFNPUl9BVURJT19IREFfUFJFU0VOU0UpOworCisJLyoKKwkgKiBFbmFibGUgYW5k
IHVubWFzayB0aGUgSERBIGNvZGVjIFNDUkFUQ0gwIHJlZ2lzdGVyIGludGVycnVwdC4gVGhpcwor
CSAqIGlzIHVzZWQgZm9yIGludGVyb3BlcmFiaWxpdHkgYmV0d2VlbiB0aGUgSERBIGNvZGVjIGRy
aXZlciBhbmQgdGhlCisJICogSERNSS9EUCBkcml2ZXIuCisJICovCisJdmFsdWUgPSBTT1JfSU5U
X0NPREVDX1NDUkFUQ0gxIHwgU09SX0lOVF9DT0RFQ19TQ1JBVENIMDsKKwl0ZWdyYV9zb3Jfd3Jp
dGVsKHNvciwgdmFsdWUsIFNPUl9JTlRfRU5BQkxFKTsKKwl0ZWdyYV9zb3Jfd3JpdGVsKHNvciwg
dmFsdWUsIFNPUl9JTlRfTUFTSyk7CiB9CiAKIHN0YXRpYyB2b2lkIHRlZ3JhX3Nvcl9hdWRpb191
bnByZXBhcmUoc3RydWN0IHRlZ3JhX3NvciAqc29yKQpAQCAtMjkxMywxNSArMjkyMiw2IEBAIHN0
YXRpYyBpbnQgdGVncmFfc29yX2luaXQoc3RydWN0IGhvc3QxeF9jbGllbnQgKmNsaWVudCkKIAlp
ZiAoZXJyIDwgMCkKIAkJcmV0dXJuIGVycjsKIAotCS8qCi0JICogRW5hYmxlIGFuZCB1bm1hc2sg
dGhlIEhEQSBjb2RlYyBTQ1JBVENIMCByZWdpc3RlciBpbnRlcnJ1cHQuIFRoaXMKLQkgKiBpcyB1
c2VkIGZvciBpbnRlcm9wZXJhYmlsaXR5IGJldHdlZW4gdGhlIEhEQSBjb2RlYyBkcml2ZXIgYW5k
IHRoZQotCSAqIEhETUkvRFAgZHJpdmVyLgotCSAqLwotCXZhbHVlID0gU09SX0lOVF9DT0RFQ19T
Q1JBVENIMSB8IFNPUl9JTlRfQ09ERUNfU0NSQVRDSDA7Ci0JdGVncmFfc29yX3dyaXRlbChzb3Is
IHZhbHVlLCBTT1JfSU5UX0VOQUJMRSk7Ci0JdGVncmFfc29yX3dyaXRlbChzb3IsIHZhbHVlLCBT
T1JfSU5UX01BU0spOwotCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuNy40CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
