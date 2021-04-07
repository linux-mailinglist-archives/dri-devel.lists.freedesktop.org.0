Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FE9356DCC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 15:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60EB6E911;
	Wed,  7 Apr 2021 13:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11866E911
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 13:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617803443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ympeGng4bmk4O1vayGMy0VQZhpwmTOh5oPFU4qUo9mc=;
 b=E4GjVpWRG9NC0SJjdqdNhU/UsnWwFlGRXTpD4w1Zf2xYjDoySzMX1swIYAInVDZt3abEgE
 /4KHZBpkfdB3+tKsKEkrnf9fX49REzOEMWLEk+srZq4rWpXR4F1CIjQdNGZKiRoNvQ7sEp
 rDMRKUBgq15yuE0AxMjCicoL6/rm5Ps=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-99Upo87hPJSRH9Xt6GH_zw-1; Wed, 07 Apr 2021 09:50:37 -0400
X-MC-Unique: 99Upo87hPJSRH9Xt6GH_zw-1
Received: by mail-ej1-f72.google.com with SMTP id dv7so3938670ejb.22
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Apr 2021 06:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ympeGng4bmk4O1vayGMy0VQZhpwmTOh5oPFU4qUo9mc=;
 b=tjbWPM3uyseZiDNXghY+G7nxF+YjWKdueFayvoChRXOPyMAGZnWvImRKrNh6b92xZz
 9kIV2ZBzx4A3hC0KKow0MvdBQjMXx7dQrhSLwNaeMqAiX/WL7Leb5m6PbHVKqP4b4Cvm
 udly7esA83frgziPK8aqDn/r2g1FbUl1Qv5JZrlrf1GNuo2v7kWOev0Ni4lnItL76JWH
 cGFXNSquae1fTplkqsCscDBLkV/4oF5BWJ1a0u7LEbiPiOmvstEr0K9rXQCQBnfGiBzE
 CWDT7GodywbUoaYbhF3y1884ExSBq9y+yxmb4RAueP0PUvV8z3rCC3bQIJ0bbqy1A1to
 Bwjg==
X-Gm-Message-State: AOAM5330CJiGw0q7YrtTEHnVoD8PsLpl2/n55hjpAw0VDo74+gPFMhyP
 A11LOO7MOCtQaKFwNJwnQQe7nrn3q/ZrppfXGfEjAS1XupYbni0gpesVBlBdc073RlUa6iNMjGK
 n9a2lVLPrUy60q25ln1XFWsId7SAMJXCsAiP4tiqJCxbSIU875MXwTfIhWrlun+Is99aYRtQIBf
 hRmB+3
X-Received: by 2002:a17:906:b104:: with SMTP id
 u4mr3794311ejy.211.1617803436296; 
 Wed, 07 Apr 2021 06:50:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwUvbVSs8bMaP6ParWs7CDpqkyDxQCgIa/2OpeDESywCzKWbdT/aCEr6ekKKNYGhXR05gKHA==
X-Received: by 2002:a17:906:b104:: with SMTP id
 u4mr3794279ejy.211.1617803436036; 
 Wed, 07 Apr 2021 06:50:36 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id jt18sm6493521ejc.96.2021.04.07.06.50.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 06:50:35 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/i915/display/vlv_dsi: Do not skip
 panel_pwr_cycle_delay when disabling the panel
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20210325114823.44922-1-hdegoede@redhat.com>
 <9cb6711d-d183-79d4-dfc1-d932b8c8fcab@redhat.com>
 <YG2mzs+/wZ5cH+7M@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <5f54a568-c81a-a54c-cbaf-2c111269c046@redhat.com>
