Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48536296573
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 21:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B762E6E0D8;
	Thu, 22 Oct 2020 19:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878156E0D8;
 Thu, 22 Oct 2020 19:43:00 +0000 (UTC)
IronPort-SDR: RQTiIH8++dTdabkez3/hh/kimLBhaeL4GHO0rvnPKKKarpi0BMfMU7yEGDtyj28Tfvxo9f/UW6
 jq7C0P8JBaMg==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="231778706"
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="231778706"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 12:42:59 -0700
IronPort-SDR: R8HzbOifldxclQO2dv3ElHs52VSySzXOiLPATVFu5X7TmrgzBfbMJnLj/8mKqgx8yEKNwCMRhk
 HpDBwD1CZXmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="359370921"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 22 Oct 2020 12:42:56 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 22 Oct 2020 22:42:56 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/modes: Switch to 64bit maths to avoid integer overflow
Date: Thu, 22 Oct 2020 22:42:56 +0300
Message-Id: <20201022194256.30978-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
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
Cc: intel-gfx@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSBuZXcgPjhrIENFQSBtb2RlcyBoYXZlIGRvdGNsb2NrcyByZWFjaGluZyA1Ljk0IEdIeiwgd2hp
Y2gKbWVhbnMgb3VyIGNsb2NrKjEwMDAgd2lsbCBub3cgb3ZlcmZsb3cgdGhlIDMyYml0IHVuc2ln
bmVkCmludGVnZXIuIFN3aXRjaCB0byA2NGJpdCBtYXRocyB0byBhdm9pZCBpdC4KCkNjOiBzdGFi
bGVAdmdlci5rZXJuZWwub3JnClJlcG9ydGVkLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5m
cmFkZWFkLm9yZz4KU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxh
QGxpbnV4LmludGVsLmNvbT4KLS0tCkFuIGludGVyZXN0aW5nIHF1ZXN0aW9uIGhvdyBtYW55IG90
aGVyIHBsYWNlIG1pZ2h0IHN1ZmZlciBmcm9tIHNpbWlsYXIKb3ZlcmZsb3dzLiBJIHRoaW5rIGk5
MTUgc2hvdWxkIGJlIG1vc3RseSBPSy4gVGhlIG9uZSBwbGFjZSBJIGtub3cgd2UgdXNlCkh6IGlu
c3RlYWQga0h6IGlzIHRoZSBoc3cgRFBMTCBjb2RlLCB3aGljaCBJIHdvdWxkIHByZWZlciB3ZSBh
bHNvIGNoYW5nZQp0byB1c2Uga0h6LiBUaGUgb3RoZXIgY29uY2VybiBpcyB3aGV0aGVyIHdlIGhh
dmUgYW55IHBvdGVudGlhbCBvdmVyZmxvd3MKYmVmb3JlIHdlIGNoZWNrIHRoaXMgYWdhaW5zdCB0
aGUgcGxhdGZvcm0ncyBtYXggZG90Y2xvY2suCgpJIGRvIGhhdmUgdGhpcyB1bnJldmlld2VkIGln
dCBzZXJpZXMgCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjk1MzEv
IHdoaWNoIGV4dGVuZHMgdGhlCmN1cnJlbnQgdGVzdGluZyB3aXRoIHNvbWUgb3RoZXIgZm9ybXMg
b2YgaW52YWxpZCBtb2Rlcy4gQ291bGQgcHJvYmFibHkKZXh0ZW5kIHRoYXQgd2l0aCBhIG1vZGUu
Y2xvY2s9SU5UX01BWCB0ZXN0IHRvIHNlZSBpZiBhbnl0aGluZyBlbHNlIG1pZ2h0CnRyaXAgdXAu
CgpObyBpZGVhIGFib3V0IG90aGVyIGRyaXZlcnMuCgogZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rl
cy5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fbW9kZXMuYwppbmRleCA1MDFiNGZlNTVhM2QuLjUxMWNkZTVjN2ZhNiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fbW9kZXMuYwpAQCAtNzYyLDcgKzc2Miw3IEBAIGludCBkcm1fbW9kZV92cmVmcmVzaChj
b25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKIAlpZiAobW9kZS0+aHRvdGFsID09
IDAgfHwgbW9kZS0+dnRvdGFsID09IDApCiAJCXJldHVybiAwOwogCi0JbnVtID0gbW9kZS0+Y2xv
Y2sgKiAxMDAwOworCW51bSA9IG1vZGUtPmNsb2NrOwogCWRlbiA9IG1vZGUtPmh0b3RhbCAqIG1v
ZGUtPnZ0b3RhbDsKIAogCWlmIChtb2RlLT5mbGFncyAmIERSTV9NT0RFX0ZMQUdfSU5URVJMQUNF
KQpAQCAtNzcyLDcgKzc3Miw3IEBAIGludCBkcm1fbW9kZV92cmVmcmVzaChjb25zdCBzdHJ1Y3Qg
ZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKIAlpZiAobW9kZS0+dnNjYW4gPiAxKQogCQlkZW4gKj0g
bW9kZS0+dnNjYW47CiAKLQlyZXR1cm4gRElWX1JPVU5EX0NMT1NFU1QobnVtLCBkZW4pOworCXJl
dHVybiBESVZfUk9VTkRfQ0xPU0VTVF9VTEwobXVsX3UzMl91MzIobnVtLCAxMDAwKSwgZGVuKTsK
IH0KIEVYUE9SVF9TWU1CT0woZHJtX21vZGVfdnJlZnJlc2gpOwogCi0tIAoyLjI2LjIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
