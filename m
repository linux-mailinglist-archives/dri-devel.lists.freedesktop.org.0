Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 023411076CF
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 18:56:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FB56E46C;
	Fri, 22 Nov 2019 17:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C0CB6E46B;
 Fri, 22 Nov 2019 17:56:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Nov 2019 09:56:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,230,1571727600"; d="scan'208";a="290714835"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 22 Nov 2019 09:56:27 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Nov 2019 19:56:27 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/rect: Avoid division by zero
Date: Fri, 22 Nov 2019 19:56:20 +0200
Message-Id: <20191122175623.13565-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191122175623.13565-1-ville.syrjala@linux.intel.com>
References: <20191122175623.13565-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkNo
ZWNrIGZvciB6ZXJvIHdpZHRoL2hlaWdodCBkZXN0aW5hdGlvbiByZWN0YW5nbGUgaW4KZHJtX3Jl
Y3RfY2xpcF9zY2FsZWQoKSB0byBhdm9pZCBhIGRpdmlzaW9uIGJ5IHplcm8uCgpDYzogc3RhYmxl
QHZnZXIua2VybmVsLm9yZwpGaXhlczogZjk2YmRmNTY0ZjNlICgiZHJtL3JlY3Q6IEhhbmRsZSBy
b3VuZGluZyBlcnJvcnMgaW4gZHJtX3JlY3RfY2xpcF9zY2FsZWQsIHYzLiIpCkNjOiBNYWFydGVu
IExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogQmVuamFt
aW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQHN0LmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KVGVzdGNhc2U6IGlndC9rbXNfc2VsZnRlc3QvZHJtX3JlY3RfY2xp
cF9zY2FsZWRfZGl2X2J5X3plcm8KU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3JlY3Qu
YyB8IDcgKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcmVjdC5jIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9yZWN0LmMKaW5kZXggYjgzNjNhYWE5MDMyLi44MTg3MzhlODNkMDYgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcmVjdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fcmVjdC5jCkBAIC01NCw3ICs1NCwxMiBAQCBFWFBPUlRfU1lNQk9MKGRybV9yZWN0X2ludGVy
c2VjdCk7CiAKIHN0YXRpYyB1MzIgY2xpcF9zY2FsZWQodTMyIHNyYywgdTMyIGRzdCwgdTMyIGNs
aXApCiB7Ci0JdTY0IHRtcCA9IG11bF91MzJfdTMyKHNyYywgZHN0IC0gY2xpcCk7CisJdTY0IHRt
cDsKKworCWlmIChkc3QgPT0gMCkKKwkJcmV0dXJuIDA7CisKKwl0bXAgPSBtdWxfdTMyX3UzMihz
cmMsIGRzdCAtIGNsaXApOwogCiAJLyoKIAkgKiBSb3VuZCB0b3dhcmQgMS4wIHdoZW4gY2xpcHBp
bmcgc28gdGhhdCB3ZSBkb24ndCBhY2NpZGVudGFsbHkKLS0gCjIuMjMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
