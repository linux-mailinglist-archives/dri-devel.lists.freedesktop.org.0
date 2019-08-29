Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0631CA3264
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410E26E299;
	Fri, 30 Aug 2019 08:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D836E0A0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 11:30:29 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 344F81A015C;
 Thu, 29 Aug 2019 13:30:28 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 318A31A0010;
 Thu, 29 Aug 2019 13:30:28 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 318D020613;
 Thu, 29 Aug 2019 13:30:27 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 12/14] drm/mxsfb: Clear OUTSTANDING_REQS bits
Date: Thu, 29 Aug 2019 14:30:13 +0300
Message-Id: <1567078215-31601-13-git-send-email-robert.chiras@nxp.com>
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

Qml0IDIxIGNhbiBhbHRlciB0aGUgQ1RSTDJfT1VUU1RBTkRJTkdfUkVRUyB2YWx1ZSByaWdodCBh
ZnRlciB0aGUgZUxDRElGCmlzIGVuYWJsZWQsIHNpbmNlIGl0IGNvbWVzIHVwIHdpdGggZGVmYXVs
dCB2YWx1ZSBvZiAxICh0aGlzIGJlaGF2aW91cgpoYXMgYmVlbiBzZWVuIG9uIHNvbWUgaW14OCBw
bGF0Zm9ybXMpLgpJbiBvcmRlciB0byBmaXggdGhpcywgY2xlYXIgQ1RSTDJfT1VUU1RBTkRJTkdf
UkVRUyBiaXRzIGJlZm9yZSBzZXR0aW5nCml0cyB2YWx1ZS4KClNpZ25lZC1vZmYtYnk6IFJvYmVy
dCBDaGlyYXMgPHJvYmVydC5jaGlyYXNAbnhwLmNvbT4KVGVzdGVkLWJ5OiBHdWlkbyBHw7xudGhl
ciA8YWd4QHNpZ3hjcHUub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9jcnRj
LmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJt
L214c2ZiL214c2ZiX2NydGMuYwppbmRleCBlNzI3ZjVlLi5hMTJmNTNkIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
eHNmYi9teHNmYl9jcnRjLmMKQEAgLTIyNSw2ICsyMjUsMTMgQEAgc3RhdGljIHZvaWQgbXhzZmJf
ZW5hYmxlX2NvbnRyb2xsZXIoc3RydWN0IG14c2ZiX2RybV9wcml2YXRlICpteHNmYikKIAljbGtf
cHJlcGFyZV9lbmFibGUobXhzZmItPmNsayk7CiAKIAlpZiAobXhzZmItPmRldmRhdGEtPmlwdmVy
c2lvbiA+PSA0KSB7CisJCS8qCisJCSAqIE9uIHNvbWUgcGxhdGZvcm1zLCBiaXQgMjEgaXMgZGVm
YXVsdGVkIHRvIDEsIHdoaWNoIG1heSBhbHRlcgorCQkgKiB0aGUgYmVsb3cgc2V0dGluZy4gU28s
IHRvIG1ha2Ugc3VyZSB3ZSBoYXZlIHRoZSByaWdodCBzZXR0aW5nCisJCSAqIGNsZWFyIGFsbCB0
aGUgYml0cyBmb3IgQ1RSTDJfT1VUU1RBTkRJTkdfUkVRUy4KKwkJICovCisJCXdyaXRlbChDVFJM
Ml9PVVRTVEFORElOR19SRVFTKDB4NyksCisJCSAgICAgICBteHNmYi0+YmFzZSArIExDRENfVjRf
Q1RSTDIgKyBSRUdfQ0xSKTsKIAkJd3JpdGVsKENUUkwyX09VVFNUQU5ESU5HX1JFUVMoUkVRXzE2
KSwKIAkJICAgICAgIG14c2ZiLT5iYXNlICsgTENEQ19WNF9DVFJMMiArIFJFR19TRVQpOwogCQkv
KiBBc3NlcnQgTENEIFJlc2V0IGJpdCAqLwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
