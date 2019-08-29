Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB61A3265
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5ECE6E2A6;
	Fri, 30 Aug 2019 08:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD37F6E0A0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 11:30:22 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A18BA200330;
 Thu, 29 Aug 2019 13:30:21 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9440C200073;
 Thu, 29 Aug 2019 13:30:21 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id E65AA20613;
 Thu, 29 Aug 2019 13:30:20 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 04/14] drm/mxsfb: Reset vital registers for a proper
 initialization
Date: Thu, 29 Aug 2019 14:30:05 +0300
Message-Id: <1567078215-31601-5-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567078215-31601-1-git-send-email-robert.chiras@nxp.com>
References: <1567078215-31601-1-git-send-email-robert.chiras@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSBvZiB0aGUgcmVnaXN0ZXJzLCBsaWtlIExDRENfQ1RSTCwgQ1RSTDJfT1VUU1RBTkRJTkdf
UkVRUyBhbmQKQ1RSTDFfUkVDT1ZFUllfT05fVU5ERVJGTE9XIG5lZWRzIHRvIGJlIHByb3Blcmx5
IGNsZWFyZWQvaW5pdGlhbGl6ZWQKZm9yIGEgYmV0dGVyIHN0YXJ0IGFuZCBzdG9wIHJvdXRpbmUu
CgpTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+ClRl
c3RlZC1ieTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5jIHwgMTIgKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9t
eHNmYl9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5jCmluZGV4IGI2
OWFjZTguLjVlNDRmNTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9j
cnRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2NydGMuYwpAQCAtMTI3LDYg
KzEyNywxMCBAQCBzdGF0aWMgdm9pZCBteHNmYl9lbmFibGVfY29udHJvbGxlcihzdHJ1Y3QgbXhz
ZmJfZHJtX3ByaXZhdGUgKm14c2ZiKQogCQljbGtfcHJlcGFyZV9lbmFibGUobXhzZmItPmNsa19k
aXNwX2F4aSk7CiAJY2xrX3ByZXBhcmVfZW5hYmxlKG14c2ZiLT5jbGspOwogCisJaWYgKG14c2Zi
LT5kZXZkYXRhLT5pcHZlcnNpb24gPj0gNCkKKwkJd3JpdGVsKENUUkwyX09VVFNUQU5ESU5HX1JF
UVMoUkVRXzE2KSwKKwkJICAgICAgIG14c2ZiLT5iYXNlICsgTENEQ19WNF9DVFJMMiArIFJFR19T
RVQpOworCiAJLyogSWYgaXQgd2FzIGRpc2FibGVkLCByZS1lbmFibGUgdGhlIG1vZGUgYWdhaW4g
Ki8KIAl3cml0ZWwoQ1RSTF9ET1RDTEtfTU9ERSwgbXhzZmItPmJhc2UgKyBMQ0RDX0NUUkwgKyBS
RUdfU0VUKTsKIApAQCAtMTM2LDEyICsxNDAsMTkgQEAgc3RhdGljIHZvaWQgbXhzZmJfZW5hYmxl
X2NvbnRyb2xsZXIoc3RydWN0IG14c2ZiX2RybV9wcml2YXRlICpteHNmYikKIAl3cml0ZWwocmVn
LCBteHNmYi0+YmFzZSArIExDRENfVkRDVFJMNCk7CiAKIAl3cml0ZWwoQ1RSTF9SVU4sIG14c2Zi
LT5iYXNlICsgTENEQ19DVFJMICsgUkVHX1NFVCk7CisJd3JpdGVsKENUUkwxX1JFQ09WRVJZX09O
X1VOREVSRkxPVywgbXhzZmItPmJhc2UgKyBMQ0RDX0NUUkwxICsgUkVHX1NFVCk7CiB9CiAKIHN0
YXRpYyB2b2lkIG14c2ZiX2Rpc2FibGVfY29udHJvbGxlcihzdHJ1Y3QgbXhzZmJfZHJtX3ByaXZh
dGUgKm14c2ZiKQogewogCXUzMiByZWc7CiAKKwlpZiAobXhzZmItPmRldmRhdGEtPmlwdmVyc2lv
biA+PSA0KQorCQl3cml0ZWwoQ1RSTDJfT1VUU1RBTkRJTkdfUkVRUygweDcpLAorCQkgICAgICAg
bXhzZmItPmJhc2UgKyBMQ0RDX1Y0X0NUUkwyICsgUkVHX0NMUik7CisKKwl3cml0ZWwoQ1RSTF9S
VU4sIG14c2ZiLT5iYXNlICsgTENEQ19DVFJMICsgUkVHX0NMUik7CisKIAkvKgogCSAqIEV2ZW4g
aWYgd2UgZGlzYWJsZSB0aGUgY29udHJvbGxlciBoZXJlLCBpdCB3aWxsIHN0aWxsIGNvbnRpbnVl
CiAJICogdW50aWwgaXRzIEZJRk9zIGFyZSBydW5uaW5nIG91dCBvZiBkYXRhCkBAIC0yOTUsNiAr
MzA2LDcgQEAgdm9pZCBteHNmYl9jcnRjX2VuYWJsZShzdHJ1Y3QgbXhzZmJfZHJtX3ByaXZhdGUg
Km14c2ZiKQogCWRtYV9hZGRyX3QgcGFkZHI7CiAKIAlteHNmYl9lbmFibGVfYXhpX2NsayhteHNm
Yik7CisJd3JpdGVsKDAsIG14c2ZiLT5iYXNlICsgTENEQ19DVFJMKTsKIAlteHNmYl9jcnRjX21v
ZGVfc2V0X25vZmIobXhzZmIpOwogCiAJLyogV3JpdGUgY3VyX2J1ZiBhcyB3ZWxsIHRvIGF2b2lk
IGFuIGluaXRpYWwgY29ycnVwdCBmcmFtZSAqLwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
