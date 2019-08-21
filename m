Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF5398D49
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC41E6EA92;
	Thu, 22 Aug 2019 08:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC3E6E2A6
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 10:16:20 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 15C6D1A02E7;
 Wed, 21 Aug 2019 12:16:19 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0888E1A01DF;
 Wed, 21 Aug 2019 12:16:19 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 595C220612;
 Wed, 21 Aug 2019 12:16:18 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 04/15] drm/mxsfb: Reset vital registers for a proper
 initialization
Date: Wed, 21 Aug 2019 13:15:44 +0300
Message-Id: <1566382555-12102-5-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566382555-12102-1-git-send-email-robert.chiras@nxp.com>
References: <1566382555-12102-1-git-send-email-robert.chiras@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 22 Aug 2019 08:14:56 +0000
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

U29tZSBvZiB0aGUgcmVnaXN0ZXJzLCBsaWtlIExDRENfQ1RSTCwgQ1RSTDJfT1VUU1RBTkRJTkdf
UkVRUyBhbmQKQ1RSTDFfUkVDT1ZFUllfT05fVU5ERVJGTE9XIG5lZWRzIHRvIGJlIHByb3Blcmx5
IGNsZWFyZWQvaW5pdGlhbGl6ZWQKZm9yIGEgYmV0dGVyIHN0YXJ0IGFuZCBzdG9wIHJvdXRpbmUu
CgpTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2NydGMuYyB8IDEyICsrKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Ny
dGMuYwppbmRleCBiNjlhY2U4Li41ZTQ0ZjU3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bXhzZmIvbXhzZmJfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9jcnRj
LmMKQEAgLTEyNyw2ICsxMjcsMTAgQEAgc3RhdGljIHZvaWQgbXhzZmJfZW5hYmxlX2NvbnRyb2xs
ZXIoc3RydWN0IG14c2ZiX2RybV9wcml2YXRlICpteHNmYikKIAkJY2xrX3ByZXBhcmVfZW5hYmxl
KG14c2ZiLT5jbGtfZGlzcF9heGkpOwogCWNsa19wcmVwYXJlX2VuYWJsZShteHNmYi0+Y2xrKTsK
IAorCWlmIChteHNmYi0+ZGV2ZGF0YS0+aXB2ZXJzaW9uID49IDQpCisJCXdyaXRlbChDVFJMMl9P
VVRTVEFORElOR19SRVFTKFJFUV8xNiksCisJCSAgICAgICBteHNmYi0+YmFzZSArIExDRENfVjRf
Q1RSTDIgKyBSRUdfU0VUKTsKKwogCS8qIElmIGl0IHdhcyBkaXNhYmxlZCwgcmUtZW5hYmxlIHRo
ZSBtb2RlIGFnYWluICovCiAJd3JpdGVsKENUUkxfRE9UQ0xLX01PREUsIG14c2ZiLT5iYXNlICsg
TENEQ19DVFJMICsgUkVHX1NFVCk7CiAKQEAgLTEzNiwxMiArMTQwLDE5IEBAIHN0YXRpYyB2b2lk
IG14c2ZiX2VuYWJsZV9jb250cm9sbGVyKHN0cnVjdCBteHNmYl9kcm1fcHJpdmF0ZSAqbXhzZmIp
CiAJd3JpdGVsKHJlZywgbXhzZmItPmJhc2UgKyBMQ0RDX1ZEQ1RSTDQpOwogCiAJd3JpdGVsKENU
UkxfUlVOLCBteHNmYi0+YmFzZSArIExDRENfQ1RSTCArIFJFR19TRVQpOworCXdyaXRlbChDVFJM
MV9SRUNPVkVSWV9PTl9VTkRFUkZMT1csIG14c2ZiLT5iYXNlICsgTENEQ19DVFJMMSArIFJFR19T
RVQpOwogfQogCiBzdGF0aWMgdm9pZCBteHNmYl9kaXNhYmxlX2NvbnRyb2xsZXIoc3RydWN0IG14
c2ZiX2RybV9wcml2YXRlICpteHNmYikKIHsKIAl1MzIgcmVnOwogCisJaWYgKG14c2ZiLT5kZXZk
YXRhLT5pcHZlcnNpb24gPj0gNCkKKwkJd3JpdGVsKENUUkwyX09VVFNUQU5ESU5HX1JFUVMoMHg3
KSwKKwkJICAgICAgIG14c2ZiLT5iYXNlICsgTENEQ19WNF9DVFJMMiArIFJFR19DTFIpOworCisJ
d3JpdGVsKENUUkxfUlVOLCBteHNmYi0+YmFzZSArIExDRENfQ1RSTCArIFJFR19DTFIpOworCiAJ
LyoKIAkgKiBFdmVuIGlmIHdlIGRpc2FibGUgdGhlIGNvbnRyb2xsZXIgaGVyZSwgaXQgd2lsbCBz
dGlsbCBjb250aW51ZQogCSAqIHVudGlsIGl0cyBGSUZPcyBhcmUgcnVubmluZyBvdXQgb2YgZGF0
YQpAQCAtMjk1LDYgKzMwNiw3IEBAIHZvaWQgbXhzZmJfY3J0Y19lbmFibGUoc3RydWN0IG14c2Zi
X2RybV9wcml2YXRlICpteHNmYikKIAlkbWFfYWRkcl90IHBhZGRyOwogCiAJbXhzZmJfZW5hYmxl
X2F4aV9jbGsobXhzZmIpOworCXdyaXRlbCgwLCBteHNmYi0+YmFzZSArIExDRENfQ1RSTCk7CiAJ
bXhzZmJfY3J0Y19tb2RlX3NldF9ub2ZiKG14c2ZiKTsKIAogCS8qIFdyaXRlIGN1cl9idWYgYXMg
d2VsbCB0byBhdm9pZCBhbiBpbml0aWFsIGNvcnJ1cHQgZnJhbWUgKi8KLS0gCjIuNy40CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
