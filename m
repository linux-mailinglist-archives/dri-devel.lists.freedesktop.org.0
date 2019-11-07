Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3993F290F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 09:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8132F6E37C;
	Thu,  7 Nov 2019 08:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA786E37C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 08:27:38 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id w30so2010661wra.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2019 00:27:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=h4K7TfJavvavtarTw//D0rJYwTw3W9sc+VxHibBMIh0=;
 b=Sn1D0jeiThC6bnsxt1XJhCGO6QMunQOwtsWR5w+eh34HMnWF7jfF66H0pILf8EUaBr
 xFZNjMTELl8lNTi3AO4NOPFFqtrlqQNB6yduI/EJHMTYWp/FjMjY1uX9QGMmHaX4iALX
 nFKct/6JvIKoU33J/iajsoWZrqahkpDxxedQf9h5wGHTw4sVw7TFGxLyZB0mFl8pqjSY
 AP9PsZLMp7YGVWUcoUriOGaDGVTbZp9W2d8CtYiyWbml0WnwuTq3V86+CmjP8tVCw2Oi
 WYFxVGhtllq636Kie0fuWwFuLOP+BEJSyF3tpkFmIDtGMNBgRNcnBjAFUVwS5mM1xML+
 BfnA==
X-Gm-Message-State: APjAAAVt9mctJb0/AeqtQRtHdefKJ7Kua/p6+7Sik4L7PUgbyIegSspJ
 KRpivqrQSR/7EvCCbewMYXdEgA==
X-Google-Smtp-Source: APXvYqw9LlvGfiySmP5xOuhfh34kHBu0sjeBpgLZBX2QP9XgxvtQK1pzXbNC7BGKJ59VBjSTUXb0Ug==
X-Received: by 2002:a5d:62cd:: with SMTP id o13mr1663268wrv.367.1573115256958; 
 Thu, 07 Nov 2019 00:27:36 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id h140sm1564232wme.22.2019.11.07.00.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 00:27:35 -0800 (PST)
Date: Thu, 7 Nov 2019 09:27:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv2 1/4] drm/arm: Factor out generic afbc helpers
Message-ID: <20191107082733.GI23790@phenom.ffwll.local>
References: <2485717.1SzL54aMiy@e123338-lin>
 <20191104221228.3588-1-andrzej.p@collabora.com>
 <20191104221228.3588-2-andrzej.p@collabora.com>
 <20191105092232.GV10326@phenom.ffwll.local>
 <d4828420-6109-ff93-e0da-d0493cf3aef5@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4828420-6109-ff93-e0da-d0493cf3aef5@collabora.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=h4K7TfJavvavtarTw//D0rJYwTw3W9sc+VxHibBMIh0=;
 b=eOmVSaD7IS19hDgEpPxBVKet3+9nAmXbB4y8KiLMpRA/go9xNdbDgH3c6a+CYSLMdE
 fmzo/om/CvQPeSGdxroqImiXi2JTjr+YL9qJAlPdSg+cvagFRrs90p0HH3qLPvssLpRS
 4NM1IxbQG9CWMN8mQS+vA4gNXZhBDUvpQTyXE=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDE6NDU6MDVQTSArMDEwMCwgQW5kcnplaiBQaWV0cmFz
