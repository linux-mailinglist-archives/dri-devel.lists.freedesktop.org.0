Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3175BE86B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 00:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE806F7FD;
	Wed, 25 Sep 2019 22:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5BF6F7FD
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 22:46:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 15:46:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,549,1559545200"; d="scan'208";a="183414050"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.135])
 by orsmga008.jf.intel.com with ESMTP; 25 Sep 2019 15:46:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Destroy the correct mutex name in
 drm_dp_mst_topology_mgr_destroy
Date: Wed, 25 Sep 2019 15:46:17 -0700
Message-Id: <20190925224617.24027-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.21.0
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
Cc: Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgbG9va3MgbGlrZSBvbmUgb2YgdGhlIHRvcG9sb2d5IG1hbmFnZXIgbXV0ZXhlcyBtYXkgaGF2
ZSBiZWVuIHJlbmFtZWQKZHVyaW5nIGEgcmViYXNlLCBidXQgdGhlIGRlc3RydWN0aW9uIGZ1bmN0
aW9uIHdhc24ndCB1cGRhdGVkIHdpdGggdGhlCm5ldyBuYW1lOgoKICAgZXJyb3I6IOKAmHN0cnVj
dCBkcm1fZHBfbXN0X3RvcG9sb2d5X21ncuKAmSBoYXMgbm8gbWVtYmVyIG5hbWVkCiAgIOKAmGRl
bGF5ZWRfZGVzdHJveV9sb2Nr4oCZCgpGaXhlczogNTAwOTRiNWRjZDMyICgiZHJtL2RwX21zdDog
RGVzdHJveSB0b3BvbG9neV9tZ3IgbXV0ZXhlcyIpCkNjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRo
YXQuY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+ClNpZ25lZC1vZmYtYnk6IE1h
dHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
bXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmlu
ZGV4IDAxZDk3YzZjYmJiMi4uYzg4MDRjYTYyNjRjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0
X3RvcG9sb2d5LmMKQEAgLTQzMDEsNyArNDMwMSw3IEBAIHZvaWQgZHJtX2RwX21zdF90b3BvbG9n
eV9tZ3JfZGVzdHJveShzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1ncikKIAlkcm1f
YXRvbWljX3ByaXZhdGVfb2JqX2ZpbmkoJm1nci0+YmFzZSk7CiAJbWdyLT5mdW5jcyA9IE5VTEw7
CiAKLQltdXRleF9kZXN0cm95KCZtZ3ItPmRlbGF5ZWRfZGVzdHJveV9sb2NrKTsKKwltdXRleF9k
ZXN0cm95KCZtZ3ItPmRlc3Ryb3lfY29ubmVjdG9yX2xvY2spOwogCW11dGV4X2Rlc3Ryb3koJm1n
ci0+cGF5bG9hZF9sb2NrKTsKIAltdXRleF9kZXN0cm95KCZtZ3ItPnFsb2NrKTsKIAltdXRleF9k
ZXN0cm95KCZtZ3ItPmxvY2spOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
