Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A88F3344FEF
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 20:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA646E59F;
	Mon, 22 Mar 2021 19:34:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA08C6E591;
 Mon, 22 Mar 2021 19:34:28 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ce10so23203061ejb.6;
 Mon, 22 Mar 2021 12:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=49ZEvWwXnmSfiA1W6dXkvZ1CKfU/VlsXQJL1hS095NU=;
 b=e62q74y9ySftYuA0+bu5CxFIj/DjOfU243PXAPOAQJJfbQbz7Mt9FYCph35MwRKSuY
 3idOJnICseyaJOsgEHPeVuNh47IhHW94trtcWbqrtDQ6BrLsjawgg3OO/6U6GNY0T7Ti
 6XrBDzN6WUJyazdGYL1CBx7jMHT26920FE9CZKSfmH6jqflRzWDZkUVLn3AygenRUR3l
 4HsZEepJAFqniVPx6oJY7CqzUYODyyK2EVC6oEBma+foX3cGlrP+yBV1gjYOHDi+J5j6
 jKJ/Co/av/bCvGf7yyJXRgO71aQx6Hc7nCblJpVhWPTQX60d445Okn58t8KDoxXcJeIM
 d8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=49ZEvWwXnmSfiA1W6dXkvZ1CKfU/VlsXQJL1hS095NU=;
 b=UrQS1Rng0WyiG1f44XC7ukOTV9SgAfs5kgcgtXsuDUFwMz2VZuU9ps2VHPErKCgwMe
 Plk+Pbcd4UcmpzJQZuP4mdL22PPCdJj8bB2EobnugjIx935SgyJOFq4Tpq9tppd/kIsL
 IACGGVb2Lm2S9Qc8vAOeMykY3kW4HIvhwx6AnUX/4nj6ohk21fgO7IOU1nls0UvoKqqr
 oA/lf8/t49w3XgGRY7566r/pGPbw9H+HU16OxQMhWOq7hYUiArnIfKjmuVugxpvozecg
 nypnjGtry8SkK7WPBOPaWznJCuRrRdHwiXSU2ZrzXfkM9OkEOrQ9s3PGxc66YaG9rvwh
 KYAg==
X-Gm-Message-State: AOAM530ANB9+xAl0MuR2Re+0xfxLiTxid5FIw7d0p6zX0ylYd+HdwGQq
 0zW0V0mS44ZlYCaW16qUmFEHcrkwCeY=
X-Google-Smtp-Source: ABdhPJz59vlYSkZeN4Kue/JVfmIAZwy4VmpUwuYdoHI3gNdCHCATjRhzS2QzDLgBrhZvlM9PinE0ZA==
X-Received: by 2002:a17:906:3395:: with SMTP id
 v21mr1378318eja.322.1616441667552; 
 Mon, 22 Mar 2021 12:34:27 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:e345:6f8e:fa4b:2c52?
 ([2a02:908:1252:fb60:e345:6f8e:fa4b:2c52])
 by smtp.gmail.com with ESMTPSA id v24sm10120181ejw.17.2021.03.22.12.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 12:34:27 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: stop warning on TT shrinker failure
To: Daniel Vetter <daniel@ffwll.ch>, Michal Hocko <mhocko@suse.com>
References: <20210319140857.2262-1-christian.koenig@amd.com>
 <YFTk1GSaUDI3wcWt@phenom.ffwll.local>
 <2831bfcc-140e-dade-1f50-a6431e495e9d@gmail.com>
 <YFT2LSR97rkkPyEP@phenom.ffwll.local>
 <1ae415c4-8e49-5183-b44d-bc92088657d5@gmail.com>
 <CAKMK7uEDhuvSwJj5CX8vHgLb+5zm=rdJPmXwb-VQWdrW6GwQZw@mail.gmail.com>
 <e6e9df3e-cd2b-d80f-205d-6ca1865819b2@gmail.com>
 <YFigZ5+H95c/GI/S@phenom.ffwll.local>
 <20210322140548.GN1719932@casper.infradead.org>
 <YFi+UROYbQERYEEr@dhcp22.suse.cz>
 <CAKMK7uGM6EJvzktrANyeeemRPoW7O0ka-ZyKi==wL1zt3yM=5w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c78457bb-d93a-ff84-1cce-0fb3fa9f0cec@gmail.com>
