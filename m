Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDF1108B7
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2019 16:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D0B8938C;
	Wed,  1 May 2019 14:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CC58938C;
 Wed,  1 May 2019 14:03:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 May 2019 07:03:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,417,1549958400"; d="scan'208";a="145141419"
Received: from nperf12.hd.intel.com ([10.127.88.161])
 by fmsmga008.fm.intel.com with ESMTP; 01 May 2019 07:03:06 -0700
From: Brian Welty <brian.welty@intel.com>
To: cgroups@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Li Zefan <lizefan@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-mm@kvack.org, Michal Hocko <mhocko@kernel.org>,
 Vladimir Davydov <vdavydov.dev@gmail.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 ChunMing Zhou <David1.Zhou@amd.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>
Subject: [RFC PATCH 5/5] drm/i915: Use memory cgroup for enforcing device
 memory limit
Date: Wed,  1 May 2019 10:04:38 -0400
Message-Id: <20190501140438.9506-6-brian.welty@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190501140438.9506-1-brian.welty@intel.com>
References: <20190501140438.9506-1-brian.welty@intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aTkxNSBkcml2ZXIgbm93IGluY2x1ZGVzIERSSVZFUl9DR1JPVVBTIGluIGZlYXR1cmUgYml0cy4K
ClRvIGNoYXJnZSBkZXZpY2UgbWVtb3J5IGFsbG9jYXRpb25zLCB3ZSBuZWVkIHRvICgxKSBpZGVu
dGlmeSBhcHByb3ByaWF0ZQpjZ3JvdXAgdG8gY2hhcmdlIChjdXJyZW50bHkgZGVjaWRlZCBhdCBv
YmplY3QgY3JlYXRpb24gdGltZSksIGFuZCAoMikKbWFrZSB0aGUgY2hhcmdpbmcgY2FsbCBhdCB0
aGUgdGltZSB0aGF0IG1lbW9yeSBwYWdlcyBhcmUgYmVpbmcgYWxsb2NhdGVkLgoKRm9yICgxKSwg
c2VlIHByaW9yIERSTSBwYXRjaCB3aGljaCBhc3NvY2lhdGVzIGN1cnJlbnQgdGFzaydzIGNncm91
cCB3aXRoCkdFTSBvYmplY3RzIGFzIHRoZXkgYXJlIGNyZWF0ZWQuICBUaGF0IGNncm91cCB3aWxs
IGJlIGNoYXJnZWQvdW5jaGFyZ2VkCmZvciBhbGwgcGFnaW5nIGFjdGl2aXR5IGFnYWluc3QgdGhl
IEdFTSBvYmplY3QuCgpGb3IgKDIpLCB3ZSBjYWxsIG1lbV9jZ3JvdXBfdHJ5X2NoYXJnZV9kaXJl
Y3QoKSBpbiAuZ2V0X3BhZ2VzIGNhbGxiYWNrCmZvciB0aGUgR0VNIG9iamVjdCB0eXBlLiAgVW5j
aGFyZ2luZyBpcyBkb25lIGluIC5wdXRfcGFnZXMgd2hlbiB0aGUKbWVtb3J5IGlzIG1hcmtlZCBz
dWNoIHRoYXQgaXQgY2FuIGJlIGV2aWN0ZWQuICBUaGUgdHJ5X2NoYXJnZSgpIGNhbGwgd2lsbApm
YWlsIHdpdGggLUVOT01FTSBpZiB0aGUgY3VycmVudCBtZW1vcnkgYWxsb2NhdGlvbiB3aWxsIGV4
Y2VlZCB0aGUgY2dyb3VwCmRldmljZSBtZW1vcnkgbWF4aW11bSwgYW5kIGFsbG93IGZvciBkcml2
ZXIgdG8gcGVyZm9ybSBtZW1vcnkgcmVjbGFpbS4KCkNjOiBjZ3JvdXBzQHZnZXIua2VybmVsLm9y
ZwpDYzogbGludXgtbW1Aa3ZhY2sub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCkNjOiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPgpTaWduZWQtb2Zm
LWJ5OiBCcmlhbiBXZWx0eSA8YnJpYW4ud2VsdHlAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfZHJ2LmMgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9pbnRlbF9tZW1vcnlfcmVnaW9uLmMgfCAyNCArKysrKysrKysrKysrKysrKystLS0tCiAy
IGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfZHJ2LmMKaW5kZXggNWEwYTU5OTIyY2I0Li40ZDQ5NmMzYzM2ODEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaTkxNV9kcnYuYwpAQCAtMzQ2OSw3ICszNDY5LDcgQEAgc3RhdGljIHN0cnVjdCBkcm1f
ZHJpdmVyIGRyaXZlciA9IHsKIAkgKiBkZWFsIHdpdGggdGhlbSBmb3IgSW50ZWwgaGFyZHdhcmUu
CiAJICovCiAJLmRyaXZlcl9mZWF0dXJlcyA9Ci0JICAgIERSSVZFUl9HRU0gfCBEUklWRVJfUFJJ
TUUgfAorCSAgICBEUklWRVJfR0VNIHwgRFJJVkVSX1BSSU1FIHwgRFJJVkVSX0NHUk9VUFMgfAog
CSAgICBEUklWRVJfUkVOREVSIHwgRFJJVkVSX01PREVTRVQgfCBEUklWRVJfQVRPTUlDIHwgRFJJ
VkVSX1NZTkNPQkosCiAJLnJlbGVhc2UgPSBpOTE1X2RyaXZlcl9yZWxlYXNlLAogCS5vcGVuID0g
aTkxNV9kcml2ZXJfb3BlbiwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVs
X21lbW9yeV9yZWdpb24uYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX21lbW9yeV9yZWdp
b24uYwppbmRleCA4MTNmZjgzYzEzMmIuLmU0YWM1ZTRkNDg1NyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaW50ZWxfbWVtb3J5X3JlZ2lvbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2ludGVsX21lbW9yeV9yZWdpb24uYwpAQCAtNTMsNiArNTMsOCBAQCBpOTE1X21lbW9y
eV9yZWdpb25fcHV0X3BhZ2VzX2J1ZGR5KHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmos
CiAJbXV0ZXhfdW5sb2NrKCZvYmotPm1lbW9yeV9yZWdpb24tPm1tX2xvY2spOwogCiAJb2JqLT5t
bS5kaXJ0eSA9IGZhbHNlOworCW1lbV9jZ3JvdXBfdW5jaGFyZ2VfZGlyZWN0KG9iai0+YmFzZS5t
ZW1jZywKKwkJCQkgICBvYmotPmJhc2Uuc2l6ZSA+PiBQQUdFX1NISUZUKTsKIH0KIAogaW50CkBA
IC02NSwxOSArNjcsMjkgQEAgaTkxNV9tZW1vcnlfcmVnaW9uX2dldF9wYWdlc19idWRkeShzdHJ1
Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqKQogCXN0cnVjdCBzY2F0dGVybGlzdCAqc2c7CiAJ
dW5zaWduZWQgaW50IHNnX3BhZ2Vfc2l6ZXM7CiAJdW5zaWduZWQgbG9uZyBuX3BhZ2VzOworCWlu
dCBlcnI7CiAKIAlHRU1fQlVHX09OKCFJU19BTElHTkVEKHNpemUsIG1lbS0+bW0ubWluX3NpemUp
KTsKIAlHRU1fQlVHX09OKCFsaXN0X2VtcHR5KCZvYmotPmJsb2NrcykpOwogCisJZXJyID0gbWVt
X2Nncm91cF90cnlfY2hhcmdlX2RpcmVjdChvYmotPmJhc2UubWVtY2csIHNpemUgPj4gUEFHRV9T
SElGVCk7CisJaWYgKGVycikgeworCQlEUk1fREVCVUcoIk1FTUNHOiB0cnlfY2hhcmdlIGZhaWxl
ZCBmb3IgJWxsZFxuIiwgc2l6ZSk7CisJCXJldHVybiBlcnI7CisJfQorCiAJc3QgPSBrbWFsbG9j
KHNpemVvZigqc3QpLCBHRlBfS0VSTkVMKTsKLQlpZiAoIXN0KQotCQlyZXR1cm4gLUVOT01FTTsK
KwlpZiAoIXN0KSB7CisJCWVyciA9IC1FTk9NRU07CisJCWdvdG8gZXJyX3VuY2hhcmdlOworCX0K
IAogCW5fcGFnZXMgPSBkaXY2NF91NjQoc2l6ZSwgbWVtLT5tbS5taW5fc2l6ZSk7CiAKIAlpZiAo
c2dfYWxsb2NfdGFibGUoc3QsIG5fcGFnZXMsIEdGUF9LRVJORUwpKSB7CiAJCWtmcmVlKHN0KTsK
LQkJcmV0dXJuIC1FTk9NRU07CisJCWVyciA9IC1FTk9NRU07CisJCWdvdG8gZXJyX3VuY2hhcmdl
OwogCX0KIAogCXNnID0gc3QtPnNnbDsKQEAgLTE2MSw3ICsxNzMsMTEgQEAgaTkxNV9tZW1vcnlf
cmVnaW9uX2dldF9wYWdlc19idWRkeShzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqKQog
ZXJyX2ZyZWVfYmxvY2tzOgogCW1lbW9yeV9yZWdpb25fZnJlZV9wYWdlcyhvYmosIHN0KTsKIAlt
dXRleF91bmxvY2soJm1lbS0+bW1fbG9jayk7Ci0JcmV0dXJuIC1FTlhJTzsKKwllcnIgPSAtRU5Y
SU87CitlcnJfdW5jaGFyZ2U6CisJbWVtX2Nncm91cF91bmNoYXJnZV9kaXJlY3Qob2JqLT5iYXNl
Lm1lbWNnLAorCQkJCSAgIG9iai0+YmFzZS5zaXplID4+IFBBR0VfU0hJRlQpOworCXJldHVybiBl
cnI7CiB9CiAKIGludCBpOTE1X21lbW9yeV9yZWdpb25faW5pdF9idWRkeShzdHJ1Y3QgaW50ZWxf
bWVtb3J5X3JlZ2lvbiAqbWVtKQotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
