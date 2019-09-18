Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4AEB6019
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 11:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E596EE6E;
	Wed, 18 Sep 2019 09:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0EBD6EE6E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 09:28:02 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id g12so5965728eds.6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 02:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=yokuGHv9Aw8GeDl1ev2zMOKUni5FxRCnKw5gVBqhX28=;
 b=EyuvHlHY29HgiLXW/cusDurn8zjHcMQEm0B/HAm2FEEWWiER7St9yGDb+o93qCZQi+
 /ki6Vay7/HJQDMYibkfEBVDn4HwqVjY8xxbGysBAbQfrtzUIGzBovMgn0OAX6wisfKFD
 INiEKjpjjykTMFSFa8Hs515TVYoTNqZBLIVN7tOTx/W0q+Bg/SNMdkI0EoP/kyh1W/Lj
 Z74HEA6ja8TMANgimIcpTZOqWU842+aI44U/8sBAYIhjKJytnOzuq3mhD05mU7SS22FQ
 vbB5LuB/5ekY7nD+HV2/UTZlfJlFJMO01NZP6H0o8wlJEkBEljEywLaZl9DtDRWBD/mf
 GR/g==
X-Gm-Message-State: APjAAAUPkFCohbr4hpdZM1+PsTac/AstM+mOxkaZH35rFlbcAwZPiKWi
 jPN6fLWkkYLUvkl91pFOxrscmJ1UyKk=
X-Google-Smtp-Source: APXvYqyW3Kv0WgIMx/s/2CGPkuQwoPBCQEx/2lo6iTHGd4oX+vyBmm6aysfP9MjFhs+jB6f/y0+0WQ==
X-Received: by 2002:a05:6402:14da:: with SMTP id
 f26mr9134609edx.165.1568798881348; 
 Wed, 18 Sep 2019 02:28:01 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id b15sm935777edf.24.2019.09.18.02.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 02:28:00 -0700 (PDT)
Date: Wed, 18 Sep 2019 11:27:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH 1/2] drm/kms: Duct-tape for mode object lifetime checks
Message-ID: <20190918092758.GC3958@phenom.ffwll.local>
References: <20190917120936.7501-1-daniel.vetter@ffwll.ch>
 <5d194c3a-7224-bd0b-a967-050ef2dbd0a6@daenzer.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d194c3a-7224-bd0b-a967-050ef2dbd0a6@daenzer.net>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=yokuGHv9Aw8GeDl1ev2zMOKUni5FxRCnKw5gVBqhX28=;
 b=c+33gSAK/eEzA3PcabMoXMcAkCDaR/1muhi9HxdZ6tIxwNr4VN3dbnz98eKZO4T/ia
 LltBhctvdqqmbyw8EuZ4wfFB5hOTB6o3LP60JEAGIZ5kaNqUSin9NLoe7/N4Tk5OoTuu
 TOZPWdaIth+VgpsmEaiFFSS76Kh9g0GgAZovg=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>, DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMDQ6NDg6NTFQTSArMDIwMCwgTWljaGVsIETDpG56ZXIg
