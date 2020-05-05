Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4788E1C514B
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 10:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12A16E588;
	Tue,  5 May 2020 08:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0416E573
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:51:51 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k1so1678788wro.12
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 01:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=T87EAHnU6d/aEcc9kDIRejNNG+CQtK0nds65OFUdB2k=;
 b=GT3MqCeICZy9CIyFOHqZX6Yg1scVFmfTnRXXaIbRCeHkJi27McjD5e/cKji1EmM1KG
 LgWFDNXuxeo0Jwy/n2dN9jf0QvEjkOjdMv9zxxr0aQzAJCISnc19CL1lbe/noiLO+hMm
 nU1cRCbxcD5mB2F8u6iC2iItkHLL101ca+G1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=T87EAHnU6d/aEcc9kDIRejNNG+CQtK0nds65OFUdB2k=;
 b=K8OZnSr52NgspDJWCk2LosZo+ANbJH5Wc+/OyiPSWWPKIH9Nxd7KTULKt/By9vBQNi
 eSPmWsaSCkoGJOhRMrFl5wa1HDyxRgMochJONP2KvAfeMIy0rwjnoa76R1Xt2SKiKXgF
 ubmyJMhRAW3fkbIS0aO5UpbthdxM2CZyCQu5yHT7N8YAQHKQjniT/IqWxgYtZHYEuz6h
 L9xWt8KFSvC5gQkccnXZONyLkOMmHuOGNlhINzCuKczEEPNsO3pjChehCyO4BCa9fcF/
 K+3sa12RavEvHqtnoftnZ5/1kj++QHNut23GAd8uKhV/nlur5wxIxZffzCD0hEckOGHV
 bCjg==
X-Gm-Message-State: AGi0Pub2uugEkvcLePRhC13CCGy3cPqlqftrZL41wJnFDljv9lVJU41/
 KbCMP98QFW9OAlW4Xv/fRcXaew==
X-Google-Smtp-Source: APiQypJ/7dWmhTleTJb1e+uEQs+IDM+5Y28bUPpZv6ui0LiLo5rBrMnqYRgGLsaow0hto3La+k2gVg==
X-Received: by 2002:a5d:494a:: with SMTP id r10mr2300695wrs.136.1588668709915; 
 Tue, 05 May 2020 01:51:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q184sm2623921wma.25.2020.05.05.01.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 01:51:48 -0700 (PDT)
Date: Tue, 5 May 2020 10:51:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: =?utf-8?B?TWljaGHFgiBPcnplxYI=?= <michalorzel.eng@gmail.com>
Subject: Re: [PATCH] drm: Replace drm_modeset_lock/unlock_all with
 DRM_MODESET_LOCK_ALL_* helpers
Message-ID: <20200505085147.GO10381@phenom.ffwll.local>
Mail-Followup-To: =?utf-8?B?TWljaGHFgiBPcnplxYI=?= <michalorzel.eng@gmail.com>, 
 Sean Paul <seanpaul@chromium.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <1588093804-30446-1-git-send-email-michalorzel.eng@gmail.com>
 <875zdiacv2.fsf@intel.com>
 <CAOw6vbK69aWzti9a7MXNmAfVfJXzzC5g74p4ukSE49MhaV_b3g@mail.gmail.com>
 <CAKMK7uEzTn2nKyEaxMcd6602tprwkdnBrmrFYO+_Hi7FY39jAw@mail.gmail.com>
 <520d517e-5e8f-a6c7-1c8a-38d1a368a79f@gmail.com>
 <20200504115309.GJ10381@phenom.ffwll.local>
 <9cd2487b-c6a8-b057-e53c-b3dd1e7141aa@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9cd2487b-c6a8-b057-e53c-b3dd1e7141aa@gmail.com>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMDUsIDIwMjAgYXQgMDc6NTU6MDBBTSArMDIwMCwgTWljaGHFgiBPcnplxYIg
