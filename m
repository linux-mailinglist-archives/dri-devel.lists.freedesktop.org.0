Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC15F163E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 13:45:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887866E20B;
	Wed,  6 Nov 2019 12:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198966E20B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 12:45:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 9DA8F28C246
Subject: Re: [PATCHv2 1/4] drm/arm: Factor out generic afbc helpers
To: Daniel Vetter <daniel@ffwll.ch>
References: <2485717.1SzL54aMiy@e123338-lin>
 <20191104221228.3588-1-andrzej.p@collabora.com>
 <20191104221228.3588-2-andrzej.p@collabora.com>
 <20191105092232.GV10326@phenom.ffwll.local>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <d4828420-6109-ff93-e0da-d0493cf3aef5@collabora.com>
Date: Wed, 6 Nov 2019 13:45:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191105092232.GV10326@phenom.ffwll.local>
Content-Language: en-US
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
Cc: kernel@collabora.com, Mihail Atanassov <mihail.atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 James Wang <james.qian.wang@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKVGhhbmsgeW91IGZvciByZXZpZXcsCgpXIGRuaXUgMDUuMTEuMjAxOSBvwqAx
MDoyMiwgRGFuaWVsIFZldHRlciBwaXN6ZToKPiBPbiBNb24sIE5vdiAwNCwgMjAxOSBhdCAxMTox
MjoyNVBNICswMTAwLCBBbmRyemVqIFBpZXRyYXNpZXdpY3ogd3JvdGU6Cj4+IFRoZXNlIGFyZSB1
c2VmdWwgZm9yIG90aGVyIHVzZXJzIG9mIGFmYmMsIGUuZy4gcm9ja2NoaXAuCj4+Cgo8c25pcD4K
Cj4+ICsKPj4gK2Jvb2wgZHJtX2FmYmNfY2hlY2tfZmJfc2l6ZV9yZXQodTMyIHBpdGNoLCBpbnQg
YnBwLAo+PiArCQkJCXUzMiB3LCB1MzIgaCwgdTMyIHN1cGVyYmxrX3csIHUzMiBzdXBlcmJsa19o
LAo+PiArCQkJCXNpemVfdCBzaXplLCB1MzIgb2Zmc2V0LCB1MzIgaGRyX2FsaWduLAo+PiArCQkJ
CXUzMiAqcGF5bG9hZF9vZmYsIHUzMiAqdG90YWxfc2l6ZSkKPj4gK3sKPj4gKwlpbnQgbl9zdXBl
cmJsa3MgPSAwOwo+PiArCXUzMiBzdXBlcmJsa19zeiA9IDA7Cj4+ICsJdTMyIGFmYmNfc2l6ZSA9
IDA7Cj4+ICsKPj4gKwluX3N1cGVyYmxrcyA9ICh3IC8gc3VwZXJibGtfdykgKiAoaCAvIHN1cGVy
YmxrX2gpOwo+PiArCXN1cGVyYmxrX3N6ID0gKGJwcCAqIHN1cGVyYmxrX3cgKiBzdXBlcmJsa19o
KSAvIEJJVFNfUEVSX0JZVEU7Cj4+ICsJYWZiY19zaXplID0gQUxJR04obl9zdXBlcmJsa3MgKiBB
RkJDX0hFQURFUl9TSVpFLCBoZHJfYWxpZ24pOwo+PiArCSpwYXlsb2FkX29mZiA9IGFmYmNfc2l6
ZTsKPj4gKwo+PiArCWFmYmNfc2l6ZSArPSBuX3N1cGVyYmxrcyAqIEFMSUdOKHN1cGVyYmxrX3N6
LCBBRkJDX1NVUEVSQkxLX0FMSUdOTUVOVCk7Cj4+ICsJKnRvdGFsX3NpemUgPSBhZmJjX3NpemUg
KyBvZmZzZXQ7Cj4+ICsKPj4gKwlpZiAoKHcgKiBicHApICE9IChwaXRjaCAqIEJJVFNfUEVSX0JZ
VEUpKSB7Cj4+ICsJCURSTV9ERUJVR19LTVMoIkludmFsaWQgdmFsdWUgb2YgKHBpdGNoICogQklU
U19QRVJfQllURSkgKD0ldSkgc2hvdWxkIGJlIHNhbWUgYXMgd2lkdGggKD0ldSkgKiBicHAgKD0l
dSlcbiIsCj4+ICsJCQkgICAgICBwaXRjaCAqIEJJVFNfUEVSX0JZVEUsIHcsIGJwcAo+PiArCQkp
Owo+PiArCQlyZXR1cm4gZmFsc2U7Cj4+ICsJfQo+PiArCj4+ICsJaWYgKHNpemUgPCBhZmJjX3Np
emUpIHsKPj4gKwkJRFJNX0RFQlVHX0tNUygiYnVmZmVyIHNpemUgKCV6dSkgdG9vIHNtYWxsIGZv
ciBBRkJDIGJ1ZmZlciBzaXplID0gJXVcbiIsCj4+ICsJCQkgICAgICBzaXplLCBhZmJjX3NpemUK
Pj4gKwkJKTsKPj4gKwo+PiArCQlyZXR1cm4gZmFsc2U7Cj4+ICsJfQo+PiArCj4+ICsJcmV0dXJu
IHRydWU7Cj4+ICt9Cj4+ICtFWFBPUlRfU1lNQk9MKGRybV9hZmJjX2NoZWNrX2ZiX3NpemVfcmV0
KTsKPj4gKwo+PiArYm9vbCBkcm1fYWZiY19jaGVja19mYl9zaXplKHUzMiBwaXRjaCwgaW50IGJw
cCwKPj4gKwkJCSAgICB1MzIgdywgdTMyIGgsIHUzMiBzdXBlcmJsa193LCB1MzIgc3VwZXJibGtf
aCwKPj4gKwkJCSAgICBzaXplX3Qgc2l6ZSwgdTMyIG9mZnNldCwgdTMyIGhkcl9hbGlnbikKPj4g
K3sKPj4gKwl1MzIgcGF5bG9hZF9vZmZzZXQsIHRvdGFsX3NpemU7Cj4+ICsKPj4gKwlyZXR1cm4g
ZHJtX2FmYmNfY2hlY2tfZmJfc2l6ZV9yZXQocGl0Y2gsIGJwcCwgdywgaCwKPj4gKwkJCQkJICBz
dXBlcmJsa193LCBzdXBlcmJsa19oLAo+PiArCQkJCQkgIHNpemUsIG9mZnNldCwgaGRyX2FsaWdu
LAo+PiArCQkJCQkgICZwYXlsb2FkX29mZnNldCwgJnRvdGFsX3NpemUpOwo+PiArfQo+PiArRVhQ
T1JUX1NZTUJPTChkcm1fYWZiY19jaGVja19mYl9zaXplKTsKPiAKPiBXaHkgZG9uJ3Qgd2UgaGF2
ZSBvbmUgb3ZlcmFsbCAiY2hlY2sgYWZiYyBwYXJhbWV0ZXJzIGFnYWluc3QgYnVmZmVyIgo+IGZ1
bmN0aW9uPwo+IAoKSSBub3RpY2VkIHRoYXQgZGlmZmVyZW50IGRyaXZlcnMgaGF2ZSBkaWZmZXJl
bnQgbmVlZHMgKG1hbGlkcAphbmQgcm9ja2NoaXAgYXJlIGtpbmQgb2Ygc2ltaWxhciwgYnV0IGtv
bWVkYSBpcyBhIGJpdCBkaWZmZXJlbnQpLgpUaGF0IGlzIHdoeSB0aGUgaGVscGVycyBhcmUgb25s
eSBidWlsZGluZyBibG9ja3Mgb3V0IG9mIHdoaWNoCmVhY2ggZHJpdmVyIGJ1aWxkcyBpdHMgb3du
IGNoZWNraW5nIGxvZ2ljLiBJbiBwYXJ0aWN1bGFyIGtvbWVkYQp3YW50cyBzb21lIGJ5LXByb2R1
Y3RzIG9mIHRoZSBjaGVjayBzdG9yZWQgaW4gaXRzIGludGVybmFsIGRhdGEKc3RydWN0dXJlcywg
aGVuY2UgZHJtX2FmYmNfY2hlY2tfZmJfc2l6ZV9yZXQoKSBhbmQgaXRzIHdyYXBwZXIKZHJtX2Fm
YmNfY2hlY2tfZmJfc2l6ZSgpIHdoaWNoIGlnbm9yZXMgdGhlICJvdXQiIHBhcmFtZXRlcnMuCgpJ
ZiBJIHdhbnRlZCB0byBjcmVhdGUgb25lIG92ZXJhbGwgImNoZWNrIGFmYmMgcGFyYW1ldGVycyIg
SSdkIGhhdmUKdG8gY29tZSB1cCB3aXRoIGEgd2F5IHRvIHBhc3MgZHJpdmVyLXNwZWNpZmljIHJl
cXVpcmVtZW50cyB0byBpdAphbmQgdGhlbiBpbnNpZGUgdGhlIGZ1bmN0aW9uIGhhdmUgc29tZSBs
b2dpYyB0byBkZWNpZGUgd2hhdCB0bwpjaGVjayBhZ2FpbnN0IHdoYXQuIERvIHlvdSB0aGluayBp
dCBpcyB3b3J0aCBpdD8KCkFuZHJ6ZWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
