Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9C81CA7A0
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 11:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0356EAC6;
	Fri,  8 May 2020 09:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6ABF6E14C;
 Fri,  8 May 2020 09:58:14 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id 47so432830uaj.12;
 Fri, 08 May 2020 02:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=h+Ow8GLXkf8UeFml/y9EjQyW2YoIRfTTMNxPww1P80U=;
 b=Vj3CyfBITt7jn/LoVEO1k3fbMhNasmEHZ0vjQ1hak6ir7JiHGJGeC5VMBCi69E6yp3
 z615OZc+DBIkvXE43h/teSWB1plAcQrm/in/hIOIilBpLHS29XTaTjR3fYjZ8TXj2YVm
 +nmVd7BUkvBq6OfmSM33Ksisn9e8T6dh1WvBaebPeafyzfQuTA+rYpZzWUjWfpPaBhU8
 5ES7xHhUUkTjOaLCf8pHqN2hxnD18KoM3YFJHVZDaTbfKr7aOJtitSm3D0uDF6Oqoqhp
 nnuxcPYxtoull08nE8Qrk/Yz/KVxtgdsRimAnzJ/iUlbEnK51Tl8k6CFb/CD2b4+HLww
 mJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h+Ow8GLXkf8UeFml/y9EjQyW2YoIRfTTMNxPww1P80U=;
 b=UMPf3ns1R+/ZqdPgLCLBkD0Rx7Drg+ZgU9qIwXYNH3dMz6RCI+dyYDmJBQY5POBctN
 xjYGhd3A53SCatA/GwTkJJRlnRxBYUjTwUhhC74IJ2npU2orHovX8TBkiYXcYQY0dm+y
 nQrQ/a2uA3CQ5S2mElY/CrlmV4Qa6OMvc57j8qv8kWy7iHSRvTd84Iah/WIEeiJsg2g2
 M/R0BESC0DtVtMcdHa4iVfmL787iUf/EFJbBJwZkpr6frRXbnwb83OEI8+qlysBfSbEA
 XG9CxHL4X5zqU1XsCvdTJXCbrIE72z79LxX+KJsg+wbpqL8uLjc8U7d1sxERmrm6ITRi
 PIhA==
X-Gm-Message-State: AGi0PuZPG+vw/Eue2+ydyxD1b+wva6U+yUaLJ3scWwHAMOfX66dSGRvp
 BEAKOoI3WCRBJ+9cT1CDemuPQWdqWr1AqHBQoaA=
X-Google-Smtp-Source: APiQypLLueC+gQ6JtWdMon6L4+OSMIgMsDVSp0pWulu8bnecMYjjvxOYA5Lmla6072NAWpOeOQN2W2OIZmvpjVjWehY=
X-Received: by 2002:ab0:1ea:: with SMTP id 97mr1209840ual.106.1588931893824;
 Fri, 08 May 2020 02:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-7-emil.l.velikov@gmail.com>
 <20200507180310.GC13247@ravnborg.org>
 <d79cd110-27d3-3df9-00b2-b1cad5924454@amd.com>
In-Reply-To: <d79cd110-27d3-3df9-00b2-b1cad5924454@amd.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 8 May 2020 10:55:42 +0100
Message-ID: <CACvgo50TW1zxB4a20L_JD_3kOvy+BWLVaB6R_r5fTvKnkU5XTg@mail.gmail.com>
Subject: Re: [PATCH 06/36] drm/amdgpu: use the unlocked drm_gem_object_put
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCA4IE1heSAyMDIwIGF0IDA5OjE2LCBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gQW0gMDcuMDUuMjAgdW0gMjA6MDMgc2NocmllYiBT
YW0gUmF2bmJvcmc6Cj4gPiBIaSBFbWlsLgo+ID4KPiA+IE9uIFRodSwgTWF5IDA3LCAyMDIwIGF0
IDA0OjA3OjUyUE0gKzAxMDAsIEVtaWwgVmVsaWtvdiB3cm90ZToKPiA+PiBGcm9tOiBFbWlsIFZl
bGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+ID4+Cj4gPj4gVGhlIGRyaXZlciBk
b2VzIG5vdCBob2xkIHN0cnVjdF9tdXRleCwgdGh1cyB1c2luZyB0aGUgbG9ja2VkIHZlcnNpb24g
b2YKPiA+PiB0aGUgaGVscGVyIGlzIGluY29ycmVjdC4KPiA+Pgo+ID4+IENjOiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gPj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiA+PiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiA+PiBGaXhlczogYTM5NDE0NzE2Y2EwICgiZHJtL2FtZGdwdTogYWRkIGluZGVw
ZW5kZW50IERNQS1idWYgaW1wb3J0IHY5Iik6Cj4gPj4gU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxp
a292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+Cj4gPj4gLS0tCj4gPj4gICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jIHwgMiArLQo+ID4+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMKPiA+PiBpbmRleCA0M2Q4ZWQ3ZGJk
MDAuLjY1MmM1N2EzYjg0NyAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZG1hX2J1Zi5jCj4gPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RtYV9idWYuYwo+ID4+IEBAIC01ODcsNyArNTg3LDcgQEAgc3RydWN0IGRybV9n
ZW1fb2JqZWN0ICphbWRncHVfZ2VtX3ByaW1lX2ltcG9ydChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LAo+ID4+ICAgICAgYXR0YWNoID0gZG1hX2J1Zl9keW5hbWljX2F0dGFjaChkbWFfYnVmLCBkZXYt
PmRldiwKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmFtZGdwdV9k
bWFfYnVmX2F0dGFjaF9vcHMsIG9iaik7Cj4gPj4gICAgICBpZiAoSVNfRVJSKGF0dGFjaCkpIHsK
PiA+PiAtICAgICAgICAgICAgZHJtX2dlbV9vYmplY3RfcHV0KG9iaik7Cj4gPj4gKyAgICAgICAg
ICAgIGRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZChvYmopOwo+ID4+ICAgICAgICAgICAgICBy
ZXR1cm4gRVJSX0NBU1QoYXR0YWNoKTsKPiA+PiAgICAgIH0KPiA+IExpa2V3aXNlIHByZXZpb3Vz
IHBhdGNoLgo+ID4gRHJvcCB0aGlzIGFzIHRoZSBwYXRjaCBpcyBjb3JyZWN0IGFmdGVyIHRoZSBy
ZW5hbWUgYSBmZXcgcGF0aGNlcyBsYXRlci4KPgo+IFdlbGwgdGhpcyBpcyBhIGJ1ZyBmaXggaW4g
dGhlIGVycm9yIHBhdGggYW5kIHNob3VsZCBwcm9iYWJseSBiZSBiYWNrCj4gcG9ydGVkLCBzbyBo
YXZpbmcgYSBzZXBhcmF0ZSBwYXRjaCBpcyBjZXJ0YWlubHkgYSBnb29kIGlkZWEuCj4KUHJlY2lz
ZWx5IHRoZSBnb2FsIGhlcmUuIFRoZSBmaXhlcyB0YWcgc2hvdWxkIGFsbG93IEdyZWcgYW5kIHRl
YW0gdG8KcGljay9wb3J0IGl0IHdoZXJlIGFwcGxpY2FibGUuCgotRW1pbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
