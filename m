Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B27B42AE904
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 07:35:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA9D89DEC;
	Wed, 11 Nov 2020 06:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2800B89DEC;
 Wed, 11 Nov 2020 06:35:16 +0000 (UTC)
IronPort-SDR: uhTrI5D2f1g4hxv0pzYzlS80ZIWUsIp1fLyAwY/BnxWZQppM+5lFfeR/GzOUTzEGt7HY2oyxNh
 VqZGs7bX++Lw==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="166593682"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="166593682"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 22:35:15 -0800
IronPort-SDR: DtBX7MeJVugHnuFu728HaaWqHIXaQg9OafKmFI/t0dyqfb4Y6dkvbigE14ADFhV+yLAYCQMsnJ
 ZYT6FJUoYlWA==
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="366139254"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 22:35:12 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 03/17] drm/i915/hotplug: Handle CP_IRQ for DP-MST
Date: Wed, 11 Nov 2020 11:50:37 +0530
Message-Id: <20201111062051.11529-4-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201111062051.11529-1-anshuman.gupta@intel.com>
References: <20201111062051.11529-1-anshuman.gupta@intel.com>
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
PHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNo
YW5rYXJAaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogUmFtYWxpbmdhbSBDIDxyYW1hbGluZ2FtLmNA
aW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbnNodW1hbiBHdXB0YSA8YW5zaHVtYW4uZ3VwdGFA
aW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyB8
IDE0ICsrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwppbmRleCBj
ZjA5YWNhNzYwN2IuLjc0MGYzMGJhY2ZhOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZHAuYwpAQCAtNTcxMSw2ICs1NzExLDE3IEBAIHN0YXRpYyB2b2lkIGludGVsX2RwX2hh
bmRsZV90ZXN0X3JlcXVlc3Qoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCkKIAkJCSAgICAiQ291
bGQgbm90IHdyaXRlIHRlc3QgcmVzcG9uc2UgdG8gc2lua1xuIik7CiB9CiAKK3N0YXRpYyB2b2lk
CitpbnRlbF9kcF9tc3RfaHBkX2lycShzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLCB1OCAqZXNp
LCBib29sICpoYW5kbGVkKQoreworCQlkcm1fZHBfbXN0X2hwZF9pcnEoJmludGVsX2RwLT5tc3Rf
bWdyLCBlc2ksIGhhbmRsZWQpOworCisJCWlmIChlc2lbMV0gJiBEUF9DUF9JUlEpIHsKKwkJCWlu
dGVsX2hkY3BfaGFuZGxlX2NwX2lycShpbnRlbF9kcC0+YXR0YWNoZWRfY29ubmVjdG9yKTsKKwkJ
CSpoYW5kbGVkID0gdHJ1ZTsKKwkJfQorfQorCiAvKioKICAqIGludGVsX2RwX2NoZWNrX21zdF9z
dGF0dXMgLSBzZXJ2aWNlIGFueSBwZW5kaW5nIE1TVCBpbnRlcnJ1cHRzLCBjaGVjayBsaW5rIHN0
YXR1cwogICogQGludGVsX2RwOiBJbnRlbCBEUCBzdHJ1Y3QKQEAgLTU3NTUsNyArNTc2Niw4IEBA
IGludGVsX2RwX2NoZWNrX21zdF9zdGF0dXMoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCkKIAog
CQlkcm1fZGJnX2ttcygmaTkxNS0+ZHJtLCAiZ290IGVzaSAlM3BoXG4iLCBlc2kpOwogCi0JCWRy
bV9kcF9tc3RfaHBkX2lycSgmaW50ZWxfZHAtPm1zdF9tZ3IsIGVzaSwgJmhhbmRsZWQpOworCQlp
bnRlbF9kcF9tc3RfaHBkX2lycShpbnRlbF9kcCwgZXNpLCAmaGFuZGxlZCk7CisKIAkJaWYgKCFo
YW5kbGVkKQogCQkJYnJlYWs7CiAKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
