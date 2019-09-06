Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB54AB408
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 10:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DA36E1B9;
	Fri,  6 Sep 2019 08:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6786E1F2;
 Fri,  6 Sep 2019 08:29:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Sep 2019 01:29:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,472,1559545200"; d="scan'208";a="195378417"
Received: from slisovsk-lenovo-ideapad-720s-13ikb.fi.intel.com ([10.237.72.89])
 by orsmga002.jf.intel.com with ESMTP; 06 Sep 2019 01:28:54 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 3/3] drm/i915: Send hotplug event if edid had changed
Date: Fri,  6 Sep 2019 11:26:36 +0300
Message-Id: <20190906082636.3103-4-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190906082636.3103-1-stanislav.lisovskiy@intel.com>
References: <20190906082636.3103-1-stanislav.lisovskiy@intel.com>
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
Cc: simon.ser@intel.com, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, martin.peres@intel.com,
 Stanislav.Lisovskiy@intel.com, jani.saarinen@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkZWQgZXBvY2ggY291bnRlciBjaGVja2luZyB0byBpbnRlbF9lbmNvZGVyX2hvdHBsdWcKaW4g
b3JkZXIgdG8gYmUgYWJsZSBwcm9jZXNzIGFsbCB0aGUgY29ubmVjdG9yIGNoYW5nZXMsCmJlc2lk
ZXMgY29ubmVjdGlvbiBzdGF0dXMuIEFsc28gbm93IGFueSBjaGFuZ2UgaW4gY29ubmVjdG9yCndv
dWxkIHJlc3VsdCBpbiBlcG9jaCBjb3VudGVyIGNoYW5nZSwgc28gbm8gbXVsdGlwbGUgY2hlY2tz
CmFyZSBuZWVkZWQuCgp2MjogUmVuYW1lZCBjaGFuZ2UgY291bnRlciB0byBlcG9jaCBjb3VudGVy
LiBGaXhlZCB0eXBlIG5hbWUuCgp2MzogRml4ZWQgcmViYXNlIGNvbmZsaWN0Cgp2NDogUmVtb3Zl
IGR1cGxpY2F0ZSBkcm1fZWRpZF9lcXVhbCBjaGVja3MgZnJvbSBoZG1pIGFuZCBkcCwKICAgIGxl
dHMgdXNlIG9ubHkgb25jZSBlZGlkIHByb3BlcnR5IGlzIGdldHRpbmcgdXBkYXRlZCBhbmQKICAg
IGluY3JlbWVudCBlcG9jaCBjb3VudGVyIGZyb20gdGhlcmUuCiAgICBBbHNvIGxldHMgbm93IGNh
bGwgZHJtX2Nvbm5lY3Rvcl91cGRhdGVfZWRpZF9wcm9wZXJ0eQogICAgcmlnaHQgYWZ0ZXIgd2Ug
Z2V0IGVkaWQgYWx3YXlzIHRvIG1ha2Ugc3VyZSB0aGVyZSBpcyBhCiAgICB1bmlmaWVkIHdheSB0
byBoYW5kbGUgZWRpZCBjaGFuZ2UsIHdpdGhvdXQgaGF2aW5nIHRvCiAgICBjaGFuZ2UgdG9ucyBv
ZiBzb3VyY2UgY29kZSBhcyBjdXJyZW50bHkKICAgIGRybV9jb25uZWN0b3JfdXBkYXRlX2VkaWRf
cHJvcGVydHkgaXMgY2FsbGVkIG9ubHkgaW4KICAgIGNlcnRhaW4gY2FzZXMgbGlrZSByZXByb2Jp
bmcgYW5kIG5vdCByaWdodCBhZnRlciBlZGlkIGlzCiAgICBhY3R1YWxseSB1cGRhdGVkLgoKdjU6
IEZpeGVkIGNvbnN0IG1vZGlmaWVycywgcmVtb3ZlZCBibGFuayBsaW5lCgp2NjogUmVtb3ZlZCBk
cm0gc3BlY2lmaWMgcGFydCBmcm9tIHRoaXMgcGF0Y2gsIGxlYXZpbmcgb25seQogICAgaTkxNSBz
cGVjaWZpYyBjaGFuZ2VzIGhlcmUuCgpTaWduZWQtb2ZmLWJ5OiBTdGFuaXNsYXYgTGlzb3Zza2l5
IDxzdGFuaXNsYXYubGlzb3Zza2l5QGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2hvdHBsdWcuYyB8IDE4ICsrKysrKysrKysrKystLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9ob3RwbHVnLmMgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hvdHBsdWcuYwppbmRleCBmYzI5MDQ2ZDQ4ZWEuLjFl
M2U0MjVkZDc4ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9ob3RwbHVnLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9ob3Rw
bHVnLmMKQEAgLTI4MCwyMyArMjgwLDMxIEBAIGludGVsX2VuY29kZXJfaG90cGx1ZyhzdHJ1Y3Qg
aW50ZWxfZW5jb2RlciAqZW5jb2RlciwKIHsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gY29u
bmVjdG9yLT5iYXNlLmRldjsKIAllbnVtIGRybV9jb25uZWN0b3Jfc3RhdHVzIG9sZF9zdGF0dXM7
CisJdTY0IG9sZF9lcG9jaF9jb3VudGVyOworCWJvb2wgcmV0ID0gZmFsc2U7CiAKIAlXQVJOX09O
KCFtdXRleF9pc19sb2NrZWQoJmRldi0+bW9kZV9jb25maWcubXV0ZXgpKTsKIAlvbGRfc3RhdHVz
ID0gY29ubmVjdG9yLT5iYXNlLnN0YXR1czsKIAorCW9sZF9lcG9jaF9jb3VudGVyID0gY29ubmVj
dG9yLT5iYXNlLmVwb2NoX2NvdW50ZXI7CisKIAljb25uZWN0b3ItPmJhc2Uuc3RhdHVzID0KIAkJ
ZHJtX2hlbHBlcl9wcm9iZV9kZXRlY3QoJmNvbm5lY3Rvci0+YmFzZSwgTlVMTCwgZmFsc2UpOwog
Ci0JaWYgKG9sZF9zdGF0dXMgPT0gY29ubmVjdG9yLT5iYXNlLnN0YXR1cykKLQkJcmV0dXJuIElO
VEVMX0hPVFBMVUdfVU5DSEFOR0VEOworCWlmIChvbGRfZXBvY2hfY291bnRlciAhPSBjb25uZWN0
b3ItPmJhc2UuZXBvY2hfY291bnRlcikKKwkJcmV0ID0gdHJ1ZTsKIAotCURSTV9ERUJVR19LTVMo
IltDT05ORUNUT1I6JWQ6JXNdIHN0YXR1cyB1cGRhdGVkIGZyb20gJXMgdG8gJXNcbiIsCisJaWYg
KHJldCkgeworCQlEUk1fREVCVUdfS01TKCJbQ09OTkVDVE9SOiVkOiVzXSBzdGF0dXMgdXBkYXRl
ZCBmcm9tICVzIHRvICVzKGVwb2NoIGNvdW50ZXIgJWxsdSlcbiIsCiAJCSAgICAgIGNvbm5lY3Rv
ci0+YmFzZS5iYXNlLmlkLAogCQkgICAgICBjb25uZWN0b3ItPmJhc2UubmFtZSwKIAkJICAgICAg
ZHJtX2dldF9jb25uZWN0b3Jfc3RhdHVzX25hbWUob2xkX3N0YXR1cyksCi0JCSAgICAgIGRybV9n
ZXRfY29ubmVjdG9yX3N0YXR1c19uYW1lKGNvbm5lY3Rvci0+YmFzZS5zdGF0dXMpKTsKKwkJICAg
ICAgZHJtX2dldF9jb25uZWN0b3Jfc3RhdHVzX25hbWUoY29ubmVjdG9yLT5iYXNlLnN0YXR1cyks
CisJCSAgICAgIGNvbm5lY3Rvci0+YmFzZS5lcG9jaF9jb3VudGVyKTsKKwkJcmV0dXJuIElOVEVM
X0hPVFBMVUdfQ0hBTkdFRDsKKwl9CiAKLQlyZXR1cm4gSU5URUxfSE9UUExVR19DSEFOR0VEOwor
CXJldHVybiBJTlRFTF9IT1RQTFVHX1VOQ0hBTkdFRDsKIH0KIAogc3RhdGljIGJvb2wgaW50ZWxf
ZW5jb2Rlcl9oYXNfaHBkX3B1bHNlKHN0cnVjdCBpbnRlbF9lbmNvZGVyICplbmNvZGVyKQotLSAK
Mi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