Date: Mon, 22 Mar 2021 20:34:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGM6EJvzktrANyeeemRPoW7O0ka-ZyKi==wL1zt3yM=5w@mail.gmail.com>
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
Cc: Matthew Wilcox <willy@infradead.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Chinner <dchinner@redhat.com>, Leo Liu <Leo.Liu@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjIuMDMuMjEgdW0gMTg6MDIgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIE1vbiwgTWFy
IDIyLCAyMDIxIGF0IDU6MDYgUE0gTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+IHdyb3Rl
Ogo+PiBPbiBNb24gMjItMDMtMjEgMTQ6MDU6NDgsIE1hdHRoZXcgV2lsY294IHdyb3RlOgo+Pj4g
T24gTW9uLCBNYXIgMjIsIDIwMjEgYXQgMDI6NDk6MjdQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPj4+PiBPbiBTdW4sIE1hciAyMSwgMjAyMSBhdCAwMzoxODoyOFBNICswMTAwLCBDaHJp
c3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+PiBBbSAyMC4wMy4yMSB1bSAxNDoxNyBzY2hyaWViIERh
bmllbCBWZXR0ZXI6Cj4+Pj4+PiBPbiBTYXQsIE1hciAyMCwgMjAyMSBhdCAxMDowNCBBTSBDaHJp
c3RpYW4gS8O2bmlnCj4+Pj4+PiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdy
b3RlOgo+Pj4+Pj4+IEFtIDE5LjAzLjIxIHVtIDIwOjA2IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoK
Pj4+Pj4+Pj4gT24gRnJpLCBNYXIgMTksIDIwMjEgYXQgMDc6NTM6NDhQTSArMDEwMCwgQ2hyaXN0
aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4+Pj4+IEFtIDE5LjAzLjIxIHVtIDE4OjUyIHNjaHJpZWIg
RGFuaWVsIFZldHRlcjoKPj4+Pj4+Pj4+PiBPbiBGcmksIE1hciAxOSwgMjAyMSBhdCAwMzowODo1
N1BNICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4+Pj4+PiBEb24ndCBwcmlu
dCBhIHdhcm5pbmcgd2hlbiB3ZSBmYWlsIHRvIGFsbG9jYXRlIGEgcGFnZSBmb3Igc3dhcHBpbmcg
dGhpbmdzIG91dC4KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gQWxzbyByZWx5IG9uIG1lbWFsbG9j
X25vZnNfc2F2ZS9tZW1hbGxvY19ub2ZzX3Jlc3RvcmUgaW5zdGVhZCBvZiBHRlBfTk9GUy4KPj4+
Pj4+Pj4+PiBVaCB0aGlzIHBhcnQgZG9lc24ndCBtYWtlIHNlbnNlLiBFc3BlY2lhbGx5IHNpbmNl
IHlvdSBvbmx5IGRvIGl0IGZvciB0aGUKPj4+Pj4+Pj4+PiBkZWJ1Z2ZzIGZpbGUsIG5vdCBpbiBn
ZW5lcmFsLiBXaGljaCBtZWFucyB5b3UndmUganVzdCBjb21wbGV0ZWx5IGJyb2tlbgo+Pj4+Pj4+
Pj4+IHRoZSBzaHJpbmtlci4KPj4+Pj4+Pj4+IEFyZSB5b3Ugc3VyZT8gTXkgaW1wcmVzc2lvbiBp
cyB0aGF0IEdGUF9OT0ZTIHNob3VsZCBub3cgd29yayBtdWNoIG1vcmUgb3V0Cj4+Pj4+Pj4+PiBv
ZiB0aGUgYm94IHdpdGggdGhlIG1lbWFsbG9jX25vZnNfc2F2ZSgpL21lbWFsbG9jX25vZnNfcmVz
dG9yZSgpLgo+Pj4+Pj4+PiBZZWFoLCBpZiB5b3UnZCBwdXQgaXQgaW4gdGhlIHJpZ2h0IHBsYWNl
IDotKQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBCdXQgYWxzbyAtbW0gZm9sa3MgYXJlIHZlcnkgY2xlYXIg
dGhhdCBtZW1hbGxvY19ubyooKSBmYW1pbHkgaXMgZm9yIGRpcmUKPj4+Pj4+Pj4gc2l0dWF0aW9u
IHdoZXJlIHRoZXJlJ3MgcmVhbGx5IG5vIG90aGVyIHdheSBvdXQuIEZvciBhbnl0aGluZyB3aGVy
ZSB5b3UKPj4+Pj4+Pj4ga25vdyB3aGF0IHlvdSdyZSBkb2luZywgeW91IHJlYWxseSBzaG91bGQg
dXNlIGV4cGxpY2l0IGdmcCBmbGFncy4KPj4+Pj4+PiBNeSBpbXByZXNzaW9uIGlzIGp1c3QgdGhl
IG90aGVyIHdheSBhcm91bmQuIFlvdSBzaG91bGQgdHJ5IHRvIGF2b2lkIHRoZQo+Pj4+Pj4+IE5P
RlMvTk9JTyBmbGFncyBhbmQgdXNlIHRoZSBtZW1hbGxvY19ubyogYXBwcm9hY2ggaW5zdGVhZC4K
Pj4+Pj4+IFdoZXJlIGRpZCB5b3UgZ2V0IHRoYXQgaWRlYT8KPj4+Pj4gV2VsbCBmcm9tIHRoZSBr
ZXJuZWwgY29tbWVudCBvbiBHRlBfTk9GUzoKPj4+Pj4KPj4+Pj4gICAqICVHRlBfTk9GUyB3aWxs
IHVzZSBkaXJlY3QgcmVjbGFpbSBidXQgd2lsbCBub3QgdXNlIGFueSBmaWxlc3lzdGVtCj4+Pj4+
IGludGVyZmFjZXMuCj4+Pj4+ICAgKiBQbGVhc2UgdHJ5IHRvIGF2b2lkIHVzaW5nIHRoaXMgZmxh
ZyBkaXJlY3RseSBhbmQgaW5zdGVhZCB1c2UKPj4+Pj4gICAqIG1lbWFsbG9jX25vZnNfe3NhdmUs
cmVzdG9yZX0gdG8gbWFyayB0aGUgd2hvbGUgc2NvcGUgd2hpY2gKPj4+Pj4gY2Fubm90L3Nob3Vs
ZG4ndAo+Pj4+PiAgICogcmVjdXJzZSBpbnRvIHRoZSBGUyBsYXllciB3aXRoIGEgc2hvcnQgZXhw
bGFuYXRpb24gd2h5LiBBbGwgYWxsb2NhdGlvbgo+Pj4+PiAgICogcmVxdWVzdHMgd2lsbCBpbmhl
cml0IEdGUF9OT0ZTIGltcGxpY2l0bHkuCj4+Pj4gSHVoIHRoYXQncyBpbnRlcmVzdGluZywgc2lu
Y2UgaWlyYyBXaWxseSBvciBEYXZlIHRvbGQgbWUgdGhlIG9wcG9zaXRlLCBhbmQKPj4+PiB0aGUg
bWVtYWxsb2Nfbm8qIHN0dWZmIGlzIGZvciBlLmcuIG5mcyBjYWxsaW5nIGludG8gbmV0d29yayBs
YXllciAobmVlZHMKPj4+PiBHRlBfTk9GUykgb3Igc3dhcCBvbiB0b3Agb2YgYSBmaWxlc3lzdGVt
cyAoZXZlbiBuZWVkcyBHRlBfTk9JTyBJIHRoaW5rKS4KPj4+Pgo+Pj4+IEFkZGluZyB0aGVtLCBt
YXliZSBJIGdvdCBjb25mdXNlZC4KPj4+IE15IGltcHJlc3Npb24gaXMgdGhhdCB0aGUgc2NvcGVk
IEFQSSBpcyBwcmVmZXJyZWQgdGhlc2UgZGF5cy4KPj4+Cj4+PiBodHRwczovL3d3dy5rZXJuZWwu
b3JnL2RvYy9odG1sL2xhdGVzdC9jb3JlLWFwaS9nZnBfbWFzay1mcm9tLWZzLWlvLmh0bWwKPj4+
Cj4+PiBJJ2QgcHJvYmFibHkgbmVlZCB0byBzcGVuZCBhIGZldyBtb250aHMgbGVhcm5pbmcgdGhl
IERSTSBzdWJzeXN0ZW0gdG8KPj4+IGhhdmUgYSBtb3JlIGRldGFpbGVkIG9waW5pb24gb24gd2hl
dGhlciBwYXNzaW5nIEdGUCBmbGFncyBhcm91bmQgZXhwbGljaXRseQo+Pj4gb3IgdXNpbmcgdGhl
IHNjb3BlIEFQSSBpcyB0aGUgYmV0dGVyIGFwcHJvYWNoIGZvciB5b3VyIHNpdHVhdGlvbi4KPj4g
eWVzLCBpbiBhbiBpZGVhbCB3b3JsZCB3ZSB3b3VsZCBoYXZlIGEgY2xlYXJseSBkZWZpbmVkIHNj
b3BlIG9mIHRoZQo+PiByZWNsYWltIHJlY3Vyc2lvbiB3cnQgRlMvSU8gYXNzb2NpYXRlZCB3aXRo
IGl0LiBJJ3ZlIGdvdCBiYWNrIHRvCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FtZC1nZngv
MjAyMTAzMTkxNDA4NTcuMjI2Mi0xLWNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbS8KPj4gYW5kIHRo
ZXJlIGFyZSB0d28gdGhpbmdzIHN0YW5kaW5nIG91dC4gV2h5IGRvZXMgdHRtX3R0X2RlYnVnZnNf
c2hyaW5rX3Nob3cKPj4gcmVhbGx5IHJlcXVpcmUgTk9GUyBzZW1hbnRpYz8gQW5kIHdoeSBkb2Vz
IGl0IHBsYXkgd2l0aAo+PiBmc19yZWNsYWltX2FjcXVpcmU/Cj4gSXQncyBvdXIgc2hyaW5rZXIu
IHNocmlua19zaG93IHNpbXBseSB0cmlnZ2VycyB0aGF0IHNwZWNpZmljIHNocmlua2VyCj4gYXNr
aW5nIGl0IHRvIHNocmluayBldmVyeXRoaW5nIGl0IGNhbiwgd2hpY2ggaGVscHMgYSBsb3Qgd2l0
aCB0ZXN0aW5nCj4gd2l0aG91dCBoYXZpbmcgdG8gZHJpdmUgdGhlIGVudGlyZSBzeXN0ZW0gYWdh
aW5zdCB0aGUgT09NIHdhbGwuCj4gZnNfcmVjbGFpbV9hY3F1aXJlIGlzIHRoZXJlIHRvIG1ha2Ug
c3VyZSBsb2NrZGVwIHVuZGVyc3RhbmRzIHRoYXQgdGhpcwo+IGlzIGEgc2hyaW5rZXIgYW5kIHRo
YXQgaXQgY2hlY2tzIGFsbCB0aGUgZGVwZW5kZW5jaWVzIGZvciB1cyBsaWtlIGlmCj4gd2UnZCBi
ZSBpbiByZWFsIHJlY2xhaW0uIFRoZXJlIGlzIHNvbWUgZHJvcCBjYWNoZXMgaW50ZXJmYWNlcyBp
biBwcm9jCj4gaWlyYywgYnV0IHRob3NlIGRyb3AgZXZlcnl0aGluZywgYW5kIHRoZXkgZG9uJ3Qg
aGF2ZSB0aGUgZnNfcmVjbGFpbQo+IGFubm90YXRpb25zIHRvIHRlYWNoIGxvY2tkZXAgYWJvdXQg
d2hhdCB3ZSdyZSBkb2luZy4KClRvIHN1bW1hcml6ZSB0aGUgZGVidWdmcyBjb2RlIGlzIGJhc2lj
YWxseSB0byB0ZXN0IGlmIHRoYXQgc3R1ZmYgcmVhbGx5IAp3b3JrcyB3aXRoIEdGUF9OT0ZTLgoK
TXkgb25seSBjb25jZXJuIGlzIHRoYXQgaWYgSSBjb3VsZCByZWx5IG9uIG1lbWFsbG9jX25vKiBi
ZWluZyB1c2VkIHdlIApjb3VsZCBvcHRpbWl6ZSB0aGlzIHF1aXRlIGEgYml0IGZ1cnRoZXIuCgpS
ZWdhcmRzLApDaHJpc3RpYW4uCgo+IC1EYW5pZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
