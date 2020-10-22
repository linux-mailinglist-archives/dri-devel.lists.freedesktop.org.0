Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA18295BEF
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 11:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A456F58C;
	Thu, 22 Oct 2020 09:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997D86F571;
 Thu, 22 Oct 2020 09:36:12 +0000 (UTC)
IronPort-SDR: NdlG1Sqf+zMmLz359jQvwDWX66O5d6eHJZbbmAXjXpF2WVxw7C+7e++nR167Z267HH1uPIzU4j
 jTIZ2LBPkM1A==
X-IronPort-AV: E=McAfee;i="6000,8403,9781"; a="164905519"
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="164905519"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 02:36:12 -0700
IronPort-SDR: vksuAHIWP6VUHzPusyZHhWOHZaELWnNTnAEARqaRZso54ALuaqSKc963nmMYCeth+QJ5it1sJv
 K8OpfBD9RorA==
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="359807304"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 02:36:09 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 03/16] drm/i915/hotplug: Handle CP_IRQ for DP-MST
Date: Thu, 22 Oct 2020 14:25:39 +0530
Message-Id: <20201022085552.18353-4-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201022085552.18353-1-anshuman.gupta@intel.com>
References: <20201022085552.18353-1-anshuman.gupta@intel.com>
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
Cc: jani.nikula@intel.com, uma.shankar@intel.com, seanpaul@chromium.org,
 Anshuman Gupta <anshuman.gupta@intel.com>, juston.li@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGFuZGxlIENQX0lSUSBpbiBERVZJQ0VfU0VSVklDRV9JUlFfVkVDVE9SX0VTSTAKSXQgcmVxdWly
ZXMgdG8gY2FsbCBpbnRlbF9oZGNwX2hhbmRsZV9jcF9pcnEoKSBpbiBjYXNlCm9mIENQX0lSUSBp
cyB0cmlnZ2VyZWQgYnkgYSBzaW5rIGluIERQLU1TVCB0b3BvbG9neS4KCkNjOiAiVmlsbGUgU3ly
asOkbMOkIiA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBSYW1hbGluZ2FtIEMg
PHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEFuc2h1bWFuIEd1cHRhIDxh
bnNodW1hbi5ndXB0YUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kcC5jIHwgMTQgKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kcC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kcC5jCmluZGV4IDgxOGRhYWIyNTJmMy4uMjFjNmM5ODI4Y2Q3IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCkBAIC01NjU3LDYgKzU2NTcsMTcgQEAgc3RhdGljIHZv
aWQgaW50ZWxfZHBfaGFuZGxlX3Rlc3RfcmVxdWVzdChzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2Rw
KQogCQkJICAgICJDb3VsZCBub3Qgd3JpdGUgdGVzdCByZXNwb25zZSB0byBzaW5rXG4iKTsKIH0K
IAorc3RhdGljIHZvaWQKK2ludGVsX2RwX21zdF9ocGRfaXJxKHN0cnVjdCBpbnRlbF9kcCAqaW50
ZWxfZHAsIHU4ICplc2ksIGJvb2wgKmhhbmRsZWQpCit7CisJCWRybV9kcF9tc3RfaHBkX2lycSgm
aW50ZWxfZHAtPm1zdF9tZ3IsIGVzaSwgaGFuZGxlZCk7CisKKwkJaWYgKGVzaVsxXSAmIERQX0NQ
X0lSUSkgeworCQkJaW50ZWxfaGRjcF9oYW5kbGVfY3BfaXJxKGludGVsX2RwLT5hdHRhY2hlZF9j
b25uZWN0b3IpOworCQkJKmhhbmRsZWQgPSB0cnVlOworCQl9Cit9CisKIC8qKgogICogaW50ZWxf
ZHBfY2hlY2tfbXN0X3N0YXR1cyAtIHNlcnZpY2UgYW55IHBlbmRpbmcgTVNUIGludGVycnVwdHMs
IGNoZWNrIGxpbmsgc3RhdHVzCiAgKiBAaW50ZWxfZHA6IEludGVsIERQIHN0cnVjdApAQCAtNTcw
MSw3ICs1NzEyLDggQEAgaW50ZWxfZHBfY2hlY2tfbXN0X3N0YXR1cyhzdHJ1Y3QgaW50ZWxfZHAg
KmludGVsX2RwKQogCiAJCWRybV9kYmdfa21zKCZpOTE1LT5kcm0sICJnb3QgZXNpICUzcGhcbiIs
IGVzaSk7CiAKLQkJZHJtX2RwX21zdF9ocGRfaXJxKCZpbnRlbF9kcC0+bXN0X21nciwgZXNpLCAm
aGFuZGxlZCk7CisJCWludGVsX2RwX21zdF9ocGRfaXJxKGludGVsX2RwLCBlc2ksICZoYW5kbGVk
KTsKKwogCQlpZiAoIWhhbmRsZWQpCiAJCQlicmVhazsKIAotLSAKMi4yNi4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
