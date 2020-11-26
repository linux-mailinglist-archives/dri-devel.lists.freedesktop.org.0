Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A082C4FB8
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 08:51:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72E06E842;
	Thu, 26 Nov 2020 07:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172306E842;
 Thu, 26 Nov 2020 07:51:27 +0000 (UTC)
IronPort-SDR: wSVwUeNQQn4LV78Oik46/ivP1kfyKPgJFKLbOaNXXs39XL4w6QR7BHCEdS4hTZUhPQLIlhC2MF
 GCOmvGQp7c8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="152084915"
X-IronPort-AV: E=Sophos;i="5.78,371,1599548400"; d="scan'208";a="152084915"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2020 23:51:26 -0800
IronPort-SDR: gJvthj2+7qphce1BNzqWQVt+3eL1E759bmEFZ8/yxqD5Sc9WOI/YwPf1rmoKwhbqmJ9WIyb7dz
 494qde4VgbrQ==
X-IronPort-AV: E=Sophos;i="5.78,371,1599548400"; d="scan'208";a="535652445"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2020 23:51:23 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 03/18] drm/i915/hotplug: Handle CP_IRQ for DP-MST
Date: Thu, 26 Nov 2020 13:07:07 +0530
Message-Id: <20201126073722.19107-4-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201126073722.19107-1-anshuman.gupta@intel.com>
References: <20201126073722.19107-1-anshuman.gupta@intel.com>
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
Cc: jani.nikula@intel.com, Karthik B S <karthik.b.s@intel.com>,
 uma.shankar@intel.com, seanpaul@chromium.org,
 Anshuman Gupta <anshuman.gupta@intel.com>, juston.li@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGFuZGxlIENQX0lSUSBpbiBERVZJQ0VfU0VSVklDRV9JUlFfVkVDVE9SX0VTSTAKSXQgcmVxdWly
ZXMgdG8gY2FsbCBpbnRlbF9oZGNwX2hhbmRsZV9jcF9pcnEoKSBpbiBjYXNlCm9mIENQX0lSUSBp
cyB0cmlnZ2VyZWQgYnkgYSBzaW5rIGluIERQLU1TVCB0b3BvbG9neS4KCkNjOiAiVmlsbGUgU3ly
asOkbMOkIiA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBSYW1hbGluZ2FtIEMg
PHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNo
YW5rYXJAaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogUmFtYWxpbmdhbSBDIDxyYW1hbGluZ2FtLmNA
aW50ZWwuY29tPgpUZXN0ZWQtYnk6IEthcnRoaWsgQiBTIDxrYXJ0aGlrLmIuc0BpbnRlbC5jb20+
ClNpZ25lZC1vZmYtYnk6IEFuc2h1bWFuIEd1cHRhIDxhbnNodW1hbi5ndXB0YUBpbnRlbC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jIHwgMTQgKysrKysr
KysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCmluZGV4IDM4OTZkMDhjNDE3
Ny4uNGUyMWM5NzZkYmE4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2RwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5j
CkBAIC01NzcxLDYgKzU3NzEsMTcgQEAgc3RhdGljIHZvaWQgaW50ZWxfZHBfaGFuZGxlX3Rlc3Rf
cmVxdWVzdChzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKQogCQkJICAgICJDb3VsZCBub3Qgd3Jp
dGUgdGVzdCByZXNwb25zZSB0byBzaW5rXG4iKTsKIH0KIAorc3RhdGljIHZvaWQKK2ludGVsX2Rw
X21zdF9ocGRfaXJxKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsIHU4ICplc2ksIGJvb2wgKmhh
bmRsZWQpCit7CisJCWRybV9kcF9tc3RfaHBkX2lycSgmaW50ZWxfZHAtPm1zdF9tZ3IsIGVzaSwg
aGFuZGxlZCk7CisKKwkJaWYgKGVzaVsxXSAmIERQX0NQX0lSUSkgeworCQkJaW50ZWxfaGRjcF9o
YW5kbGVfY3BfaXJxKGludGVsX2RwLT5hdHRhY2hlZF9jb25uZWN0b3IpOworCQkJKmhhbmRsZWQg
PSB0cnVlOworCQl9Cit9CisKIC8qKgogICogaW50ZWxfZHBfY2hlY2tfbXN0X3N0YXR1cyAtIHNl
cnZpY2UgYW55IHBlbmRpbmcgTVNUIGludGVycnVwdHMsIGNoZWNrIGxpbmsgc3RhdHVzCiAgKiBA
aW50ZWxfZHA6IEludGVsIERQIHN0cnVjdApAQCAtNTgxNSw3ICs1ODI2LDggQEAgaW50ZWxfZHBf
Y2hlY2tfbXN0X3N0YXR1cyhzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKQogCiAJCWRybV9kYmdf
a21zKCZpOTE1LT5kcm0sICJnb3QgZXNpICUzcGhcbiIsIGVzaSk7CiAKLQkJZHJtX2RwX21zdF9o
cGRfaXJxKCZpbnRlbF9kcC0+bXN0X21nciwgZXNpLCAmaGFuZGxlZCk7CisJCWludGVsX2RwX21z
dF9ocGRfaXJxKGludGVsX2RwLCBlc2ksICZoYW5kbGVkKTsKKwogCQlpZiAoIWhhbmRsZWQpCiAJ
CQlicmVhazsKIAotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
