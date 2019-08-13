Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6688BC0F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 16:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277BD6E170;
	Tue, 13 Aug 2019 14:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F016E170
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 14:52:46 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id h13so4329122edq.10
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 07:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=RQ1QVx5o9SJIET1BWjWYbWKrgeBi7qgViw8kkVMCTvs=;
 b=g5Pi/4Tiu8DTnha16exkXEaLEBGQjwyMHsA5Ev4Jo5RXT+7/VvK5HD5qySvTAzBTeS
 h6Vt6d0vwz1HG9B/ykyxP8ZiZ6aRxxSkkZP5qWB13ZU+0u6oaQf9+meejwvqZe6XxZsl
 2YtlhW1JeKhDMt4W6OFpOyO6QO81osKJsMs+UaUpFc5GQE6ZldEAavl6/kwO0+AwxJvW
 41oOgn0B9uALDENTQ6b4AAyvcQi4n9WZFZB1qbhQDQsFzKjP0h7MYMI5vSEVzQX+hHQw
 7+COqkU1FH2i4wI8RUbzvT/gaUspSTjm3luV4+1006Uk2gOUuyK/aw803i/Ifpng0+MI
 sjXQ==
X-Gm-Message-State: APjAAAU0Hp3gDBY61olCjfDQPociA+m/zYtEYCOYDw+7pwEXUZGmPDW8
 wK9md61zL2TgItX7kBKocbXuhPsXNg3PqA==
X-Google-Smtp-Source: APXvYqzSFlhkSEYUKazTLMB6IcJ+/zeWaPQ1in9/DSpiokVlOE33cDm3eLAeQimuIReaivkPmW6ZFg==
X-Received: by 2002:a50:9f81:: with SMTP id c1mr25767200edf.100.1565707965205; 
 Tue, 13 Aug 2019 07:52:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id c15sm17906654ejs.17.2019.08.13.07.52.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 07:52:44 -0700 (PDT)
Date: Tue, 13 Aug 2019 16:52:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 06/26] drm/dp_mst: Move PDT teardown for ports into
 destroy_connector_work
Message-ID: <20190813145242.GW7444@phenom.ffwll.local>
Mail-Followup-To: Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, Juston Li <juston.li@intel.com>,
 Imre Deak <imre.deak@intel.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Harry Wentland <hwentlan@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org
References: <20190718014329.8107-1-lyude@redhat.com>
 <20190718014329.8107-7-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718014329.8107-7-lyude@redhat.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=RQ1QVx5o9SJIET1BWjWYbWKrgeBi7qgViw8kkVMCTvs=;
 b=IcBJ7hkeGZvJTKoDJTcKpgH6kedD5Ys+UinOd9BoHC2xm6KrEn66kehAaodc2VXiBG
 YsTebKuxTPKezkiq/+7mL3flXJfHL7kp2/L2BsHul3ZKwyuLOaV4o+fT9kWwHkE6lHvo
 Is+KJZUcK0obXKg8OA6opSR4n1FFR9aR8OgRc=
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Juston Li <juston.li@intel.com>,
 Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMDk6NDI6MjlQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBUaGlzIHdpbGwgYWxsb3cgdXMgdG8gYWRkIHNvbWUgbG9ja2luZyBmb3IgcG9ydCBQRFRz
