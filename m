Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C2D312E53
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 11:03:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E24E6E852;
	Mon,  8 Feb 2021 10:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0FF26E851;
 Mon,  8 Feb 2021 10:03:17 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id g10so17384414eds.2;
 Mon, 08 Feb 2021 02:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=17n/mfas5jUdVrVToKQiwBtrc03harx9CcUXQBUH3JI=;
 b=ibzdBsYF18TgtyOmwCXJzXhO2s4T/m2esXgusdraDK4i1hLMY2boMozx//JiyweSXC
 44vISmNN/cFe5ok3OYA/7MNMSDC0xV3cHq/jQMNSKF9xEy9YX4tsDjLV73TlYU6qNynY
 +fWQ7nny0+mlwAILrY74Zzbp8Xk4i/1aHo0C+jBFQkvRxb8sEMrCZTOo5TSvTreNy6zO
 CDl4etCASnzQIryQbaBPcSwhd8WMqG4gDNk2JX2YakUUJHeOB89AZdOBBkbBVuA5j0+6
 31Xt4uKNXIIOate0+Qa29QiztGuG2CJhQcTUrd3SpW5n58HskQWTobK92bQ8OEDHowxp
 xIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=17n/mfas5jUdVrVToKQiwBtrc03harx9CcUXQBUH3JI=;
 b=bnfH7+CY1+stCUQP7ecyrJdOsg6ZWsJ4O7OuNASaa0MKdSpgcX3qYNImYTlJbYe+gI
 ShuPvfB7xwv0P14X/t/PLw7F3kb/FXCLI9vLO4vW3Z5iEuVymXyMD3WV+/QM78S86O6S
 5cqSP1BsDKbW2frQuRuVnwcG9/YCUYnMX30u6revKyHEv0+Dj8VhshbAxEy67EQW9WyG
 2rPOL/v5PekZNWYUEBTrX2w1cfBMsPkrfwjfu4EFzMkrfjdAmACx2SH88Ue3rVFcbXlu
 lbxXj0CH0X0VdT9d1smV+jFyFP6iGGGPPGjol38m3/vm36QtDhnUfxk0N0WggUx5Y+Q8
 Shig==
X-Gm-Message-State: AOAM530egZD8GRo4MN3BDsIOByL1jruZMlgLG4XqXVbfeKQ5BFUJ///m
 bU7uc300pO0C+jfYLJ+hY2Q=
X-Google-Smtp-Source: ABdhPJyMrFyEZsa2+7ZMjRVpsHS3qxW1AgOGVSK+dV2gGUJxjZnUFqom47XoTdx/kOE6iMLhus6Wow==
X-Received: by 2002:a05:6402:22b0:: with SMTP id
 cx16mr8963710edb.255.1612778596631; 
 Mon, 08 Feb 2021 02:03:16 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id s12sm9063406edu.28.2021.02.08.02.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 02:03:16 -0800 (PST)
Subject: Re: [PATCH v4 11/14] drm/amdgpu: Guard against write accesses after
 device removal
To: Daniel Vetter <daniel@ffwll.ch>, christian.koenig@amd.com
References: <91b8ea73-aa69-1478-2e7c-63ab1cb250ae@gmail.com>
 <7834dbdf-27ad-f21d-b58b-2772a598ea8a@amd.com>
 <07dceec0-0be9-1531-0357-353f04d1cb2b@amd.com>
 <69f036e2-f102-8233-37f6-5254a484bf97@amd.com>
 <0b502043-5a66-dcd5-53f9-5c190f22dc46@gmail.com>
 <78e4705d-c55f-6c68-d0f9-b1939b636121@amd.com>
 <CAKMK7uEm=N4kQYyzMt=nUefu2BdyKNcWikFiSJih7CthJMd2Aw@mail.gmail.com>
 <8fbeee95-b365-7f68-1e0b-1d42eb0dea70@amd.com>
 <CAKMK7uEJDfPsbnkVfunjVe2iNbpVBWY2_XHai4JntcxWkuVc3A@mail.gmail.com>
 <fcb2cf17-d011-55c6-1545-9fa190e358c3@gmail.com>
 <YCEJBfA6ce4dD3JT@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6c639669-b78d-b6a3-71b9-d546ca34121b@gmail.com>
Date: Mon, 8 Feb 2021 11:03:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YCEJBfA6ce4dD3JT@phenom.ffwll.local>
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
Reply-To: christian.koenig@amd.com
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <Alexander.Deucher@amd.com>,
 Qiang Yu <yuq825@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMDIuMjEgdW0gMTA6NDggc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIE1vbiwgRmVi