d3JvdGU6Cj4gT24gMjAxOS0wOS0xNyAyOjA5IHAubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4g
PiBjb21taXQgNGY1MzY4YjU1NDFhOTAyZjY1OTY1NThiMDVmNWMyMWE5NzcwZGQzMgo+ID4gQXV0
aG9yOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+ID4gRGF0ZTogICBG
cmkgSnVuIDE0IDA4OjE3OjIzIDIwMTkgKzAyMDAKPiA+IAo+ID4gICAgIGRybS9rbXM6IENhdGNo
IG1vZGVfb2JqZWN0IGxpZmV0aW1lIGVycm9ycwo+ID4gCj4gPiB1bmNvdmVyZWQgYSBiaXQgYSBt
ZXNzIGluIGRwIGRyaXZlcnMuIE1vc3QgZHJpdmVycyAoZnJvbSBhIHF1aWNrIGxvb2ssCj4gPiBh
bGwgZXhjZXB0IGk5MTUpIHJlZ2lzdGVyIGFsbCB0aGUgZHAgc3R1ZmYgaW4gdGhlaXIgaW5pdCBj
b2RlLCB3aGljaAo+ID4gaXMgdG9vIGVhcmx5LiBXaXRoIENPTkZJR19EUk1fRFBfQVVYX0NIQVJE
RVYgdGhpcyB3aWxsIGJsb3cgdXAsCj4gPiBiZWNhdXNlIGRybV9kcF9hdXhfcmVnaXN0ZXIgdHJp
ZXMgdG8gYWRkIGEgY2hpbGQgdG8gYSBkZXZpY2UgaW4gc3lzZnMKPiA+ICh0aGUgY29ubmVjdG9y
KSB3aGljaCBkb2Vzbid0IGV2ZW4gZXhpc3QgeWV0Lgo+ID4gCj4gPiBObyBvbmUgc2VlbXMgdG8g
aGF2ZSBjYXJlZCB0aHVzIGZhci4gQnV0IHdpdGggdGhlIGFib3ZlIGNoYW5nZSBJIGFsc28KPiA+
IG1vdmVkIHRoZSBzZXR0aW5nIG9mIGRldi0+cmVnaXN0ZXJlZCBhZnRlciB0aGUgLT5sb2FkIGNh
bGxiYWNrLCBpbiBhbgo+ID4gYXR0ZW1wdCB0byBrZWVwIG9sZCBkcml2ZXJzIGZyb20gaGl0dGlu
ZyBhbnkgV0FSTl9PTiBiYWNrdHJhY2VzLiBCdXQKPiA+IHRoYXQgbW92ZWQgcmFkZW9uLmtvIGZy
b20gdGhlICJ3b3JraW5nLCBieSBhY2NpZGVudCIgdG8gIm5vdyBhbHNvCj4gPiBicm9rZW4iIGNh
dGVnb3J5Lgo+ID4gCj4gPiBTaW5jZSB0aGlzIGlzIGEgaHVnZSBtZXNzIEkgZmlndXJlZCBhIHJl
dmVydCB3b3VsZCBiZSBzaW1wbGVzdC4gQnV0Cj4gPiB0aGlzIGNoZWNrIGhhcyBhbHJlYWR5IGNh
dWdodCBpc3N1ZXMgaW4gaTkxNToKPiA+IAo+ID4gY29tbWl0IDFiOWJkMDk2MzBkNGRiNDgyN2Nj
MDRkMzU4YTQxYTE2YTZiYzJjYjAKPiA+IEF1dGhvcjogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiA+IERhdGU6ICAgVHVlIEF1ZyAyMCAxOToxNjo1NyAy
MDE5ICswMzAwCj4gPiAKPiA+ICAgICBkcm0vaTkxNTogRG8gbm90IGNyZWF0ZSBhIG5ldyBtYXhf
YnBjIHByb3AgZm9yIE1TVCBjb25uZWN0b3JzCj4gPiAKPiA+IEhlbmNlIEknZCBsaWtlIHRvIHJl
dGFpbiBpdC4gRml4IHRoZSByYWRlb24gcmVncmVzc2lvbiBieSBtb3ZpbmcgdGhlCj4gPiBzZXR0
aW5nIG9mIGRldi0+cmVnaXN0ZXJlZCBiYWNrIHRvIHdlcmUgaXQgd2FzLCBhbmQgc3RvcCB0aGUK
PiA+IGJhY2t0cmFjZXMgd2l0aCBhbiBleHBsaWNpdCBjaGVjayBmb3IgZGV2LT5kcml2ZXItPmxv
YWQuCj4gPiAKPiA+IEV2ZXJ5b25lIGVsc2Ugd2lsbCBzdGF5IGFzIGJyb2tlbiB3aXRoIENPTkZJ
R19EUk1fRFBfQVVYX0NIQVJERVYuIFRoZQo+ID4gbmV4dCBwYXRjaCB3aWxsIGltcHJvdmUgdGhl
IGtlcm5lbGRvYyBhbmQgYWRkIGEgdG9kbyBlbnRyeSBmb3IgdGhpcy4KPiA+IAo+ID4gRml4ZXM6
IDRmNTM2OGI1NTQxYSAoImRybS9rbXM6IENhdGNoIG1vZGVfb2JqZWN0IGxpZmV0aW1lIGVycm9y
cyIpCj4gPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gPiBDYzogTWFhcnRlbiBM
YW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiA+IFJlcG9ydGVk
LWJ5OiBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRhZW56ZXIubmV0Pgo+ID4gQ2M6IE1pY2hlbCBE
w6RuemVyIDxtaWNoZWxAZGFlbnplci5uZXQ+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogTWljaGVsIETD
pG56ZXIgPG1kYWVuemVyQHJlZGhhdC5jb20+Cj4gVGVzdGVkLWJ5OiBNaWNoZWwgRMOkbnplciA8
bWRhZW56ZXJAcmVkaGF0LmNvbT4KClRoYW5rcywgbWVyZ2VkIGludG8gZHJtLW1pc2MtbmV4dC1m
aXhlcy4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwg
Q29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
