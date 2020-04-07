Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B211A07C8
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 08:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E30B6E527;
	Tue,  7 Apr 2020 06:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF496E526;
 Tue,  7 Apr 2020 06:54:22 +0000 (UTC)
IronPort-SDR: 8o5QTH2Gze1eZFbmhlvx7JYZidUS00k5hN+jo0hpLAHzpfRhhvfdvi7UJdx35hpcNa2qsKd/BD
 1oZydtb4vUJg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 23:54:21 -0700
IronPort-SDR: BI7CRsEqb3sLy2E/Y1qqZBCet3bkqmNMMdbdraNukOGPhHYJi0XSgIGcebAvIVSP15psn0cFUZ
 vUWOm+ns3Q7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,353,1580803200"; d="scan'208";a="451114714"
Received: from unknown (HELO jeevan-desktop.iind.intel.com) ([10.223.74.85])
 by fmsmga005.fm.intel.com with ESMTP; 06 Apr 2020 23:54:19 -0700
From: Jeevan B <jeevan.b@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/5] drm/i915: utilize subconnector property for DP
Date: Tue,  7 Apr 2020 12:20:04 +0530
Message-Id: <1586242207-23214-2-git-send-email-jeevan.b@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586242207-23214-1-git-send-email-jeevan.b@intel.com>
References: <1586242207-23214-1-git-send-email-jeevan.b@intel.com>
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
Cc: jani.nikula@intel.com, Jeevan B <jeevan.b@intel.com>, uma.shankar@intel.com,
 Oleg Vasilev <oleg.vasilev@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogT2xlZyBWYXNpbGV2IDxvbGVnLnZhc2lsZXZAaW50ZWwuY29tPgoKU2luY2UgRFAtc3Bl
Y2lmaWMgaW5mb3JtYXRpb24gaXMgc3RvcmVkIGluIGRyaXZlcidzIHN0cnVjdHVyZXMsIGV2ZXJ5
CmRyaXZlciBuZWVkcyB0byBpbXBsZW1lbnQgc3ViY29ubmVjdG9yIHByb3BlcnR5IGJ5IGl0c2Vs
Zi4KCnYyOiB1cGRhdGVzIHRvIG1hdGNoIHByZXZpb3VzIGNvbW1pdCBjaGFuZ2VzCgp2MzogcmVi
YXNlCgpDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4K
Q2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogSmVldmFu
IEIgPGplZXZhbi5iQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogT2xlZyBWYXNpbGV2IDxvbGVn
LnZhc2lsZXZAaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlr
b3ZAY29sbGFib3JhLmNvbT4KVGVzdGVkLWJ5OiBPbGVnIFZhc2lsZXYgPG9sZWcudmFzaWxldkBp
bnRlbC5jb20+Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9t
c2dpZC8yMDE5MDgyOTExNDg1NC4xNTM5LTQtb2xlZy52YXNpbGV2QGludGVsLmNvbQotLS0KIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyB8IDggKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RwLmMKaW5kZXggZGI2YWU4ZS4uYmE0NDNlMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZHAuYwpAQCAtNjE1NSw2ICs2MTU1LDExIEBAIGludGVsX2RwX2RldGVjdChz
dHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAogCSAqLwogCWludGVsX2Rpc3BsYXlfcG93
ZXJfZmx1c2hfd29yayhkZXZfcHJpdik7CiAKKwlpZiAoIWludGVsX2RwX2lzX2VkcChpbnRlbF9k
cCkpCisJCWRybV9kcF9zZXRfc3ViY29ubmVjdG9yX3Byb3BlcnR5KGNvbm5lY3RvciwKKwkJCQkJ
CSBzdGF0dXMsCisJCQkJCQkgaW50ZWxfZHAtPmRwY2QsCisJCQkJCQkgaW50ZWxfZHAtPmRvd25z
dHJlYW1fcG9ydHMpOwogCXJldHVybiBzdGF0dXM7CiB9CiAKQEAgLTcyMTEsNiArNzIxNiw5IEBA
IGludGVsX2RwX2FkZF9wcm9wZXJ0aWVzKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsIHN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWN0CiAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9w
cml2ID0gdG9faTkxNShjb25uZWN0b3ItPmRldik7CiAJZW51bSBwb3J0IHBvcnQgPSBkcF90b19k
aWdfcG9ydChpbnRlbF9kcCktPmJhc2UucG9ydDsKIAorCWlmICghaW50ZWxfZHBfaXNfZWRwKGlu
dGVsX2RwKSkKKwkJZHJtX21vZGVfYWRkX2RwX3N1YmNvbm5lY3Rvcl9wcm9wZXJ0eShjb25uZWN0
b3IpOworCiAJaWYgKCFJU19HNFgoZGV2X3ByaXYpICYmIHBvcnQgIT0gUE9SVF9BKQogCQlpbnRl
bF9hdHRhY2hfZm9yY2VfYXVkaW9fcHJvcGVydHkoY29ubmVjdG9yKTsKIAotLSAKMi43LjQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