d3JvdGU6Cj4gCj4gCj4gT24gMDQuMDUuMjAyMCAxMzo1MywgRGFuaWVsIFZldHRlciB3cm90ZToK
PiA+IE9uIEZyaSwgTWF5IDAxLCAyMDIwIGF0IDA1OjQ5OjMzUE0gKzAyMDAsIE1pY2hhxYIgT3J6
ZcWCIHdyb3RlOgo+ID4+Cj4gPj4KPiA+PiBPbiAzMC4wNC4yMDIwIDIwOjMwLCBEYW5pZWwgVmV0
dGVyIHdyb3RlOgo+ID4+PiBPbiBUaHUsIEFwciAzMCwgMjAyMCBhdCA1OjM4IFBNIFNlYW4gUGF1
bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPiB3cm90ZToKPiA+Pj4+Cj4gPj4+PiBPbiBXZWQsIEFw
ciAyOSwgMjAyMCBhdCA0OjU3IEFNIEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRl
bC5jb20+IHdyb3RlOgo+ID4+Pj4+Cj4gPj4+Pj4gT24gVHVlLCAyOCBBcHIgMjAyMCwgTWljaGFs
IE9yemVsIDxtaWNoYWxvcnplbC5lbmdAZ21haWwuY29tPiB3cm90ZToKPiA+Pj4+Pj4gQXMgc3Vn
Z2VzdGVkIGJ5IHRoZSBUT0RPIGxpc3QgZm9yIHRoZSBrZXJuZWwgRFJNIHN1YnN5c3RlbSwgcmVw
bGFjZQo+ID4+Pj4+PiB0aGUgZGVwcmVjYXRlZCBmdW5jdGlvbnMgdGhhdCB0YWtlL2Ryb3AgbW9k
ZXNldCBsb2NrcyB3aXRoIG5ldyBoZWxwZXJzLgo+ID4+Pj4+Pgo+ID4+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBNaWNoYWwgT3J6ZWwgPG1pY2hhbG9yemVsLmVuZ0BnbWFpbC5jb20+Cj4gPj4+Pj4+IC0t
LQo+ID4+Pj4+PiAgZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX29iamVjdC5jIHwgMTAgKysrKysr
LS0tLQo+ID4+Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKPiA+Pj4+Pj4KPiA+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
bW9kZV9vYmplY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9vYmplY3QuYwo+ID4+Pj4+
PiBpbmRleCAzNWMyNzE5Li45MDFiMDc4IDEwMDY0NAo+ID4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX21vZGVfb2JqZWN0LmMKPiA+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9tb2RlX29iamVjdC5jCj4gPj4+Pj4+IEBAIC00MDIsMTIgKzQwMiwxMyBAQCBpbnQgZHJtX21v
ZGVfb2JqX2dldF9wcm9wZXJ0aWVzX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQg
KmRhdGEsCj4gPj4+Pj4+ICB7Cj4gPj4+Pj4+ICAgICAgIHN0cnVjdCBkcm1fbW9kZV9vYmpfZ2V0
X3Byb3BlcnRpZXMgKmFyZyA9IGRhdGE7Cj4gPj4+Pj4+ICAgICAgIHN0cnVjdCBkcm1fbW9kZV9v
YmplY3QgKm9iajsKPiA+Pj4+Pj4gKyAgICAgc3RydWN0IGRybV9tb2Rlc2V0X2FjcXVpcmVfY3R4
IGN0eDsKPiA+Pj4+Pj4gICAgICAgaW50IHJldCA9IDA7Cj4gPj4+Pj4+Cj4gPj4+Pj4+ICAgICAg
IGlmICghZHJtX2NvcmVfY2hlY2tfZmVhdHVyZShkZXYsIERSSVZFUl9NT0RFU0VUKSkKPiA+Pj4+
Pj4gICAgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4gPj4+Pj4+Cj4gPj4+Pj4+IC0g
ICAgIGRybV9tb2Rlc2V0X2xvY2tfYWxsKGRldik7Cj4gPj4+Pj4+ICsgICAgIERSTV9NT0RFU0VU
X0xPQ0tfQUxMX0JFR0lOKGRldiwgY3R4LCAwLCByZXQpOwo+ID4+Pj4+Cj4gPj4+Pj4gSSBjcnkg
YSBsaXR0bGUgZXZlcnkgdGltZSBJIGxvb2sgYXQgdGhlIERSTV9NT0RFU0VUX0xPQ0tfQUxMX0JF
R0lOIGFuZAo+ID4+Pj4+IERSTV9NT0RFU0VUX0xPQ0tfQUxMX0VORCBtYWNyb3MuIDooCj4gPj4+
Pj4KPiA+Pj4+PiBDdXJyZW50bHkgb25seSBzaXggdXNlcnMuLi4gYnV0IHRoZXJlIGFyZSB+NjAg
Y2FsbHMgdG8KPiA+Pj4+PiBkcm1fbW9kZXNldF9sb2NrX2FsbHssX2N0eH0gdGhhdCBJIHByZXN1
bWUgYXJlIHRvIGJlIHJlcGxhY2VkLiBJIHdvbmRlcgo+ID4+Pj4+IGlmIHRoaXMgd2lsbCBjb21l
IGJhY2sgYW5kIGhhdW50IHVzLgo+ID4+Pj4+Cj4gPj4+Pgo+ID4+Pj4gV2hhdCdzIHRoZSBhbHRl
cm5hdGl2ZT8gU2VlbXMgbGlrZSB0aGUgb3B0aW9ucyB3aXRob3V0IHRoZSBtYWNyb3MgaXMKPiA+
Pj4+IHRvIHVzZSBpbmNvcnJlY3Qgc2NvcGUgb3IgaGF2ZSBhIGJ1bmNoIG9mIHJldHJ5L2JhY2tv
ZmYgY2FyZ28tY3VsdAo+ID4+Pj4gZXZlcnl3aGVyZSAoYW5kIGhvcGUgdGhlIGNvcHkgc291cmNl
IGlzIGRvbmUgY29ycmVjdGx5KS4KPiA+Pj4KPiA+Pj4gWWVhaCBTZWFuICYgbWUgaGFkIGEgYnVu
Y2ggb2YgYmlrZXNoZWRzIGFuZCB0aGlzIGlzIHRoZSBsZWFzdCB3b3JzdAo+ID4+PiBvcHRpb24g
d2UgY291bGQgY29tZSB1cCB3aXRoLiBZb3UgY2FuJ3QgbWFrZSBpdCBhIGZ1bmN0aW9uIGJlY2F1
c2Ugb2YKPiA+Pj4gdGhlIGNvbnRyb2wgZmxvdy4gWW91IGRvbid0IHdhbnQgdG8gb3BlbiBjb2Rl
IHRoaXMgYmVjYXVzZSBpdCdzIHRyaWNreQo+ID4+PiB0byBnZXQgcmlnaHQsIGlmIGFsbCB5b3Ug
d2FudCBpcyB0byBqdXN0IGdyYWIgYWxsIGxvY2tzLiBCdXQgaXQgaXMKPiA+Pj4gbWFnaWMgaGlk
ZGVuIGJlaGluZCBhIG1hY3JvLCB3aGljaCBvY2Nhc2lvbmFsbHkgZW5kcyB1cCBodXJ0aW5nLgo+
ID4+PiAtRGFuaWVsCj4gPj4gU28gd2hhdCBhcmUgd2UgZG9pbmcgd2l0aCB0aGlzIHByb2JsZW0/
IFNob3VsZCB3ZSByZXBsYWNlIGF0IG9uY2UgYXBwcm94LiA2MCBjYWxscz8KPiA+IAo+ID4gSSdt
IGNvbmZ1c2VkIGJ5IHlvdXIgcXVlc3Rpb24gLSBkcmFkdWFsIGNvbnZlcnNpb24gaXMgZW50aXJl
bHkgb3J0aG9nb25hbAo+ID4gdG8gd2hhdCBleGFjdGx5IHdlJ3JlIGNvbnZlcnRpbmcgdG9vLiBB
bGwgSSBhZGRlZCBoZXJlIGlzIHRoYXQgd2UndmUKPiA+IGRpc2N1c3NlZCB0aGlzIGF0IGxlbmd0
aCwgYW5kIHRoZSBtYWNybyBpcyB0aGUgYmVzdCB0aGluZyB3ZSd2ZSBjb21lIHVwCj4gPiB3aXRo
LiBJIHN0aWxsIHRoaW5rIGl0J3MgdGhlIGJlc3QgY29tcHJvbWlzZS4KPiA+IAo+ID4gRmxhZy1k
YXkgY29udmVyc2lvbiBmb3Igb3ZlciA2MCBjYWxscyBkb2Vzbid0IHdvcmssIG5vIG1hdHRlciB3
aGF0Lgo+ID4gLURhbmllbAo+ID4gCj4gSSBhZ3JlZSB3aXRoIHRoYXQuIEFsbCBJIHdhbnRlZCB0
byBhc2sgd2FzIHdoZXRoZXIgSSBzaG91bGQgYWRkIHNvbWV0aGluZyBhZGRpdGlvbmFsIHRvIHRo
aXMgcGF0Y2ggb3Igbm90LgoKUGF0Y2ggbG9va3MgZ29vZCBhbmQgcGFzc2VkIENJLCBzbyBJIHdl
bnQgYWhlYWQgYW5kIGFwcGxpZWQgaXQuCgpUaGFua3MsIERhbmllbAoKPiAKPiBUaGFua3MsCj4g
TWljaGFsCj4gPj4KPiA+PiBNaWNoYWwKPiA+Pj4KPiA+Pj4+IFNlYW4KPiA+Pj4+Cj4gPj4+Pj4g
QlIsCj4gPj4+Pj4gSmFuaS4KPiA+Pj4+Pgo+ID4+Pj4+Cj4gPj4+Pj4+Cj4gPj4+Pj4+ICAgICAg
IG9iaiA9IGRybV9tb2RlX29iamVjdF9maW5kKGRldiwgZmlsZV9wcml2LCBhcmctPm9ial9pZCwg
YXJnLT5vYmpfdHlwZSk7Cj4gPj4+Pj4+ICAgICAgIGlmICghb2JqKSB7Cj4gPj4+Pj4+IEBAIC00
MjcsNyArNDI4LDcgQEAgaW50IGRybV9tb2RlX29ial9nZXRfcHJvcGVydGllc19pb2N0bChzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAo+ID4+Pj4+PiAgb3V0X3VucmVmOgo+ID4+
Pj4+PiAgICAgICBkcm1fbW9kZV9vYmplY3RfcHV0KG9iaik7Cj4gPj4+Pj4+ICBvdXQ6Cj4gPj4+
Pj4+IC0gICAgIGRybV9tb2Rlc2V0X3VubG9ja19hbGwoZGV2KTsKPiA+Pj4+Pj4gKyAgICAgRFJN
X01PREVTRVRfTE9DS19BTExfRU5EKGN0eCwgcmV0KTsKPiA+Pj4+Pj4gICAgICAgcmV0dXJuIHJl
dDsKPiA+Pj4+Pj4gIH0KPiA+Pj4+Pj4KPiA+Pj4+Pj4gQEAgLTQ0OSwxMiArNDUwLDEzIEBAIHN0
YXRpYyBpbnQgc2V0X3Byb3BlcnR5X2xlZ2FjeShzdHJ1Y3QgZHJtX21vZGVfb2JqZWN0ICpvYmos
Cj4gPj4+Pj4+ICB7Cj4gPj4+Pj4+ICAgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBwcm9w
LT5kZXY7Cj4gPj4+Pj4+ICAgICAgIHN0cnVjdCBkcm1fbW9kZV9vYmplY3QgKnJlZjsKPiA+Pj4+
Pj4gKyAgICAgc3RydWN0IGRybV9tb2Rlc2V0X2FjcXVpcmVfY3R4IGN0eDsKPiA+Pj4+Pj4gICAg
ICAgaW50IHJldCA9IC1FSU5WQUw7Cj4gPj4+Pj4+Cj4gPj4+Pj4+ICAgICAgIGlmICghZHJtX3By
b3BlcnR5X2NoYW5nZV92YWxpZF9nZXQocHJvcCwgcHJvcF92YWx1ZSwgJnJlZikpCj4gPj4+Pj4+
ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPj4+Pj4+Cj4gPj4+Pj4+IC0gICAgIGRy
bV9tb2Rlc2V0X2xvY2tfYWxsKGRldik7Cj4gPj4+Pj4+ICsgICAgIERSTV9NT0RFU0VUX0xPQ0tf
QUxMX0JFR0lOKGRldiwgY3R4LCAwLCByZXQpOwo+ID4+Pj4+PiAgICAgICBzd2l0Y2ggKG9iai0+
dHlwZSkgewo+ID4+Pj4+PiAgICAgICBjYXNlIERSTV9NT0RFX09CSkVDVF9DT05ORUNUT1I6Cj4g
Pj4+Pj4+ICAgICAgICAgICAgICAgcmV0ID0gZHJtX2Nvbm5lY3Rvcl9zZXRfb2JqX3Byb3Aob2Jq
LCBwcm9wLCBwcm9wX3ZhbHVlKTsKPiA+Pj4+Pj4gQEAgLTQ2OCw3ICs0NzAsNyBAQCBzdGF0aWMg
aW50IHNldF9wcm9wZXJ0eV9sZWdhY3koc3RydWN0IGRybV9tb2RlX29iamVjdCAqb2JqLAo+ID4+
Pj4+PiAgICAgICAgICAgICAgIGJyZWFrOwo+ID4+Pj4+PiAgICAgICB9Cj4gPj4+Pj4+ICAgICAg
IGRybV9wcm9wZXJ0eV9jaGFuZ2VfdmFsaWRfcHV0KHByb3AsIHJlZik7Cj4gPj4+Pj4+IC0gICAg
IGRybV9tb2Rlc2V0X3VubG9ja19hbGwoZGV2KTsKPiA+Pj4+Pj4gKyAgICAgRFJNX01PREVTRVRf
TE9DS19BTExfRU5EKGN0eCwgcmV0KTsKPiA+Pj4+Pj4KPiA+Pj4+Pj4gICAgICAgcmV0dXJuIHJl
dDsKPiA+Pj4+Pj4gIH0KPiA+Pj4+Pgo+ID4+Pj4+IC0tCj4gPj4+Pj4gSmFuaSBOaWt1bGEsIElu
dGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgo+ID4+Pgo+ID4+Pgo+ID4+Pgo+ID4gCgot
LSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0
cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
