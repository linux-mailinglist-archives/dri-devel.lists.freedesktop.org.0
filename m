Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0CDEDCEF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 11:53:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D750D6E2CA;
	Mon,  4 Nov 2019 10:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74F16E2CA
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 10:53:21 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id v24so8701533otp.5
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 02:53:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8b3P8qSRLFrLqsJhrugxMu45LMgVnh54YgowLiHTTEY=;
 b=i2JUneCheX64+XDZDqtFo2wPUTO7w9dhKVMomydBzS+wFSFPVg4RY2u9Qp0Mrl+/b5
 M+lsdeBVwwAMOKfcnSyfGgDvQbFukinL9ECr93gxySW7P4qYKzCCPwfGZWX+FEtrnvlm
 sgUlLdneLePxZi61nvbFoRUDBRD9juya2Vpfa8f7kMrjA5XnuzoYw0RcKfnnBQSoVTwu
 gFc6esOX36Lc4EHT0hap4YpHnzQM3t91S+5sFpU1Swi+iROcY6Redf2M5XK98RwomzWV
 Q0pFTMerBCI8nFPJmC3OsaAPTEEPpXbevdBFmOhe/1BRBLGiS/rk/JP0BOMSYV2rOzip
 i/cg==
X-Gm-Message-State: APjAAAWRggZPnGBIoaKLRWchjtz7/wF6665lU+cS7PXHpmkUB4G0VILJ
 J76f/IeRaXk63w59DF3d5+9ljwwwluBj4DknvSzBRA==
X-Google-Smtp-Source: APXvYqz6WVL7OBTKVEPcymiWt8gzTKXVen6HxWF5YajvZa1C3BsMVL79Ef8zxZaTB9D5z2KzH8WyC0o0aYRL1QZLY2s=
X-Received: by 2002:a9d:62d8:: with SMTP id z24mr19027276otk.188.1572864801061; 
 Mon, 04 Nov 2019 02:53:21 -0800 (PST)
MIME-Version: 1.0
References: <951eb7dc-bebe-5049-4998-f199e18b0bf3@canonical.com>
 <20191009163235.GT16989@phenom.ffwll.local>
 <a0d5f3a3-a2b3-5367-42f9-bde514571e25@amd.com>
 <CAKMK7uEtJRDhibWDv2TB2WrFzFooMWPSbveDD2N-rudAwvzVFA@mail.gmail.com>
 <c8f96b46-e81e-1e41-aafc-5f6ec236d66f@amd.com>
 <CAKMK7uHr3aeJRqJAscDDfsuBBnVXCeN9SS36-1UGuK84NyOD5Q@mail.gmail.com>
