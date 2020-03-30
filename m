Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F2D19829F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 19:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257756E08E;
	Mon, 30 Mar 2020 17:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C5C6E08E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 17:44:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 21E27296719
Subject: Re: [PATCHv7 2/6] drm/core: Add drm_afbc_framebuffer and a
 corresponding helper
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200311145541.29186-1-andrzej.p@collabora.com>
 <20200311145541.29186-3-andrzej.p@collabora.com>
 <CAKMK7uEx4c+9wELxnEjtRentt=L8w6wbr7YHX5No_2PUcB_+YQ@mail.gmail.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <785e44e9-f77f-1464-786c-e28b12b9fa4b@collabora.com>
Date: Mon, 30 Mar 2020 19:44:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEx4c+9wELxnEjtRentt=L8w6wbr7YHX5No_2PUcB_+YQ@mail.gmail.com>
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, kernel@collabora.com,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>, James Wang <james.qian.wang@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKVyBkbml1IDMwLjAzLjIwMjAgb8KgMTk6MDEsIERhbmllbCBWZXR0ZXIgcGlz
emU6Cj4gT24gV2VkLCBNYXIgMTEsIDIwMjAgYXQgMzo1NSBQTSBBbmRyemVqIFBpZXRyYXNpZXdp
Y3oKPiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Pgo+PiBUaGUgbmV3IHN0cnVj
dCBjb250YWlucyBhZmJjLXNwZWNpZmljIGRhdGEuCgo8c25pcD4KCj4+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0Cj4+
IGluZGV4IDQzOTY1NmY1NWM1ZC4uMzdhM2EwMjNjMTE0IDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2dwdS90b2RvLnJzdAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAo+
PiBAQCAtNDA0LDYgKzQwNCwyMSBAQCBDb250YWN0OiBMYXVyZW50IFBpbmNoYXJ0LCByZXNwZWN0
aXZlIGRyaXZlciBtYWludGFpbmVycwo+Pgo+PiAgIExldmVsOiBJbnRlcm1lZGlhdGUKPj4KPj4g
K0VuY29kZSBjcHAgcHJvcGVybHkgaW4gbWFsaWRwCj4+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+PiArCj4+ICtjcHAgKGNoYXJzIHBlciBwaXhlbCkgaXMgbm90IGVuY29kZWQgcHJv
cGVybHkgaW4gbWFsaWRwLCB6ZXJvIGlzCj4+ICt1c2VkIGluc3RlYWQuIGFmYmMgaW1wbGVtZW50
YXRpb24gbmVlZHMgYnBwIG9yIGNwcCwgYnV0IGlmIGl0IGlzCj4+ICt6ZXJvIGl0IG5lZWRzIHRv
IGJlIHByb3ZpZGVkIGVsc2V3aGVyZSwgYW5kIHNvIHRoZSBicHAgZmllbGQgZXhpc3RzCj4+ICtp
biBzdHJ1Y3QgZHJtX2FmYmNfZnJhbWVidWZmZXIuCj4+ICsKPj4gK1Byb3Blcmx5IGVuY29kZSBj
cHAgaW4gbWFsaWRwIGFuZCByZW1vdmUgdGhlIGJwcCBmaWVsZCBpbiBzdHJ1Y3QKPj4gK2RybV9h
ZmJjX2ZyYW1lYnVmZmVyLgo+PiArCj4+ICtDb250YWN0OiBtYWxpZHAgbWFpbnRhaW5lcnMKPj4g
Kwo+PiArTGV2ZWw6IEludGVybWVkaWF0ZQo+IAo+IEp1c3Qgc3R1bWJsZWQgb3ZlciB0aGlzIHRv
ZG8sIHdoaWNoIGlzIHJlYWxseSBzdXJwcmlzaW5nLiBBbHNvCj4gZGVmaW5pdGVseSBub3Qgc29t
ZXRoaW5nIEkgd2FudGVkIHRvIGFjaywgZWFybGllciB2ZXJzaW9ucyBhdCBsZWFzdAo+IGRpZG4n
dCBoYXZlIHRoaXMuCj4gCj4gV2h5IGlzIHRoaXMgbmVlZGVkPyBkcm1fYWZiY19mcmFtZWJ1ZmZl
ciBjb250YWlucyBhIGRybV9mcmFtZWJ1ZmZlciwKPiB3aGljaCBoYXMgYSBwb2ludGVyIHRvIGRy
bV9mb3JtYXRfaW5mbywgd2hpY2ggd2UncmUgYWx3YXlzIHNldHRpbmcKPiAodGhlIGNvcmUgZG9l
cyB0aGF0IGZvciBhbGwgZHJpdmVycywgYm90aCBmb3IgYWRkZmIgYW5kIGFkZGZiMikuIFdoeQo+
IGlzIHRoYXQgbm90IGdvb2QgZW5vdWdoIHRvIGdldCBhdCBjcHAgZm9yIGV2ZXJ5b25lPwo+IAo+
IENoZWVycywgRGFuaWVsCj4gCgpMZXQgbWUgcXVvdGUgSmFtZXMgaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzM0NTYwMy8jY29tbWVudF82NTMwODE6CgoiU2VlbXMgd2Ug
Y2FuIHJlbW92ZSB0aGlzIGJwcCBvciBubyBuZWVkIHRvIGRlZmluZSBpdCBhcyBhIHBhc3MgaW4g
YXJndW1lbnQKZm9yIHNpemUgY2hlY2ssIG1heWJlIHRoZSBrb21lZGEvbWFsaWRwIGdldF9hZmJj
X2JwcCgpIGZ1bmN0aW9uIG1pc2xlYWQKeW91IHRoYXQgYWZiYyBmb3JtYXRzIG1heSBoYXZlIHZl
bmRvciBzcGVjaWZpYyBicHAuCgpCdXQgdGhlIHN0b3J5IGlzOgoKZm9yIGFmYmMgb25seSBmb3Jt
YXRzIGxpa2UgRFJNX0ZPUk1BVF9ZVVY0MjBfOEJJVC8xMEJJVCwgd2UgaGF2ZSBzZXQKbm90aGlu
ZyBpbiBkcm1fZm9ybWF0X2luZm8sIG5laXRoZXIgY3BwIG5vciBibG9ja19zaXplLCBzbyBib3Ro
IG1hbGlkcApvciBrb21lZGEgaW50cm9kdWNlIGEgZ2V0X2JwcCgpLCBidXQgYWN0dWFsbHkgdGhl
IHR3byBmdW5jcyBiYXNpY2FsbHkKYXJlIHNhbWUuCgpTbyBteSBzdWdnZXN0aW9uIGlzIHdlIGNh
biB0ZW1wb3JhcnkgdXNlIHRoZSBnZXRfYWZiY19icHAoKSBpbiBtYWxpZHAKb3Iga29tZWRhLiBh
bmQgZXZlbnR1YWxseSBJIHRoaW5rIHdlJ2QgYmV0dGVyIHNldCB0aGUgYmxvY2sgc2l6ZQpmb3Ig
dGhlc2UgZm9ybWF0cywgdGhlbiB3ZSBjYW4gZGVmaW5lcyBhIGNvbW1vbiBnZXRfYnBwKCkgbGlr
ZSBwaXRjaCIuCgpBbmRyemVqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