Date: Wed, 7 Apr 2021 15:50:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YG2mzs+/wZ5cH+7M@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiA0LzcvMjEgMjozNCBQTSwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+IE9uIFR1ZSwg
QXByIDA2LCAyMDIxIGF0IDAzOjU3OjMyUE0gKzAyMDAsIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4+
IEhpLAo+Pgo+PiBPbiAzLzI1LzIxIDEyOjQ4IFBNLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+Pj4g
QWZ0ZXIgdGhlIHJlY2VudGx5IGFkZGVkIGNvbW1pdCBmZTBmMWUzYmZkZmUgKCJkcm0vaTkxNTog
U2h1dCBkb3duCj4+PiBkaXNwbGF5cyBncmFjZWZ1bGx5IG9uIHJlYm9vdCIpLCB0aGUgRFNJIHBh
bmVsIG9uIGEgQ2hlcnJ5IFRyYWlsIGJhc2VkCj4+PiBQcmVkaWEgQmFzaWMgdGFibGV0IHdvdWxk
IG5vIGxvbmdlciBwcm9wZXJseSBsaWdodCB1cCBhZnRlciByZWJvb3QuCj4+Pgo+Pj4gSSd2ZSBt
YW5hZ2VkIHRvIHJlcHJvZHVjZSB0aGlzIHdpdGhvdXQgcmVib290aW5nIGJ5IGRvaW5nOgo+Pj4g
Y2h2dCAzOyBlY2hvIDEgPiAvc3lzL2NsYXNzL2dyYXBoaWNzL2ZiMC9ibGFuaztcCj4+PiBlY2hv
IDAgPiAvc3lzL2NsYXNzL2dyYXBoaWNzL2ZiMC9ibGFuawo+Pj4KPj4+IFdoaWNoIHJhcGlkbHkg
dHVybnMgdGhlIHBhbmVsIG9mZiBhbmQgYmFjayBvbiBhZ2Fpbi4KPj4+Cj4+PiBUaGUgdmx2X2Rz
aS5jIGNvZGUgdXNlcyBhbiBpbnRlbF9kc2lfbXNsZWVwKCkgaGVscGVyIGZvciB0aGUgdmFyaW91
cyBkZWxheXMKPj4+IHVzZWQgZm9yIHBhbmVsIG9uL29mZiwgc2luY2Ugc3RhcnRpbmcgd2l0aCBN
SVBJLXNlcXVlbmNlcyB2ZXJzaW9uID49IDMgdGhlCj4+PiBkZWxheXMgYXJlIGFscmVhZHkgaW5j
bHVkZWQgaW5zaWRlIHRoZSBNSVBJLXNlcXVlbmNlcy4KPj4+Cj4+PiBUaGUgcHJvYmxlbXMgZXhw
b3NlZCBieSB0aGUgIlNodXQgZG93biBkaXNwbGF5cyBncmFjZWZ1bGx5IG9uIHJlYm9vdCIKPj4+
IGNoYW5nZSwgc2hvdyB0aGF0IHVzaW5nIHRoaXMgaGVscGVyIGZvciB0aGUgcGFuZWxfcHdyX2N5
Y2xlX2RlbGF5IGlzCj4+PiBub3QgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLiBUaGlzIGhhcyBub3Qg
YmVlbiBub3RpY2VkIHVudGlsIG5vdyBiZWNhdXNlCj4+PiBub3JtYWxseSB0aGUgcGFuZWwgbmV2
ZXIgaXMgY3ljbGVkIG9mZiBhbmQgZGlyZWN0bHkgb24gYWdhaW4gaW4gcXVpY2sKPj4+IHN1Y2Nl
c3Npb24uCj4+Pgo+Pj4gQ2hhbmdlIHRoZSBtc2xlZXAgZm9yIHRoZSBwYW5lbF9wd3JfY3ljbGVf
ZGVsYXkgdG8gYSBub3JtYWwgbXNsZWVwKCkKPj4+IGNhbGwgdG8gYXZvaWQgdGhlIHBhbmVsIHN0
YXlpbmcgYmxhY2sgYWZ0ZXIgYSBxdWljayBvZmYgKyBvbiBjeWNsZS4KPj4+Cj4+PiBDYzogVmls
bGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPj4+IEZpeGVzOiBm
ZTBmMWUzYmZkZmUgKCJkcm0vaTkxNTogU2h1dCBkb3duIGRpc3BsYXlzIGdyYWNlZnVsbHkgb24g
cmVib290IikKPj4+IFNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhh
dC5jb20+Cj4+Cj4+IFBpbmc/IFZpbGxlIEFGQUlDVCB0aGlzIGlzIHJlYWR5IGZvciBtZXJnaW5n
LCBjYW4geW91IHJldmlldyB0aGlzIHBsZWFzZSBzbyB0aGF0IEkgY2FuIHB1c2ggaXQgdG8gZHJt
LWludGVsLW5leHQgPwo+IAo+IERpZG4ndCBnZXQgdGhlIG9yaWdpbmFsIG1haWwsIGJ1dCBsZ3Rt
LgoKWWVhaCwgdGhlc2UgYm91bmNlZCBJIG1lbnRpb25lZCB0aGF0IGluIGEgcC5zLiBpbiBvbmUg
b2YgdGhlIGVtYWlscwppbiBvdXIgcHJpdmF0ZSB0aHJlYWRzIGFib3V0IHRoZSBtYWlsIGlzc3Vl
cywgd2l0aCBwYXRjaHdvcmsgbGlua3MsCmJ1dCBJIGd1ZXNzIHRoZSBwLnMuIHdhcyBoaWRkZW4g
aW4gYWxsIHRoZSBvdGhlciBzdHVmZiBpbiB0aGF0IHRocmVhZC4KQW55d2F5cyB0aGlzIGlzIHNv
bHZlZCBub3cuCgo+IFJldmlld2VkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFA
bGludXguaW50ZWwuY29tPgoKVGhhbmsgeW91LCBub3RlIHRoaXMgaXMgcGF0Y2ggMS8yIGRvZXMg
dGhlIFJldmlld2VkLWJ5IGFwcGx5IHRvCmJvdGg/ICBQYXRjaCAyLzIgaXMgaGVyZToKCmh0dHBz
Oi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC80MjU5ODMvCgpSZWdhcmRzLAoKSGFu
cwoKCgoKPj4+IC0tLQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvdmx2X2RzaS5j
IHwgNCArKy0tCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS92
bHZfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3Zsdl9kc2kuYwo+Pj4gaW5k
ZXggZDVhM2Y2OWM1ZGYzLi4zOGQ1YTFmM2RlZDUgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L3Zsdl9kc2kuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS92bHZfZHNpLmMKPj4+IEBAIC05OTYsMTQgKzk5NiwxNCBAQCBzdGF0aWMgdm9p
ZCBpbnRlbF9kc2lfcG9zdF9kaXNhYmxlKHN0cnVjdCBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRl
LAo+Pj4gIAkgKiBGSVhNRSBBcyB3ZSBkbyB3aXRoIGVEUCwganVzdCBtYWtlIGEgbm90ZSBvZiB0
aGUgdGltZSBoZXJlCj4+PiAgCSAqIGFuZCBwZXJmb3JtIHRoZSB3YWl0IGJlZm9yZSB0aGUgbmV4
dCBwYW5lbCBwb3dlciBvbi4KPj4+ICAJICovCj4+PiAtCWludGVsX2RzaV9tc2xlZXAoaW50ZWxf
ZHNpLCBpbnRlbF9kc2ktPnBhbmVsX3B3cl9jeWNsZV9kZWxheSk7Cj4+PiArCW1zbGVlcChpbnRl
bF9kc2ktPnBhbmVsX3B3cl9jeWNsZV9kZWxheSk7Cj4+PiAgfQo+Pj4gIAo+Pj4gIHN0YXRpYyB2
b2lkIGludGVsX2RzaV9zaHV0ZG93bihzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2RlcikKPj4+
ICB7Cj4+PiAgCXN0cnVjdCBpbnRlbF9kc2kgKmludGVsX2RzaSA9IGVuY190b19pbnRlbF9kc2ko
ZW5jb2Rlcik7Cj4+PiAgCj4+PiAtCWludGVsX2RzaV9tc2xlZXAoaW50ZWxfZHNpLCBpbnRlbF9k
c2ktPnBhbmVsX3B3cl9jeWNsZV9kZWxheSk7Cj4+PiArCW1zbGVlcChpbnRlbF9kc2ktPnBhbmVs
X3B3cl9jeWNsZV9kZWxheSk7Cj4+PiAgfQo+Pj4gIAo+Pj4gIHN0YXRpYyBib29sIGludGVsX2Rz
aV9nZXRfaHdfc3RhdGUoc3RydWN0IGludGVsX2VuY29kZXIgKmVuY29kZXIsCj4+Pgo+IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
