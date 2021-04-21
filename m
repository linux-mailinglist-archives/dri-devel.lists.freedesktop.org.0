Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FBA366F40
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 17:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEA76E0C9;
	Wed, 21 Apr 2021 15:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0870A6E0C9;
 Wed, 21 Apr 2021 15:34:13 +0000 (UTC)
IronPort-SDR: JBhRMDeAj2NlJ2Bpg+2GFXiqy1VjATAo2JBJO36jaUollkGnpDmSLzb66AFDC8+nfh0rwdyAnn
 NQe9O5/ieCuA==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="183206400"
X-IronPort-AV: E=Sophos;i="5.82,240,1613462400"; d="scan'208";a="183206400"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 08:34:13 -0700
IronPort-SDR: Hp6SF4mX1W0klP/6zctwVVB1j1MtEy/q3anYlZaGnz/XE9H3YAB/YXmp/iKypTptvs8YIs2myM
 Xa5TRKdtk5Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,240,1613462400"; d="scan'208";a="427557876"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 21 Apr 2021 08:34:09 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 21 Apr 2021 18:34:08 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] drm/i915: Read C0DRB3/C1DRB3 as 16 bits again
Date: Wed, 21 Apr 2021 18:33:59 +0300
Message-Id: <20210421153401.13847-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210421153401.13847-1-ville.syrjala@linux.intel.com>
References: <20210421153401.13847-1-ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCldl
J3ZlIGRlZmluZWQgQzBEUkIzL0MwRFJCMyBhcyAxNiBiaXQgcmVnaXN0ZXJzLCBzbyBhY2Nlc3Mg
dGhlbQphcyBzdWNoLgoKRml4ZXM6IDFjODI0MmMzYTRiMiAoImRybS9pOTE1OiBVc2UgdW5jaGVj
a2VkIHdyaXRlcyBmb3Igc2V0dGluZyB1cCB0aGUgZmVuY2VzIikKUmV2aWV3ZWQtYnk6IENocmlz
IFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L2ludGVsX2dndHRfZmVuY2luZy5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d0L2ludGVsX2dndHRfZmVuY2luZy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvaW50ZWxfZ2d0dF9mZW5jaW5nLmMKaW5kZXggZTcyYjdhMGRjMzE2Li44YTMyMjU5NDIx
MGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2dndHRfZmVuY2lu
Zy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2dndHRfZmVuY2luZy5jCkBA
IC02NTMsOCArNjUzLDggQEAgc3RhdGljIHZvaWQgZGV0ZWN0X2JpdF82X3N3aXp6bGUoc3RydWN0
IGk5MTVfZ2d0dCAqZ2d0dCkKIAkJICogYmFua3Mgb2YgbWVtb3J5IGFyZSBwYWlyZWQgYW5kIHVu
c3dpenpsZWQgb24gdGhlCiAJCSAqIHVuZXZlbiBwb3J0aW9uLCBzbyBsZWF2ZSB0aGF0IGFzIHVu
a25vd24uCiAJCSAqLwotCQlpZiAoaW50ZWxfdW5jb3JlX3JlYWQodW5jb3JlLCBDMERSQjMpID09
Ci0JCSAgICBpbnRlbF91bmNvcmVfcmVhZCh1bmNvcmUsIEMxRFJCMykpIHsKKwkJaWYgKGludGVs
X3VuY29yZV9yZWFkMTYodW5jb3JlLCBDMERSQjMpID09CisJCSAgICBpbnRlbF91bmNvcmVfcmVh
ZDE2KHVuY29yZSwgQzFEUkIzKSkgewogCQkJc3dpenpsZV94ID0gSTkxNV9CSVRfNl9TV0laWkxF
XzlfMTA7CiAJCQlzd2l6emxlX3kgPSBJOTE1X0JJVF82X1NXSVpaTEVfOTsKIAkJfQotLSAKMi4y
Ni4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
