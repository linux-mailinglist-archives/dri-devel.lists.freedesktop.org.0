Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF03347C9D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:31:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC0E6EC7F;
	Wed, 24 Mar 2021 15:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8654C6EA40;
 Wed, 24 Mar 2021 15:30:59 +0000 (UTC)
IronPort-SDR: K/5nYLTiPqCVGoJKY4JeMc6cTm/NbLw/PRdqC3NpX3KmhSVtWdB6c2i5WIjywi4oAjM7ZrvJvk
 +Hkwb4BsCZ0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="275847573"
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="275847573"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 08:30:38 -0700
IronPort-SDR: /4dqq/0JWisBWvhTbTEBIBwFyl3ZwxDSlbNQvn9KHdRvSPPQs9Sb14vUi+jgB7se4K1pbShwF/
 LGKAbJDldGYw==
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="415534424"
Received: from hcarliss-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.54.166])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 08:30:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 Martin Sebor <msebor@gcc.gnu.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 10/11] drm/i915: avoid stringop-overread warning on
 pri_latency
In-Reply-To: <20210322160253.4032422-11-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-11-arnd@kernel.org>
Date: Wed, 24 Mar 2021 17:30:24 +0200
Message-ID: <874kh04lin.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 linux-scsi@vger.kernel.org, x86@kernel.org,
 James Smart <james.smart@broadcom.com>, tboot-devel@lists.sourceforge.net,
 Kalle Valo <kvalo@codeaurora.org>, ath11k@lists.infradead.org,
 Serge Hallyn <serge@hallyn.com>, Arnd Bergmann <arnd@arndb.de>, "James
 E.J. Bottomley" <jejb@linux.ibm.com>, Ning Sun <ning.sun@intel.com>,
 Anders Larsen <al@alarsen.net>,
 =?utf-8?Q?Jos=C3=A9?= Roberto de Souza <jose.souza@intel.com>,
 cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Aditya Swarup <aditya.swarup@intel.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-security-module@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, Simon Kelley <simon@thekelleys.org.uk>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMiBNYXIgMjAyMSwgQXJuZCBCZXJnbWFubiA8YXJuZEBrZXJuZWwub3JnPiB3cm90
ZToKPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+Cj4gZ2NjLTExIHdhcm5z
IGFib3V0IHdoYXQgYXBwZWFycyB0byBiZSBhbiBvdXQtb2YtcmFuZ2UgYXJyYXkgYWNjZXNzOgo+
Cj4gSW4gZnVuY3Rpb24g4oCYc25iX3dtX2xhdGVuY3lfcXVpcmvigJksCj4gICAgIGlubGluZWQg
ZnJvbSDigJhpbGtfc2V0dXBfd21fbGF0ZW5jeeKAmSBhdCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9p
bnRlbF9wbS5jOjMxMDg6MzoKPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9wbS5jOjMwNTc6
OTogZXJyb3I6IOKAmGludGVsX3ByaW50X3dtX2xhdGVuY3nigJkgcmVhZGluZyAxNiBieXRlcyBm
cm9tIGEgcmVnaW9uIG9mIHNpemUgMTAgWy1XZXJyb3I9c3RyaW5nb3Atb3ZlcnJlYWRdCj4gIDMw
NTcgfCAgICAgICAgIGludGVsX3ByaW50X3dtX2xhdGVuY3koZGV2X3ByaXYsICJQcmltYXJ5Iiwg
ZGV2X3ByaXYtPndtLnByaV9sYXRlbmN5KTsKPiAgICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
Cj4gZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcG0uYzogSW4gZnVuY3Rpb24g4oCYaWxrX3Nl
dHVwX3dtX2xhdGVuY3nigJk6Cj4gZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcG0uYzozMDU3
Ojk6IG5vdGU6IHJlZmVyZW5jaW5nIGFyZ3VtZW50IDMgb2YgdHlwZSDigJhjb25zdCB1MTYgKuKA
mSB7YWthIOKAmGNvbnN0IHNob3J0IHVuc2lnbmVkIGludCAq4oCZfQo+IGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2ludGVsX3BtLmM6Mjk5NDoxMzogbm90ZTogaW4gYSBjYWxsIHRvIGZ1bmN0aW9uIOKA
mGludGVsX3ByaW50X3dtX2xhdGVuY3nigJkKPiAgMjk5NCB8IHN0YXRpYyB2b2lkIGludGVsX3By
aW50X3dtX2xhdGVuY3koc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2LAo+ICAgICAg
IHwgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+Cj4gTXkgZ3Vlc3MgaXMgdGhh
dCB0aGlzIGNvZGUgaXMgYWN0dWFsbHkgc2FmZSBiZWNhdXNlIHRoZSBzaXplIG9mIHRoZQo+IGFy
cmF5IGRlcGVuZHMgb24gdGhlIGhhcmR3YXJlIGdlbmVyYXRpb24sIGFuZCB0aGUgZnVuY3Rpb24g
Y2hlY2tzIGZvcgo+IHRoYXQsIGJ1dCBhdCB0aGUgc2FtZSB0aW1lIEkgd291bGQgbm90IGV4cGVj
dCB0aGUgY29tcGlsZXIgdG8gd29yayBpdAo+IG91dCBjb3JyZWN0bHksIGFuZCB0aGUgY29kZSBz
ZWVtcyBhIGxpdHRsZSBmcmFnaWxlIHdpdGggcmVnYXJkcyB0bwo+IGZ1dHVyZSBjaGFuZ2VzLiBT
aW1wbHkgaW5jcmVhc2luZyB0aGUgc2l6ZSBvZiB0aGUgYXJyYXkgc2hvdWxkIGhlbHAuCgpBZ3Jl
ZWQsIEkgZG9uJ3QgdGhpbmsgdGhlcmUncyBhbiBpc3N1ZSwgYnV0IHRoZSBjb2RlIGNvdWxkIHVz
ZSBhIGJ1bmNoCm9mIGltcHJvdmVtZW50cy4KCkxpa2UsIHdlIGhhdmUgaW50ZWxfcHJpbnRfd21f
bGF0ZW5jeSgpIGZvciBkZWJ1ZyBsb2dnaW5nIGFuZAp3bV9sYXRlbmN5X3Nob3coKSBmb3IgZGVi
dWdmcywgYW5kIHRoZXJlJ3MgYSBidW5jaCBvZiBkdXBsaWNhdGlvbiBhbmQKdWdoLgoKQnV0IHRo
aXMgc2VlbXMgbGlrZSB0aGUgZWFzaWVzdCBmaXggZm9yIHRoZSB3YXJuaW5nLgoKUmV2aWV3ZWQt
Ynk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+CgoKPiBTaWduZWQtb2ZmLWJ5
OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9pOTE1X2Rydi5oIHwgNiArKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaAo+IGluZGV4IDI2
ZDY5ZDA2YWE2ZC4uMzU2NzYwMmUwYTM1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfZHJ2LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oCj4g
QEAgLTEwOTUsMTEgKzEwOTUsMTEgQEAgc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgewo+ICAJCSAq
IGluIDAuNXVzIHVuaXRzIGZvciBXTTErLgo+ICAJCSAqLwo+ICAJCS8qIHByaW1hcnkgKi8KPiAt
CQl1MTYgcHJpX2xhdGVuY3lbNV07Cj4gKwkJdTE2IHByaV9sYXRlbmN5WzhdOwo+ICAJCS8qIHNw
cml0ZSAqLwo+IC0JCXUxNiBzcHJfbGF0ZW5jeVs1XTsKPiArCQl1MTYgc3ByX2xhdGVuY3lbOF07
Cj4gIAkJLyogY3Vyc29yICovCj4gLQkJdTE2IGN1cl9sYXRlbmN5WzVdOwo+ICsJCXUxNiBjdXJf
bGF0ZW5jeVs4XTsKPiAgCQkvKgo+ICAJCSAqIFJhdyB3YXRlcm1hcmsgbWVtb3J5IGxhdGVuY3kg
dmFsdWVzCj4gIAkJICogZm9yIFNLTCBmb3IgYWxsIDggbGV2ZWxzCgotLSAKSmFuaSBOaWt1bGEs
IEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
