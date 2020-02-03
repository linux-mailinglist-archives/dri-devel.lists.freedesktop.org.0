Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD0B15097D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 16:14:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48C46EC4A;
	Mon,  3 Feb 2020 15:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EEC6EC49;
 Mon,  3 Feb 2020 15:14:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 07:14:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="310747657"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 03 Feb 2020 07:14:42 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 03 Feb 2020 17:14:41 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 19/26] drm/i915: Handle downstream facing ports w/o EDID
Date: Mon,  3 Feb 2020 17:13:36 +0200
Message-Id: <20200203151343.14378-20-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200203151343.14378-1-ville.syrjala@linux.intel.com>
References: <20200203151343.14378-1-ville.syrjala@linux.intel.com>
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
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCmluZGV4IGQwNzU0NTBhMDQ3Mi4u
NjUyMDI2MTVjOGYxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCkBA
IC01ODkzLDcgKzU4OTMsNyBAQCBzdGF0aWMgaW50IGludGVsX2RwX2dldF9tb2RlcyhzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCX0KIAogCS8qIGlmIGVEUCBoYXMgbm8gRURJRCwg
ZmFsbCBiYWNrIHRvIGZpeGVkIG1vZGUgKi8KLQlpZiAoaW50ZWxfZHBfaXNfZWRwKGludGVsX2F0
dGFjaGVkX2RwKHRvX2ludGVsX2Nvbm5lY3Rvcihjb25uZWN0b3IpKSkgJiYKKwlpZiAoaW50ZWxf
ZHBfaXNfZWRwKGludGVsX2F0dGFjaGVkX2RwKGludGVsX2Nvbm5lY3RvcikpICYmCiAJICAgIGlu
dGVsX2Nvbm5lY3Rvci0+cGFuZWwuZml4ZWRfbW9kZSkgewogCQlzdHJ1Y3QgZHJtX2Rpc3BsYXlf
bW9kZSAqbW9kZTsKIApAQCAtNTkwNSw2ICs1OTA1LDE5IEBAIHN0YXRpYyBpbnQgaW50ZWxfZHBf
Z2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiAJCX0KIAl9CiAKKwlp
ZiAoIWVkaWQpIHsKKwkJc3RydWN0IGludGVsX2RwICppbnRlbF9kcCA9IGludGVsX2F0dGFjaGVk
X2RwKGludGVsX2Nvbm5lY3Rvcik7CisJCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlOwor
CisJCW1vZGUgPSBkcm1fZHBfZG93bnN0cmVhbV9tb2RlKGNvbm5lY3Rvci0+ZGV2LAorCQkJCQkg
ICAgICBpbnRlbF9kcC0+ZHBjZCwKKwkJCQkJICAgICAgaW50ZWxfZHAtPmRvd25zdHJlYW1fcG9y
dHMpOworCQlpZiAobW9kZSkgeworCQkJZHJtX21vZGVfcHJvYmVkX2FkZChjb25uZWN0b3IsIG1v
ZGUpOworCQkJcmV0dXJuIDE7CisJCX0KKwl9CisKIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4yNC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
