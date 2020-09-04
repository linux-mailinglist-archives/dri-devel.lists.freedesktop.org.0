Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595A625D80E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 13:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 137C46EB68;
	Fri,  4 Sep 2020 11:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC6A6EB6B;
 Fri,  4 Sep 2020 11:54:43 +0000 (UTC)
IronPort-SDR: H1zmdu4QpgHaogct1J7y1IHn7WcWOZXYSV8EfOiGhSWO6ZHX/3JqKFgti61YJUGutaTTUc8Wch
 nW00BuCKBn2A==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="157737307"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="157737307"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 04:54:42 -0700
IronPort-SDR: urkm1r9+qy6VPQF5/yYISTgIabyjMSa8R/DzC1QIebLDvGxx7+RJmB12tRBkodrNxJGH0BF9i+
 fwIeTTUInIEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="334860479"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 04 Sep 2020 04:54:40 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Sep 2020 14:54:39 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 14/18] drm/i915: Handle downstream facing ports w/o EDID
Date: Fri,  4 Sep 2020 14:53:50 +0300
Message-Id: <20200904115354.25336-15-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
References: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClVz
ZSBkcm1fZHBfZG93bnN0cmVhbV9tb2RlKCkgdG8gZ2V0IGEgc3VpdGFibGUgbW9kZSBmb3IgZG93
bnN0cmVhbQpmYWNpbmcgcG9ydHMgd2hpY2ggZG9uJ3QgaGF2ZSBhbiBFRElELgoKU2lnbmVkLW9m
Zi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgfCAxNSArKysrKysrKysr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCmluZGV4IDA0NzQ0OTI1M2E1NC4u
Mjc5ODYyMWE0NjZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCkBA
IC02MzEwLDcgKzYzMTAsNyBAQCBzdGF0aWMgaW50IGludGVsX2RwX2dldF9tb2RlcyhzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCX0KIAogCS8qIGlmIGVEUCBoYXMgbm8gRURJRCwg
ZmFsbCBiYWNrIHRvIGZpeGVkIG1vZGUgKi8KLQlpZiAoaW50ZWxfZHBfaXNfZWRwKGludGVsX2F0
dGFjaGVkX2RwKHRvX2ludGVsX2Nvbm5lY3Rvcihjb25uZWN0b3IpKSkgJiYKKwlpZiAoaW50ZWxf
ZHBfaXNfZWRwKGludGVsX2F0dGFjaGVkX2RwKGludGVsX2Nvbm5lY3RvcikpICYmCiAJICAgIGlu
dGVsX2Nvbm5lY3Rvci0+cGFuZWwuZml4ZWRfbW9kZSkgewogCQlzdHJ1Y3QgZHJtX2Rpc3BsYXlf
bW9kZSAqbW9kZTsKIApAQCAtNjMyMiw2ICs2MzIyLDE5IEBAIHN0YXRpYyBpbnQgaW50ZWxfZHBf
Z2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiAJCX0KIAl9CiAKKwlp
ZiAoIWVkaWQpIHsKKwkJc3RydWN0IGludGVsX2RwICppbnRlbF9kcCA9IGludGVsX2F0dGFjaGVk
X2RwKGludGVsX2Nvbm5lY3Rvcik7CisJCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlOwor
CisJCW1vZGUgPSBkcm1fZHBfZG93bnN0cmVhbV9tb2RlKGNvbm5lY3Rvci0+ZGV2LAorCQkJCQkg
ICAgICBpbnRlbF9kcC0+ZHBjZCwKKwkJCQkJICAgICAgaW50ZWxfZHAtPmRvd25zdHJlYW1fcG9y
dHMpOworCQlpZiAobW9kZSkgeworCQkJZHJtX21vZGVfcHJvYmVkX2FkZChjb25uZWN0b3IsIG1v
ZGUpOworCQkJcmV0dXJuIDE7CisJCX0KKwl9CisKIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4yNi4y
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
