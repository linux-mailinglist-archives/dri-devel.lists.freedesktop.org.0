Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA9B17E14E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 14:36:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC14789690;
	Mon,  9 Mar 2020 13:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7057A89690
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 13:36:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 06:36:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,533,1574150400"; d="scan'208";a="230925827"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 09 Mar 2020 06:36:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 09 Mar 2020 15:36:44 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 01/33] drm/panel-novatek-nt35510: Fix dotclock
Date: Mon,  9 Mar 2020 15:36:44 +0200
Message-Id: <20200309133644.32385-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302203452.17977-2-ville.syrjala@linux.intel.com>
References: <20200302203452.17977-2-ville.syrjala@linux.intel.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSBkb3RjbG9jayBpcyB0aHJlZSBvcmRlcnMgb2YgbWFnbml0dWRlIG91dC4gRml4IGl0LgoKdjI6
IEp1c3Qgc2V0IGl0IHRvIDIwTUh6IChMaW51cykKCkNjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53
YWxsZWlqQGxpbmFyby5vcmc+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClNp
Z25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLW5vdmF0ZWstbnQzNTUxMC5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLW5vdmF0ZWstbnQzNTUxMC5jIGIv
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLW5vdmF0ZWstbnQzNTUxMC5jCmluZGV4IGI0YzAx
NDEyNjc4MS4uNGE4ZmE5MDhhMmNmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtbm92YXRlay1udDM1NTEwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LW5vdmF0ZWstbnQzNTUxMC5jCkBAIC0xMDE5LDcgKzEwMTksNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG50MzU1MTBfY29uZmlnIG50MzU1MTBfaHlkaXNfaHZhNDB3djEgPSB7CiAJICovCiAJLm1v
ZGUgPSB7CiAJCS8qIFRoZSBpbnRlcm5hbCBwaXhlbCBjbG9jayBvZiB0aGUgTlQzNTUxMCBpcyAy
MCBNSHogKi8KLQkJLmNsb2NrID0gMjAwMDAwMDAsCisJCS5jbG9jayA9IDIwMDAwLAogCQkuaGRp
c3BsYXkgPSA0ODAsCiAJCS5oc3luY19zdGFydCA9IDQ4MCArIDIsIC8qIEhGUCA9IDIgKi8KIAkJ
LmhzeW5jX2VuZCA9IDQ4MCArIDIgKyAwLCAvKiBIU3luYyA9IDAgKi8KLS0gCjIuMjQuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
