Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 691CF1CD92
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 19:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4D58935A;
	Tue, 14 May 2019 17:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5025A89359;
 Tue, 14 May 2019 17:10:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 May 2019 10:10:11 -0700
X-ExtLoop1: 1
Received: from linuxpresi1-desktop.iind.intel.com ([10.223.74.121])
 by fmsmga005.fm.intel.com with ESMTP; 14 May 2019 10:10:07 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [v10 12/12] drm/i915: Add state readout for DRM infoframe
Date: Tue, 14 May 2019 23:06:34 +0530
Message-Id: <1557855394-12214-13-git-send-email-uma.shankar@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557855394-12214-1-git-send-email-uma.shankar@intel.com>
References: <1557855394-12214-1-git-send-email-uma.shankar@intel.com>
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
bnRlbF9oZG1pX2luaXQuCgpTaWduZWQtb2ZmLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJA
aW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2RkaS5jICAgICB8IDQg
KysrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGlzcGxheS5jIHwgMSArCiAyIGZpbGVz
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2ludGVsX2RkaS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGRpLmMKaW5kZXgg
MGFmNDdmMy4uZjU3NDMxNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxf
ZGRpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGRpLmMKQEAgLTM4MzQsNiAr
MzgzNCwxMCBAQCB2b2lkIGludGVsX2RkaV9nZXRfY29uZmlnKHN0cnVjdCBpbnRlbF9lbmNvZGVy
ICplbmNvZGVyLAogCWludGVsX3JlYWRfaW5mb2ZyYW1lKGVuY29kZXIsIHBpcGVfY29uZmlnLAog
CQkJICAgICBIRE1JX0lORk9GUkFNRV9UWVBFX1ZFTkRPUiwKIAkJCSAgICAgJnBpcGVfY29uZmln
LT5pbmZvZnJhbWVzLmhkbWkpOworCWlmICgoSU5URUxfR0VOKGRldl9wcml2KSA+PSAxMCB8fCBJ
U19HRU1JTklMQUtFKGRldl9wcml2KSkpCisJCWludGVsX3JlYWRfaW5mb2ZyYW1lKGVuY29kZXIs
IHBpcGVfY29uZmlnLAorCQkJCSAgICAgSERNSV9JTkZPRlJBTUVfVFlQRV9EUk0sCisJCQkJICAg
ICAmcGlwZV9jb25maWctPmluZm9mcmFtZXMuZHJtKTsKIH0KIAogc3RhdGljIGVudW0gaW50ZWxf
b3V0cHV0X3R5cGUKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2Rpc3Bs
YXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2Rpc3BsYXkuYwppbmRleCBlMzViYThk
Li5jODliMjE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9kaXNwbGF5
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGlzcGxheS5jCkBAIC0xMjI3NCw2
ICsxMjI3NCw3IEBAIHN0YXRpYyBib29sIGZhc3Rib290X2VuYWJsZWQoc3RydWN0IGRybV9pOTE1
X3ByaXZhdGUgKmRldl9wcml2KQogCVBJUEVfQ09ORl9DSEVDS19JTkZPRlJBTUUoYXZpKTsKIAlQ
SVBFX0NPTkZfQ0hFQ0tfSU5GT0ZSQU1FKHNwZCk7CiAJUElQRV9DT05GX0NIRUNLX0lORk9GUkFN
RShoZG1pKTsKKwlQSVBFX0NPTkZfQ0hFQ0tfSU5GT0ZSQU1FKGRybSk7CiAKICN1bmRlZiBQSVBF
X0NPTkZfQ0hFQ0tfWAogI3VuZGVmIFBJUEVfQ09ORl9DSEVDS19JCi0tIAoxLjkuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
