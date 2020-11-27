Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D79A2C6518
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187A56ECCC;
	Fri, 27 Nov 2020 12:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5DD6ECB0;
 Fri, 27 Nov 2020 12:10:43 +0000 (UTC)
IronPort-SDR: PR8Y5GpsSRceSf4J+eXb8yWWWzE52BUnzVzoUlpr45tkN4nnpPuUoWj3ASmmo5a+O/+M4chceJ
 g2QUGkv/8tcw==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092773"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092773"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:27 -0800
IronPort-SDR: c2D9l8yD5olHQlIm0lPoRPnAupQlUKHS4+3JkioSiq/YENczPt2shlg9slicV1GkqZxI7N/5/W
 Skb1q5SZaW/w==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029366"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:25 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 097/162] drm/i915: Distinction of memory regions
Date: Fri, 27 Nov 2020 12:06:13 +0000
Message-Id: <20201127120718.454037-98-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
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
Cc: Adam Miszczak <adam.miszczak@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5j
b20+CgpJR1RzIHNob3VsZCBiZSBhYmxlIHRvIGNob29zZSB0ZXN0aW5nIHN0cmF0ZWd5IGRlcGVu
ZGluZyBvbiBtZW1vcnkKcmVnaW9ucyBhbmQgaXRzIHNpemVzLiBBZGQgcmVnaW9uIGluc3RhbmNl
IG51bWJlciB0byBtYWtlIHRoaXMKZWFzaWVyIGFuZCBkZXNjcmlwdGl2ZS4KCkNjOiBNYXR0aGV3
IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+CkNjOiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5n
YW0uY0BpbnRlbC5jb20+CkNjOiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwu
Y29tPgpDYzogQWRhbSBNaXN6Y3phayA8YWRhbS5taXN6Y3pha0BpbnRlbC5jb20+ClNpZ25lZC1v
ZmYtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX21lbW9yeV9yZWdpb24uYyB8IDQg
KysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2ludGVsX21lbW9yeV9yZWdpb24uYyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2ludGVsX21lbW9yeV9yZWdpb24uYwppbmRleCAxZjI2YmMwNmVjMjAuLmNlYTQ0ZGRlYmU0
NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfbWVtb3J5X3JlZ2lvbi5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX21lbW9yeV9yZWdpb24uYwpAQCAtMzI5
LDYgKzMyOSwxMCBAQCBpbnQgaW50ZWxfbWVtb3J5X3JlZ2lvbnNfaHdfcHJvYmUoc3RydWN0IGRy
bV9pOTE1X3ByaXZhdGUgKmk5MTUpCiAJCW1lbS0+aW5zdGFuY2UgPSBpbnN0YW5jZTsKIAkJbWVt
LT5ndCA9ICZpOTE1LT5ndDsKIAorCQlpZiAoSEFTX0xNRU0obWVtLT5pOTE1KSAmJiB0eXBlICE9
IElOVEVMX01FTU9SWV9TWVNURU0pCisJCQlpbnRlbF9tZW1vcnlfcmVnaW9uX3NldF9uYW1lKG1l
bSwgIiVzJXUiLAorCQkJCQkJICAgICBtZW0tPm5hbWUsIG1lbS0+aW5zdGFuY2UpOworCiAJCWk5
MTUtPm1tLnJlZ2lvbnNbaV0gPSBtZW07CiAJfQogCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
