Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D5619DFA5
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 22:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED02F6EC95;
	Fri,  3 Apr 2020 20:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF3B6EC95;
 Fri,  3 Apr 2020 20:41:01 +0000 (UTC)
IronPort-SDR: JtTt2ukcExa2Obh5BmtXauKHxHS6/9hTSgPhqxNwOhwKHjN9nyOjVmUJoTjYY+SCpaYMTYKro8
 Vzpx1Tq4W9Xw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 13:41:01 -0700
IronPort-SDR: fUwow7Nz8r5EqIiDZzxxP774hx5wUkKXB3BINAew0YHSfpZVywwV2TAkymY3+qQHUFU3Y945FD
 9T3xOi1H9IXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,341,1580803200"; d="scan'208";a="241217139"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 03 Apr 2020 13:40:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 03 Apr 2020 23:40:58 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 12/17] drm/mcde: Use mode->clock instead of reverse
 calculating it from the vrefresh
Date: Fri,  3 Apr 2020 23:40:03 +0300
Message-Id: <20200403204008.14864-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: intel-gfx@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCmh0
b3RhbCp2dG90YWwqdnJlZnJlc2ggfj0gY2xvY2suIFNvIGp1c3Qgc2F5ICJjbG9jayIgd2hlbiB3
ZSBtZWFuIGl0LgoKQ2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4K
Q2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KU2lnbmVkLW9mZi1ieTogVmlsbGUg
U3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vbWNkZS9tY2RlX2RzaS5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWNkZS9t
Y2RlX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kc2kuYwppbmRleCA1MjAzMWQ4
MjZmMmMuLmMwN2E4ZTI3M2I2ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNk
ZV9kc2kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2RzaS5jCkBAIC01MzcsOCAr
NTM3LDcgQEAgc3RhdGljIHZvaWQgbWNkZV9kc2lfc2V0dXBfdmlkZW9fbW9kZShzdHJ1Y3QgbWNk
ZV9kc2kgKmQsCiAJICogcG9yY2hlcyBhbmQgc3luYy4KIAkgKi8KIAkvKiAocHMvcykgLyAocGl4
ZWxzL3MpID0gcHMvcGl4ZWxzICovCi0JcGNsayA9IERJVl9ST1VORF9VUF9VTEwoMTAwMDAwMDAw
MDAwMCwKLQkJCQkoZHJtX21vZGVfdnJlZnJlc2gobW9kZSkgKiBtb2RlLT5odG90YWwgKiBtb2Rl
LT52dG90YWwpKTsKKwlwY2xrID0gRElWX1JPVU5EX1VQX1VMTCgxMDAwMDAwMDAwMDAwLCBtb2Rl
LT5jbG9jayk7CiAJZGV2X2RiZyhkLT5kZXYsICJwaWNvc2Vjb25kcyBiZXR3ZWVuIHR3byBwaXhl
bHM6ICVsbHVcbiIsCiAJCXBjbGspOwogCi0tIAoyLjI0LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
