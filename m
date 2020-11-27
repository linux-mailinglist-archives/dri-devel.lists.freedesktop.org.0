Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1CF2C646C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9162B6EC26;
	Fri, 27 Nov 2020 12:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C166EC2E;
 Fri, 27 Nov 2020 12:08:05 +0000 (UTC)
IronPort-SDR: I/1cHq4O9MxXB7g4mIKtB8BE1/UkS5QFV9sSa4RXFGogP5WZOL2x1lJqEz6FoLPANeM+zvCNTB
 7HrFK8gtp7vQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883401"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883401"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:04 -0800
IronPort-SDR: 6yd9VFaN60o2mfU3CJLpe2Hw/beTC+22+o2GyCo3FP3FPiHoSPC95/TxNKAMUdj2lMe7e6ON7N
 Ne/UnwFy3asw==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028625"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:03 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 021/162] drm/i915: No longer allow exporting userptr
 through dma-buf
Date: Fri, 27 Nov 2020 12:04:57 +0000
Message-Id: <20201127120718.454037-22-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bT4KCkl0IGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBleHBvcnQgYSBtZW1vcnkgYWRkcmVzcywgd2Ug
d2lsbCBwcmV2ZW50CmFsbG93aW5nIGFjY2VzcyB0aGlzIHdheSB0byBkaWZmZXJlbnQgYWRkcmVz
cyBzcGFjZXMgd2hlbiB3ZQpyZXdvcmsgdXNlcnB0ciBoYW5kbGluZywgc28gYmVzdCB0byBleHBs
aWNpdGx5IGRpc2FibGUgaXQuCgpTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFh
cnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRo
b21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2dlbS9pOTE1X2dlbV91c2VycHRyLmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2dlbS9pOTE1X2dlbV91c2VycHRyLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkx
NV9nZW1fdXNlcnB0ci5jCmluZGV4IDhjM2QxZWIyZjk2YS4uNDRhZjYyNjU5NDhkIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdXNlcnB0ci5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV91c2VycHRyLmMKQEAgLTY5NCwxMCArNjk0
LDkgQEAgaTkxNV9nZW1fdXNlcnB0cl9yZWxlYXNlKHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0
ICpvYmopCiBzdGF0aWMgaW50CiBpOTE1X2dlbV91c2VycHRyX2RtYWJ1Zl9leHBvcnQoc3RydWN0
IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaikKIHsKLQlpZiAob2JqLT51c2VycHRyLm1tdV9vYmpl
Y3QpCi0JCXJldHVybiAwOworCWRybV9kYmcob2JqLT5iYXNlLmRldiwgIkV4cG9ydGluZyB1c2Vy
cHRyIG5vIGxvbmdlciBhbGxvd2VkXG4iKTsKIAotCXJldHVybiBpOTE1X2dlbV91c2VycHRyX2lu
aXRfX21tdV9ub3RpZmllcihvYmosIDApOworCXJldHVybiAtRUlOVkFMOwogfQogCiBzdGF0aWMg
aW50Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
