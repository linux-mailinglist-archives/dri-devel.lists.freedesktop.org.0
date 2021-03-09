Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 553E6331E12
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 05:48:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A78C6E8A8;
	Tue,  9 Mar 2021 04:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4946E8A8;
 Tue,  9 Mar 2021 04:48:45 +0000 (UTC)
IronPort-SDR: spyTqwXfAvVduFWPN0WNJPq4wqZw4AiUTXCtrMyHwMVP2T4TsLfSAXY5E0kGIxYzzF2JrBYG40
 5SmOPQpAGVpQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="184796085"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="184796085"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2021 20:48:45 -0800
IronPort-SDR: +bQBDlU+nxem7pQ6PICjEqEoz2WiLQxRnRusq1tVVxTIOSEdmOKc9A5oLqTSrVW3U9+hEHBlw2
 0mI4FMsCBuzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="376369259"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by fmsmga007.fm.intel.com with ESMTP; 08 Mar 2021 20:48:43 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 2/3] drm/i915/display: Remove FRL related code from disable
 DP sequence for older platforms
Date: Tue,  9 Mar 2021 10:09:14 +0530
Message-Id: <20210309043915.1921-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210309043915.1921-1-ankit.k.nautiyal@intel.com>
References: <20210309043915.1921-1-ankit.k.nautiyal@intel.com>
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
Cc: airlied@linux.ie, uma.shankar@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVtb3ZlIGNvZGUgZm9yIHJlc2V0dGluZyBmcmwgcmVsYXRlZCBtZW1iZXJzIGZyb20gaW50ZWxf
ZGlzYWJsZV9kcCwgYXMKdGhpcyBpcyBub3QgYXBwbGljYWJsZSBmb3Igb2xkZXIgcGxhdGZvcm1z
LgoKU2lnbmVkLW9mZi1ieTogQW5raXQgTmF1dGl5YWwgPGFua2l0LmsubmF1dGl5YWxAaW50ZWwu
Y29tPgpSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4Lmlu
dGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgfCAy
IC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2RwLmMKaW5kZXggODVlYzc0YWU5NTJlLi4yZTkwMzU5Y2UyMWYgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKQEAgLTIzODYsOCArMjM4Niw2IEBA
IHN0YXRpYyB2b2lkIGludGVsX2Rpc2FibGVfZHAoc3RydWN0IGludGVsX2F0b21pY19zdGF0ZSAq
c3RhdGUsCiAJaW50ZWxfZWRwX2JhY2tsaWdodF9vZmYob2xkX2Nvbm5fc3RhdGUpOwogCWludGVs
X2RwX3NldF9wb3dlcihpbnRlbF9kcCwgRFBfU0VUX1BPV0VSX0QzKTsKIAlpbnRlbF9wcHNfb2Zm
KGludGVsX2RwKTsKLQlpbnRlbF9kcC0+ZnJsLmlzX3RyYWluZWQgPSBmYWxzZTsKLQlpbnRlbF9k
cC0+ZnJsLnRyYWluZWRfcmF0ZV9nYnBzID0gMDsKIH0KIAogc3RhdGljIHZvaWQgZzR4X2Rpc2Fi
bGVfZHAoc3RydWN0IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsCi0tIAoyLjI5LjIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
