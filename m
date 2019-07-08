Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC73961ED6
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 14:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6901B89CD8;
	Mon,  8 Jul 2019 12:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9C989CD8;
 Mon,  8 Jul 2019 12:53:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 05:53:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; d="scan'208";a="192305876"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 08 Jul 2019 05:53:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Jul 2019 15:53:25 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 00/19] drm/i915: Plane cdclk requirements and fp16 for gen4+
Date: Mon,  8 Jul 2019 15:53:06 +0300
Message-Id: <20190708125325.16576-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSBlbmQgb2YgdGhlIHNlcmllcyBpcyBqdXN0IGEgcmVwb3N0aW5nIG9mIHRoZSBmcDE2IHN0dWZm
IGZvciBnZW40Ky4KVGhlIHN0YXJ0IG9mIHRoZSBzZXJpZXMgaXMgbmV3IHN0dWZmIHRvIGFsbG93
IHBsYW5lcyB0byBkaWN0YXRlIHRoZQptaW5pbXVtIGNkY2xrLCB3aGljaCBpcyBzb21ldGltZXMg
bmVlZGVkIGZvciBkb3duc2NhbGluZyBvciBmcDE2CihhbmQgc29tZXRpbWVzIGV2ZW4gZm9yIG90
aGVyIHBpeGVsIGZvcm1hdHMpLiBUaGFua3MgdG8gdGhhdCBuZXcgY29kZQp0aGUgZnAxNiB0ZXN0
cyBzaG91bGQgbm93IHBhc3Mgb24gYnh0L2dsay4KClZpbGxlIFN5cmrDpGzDpCAoMTkpOgogIGRy
bTogQWRkIGRybV9tb2Rlc2V0X2xvY2tfYXNzZXJ0X2hlbGQoKQogIGRybS9hdG9taWMtaGVscGVy
OiBNYWtlIGNydGMgaGVscGVyIGZ1bmNzIG9wdGlvbmFsCiAgZHJtL2k5MTU6IFJlbW92ZSBwb2lu
dGxlc3MgcGxhbmVzX2NoYW5nZWQ9dHJ1ZSBhc3NpZ25tZW50CiAgZHJtL2k5MTU6IFJlcGxhY2Ug
aXNfcGxhbmFyX3l1dl9mb3JtYXQoKSB3aXRoCiAgICBkcm1fZm9ybWF0X2luZm9faXNfeXV2X3Nl
bWlwbGFuYXIoKQogIGRybS9pOTE1OiBBbGxvdyBkb3duc2NhbGUgZmFjdG9yIG9mIDwzLjAgb24g
Z2xrKyBmb3IgYWxsIGZvcm1hdHMKICBkcm0vaTkxNTogRXh0cmFjdCBpbnRlbF9tb2Rlc2V0X2Nh
bGNfY2RjbGsoKQogIGRybS9pOTE1OiBzL3BpcGVfY29uZmlnL2NydGNfc3RhdGUvIGluIGludGVs
X2NydGNfYXRvbWljX2NoZWNrKCkKICBkcm0vaTkxNTogU3RvcCB1c2luZyBkcm1fYXRvbWljX2hl
bHBlcl9jaGVja19wbGFuZXMoKQogIGRybS9pOTE1OiBBZGQgZGVidWdzIHRvIGRpc3RpbmdpdXNo
IGEgY2QyeCB1cGRhdGUgZnJvbSBhIGZ1bGwgY2RjbGsKICAgIHBsbCB1cGRhdGUKICBkcm0vaTkx
NTogTWFrZSAubW9kZXNldF9jYWxjX2NkY2xrKCkgbWFuZGF0b3J5CiAgZHJtL2k5MTU6IFJld29y
ayBnbG9iYWwgc3RhdGUgbG9ja2luZwogIGRybS9pOTE1OiBNb3ZlIGNoZWNrX2RpZ2l0YWxfcG9y
dF9jb25mbGljdHMoKSBlYXJpZXIKICBkcm0vaTkxNTogQWxsb3cgcGxhbmVzIHRvIGRlY2xhcmUg
dGhlaXIgbWluaW11bSBhY2NlcHRhYmxlIGNkY2xrCiAgZHJtL2k5MTU6IEVsaW1pbmF0ZSBza2xf
Y2hlY2tfcGlwZV9tYXhfcGl4ZWxfcmF0ZSgpCiAgZHJtL2k5MTU6IFNpbXBsaWZ5IHNrbF9tYXhf
c2NhbGUoKQogIGRybS9pOTE1OiBBZGQgc3VwcG9ydCBmb3IgaGFsZiBmbG9hdCBmcmFtZWJ1ZmZl
cnMgZm9yIHNrbCsKICBkcm0vaTkxNTogQWRkIHN1cHBvcnQgZm9yIGhhbGYgZmxvYXQgZnJhbWVi
dWZmZXJzIGZvciBnZW40KyBwcmltYXJ5CiAgICBwbGFuZXMKICBkcm0vaTkxNTogQWRkIHN1cHBv
cnQgZm9yIGhhbGYgZmxvYXQgZnJhbWVidWZmZXJzIGZvciBpdmIrIHNwcml0ZXMKICBkcm0vaTkx
NTogQWRkIHN1cHBvcnQgZm9yIGhhbGYgZmxvYXQgZnJhbWVidWZmZXJzIG9uIHNuYiBzcHJpdGVz
CgogZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMgICAgICAgICAgIHwgICAyICst
CiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2F0b21pYy5jICAgfCAgMzQgKy0K
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWljLmggICB8ICAgMyArCiAu
Li4vZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWljX3BsYW5lLmMgfCAgNDUgKy0KIC4u
Li9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hdG9taWNfcGxhbmUuaCB8ICAgNCArCiBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2F1ZGlvLmMgICAgfCAgMTAgKy0KIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY2RjbGsuYyAgICB8IDIyMSArKysrKysrLQog
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jZGNsay5oICAgIHwgICA2ICstCiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyAgfCA1MzQgKysrKysr
KysrKy0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nwcml0ZS5j
ICAgfCA0NDEgKysrKysrKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX3Nwcml0ZS5oICAgfCAgIDggKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2Lmgg
ICAgICAgICAgICAgICB8ICAxMSArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZHJ2Lmgg
ICAgICAgICAgICAgIHwgIDE0ICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9wbS5jICAg
ICAgICAgICAgICAgfCAxMTYgKy0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcG0uaCAg
ICAgICAgICAgICAgIHwgICAyIC0KIGluY2x1ZGUvZHJtL2RybV9tb2Rlc2V0X2xvY2suaCAgICAg
ICAgICAgICAgICB8ICAgOSArCiAxNiBmaWxlcyBjaGFuZ2VkLCAxMDU0IGluc2VydGlvbnMoKyks
IDQwNiBkZWxldGlvbnMoLSkKCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
