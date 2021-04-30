Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EB636F8FB
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 13:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72AA6E245;
	Fri, 30 Apr 2021 11:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90F36E12C;
 Fri, 30 Apr 2021 11:14:08 +0000 (UTC)
IronPort-SDR: 1uI8F4QUlwmdHMEXNK/VKB2Fyi1NN4DgtxGix/ytsK2OPJS5a9xR42/RZJtywg3+YKmgh/dMtl
 77y0/FWWSI2g==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="282595328"
X-IronPort-AV: E=Sophos;i="5.82,262,1613462400"; d="scan'208";a="282595328"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2021 04:14:08 -0700
IronPort-SDR: E9F+EyyZrhuG0VPRYdTj/zR0aWT+yu0b4dHI+kqMAIoPa9ZHXr27VGBwhSzttgT1vCwdKSLx4x
 TO8rnJAnbRBg==
X-IronPort-AV: E=Sophos;i="5.82,262,1613462400"; d="scan'208";a="527596854"
Received: from redickin-mobl2.ger.corp.intel.com (HELO [10.213.208.173])
 ([10.213.208.173])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2021 04:14:07 -0700
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/overlay: Fix active retire
 callback alignment
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20210429083530.849546-1-tvrtko.ursulin@linux.intel.com>
 <YIrfb9jvAn/FTt09@intel.com> <YIrtYaoWV/eyD8oA@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <2d6c58ec-99b7-5814-32b8-2f6fa698b522@linux.intel.com>
Date: Fri, 30 Apr 2021 12:14:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIrtYaoWV/eyD8oA@intel.com>
Content-Language: en-US
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
Cc: Intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDI5LzA0LzIwMjEgMTg6MzEsIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPiBPbiBUaHUsIEFw
ciAyOSwgMjAyMSBhdCAwNzozMTo0M1BNICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4+
IE9uIFRodSwgQXByIDI5LCAyMDIxIGF0IDA5OjM1OjI5QU0gKzAxMDAsIFR2cnRrbyBVcnN1bGlu
IHdyb3RlOgo+Pj4gRnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNv
bT4KPj4+Cj4+PiBfX2k5MTVfYWN0aXZlX2NhbGwgYW5ub3RhdGlvbiBpcyByZXF1aXJlZCBvbiB0
aGUgcmV0aXJlIGNhbGxiYWNrIHRvIGVuc3VyZQo+Pj4gY29ycmVjdCBmdW5jdGlvbiBhbGlnbm1l
bnQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGlu
QGludGVsLmNvbT4KPj4+IEZpeGVzOiBhMjFjZThhZDEyZDIgKCJkcm0vaTkxNS9vdmVybGF5OiBT
d2l0Y2ggdG8gdXNpbmcgaTkxNV9hY3RpdmUgdHJhY2tpbmciKQo+Pj4gQ2M6IENocmlzIFdpbHNv
biA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+Pj4gQ2M6IE1hdHRoZXcgQXVsZCA8bWF0dGhl
dy5hdWxkQGludGVsLmNvbT4KPj4+IC0tLQo+Pj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX292ZXJsYXkuYyB8IDIgKy0KPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfb3ZlcmxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9vdmVybGF5LmMKPj4+IGluZGV4IGZmZmJkZTQyNTZkYi4uNDI4ODE5YmExOGRk
IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9vdmVy
bGF5LmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfb3Zlcmxh
eS5jCj4+PiBAQCAtMzgzLDcgKzM4Myw3IEBAIHN0YXRpYyB2b2lkIGludGVsX292ZXJsYXlfb2Zm
X3RhaWwoc3RydWN0IGludGVsX292ZXJsYXkgKm92ZXJsYXkpCj4+PiAgIAkJaTgzMF9vdmVybGF5
X2Nsb2NrX2dhdGluZyhkZXZfcHJpdiwgdHJ1ZSk7Cj4+PiAgIH0KPj4+ICAgCj4+PiAtc3RhdGlj
IHZvaWQKPj4+ICtfX2k5MTVfYWN0aXZlX2NhbGwgc3RhdGljIHZvaWQKPj4KPj4gQW0gSSBibGlu
ZCBvciBhcmUgd2UganVzdCBwYWNraW5nIGZsYWcgYml0cyBpbnRvIGEgcG9pbnRlciwgcGFzc2lu
Zwo+PiB0aGF0IHRvIGEgZnVuY3Rpb24sIGFuZCB0aGVuIGltbWVkaWF0ZWx5IHVucGFjayB0aGUg
Yml0cyBhZ2FpbiBpbgo+PiBzYWlkIGZ1bmN0aW9uPyBXaHkgbm90IGp1c3QgcGFzcyB0aGUgZmxh
Z3MgZXhwbGljaXRseT8KPj4KPj4gTG9va3MgbGlrZSB5b3UgbWlzc2VkIGF1dG9fcmV0aXJlKCk/
Cj4gCj4gQWgsIGp1c3Qgc2F3IHRoZSBvdGhlciBwYXRjaCBmcm9tIFN0w6lwaGFuZS4KPiAKPiBG
b3IgdGhlIHNlcmllczoKPiBSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4KClRoYW5rcyBWaWxsZSwgcHVzaGVkLgoKUmVnYXJkcywKClR2
cnRrbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
