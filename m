Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F8B680FB
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jul 2019 21:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37DA898D9;
	Sun, 14 Jul 2019 19:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D761889453
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2019 16:41:31 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id v24so12222855ljg.13
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2019 09:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sArqflmNJL+RuIvVxOB3J3vY2wGnGuNw/7ZgLpl13so=;
 b=GZM/v4DlnST791GMMwVwC2hy9vk2trxjeZPAI4QJF1ue+gryHNyHG0qD5G+iqxie9N
 q5PF3Mad6VcZK7AY7+NrBEZvd9fCz6L1IFNeuRkvhLdbbRtqxueVGk6PlO+cw0A5HQdh
 lrQlQyOTg9l8Fs6i0yr7OUjOJHxsijgA6uzX6YNeT8oDbjH9HsJQH2UarOqVuJWmM5km
 K1yINVcMY9NOK33oneM1HuJk/2Cv/hGo72rlpeOEQQ4ENuQY8neK1NTY+1oHgHxhmdzu
 bKmDAalUGcnbYC+MiuKmXv12YpcDbbzJp5D5A3ZxcPgR1yrwpAwpaz13UZ6qSS65BfAZ
 OrbA==
X-Gm-Message-State: APjAAAWAY1te+gsVFKMRQPQauIMA9H7joqwexaZ+rNwsOLr1Ty5LKocR
 ag5exGLUOP1qU7hP94EXNew=
X-Google-Smtp-Source: APXvYqx8YN8a/gM70ryG83VKWW3fbsd0+C9KTsRG1W1isB+V4NfNP9ER91GQVjoHUyftaEEaOWJL3A==
X-Received: by 2002:a2e:6348:: with SMTP id x69mr9311816ljb.186.1563036090359; 
 Sat, 13 Jul 2019 09:41:30 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru.
 [79.139.233.208])
 by smtp.googlemail.com with ESMTPSA id b17sm2061980ljf.34.2019.07.13.09.41.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 13 Jul 2019 09:41:29 -0700 (PDT)
Subject: Re: [PATCH v1] drm/modes: Skip invalid cmdline mode
To: Maxime Ripard <maxime.ripard@bootlin.com>
References: <f530844d-70f2-c3cc-d5f6-b435f1dbdfd2@gmail.com>
 <20190710130615.gvi2jwgr2cds66xr@flea>
 <75719cad-c65c-7ebc-3ea8-98134f86ddc3@gmail.com>
 <4a13f12f-05a7-473e-4e4e-7a7e32d09720@gmail.com>
 <20190710140504.t5lsk36gnn5cdn6b@flea>
 <e7d78307-4a48-45b1-ffbe-bc397fec0e40@gmail.com>
 <20190711090327.keuxt2ztfqecdbef@flea>
 <de21fe78-87a6-741f-caf7-2771f6468739@gmail.com>
 <20190712081027.arybdoxr6nzrmkxt@flea>
 <686a20ce-e09a-037c-a5db-bd1309790c3e@gmail.com>
 <20190712195336.zgn5mseyfba2lfu7@flea>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <523f1d21-333d-dd0f-c5fa-9a2a950d8bed@gmail.com>
Date: Sat, 13 Jul 2019 19:41:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190712195336.zgn5mseyfba2lfu7@flea>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 14 Jul 2019 19:16:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sArqflmNJL+RuIvVxOB3J3vY2wGnGuNw/7ZgLpl13so=;
 b=devoeaMsOdiMqtIGKbsamYRcofxr5w6ek26oEfoD77/0Bc1QktLVOhmIRyH/FU4lL0
 UmSTKR3FhWr+piAfw7c8FVf4kL10PnB6GMdc6I3Ih4AvZR3i70OKX/I6HGAI7LSOv4kN
 vFqZVQ7fJD4v/Hfwh2gy9dRjN1Y2xcrb6UjsTmunOmPsGmqtZxIpLMZVakc6ogGIpWjq
 q13pGG5YpXYDSxHi7gBAvZ6u266k4VDU/S8B2X/fg/X5lCe4XNNP1GrsyYyAbwKKA+lr
 hOd9FGBJv9YCzyYgHQoklmc8/d5pbZcxSif22u5rAKXGp9gugenwmFm0uXQPjv+jQ7yI
 XHWg==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTIuMDcuMjAxOSAyMjo1MywgTWF4aW1lIFJpcGFyZCDQv9C40YjQtdGCOgo+IE9uIEZyaSwgSnVs
