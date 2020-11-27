Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A522C6548
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08236ED00;
	Fri, 27 Nov 2020 12:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1946ECFD;
 Fri, 27 Nov 2020 12:11:25 +0000 (UTC)
IronPort-SDR: 9FluPpVEascufLW9bI9UjrMbKJOi/qWPFia32eBJY9EfakI260oeTkCpXr8x2u2wpo8XZjNXpC
 IA+jfzvW5KGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092893"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092893"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:24 -0800
IronPort-SDR: nnvKQC/KOYK51wtLnpR4ppQVv4pk58ylERSjtPdoNHhcyfISnx664eMD4n1reWNQzHjYJ9HDEo
 MkSz5z/tDY0w==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029773"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:22 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 121/162] drm/i915: WA for zero memory channel
Date: Fri, 27 Nov 2020 12:06:37 +0000
Message-Id: <20201127120718.454037-122-matthew.auld@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVs
LmNvbT4KCkNvbW1pdCBjNDU3ZDljZjI1NmUgKCJkcm0vaTkxNTogTWFrZSBzdXJlIHdlIGhhdmUg
ZW5vdWdoIG1lbW9yeQpiYW5kd2lkdGggb24gSUNMIikgYXNzdW1lcyB0aGF0IHdlIGFsd2F5cyBo
YXZlIGEgbm9uLXplcm8KZHJhbV9pbmZvLT5jaGFubmVscyBhbmQgdXNlcyBpdCBhcyBhIGRpdmlz
b3IuIFdlIG5lZWQgbnVtIG1lbW9yeQpjaGFubmVscyB0byBiZSBhdCBsZWFzdCAxIGZvciBzYW5l
IGJ3IGxpbWl0cyBjaGVja2luZywgZXZlbiB3aGVuIFBDb2RlCnJldHVybnMgMCwgc28gbGV0cyBm
b3JjZSBpdCB0byAxIGluIHRoaXMgY2FzZS4KCkNjOiBTdGFuaXNsYXYgTGlzb3Zza2l5IDxzdGFu
aXNsYXYubGlzb3Zza2l5QGludGVsLmNvbT4KQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZp
QGludGVsLmNvbT4KQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb20+ClNpZ25lZC1vZmYtYnk6IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8gPGRhbmllbGUuY2Vy
YW9sb3NwdXJpb0BpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEx1Y2FzIERlIE1hcmNoaSA8bHVj
YXMuZGVtYXJjaGlAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfYncuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
YncuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYncuYwppbmRleCBiZDA2
MDQwNGQyNDkuLjllNzk3MWNlMjRiMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9idy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfYncuYwpAQCAtMjIyLDcgKzIyMiw3IEBAIHN0YXRpYyBpbnQgaWNsX2dldF9id19pbmZvKHN0
cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiwgY29uc3Qgc3RydWN0IGludGVsCiAJCQkg
ICAgIkZhaWxlZCB0byBnZXQgbWVtb3J5IHN1YnN5c3RlbSBpbmZvcm1hdGlvbiwgaWdub3Jpbmcg
YmFuZHdpZHRoIGxpbWl0cyIpOwogCQlyZXR1cm4gcmV0OwogCX0KLQludW1fY2hhbm5lbHMgPSBx
aS5udW1fY2hhbm5lbHM7CisJbnVtX2NoYW5uZWxzID0gbWF4X3QodTgsIDEsIHFpLm51bV9jaGFu
bmVscyk7CiAKIAlkZWludGVybGVhdmUgPSBESVZfUk9VTkRfVVAobnVtX2NoYW5uZWxzLCBpc195
X3RpbGUgPyA0IDogMik7CiAJZGNsa19tYXggPSBpY2xfc2Fndl9tYXhfZGNsaygmcWkpOwotLSAK
Mi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
