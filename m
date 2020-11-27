Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725CB2C6493
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:09:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773026EC63;
	Fri, 27 Nov 2020 12:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDEDF6EC53;
 Fri, 27 Nov 2020 12:08:53 +0000 (UTC)
IronPort-SDR: i50nepYTHVa+fcxAmbBqaL766Y383UD35toriHR3QozPDxJbo+F3Rlx3TZOjMu66KU3PlOV85Q
 yyHivgMKFjng==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540601"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540601"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:53 -0800
IronPort-SDR: 6gJBYWkYbfK5N3D4fpeas+Ktgs0pKlzP+pohDlbzQpfBGOEw+IlVBIxozjNQuhKsnogCS6iHTR
 hFPLNTS6HeJg==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028815"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:52 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 048/162] drm/i915: Fix ww locking in
 shmem_create_from_object
Date: Fri, 27 Nov 2020 12:05:24 +0000
Message-Id: <20201127120718.454037-49-matthew.auld@intel.com>
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
bT4KClF1aWNrIGZpeCwganVzdCB1c2UgdGhlIHVubG9ja2VkIHZlcnNpb24uCgpTaWduZWQtb2Zm
LWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29t
PgpDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3NobWVtX3V0aWxzLmMgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9zaG1lbV91dGlscy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Qvc2htZW1fdXRpbHMuYwppbmRleCBmMDExZWE0MjQ4N2UuLjA0MWUyYTUwMTYwZCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2htZW1fdXRpbHMuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndC9zaG1lbV91dGlscy5jCkBAIC0zOSw3ICszOSw3IEBAIHN0cnVj
dCBmaWxlICpzaG1lbV9jcmVhdGVfZnJvbV9vYmplY3Qoc3RydWN0IGRybV9pOTE1X2dlbV9vYmpl
Y3QgKm9iaikKIAkJcmV0dXJuIGZpbGU7CiAJfQogCi0JcHRyID0gaTkxNV9nZW1fb2JqZWN0X3Bp
bl9tYXAob2JqLCBJOTE1X01BUF9XQik7CisJcHRyID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9tYXBf
dW5sb2NrZWQob2JqLCBJOTE1X01BUF9XQik7CiAJaWYgKElTX0VSUihwdHIpKQogCQlyZXR1cm4g
RVJSX0NBU1QocHRyKTsKIAotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