aWV3aWN6IHdyb3RlOgo+IEhpIERhbmllbCwKPiAKPiBUaGFuayB5b3UgZm9yIHJldmlldywKPiAK
PiBXIGRuaXUgMDUuMTEuMjAxOSBvwqAxMDoyMiwgRGFuaWVsIFZldHRlciBwaXN6ZToKPiA+IE9u
IE1vbiwgTm92IDA0LCAyMDE5IGF0IDExOjEyOjI1UE0gKzAxMDAsIEFuZHJ6ZWogUGlldHJhc2ll
d2ljeiB3cm90ZToKPiA+ID4gVGhlc2UgYXJlIHVzZWZ1bCBmb3Igb3RoZXIgdXNlcnMgb2YgYWZi
YywgZS5nLiByb2NrY2hpcC4KPiA+ID4gCj4gCj4gPHNuaXA+Cj4gCj4gPiA+ICsKPiA+ID4gK2Jv
b2wgZHJtX2FmYmNfY2hlY2tfZmJfc2l6ZV9yZXQodTMyIHBpdGNoLCBpbnQgYnBwLAo+ID4gPiAr
CQkJCXUzMiB3LCB1MzIgaCwgdTMyIHN1cGVyYmxrX3csIHUzMiBzdXBlcmJsa19oLAo+ID4gPiAr
CQkJCXNpemVfdCBzaXplLCB1MzIgb2Zmc2V0LCB1MzIgaGRyX2FsaWduLAo+ID4gPiArCQkJCXUz
MiAqcGF5bG9hZF9vZmYsIHUzMiAqdG90YWxfc2l6ZSkKPiA+ID4gK3sKPiA+ID4gKwlpbnQgbl9z
dXBlcmJsa3MgPSAwOwo+ID4gPiArCXUzMiBzdXBlcmJsa19zeiA9IDA7Cj4gPiA+ICsJdTMyIGFm
YmNfc2l6ZSA9IDA7Cj4gPiA+ICsKPiA+ID4gKwluX3N1cGVyYmxrcyA9ICh3IC8gc3VwZXJibGtf
dykgKiAoaCAvIHN1cGVyYmxrX2gpOwo+ID4gPiArCXN1cGVyYmxrX3N6ID0gKGJwcCAqIHN1cGVy
YmxrX3cgKiBzdXBlcmJsa19oKSAvIEJJVFNfUEVSX0JZVEU7Cj4gPiA+ICsJYWZiY19zaXplID0g
QUxJR04obl9zdXBlcmJsa3MgKiBBRkJDX0hFQURFUl9TSVpFLCBoZHJfYWxpZ24pOwo+ID4gPiAr
CSpwYXlsb2FkX29mZiA9IGFmYmNfc2l6ZTsKPiA+ID4gKwo+ID4gPiArCWFmYmNfc2l6ZSArPSBu
X3N1cGVyYmxrcyAqIEFMSUdOKHN1cGVyYmxrX3N6LCBBRkJDX1NVUEVSQkxLX0FMSUdOTUVOVCk7
Cj4gPiA+ICsJKnRvdGFsX3NpemUgPSBhZmJjX3NpemUgKyBvZmZzZXQ7Cj4gPiA+ICsKPiA+ID4g
KwlpZiAoKHcgKiBicHApICE9IChwaXRjaCAqIEJJVFNfUEVSX0JZVEUpKSB7Cj4gPiA+ICsJCURS
TV9ERUJVR19LTVMoIkludmFsaWQgdmFsdWUgb2YgKHBpdGNoICogQklUU19QRVJfQllURSkgKD0l
dSkgc2hvdWxkIGJlIHNhbWUgYXMgd2lkdGggKD0ldSkgKiBicHAgKD0ldSlcbiIsCj4gPiA+ICsJ
CQkgICAgICBwaXRjaCAqIEJJVFNfUEVSX0JZVEUsIHcsIGJwcAo+ID4gPiArCQkpOwo+ID4gPiAr
CQlyZXR1cm4gZmFsc2U7Cj4gPiA+ICsJfQo+ID4gPiArCj4gPiA+ICsJaWYgKHNpemUgPCBhZmJj
X3NpemUpIHsKPiA+ID4gKwkJRFJNX0RFQlVHX0tNUygiYnVmZmVyIHNpemUgKCV6dSkgdG9vIHNt
YWxsIGZvciBBRkJDIGJ1ZmZlciBzaXplID0gJXVcbiIsCj4gPiA+ICsJCQkgICAgICBzaXplLCBh
ZmJjX3NpemUKPiA+ID4gKwkJKTsKPiA+ID4gKwo+ID4gPiArCQlyZXR1cm4gZmFsc2U7Cj4gPiA+
ICsJfQo+ID4gPiArCj4gPiA+ICsJcmV0dXJuIHRydWU7Cj4gPiA+ICt9Cj4gPiA+ICtFWFBPUlRf
U1lNQk9MKGRybV9hZmJjX2NoZWNrX2ZiX3NpemVfcmV0KTsKPiA+ID4gKwo+ID4gPiArYm9vbCBk
cm1fYWZiY19jaGVja19mYl9zaXplKHUzMiBwaXRjaCwgaW50IGJwcCwKPiA+ID4gKwkJCSAgICB1
MzIgdywgdTMyIGgsIHUzMiBzdXBlcmJsa193LCB1MzIgc3VwZXJibGtfaCwKPiA+ID4gKwkJCSAg
ICBzaXplX3Qgc2l6ZSwgdTMyIG9mZnNldCwgdTMyIGhkcl9hbGlnbikKPiA+ID4gK3sKPiA+ID4g
Kwl1MzIgcGF5bG9hZF9vZmZzZXQsIHRvdGFsX3NpemU7Cj4gPiA+ICsKPiA+ID4gKwlyZXR1cm4g
ZHJtX2FmYmNfY2hlY2tfZmJfc2l6ZV9yZXQocGl0Y2gsIGJwcCwgdywgaCwKPiA+ID4gKwkJCQkJ
ICBzdXBlcmJsa193LCBzdXBlcmJsa19oLAo+ID4gPiArCQkJCQkgIHNpemUsIG9mZnNldCwgaGRy
X2FsaWduLAo+ID4gPiArCQkJCQkgICZwYXlsb2FkX29mZnNldCwgJnRvdGFsX3NpemUpOwo+ID4g
PiArfQo+ID4gPiArRVhQT1JUX1NZTUJPTChkcm1fYWZiY19jaGVja19mYl9zaXplKTsKPiA+IAo+
ID4gV2h5IGRvbid0IHdlIGhhdmUgb25lIG92ZXJhbGwgImNoZWNrIGFmYmMgcGFyYW1ldGVycyBh
Z2FpbnN0IGJ1ZmZlciIKPiA+IGZ1bmN0aW9uPwo+ID4gCj4gCj4gSSBub3RpY2VkIHRoYXQgZGlm
ZmVyZW50IGRyaXZlcnMgaGF2ZSBkaWZmZXJlbnQgbmVlZHMgKG1hbGlkcAo+IGFuZCByb2NrY2hp
cCBhcmUga2luZCBvZiBzaW1pbGFyLCBidXQga29tZWRhIGlzIGEgYml0IGRpZmZlcmVudCkuCj4g
VGhhdCBpcyB3aHkgdGhlIGhlbHBlcnMgYXJlIG9ubHkgYnVpbGRpbmcgYmxvY2tzIG91dCBvZiB3
aGljaAo+IGVhY2ggZHJpdmVyIGJ1aWxkcyBpdHMgb3duIGNoZWNraW5nIGxvZ2ljLiBJbiBwYXJ0
aWN1bGFyIGtvbWVkYQo+IHdhbnRzIHNvbWUgYnktcHJvZHVjdHMgb2YgdGhlIGNoZWNrIHN0b3Jl
ZCBpbiBpdHMgaW50ZXJuYWwgZGF0YQo+IHN0cnVjdHVyZXMsIGhlbmNlIGRybV9hZmJjX2NoZWNr
X2ZiX3NpemVfcmV0KCkgYW5kIGl0cyB3cmFwcGVyCj4gZHJtX2FmYmNfY2hlY2tfZmJfc2l6ZSgp
IHdoaWNoIGlnbm9yZXMgdGhlICJvdXQiIHBhcmFtZXRlcnMuCj4gCj4gSWYgSSB3YW50ZWQgdG8g
Y3JlYXRlIG9uZSBvdmVyYWxsICJjaGVjayBhZmJjIHBhcmFtZXRlcnMiIEknZCBoYXZlCj4gdG8g
Y29tZSB1cCB3aXRoIGEgd2F5IHRvIHBhc3MgZHJpdmVyLXNwZWNpZmljIHJlcXVpcmVtZW50cyB0
byBpdAo+IGFuZCB0aGVuIGluc2lkZSB0aGUgZnVuY3Rpb24gaGF2ZSBzb21lIGxvZ2ljIHRvIGRl
Y2lkZSB3aGF0IHRvCj4gY2hlY2sgYWdhaW5zdCB3aGF0LiBEbyB5b3UgdGhpbmsgaXQgaXMgd29y
dGggaXQ/CgpIbSBJIGZpZ3VyZWQgdGhlcmUncyBhdCBsZWFzdCB0d28gcGFydHMgb2YgdGhpczoK
LSBHZW5lcmljIGNoZWNraW5nIG9mIGFmYmMgYWdhaW5zdCB0aGUgZmIgcGFyYW1ldGVycywgaS5l
LiBpcyBpdCBiaWcKICBlbm91Z2gsIGNvcnJlY3RseSBhbGlnbmVkLCBhbGwgdGhhdC4KLSBBZGRp
dGlvbmFsIGRyaXZlciBjaGVja3MsIHdoaWNoIG1pZ2h0IG5lZWQgc29tZSBvZiB0aGUgc2FtZSBw
YXJhbWV0ZXJzCiAgYWdhaW4uCgpUaGUgaWRlYSBiZWhpbmQgYXNraW5nIGZvciB0aGUgZmlyc3Qg
cGFydCBpcyB0aGF0IG1heWJlIHdlIHNob3VsZCBwdXQgdGhhdAppbnRvIHRoZSBjb3JlIGFzIHBh
cnQgb2YgdGhlIGFkZGZiIGNoZWNrcyAobGlrZSB3ZSBkbyBmb3IgdGhlIHRpbGVkIE5WMTIKdGhp
bmcgYWxyZWFkeSkuIFRoZW4gZHJpdmVycyBvbmx5IG5lZWQgdG8gZG8gYWRkaXRpb25hbCBjaGVj
a3Mgb24gdG9wIGZvcgp0aGVpciBzcGVjaWZpYyBjb25zdHJhaW50cy4gRm9yIHRoYXQgeW91IGNv
dWxkIGV4cG9zZSBzb21lIGhlbHBlcnMgb2ZjICh0bwpnZXQgdGhlIHBheWxvYWRfb2Zmc2V0IGFu
ZCBhbnl0aGluZyBlbHNlIGNvbXB1dGVkIHlvdSBtaWdodCBuZWVkKS4KCkJ1dCB0aGUgYmFzaWMg
ZHJtX2FmYmNfY2hlY2tfZmJfc2l6ZSgpIHNob3VsZCBpbW8gYmUgZG9uZSB1bmNvbmRpdGlvbmFs
bHkKZm9yIGFueSBhZmJjIG1vZGlmaWVyLiBUbyBtYWtlIHN1cmUgd2UgZG9uJ3QgaGF2ZSBsb3Rz
IG9mIGRyaXZlcnMgd2l0aApkaWZmZXJlbnQgYnVncyBpbiB0aGF0IHRoaW5nLgotRGFuaWVsCi0t
IApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRw
Oi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
