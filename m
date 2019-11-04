Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 370DDEE5EB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 18:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6D16E787;
	Mon,  4 Nov 2019 17:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DC16E750
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 17:24:40 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id a15so18039154wrf.9
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 09:24:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=9pszL8eDm49mTZV2/1Bqz/fRAti6r/IlBtJ/fxhua+I=;
 b=WBuTzmiE7ennf86FH+rJXdpuTfpi8eauDaSE2r6T6veJxdSnyucwm0+o9nepZUmMzY
 sOhQGP7KFtDIH63wdsEoBcST6UScxt8DLibaRsBGLoLHmW+NaTpdqnzdQAO4rx+89wGt
 At1Vvzi95J25m/3cnJpKl9vA/XgCFfJuzLugzB0AaFaQvbfLl0j9UeHc1s+4glDcHKME
 sIqaEpXxMuL8Djeq4leXFSALCaNhRTfjtFzmh+zApWt3U3L0p6M2Cr9FpGtbFmvfT6Ol
 ChZsRgzvv+EG7IGALBPtbCu1csPMmScsZ8xWGIhObn7QiRc1t8Nh5u6NOLq1L0/M8f1v
 DS1Q==
X-Gm-Message-State: APjAAAVFnSHknXX34hB8V1gdJc4+5QaQAU5kIWJI14RzYwg43EnLYOID
 Q/O4DHUOQzXN6XfKIesj1HSfBw==
X-Google-Smtp-Source: APXvYqxa/Ivqn5KKJR4deEms/Pcfzim4xEaRh74HizYoK7WTZ1bGTKUfP+QphJfwPghFqr0EumAsrw==
X-Received: by 2002:adf:eb87:: with SMTP id t7mr22285079wrn.294.1572888278607; 
 Mon, 04 Nov 2019 09:24:38 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id f143sm18906127wme.40.2019.11.04.09.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 09:24:36 -0800 (PST)