IDEyLCAyMDE5IGF0IDExOjMwOjAxQU0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4g
MTIuMDcuMjAxOSAxMToxMCwgTWF4aW1lIFJpcGFyZCDQv9C40YjQtdGCOgo+Pj4gT24gVGh1LCBK
dWwgMTEsIDIwMTkgYXQgMDY6NTU6MDNQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+
Pj4+IDExLjA3LjIwMTkgMTI6MDMsIE1heGltZSBSaXBhcmQg0L/QuNGI0LXRgjoKPj4+Pj4gT24g
V2VkLCBKdWwgMTAsIDIwMTkgYXQgMDY6MDU6MThQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdy
b3RlOgo+Pj4+Pj4gMTAuMDcuMjAxOSAxNzowNSwgTWF4aW1lIFJpcGFyZCDQv9C40YjQtdGCOgo+
Pj4+Pj4+IE9uIFdlZCwgSnVsIDEwLCAyMDE5IGF0IDA0OjI5OjE5UE0gKzAzMDAsIERtaXRyeSBP
c2lwZW5rbyB3cm90ZToKPj4+Pj4+Pj4gVGhpcyB3b3JrczoKPj4+Pj4+Pj4KPj4+Pj4+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYwo+Pj4+Pj4+PiBpbmRleCA1NmQzNjc3OWQyMTMu
LmU1YTJmOWM4ZjQwNCAxMDA2NDQKPj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9j
bGllbnRfbW9kZXNldC5jCj4+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50
X21vZGVzZXQuYwo+Pj4+Pj4+PiBAQCAtMTgyLDYgKzE4Miw4IEBAIGRybV9jb25uZWN0b3JfcGlj
a19jbWRsaW5lX21vZGUoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPj4+Pj4+Pj4g
ICAgICAgICBtb2RlID0gZHJtX21vZGVfY3JlYXRlX2Zyb21fY21kbGluZV9tb2RlKGNvbm5lY3Rv
ci0+ZGV2LCBjbWRsaW5lX21vZGUpOwo+Pj4+Pj4+PiAgICAgICAgIGlmIChtb2RlKQo+Pj4+Pj4+
PiAgICAgICAgICAgICAgICAgbGlzdF9hZGQoJm1vZGUtPmhlYWQsICZjb25uZWN0b3ItPm1vZGVz
KTsKPj4+Pj4+Pj4gKyAgICAgICBlbHNlCj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICBjbWRsaW5l
X21vZGUtPnNwZWNpZmllZCA9IGZhbHNlOwo+Pj4+Pj4+Cj4+Pj4+Pj4gSG1tbSwgaXQncyBub3Qg
Y2xlYXIgdG8gbWUgd2h5IHRoYXQgd291bGRuJ3QgYmUgdGhlIGNhc2UuCj4+Pj4+Pj4KPj4+Pj4+
PiBJZiB3ZSBjb21lIGJhY2sgdG8gdGhlIGJlZ2lubmluZyBvZiB0aGF0IGZ1bmN0aW9uLCB3ZSBy
ZXRyaWV2ZSB0aGUKPj4+Pj4+PiBjbWRsaW5lX21vZGUgYnVmZmVyIGZyb20gdGhlIGNvbm5lY3Rv
ciBwb2ludGVyLCB0aGF0IHdpbGwgcHJvYmFibHkKPj4+Pj4+PiBoYXZlIGJlZW4gcGFyc2VkIGEg
Zmlyc3QgdGltZSB1c2luZyBkcm1fbW9kZV9jcmVhdGVfZnJvbV9jbWRsaW5lX21vZGUKPj4+Pj4+
PiBpbiBkcm1faGVscGVyX3Byb2JlX2FkZF9jbWRsaW5lX21vZGUuCj4+Pj4+Pj4KPj4+Pj4+PiBO
b3csIEknbSBndWVzc2luZyB0aGF0IHRoZSBpc3N1ZSBpcyB0aGF0IGluCj4+Pj4+Pj4gZHJtX21v
ZGVfcGFyc2VfY29tbWFuZF9saW5lX2Zvcl9jb25uZWN0b3IsIGlmIHdlIGhhdmUgYSBuYW1lZCBt
b2RlLCB3ZQo+Pj4+Pj4+IGp1c3QgY29weSB0aGUgbW9kZSBvdmVyIGFuZCBzZXQgbW9kZS0+c3Bl
Y2lmaWVkLgo+Pj4+Pj4+Cj4+Pj4+Pj4gQW5kIHdlIHRoZW4gbW92ZSBvdmVyIHRvIGRvIG90aGVy
IGNoZWNrcywgYW5kIHRoYXQncyBwcm9iYWJseSB3aGF0Cj4+Pj4+Pj4gZmFpbHMgYW5kIHJldHVy
bnMsIGJ1dCBvdXIgZHJtX2NtZGxpbmVfbW9kZSB3aWxsIGhhdmUgYmVlbiBtb2RpZmllZC4KPj4+
Pj4+Pgo+Pj4+Pj4+IEknbSBub3QgZW50aXJlbHkgc3VyZSBob3cgdG8gZGVhbCB3aXRoIHRoYXQg
dGhvdWdoLgo+Pj4+Pj4+Cj4+Pj4+Pj4gSSBndWVzcyB3ZSBjb3VsZCBhbGxvY2F0ZSBhIGRybV9j
bWRsaW5lX21vZGUgc3RydWN0dXJlIG9uIHRoZSBzdGFjaywKPj4+Pj4+PiBmaWxsIHRoYXQsIGFu
ZCBpZiBzdWNjZXNzZnVsIGNvcHkgb3ZlciBpdHMgY29udGVudCB0byB0aGUgb25lIGluCj4+Pj4+
Pj4gZHJtX2Nvbm5lY3Rvci4gVGhhdCB3b3VsZCBhbGxvdyB1cyB0byBvbmx5IGNoYW5nZSB0aGUg
Y29udGVudCBvbgo+Pj4+Pj4+IHN1Y2Nlc3MsIHdoaWNoIGlzIHdoYXQgSSB3b3VsZCBleHBlY3Qg
ZnJvbSBzdWNoIGEgZnVuY3Rpb24/Cj4+Pj4+Pj4KPj4+Pj4+PiBIb3cgZG9lcyB0aGF0IHNvdW5k
Pwo+Pj4+Pj4KPj4+Pj4+IEkgbm93IHNlZSB0aGF0IHRoZXJlIGlzIERSTV9NT0RFX1RZUEVfVVNF
UkRFRiBmbGFnIHRoYXQgaXMgYXNzaWduZWQgb25seQo+Pj4+Pj4gZm9yIHRoZSAiY21kbGluZSIg
bW9kZSBhbmQgZHJtX2NsaWVudF9yb3RhdGlvbigpIGlzIHRoZSBvbmx5IHBsYWNlIGluCj4+Pj4+
PiBEUk0gY29kZSB0aGF0IGNhcmVzIGFib3V0IHdoZXRoZXIgbW9kZSBpcyBmcm9tIGNtZGxpbmUs
IGhlbmNlIGxvb2tzIGxpa2UKPj4+Pj4+IGl0IHdpbGwgYmUgbW9yZSBjb3JyZWN0IHRvIGRvIHRo
ZSBmb2xsb3dpbmc6Cj4+Pj4+Cj4+Pj4+IEknbSBzdGlsbCB1bmRlciB0aGUgaW1wcmVzc2lvbiB0
aGF0IHdlJ3JlIGRlYWxpbmcgd2l0aCB3b3JrYXJvdW5kcyBvZgo+Pj4+PiBhIG1vcmUgY2VudHJh
bCBpc3N1ZSwgd2hpY2ggaXMgdGhhdCB3ZSBzaG91bGRuJ3QgcmV0dXJuIGEgcGFydGlhbGx5Cj4+
Pj4+IG1vZGlmaWVkIGRybV9jbWRsaW5lX21vZGUuCj4+Pj4+Cj4+Pj4+IFlvdSBzYWlkIGl0IHlv
dXJzZWxmLCB0aGUgYnJlYWthZ2UgaXMgaW4gdGhlIGNvbW1pdCBjaGFuZ2luZyB0aGUKPj4+Pj4g
Y29tbWFuZCBsaW5lIHBhcnNpbmcgbG9naWMsIHdoaWxlIHlvdSdyZSBmaXhpbmcgaGVyZSBzb21l
IGNvZGUgdGhhdAo+Pj4+PiB3YXMgaW50cm9kdWNlZCBsYXRlciBvbi4KPj4+Pgo+Pj4+IFRoZSBw
cm9ibGVtIHN0ZW1zIGZyb20gYXNzdW1wdGlvbiB0aGF0ICphbnkqIG5hbWVkIG1vZGUgaXMgdmFs
aWQuIEl0Cj4+Pj4gbG9va3MgdG8gbWUgdGhhdCB0aGUgdWx0aW1hdGUgc29sdXRpb24gd291bGQg
YmUgdG8gbW92ZSB0aGUgbW9kZSdzIG5hbWUKPj4+PiBjb21wYXJpc29uIGludG8gdGhlIFsxXSwg
aWYgdGhhdCdzIHBvc3NpYmxlLgo+Pj4+Cj4+Pj4gWzFdIGRybV9tb2RlX3BhcnNlX2NvbW1hbmRf
bGluZV9mb3JfY29ubmVjdG9yKCkKPj4+Cj4+PiBXZWxsLCBvbmUgY291bGQgYXJndWUgdGhhdCB2
aWRlbz10ZWdyYWZiIGlzIGludmFsaWQgYW5kIHNob3VsZCBiZQo+Pj4gcmVqZWN0ZWQgYXMgd2Vs
bCwgYnV0IHdlIGhhdmVuJ3QgY2xlYXJlZCB0aGF0IHVwLgo+Pgo+PiBUaGUgdmlkZW89dGVncmFm
YiBpcyBpbnZhbGlkIG1vZGUsIHRoZXJlIGlzIG5vdGhpbmcgdG8gYXJndWUgaGVyZS4gQW5kCj4+
IHRoZSBwcm9ibGVtIGlzIHRoYXQgaW52YWxpZCBtb2RlcyBhbmQgbm90IHJlamVjdGVkIGZvciB0
aGUgdmVyeSBiZWdpbm5pbmcuCj4gCj4gWWVhaCwgSSBndWVzcyBmYl9nZXRfb3B0aW9ucyBzaG91
bGQgYWxzbyByZXR1cm4gYW4gZXJyb3IgaW4gc3VjaCBhCj4gY2FzZSwgYnV0IEknbSBhIGJpdCB3
b3JyaWVkIGFib3V0IHRoZSBzaWRlIGVmZmVjdHMgaGVyZS4KCkF0IGxlYXN0IHRoZSBzaG93c3Rv
cHBlciByZWdyZXNzaW9uIGlzIGZpeGVkIG5vdy4gRXZlcnl0aGluZyBlbHNlIGNvdWxkCmJlIHdv
cmtlZCBvdXQgbGF0ZXIgb24uCgo+Pj4+PiBDYW4geW91IHRyeSB0aGUgZm9sbG93aW50ZyBwYXRj
aD8KPj4+Pj4gaHR0cDovL2NvZGUuYnVsaXgub3JnLzhjd2s0Yy03OTQ1NjU/cmF3Cj4+Pj4KPj4+
PiBUaGlzIGRvZXNuJ3QgaGVscCBiZWNhdXNlIHRoZSBwcm9ibGVtIHdpdGggdGhlIHJvdGF0aW9u
X3JlZmxlY3Rpb24gaXMKPj4+PiB0aGF0IGl0J3MgMCBpZiAicm90YXRpb24iIG5vdCBwcmVzZW50
IGluIHRoZSBjbWRsaW5lIGFuZCB0aGVuIGlsb2cyKDApCj4+Pj4gcmV0dXJucyAtMS4gU28gdGhl
IHBhdGNoICJkcm0vbW9kZXM6IERvbid0IGFwcGx5IGNtZGxpbmUncyByb3RhdGlvbiBpZgo+Pj4+
IGl0IHdhc24ndCBzcGVjaWZpZWQiIHNob3VsZCBiZSBjb3JyZWN0IGluIGFueSBjYXNlLgo+Pj4K
Pj4+IFNvIHdlIHdvdWxkIGhhdmUgdGhlIHNhbWUgaXNzdWUgd2l0aCByb3RhdGU9MCB0aGVuPwo+
Pgo+PiBObywgd2Ugd29uJ3QuIFJvdGF0aW9uIG1vZGUgaXMgcGFyc2VkIGludG8gdGhlIERSTV9N
T0RFIGJpdG1hc2sgYW5kCj4+IHJvdGF0ZT0wIGNvcnJlc3BvbmRzIHRvIERSTV9NT0RFX1JPVEFU
RV8wLCB3aGljaCBpcyBCSVQoMCkgYXMgeW91IG1heQo+PiBub3RpY2UuIEhlbmNlIHJvdGF0aW9u
X3JlZmxlY3Rpb249MCBpcyBhbHdheXMgYW4gaW52YWxpZCB2YWx1ZSwgbWVhbmluZwo+PiB0aGF0
ICJyb3RhdGUiIG9wdGlvbiBkb2VzIG5vdCBwcmVzZW50IGluIHRoZSBjbWRsaW5lLiBQbGVhc2Ug
Y29uc3VsdCB0aGUKPj4gY29kZSwgaW4gcGFydGljdWxhciBzZWUgZHJtX21vZGVfcGFyc2VfY21k
bGluZV9vcHRpb25zKCkgd2hpY2ggd2FzCj4+IHdyaXR0ZW4gYnkgeW91cnNlbGYgOykKPiAKPiBT
aWdoLi4uIFlvdSdyZSByaWdodCA6KQo+IAo+IFNvcnJ5IGZvciB0aGF0LCBJJ2xsIHJlcGx5IHRv
IHRoZSBvdGhlciBwYXRjaAoKVGhhbmsgeW91IHZlcnkgbXVjaC4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
