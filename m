Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F441CBCEC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 16:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE8D6EBA8;
	Fri,  4 Oct 2019 14:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE696EBA8;
 Fri,  4 Oct 2019 14:19:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Oct 2019 07:19:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,256,1566889200"; d="scan'208";a="204330836"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 04 Oct 2019 07:19:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Oct 2019 17:19:17 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/edid: Extract drm_mode_cea_vic()
Date: Fri,  4 Oct 2019 17:19:12 +0300
Message-Id: <20191004141914.20600-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004141914.20600-1-ville.syrjala@linux.intel.com>
References: <20191004141914.20600-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Wayne Lin <waynelin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkV4
dHJhY3QgdGhlIGxvZ2ljIHRvIGNvbXB1dGUgdGhlIGZpbmFsIENFQSBWSUMgdG8gYSBzbWFsbCBo
ZWxwZXIuCldlJ2xsIHJlb3JkZXIgaXQgYSBiaXQgdG8gbWFrZSBmdXR1cmUgbW9kaWZpY2F0aW9u
cyBtb3JlCnN0cmFpZ2h0Zm9yd2FyZC4gTm8gZnVuY3Rpb24gY2hhbmdlcy4KCkNjOiBXYXluZSBM
aW4gPHdheW5lbGluQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmls
bGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9lZGlk
LmMgfCA1MyArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKaW5k
ZXggM2RmODI2N2FkYWI5Li40OTViN2ZiNGQ5ZWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZWRpZC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCkBAIC01MTYwLDYg
KzUxNjAsMzUgQEAgZHJtX2hkbWlfaW5mb2ZyYW1lX3NldF9oZHJfbWV0YWRhdGEoc3RydWN0IGhk
bWlfZHJtX2luZm9mcmFtZSAqZnJhbWUsCiB9CiBFWFBPUlRfU1lNQk9MKGRybV9oZG1pX2luZm9m
cmFtZV9zZXRfaGRyX21ldGFkYXRhKTsKIAorc3RhdGljIHU4IGRybV9tb2RlX2NlYV92aWMoc3Ry
dWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKKwkJCSAgIGNvbnN0IHN0cnVjdCBkcm1fZGlz
cGxheV9tb2RlICptb2RlKQoreworCXU4IHZlbmRvcl9pZl92aWMgPSBkcm1fbWF0Y2hfaGRtaV9t
b2RlKG1vZGUpOworCWJvb2wgaXNfczNkID0gbW9kZS0+ZmxhZ3MgJiBEUk1fTU9ERV9GTEFHXzNE
X01BU0s7CisJdTggdmljOworCisJLyoKKwkgKiBIRE1JIHNwZWMgc2F5cyBpZiBhIG1vZGUgaXMg
Zm91bmQgaW4gSERNSSAxLjRiIDRLIG1vZGVzCisJICogd2Ugc2hvdWxkIHNlbmQgaXRzIFZJQyBp
biB2ZW5kb3IgaW5mb2ZyYW1lcywgZWxzZSBzZW5kIHRoZQorCSAqIFZJQyBpbiBBVkkgaW5mb2Zy
YW1lcy4gTGV0cyBjaGVjayBpZiB0aGlzIG1vZGUgaXMgcHJlc2VudCBpbgorCSAqIEhETUkgMS40
YiA0SyBtb2RlcworCSAqLworCWlmIChkcm1fdmFsaWRfaGRtaV92aWModmVuZG9yX2lmX3ZpYykg
JiYgIWlzX3MzZCkKKwkJcmV0dXJuIDA7CisKKwl2aWMgPSBkcm1fbWF0Y2hfY2VhX21vZGUobW9k
ZSk7CisKKwkvKgorCSAqIEhETUkgMS40IFZJQyByYW5nZTogMSA8PSBWSUMgPD0gNjQgKENFQS04
NjEtRCkgYnV0CisJICogSERNSSAyLjAgVklDIHJhbmdlOiAxIDw9IFZJQyA8PSAxMDcgKENFQS04
NjEtRikuIFNvIHdlCisJICogaGF2ZSB0byBtYWtlIHN1cmUgd2UgZG9udCBicmVhayBIRE1JIDEu
NCBzaW5rcy4KKwkgKi8KKwlpZiAoIWlzX2hkbWkyX3NpbmsoY29ubmVjdG9yKSAmJiB2aWMgPiA2
NCkKKwkJcmV0dXJuIDA7CisKKwlyZXR1cm4gdmljOworfQorCiAvKioKICAqIGRybV9oZG1pX2F2
aV9pbmZvZnJhbWVfZnJvbV9kaXNwbGF5X21vZGUoKSAtIGZpbGwgYW4gSERNSSBBVkkgaW5mb2Zy
YW1lIHdpdGgKICAqICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGRhdGEgZnJvbSBhIERSTSBkaXNwbGF5IG1vZGUKQEAgLTUxODcsMjkgKzUyMTYsNyBAQCBkcm1f
aGRtaV9hdmlfaW5mb2ZyYW1lX2Zyb21fZGlzcGxheV9tb2RlKHN0cnVjdCBoZG1pX2F2aV9pbmZv
ZnJhbWUgKmZyYW1lLAogCWlmIChtb2RlLT5mbGFncyAmIERSTV9NT0RFX0ZMQUdfREJMQ0xLKQog
CQlmcmFtZS0+cGl4ZWxfcmVwZWF0ID0gMTsKIAotCWZyYW1lLT52aWRlb19jb2RlID0gZHJtX21h
dGNoX2NlYV9tb2RlKG1vZGUpOwotCi0JLyoKLQkgKiBIRE1JIDEuNCBWSUMgcmFuZ2U6IDEgPD0g
VklDIDw9IDY0IChDRUEtODYxLUQpIGJ1dAotCSAqIEhETUkgMi4wIFZJQyByYW5nZTogMSA8PSBW
SUMgPD0gMTA3IChDRUEtODYxLUYpLiBTbyB3ZQotCSAqIGhhdmUgdG8gbWFrZSBzdXJlIHdlIGRv
bnQgYnJlYWsgSERNSSAxLjQgc2lua3MuCi0JICovCi0JaWYgKCFpc19oZG1pMl9zaW5rKGNvbm5l
Y3RvcikgJiYgZnJhbWUtPnZpZGVvX2NvZGUgPiA2NCkKLQkJZnJhbWUtPnZpZGVvX2NvZGUgPSAw
OwotCi0JLyoKLQkgKiBIRE1JIHNwZWMgc2F5cyBpZiBhIG1vZGUgaXMgZm91bmQgaW4gSERNSSAx
LjRiIDRLIG1vZGVzCi0JICogd2Ugc2hvdWxkIHNlbmQgaXRzIFZJQyBpbiB2ZW5kb3IgaW5mb2Zy
YW1lcywgZWxzZSBzZW5kIHRoZQotCSAqIFZJQyBpbiBBVkkgaW5mb2ZyYW1lcy4gTGV0cyBjaGVj
ayBpZiB0aGlzIG1vZGUgaXMgcHJlc2VudCBpbgotCSAqIEhETUkgMS40YiA0SyBtb2RlcwotCSAq
LwotCWlmIChmcmFtZS0+dmlkZW9fY29kZSkgewotCQl1OCB2ZW5kb3JfaWZfdmljID0gZHJtX21h
dGNoX2hkbWlfbW9kZShtb2RlKTsKLQkJYm9vbCBpc19zM2QgPSBtb2RlLT5mbGFncyAmIERSTV9N
T0RFX0ZMQUdfM0RfTUFTSzsKLQotCQlpZiAoZHJtX3ZhbGlkX2hkbWlfdmljKHZlbmRvcl9pZl92
aWMpICYmICFpc19zM2QpCi0JCQlmcmFtZS0+dmlkZW9fY29kZSA9IDA7Ci0JfQorCWZyYW1lLT52
aWRlb19jb2RlID0gZHJtX21vZGVfY2VhX3ZpYyhjb25uZWN0b3IsIG1vZGUpOwogCiAJZnJhbWUt
PnBpY3R1cmVfYXNwZWN0ID0gSERNSV9QSUNUVVJFX0FTUEVDVF9OT05FOwogCi0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
