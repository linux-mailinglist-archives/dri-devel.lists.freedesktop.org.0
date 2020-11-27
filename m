Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 756442C6490
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:09:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45986EC5D;
	Fri, 27 Nov 2020 12:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6AF6EC4E;
 Fri, 27 Nov 2020 12:08:46 +0000 (UTC)
IronPort-SDR: yyH25yHFwchO9GrOL8TRwIiEVzsyt5a1coMD/GJQ6aIk85+ncs58Iaen4js+SbFLFzVYMULiHR
 s2HxidCXfKqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540583"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540583"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:44 -0800
IronPort-SDR: zI7tV+DT9+6MvJfeA9aRgMXBR4Uw4BGYNsHtsh4b9lsO9A1RfkGpxAFyIxM+76s9WMaxR3m0fU
 tF1NHoAqdLOQ==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028793"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:43 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 043/162] drm/i915: Add ww locking around vm_access()
Date: Fri, 27 Nov 2020 12:05:19 +0000
Message-Id: <20201127120718.454037-44-matthew.auld@intel.com>
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
bT4KCmk5MTVfZ2VtX29iamVjdF9waW5fbWFwIHBvdGVudGlhbGx5IG5lZWRzIGEgd3cgY29udGV4
dCwgc28gZW5zdXJlIHdlCmhhdmUgb25lIHdlIGNhbiByZXZva2UuCgpTaWduZWQtb2ZmLWJ5OiBN
YWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzog
VGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9tbWFuLmMgfCAyNCArKysrKysrKysr
KysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9t
bWFuLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fbW1hbi5jCmluZGV4IDE2
MzIwOGE2MjYwZC4uMjU2MWEyZjFlNTRmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9nZW0vaTkxNV9nZW1fbW1hbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1
X2dlbV9tbWFuLmMKQEAgLTQyMSw3ICs0MjEsOSBAQCB2bV9hY2Nlc3Moc3RydWN0IHZtX2FyZWFf
c3RydWN0ICphcmVhLCB1bnNpZ25lZCBsb25nIGFkZHIsCiB7CiAJc3RydWN0IGk5MTVfbW1hcF9v
ZmZzZXQgKm1tbyA9IGFyZWEtPnZtX3ByaXZhdGVfZGF0YTsKIAlzdHJ1Y3QgZHJtX2k5MTVfZ2Vt
X29iamVjdCAqb2JqID0gbW1vLT5vYmo7CisJc3RydWN0IGk5MTVfZ2VtX3d3X2N0eCB3dzsKIAl2
b2lkICp2YWRkcjsKKwlpbnQgZXJyID0gMDsKIAogCWlmIChpOTE1X2dlbV9vYmplY3RfaXNfcmVh
ZG9ubHkob2JqKSAmJiB3cml0ZSkKIAkJcmV0dXJuIC1FQUNDRVM7CkBAIC00MzAsMTAgKzQzMiwx
OCBAQCB2bV9hY2Nlc3Moc3RydWN0IHZtX2FyZWFfc3RydWN0ICphcmVhLCB1bnNpZ25lZCBsb25n
IGFkZHIsCiAJaWYgKGFkZHIgPj0gb2JqLT5iYXNlLnNpemUpCiAJCXJldHVybiAtRUlOVkFMOwog
CisJaTkxNV9nZW1fd3dfY3R4X2luaXQoJnd3LCB0cnVlKTsKK3JldHJ5OgorCWVyciA9IGk5MTVf
Z2VtX29iamVjdF9sb2NrKG9iaiwgJnd3KTsKKwlpZiAoZXJyKQorCQlnb3RvIG91dDsKKwogCS8q
IEFzIHRoaXMgaXMgcHJpbWFyaWx5IGZvciBkZWJ1Z2dpbmcsIGxldCdzIGZvY3VzIG9uIHNpbXBs
aWNpdHkgKi8KIAl2YWRkciA9IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwKG9iaiwgSTkxNV9NQVBf
Rk9SQ0VfV0MpOwotCWlmIChJU19FUlIodmFkZHIpKQotCQlyZXR1cm4gUFRSX0VSUih2YWRkcik7
CisJaWYgKElTX0VSUih2YWRkcikpIHsKKwkJZXJyID0gUFRSX0VSUih2YWRkcik7CisJCWdvdG8g
b3V0OworCX0KIAogCWlmICh3cml0ZSkgewogCQltZW1jcHkodmFkZHIgKyBhZGRyLCBidWYsIGxl
bik7CkBAIC00NDMsNiArNDUzLDE2IEBAIHZtX2FjY2VzcyhzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KmFyZWEsIHVuc2lnbmVkIGxvbmcgYWRkciwKIAl9CiAKIAlpOTE1X2dlbV9vYmplY3RfdW5waW5f
bWFwKG9iaik7CitvdXQ6CisJaWYgKGVyciA9PSAtRURFQURMSykgeworCQllcnIgPSBpOTE1X2dl
bV93d19jdHhfYmFja29mZigmd3cpOworCQlpZiAoIWVycikKKwkJCWdvdG8gcmV0cnk7CisJfQor
CWk5MTVfZ2VtX3d3X2N0eF9maW5pKCZ3dyk7CisKKwlpZiAoZXJyKQorCQlyZXR1cm4gZXJyOwog
CiAJcmV0dXJuIGxlbjsKIH0KLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
