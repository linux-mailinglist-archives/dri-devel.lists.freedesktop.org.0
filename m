Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BBB8E68F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D8D6E8E9;
	Thu, 15 Aug 2019 08:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB34C6E5D5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:57:04 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4AE281A039B;
 Wed, 14 Aug 2019 12:49:08 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3E6821A039F;
 Wed, 14 Aug 2019 12:49:08 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 33F602060E;
 Wed, 14 Aug 2019 12:49:07 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 11/15] drm/mxsfb: Update mxsfb to support LCD reset
Date: Wed, 14 Aug 2019 13:48:47 +0300
Message-Id: <1565779731-1300-12-git-send-email-robert.chiras@nxp.com>
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

VGhlIGVMQ0RJRiBjb250cm9sbGVyIGhhcyBjb250cm9sIHBpbiBmb3IgdGhlIGV4dGVybmFsIExD
RCByZXNldCBwaW4uCkFkZCBzdXBwb3J0IGZvciBpdCBhbmQgYXNzZXJ0IHRoaXMgcGluIGluIGVu
YWJsZSBhbmQgZGUtYXNzZXJ0IGl0IGluCmRpc2FibGUuCgpTaWduZWQtb2ZmLWJ5OiBSb2JlcnQg
Q2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL214c2Zi
L214c2ZiX2NydGMuYyB8IDE0ICsrKysrKysrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXhzZmIv
bXhzZmJfcmVncy5oIHwgIDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJf
Y3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2NydGMuYwppbmRleCAxYmUyOWY1
Li5hNGJhMzY4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9jcnRjLmMKQEAgLTIyNCw5ICsyMjQs
MTIgQEAgc3RhdGljIHZvaWQgbXhzZmJfZW5hYmxlX2NvbnRyb2xsZXIoc3RydWN0IG14c2ZiX2Ry
bV9wcml2YXRlICpteHNmYikKIAkJY2xrX3ByZXBhcmVfZW5hYmxlKG14c2ZiLT5jbGtfZGlzcF9h
eGkpOwogCWNsa19wcmVwYXJlX2VuYWJsZShteHNmYi0+Y2xrKTsKIAotCWlmIChteHNmYi0+ZGV2
ZGF0YS0+aXB2ZXJzaW9uID49IDQpCisJaWYgKG14c2ZiLT5kZXZkYXRhLT5pcHZlcnNpb24gPj0g
NCkgewogCQl3cml0ZWwoQ1RSTDJfT1VUU1RBTkRJTkdfUkVRUyhSRVFfMTYpLAogCQkgICAgICAg
bXhzZmItPmJhc2UgKyBMQ0RDX1Y0X0NUUkwyICsgUkVHX1NFVCk7CisJCS8qIEFzc2VydCBMQ0Qg
UmVzZXQgYml0ICovCisJCXdyaXRlbChDVFJMMl9MQ0RfUkVTRVQsIG14c2ZiLT5iYXNlICsgTENE
Q19WNF9DVFJMMiArIFJFR19TRVQpOworCX0KIAogCS8qIElmIGl0IHdhcyBkaXNhYmxlZCwgcmUt
ZW5hYmxlIHRoZSBtb2RlIGFnYWluICovCiAJd3JpdGVsKENUUkxfRE9UQ0xLX01PREUsIG14c2Zi
LT5iYXNlICsgTENEQ19DVFJMICsgUkVHX1NFVCk7CkBAIC0yNDQsMTEgKzI0NywxNCBAQCBzdGF0
aWMgdm9pZCBteHNmYl9kaXNhYmxlX2NvbnRyb2xsZXIoc3RydWN0IG14c2ZiX2RybV9wcml2YXRl
ICpteHNmYikKIHsKIAl1MzIgcmVnOwogCi0JaWYgKG14c2ZiLT5kZXZkYXRhLT5pcHZlcnNpb24g
Pj0gNCkKKwl3cml0ZWwoQ1RSTF9SVU4sIG14c2ZiLT5iYXNlICsgTENEQ19DVFJMICsgUkVHX0NM
Uik7CisKKwlpZiAobXhzZmItPmRldmRhdGEtPmlwdmVyc2lvbiA+PSA0KSB7CiAJCXdyaXRlbChD
VFJMMl9PVVRTVEFORElOR19SRVFTKDB4NyksCiAJCSAgICAgICBteHNmYi0+YmFzZSArIExDRENf
VjRfQ1RSTDIgKyBSRUdfQ0xSKTsKLQotCXdyaXRlbChDVFJMX1JVTiwgbXhzZmItPmJhc2UgKyBM
Q0RDX0NUUkwgKyBSRUdfQ0xSKTsKKwkJLyogRGUtYXNzZXJ0IExDRCBSZXNldCBiaXQgKi8KKwkJ
d3JpdGVsKENUUkwyX0xDRF9SRVNFVCwgbXhzZmItPmJhc2UgKyBMQ0RDX1Y0X0NUUkwyICsgUkVH
X0NMUik7CisJfQogCiAJLyoKIAkgKiBFdmVuIGlmIHdlIGRpc2FibGUgdGhlIGNvbnRyb2xsZXIg
aGVyZSwgaXQgd2lsbCBzdGlsbCBjb250aW51ZQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L214c2ZiL214c2ZiX3JlZ3MuaCBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9yZWdzLmgK
aW5kZXggZGM0ZGFhMC4uMGY2M2JhMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL214c2Zi
L214c2ZiX3JlZ3MuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfcmVncy5oCkBA
IC0xMDgsNiArMTA4LDggQEAKICNkZWZpbmUgQ1RSTDJfTElORV9QQVRURVJOX0JHUgk1CiAjZGVm
aW5lIENUUkwyX0xJTkVfUEFUVEVSTl9DTFIJNwogCisjZGVmaW5lIENUUkwyX0xDRF9SRVNFVAkJ
CUJJVCgwKQorCiAjZGVmaW5lIFRSQU5TRkVSX0NPVU5UX1NFVF9WQ09VTlQoeCkJUkVHX1BVVCgo
eCksIDMxLCAxNikKICNkZWZpbmUgVFJBTlNGRVJfQ09VTlRfR0VUX1ZDT1VOVCh4KQlSRUdfR0VU
KCh4KSwgMzEsIDE2KQogI2RlZmluZSBUUkFOU0ZFUl9DT1VOVF9TRVRfSENPVU5UKHgpCVJFR19Q
VVQoKHgpLCAxNSwgMCkKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
