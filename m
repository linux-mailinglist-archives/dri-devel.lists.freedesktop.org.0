Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E35757CE1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44BB6E7DB;
	Thu, 27 Jun 2019 07:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39B06E430
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 13:32:28 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5D97E1A0A37;
 Wed, 26 Jun 2019 15:32:27 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 517681A0A32;
 Wed, 26 Jun 2019 15:32:27 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id A25EA205DB;
 Wed, 26 Jun 2019 15:32:26 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 07/10] drm/mxsfb: Update mxsfb to support LCD reset
Date: Wed, 26 Jun 2019 16:32:15 +0300
Message-Id: <1561555938-21595-8-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561555938-21595-1-git-send-email-robert.chiras@nxp.com>
References: <1561555938-21595-1-git-send-email-robert.chiras@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 27 Jun 2019 07:11:26 +0000
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
 Robert Chiras <robert.chiras@nxp.com>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGVMQ0RJRiBjb250cm9sbGVyIGhhcyBjb250cm9sIHBpbiBmb3IgdGhlIGV4dGVybmFsIExD
RCByZXNldCBwaW4uCkFkZCBzdXBwb3J0IGZvciBpdCBhbmQgYXNzZXJ0IHRoaXMgcGluIGluIGVu
YWJsZSBhbmQgZGUtYXNzZXJ0IGl0IGluCmRpc2FibGUuCgpTaWduZWQtb2ZmLWJ5OiBSb2JlcnQg
Q2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL214c2Zi
L214c2ZiX2NydGMuYyB8IDEwICsrKysrKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNm
Yl9yZWdzLmggfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5j
IGIvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2NydGMuYwppbmRleCBlNDgzOTZkLi5kOTQy
OWZjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9jcnRjLmMKQEAgLTIyMiw5ICsyMjIsMTIgQEAg
c3RhdGljIHZvaWQgbXhzZmJfZW5hYmxlX2NvbnRyb2xsZXIoc3RydWN0IG14c2ZiX2RybV9wcml2
YXRlICpteHNmYikKIAkJY2xrX3ByZXBhcmVfZW5hYmxlKG14c2ZiLT5jbGtfZGlzcF9heGkpOwog
CWNsa19wcmVwYXJlX2VuYWJsZShteHNmYi0+Y2xrKTsKIAotCWlmIChteHNmYi0+ZGV2ZGF0YS0+
aXB2ZXJzaW9uID49IDQpCisJaWYgKG14c2ZiLT5kZXZkYXRhLT5pcHZlcnNpb24gPj0gNCkgewog
CQl3cml0ZWwoQ1RSTDJfT1VUU1RBTkRJTkdfUkVRU19fUkVRXzE2LAogCQkgICAgICAgbXhzZmIt
PmJhc2UgKyBMQ0RDX1Y0X0NUUkwyICsgUkVHX1NFVCk7CisJCS8qIEFzc2VydCBMQ0QgUmVzZXQg
Yml0ICovCisJCXdyaXRlbChDVFJMMl9MQ0RfUkVTRVQsIG14c2ZiLT5iYXNlICsgTENEQ19WNF9D
VFJMMiArIFJFR19TRVQpOworCX0KIAogCS8qIElmIGl0IHdhcyBkaXNhYmxlZCwgcmUtZW5hYmxl
IHRoZSBtb2RlIGFnYWluICovCiAJd3JpdGVsKENUUkxfRE9UQ0xLX01PREUsIG14c2ZiLT5iYXNl
ICsgTENEQ19DVFJMICsgUkVHX1NFVCk7CkBAIC0yNDIsOSArMjQ1LDEyIEBAIHN0YXRpYyB2b2lk
IG14c2ZiX2Rpc2FibGVfY29udHJvbGxlcihzdHJ1Y3QgbXhzZmJfZHJtX3ByaXZhdGUgKm14c2Zi
KQogewogCXUzMiByZWc7CiAKLQlpZiAobXhzZmItPmRldmRhdGEtPmlwdmVyc2lvbiA+PSA0KQor
CWlmIChteHNmYi0+ZGV2ZGF0YS0+aXB2ZXJzaW9uID49IDQpIHsKIAkJd3JpdGVsKENUUkwyX09V
VFNUQU5ESU5HX1JFUVMoMHg3KSwKIAkJICAgICAgIG14c2ZiLT5iYXNlICsgTENEQ19WNF9DVFJM
MiArIFJFR19DTFIpOworCQkvKiBEZS1hc3NlcnQgTENEIFJlc2V0IGJpdCAqLworCQl3cml0ZWwo
Q1RSTDJfTENEX1JFU0VULCBteHNmYi0+YmFzZSArIExDRENfVjRfQ1RSTDIgKyBSRUdfQ0xSKTsK
Kwl9CiAKIAl3cml0ZWwoQ1RSTF9SVU4sIG14c2ZiLT5iYXNlICsgTENEQ19DVFJMICsgUkVHX0NM
Uik7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9yZWdzLmggYi9k
cml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfcmVncy5oCmluZGV4IDllZTBkM2M3Li4yNTgzYTY5
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfcmVncy5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9yZWdzLmgKQEAgLTg3LDYgKzg3LDcgQEAKICNkZWZp
bmUgQ1RSTDJfT1VUU1RBTkRJTkdfUkVRUyh4KQlSRUdfUFVUKCh4KSwgMjMsIDIxKQogI2RlZmlu
ZSBDVFJMMl9PRERfTElORV9QQVRURVJOKHgpCVJFR19QVVQoKHgpLCAxOCwgMTYpCiAjZGVmaW5l
IENUUkwyX0VWRU5fTElORV9QQVRURVJOKHgpCVJFR19QVVQoKHgpLCAxNCwgMTIpCisjZGVmaW5l
IENUUkwyX0xDRF9SRVNFVAkJCUJJVCgwKQogCiAjZGVmaW5lIFRSQU5TRkVSX0NPVU5UX1NFVF9W
Q09VTlQoeCkJKCgoeCkgJiAweGZmZmYpIDw8IDE2KQogI2RlZmluZSBUUkFOU0ZFUl9DT1VOVF9H
RVRfVkNPVU5UKHgpCSgoKHgpID4+IDE2KSAmIDB4ZmZmZikKLS0gCjIuNy40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
