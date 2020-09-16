Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 843AB26C44A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 17:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720D06EA3C;
	Wed, 16 Sep 2020 15:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A506EA3C;
 Wed, 16 Sep 2020 15:35:16 +0000 (UTC)
IronPort-SDR: /ijJ4B2yWf4MQtXra806kSMMSHqKyAZ66vbbdL/W3UA0S0brGNbgxQG2xVXzRRT041NYJM9/jp
 cHCQWhzcAG9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="223677120"
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="223677120"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 08:35:15 -0700
IronPort-SDR: KtdgJic/xxdxB8nkYZDiiNSRPe7ohLvCw7Gf2Qez4VquqjDPWRm/C2uwgeKcMi/R8bimLm7biX
 eZMZ0aXhhqNw==
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="307081732"
Received: from karthik-2012-client-platform.iind.intel.com ([10.223.74.217])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 16 Sep 2020 08:35:10 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 4/8] drm/i915: Do not call drm_crtc_arm_vblank_event in
 async flips
Date: Wed, 16 Sep 2020 20:38:20 +0530
Message-Id: <20200916150824.15749-5-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200916150824.15749-1-karthik.b.s@intel.com>
References: <20200916150824.15749-1-karthik.b.s@intel.com>
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
Cc: paulo.r.zanoni@intel.com, michel@daenzer.net,
 Karthik B S <karthik.b.s@intel.com>, dri-devel@lists.freedesktop.org,
 vandita.kulkarni@intel.com, uma.shankar@intel.com, daniel.vetter@intel.com,
 nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2UgdGhlIGZsaXAgZG9uZSBldmVudCB3aWxsIGJlIHNlbnQgaW4gdGhlIGZsaXBfZG9uZV9o
YW5kbGVyLApubyBuZWVkIHRvIGFkZCB0aGUgZXZlbnQgdG8gdGhlIGxpc3QgYW5kIGRlbGF5IGl0
IGZvciBsYXRlci4KCnYyOiAtTW92ZWQgdGhlIGFzeW5jIGNoZWNrIGFib3ZlIHZibGFua19nZXQg
YXMgaXQKICAgICB3YXMgY2F1c2luZyBpc3N1ZXMgZm9yIFBTUi4KCnYzOiAtTm8gbmVlZCB0byB3
YWl0IGZvciB2YmxhbmsgdG8gcGFzcywgYXMgdGhpcyB3YWl0IHdhcyBjYXVzaW5nIGEKICAgICAx
Nm1zIGRlbGF5IG9uY2UgZXZlcnkgZmV3IGZsaXBzLgoKdjQ6IC1SZWJhc2VkLgoKdjU6IC1SZWJh
c2VkLgoKdjY6IC1SZWJhc2VkLgoKdjc6IC1ObyBuZWVkIG9mIGlycSBkaXNhYmxlIGlmIHdlIGFy
ZSBub3QgZG9pbmcgdmJsYW5rIGV2YWRlLiAoVmlsbGUpCgp2ODogLVJlYmFzZWQuCgp2OTogLU1v
dmUgdGhlIHJldHVybiBpbiBpbnRlbF9waXBlX3VwZGF0ZV9lbmQgYmVmb3JlIHRyYWNlcG9pbnQu
IChWaWxsZSkKClNpZ25lZC1vZmYtYnk6IEthcnRoaWsgQiBTIDxrYXJ0aGlrLmIuc0BpbnRlbC5j
b20+ClNpZ25lZC1vZmYtYnk6IFZhbmRpdGEgS3Vsa2FybmkgPHZhbmRpdGEua3Vsa2FybmlAaW50
ZWwuY29tPgpSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4
LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nwcml0
ZS5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nwcml0ZS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9zcHJpdGUuYwppbmRleCA2MzA0MGNiMGQ0ZTEu
Ljc2YTNkOWJmZTBkZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9zcHJpdGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nw
cml0ZS5jCkBAIC05Myw2ICs5Myw5IEBAIHZvaWQgaW50ZWxfcGlwZV91cGRhdGVfc3RhcnQoY29u
c3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKm5ld19jcnRjX3N0YXRlKQogCURFRklORV9XQUlU
KHdhaXQpOwogCXUzMiBwc3Jfc3RhdHVzOwogCisJaWYgKG5ld19jcnRjX3N0YXRlLT51YXBpLmFz
eW5jX2ZsaXApCisJCXJldHVybjsKKwogCXZibGFua19zdGFydCA9IGFkanVzdGVkX21vZGUtPmNy
dGNfdmJsYW5rX3N0YXJ0OwogCWlmIChhZGp1c3RlZF9tb2RlLT5mbGFncyAmIERSTV9NT0RFX0ZM
QUdfSU5URVJMQUNFKQogCQl2Ymxhbmtfc3RhcnQgPSBESVZfUk9VTkRfVVAodmJsYW5rX3N0YXJ0
LCAyKTsKQEAgLTIwMCw2ICsyMDMsOSBAQCB2b2lkIGludGVsX3BpcGVfdXBkYXRlX2VuZChzdHJ1
Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqbmV3X2NydGNfc3RhdGUpCiAJa3RpbWVfdCBlbmRfdmJsX3Rp
bWUgPSBrdGltZV9nZXQoKTsKIAlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPSB0
b19pOTE1KGNydGMtPmJhc2UuZGV2KTsKIAorCWlmIChuZXdfY3J0Y19zdGF0ZS0+dWFwaS5hc3lu
Y19mbGlwKQorCQlyZXR1cm47CisKIAl0cmFjZV9pbnRlbF9waXBlX3VwZGF0ZV9lbmQoY3J0Yywg
ZW5kX3ZibF9jb3VudCwgc2NhbmxpbmVfZW5kKTsKIAogCS8qIFdlJ3JlIHN0aWxsIGluIHRoZSB2
YmxhbmstZXZhZGUgY3JpdGljYWwgc2VjdGlvbiwgdGhpcyBjYW4ndCByYWNlLgotLSAKMi4yMi4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