LCB3aGljaCBjYW4ndCBiZQo+IGRvbmUgZnJvbSBkcm1fZHBfZGVzdHJveV9wb3J0KCkgc2luY2Ug
d2UgZG9uJ3Qga25vdyB3aGF0IGxvY2tzIHRoZQo+IGNhbGxlciBtaWdodCBiZSBob2xkaW5nLiBB
bHNvLCB0aGlzIGdldHMgcmlkIG9mIGEgZ29vZCBiaXQgb2YgdW5uZWVkZWQKPiBjb2RlLgo+IAo+
IENjOiBKdXN0b24gTGkgPGp1c3Rvbi5saUBpbnRlbC5jb20+Cj4gQ2M6IEltcmUgRGVhayA8aW1y
ZS5kZWFrQGludGVsLmNvbT4KPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxp
bnV4LmludGVsLmNvbT4KPiBDYzogSGFycnkgV2VudGxhbmQgPGh3ZW50bGFuQGFtZC5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDQyICsrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9s
b2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gaW5kZXggZGVm
YzVlMDlmYjlhLi4wMjk1ZTAwN2M4MzYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9tc3RfdG9wb2xvZ3kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3Rv
cG9sb2d5LmMKPiBAQCAtMTUwOSwzMSArMTUwOSwyMiBAQCBzdGF0aWMgdm9pZCBkcm1fZHBfZGVz
dHJveV9wb3J0KHN0cnVjdCBrcmVmICprcmVmKQo+ICAJCWNvbnRhaW5lcl9vZihrcmVmLCBzdHJ1
Y3QgZHJtX2RwX21zdF9wb3J0LCB0b3BvbG9neV9rcmVmKTsKPiAgCXN0cnVjdCBkcm1fZHBfbXN0
X3RvcG9sb2d5X21nciAqbWdyID0gcG9ydC0+bWdyOwo+ICAKPiAtCWlmICghcG9ydC0+aW5wdXQp
IHsKPiAtCQlrZnJlZShwb3J0LT5jYWNoZWRfZWRpZCk7Cj4gLQo+IC0JCS8qCj4gLQkJICogVGhl
IG9ubHkgdGltZSB3ZSBkb24ndCBoYXZlIGEgY29ubmVjdG9yCj4gLQkJICogb24gYW4gb3V0cHV0
IHBvcnQgaXMgaWYgdGhlIGNvbm5lY3RvciBpbml0Cj4gLQkJICogZmFpbHMuCj4gLQkJICovCj4g
LQkJaWYgKHBvcnQtPmNvbm5lY3Rvcikgewo+IC0JCQkvKiB3ZSBjYW4ndCBkZXN0cm95IHRoZSBj
b25uZWN0b3IgaGVyZSwgYXMKPiAtCQkJICogd2UgbWlnaHQgYmUgaG9sZGluZyB0aGUgbW9kZV9j
b25maWcubXV0ZXgKPiAtCQkJICogZnJvbSBhbiBFRElEIHJldHJpZXZhbCAqLwo+IC0KPiAtCQkJ
bXV0ZXhfbG9jaygmbWdyLT5kZXN0cm95X2Nvbm5lY3Rvcl9sb2NrKTsKPiAtCQkJbGlzdF9hZGQo
JnBvcnQtPm5leHQsICZtZ3ItPmRlc3Ryb3lfY29ubmVjdG9yX2xpc3QpOwo+IC0JCQltdXRleF91
bmxvY2soJm1nci0+ZGVzdHJveV9jb25uZWN0b3JfbG9jayk7Cj4gLQkJCXNjaGVkdWxlX3dvcmso
Jm1nci0+ZGVzdHJveV9jb25uZWN0b3Jfd29yayk7Cj4gLQkJCXJldHVybjsKPiAtCQl9Cj4gLQkJ
Lyogbm8gbmVlZCB0byBjbGVhbiB1cCB2Y3BpCj4gLQkJICogYXMgaWYgd2UgaGF2ZSBubyBjb25u
ZWN0b3Igd2UgbmV2ZXIgc2V0dXAgYSB2Y3BpICovCj4gLQkJZHJtX2RwX3BvcnRfdGVhcmRvd25f
cGR0KHBvcnQsIHBvcnQtPnBkdCk7Cj4gLQkJcG9ydC0+cGR0ID0gRFBfUEVFUl9ERVZJQ0VfTk9O
RTsKPiArCS8qIFRoZXJlJ3Mgbm90aGluZyB0aGF0IG5lZWRzIGxvY2tpbmcgdG8gZGVzdHJveSBh
biBpbnB1dCBwb3J0IHlldCAqLwo+ICsJaWYgKHBvcnQtPmlucHV0KSB7Cj4gKwkJZHJtX2RwX21z
dF9wdXRfcG9ydF9tYWxsb2MocG9ydCk7Cj4gKwkJcmV0dXJuOwo+ICAJfQo+IC0JZHJtX2RwX21z
dF9wdXRfcG9ydF9tYWxsb2MocG9ydCk7Cj4gKwo+ICsJa2ZyZWUocG9ydC0+Y2FjaGVkX2VkaWQp
Owo+ICsKPiArCS8qCj4gKwkgKiB3ZSBjYW4ndCBkZXN0cm95IHRoZSBjb25uZWN0b3IgaGVyZSwg
YXMgd2UgbWlnaHQgYmUgaG9sZGluZyB0aGUKPiArCSAqIG1vZGVfY29uZmlnLm11dGV4IGZyb20g
YW4gRURJRCByZXRyaWV2YWwKPiArCSAqLwo+ICsJbXV0ZXhfbG9jaygmbWdyLT5kZXN0cm95X2Nv
bm5lY3Rvcl9sb2NrKTsKPiArCWxpc3RfYWRkKCZwb3J0LT5uZXh0LCAmbWdyLT5kZXN0cm95X2Nv
bm5lY3Rvcl9saXN0KTsKPiArCW11dGV4X3VubG9jaygmbWdyLT5kZXN0cm95X2Nvbm5lY3Rvcl9s
b2NrKTsKPiArCXNjaGVkdWxlX3dvcmsoJm1nci0+ZGVzdHJveV9jb25uZWN0b3Jfd29yayk7CgpT
byBpZiBJJ20gbm90IGNvbXBsZXRlbHkgYmxpbmQgdGhpcyBqdXN0IGZsYXR0ZW5zIHRoZSBhYm92
ZSBjb2RlIGZsb3cgKGJ5CmludmVydGluZyB0aGUgaWYgKHBvcnQtPmlucHV0KSkuCgo+ICB9Cj4g
IAo+ICAvKioKPiBAQCAtMzg4MSw3ICszODcyLDggQEAgZHJtX2RwX2ZpbmlzaF9kZXN0cm95X3Bv
cnQoc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydCkKPiAgewo+ICAJSU5JVF9MSVNUX0hFQUQo
JnBvcnQtPm5leHQpOwo+ICAKPiAtCXBvcnQtPm1nci0+Y2JzLT5kZXN0cm95X2Nvbm5lY3Rvcihw
b3J0LT5tZ3IsIHBvcnQtPmNvbm5lY3Rvcik7Cj4gKwlpZiAocG9ydC0+Y29ubmVjdG9yKQoKQW5k
IHRoaXMgaGVyZSBJIGNhbid0IGNvbm5lY3Qgd2l0aCB0aGUgY29tbWl0IG1lc3NhZ2UuIEknbSBj
b25mdXNlZCwgZGlkCnNvbWV0aGluZyBnbyB3cm9uZyB3aXRoIHNvbWUgcmViYXNlIGhlcmUsIGFu
ZCB0aGlzIHBhdGNoIHNob3VsZCBoYXZlIGEKZGlmZmVyZW50IHRpdGxlL3N1bW1hcnk/Ci1EYW5p
ZWwKCj4gKwkJcG9ydC0+bWdyLT5jYnMtPmRlc3Ryb3lfY29ubmVjdG9yKHBvcnQtPm1nciwgcG9y
dC0+Y29ubmVjdG9yKTsKPiAgCj4gIAlkcm1fZHBfcG9ydF90ZWFyZG93bl9wZHQocG9ydCwgcG9y
dC0+cGR0KTsKPiAgCXBvcnQtPnBkdCA9IERQX1BFRVJfREVWSUNFX05PTkU7Cj4gLS0gCj4gMi4y
MS4wCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9y
YXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
