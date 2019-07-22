Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E822D7129F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790BC6E13C;
	Tue, 23 Jul 2019 07:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78EE98946E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 09:27:41 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d35818d0001>; Mon, 22 Jul 2019 02:27:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 22 Jul 2019 02:27:40 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 22 Jul 2019 02:27:40 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 22 Jul
 2019 09:27:19 +0000
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 22 Jul
 2019 09:27:19 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 22 Jul 2019 09:27:19 +0000
Received: from viswanathl-pc.nvidia.com (Not Verified[10.24.34.161]) by
 hqnvemgw02.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5d3581750000>; Mon, 22 Jul 2019 02:27:19 -0700
From: Viswanath L <viswanathl@nvidia.com>
To: <thierry.reding@gmail.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <jonathanh@nvidia.com>
Subject: [PATCH v2] drm/tegra: sor: Enable HDA interrupts at plugin
Date: Mon, 22 Jul 2019 14:57:12 +0530
Message-ID: <1563787632-19762-1-git-send-email-viswanathl@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1563787661; bh=VobXuXAYe397QeqmnAYN9rYN9lbzFlQxcw9Xph5TjYc=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:Content-Type;
 b=SuMOXOPQ+wi8vYTKHk7TNtX85N90p7MnKBarcwa70v6aYm1BXN2D8Ld4uXqItiIjG
 KCANY6JGrjC7JL7uQ5pO9wVIqai9Y41gt19TQsh3NUPzuA7VQVNu/0qifmDyhCPm41
 Q38vQ99ONufQSzYmMZ4ghOBu/rwzidp7PDKoJKwt3RsclrL4KObuaZDkjDinOESnhL
 0uBpkB/OfTZCv5agtiq1Le1SYoEnU8hZ1lBJ1gCn8ito10W7N0dwXi3njwxsB2V90K
 E2ABl0naYs1qeX38PeaF/FqLKu2pZsm9ydvR/zTtVUliqoLyEJZsCnmj67tmNpbqna
 a5aTNgJXOEiOA==
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SERNSSBwbHVnb3V0IGNhbGxzIHJ1bnRpbWUgc3VzcGVuZCwgd2hpY2ggY2xlYXJzIGludGVycnVw
dCByZWdpc3RlcnMKYW5kIGNhdXNlcyBhdWRpbyBmdW5jdGlvbmFsaXR5IHRvIGJyZWFrIG9uIHN1
YnNlcXVlbnQgcGx1Z2luOyBzZXR0aW5nCmludGVycnVwdCByZWdpc3RlcnMgaW4gc29yX2F1ZGlv
X3ByZXBhcmUoKSBzb2x2ZXMgdGhlIGlzc3VlCgpTaWduZWQtb2ZmLWJ5OiBWaXN3YW5hdGggTCA8
dmlzd2FuYXRobEBudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYyB8
IDE4ICsrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwg
OSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMKaW5kZXggNWJlNWEwOC4uMDQ3MGNmZSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS90ZWdyYS9zb3IuYwpAQCAtMjE2NCw2ICsyMTY0LDE1IEBAIHN0YXRpYyB2b2lkIHRlZ3JhX3Nv
cl9hdWRpb19wcmVwYXJlKHN0cnVjdCB0ZWdyYV9zb3IgKnNvcikKIAogCXZhbHVlID0gU09SX0FV
RElPX0hEQV9QUkVTRU5TRV9FTERWIHwgU09SX0FVRElPX0hEQV9QUkVTRU5TRV9QRDsKIAl0ZWdy
YV9zb3Jfd3JpdGVsKHNvciwgdmFsdWUsIFNPUl9BVURJT19IREFfUFJFU0VOU0UpOworCisJLyoK
KwkgKiBFbmFibGUgYW5kIHVubWFzayB0aGUgSERBIGNvZGVjIFNDUkFUQ0gwIHJlZ2lzdGVyIGlu
dGVycnVwdC4gVGhpcworCSAqIGlzIHVzZWQgZm9yIGludGVyb3BlcmFiaWxpdHkgYmV0d2VlbiB0
aGUgSERBIGNvZGVjIGRyaXZlciBhbmQgdGhlCisJICogSERNSS9EUCBkcml2ZXIuCisJICovCisJ
dmFsdWUgPSBTT1JfSU5UX0NPREVDX1NDUkFUQ0gxIHwgU09SX0lOVF9DT0RFQ19TQ1JBVENIMDsK
Kwl0ZWdyYV9zb3Jfd3JpdGVsKHNvciwgdmFsdWUsIFNPUl9JTlRfRU5BQkxFKTsKKwl0ZWdyYV9z
b3Jfd3JpdGVsKHNvciwgdmFsdWUsIFNPUl9JTlRfTUFTSyk7CiB9CiAKIHN0YXRpYyB2b2lkIHRl
Z3JhX3Nvcl9hdWRpb191bnByZXBhcmUoc3RydWN0IHRlZ3JhX3NvciAqc29yKQpAQCAtMjkxMywx
NSArMjkyMiw2IEBAIHN0YXRpYyBpbnQgdGVncmFfc29yX2luaXQoc3RydWN0IGhvc3QxeF9jbGll
bnQgKmNsaWVudCkKIAlpZiAoZXJyIDwgMCkKIAkJcmV0dXJuIGVycjsKIAotCS8qCi0JICogRW5h
YmxlIGFuZCB1bm1hc2sgdGhlIEhEQSBjb2RlYyBTQ1JBVENIMCByZWdpc3RlciBpbnRlcnJ1cHQu
IFRoaXMKLQkgKiBpcyB1c2VkIGZvciBpbnRlcm9wZXJhYmlsaXR5IGJldHdlZW4gdGhlIEhEQSBj
b2RlYyBkcml2ZXIgYW5kIHRoZQotCSAqIEhETUkvRFAgZHJpdmVyLgotCSAqLwotCXZhbHVlID0g
U09SX0lOVF9DT0RFQ19TQ1JBVENIMSB8IFNPUl9JTlRfQ09ERUNfU0NSQVRDSDA7Ci0JdGVncmFf
c29yX3dyaXRlbChzb3IsIHZhbHVlLCBTT1JfSU5UX0VOQUJMRSk7Ci0JdGVncmFfc29yX3dyaXRl
bChzb3IsIHZhbHVlLCBTT1JfSU5UX01BU0spOwotCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuNy40
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
