Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB2A9E455
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 11:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0D38999C;
	Tue, 27 Aug 2019 09:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B75899BB
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 09:32:56 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7R9WnYn026436;
 Tue, 27 Aug 2019 04:32:49 -0500
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7R9WnWO041289
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Aug 2019 04:32:49 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 04:32:48 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 04:32:48 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7R9Wle8118397;
 Tue, 27 Aug 2019 04:32:47 -0500
Subject: Re: [PATCH v2 00/50] drm/omap: Replace custom display drivers with
 drm_bridge and drm_panel
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <ae7bbfac-56ad-7193-d328-f3e2008ad0e9@ti.com>
 <20190826135141.GF5031@pendragon.ideasonboard.com>
 <3ebdf5ff-4269-7ce8-d742-913966dcdfda@ti.com>
 <20190827092951.GK5054@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <13ac0cd0-3a07-2ff2-2ba9-260f0ea14785@ti.com>
Date: Tue, 27 Aug 2019 12:32:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827092951.GK5054@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1566898369;
 bh=OVRqyn/+eR3JbNJog5zo9hM+bsk2FRCLJ/54GZmtlBk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=xiw9WEbReSOpfOF4GPEocZjrYwYVELxfI3paptBvePYk4wdivbOvxuL7zWF8mN4MA
 OD4iVOnzw9fvi9mk1lAjYWHrsC/g45tKGoLuBmm9e002DTHIQzNrdFXvK44OIk6avB
 4It9+1Z+bHx359l76QfWVLcPFHUIH1lJNwnRVXvs=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjcvMDgvMjAxOSAxMjoyOSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBIaSBUb21pLAo+