Date: Mon, 4 Nov 2019 18:24:34 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: drm/amd/display: Add HDCP module - static analysis bug report
Message-ID: <20191104172434.GJ10326@phenom.ffwll.local>
Mail-Followup-To: Alex Deucher <alexdeucher@gmail.com>,
 Harry Wentland <hwentlan@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <951eb7dc-bebe-5049-4998-f199e18b0bf3@canonical.com>
 <20191009163235.GT16989@phenom.ffwll.local>
 <a0d5f3a3-a2b3-5367-42f9-bde514571e25@amd.com>
 <CAKMK7uEtJRDhibWDv2TB2WrFzFooMWPSbveDD2N-rudAwvzVFA@mail.gmail.com>
 <c8f96b46-e81e-1e41-aafc-5f6ec236d66f@amd.com>
 <CAKMK7uHr3aeJRqJAscDDfsuBBnVXCeN9SS36-1UGuK84NyOD5Q@mail.gmail.com>
 <CAKMK7uH6EoY9MkzjSjU+Fe=E-XB4Tf9d2VsW=Tr=tFy1J-dJgg@mail.gmail.com>
 <53bf910b-5f9c-946b-17ee-602c24c0fa96@amd.com>
 <20191104165457.GH10326@phenom.ffwll.local>
 <CADnq5_PxMQ_AkBCHXU_YUAMWaPcH-nkOJNGNKnUOJWSTYV6X+A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_PxMQ_AkBCHXU_YUAMWaPcH-nkOJNGNKnUOJWSTYV6X+A@mail.gmail.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=9pszL8eDm49mTZV2/1Bqz/fRAti6r/IlBtJ/fxhua+I=;
 b=aI/PNRQnk9qdxM4nIrcmViqV8A8LrEFyRdARCppACjh3URDxCaRHnfonKFogswweFY
 B/0JbhI/OtES2PNVgNgyjORBrq5f1PShbFF/Ib5pjgd56dhGC/Xv2oKxVBGj5UQTIR43
 OiA8GtDi87/zOrsPqTOkHtKtRZyZtHUjpLG/E=
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
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Harry Wentland <hwentlan@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMTI6MDU6NDBQTSAtMDUwMCwgQWxleCBEZXVjaGVyIHdy
b3RlOgo+IE9uIE1vbiwgTm92IDQsIDIwMTkgYXQgMTE6NTUgQU0gRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIE5vdiAwNCwgMjAxOSBhdCAwMzoy
MzowOVBNICswMDAwLCBIYXJyeSBXZW50bGFuZCB3cm90ZToKPiA+ID4gT24gMjAxOS0xMS0wNCA1
OjUzIGEubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+ID4gT24gV2VkLCBPY3QgOSwgMjAx
OSBhdCAxMDo1OCBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyb3RlOgo+ID4g
PiA+PiBPbiBXZWQsIE9jdCA5LCAyMDE5IGF0IDEwOjQ2IFBNIExha2hhLCBCaGF3YW5wcmVldAo+
ID4gPiA+PiA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4gd3JvdGU6Cj4gPiA+ID4+Pgo+ID4g
PiA+Pj4gSSBtaXN1bmRlcnN0b29kIGFuZCB3YXMgdGFsa2luZyBhYm91dCB0aGUga3N2IHZhbGlk
YXRpb24gc3BlY2lmaWNhbGx5Cj4gPiA+ID4+PiAodXNhZ2Ugb2YgZHJtX2hkY3BfY2hlY2tfa3N2
c19yZXZva2VkKCkpLgo+ID4gPiA+Pgo+ID4gPiA+PiBIbSBmb3IgdGhhdCBzcGVjaWZpY2FsbHkg
SSB0aGluayB5b3Ugd2FudCB0byBkbyBib3RoLCBpLmUuIGJvdGgKPiA+ID4gPj4gY29uc3VsdCB5
b3VyIHBzcCwgYnV0IGFsc28gY2hlY2sgZm9yIHJldm9rZWQga3N2cyB3aXRoIHRoZSBjb3JlCj4g
PiA+ID4+IGhlbHBlci4gQXQgbGVhc3Qgb24gc29tZSBwbGF0Zm9ybXMgb25seSB0aGUgY29yZSBo
ZWxwZXIgbWlnaHQgaGF2ZSB0aGUKPiA+ID4gPj4gdXBkYXRlZCByZXZva2UgbGlzdC4KPiA+ID4g
Pj4KPiA+ID4KPiA+ID4gSSB0aGluayBpdCdzIGFuIGVpdGhlci9vci4gRWl0aGVyIHdlIHVzZSBh
biBIRENQIGltcGxlbWVudGF0aW9uIHRoYXQncwo+ID4gPiBmdWxseSBydW5uaW5nIGluIHg4NiBr
ZXJuZWwgc3BhY2UgKHN0aWxsIG5vdCBzdXJlIGhvdyB0aGF0J3MgY29tcGxpYW50KQo+ID4gPiBv
ciB3ZSBmdWxseSByZWx5IG9uIG91ciBQU1AgRlcgdG8gZG8gd2hhdCBpdCdzIGRlc2lnbmVkIHRv
IGRvLiBJIGRvbid0Cj4gPiA+IHRoaW5rIGl0IG1ha2VzIHNlbnNlIHRvIG1peCBhbmQgbWF0Y2gg
aGVyZS4KPiA+Cj4gPiBUaGVuIHlvdSBuZWVkIHRvIHNvbWVob3cgdGllIHRoZSByZXZva2UgbGlz
dCB0aGF0J3MgaW4gdGhlIHBzcCB0byB0aGUKPiA+IHJldm9rZSBsaXN0IHVwZGF0ZSBsb2dpYyB3
ZSBoYXZlLiBUaGF0J3Mgd2hhdCB3ZSd2ZSBkb25lIGZvciBoZGNwMiAod2hpY2gKPiA+IGlzIHNp
bWlsYXJseSB0byB5b3VycyBpbXBsZW1lbnRlZCBpbiBodykuIFRoZSBwb2ludCBpcyB0aGF0IG9u
IGxpbnV4IHdlCj4gPiBub3cgaGF2ZSBhIHN0YW5kYXJkIHdheSB0byBnZXQgdGhlc2UgcmV2b2tl
IGxpc3RzIHVwZGF0ZWQvaGFuZGxlZC4KPiA+Cj4gPiBJIGd1ZXNzIGl0IHdhc24ndCBjbGVhciBo
b3cgZXhhY3RseSBJIHRoaW5rIHlvdSdyZSBzdXBwb3NlZCB0byBjb21iaW5lCj4gPiB0aGVtPwo+
IAo+IFRoZXJlJ3Mgbm8gZHJpdmVyIHN3IHJlcXVpcmVkIGF0IGFsbCBmb3Igb3VyIGltcGxlbWVu
dGF0aW9uIGFuZCBhcyBmYXIKPiBhcyBJIGtub3csIEhEQ1AgMi54IHJlcXVpcmVzIHRoYXQgYWxs
IG9mIHRoZSBrZXkgcmV2b2tlIGhhbmRsaW5nIGJlCj4gaGFuZGxlZCBpbiBhIHNlY3VyZSBwcm9j
ZXNzb3IgcmF0aGVyIHRoYW4gdGhhbiBvbiB0aGUgaG9zdCBwcm9jZXNzb3IsCj4gc28gSSdtIG5v
dCBzdXJlIGhvdyB3ZSBtYWtlIHVzZSBpZiBpdC4gIEFsbCB0aGUgZHJpdmVyIHN3IGlzCj4gcmVz
cG9uc2libGUgZm9yIGRvaW5nIGlzIHNhdmluZy9yZXN0b3JpbmcgdGhlIHBvdGVudGlhbGx5IHVw
ZGF0ZWQgc3JtCj4gYXQgc3VzcGVuZC9yZXN1bWUvZXRjLgoKVWgsIHlvdSBkb24ndCBoYXZlIGEg
cGVybWFuZW50IHN0b3JlIG9uIHRoZSBjaGlwPyBJIHRob3VnaHQgYW5vdGhlcgpyZXF1aXJlbWVu
dCBpcyB0aGF0IHlvdSBjYW4ndCBkb3duZ3JhZGUuCgpBbmQgZm9yIGh3IHNvbHV0aW9ucyBhbGwg
eW91IGRvIHdpdGggdGhlIHVwZGF0ZWQgcmV2b2tlIGNlcnQgaXMgc3R1ZmYgaXQKaW50byB0aGUg
aHcsIGl0J3MgcHVyZWx5IGZvciB1cGRhdGluZyBpdC4gQW5kIHRob3NlIHVwZGF0ZXMgbmVlZCB0
byBjb21lCmZyb20gc29tZXdoZXJlIGVsc2UgKHVzdWFsbHkgaW4gdGhlIG1lZGlhIHlvdSBwbGF5
KSwgdGhlIGtlcm5lbCBjYW4ndApmZXRjaCB0aGVtIG92ZXIgdGhlIGludGVybmV0IGl0c2VsZi4g
SSB0aG91Z2h0IHdlIGFscmVhZHkgaGFkIHRoZSBmdW5jdGlvbgp0byBnaXZlIHlvdSB0aGUgc3Jt
IGRpcmVjdGx5IHNvIHlvdSBjYW4gc3R1ZmYgaXQgaW50byB0aGUgaHcsIGJ1dCBsb29rcwpsaWtl
IHRoYXQgcGFydCBpc24ndCB0aGVyZSAoeWV0KS4KLURhbmllbAoKPiAKPiBBbGV4Cj4gCj4gPiAt
RGFuaWVsCj4gPgo+ID4KPiA+ID4KPiA+ID4gPj4+IEZvciB0aGUgZGVmaW5lcyBJIHdpbGwgY3Jl
YXRlIHBhdGNoZXMgdG8gdXNlIGRybV9oZGNwIHdoZXJlIGl0IGlzIHVzYWJsZS4KPiA+ID4gPj4K
PiA+ID4gPj4gVGhhbmtzIGEgbG90LiBJbWUgb25jZSB3ZSBoYXZlIHNoYXJlZCBkZWZpbml0aW9u
cyBpdCdzIG11Y2ggZWFzaWVyIHRvCj4gPiA+ID4+IGFsc28gc2hhcmUgc29tZSBoZWxwZXJzLCB3
aGVyZSBpdCBtYWtlcyBzZW5zZS4KPiA+ID4gPj4KPiA+ID4gPj4gQXNpZGUgSSB0aGluayB0aGUg
aGRjcCBjb2RlIGNvdWxkIGFsc28gdXNlIGEgYml0IG9mIGRlbWlkbGF5ZXJpbmcuIEF0Cj4gPiA+
ID4+IGxlYXN0IEknbSBub3QgdW5kZXJzdGFuZGluZyB3aHkgeW91IGFkZCBhIDJuZCBhYnN0cmFj
dGlvbiBsYXllciBmb3IKPiA+ID4gPj4gaTJjL2RwY2QsIGRtX2hlbHBlciBhbHJlYWR5IGhhcyB0
aGF0LiBUaGF0IHNlZW1zIGxpa2Ugb25lIGFic3RyYWN0aW9uCj4gPiA+ID4+IGxheWVyIHRvbyBt
dWNoLgo+ID4gPiA+Cj4gPiA+ID4gSSBoYXZlbid0IHNlZW4gYW55dGhpbmcgZmx5IGJ5IG9yIGlu
IHRoZSBsYXRlc3QgcHVsbCByZXF1ZXN0IC4uLiB5b3UKPiA+ID4gPiBmb2xrcyBzdGlsbCB3b3Jr
aW5nIG9uIHRoaXMgb3IgbW9yZSBwdXQgb24gdGhlICJtYXliZSwgcHJvYmFibHkgbmV2ZXIiCj4g
PiA+ID4gcGlsZT8KPiA+ID4gPgo+ID4gPgo+ID4gPiBGb2xsb3dpbmcgdXAgd2l0aCBCaGF3YW4u
Cj4gPiA+Cj4gPiA+IEhhcnJ5Cj4gPiA+Cj4gPiA+ID4gLURhbmllbAo+ID4gPiA+Cj4gPiA+ID4K
PiA+ID4gPj4gLURhbmllbAo+ID4gPiA+Pgo+ID4gPiA+Pj4KPiA+ID4gPj4+Cj4gPiA+ID4+PiBC
aGF3YW4KPiA+ID4gPj4+Cj4gPiA+ID4+PiBPbiAyMDE5LTEwLTA5IDI6NDMgcC5tLiwgRGFuaWVs
IFZldHRlciB3cm90ZToKPiA+ID4gPj4+PiBPbiBXZWQsIE9jdCA5LCAyMDE5IGF0IDg6MjMgUE0g
TGFraGEsIEJoYXdhbnByZWV0Cj4gPiA+ID4+Pj4gPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+
IHdyb3RlOgo+ID4gPiA+Pj4+PiBIaSwKPiA+ID4gPj4+Pj4KPiA+ID4gPj4+Pj4gVGhlIHJlYXNv
biB3ZSBkb24ndCB1c2UgZHJtX2hkY3AgaXMgYmVjYXVzZSBvdXIgcG9saWN5IGlzIHRvIGRvIGhk
Y3AKPiA+ID4gPj4+Pj4gdmVyaWZpY2F0aW9uIHVzaW5nIFBTUC9IVyAob25ib2FyZCBzZWN1cmUg
cHJvY2Vzc29yKS4KPiA+ID4gPj4+PiBpOTE1IGFsc28gdXNlcyBodyB0byBhdXRoLCB3ZSBzdGls
bCB1c2UgdGhlIHBhcnRzIGZyb20gZHJtX2hkY3AgLi4uCj4gPiA+ID4+Pj4gRGlkIHlvdSBhY3R1
YWxseSBsb29rIGF0IHdoYXQncyBpbiB0aGVyZT8gSXQncyBlc3NlbnRpYWxseSBqdXN0IHNoYXJl
ZAo+ID4gPiA+Pj4+IGRlZmluZXMgYW5kIGRhdGEgc3RydWN0dXJlcyBmcm9tIHRoZSBzdGFuZGFy
ZCwgcGx1cyBhIGZldyBtaW5pbWFsCj4gPiA+ID4+Pj4gaGVscGVycyB0byBlbi9kZWNvZGUgc29t
ZSBiaXRzLiBKdXN0IGZyb20gYSBxdWljayByZWFkIHRoZSBlbnRpcmUKPiA+ID4gPj4+PiBwYXRj
aCB2ZXJ5IG11Y2ggbG9va3MgbGlrZSBtaWRsYXllciBldmVyeXdoZXJlIGRlc2lnbiB0aGF0IHdl
Cj4gPiA+ID4+Pj4gZGlzY3Vzc2VkIGJhY2sgd2hlbiBEQyBsYW5kZWQgLi4uCj4gPiA+ID4+Pj4g
LURhbmllbAo+ID4gPiA+Pj4+Cj4gPiA+ID4+Pj4+IEJoYXdhbgo+ID4gPiA+Pj4+Pgo+ID4gPiA+
Pj4+PiBPbiAyMDE5LTEwLTA5IDEyOjMyIHAubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+
ID4+Pj4+PiBPbiBUaHUsIE9jdCAwMywgMjAxOSBhdCAxMTowODowM1BNICswMTAwLCBDb2xpbiBJ
YW4gS2luZyB3cm90ZToKPiA+ID4gPj4+Pj4+PiBIaSwKPiA+ID4gPj4+Pj4+Pgo+ID4gPiA+Pj4+
Pj4+IFN0YXRpYyBhbmFseXNpcyB3aXRoIENvdmVyaXR5IGhhcyBkZXRlY3RlZCBhIHBvdGVudGlh
bCBpc3N1ZSB3aXRoCj4gPiA+ID4+Pj4+Pj4gZnVuY3Rpb24gdmFsaWRhdGVfYmtzdiBpbgo+ID4g
PiA+Pj4+Pj4+IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcDFf
ZXhlY3V0aW9uLmMgd2l0aCByZWNlbnQKPiA+ID4gPj4+Pj4+PiBjb21taXQ6Cj4gPiA+ID4+Pj4+
Pj4KPiA+ID4gPj4+Pj4+PiBjb21taXQgZWQ5ZDhlMmJjYjAwM2VjOTQ2NThjYWZlOWIxYmIzOTYw
ZTIxMzllYwo+ID4gPiA+Pj4+Pj4+IEF1dGhvcjogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnBy
ZWV0Lkxha2hhQGFtZC5jb20+Cj4gPiA+ID4+Pj4+Pj4gRGF0ZTogICBUdWUgQXVnIDYgMTc6NTI6
MDEgMjAxOSAtMDQwMAo+ID4gPiA+Pj4+Pj4+Cj4gPiA+ID4+Pj4+Pj4gICAgICAgZHJtL2FtZC9k
aXNwbGF5OiBBZGQgSERDUCBtb2R1bGUKPiA+ID4gPj4+Pj4+IEkgdGhpbmsgdGhlIHJlYWwgcXVl
c3Rpb24gaGVyZSBpcyAuLi4gd2h5IGlzIHRoaXMgbm90IHVzaW5nIGRybV9oZGNwPwo+ID4gPiA+
Pj4+Pj4gLURhbmllbAo+ID4gPiA+Pj4+Pj4KPiA+ID4gPj4+Pj4+PiBUaGUgYW5hbHlzaXMgaXMg
YXMgZm9sbG93czoKPiA+ID4gPj4+Pj4+Pgo+ID4gPiA+Pj4+Pj4+ICAgIDI4IHN0YXRpYyBpbmxp
bmUgZW51bSBtb2RfaGRjcF9zdGF0dXMgdmFsaWRhdGVfYmtzdihzdHJ1Y3QgbW9kX2hkY3AgKmhk
Y3ApCj4gPiA+ID4+Pj4+Pj4gICAgMjkgewo+ID4gPiA+Pj4+Pj4+Cj4gPiA+ID4+Pj4+Pj4gQ0lE
IDg5ODUyICgjMSBvZiAxKTogT3V0LW9mLWJvdW5kcyByZWFkIChPVkVSUlVOKQo+ID4gPiA+Pj4+
Pj4+Cj4gPiA+ID4+Pj4+Pj4gMS4gb3ZlcnJ1bi1sb2NhbDoKPiA+ID4gPj4+Pj4+PiBPdmVycnVu
bmluZyBhcnJheSBvZiA1IGJ5dGVzIGF0IGJ5dGUgb2Zmc2V0IDcgYnkgZGVyZWZlcmVuY2luZyBw
b2ludGVyCj4gPiA+ID4+Pj4+Pj4gKHVpbnQ2NF90ICopaGRjcC0+YXV0aC5tc2cuaGRjcDEuYmtz
di4KPiA+ID4gPj4+Pj4+Pgo+ID4gPiA+Pj4+Pj4+ICAgIDMwICAgICAgICB1aW50NjRfdCBuID0g
Kih1aW50NjRfdCAqKWhkY3AtPmF1dGgubXNnLmhkY3AxLmJrc3Y7Cj4gPiA+ID4+Pj4+Pj4gICAg
MzEgICAgICAgIHVpbnQ4X3QgY291bnQgPSAwOwo+ID4gPiA+Pj4+Pj4+ICAgIDMyCj4gPiA+ID4+
Pj4+Pj4gICAgMzMgICAgICAgIHdoaWxlIChuKSB7Cj4gPiA+ID4+Pj4+Pj4gICAgMzQgICAgICAg
ICAgICAgICAgY291bnQrKzsKPiA+ID4gPj4+Pj4+PiAgICAzNSAgICAgICAgICAgICAgICBuICY9
IChuIC0gMSk7Cj4gPiA+ID4+Pj4+Pj4gICAgMzYgICAgICAgIH0KPiA+ID4gPj4+Pj4+Pgo+ID4g
PiA+Pj4+Pj4+IGhkY3AtPmF1dGgubXNnLmhkY3AxLmJrc3YgaXMgYW4gYXJyYXkgb2YgNSB1aW50
OF90IGFzIGRlZmluZWQgaW4KPiA+ID4gPj4+Pj4+PiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvbW9kdWxlcy9oZGNwL2hkY3AuaCBhcyBmb2xsb3dzOgo+ID4gPiA+Pj4+Pj4+Cj4gPiA+ID4+
Pj4+Pj4gc3RydWN0IG1vZF9oZGNwX21lc3NhZ2VfaGRjcDEgewo+ID4gPiA+Pj4+Pj4+ICAgICAg
ICAgICB1aW50OF90ICAgICAgICAgYW5bOF07Cj4gPiA+ID4+Pj4+Pj4gICAgICAgICAgIHVpbnQ4
X3QgICAgICAgICBha3N2WzVdOwo+ID4gPiA+Pj4+Pj4+ICAgICAgICAgICB1aW50OF90ICAgICAg
ICAgYWluZm87Cj4gPiA+ID4+Pj4+Pj4gICAgICAgICAgIHVpbnQ4X3QgICAgICAgICBia3N2WzVd
Owo+ID4gPiA+Pj4+Pj4+ICAgICAgICAgICB1aW50MTZfdCAgICAgICAgcjBwOwo+ID4gPiA+Pj4+
Pj4+ICAgICAgICAgICB1aW50OF90ICAgICAgICAgYmNhcHM7Cj4gPiA+ID4+Pj4+Pj4gICAgICAg
ICAgIHVpbnQxNl90ICAgICAgICBic3RhdHVzOwo+ID4gPiA+Pj4+Pj4+ICAgICAgICAgICB1aW50
OF90ICAgICAgICAga3N2bGlzdFs2MzVdOwo+ID4gPiA+Pj4+Pj4+ICAgICAgICAgICB1aW50MTZf
dCAgICAgICAga3N2bGlzdF9zaXplOwo+ID4gPiA+Pj4+Pj4+ICAgICAgICAgICB1aW50OF90ICAg
ICAgICAgdnBbMjBdOwo+ID4gPiA+Pj4+Pj4+Cj4gPiA+ID4+Pj4+Pj4gICAgICAgICAgIHVpbnQx
Nl90ICAgICAgICBiaW5mb19kcDsKPiA+ID4gPj4+Pj4+PiB9Owo+ID4gPiA+Pj4+Pj4+Cj4gPiA+
ID4+Pj4+Pj4gdmFyaWFibGUgbiBpcyBnb2luZyB0byBjb250YWluIHRoZSBjb250YWlucyBvZiBy
MHAgYW5kIGJjYXBzLiBJJ20gbm90Cj4gPiA+ID4+Pj4+Pj4gc3VyZSBpZiB0aGF0IGlzIGludGVu
dGlvbmFsLiBJZiBub3QsIHRoZW4gdGhlIGNvdW50IGlzIGdvaW5nIHRvIGJlCj4gPiA+ID4+Pj4+
Pj4gaW5jb3JyZWN0IGlmIHRoZXNlIGFyZSBub24temVyby4KPiA+ID4gPj4+Pj4+Pgo+ID4gPiA+
Pj4+Pj4+IENvbGluCj4gPiA+ID4+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gPiA+ID4+Pj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+ID4g
Pj4+Pj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gPiA+Pj4+PiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+ID4gPiA+
Pj4+Cj4gPiA+ID4+Pj4KPiA+ID4gPj4KPiA+ID4gPj4KPiA+ID4gPj4KPiA+ID4gPj4gLS0KPiA+
ID4gPj4gRGFuaWVsIFZldHRlcgo+ID4gPiA+PiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KPiA+ID4gPj4gKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZnds
bC5jaAo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IC0tCj4gPiA+ID4gRGFuaWVsIFZl
dHRlcgo+ID4gPiA+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+ID4gPiA+
ICs0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKPiA+ID4gPgo+ID4K
PiA+IC0tCj4gPiBEYW5pZWwgVmV0dGVyCj4gPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KPiA+IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCj4gPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiA+
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3
YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
