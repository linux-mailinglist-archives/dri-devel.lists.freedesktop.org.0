Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0392120883
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 15:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E093189755;
	Thu, 16 May 2019 13:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C4C89755;
 Thu, 16 May 2019 13:43:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 May 2019 06:43:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,476,1549958400"; d="scan'208";a="172354193"
Received: from linuxpresi1-desktop.iind.intel.com ([10.223.74.121])
 by fmsmga002.fm.intel.com with ESMTP; 16 May 2019 06:43:47 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [v11 12/12] drm/i915: Add state readout for DRM infoframe
Date: Thu, 16 May 2019 19:40:17 +0530
Message-Id: <1558015817-12025-13-git-send-email-uma.shankar@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1558015817-12025-1-git-send-email-uma.shankar@intel.com>
References: <1558015817-12025-1-git-send-email-uma.shankar@intel.com>
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
Cc: dcastagna@chromium.org, jonas@kwiboo.se, emil.l.velikov@gmail.com,
 Uma Shankar <uma.shankar@intel.com>, seanpaul@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkZWQgc3RhdGUgcmVhZG91dCBmb3IgRFJNIGluZm9mcmFtZSBhbmQgZW5hYmxlZApzdGF0ZSB2
YWxpZGF0aW9uIGZvciBEUk0gaW5mb2ZyYW1lLgoKdjI6IEFkZHJlc3NlZCBWaWxsZSdzIHJldmll
dyBjb21tZW50cyBhbmQgZHJvcHBlZCB0aGUKdW51c2VkIGRybSBpbmZvZnJhbWUgcmVhZCBhdCBp
bnRlbF9oZG1pX2luaXQuCgp2MzogUmVtb3ZlZCBhIHJlZHVuZGFudCBwbGF0Zm9ybSBjaGVjayBh
cyBwZXIgVmlsbGUncwpjb21tZW50LgoKU2lnbmVkLW9mZi1ieTogVW1hIFNoYW5rYXIgPHVtYS5z
aGFua2FyQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9kZGkuYyAg
ICAgfCAzICsrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGlzcGxheS5jIHwgMSArCiAy
IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2ludGVsX2RkaS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGRpLmMK
aW5kZXggMGFmNDdmMy4uYzc4OWRlOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
aW50ZWxfZGRpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGRpLmMKQEAgLTM4
MzQsNiArMzgzNCw5IEBAIHZvaWQgaW50ZWxfZGRpX2dldF9jb25maWcoc3RydWN0IGludGVsX2Vu
Y29kZXIgKmVuY29kZXIsCiAJaW50ZWxfcmVhZF9pbmZvZnJhbWUoZW5jb2RlciwgcGlwZV9jb25m
aWcsCiAJCQkgICAgIEhETUlfSU5GT0ZSQU1FX1RZUEVfVkVORE9SLAogCQkJICAgICAmcGlwZV9j
b25maWctPmluZm9mcmFtZXMuaGRtaSk7CisJaW50ZWxfcmVhZF9pbmZvZnJhbWUoZW5jb2Rlciwg
cGlwZV9jb25maWcsCisJCQkgICAgIEhETUlfSU5GT0ZSQU1FX1RZUEVfRFJNLAorCQkJICAgICAm
cGlwZV9jb25maWctPmluZm9mcmFtZXMuZHJtKTsKIH0KIAogc3RhdGljIGVudW0gaW50ZWxfb3V0
cHV0X3R5cGUKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2Rpc3BsYXku
YyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2Rpc3BsYXkuYwppbmRleCBlMzViYThkLi5j
ODliMjE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9kaXNwbGF5LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGlzcGxheS5jCkBAIC0xMjI3NCw2ICsx
MjI3NCw3IEBAIHN0YXRpYyBib29sIGZhc3Rib290X2VuYWJsZWQoc3RydWN0IGRybV9pOTE1X3By
aXZhdGUgKmRldl9wcml2KQogCVBJUEVfQ09ORl9DSEVDS19JTkZPRlJBTUUoYXZpKTsKIAlQSVBF
X0NPTkZfQ0hFQ0tfSU5GT0ZSQU1FKHNwZCk7CiAJUElQRV9DT05GX0NIRUNLX0lORk9GUkFNRSho
ZG1pKTsKKwlQSVBFX0NPTkZfQ0hFQ0tfSU5GT0ZSQU1FKGRybSk7CiAKICN1bmRlZiBQSVBFX0NP
TkZfQ0hFQ0tfWAogI3VuZGVmIFBJUEVfQ09ORl9DSEVDS19JCi0tIAoxLjkuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