IAo+IE9uIFR1ZSwgQXVnIDI3LCAyMDE5IGF0IDEwOjM0OjU5QU0gKzAzMDAsIFRvbWkgVmFsa2Vp
bmVuIHdyb3RlOgo+PiBPbiAyNi8wOC8yMDE5IDE2OjUxLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3Rl
Ogo+Pj4gT24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgMDM6MTU6MjNQTSArMDMwMCwgVG9taSBWYWxr
ZWluZW4gd3JvdGU6Cj4+Pj4gT24gMjAvMDgvMjAxOSAwNDoxNiwgTGF1cmVudCBQaW5jaGFydCB3
cm90ZToKPj4+Pgo+Pj4+PiBUaGUgcGF0Y2hlcyBjYW4gYmUgZm91bmQgYXQKPj4+Pj4KPj4+Pj4g
CWdpdDovL2xpbnV4dHYub3JnL3BpbmNoYXJ0bC9tZWRpYS5naXQgb21hcGRybS9icmlkZ2UvZGV2
ZWwKPj4+Pgo+Pj4+IEkgdG9vayB5b3VyIGJyYW5jaCwgYm9vdGVkIEFNNSBFVk0gKEkgc2VlIHlv
dSBoYWQgdGhlIGhhY2sgZHRzIHBhdGNoIGluIHlvdXIgYnJhbmNoKSwgYW5kOgo+Pj4+Cj4+Pj4g
aW5zbW9kIG5mcy93b3JrL2xpbnV4L2RyaXZlcnMvbWVkaWEvY2VjL2NlYy5rbwo+Pj4+IGluc21v
ZCBuZnMvd29yay9saW51eC9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvY2ZiY29weWFyZWEua28K
Pj4+PiBpbnNtb2QgbmZzL3dvcmsvbGludXgvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2NmYmlt
Z2JsdC5rbwo+Pj4+IGluc21vZCBuZnMvd29yay9saW51eC9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2Nv
cmUvY2ZiZmlsbHJlY3Qua28KPj4+PiBpbnNtb2QgbmZzL3dvcmsvbGludXgvZHJpdmVycy9ncHUv
ZHJtL2RybV9wYW5lbF9vcmllbnRhdGlvbl9xdWlya3Mua28KPj4+PiBpbnNtb2QgbmZzL3dvcmsv
bGludXgvZHJpdmVycy9ncHUvZHJtL2RybS5rbwo+Pj4+IGluc21vZCBuZnMvd29yay9saW51eC9k
cml2ZXJzL2dwdS9kcm0vZHJtX2ttc19oZWxwZXIua28KPj4+PiBpbnNtb2QgbmZzL3dvcmsvbGlu
dXgvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAua28KPj4+PiBpbnNtb2QgbmZzL3dv
cmsvbGludXgvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmtvCj4+Pj4gaW5zbW9kIG5m
cy93b3JrL2xpbnV4L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3Njcua28KPj4+PiBpbnNt
b2QgbmZzL3dvcmsvbGludXgvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5rbwo+
Pj4+IFsgICAyNS40ODcwMDJdIHBhbmVsLXNpbXBsZSBkaXNwbGF5OiBkaXNwbGF5IHN1cHBseSBw
b3dlciBub3QgZm91bmQsIHVzaW5nIGR1bW15IHJlZ3VsYXRvcgo+Pj4+IFsgICAyNS40OTUyNDFd
IC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQo+Pj4+IFsgICAyNS40OTk5MDBd
IFdBUk5JTkc6IENQVTogMCBQSUQ6IDMwMyBhdCBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwt
c2ltcGxlLmM6Mzc4IHBhbmVsX3NpbXBsZV9wcm9iZSsweDM0Yy8weDNiNCBbcGFuZWxfc2ltcGxl
XQo+Pj4KPj4+IEhvdyBhbSBJIGV4cGVjdGVkIHRvIHNuZWFrIHBhdGNoZXMgaW4gaWYgeW91IHRl
c3QgdGhlbSA/IDotKQo+Pj4KPj4+IFRoaXMgaGFzIGJlZW4gaW50cm9kdWNlZCBieSBhIHJlY2Vu
dCByZWJhc2UsIGFuZCBJJ3ZlIG9ubHkgdGVzdGVkIHRoZQo+Pj4gc2VyaWVzIG9uIHRoZSBwYW5k
YWJvYXJkIHNpbmNlIHRoZW4uIEl0IGxvb2tzIGxpa2UgdGhlIHByb2JsZW0gY29tZXMKPj4+IGZy
b20KPj4+Cj4+PiBjb21taXQgYjhhMjk0OGZhMmIzYTVhNmRhNjdmZDU3YWEwMWM3MzE4ZDc5NTEy
NQo+Pj4gQXV0aG9yOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPj4+IERhdGU6
ICAgVGh1IEp1bCAxMSAxMzozNDo1MyAyMDE5IC0wNzAwCj4+Pgo+Pj4gICAgICAgZHJtL3BhbmVs
OiBzaW1wbGU6IEFkZCBhYmlsaXR5IHRvIG92ZXJyaWRlIHR5cGljYWwgdGltaW5nCj4+Pgo+Pj4g
d2hpY2ggYnJlYWtzIG91ciBvdXQtb2YtdHJlZSBEVC4gQXMgYSBzaG9ydCB0ZXJtIGZpeCBJIGNh
biBzaW1wbHkgZHJvcAo+Pj4gdGhlIHBhbmVsIHRpbWluZ3MgZnJvbSBEVCwgYnV0IEkgdGhpbmsg
dGhpcyBpc3N1ZSBjYW4gYWZmZWN0IG1vcmUKPj4KPj4gU28ganVzdCByZW1vdmluZyB0aGUgdGlt
aW5ncyBmcm9tIHRoZSBwYW5lbCdzIG5vZGUgc2hvdWxkIGJlIGVub3VnaD8KPj4gU3RpbGwgY3Jh
c2hpbmcgZm9yIG1lLCBhbHRob3VnaCB0aGUgcGFuZWwgd2FybmluZyBnb2VzIGF3YXkuCj4gCj4g
TXkgYmFkLCB5b3UgYWxzbyBuZWVkIHRoZSBmb2xsb3dpbmcgcGF0Y2ggdGhhdCBJIHdpbGwgaW5j
bHVkZSBpbiB2My4KClRoYW5rcywgYnV0IEkgZ3Vlc3MgSSBuZWVkIHNvbWV0aGluZyBtb3JlOgoK
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jOjIzODQ6MzogZXJyb3I6IOKAmGNv
bnN0IHN0cnVjdCAKcGFuZWxfZGVzY+KAmSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKAmGNvbm5lY3Rv
cl90eXBl4oCZCiAgIC5jb25uZWN0b3JfdHlwZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9EUEksCgog
IFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIy
LCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBh
aWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
