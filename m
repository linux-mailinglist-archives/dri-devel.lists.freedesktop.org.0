Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A1FD64AB
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 16:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF1D6E2E8;
	Mon, 14 Oct 2019 14:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866F76E499
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 14:04:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 08B0FB12D;
 Mon, 14 Oct 2019 14:04:21 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sean@poorly.run, b.zolnierkie@samsung.com,
 ajax@redhat.com, ville.syrjala@linux.intel.com, malat@debian.org,
 michel@daenzer.net
Subject: [PATCH v2 04/15] drm: Add fbconv helper module
Date: Mon, 14 Oct 2019 16:04:05 +0200
Message-Id: <20191014140416.28517-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014140416.28517-1-tzimmermann@suse.de>
References: <20191014140416.28517-1-tzimmermann@suse.de>
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
Cc: gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 corbet@lwn.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIGZiY29udiBoZWxwZXJzIGZvciBEUk0gdG8gdGhlIGJ1aWxkIGluZnJhc3RydWN0
dXJlLiBUaGUKY29uZmlndXJhdGlvbiBzeW1ib2wgaXMgRFJNX0ZCQ09OVl9IRUxQRVJTLiBEcml2
ZXJzIHNob3VsZCBzZWxlY3QKaXQgaWYgdGhleSB3aXNoIHRvIHVzZSBmYmNvbnYuCgpTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vS2NvbmZpZyAgICAgICAgICAgICB8IDEwICsrKysrKysrKysKIGRyaXZlcnMv
Z3B1L2RybS9NYWtlZmlsZSAgICAgICAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2RybV9m
YmNvbnZfaGVscGVyLmMgfCAgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiY29udl9oZWxwZXIuYwoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL0tj
b25maWcKaW5kZXggOTU5MWJkNzIwZTU2Li5lZDY4OTIwMWVjODEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9LY29uZmlnCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnCkBAIC0xNTcs
NiArMTU3LDE2IEBAIGNvbmZpZyBEUk1fRFBfQ0VDCiAJICBOb3RlOiBub3QgYWxsIGFkYXB0ZXJz
IHN1cHBvcnQgdGhpcyBmZWF0dXJlLCBhbmQgZXZlbiBmb3IgdGhvc2UKIAkgIHRoYXQgZG8gc3Vw
cG9ydCB0aGlzIHRoZXkgb2Z0ZW4gZG8gbm90IGhvb2sgdXAgdGhlIENFQyBwaW4uCiAKK2NvbmZp
ZyBEUk1fRkJDT05WX0hFTFBFUgorCXRyaXN0YXRlICJFbmFibGUgZmJkZXYgY29udmVyc2lvbiBo
ZWxwZXJzIgorCWRlcGVuZHMgb24gRFJNCisJaGVscAorCSAgUHJvdmlkZXMgaGVscGVycyBmb3Ig
cnVubmluZyBEUk0gb24gdG9wIG9mIGZiZGV2IGRyaXZlcnMuIENob29zZQorCSAgdGhpcyBvcHRp
b24gaWYgeW91J3JlIGNvbnZlcnRpbmcgYW4gZmJkZXYgZHJpdmVyIHRvIERSTS4gVGhlCisJICBo
ZWxwZXJzIHByb3ZpZGUgY29udmVyc2lvbiBmdW5jdGlvbnMgZm9yIGZiZGV2IGRhdGEgc3RydWN0
dXJlcworCSAgYW5kIGFsbG93IHRvIGJ1aWxkIGEgYmFzaWMgRFJNIGRyaXZlciBvbiB0b3Agb2Yg
dGhlIGZiZGV2CisJICBpbnRlcmZhY2VzLgorCiBjb25maWcgRFJNX1RUTQogCXRyaXN0YXRlCiAJ
ZGVwZW5kcyBvbiBEUk0gJiYgTU1VCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vTWFrZWZp
bGUgYi9kcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUKaW5kZXggOWYxYzdjNDg2Zjg4Li5hNzE3ODI0
NWQ5MzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZQorKysgYi9kcml2ZXJz
L2dwdS9kcm0vTWFrZWZpbGUKQEAgLTUyLDYgKzUyLDcgQEAgZHJtX2ttc19oZWxwZXItJChDT05G
SUdfRFJNX0ZCREVWX0VNVUxBVElPTikgKz0gZHJtX2ZiX2hlbHBlci5vCiBkcm1fa21zX2hlbHBl
ci0kKENPTkZJR19EUk1fS01TX0NNQV9IRUxQRVIpICs9IGRybV9mYl9jbWFfaGVscGVyLm8KIGRy
bV9rbXNfaGVscGVyLSQoQ09ORklHX0RSTV9EUF9BVVhfQ0hBUkRFVikgKz0gZHJtX2RwX2F1eF9k
ZXYubwogZHJtX2ttc19oZWxwZXItJChDT05GSUdfRFJNX0RQX0NFQykgKz0gZHJtX2RwX2NlYy5v
Citkcm1fa21zX2hlbHBlci0kKENPTkZJR19EUk1fRkJDT05WX0hFTFBFUikgKz0gZHJtX2ZiY29u
dl9oZWxwZXIubwogCiBvYmotJChDT05GSUdfRFJNX0tNU19IRUxQRVIpICs9IGRybV9rbXNfaGVs
cGVyLm8KIG9iai0kKENPTkZJR19EUk1fREVCVUdfU0VMRlRFU1QpICs9IHNlbGZ0ZXN0cy8KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJjb252X2hlbHBlci5jIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9mYmNvbnZfaGVscGVyLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMDAwLi4wY2I0NmQyYzk4YzMKLS0tIC9kZXYvbnVsbAorKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2ZiY29udl9oZWxwZXIuYwpAQCAtMCwwICsxIEBACisvLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
