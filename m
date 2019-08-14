Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 226868E705
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A7E6E924;
	Thu, 15 Aug 2019 08:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF6A6E5D4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:57:04 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 72C651A038F;
 Wed, 14 Aug 2019 12:49:00 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 65B801A0389;
 Wed, 14 Aug 2019 12:49:00 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 6221A2060E;
 Wed, 14 Aug 2019 12:48:59 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 04/15] drm/mxsfb: Reset vital register for a proper
 initialization
Date: Wed, 14 Aug 2019 13:48:40 +0300
Message-Id: <1565779731-1300-5-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
References: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSBvZiB0aGUgcmVnaXRlcnMgbmVlZCwgbGlrZSBMQ0RDX0NUUkwgYW5kIENUUkwyX09VVFNU
QU5ESU5HX1JFUVMKbmVlZHMgdG8gYmUgcHJvcGVybHkgY2xlYXJlZCBhbmQgaW5pdGlhbGl6ZWQg
Zm9yIGEgYmV0dGVyIHN0YXJ0IGFuZCBzdG9wCnJvdXRpbmUuCgpTaWduZWQtb2ZmLWJ5OiBSb2Jl
cnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL214
c2ZiL214c2ZiX2NydGMuYyB8IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0
Yy5jIGIvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2NydGMuYwppbmRleCBiNjlhY2U4Li41
ZTQ0ZjU3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9jcnRjLmMKQEAgLTEyNyw2ICsxMjcsMTAg
QEAgc3RhdGljIHZvaWQgbXhzZmJfZW5hYmxlX2NvbnRyb2xsZXIoc3RydWN0IG14c2ZiX2RybV9w
cml2YXRlICpteHNmYikKIAkJY2xrX3ByZXBhcmVfZW5hYmxlKG14c2ZiLT5jbGtfZGlzcF9heGkp
OwogCWNsa19wcmVwYXJlX2VuYWJsZShteHNmYi0+Y2xrKTsKIAorCWlmIChteHNmYi0+ZGV2ZGF0
YS0+aXB2ZXJzaW9uID49IDQpCisJCXdyaXRlbChDVFJMMl9PVVRTVEFORElOR19SRVFTKFJFUV8x
NiksCisJCSAgICAgICBteHNmYi0+YmFzZSArIExDRENfVjRfQ1RSTDIgKyBSRUdfU0VUKTsKKwog
CS8qIElmIGl0IHdhcyBkaXNhYmxlZCwgcmUtZW5hYmxlIHRoZSBtb2RlIGFnYWluICovCiAJd3Jp
dGVsKENUUkxfRE9UQ0xLX01PREUsIG14c2ZiLT5iYXNlICsgTENEQ19DVFJMICsgUkVHX1NFVCk7
CiAKQEAgLTEzNiwxMiArMTQwLDE5IEBAIHN0YXRpYyB2b2lkIG14c2ZiX2VuYWJsZV9jb250cm9s
bGVyKHN0cnVjdCBteHNmYl9kcm1fcHJpdmF0ZSAqbXhzZmIpCiAJd3JpdGVsKHJlZywgbXhzZmIt
PmJhc2UgKyBMQ0RDX1ZEQ1RSTDQpOwogCiAJd3JpdGVsKENUUkxfUlVOLCBteHNmYi0+YmFzZSAr
IExDRENfQ1RSTCArIFJFR19TRVQpOworCXdyaXRlbChDVFJMMV9SRUNPVkVSWV9PTl9VTkRFUkZM
T1csIG14c2ZiLT5iYXNlICsgTENEQ19DVFJMMSArIFJFR19TRVQpOwogfQogCiBzdGF0aWMgdm9p
ZCBteHNmYl9kaXNhYmxlX2NvbnRyb2xsZXIoc3RydWN0IG14c2ZiX2RybV9wcml2YXRlICpteHNm
YikKIHsKIAl1MzIgcmVnOwogCisJaWYgKG14c2ZiLT5kZXZkYXRhLT5pcHZlcnNpb24gPj0gNCkK
KwkJd3JpdGVsKENUUkwyX09VVFNUQU5ESU5HX1JFUVMoMHg3KSwKKwkJICAgICAgIG14c2ZiLT5i
YXNlICsgTENEQ19WNF9DVFJMMiArIFJFR19DTFIpOworCisJd3JpdGVsKENUUkxfUlVOLCBteHNm
Yi0+YmFzZSArIExDRENfQ1RSTCArIFJFR19DTFIpOworCiAJLyoKIAkgKiBFdmVuIGlmIHdlIGRp
c2FibGUgdGhlIGNvbnRyb2xsZXIgaGVyZSwgaXQgd2lsbCBzdGlsbCBjb250aW51ZQogCSAqIHVu
dGlsIGl0cyBGSUZPcyBhcmUgcnVubmluZyBvdXQgb2YgZGF0YQpAQCAtMjk1LDYgKzMwNiw3IEBA
IHZvaWQgbXhzZmJfY3J0Y19lbmFibGUoc3RydWN0IG14c2ZiX2RybV9wcml2YXRlICpteHNmYikK
IAlkbWFfYWRkcl90IHBhZGRyOwogCiAJbXhzZmJfZW5hYmxlX2F4aV9jbGsobXhzZmIpOworCXdy
aXRlbCgwLCBteHNmYi0+YmFzZSArIExDRENfQ1RSTCk7CiAJbXhzZmJfY3J0Y19tb2RlX3NldF9u
b2ZiKG14c2ZiKTsKIAogCS8qIFdyaXRlIGN1cl9idWYgYXMgd2VsbCB0byBhdm9pZCBhbiBpbml0
aWFsIGNvcnJ1cHQgZnJhbWUgKi8KLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
