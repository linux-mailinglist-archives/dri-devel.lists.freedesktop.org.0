Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4A52D53E3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 07:40:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBCF6E9D4;
	Thu, 10 Dec 2020 06:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EF26E9D4;
 Thu, 10 Dec 2020 06:40:30 +0000 (UTC)
IronPort-SDR: IMX94k8roMPwl1H11FqrJ0WSX3diIIhOaBxyxg0fRgYOuGocGrVmJrYuXf0+NQ1qH1+5R95LXk
 OOqgsB4SQUkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="174322172"
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; d="scan'208";a="174322172"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 22:40:30 -0800
IronPort-SDR: UahYE8xcbg0ECslyLDuPRvrx9mJi/15ow0//pLa5ZaOYJIIoQZe/srLfwOdsT7A0S92q2j6t8w
 QUHKpHhsSzvA==
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; d="scan'208";a="318854348"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 22:40:26 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 03/18] drm/i915/hotplug: Handle CP_IRQ for DP-MST
Date: Thu, 10 Dec 2020 11:56:25 +0530
Message-Id: <20201210062640.11783-4-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201210062640.11783-1-anshuman.gupta@intel.com>
References: <20201210062640.11783-1-anshuman.gupta@intel.com>
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
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCmluZGV4IGNiNWU0MmMzZWNk
NS4uNDYzMDAzZmYwZGQ0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2RwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5j
CkBAIC01Nzc1LDYgKzU3NzUsMTcgQEAgc3RhdGljIHZvaWQgaW50ZWxfZHBfaGFuZGxlX3Rlc3Rf
cmVxdWVzdChzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKQogCQkJICAgICJDb3VsZCBub3Qgd3Jp
dGUgdGVzdCByZXNwb25zZSB0byBzaW5rXG4iKTsKIH0KIAorc3RhdGljIHZvaWQKK2ludGVsX2Rw
X21zdF9ocGRfaXJxKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsIHU4ICplc2ksIGJvb2wgKmhh
bmRsZWQpCit7CisJCWRybV9kcF9tc3RfaHBkX2lycSgmaW50ZWxfZHAtPm1zdF9tZ3IsIGVzaSwg
aGFuZGxlZCk7CisKKwkJaWYgKGVzaVsxXSAmIERQX0NQX0lSUSkgeworCQkJaW50ZWxfaGRjcF9o
YW5kbGVfY3BfaXJxKGludGVsX2RwLT5hdHRhY2hlZF9jb25uZWN0b3IpOworCQkJKmhhbmRsZWQg
PSB0cnVlOworCQl9Cit9CisKIC8qKgogICogaW50ZWxfZHBfY2hlY2tfbXN0X3N0YXR1cyAtIHNl
cnZpY2UgYW55IHBlbmRpbmcgTVNUIGludGVycnVwdHMsIGNoZWNrIGxpbmsgc3RhdHVzCiAgKiBA
aW50ZWxfZHA6IEludGVsIERQIHN0cnVjdApAQCAtNTgxOSw3ICs1ODMwLDggQEAgaW50ZWxfZHBf
Y2hlY2tfbXN0X3N0YXR1cyhzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKQogCiAJCWRybV9kYmdf
a21zKCZpOTE1LT5kcm0sICJnb3QgZXNpICUzcGhcbiIsIGVzaSk7CiAKLQkJZHJtX2RwX21zdF9o
cGRfaXJxKCZpbnRlbF9kcC0+bXN0X21nciwgZXNpLCAmaGFuZGxlZCk7CisJCWludGVsX2RwX21z
dF9ocGRfaXJxKGludGVsX2RwLCBlc2ksICZoYW5kbGVkKTsKKwogCQlpZiAoIWhhbmRsZWQpCiAJ
CQlicmVhazsKIAotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
