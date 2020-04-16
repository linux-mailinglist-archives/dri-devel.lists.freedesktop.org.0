Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237D81ACE4F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 19:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BB76E4BB;
	Thu, 16 Apr 2020 17:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D956E4A5;
 Thu, 16 Apr 2020 17:04:24 +0000 (UTC)
IronPort-SDR: AtwD1cv02VZT5EinOBMNs/HOInwby06hlHwlCIOpP2L4z07JXkTH74RBugRY81RXr1c55nggK2
 sFTAl8uOyR3A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 10:04:23 -0700
IronPort-SDR: CHlCpPPTn0wP84hCQFbtidgGiD3xrJB8aLRxv3YCNK+vUaNWxQe/io2+hmePQGg7C1FALNcyqo
 SKp8Y1qqAmWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,391,1580803200"; d="scan'208";a="277385993"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 16 Apr 2020 10:04:20 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 16 Apr 2020 20:04:20 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Fix page flip ioctl format check
Date: Thu, 16 Apr 2020 20:04:20 +0300
Message-Id: <20200416170420.23657-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
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
Cc: intel-gfx@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClJl
dmVydCBiYWNrIHRvIGNvbXBhcmluZyBmYi0+Zm9ybWF0LT5mb3JtYXQgaW5zdGVhZCBmYi0+Zm9y
bWF0IGZvciB0aGUKcGFnZSBmbGlwIGlvY3RsLiBUaGlzIGNoZWNrIHdhcyBvcmlnaW5hbGx5IG9u
bHkgaGVyZSB0byBkaXNhbGxvdyBwaXhlbApmb3JtYXQgY2hhbmdlcywgYnV0IHdoZW4gd2UgY2hh
bmdlZCBpdCB0byBkbyB0aGUgcG9pbnRlciBjb21wYXJpc29uCndlIHBvdGVudGlhbGx5IHN0YXJ0
ZWQgdG8gcmVqZWN0IHNvbWUgKGJ1dCBkZWZpbml0ZWx5IG5vdCBhbGwpIG1vZGlmaWVyCmNoYW5n
ZXMgYXMgd2VsbC4gSW4gZmFjdCB0aGUgY3VycmVudCBiZWhhdmlvdXIgZGVwZW5kcyBvbiB3aGV0
aGVyIHRoZQpkcml2ZXIgb3ZlcnJpZGVzIHRoZSBmb3JtYXQgaW5mbyBmb3IgYSBzcGVjaWZpYyBm
b3JtYXQrbW9kaWZpZXIgY29tYm8uCkVnLiBvbiBpOTE1IHRoaXMgbm93IHJlamVjdHMgY29tcHJl
c3Npb24gdnMuIG5vIGNvbXByZXNzaW9uIGNoYW5nZXMgYnV0CmRvZXMgbm90IHJlamVjdCBhbnkg
b3RoZXIgdGlsaW5nIGNoYW5nZXMuIFRoYXQncyBqdXN0IGluY29uc2lzdGVudApub25zZW5zZS4K
ClRoZSBtYWluIHJlYXNvbiB3ZSBoYXZlIHRvIGdvIGJhY2sgdG8gdGhlIG9sZCBiZWhhdmlvdXIg
aXMgdG8gZml4IHBhZ2UKZmxpcHBpbmcgd2l0aCBYb3JnLiBBdCBzb21lIHBvaW50IFhvcmcgZ290
IGl0cyBhdG9taWMgcmlnaHRzIHRha2VuIGF3YXkKYW5kIHNpbmNlIHRoZW4gd2UgY2FuJ3QgcGFn
ZSBmbGlwIGJldHdlZW4gY29tcHJlc3NlZCBhbmQgbm9uLWNvbXByZXNzZWQKZmJzIG9uIGk5MTUu
IEN1cnJlbnRseSB3ZSBnZXQgbm8gcGFnZSBmbGlwcGluZyBmb3IgYW55IGdhbWVzIHByZXR0eSBt
dWNoCnNpbmNlIE1lc2EgbGlrZXMgdG8gdXNlIGNvbXByZXNzZWQgYnVmZmVycy4gTm90IHN1cmUg
aG93IGNvbXBvc2l0b3JzIGFyZQp3b3JraW5nIGFyb3VuZCB0aGlzIChkb24ndCB1c2Ugb25lIG15
c2VsZikuIEkgZ3Vlc3MgdGhleSBtdXN0IGJlIGRvaW5nCnNvbWV0aGluZyB0byBnZXQgbm9uLWNv
bXByZXNzZWQgYnVmZmVycyBpbnN0ZWFkLiBFaXRoZXIgdGhhdCBvcgpzb21laG93IG5vIG9uZSBu
b3RpY2VkIHRoZSB0ZWFyaW5nIGZyb20gdGhlIGJsaXQgZmFsbGJhY2suCgpMb29raW5nIGJhY2sg
YXQgdGhlIG9yaWdpbmFsIGRpc2N1c3Npb24gb24gdGhpcyBjaGFuZ2Ugd2UgcHJldHR5IG11Y2gK
anVzdCBkaWQgaXQgaW4gdGhlIG5hbWUgb2Ygc2tpcHBpbmcgYSBmZXcgZXh0cmEgcG9pbnRlciBk
ZXJlZmVyZW5jZXMuCkhvd2V2ZXIsIEkndmUgZGVjaWRlZCBub3QgdG8gcmV2ZXJ0IHRoZSB3aG9s
ZSB0aGluZyBpbiBjYXNlIHNvbWVvbmUKaGFzIHNpbmNlIHN0YXJ0ZWQgdG8gZGVwZW5kIG9uIHRo
ZXNlIGNoYW5nZXMuIE5vbmUgb2YgdGhlIG90aGVyIGNoZWNrcwphcmUgcmVsZXZhbnQgZm9yIGk5
MTUgYW55d2F5cy4KCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCkNjOiBMYXVyZW50IFBpbmNo
YXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CkZpeGVzOiBkYmQ0ZDU3NjFl
MWYgKCJkcm06IFJlcGxhY2UgJ2Zvcm1hdC0+Zm9ybWF0JyBjb21wYXJpc29ucyB0byBqdXN0ICdm
b3JtYXQnIGNvbXBhcmlzb25zIikKU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5l
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX3BsYW5lLmMKaW5kZXggZDZhZDYwYWIwZDM4Li5mMmNhNTMxNWYyM2IgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X3BsYW5lLmMKQEAgLTExNTMsNyArMTE1Myw3IEBAIGludCBkcm1fbW9kZV9wYWdlX2ZsaXBfaW9j
dGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAlpZiAocmV0KQogCQlnb3RvIG91dDsKIAotCWlm
IChvbGRfZmItPmZvcm1hdCAhPSBmYi0+Zm9ybWF0KSB7CisJaWYgKG9sZF9mYi0+Zm9ybWF0LT5m
b3JtYXQgIT0gZmItPmZvcm1hdC0+Zm9ybWF0KSB7CiAJCURSTV9ERUJVR19LTVMoIlBhZ2UgZmxp
cCBpcyBub3QgYWxsb3dlZCB0byBjaGFuZ2UgZnJhbWUgYnVmZmVyIGZvcm1hdC5cbiIpOwogCQly
ZXQgPSAtRUlOVkFMOwogCQlnb3RvIG91dDsKLS0gCjIuMjQuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