In-Reply-To: <CAKMK7uHr3aeJRqJAscDDfsuBBnVXCeN9SS36-1UGuK84NyOD5Q@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 4 Nov 2019 11:53:09 +0100
Message-ID: <CAKMK7uH6EoY9MkzjSjU+Fe=E-XB4Tf9d2VsW=Tr=tFy1J-dJgg@mail.gmail.com>
Subject: Re: drm/amd/display: Add HDCP module - static analysis bug report
To: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8b3P8qSRLFrLqsJhrugxMu45LMgVnh54YgowLiHTTEY=;
 b=SfvuzQIMcQyCEi/tFArbrm1tA3MimYlzVNQ2OpksRBktQt6kvex6MyJy29vXdBE7k9
 9O9b6kS7P2rK+0lA6EU9VBpduz4w6rqkB8zmJPRIJhO+I4okI0hMzk6QdSrJPAXrC6pb
 xq2Ty1ll2cBNnr1cOpgMtqRMh1BGaHPoyQafs=
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgOSwgMjAxOSBhdCAxMDo1OCBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+IE9uIFdlZCwgT2N0IDksIDIwMTkgYXQgMTA6NDYgUE0gTGFraGEsIEJo
YXdhbnByZWV0Cj4gPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+IHdyb3RlOgo+ID4KPiA+IEkg
bWlzdW5kZXJzdG9vZCBhbmQgd2FzIHRhbGtpbmcgYWJvdXQgdGhlIGtzdiB2YWxpZGF0aW9uIHNw
ZWNpZmljYWxseQo+ID4gKHVzYWdlIG9mIGRybV9oZGNwX2NoZWNrX2tzdnNfcmV2b2tlZCgpKS4K
Pgo+IEhtIGZvciB0aGF0IHNwZWNpZmljYWxseSBJIHRoaW5rIHlvdSB3YW50IHRvIGRvIGJvdGgs
IGkuZS4gYm90aAo+IGNvbnN1bHQgeW91ciBwc3AsIGJ1dCBhbHNvIGNoZWNrIGZvciByZXZva2Vk
IGtzdnMgd2l0aCB0aGUgY29yZQo+IGhlbHBlci4gQXQgbGVhc3Qgb24gc29tZSBwbGF0Zm9ybXMg
b25seSB0aGUgY29yZSBoZWxwZXIgbWlnaHQgaGF2ZSB0aGUKPiB1cGRhdGVkIHJldm9rZSBsaXN0
Lgo+Cj4gPiBGb3IgdGhlIGRlZmluZXMgSSB3aWxsIGNyZWF0ZSBwYXRjaGVzIHRvIHVzZSBkcm1f
aGRjcCB3aGVyZSBpdCBpcyB1c2FibGUuCj4KPiBUaGFua3MgYSBsb3QuIEltZSBvbmNlIHdlIGhh
dmUgc2hhcmVkIGRlZmluaXRpb25zIGl0J3MgbXVjaCBlYXNpZXIgdG8KPiBhbHNvIHNoYXJlIHNv
bWUgaGVscGVycywgd2hlcmUgaXQgbWFrZXMgc2Vuc2UuCj4KPiBBc2lkZSBJIHRoaW5rIHRoZSBo
ZGNwIGNvZGUgY291bGQgYWxzbyB1c2UgYSBiaXQgb2YgZGVtaWRsYXllcmluZy4gQXQKPiBsZWFz
dCBJJ20gbm90IHVuZGVyc3RhbmRpbmcgd2h5IHlvdSBhZGQgYSAybmQgYWJzdHJhY3Rpb24gbGF5
ZXIgZm9yCj4gaTJjL2RwY2QsIGRtX2hlbHBlciBhbHJlYWR5IGhhcyB0aGF0LiBUaGF0IHNlZW1z
IGxpa2Ugb25lIGFic3RyYWN0aW9uCj4gbGF5ZXIgdG9vIG11Y2guCgpJIGhhdmVuJ3Qgc2VlbiBh
bnl0aGluZyBmbHkgYnkgb3IgaW4gdGhlIGxhdGVzdCBwdWxsIHJlcXVlc3QgLi4uIHlvdQpmb2xr
cyBzdGlsbCB3b3JraW5nIG9uIHRoaXMgb3IgbW9yZSBwdXQgb24gdGhlICJtYXliZSwgcHJvYmFi
bHkgbmV2ZXIiCnBpbGU/CgotRGFuaWVsCgoKPiAtRGFuaWVsCj4KPiA+Cj4gPgo+ID4gQmhhd2Fu
Cj4gPgo+ID4gT24gMjAxOS0xMC0wOSAyOjQzIHAubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4g
PiA+IE9uIFdlZCwgT2N0IDksIDIwMTkgYXQgODoyMyBQTSBMYWtoYSwgQmhhd2FucHJlZXQKPiA+
ID4gPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+IHdyb3RlOgo+ID4gPj4gSGksCj4gPiA+Pgo+
ID4gPj4gVGhlIHJlYXNvbiB3ZSBkb24ndCB1c2UgZHJtX2hkY3AgaXMgYmVjYXVzZSBvdXIgcG9s
aWN5IGlzIHRvIGRvIGhkY3AKPiA+ID4+IHZlcmlmaWNhdGlvbiB1c2luZyBQU1AvSFcgKG9uYm9h
cmQgc2VjdXJlIHByb2Nlc3NvcikuCj4gPiA+IGk5MTUgYWxzbyB1c2VzIGh3IHRvIGF1dGgsIHdl
IHN0aWxsIHVzZSB0aGUgcGFydHMgZnJvbSBkcm1faGRjcCAuLi4KPiA+ID4gRGlkIHlvdSBhY3R1
YWxseSBsb29rIGF0IHdoYXQncyBpbiB0aGVyZT8gSXQncyBlc3NlbnRpYWxseSBqdXN0IHNoYXJl
ZAo+ID4gPiBkZWZpbmVzIGFuZCBkYXRhIHN0cnVjdHVyZXMgZnJvbSB0aGUgc3RhbmRhcmQsIHBs
dXMgYSBmZXcgbWluaW1hbAo+ID4gPiBoZWxwZXJzIHRvIGVuL2RlY29kZSBzb21lIGJpdHMuIEp1
c3QgZnJvbSBhIHF1aWNrIHJlYWQgdGhlIGVudGlyZQo+ID4gPiBwYXRjaCB2ZXJ5IG11Y2ggbG9v
a3MgbGlrZSBtaWRsYXllciBldmVyeXdoZXJlIGRlc2lnbiB0aGF0IHdlCj4gPiA+IGRpc2N1c3Nl
ZCBiYWNrIHdoZW4gREMgbGFuZGVkIC4uLgo+ID4gPiAtRGFuaWVsCj4gPiA+Cj4gPiA+PiBCaGF3
YW4KPiA+ID4+Cj4gPiA+PiBPbiAyMDE5LTEwLTA5IDEyOjMyIHAubS4sIERhbmllbCBWZXR0ZXIg
d3JvdGU6Cj4gPiA+Pj4gT24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMTE6MDg6MDNQTSArMDEwMCwg
Q29saW4gSWFuIEtpbmcgd3JvdGU6Cj4gPiA+Pj4+IEhpLAo+ID4gPj4+Pgo+ID4gPj4+PiBTdGF0
aWMgYW5hbHlzaXMgd2l0aCBDb3Zlcml0eSBoYXMgZGV0ZWN0ZWQgYSBwb3RlbnRpYWwgaXNzdWUg
d2l0aAo+ID4gPj4+PiBmdW5jdGlvbiB2YWxpZGF0ZV9ia3N2IGluCj4gPiA+Pj4+IGRyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcDFfZXhlY3V0aW9uLmMgd2l0aCBy
ZWNlbnQKPiA+ID4+Pj4gY29tbWl0Ogo+ID4gPj4+Pgo+ID4gPj4+PiBjb21taXQgZWQ5ZDhlMmJj
YjAwM2VjOTQ2NThjYWZlOWIxYmIzOTYwZTIxMzllYwo+ID4gPj4+PiBBdXRob3I6IEJoYXdhbnBy
ZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgo+ID4gPj4+PiBEYXRlOiAgIFR1
ZSBBdWcgNiAxNzo1MjowMSAyMDE5IC0wNDAwCj4gPiA+Pj4+Cj4gPiA+Pj4+ICAgICAgIGRybS9h
bWQvZGlzcGxheTogQWRkIEhEQ1AgbW9kdWxlCj4gPiA+Pj4gSSB0aGluayB0aGUgcmVhbCBxdWVz
dGlvbiBoZXJlIGlzIC4uLiB3aHkgaXMgdGhpcyBub3QgdXNpbmcgZHJtX2hkY3A/Cj4gPiA+Pj4g
LURhbmllbAo+ID4gPj4+Cj4gPiA+Pj4+IFRoZSBhbmFseXNpcyBpcyBhcyBmb2xsb3dzOgo+ID4g
Pj4+Pgo+ID4gPj4+PiAgICAyOCBzdGF0aWMgaW5saW5lIGVudW0gbW9kX2hkY3Bfc3RhdHVzIHZh
bGlkYXRlX2Jrc3Yoc3RydWN0IG1vZF9oZGNwICpoZGNwKQo+ID4gPj4+PiAgICAyOSB7Cj4gPiA+
Pj4+Cj4gPiA+Pj4+IENJRCA4OTg1MiAoIzEgb2YgMSk6IE91dC1vZi1ib3VuZHMgcmVhZCAoT1ZF
UlJVTikKPiA+ID4+Pj4KPiA+ID4+Pj4gMS4gb3ZlcnJ1bi1sb2NhbDoKPiA+ID4+Pj4gT3ZlcnJ1
bm5pbmcgYXJyYXkgb2YgNSBieXRlcyBhdCBieXRlIG9mZnNldCA3IGJ5IGRlcmVmZXJlbmNpbmcg
cG9pbnRlcgo+ID4gPj4+PiAodWludDY0X3QgKiloZGNwLT5hdXRoLm1zZy5oZGNwMS5ia3N2Lgo+
ID4gPj4+Pgo+ID4gPj4+PiAgICAzMCAgICAgICAgdWludDY0X3QgbiA9ICoodWludDY0X3QgKilo
ZGNwLT5hdXRoLm1zZy5oZGNwMS5ia3N2Owo+ID4gPj4+PiAgICAzMSAgICAgICAgdWludDhfdCBj
b3VudCA9IDA7Cj4gPiA+Pj4+ICAgIDMyCj4gPiA+Pj4+ICAgIDMzICAgICAgICB3aGlsZSAobikg
ewo+ID4gPj4+PiAgICAzNCAgICAgICAgICAgICAgICBjb3VudCsrOwo+ID4gPj4+PiAgICAzNSAg
ICAgICAgICAgICAgICBuICY9IChuIC0gMSk7Cj4gPiA+Pj4+ICAgIDM2ICAgICAgICB9Cj4gPiA+
Pj4+Cj4gPiA+Pj4+IGhkY3AtPmF1dGgubXNnLmhkY3AxLmJrc3YgaXMgYW4gYXJyYXkgb2YgNSB1
aW50OF90IGFzIGRlZmluZWQgaW4KPiA+ID4+Pj4gZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L21vZHVsZXMvaGRjcC9oZGNwLmggYXMgZm9sbG93czoKPiA+ID4+Pj4KPiA+ID4+Pj4gc3RydWN0
IG1vZF9oZGNwX21lc3NhZ2VfaGRjcDEgewo+ID4gPj4+PiAgICAgICAgICAgdWludDhfdCAgICAg
ICAgIGFuWzhdOwo+ID4gPj4+PiAgICAgICAgICAgdWludDhfdCAgICAgICAgIGFrc3ZbNV07Cj4g
PiA+Pj4+ICAgICAgICAgICB1aW50OF90ICAgICAgICAgYWluZm87Cj4gPiA+Pj4+ICAgICAgICAg
ICB1aW50OF90ICAgICAgICAgYmtzdls1XTsKPiA+ID4+Pj4gICAgICAgICAgIHVpbnQxNl90ICAg
ICAgICByMHA7Cj4gPiA+Pj4+ICAgICAgICAgICB1aW50OF90ICAgICAgICAgYmNhcHM7Cj4gPiA+
Pj4+ICAgICAgICAgICB1aW50MTZfdCAgICAgICAgYnN0YXR1czsKPiA+ID4+Pj4gICAgICAgICAg
IHVpbnQ4X3QgICAgICAgICBrc3ZsaXN0WzYzNV07Cj4gPiA+Pj4+ICAgICAgICAgICB1aW50MTZf
dCAgICAgICAga3N2bGlzdF9zaXplOwo+ID4gPj4+PiAgICAgICAgICAgdWludDhfdCAgICAgICAg
IHZwWzIwXTsKPiA+ID4+Pj4KPiA+ID4+Pj4gICAgICAgICAgIHVpbnQxNl90ICAgICAgICBiaW5m
b19kcDsKPiA+ID4+Pj4gfTsKPiA+ID4+Pj4KPiA+ID4+Pj4gdmFyaWFibGUgbiBpcyBnb2luZyB0
byBjb250YWluIHRoZSBjb250YWlucyBvZiByMHAgYW5kIGJjYXBzLiBJJ20gbm90Cj4gPiA+Pj4+
IHN1cmUgaWYgdGhhdCBpcyBpbnRlbnRpb25hbC4gSWYgbm90LCB0aGVuIHRoZSBjb3VudCBpcyBn
b2luZyB0byBiZQo+ID4gPj4+PiBpbmNvcnJlY3QgaWYgdGhlc2UgYXJlIG5vbi16ZXJvLgo+ID4g
Pj4+Pgo+ID4gPj4+PiBDb2xpbgo+ID4gPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiA+ID4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+ID4+IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4gPiA+Cj4gPiA+Cj4KPgo+Cj4g
LS0KPiBEYW5pZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9u
Cj4gKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaAoKCgotLQpEYW5p
ZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5
IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
