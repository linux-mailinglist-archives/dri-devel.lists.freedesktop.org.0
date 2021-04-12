Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA05D35CA77
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 17:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB1F899DE;
	Mon, 12 Apr 2021 15:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58832899DE
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 15:51:23 +0000 (UTC)
IronPort-SDR: T2KucDDpaye+wdZpUTbwGv9sm95YIPrBipQQ7PxOleaN0QkJ0aZ9DlrPnzpC2GiPibiwJAN/Z+
 trCsbYKTZSCQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="279522942"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="279522942"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 08:50:04 -0700
IronPort-SDR: NE4xgwDnft3pCVCkrCAyD+EedufpuzlEleEs9BADzAzx1RMxCBDtf2zQ7V6DAlFZsf5aCf0Z7G
 y6t4pMu7EENw==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="423855607"
Received: from sarveshw-mobl.gar.corp.intel.com ([10.249.254.205])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 08:50:02 -0700
Message-ID: <fc54ec361eb3456b90bd4ef2f8151643dd6100c4.camel@linux.intel.com>
Subject: Re: [RFC PATCH] drm/ttm: Simplify the delayed destroy locking
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Date: Mon, 12 Apr 2021 17:49:50 +0200
In-Reply-To: <YHRqr2PhPvSZeq19@phenom.ffwll.local>
References: <20210412131740.10257-1-thomas.hellstrom@linux.intel.com>
 <cfa22b90-575d-c87e-a993-5ed13cea0f02@amd.com>
 <715d7cbd-264c-9422-e173-c57266800c5f@linux.intel.com>
 <4d8d0ccb-c635-acd7-c6e9-6c11a9b9409f@amd.com>
 <YHRqr2PhPvSZeq19@phenom.ffwll.local>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIxLTA0LTEyIGF0IDE3OjQzICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+
IE9uIE1vbiwgQXByIDEyLCAyMDIxIGF0IDA0OjIxOjM3UE0gKzAyMDAsIENocmlzdGlhbiBLw7Zu
aWcgd3JvdGU6Cj4gPiAKPiA+IAo+ID4gQW0gMTIuMDQuMjEgdW0gMTY6MTYgc2NocmllYiBUaG9t
YXMgSGVsbHN0csO2bToKPiA+ID4gSGksIENocmlzdGlhbiwKPiA+ID4gCj4gPiA+IE9uIDQvMTIv
MjEgNDowMSBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiA+ID4gPiBIaSBUaG9tYXMsCj4g
PiA+ID4gCj4gPiA+ID4gd2VsbCBpbiBnZW5lcmFsIGEgZ29vZCBpZGVhLCBidXQgSSdtIHdvcmtp
bmcgb24gYSBkaWZmZXJlbnQKPiA+ID4gPiBwbGFuIGZvcgo+ID4gPiA+IGEgd2hpbGUgbm93Lgo+
ID4gPiA+IAo+ID4gPiA+IE15IGlkZWEgaGVyZSBpcyB0aGF0IGluc3RlYWQgb2YgdGhlIEJPIHRo
ZSByZXNvdXJjZSBvYmplY3QgaXMKPiA+ID4gPiBrZXB0Cj4gPiA+ID4gb24gYSBkb3VibGUgbGlu
a2VkIGxydSBsaXN0Lgo+ID4gPiA+IAo+ID4gPiA+IFRoZSByZXNvdXJjZSBvYmplY3RzIHRoZW4g
aGF2ZSBhIHBvaW50ZXIgdG8gZWl0aGVyIHRoZSBCTyBvciBhCj4gPiA+ID4gZmVuY2UKPiA+ID4g
PiBvYmplY3QuCj4gPiA+ID4gCj4gPiA+ID4gV2hlbiBpdCBpcyBhIGZlbmNlIG9iamVjdCB3ZSBj
YW4ganVzdCBncmFiIGEgcmVmZXJlbmNlIHRvIGl0Cj4gPiA+ID4gYW5kCj4gPiA+ID4gd2FpdCBm
b3IgaXQgdG8gY29tcGxldGUuCj4gPiA+ID4gCj4gPiA+ID4gSWYgaXQgaXMgYSBCTyB3ZSBldmlj
dCBpdCB0aGUgc2FtZSB3YXkgd2UgY3VycmVudGx5IGRvLgo+ID4gPiA+IAo+ID4gPiA+IFRoaXMg
YWxsb3dzIHRvIHJlbW92ZSBib3RoIHRoZSBkZWxheWVkIGRlbGV0ZSwKPiA+ID4gPiBpbmRpdmlk
dWFsaXphdGlvbiBvZgo+ID4gPiA+IEJPcywgZ2hvc3Qgb2JqZWN0cyBldGMuLi4KPiA+ID4gCj4g
PiA+IEhtbSwgb2suIFNvIGluIHRoYXQgY2FzZSwgd2hhdCB3b3VsZCB0cmlnZ2VyIHRoZSBmaW5h
bCByZWxlYXNlIG9mCj4gPiA+IHRoZQo+ID4gPiBidWZmZXIgb2JqZWN0IGluIHRoZSBhYnNlbmNl
IG9mIGEgZGVsYXllZCBkZWxldGUgbGlzdD8gV291bGQgd2UKPiA+ID4gdXNlIGEKPiA+ID4gZmVu
Y2UgY2FsbGJhY2sgZm9yIHRoYXQ/Cj4gPiAKPiA+IEtleSBwb2ludCBpcyB5b3UgZG9uJ3QgbmVl
ZCBhbnkgZmluYWwgcmVsZWFzZSBvZiB0aGUgQk8gYW55IG1vcmUuCj4gPiBXaGVuIHRoZQo+ID4g
Qk9zIHJlZmVyZW5jZSBjb3VudCBiZWNvbWVzIHplcm8gaXQgY2FuIGJlIGRlc3RydWN0ZWQgaW1t
ZWRpYXRlbHkuCj4gPiAKPiA+IE9ubHkgdGhlIHJlc291cmNlIG9iamVjdCBpcyBrZXB0IGFyb3Vu
ZCBhbmQgcHJvdGVjdGVkIGJ5IGEgZmVuY2UKPiA+IHVudGlsIGl0Cj4gPiBjYW4gYmUgcmVsZWFz
ZWQgZmluYWxseS4KPiAKPiBJIHdhcyByZWFkaW5nIGRtYV9yZXN2IGhlcmUgZm9yIGEgc2Vjb25k
LCBhbmQgd29uZGVyZWQgaG93IHdlIGZpZ3VyZQo+IG91dAo+IHRoZSByZWZjb3VudGluZyBmb3Ig
dGhhdC4gQnV0IHNpbmNlIHlvdSBhaW0gZm9yIGEgZmVuY2UsIHRoYXQncwo+IHJlZmNvdW50ZWQs
wqAKCkhtbSwgR29vZCBwb2ludC4gV2hhdCBhYm91dCBvYmplY3RzIHdpdGggbXVsdGlwbGUgc2hh
cmVkIGZlbmNlcz8KCi9UaG9tYXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
