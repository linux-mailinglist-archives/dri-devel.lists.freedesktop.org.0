Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F20C7F32B0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 16:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765F86F6DB;
	Thu,  7 Nov 2019 15:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8776F6DB;
 Thu,  7 Nov 2019 15:17:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 07:17:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,278,1569308400"; d="scan'208";a="214626000"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 07 Nov 2019 07:17:34 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 07 Nov 2019 17:17:33 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 02/12] drm/i915: Polish CHV .load_luts() a bit
Date: Thu,  7 Nov 2019 17:17:15 +0200
Message-Id: <20191107151725.10507-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107151725.10507-1-ville.syrjala@linux.intel.com>
References: <20191107151725.10507-1-ville.syrjala@linux.intel.com>
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
Cc: Swati Sharma <swati2.sharma@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkl0
IGlya3MgbWUgdG8gdXNlIGNydGNfc3RhdGVfaXNfbGVnYWN5X2dhbW1hKCkgaW5zaWRlIHRoZSBn
dXRzCm9mIHRoZSBDSFYgY29sb3IgbWFuYWdlbWVudCBjb2RlLiBMZXQncyBnZXQgcmlkIG9mIGl0
IGFuZCBpbnN0ZWFkCmp1c3QgY29uc3VsdCBjZ21fbW9kZSB0byBmaWd1cmUgb3V0IGlmIHdlIHdh
bnQgdG8gZW5hYmxlIHRoZSBwaXBlCmdhbW1hIG9yIHRoZSBDR00gZ2FtbWEuCgpBbHNvIENIViBk
aXNwbGF5IGVuZ2luZSBpcyBiYXNlZCBvbiBpOTY1L2c0eCBzbyB3ZSBzaG91bGQgZmFsbCBiYWNr
CnRvIHRoZSBpOTY1IHBhdGggd2hlbiB0aGUgQ0dNIGdhbW1hIGlzIG5vdCB1c2VkLgoKU2lnbmVk
LW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMgfCAxMSArKysr
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMKaW5kZXggMzk4MGU4
YjUwYzI4Li5kOGVlOTBiNzc3NGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfY29sb3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2NvbG9yLmMKQEAgLTk5NiwxNiArOTk2LDEzIEBAIHN0YXRpYyB2b2lkIGNodl9sb2FkX2x1
dHMoY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpCiAKIAljaGVycnl2
aWV3X2xvYWRfY3NjX21hdHJpeChjcnRjX3N0YXRlKTsKIAotCWlmIChjcnRjX3N0YXRlX2lzX2xl
Z2FjeV9nYW1tYShjcnRjX3N0YXRlKSkgewotCQlpOXh4X2xvYWRfbHV0cyhjcnRjX3N0YXRlKTsK
LQkJcmV0dXJuOwotCX0KLQotCWlmIChkZWdhbW1hX2x1dCkKKwlpZiAoY3J0Y19zdGF0ZS0+Y2dt
X21vZGUgJiBDR01fUElQRV9NT0RFX0RFR0FNTUEpCiAJCWNodl9sb2FkX2NnbV9kZWdhbW1hKGNy
dGMsIGRlZ2FtbWFfbHV0KTsKIAotCWlmIChnYW1tYV9sdXQpCisJaWYgKGNydGNfc3RhdGUtPmNn
bV9tb2RlICYgQ0dNX1BJUEVfTU9ERV9HQU1NQSkKIAkJY2h2X2xvYWRfY2dtX2dhbW1hKGNydGMs
IGdhbW1hX2x1dCk7CisJZWxzZQorCQlpOTY1X2xvYWRfbHV0cyhjcnRjX3N0YXRlKTsKIH0KIAog
dm9pZCBpbnRlbF9jb2xvcl9sb2FkX2x1dHMoY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUg
KmNydGNfc3RhdGUpCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
