Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE38AC9BCF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 12:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0480D6E0FF;
	Thu,  3 Oct 2019 10:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D416E0F5;
 Thu,  3 Oct 2019 10:12:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Oct 2019 03:12:58 -0700
X-IronPort-AV: E=Sophos;i="5.67,251,1566889200"; d="scan'208";a="185871368"
Received: from paaron-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.93.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Oct 2019 03:12:57 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH] dma-fence: Use non-atomic bitops while under the lock
Date: Thu,  3 Oct 2019 11:12:47 +0100
Message-Id: <20191003101247.809-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCldlIGRvIG5v
dCBoYXZlIHRvIHVzZSBhdG9taWMgYml0b3BzIHdoZW4gYWxyZWFkeSB1bmRlciB0aGUgc3Bpbmxv
Y2suCgpTYXZlcyBvbiBhIGhhbmRmdWwgb2YgbG9jayBpbnN0cnVjdGlvbiBwcmVmaXhlcywgb24g
eDg2IGF0IGxlYXN0LgoKU2lnbmVkLW9mZi1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1
bGluQGludGVsLmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IENo
cmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotLS0KIGRyaXZlcnMvZG1hLWJ1
Zi9kbWEtZmVuY2UuYyB8IDE0ICsrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9k
bWEtZmVuY2UuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYwppbmRleCAyYzEzNmFlZTNl
NzkuLmYwYjQ4MDA0MmUyZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5j
CisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYwpAQCAtMTMzLDE1ICsxMzMsMTUgQEAg
aW50IGRtYV9mZW5jZV9zaWduYWxfbG9ja2VkKHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlKQogCiAJ
bG9ja2RlcF9hc3NlcnRfaGVsZChmZW5jZS0+bG9jayk7CiAKLQlpZiAodW5saWtlbHkodGVzdF9h
bmRfc2V0X2JpdChETUFfRkVOQ0VfRkxBR19TSUdOQUxFRF9CSVQsCi0JCQkJICAgICAgJmZlbmNl
LT5mbGFncykpKQorCWlmICh1bmxpa2VseShfX3Rlc3RfYW5kX3NldF9iaXQoRE1BX0ZFTkNFX0ZM
QUdfU0lHTkFMRURfQklULAorCQkJCQkmZmVuY2UtPmZsYWdzKSkpCiAJCXJldHVybiAtRUlOVkFM
OwogCiAJLyogU3Rhc2ggdGhlIGNiX2xpc3QgYmVmb3JlIHJlcGxhY2luZyBpdCB3aXRoIHRoZSB0
aW1lc3RhbXAgKi8KIAlsaXN0X3JlcGxhY2UoJmZlbmNlLT5jYl9saXN0LCAmY2JfbGlzdCk7CiAK
IAlmZW5jZS0+dGltZXN0YW1wID0ga3RpbWVfZ2V0KCk7Ci0Jc2V0X2JpdChETUFfRkVOQ0VfRkxB
R19USU1FU1RBTVBfQklULCAmZmVuY2UtPmZsYWdzKTsKKwlfX3NldF9iaXQoRE1BX0ZFTkNFX0ZM
QUdfVElNRVNUQU1QX0JJVCwgJmZlbmNlLT5mbGFncyk7CiAJdHJhY2VfZG1hX2ZlbmNlX3NpZ25h
bGVkKGZlbmNlKTsKIAogCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShjdXIsIHRtcCwgJmNiX2xp
c3QsIG5vZGUpIHsKQEAgLTM0Myw4ICszNDMsOCBAQCBpbnQgZG1hX2ZlbmNlX2FkZF9jYWxsYmFj
ayhzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSwgc3RydWN0IGRtYV9mZW5jZV9jYiAqY2IsCiAKIAlz
cGluX2xvY2tfaXJxc2F2ZShmZW5jZS0+bG9jaywgZmxhZ3MpOwogCi0Jd2FzX3NldCA9IHRlc3Rf
YW5kX3NldF9iaXQoRE1BX0ZFTkNFX0ZMQUdfRU5BQkxFX1NJR05BTF9CSVQsCi0JCQkJICAgJmZl
bmNlLT5mbGFncyk7CisJd2FzX3NldCA9IF9fdGVzdF9hbmRfc2V0X2JpdChETUFfRkVOQ0VfRkxB
R19FTkFCTEVfU0lHTkFMX0JJVCwKKwkJCQkgICAgICZmZW5jZS0+ZmxhZ3MpOwogCiAJaWYgKHRl
c3RfYml0KERNQV9GRU5DRV9GTEFHX1NJR05BTEVEX0JJVCwgJmZlbmNlLT5mbGFncykpCiAJCXJl
dCA9IC1FTk9FTlQ7CkBAIC00NzMsOCArNDczLDggQEAgZG1hX2ZlbmNlX2RlZmF1bHRfd2FpdChz
dHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSwgYm9vbCBpbnRyLCBzaWduZWQgbG9uZyB0aW1lb3V0KQog
CQlnb3RvIG91dDsKIAl9CiAKLQl3YXNfc2V0ID0gdGVzdF9hbmRfc2V0X2JpdChETUFfRkVOQ0Vf
RkxBR19FTkFCTEVfU0lHTkFMX0JJVCwKLQkJCQkgICAmZmVuY2UtPmZsYWdzKTsKKwl3YXNfc2V0
ID0gX190ZXN0X2FuZF9zZXRfYml0KERNQV9GRU5DRV9GTEFHX0VOQUJMRV9TSUdOQUxfQklULAor
CQkJCSAgICAgJmZlbmNlLT5mbGFncyk7CiAKIAlpZiAodGVzdF9iaXQoRE1BX0ZFTkNFX0ZMQUdf
U0lHTkFMRURfQklULCAmZmVuY2UtPmZsYWdzKSkKIAkJZ290byBvdXQ7Ci0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
