Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 000C4165001
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 21:36:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3306E864;
	Wed, 19 Feb 2020 20:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8EA46EC9F;
 Wed, 19 Feb 2020 20:35:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2020 12:35:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,461,1574150400"; d="scan'208";a="283208300"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 19 Feb 2020 12:35:50 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Feb 2020 22:35:50 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/12] drm/exynos: Use mode->clock instead of reverse
 calculating it from the vrefresh
Date: Wed, 19 Feb 2020 22:35:34 +0200
Message-Id: <20200219203544.31013-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
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
Cc: Kyungmin Park <kyungmin.park@samsung.com>, intel-gfx@lists.freedesktop.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCmh0
b3RhbCp2dG90YWwqdnJlZnJlc2ggfj0gY2xvY2suIFNvIGp1c3QgdXNlIHNheSAiY2xvY2siIHdo
ZW4gd2UgbWVhbiBpdC4KCkNjOiBJbmtpIERhZSA8aW5raS5kYWVAc2Ftc3VuZy5jb20+CkNjOiBK
b29ueW91bmcgU2hpbSA8ankwOTIyLnNoaW1Ac2Ftc3VuZy5jb20+CkNjOiBTZXVuZy1Xb28gS2lt
IDxzdzAzMTIua2ltQHNhbXN1bmcuY29tPgpDYzogS3l1bmdtaW4gUGFyayA8a3l1bmdtaW4ucGFy
a0BzYW1zdW5nLmNvbT4KU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vczdf
ZHJtX2RlY29uLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vczdfZHJt
X2RlY29uLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vczdfZHJtX2RlY29uLmMKaW5k
ZXggZmY1OWM2NDFmYTgwLi5lN2I1ODA5N2NjZGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zN19kcm1fZGVjb24uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L2V4eW5vczdfZHJtX2RlY29uLmMKQEAgLTEzOSw3ICsxMzksNyBAQCBzdGF0aWMgdm9pZCBkZWNv
bl9jdHhfcmVtb3ZlKHN0cnVjdCBkZWNvbl9jb250ZXh0ICpjdHgpCiBzdGF0aWMgdTMyIGRlY29u
X2NhbGNfY2xrZGl2KHN0cnVjdCBkZWNvbl9jb250ZXh0ICpjdHgsCiAJCWNvbnN0IHN0cnVjdCBk
cm1fZGlzcGxheV9tb2RlICptb2RlKQogewotCXVuc2lnbmVkIGxvbmcgaWRlYWxfY2xrID0gbW9k
ZS0+aHRvdGFsICogbW9kZS0+dnRvdGFsICogbW9kZS0+dnJlZnJlc2g7CisJdW5zaWduZWQgbG9u
ZyBpZGVhbF9jbGsgPSBtb2RlLT5jbG9jazsKIAl1MzIgY2xrZGl2OwogCiAJLyogRmluZCB0aGUg
Y2xvY2sgZGl2aWRlciB2YWx1ZSB0aGF0IGdldHMgdXMgY2xvc2VzdCB0byBpZGVhbF9jbGsgKi8K
LS0gCjIuMjQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
