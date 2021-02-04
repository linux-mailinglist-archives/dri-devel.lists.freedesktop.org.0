Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1A830E9DE
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 03:04:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20326EC63;
	Thu,  4 Feb 2021 02:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941226EC63;
 Thu,  4 Feb 2021 02:04:07 +0000 (UTC)
IronPort-SDR: jfwKdJuFjSsQ0sagsLE8OTILUIMwmCF5CEO/aiqq+zvW/4ZqJjtnp9cDJN8GCNh5eGQPa2hMhR
 9i+dAecG9aig==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="160319670"
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="160319670"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 18:04:04 -0800
IronPort-SDR: UklALSy41EyEh3Lz6omN09oupx7ZFKXhxjhLLr9/x1hc2MKVAk3MzKn/e/jTv08N9/LKmkPxee
 WSwB6JpxYQCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="372718169"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 03 Feb 2021 18:04:01 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Feb 2021 04:04:00 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vblank: Avoid storing a timestamp for the same frame twice
Date: Thu,  4 Feb 2021 04:04:00 +0200
Message-Id: <20210204020400.29628-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCmRy
bV92YmxhbmtfcmVzdG9yZSgpIGV4aXN0cyBiZWNhdXNlIGNlcnRhaW4gcG93ZXIgc2F2aW5nIHN0
YXRlcwpjYW4gY2xvYmJlciB0aGUgaGFyZHdhcmUgZnJhbWUgY291bnRlci4gVGhlIHdheSBpdCBk
b2VzIHRoaXMgaXMKYnkgZ3Vlc3N0aW1hdGluZyBob3cgbWFueSBmcmFtZXMgd2VyZSBtaXNzZWQg
cHVyZWx5IGJhc2VkIG9uCnRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIGxhc3Qgc3RvcmVkIHRp
bWVzdGFtcCB2cy4gYSBuZXdseQpzYW1wbGVkIHRpbWVzdGFtcC4KCklmIHdlIHNob3VsZCBjYWxs
IHRoaXMgZnVuY3Rpb24gYmVmb3JlIGEgZnVsbCBmcmFtZSBoYXMKZWxhcHNlZCBzaW5jZSB3ZSBz
YW1wbGVkIHRoZSBsYXN0IHRpbWVzdGFtcCB3ZSB3b3VsZCBlbmQgdXAKd2l0aCBhIHBvc3NpYmx5
IHNsaWdodGx5IGRpZmZlcmVudCB0aW1lc3RhbXAgdmFsdWUgZm9yIHRoZQpzYW1lIGZyYW1lLiBD
dXJyZW50bHkgd2Ugd2lsbCBoYXBwaWx5IG92ZXJ3cml0ZSB0aGUgYWxyZWFkeQpzdG9yZWQgdGlt
ZXN0YW1wIGZvciB0aGUgZnJhbWUgd2l0aCB0aGUgbmV3IHZhbHVlLiBUaGlzCmNvdWxkIGNhdXNl
IHVzZXJzcGFjZSB0byBvYnNlcnZlIHR3byBkaWZmZXJlbnQgdGltZXN0YW1wcwpmb3IgdGhlIHNh
bWUgZnJhbWUgKGFuZCB0aGUgdGltZXN0YW1wIGNvdWxkIGV2ZW4gZ28KYmFja3dhcmRzIGRlcGVu
ZGluZyBvbiBob3cgbXVjaCBlcnJvciB3ZSBpbnRyb2R1Y2Ugd2hlbgpjb3JyZWN0aW5nIHRoZSB0
aW1lc3RhbXAgYmFzZWQgb24gdGhlIHNjYW5vdXQgcG9zaXRpb24pLgoKVG8gYXZvaWQgdGhhdCBs
ZXQncyBub3QgdXBkYXRlIHRoZSBzdG9yZWQgdGltZXN0YW1wIHVubGVzcyB3ZSdyZQphbHNvIGlu
Y3JlbWVudGluZyB0aGUgc2VxdWVuY2UgY291bnRlci4gV2UgZG8gc3RpbGwgd2FudCB0byB1cGRh
dGUKdmJsYW5rLT5sYXN0IHdpdGggdGhlIGZyZXNobHkgc2FtcGxlZCBodyBmcmFtZSBjb3VudGVy
IHZhbHVlIHNvCnRoYXQgc3Vic2VxdWVudCB2YmxhbmsgaXJxcy9xdWVyaWVzIGNhbiBhY3R1YWxs
eSB1c2UgdGhlIGh3IGZyYW1lCmNvdW50ZXIgdG8gZGV0ZXJtaW5lIGhvdyBtYW55IGZyYW1lcyBo
YXZlIGVsYXBzZWQuCgpDYzogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlh
bkBpbnRlbC5jb20+CkNjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+CkNj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMgfCAxMSArKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFu
ay5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwppbmRleCA4OTMxNjVlZWRkZjMuLmUx
MjdhN2RiMjA4OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCkBAIC0xNzYsNiArMTc2LDE3IEBAIHN0YXRp
YyB2b2lkIHN0b3JlX3ZibGFuayhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQg
cGlwZSwKIAogCXZibGFuay0+bGFzdCA9IGxhc3Q7CiAKKwkvKgorCSAqIGRybV92YmxhbmtfcmVz
dG9yZSgpIHdhbnRzIHRvIGFsd2F5cyB1cGRhdGUKKwkgKiB2YmxhbmstPmxhc3Qgc2luY2Ugd2Ug
Y2FuJ3QgdHJ1c3QgdGhlIGZyYW1lIGNvdW50ZXIKKwkgKiBhY3Jvc3MgcG93ZXIgc2F2aW5nIHN0
YXRlcy4gQnV0IHdlIGRvbid0IHdhbnQgdG8gYWx0ZXIKKwkgKiB0aGUgc3RvcmVkIHRpbWVzdGFt
cCBmb3IgdGhlIHNhbWUgZnJhbWUgbnVtYmVyIHNpbmNlCisJICogdGhhdCB3b3VsZCBjYXVzZSB1
c2Vyc3BhY2UgdG8gcG90ZW50aWFsbHkgb2JzZXJ2ZSB0d28KKwkgKiBkaWZmZXJlbnQgdGltZXN0
YW1wcyBmb3IgdGhlIHNhbWUgZnJhbWUuCisJICovCisJaWYgKHZibGFua19jb3VudF9pbmMgPT0g
MCkKKwkJcmV0dXJuOworCiAJd3JpdGVfc2VxbG9jaygmdmJsYW5rLT5zZXFsb2NrKTsKIAl2Ymxh
bmstPnRpbWUgPSB0X3ZibGFuazsKIAlhdG9taWM2NF9hZGQodmJsYW5rX2NvdW50X2luYywgJnZi
bGFuay0+Y291bnQpOwotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
