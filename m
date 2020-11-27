Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA9D2C647C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B939C6EC48;
	Fri, 27 Nov 2020 12:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205AF6EC4B;
 Fri, 27 Nov 2020 12:08:33 +0000 (UTC)
IronPort-SDR: cEeZzoLeBl50SBmiPGQ6f9DXOMCacW5la26n0NSXEDwv207EBy393oqqesQFFc81b+sgBJUAka
 /Wxy1rvjZ7cA==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883460"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883460"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:32 -0800
IronPort-SDR: FnbLSgUwKk0+B9ZX/7pd5lm7svk0M1wRcN1fMQE7pot4AblJQvx71XO0RnrmgOerRWJ8a3Tcjf
 NqWQ4a4FX+uQ==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028740"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:30 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 036/162] drm/i915: Make __engine_unpark() compatible with
 ww locking v2
Date: Fri, 27 Nov 2020 12:05:12 +0000
Message-Id: <20201127120718.454037-37-matthew.auld@intel.com>
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
bT4KClRha2UgdGhlIHd3IGxvY2sgYXJvdW5kIGVuZ2luZV91bnBhcmsuIEJlY2F1c2Ugb2YgdGhl
Cm1hbnkgbWFueSBwbGFjZXMgd2hlcmUgcnBtIGlzIHVzZWQsIEkgY2hvc2UgdGhlIHNhZmVzdCBv
cHRpb24KYW5kIHVzZWQgYSB0cnlsb2NrIHRvIG9wcG9ydHVuaXN0aWNhbGx5IHRha2UgdGhpcyBs
b2NrIGZvcgpfX2VuZ2luZV91bnBhcmsuCgpTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3Jz
dCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogVGhvbWFzIEhlbGxzdHLD
tm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d0L2ludGVsX2VuZ2luZV9wbS5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxf
ZW5naW5lX3BtLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9lbmdpbmVfcG0uYwpp
bmRleCA0OTliMDljYjRhY2YuLjVkNTExNDRlZjA3NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3QvaW50ZWxfZW5naW5lX3BtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3QvaW50ZWxfZW5naW5lX3BtLmMKQEAgLTI3LDEyICsyNywxNiBAQCBzdGF0aWMgdm9pZCBkYmdf
cG9pc29uX2NlKHN0cnVjdCBpbnRlbF9jb250ZXh0ICpjZSkKIAkJaW50IHR5cGUgPSBpOTE1X2Nv
aGVyZW50X21hcF90eXBlKGNlLT5lbmdpbmUtPmk5MTUpOwogCQl2b2lkICptYXA7CiAKKwkJaWYg
KCFpOTE1X2dlbV9vYmplY3RfdHJ5bG9jayhjZS0+c3RhdGUtPm9iaikpCisJCQlyZXR1cm47CisK
IAkJbWFwID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9tYXAob2JqLCB0eXBlKTsKIAkJaWYgKCFJU19F
UlIobWFwKSkgewogCQkJbWVtc2V0KG1hcCwgQ09OVEVYVF9SRURaT05FLCBvYmotPmJhc2Uuc2l6
ZSk7CiAJCQlpOTE1X2dlbV9vYmplY3RfZmx1c2hfbWFwKG9iaik7CiAJCQlpOTE1X2dlbV9vYmpl
Y3RfdW5waW5fbWFwKG9iaik7CiAJCX0KKwkJaTkxNV9nZW1fb2JqZWN0X3VubG9jayhvYmopOwog
CX0KIH0KIAotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
