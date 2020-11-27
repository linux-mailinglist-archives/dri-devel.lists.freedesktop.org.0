Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD362C6467
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C636EC27;
	Fri, 27 Nov 2020 12:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D580A6EC28;
 Fri, 27 Nov 2020 12:08:04 +0000 (UTC)
IronPort-SDR: 3rGWOYd+cvbApxrhArizYcOM/ggkl2hDqW6bxTRfmSHqq6ZHOtp3Jgxi8TxMhrELHZM7EtJDIK
 ImG5fqyV92iQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883398"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883398"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:03 -0800
IronPort-SDR: lsHrHGgtaxRiy/UT7mCLUrOJ/h+k5Qkj/94OqQv+9h7ltok3ZtIBJt2bjEG1Zk8fLNQEisak86
 gYgjipFk3yzg==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028617"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:01 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 020/162] drm/i915: Disable userptr pread/pwrite support.
Date: Fri, 27 Nov 2020 12:04:56 +0000
Message-Id: <20201127120718.454037-21-matthew.auld@intel.com>
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
bT4KClVzZXJwdHIgc2hvdWxkIG5vdCBuZWVkIHRoZSBrZXJuZWwgZm9yIGEgdXNlcnNwYWNlIG1l
bWNweSwgdXNlcnNwYWNlCm5lZWRzIHRvIGNhbGwgbWVtY3B5IGRpcmVjdGx5LgoKU3BlY2lmaWNh
bGx5LCBkaXNhYmxlIGk5MTVfZ2VtX3B3cml0ZV9pb2N0bCgpIGFuZCBpOTE1X2dlbV9wcmVhZF9p
b2N0bCgpLgoKU3RpbGwgbmVlZHMgYW4gYWNrIGZyb20gcmVsZXZhbnQgdXNlcnNwYWNlIHRoYXQg
aXQgd29uJ3QgYnJlYWssCmJ1dCBzaG91bGQgYmUgZ29vZC4KClNpZ25lZC1vZmYtYnk6IE1hYXJ0
ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBUaG9t
YXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3VzZXJwdHIuYyB8IDIwICsrKysrKysrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV91c2VycHRyLmMgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdXNlcnB0ci5jCmluZGV4IDMwZWRjNWEwYTU0ZS4uOGMz
ZDFlYjJmOTZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1f
dXNlcnB0ci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV91c2VycHRy
LmMKQEAgLTcwMCw2ICs3MDAsMjQgQEAgaTkxNV9nZW1fdXNlcnB0cl9kbWFidWZfZXhwb3J0KHN0
cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmopCiAJcmV0dXJuIGk5MTVfZ2VtX3VzZXJwdHJf
aW5pdF9fbW11X25vdGlmaWVyKG9iaiwgMCk7CiB9CiAKK3N0YXRpYyBpbnQKK2k5MTVfZ2VtX3Vz
ZXJwdHJfcHdyaXRlKHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmosCisJCQljb25zdCBz
dHJ1Y3QgZHJtX2k5MTVfZ2VtX3B3cml0ZSAqYXJncykKK3sKKwlkcm1fZGJnKG9iai0+YmFzZS5k
ZXYsICJwd3JpdGUgdG8gdXNlcnB0ciBubyBsb25nZXIgYWxsb3dlZFxuIik7CisKKwlyZXR1cm4g
LUVJTlZBTDsKK30KKworc3RhdGljIGludAoraTkxNV9nZW1fdXNlcnB0cl9wcmVhZChzdHJ1Y3Qg
ZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqLAorCQkgICAgICAgY29uc3Qgc3RydWN0IGRybV9pOTE1
X2dlbV9wcmVhZCAqYXJncykKK3sKKwlkcm1fZGJnKG9iai0+YmFzZS5kZXYsICJwcmVhZCBmcm9t
IHVzZXJwdHIgbm8gbG9uZ2VyIGFsbG93ZWRcbiIpOworCisJcmV0dXJuIC1FSU5WQUw7Cit9CisK
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdF9vcHMgaTkxNV9nZW1fdXNl
cnB0cl9vcHMgPSB7CiAJLm5hbWUgPSAiaTkxNV9nZW1fb2JqZWN0X3VzZXJwdHIiLAogCS5mbGFn
cyA9IEk5MTVfR0VNX09CSkVDVF9JU19TSFJJTktBQkxFIHwKQEAgLTcwOCw2ICs3MjYsOCBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3Rfb3BzIGk5MTVfZ2VtX3VzZXJw
dHJfb3BzID0gewogCS5nZXRfcGFnZXMgPSBpOTE1X2dlbV91c2VycHRyX2dldF9wYWdlcywKIAku
cHV0X3BhZ2VzID0gaTkxNV9nZW1fdXNlcnB0cl9wdXRfcGFnZXMsCiAJLmRtYWJ1Zl9leHBvcnQg
PSBpOTE1X2dlbV91c2VycHRyX2RtYWJ1Zl9leHBvcnQsCisJLnB3cml0ZSA9IGk5MTVfZ2VtX3Vz
ZXJwdHJfcHdyaXRlLAorCS5wcmVhZCA9IGk5MTVfZ2VtX3VzZXJwdHJfcHJlYWQsCiAJLnJlbGVh
c2UgPSBpOTE1X2dlbV91c2VycHRyX3JlbGVhc2UsCiB9OwogCi0tIAoyLjI2LjIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