IDA4LCAyMDIxIGF0IDEwOjM3OjE5QU0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDA3LjAyLjIxIHVtIDIyOjUwIHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+IFtTTklQXQo+
Pj4+IENsYXJpZmljYXRpb24gLSBhcyBmYXIgYXMgSSBrbm93IHRoZXJlIGFyZSBubyBwYWdlIGZh
dWx0IGhhbmRsZXJzIGZvciBrZXJuZWwKPj4+PiBtYXBwaW5ncy4gQW5kIHdlIGFyZSB0YWxraW5n
IGFib3V0IGtlcm5lbCBtYXBwaW5ncyBoZXJlLCByaWdodCA/ICBJZiB0aGVyZSB3ZXJlCj4+Pj4g
SSBjb3VsZCBzb2x2ZSBhbGwgdGhvc2UgaXNzdWVzIHRoZSBzYW1lIGFzIEkgZG8gZm9yIHVzZXIg
bWFwcGluZ3MsIGJ5Cj4+Pj4gaW52YWxpZGF0aW5nIGFsbCBleGlzdGluZyBtYXBwaW5ncyBpbiB0
aGUga2VybmVsIChib3RoIGttYXBzIGFuZCBpb3JlYW1wcylhbmQKPj4+PiBpbnNlcnQgZHVtbXkg
emVybyBvciB+MCBmaWxsZWQgcGFnZSBpbnN0ZWFkLgo+Pj4+IEFsc28sIEkgYXNzdW1lIGZvcmNl
ZnVsbHkgcmVtYXBwaW5nIHRoZSBJTyBCQVIgdG8gfjAgZmlsbGVkIHBhZ2Ugd291bGQgaW52b2x2
ZQo+Pj4+IGlvcmVtYXAgQVBJIGFuZCBpdCdzIG5vdCBzb21ldGhpbmcgdGhhdCBJIHRoaW5rIGNh
biBiZSBlYXNpbHkgZG9uZSBhY2NvcmRpbmcgdG8KPj4+PiBhbSBhbnN3ZXIgaSBnb3QgdG8gYSBy
ZWxhdGVkIHRvcGljIGEgZmV3IHdlZWtzIGFnbwo+Pj4+IGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0
L2xpc3RzL2xpbnV4LXBjaS9tc2cxMDMzOTYuaHRtbCAodGhhdCB3YXMgdGhlIG9ubHkgcmVwbHkK
Pj4+PiBpIGdvdCkKPj4+IG1taW90cmFjZSBjYW4sIGJ1dCBvbmx5IGZvciBkZWJ1ZywgYW5kIG9u
bHkgb24geDg2IHBsYXRmb3JtczoKPj4+Cj4+PiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9o
dG1sL2xhdGVzdC90cmFjZS9tbWlvdHJhY2UuaHRtbAo+Pj4KPj4+IFNob3VsZCBiZSBmZWFzaWJs
ZSAoYnV0IG1heWJlIG5vdCB3b3J0aCB0aGUgZWZmb3J0KSB0byBleHRlbmQgdGhpcyB0bwo+Pj4g
c3VwcG9ydCBmYWtlIHVucGx1Zy4KPj4gTWhtLCBpbnRlcmVzdGluZyBpZGVhIHlvdSBndXlzIGJy
b3VnaHQgdXAgaGVyZS4KPj4KPj4gV2UgZG9uJ3QgbmVlZCBhIHBhZ2UgZmF1bHQgZm9yIHRoaXMg
dG8gd29yaywgYWxsIHdlIG5lZWQgdG8gZG8gaXMgdG8gaW5zZXJ0Cj4+IGR1bW15IFBURXMgaW50
byB0aGUga2VybmVscyBwYWdlIHRhYmxlIGF0IHRoZSBwbGFjZSB3aGVyZSBwcmV2aW91c2x5IHRo
ZQo+PiBNTUlPIG1hcHBpbmcgaGFzIGJlZW4uCj4gU2ltcGx5IHB0ZSB0cmljayBpc24ndCBlbm91
Z2gsIGJlY2F1c2Ugd2UgbmVlZDoKPiAtIGRyb3AgYWxsIHdyaXRlcyBzaWxlbnRseQo+IC0gYWxs
IHJlYWRzIHJldHVybiAweGZmCj4KPiBwdGVzIGNhbid0IGRvIHRoYXQgdGhlbXNlbHZlcywgd2Ug
bWluaW1hbGx5IG5lZWQgd3JpdGUgcHJvdGVjdGlvbiBhbmQgdGhlbgo+IHNpbGVudGx5IHByb2Nl
ZWQgb24gZWFjaCB3cml0ZSBmYXVsdCB3aXRob3V0IHJlc3RhcnRpbmcgdGhlIGluc3RydWN0aW9u
Lgo+IEJldHRlciB3b3VsZCBiZSB0byBvbmx5IGNhdGNoIHJlYWRzLCBidXQgeDg2IGRvZXNuJ3Qg
ZG8gd3JpdGUtb25seSBwdGUKPiBwZXJtaXNzaW9ucyBhZmFpay4KCllvdSBhcmUgbm90IHRoaW5r
aW5nIGZhciBlbm91Z2ggOikKClRoZSBkdW1teSBQVEUgaXMgcG9pbnQgdG8gYSBkdW1teSBNTUlP
IHBhZ2Ugd2hpY2ggaXMganVzdCBuZXZlciB1c2VkLgoKVGhhdCBoYXN0IHRoZSBleGFjdCBzYW1l
IHByb3BlcnRpZXMgdGhhbiBvdXIgcmVtb3ZlZCBNTUlPIHNwYWNlIGp1c3QgCmRvZXNuJ3QgZ29l
cyBiYW5hbmFzIHdoZW4gYSBuZXcgZGV2aWNlIGlzIE1NSU8gbWFwcGVkIGludG8gdGhhdCBhbmQg
b3VyIApkcml2ZXIgc3RpbGwgdHJpZXMgdG8gd3JpdGUgdGhlcmUuCgpSZWdhcmRzLApDaHJpc3Rp
YW4uCgoKPgo+Pj4+PiBCdXQgdWdoIC4uLgo+Pj4+Pgo+Pj4+PiBPdG9oIHZhbGlkYXRpbmcgYW4g
ZW50aXJlIGRyaXZlciBsaWtlIGFtZGdwdSB3aXRob3V0IHN1Y2ggYSB0cmljawo+Pj4+PiBhZ2Fp
bnN0IDB4ZmYgcmVhZHMgaXMgcHJhY3RpY2FsbHkgaW1wb3NzaWJsZS4gU28gbWF5YmUgeW91IG5l
ZWQgdG8gYWRkCj4+Pj4+IHRoaXMgYXMgb25lIG9mIHRoZSB0YXNrcyBoZXJlPwo+Pj4+IE9yIEkg
Y291bGQganVzdCBmb3IgdmFsaWRhdGlvbiBwdXJwb3NlcyByZXR1cm4gfjAgZnJvbSBhbGwgcmVn
IHJlYWRzIGluIHRoZSBjb2RlCj4+Pj4gYW5kIGlnbm9yZSB3cml0ZXMgaWYgZHJtX2Rldl91bnBs
dWdnZWQsIHRoaXMgY291bGQgYWxyZWFkeSBlYXNpbHkgdmFsaWRhdGUgYSBiaWcKPj4+PiBwb3J0
aW9uIG9mIHRoZSBjb2RlIGZsb3cgdW5kZXIgc3VjaCBzY2VuYXJpby4KPj4+IEhtIHllYWggaWYg
eW91ciByZWFsbHkgd3JhcCB0aGVtIGFsbCwgdGhhdCBzaG91bGQgd29yayB0b28uIFNpbmNlCj4+
PiBpb21tYXBwaW5ncyBoYXZlIF9faW9tZW0gcG9pbnRlciB0eXBlLCBhcyBsb25nIGFzIGFtZGdw
dSBpcyBzcGFyc2UKPj4+IHdhcm5pbmcgZnJlZSwgc2hvdWxkIGJlIGRvYWJsZSB0byBndWFyYW50
ZWUgdGhpcy4KPj4gUHJvYmxlbSBpcyB0aGF0IH4wIGlzIG5vdCBhbHdheXMgYSB2YWxpZCByZWdp
c3RlciB2YWx1ZS4KPj4KPj4gWW91IHdvdWxkIG5lZWQgdG8gYXVkaXQgZXZlcnkgcmVnaXN0ZXIg
cmVhZCB0aGF0IGl0IGRvZXNuJ3QgdXNlIHRoZSByZXR1cm5lZAo+PiB2YWx1ZSBibGluZGx5IGFz
IGluZGV4IG9yIHNpbWlsYXIuIFRoYXQgaXMgcXVpdGUgYSBiaXQgb2Ygd29yay4KPiBZZWFoIHRo
YXQncyB0aGUgZW50aXJlIGNydXggaGVyZSA6LS8KPiAtRGFuaWVsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
