Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8492588E8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB26C89E9B;
	Tue,  1 Sep 2020 07:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D5B89FAD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 07:20:43 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w5so271490wrp.8
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 00:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=2KXGsnWveuv8TYE+4kcj7m/txmIorO9rmFTvYW68gRE=;
 b=CYVaa2OazAfo9fs+oQz6VJe/dhMvRXlvMkZbiUr95WgtRlWZwgn2PmWHp4DeCLaqzv
 GKPnD7aUrSBR4B/bdL1L7tcYzSEhe7WkfY0pOepNsMfDLhhog1MWfhIrIm3CsWIXVitl
 GKow614co6E+2AP9f/QWTVhcls1VLYEIDQ/9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2KXGsnWveuv8TYE+4kcj7m/txmIorO9rmFTvYW68gRE=;
 b=akxFje0tDUns6oKjKxr9fRMRrnfOh5D4DqrCvgwr3CfGTaqT5alGzBVwWW8iB8Dxsr
 XCWcayyis80NMOsNo1AuxWHE1EC7/YkgmOqdoXE6bwkhY97ighUoxaeN6Fjyzxzt/Thb
 VXCRDF3bF75Xvx50lvVIoZv0VFcrDAZV/dDTCkcee3jf831TKSy53iFRkrP2s9J3TLxt
 sfQQm5QhXLDSH5/cQ+3rsikAv2qfqQ4j9blbc79mymSbDXDsLsy/dBP2IYgJnH7m+pw9
 Pod410EbJQ094W/1lnKldOPm6pLP6VzGKGXbMUO0lhePMsiZai7ldDaKMPMKRnu8bQqt
 dq+g==
X-Gm-Message-State: AOAM530YiwT8qJJAbiQuutBIw8axyNOrq/fbk3BAKdlc23e+RSooygim
 kakG/5sC9IVuTwgZTqAQayHwfQ==
X-Google-Smtp-Source: ABdhPJy/gWliC1wM/74T66k5tE97YY7okLp/IlLTOR3cmWwzfqC4KrkK9OP8Sz7GsICD6VUBL7CIXA==
X-Received: by 2002:a5d:4c44:: with SMTP id n4mr328130wrt.272.1598944842273;
 Tue, 01 Sep 2020 00:20:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 201sm557436wma.27.2020.09.01.00.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 00:20:41 -0700 (PDT)
Date: Tue, 1 Sep 2020 09:20:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>
Subject: Re: [PATCH 3/7] drm/amd/display: Avoid using unvalidated
 tiling_flags and tmz_surface in prepare_planes
Message-ID: <20200901072039.GQ2352366@phenom.ffwll.local>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
 <20200730203642.17553-4-nicholas.kazlauskas@amd.com>
 <20200807083041.GL6419@phenom.ffwll.local>
 <4117cdee-2f5d-a8bd-1e80-1c550c9d9af3@amd.com>
 <20200810122553.GI2352366@phenom.ffwll.local>
 <9fc38b52-6b46-fec8-e511-3fc3e9d2c151@gmail.com>
 <CAAxE2A5BXVJ9xQ=C6F=Df1MCGUKTjV7yR=6x5hu6vfARp1SD7Q@mail.gmail.com>
 <20200812135447.GF2352366@phenom.ffwll.local>
 <CAAxE2A7TC14u9_kkJnpG7-_rLG-q_vkyjhh6=pCDmL0NcfBWaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAxE2A7TC14u9_kkJnpG7-_rLG-q_vkyjhh6=pCDmL0NcfBWaQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTcsIDIwMjAgYXQgMDI6MjM6NDdBTSAtMDQwMCwgTWFyZWsgT2zFocOhayB3
cm90ZToKPiBPbiBXZWQsIEF1ZyAxMiwgMjAyMCBhdCA5OjU0IEFNIERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4gd3JvdGU6Cj4gCj4gPiBPbiBUdWUsIEF1ZyAxMSwgMjAyMCBhdCAwOTo0
MjoxMUFNIC0wNDAwLCBNYXJlayBPbMWhw6FrIHdyb3RlOgo+ID4gPiBUaGVyZSBhcmUgYSBmZXcg
Y2FzZXMgd2hlbiB0aGUgZmxhZ3MgY2FuIGNoYW5nZSwgZm9yIGV4YW1wbGUgRENDIGNhbiBiZQo+
ID4gPiBkaXNhYmxlZCBkdWUgdG8gYSBodyBsaW1pdGF0aW9uIGluIHRoZSAzZCBlbmdpbmUuIE1v
ZGlmaWVycyBnaXZlIHRoZQo+ID4gPiBtaXNsZWFkaW5nIGltcHJlc3Npb24gdGhhdCB0aGV5IGhl
bHAgd2l0aCB0aGF0LCBidXQgdGhleSBkb24ndC4gVGhleQo+ID4gZG9uJ3QKPiA+ID4gcmVhbGx5
IGhlbHAgd2l0aCBhbnl0aGluZy4KPiA+Cj4gPiBCdXQgaWYgdGhhdCBoYXBwZW5zLCBob3cgZG8g
eW91IHRlbGwgdGhlIG90aGVyIHNpZGUgdGhhdCBpdCBuZWVkcyB0bwo+ID4gc2FtcGxlIG5ldyBm
bGFncz8gRG9lcyB0aGF0IGp1c3QgaGFwcGVuIGFsbCB0aGUgdGltZT8KPiA+Cj4gPiBBbHNvIGRv
IHRoZSBEREMgc3RhdGUgY2hhbmdlcyBoYXBwZW4gZm9yIHNoYXJlZCBidWZmZXJzIHRvbz8KPiA+
Cj4gCj4gSSB0aG91Z2h0IHdlIHdlcmUgb25seSB0YWxraW5nIGFib3V0IHNoYXJlZCBidWZmZXJz
Lgo+IAo+IElmIHRoZSBvdGhlciBzaWRlIGlzIG9ubHkgYSBjb25zdW1lciBhbmQgdGhlIHByb2R1
Y2VyIG11c3QgZGlzYWJsZSBEQ0MsIHRoZQo+IHByb2R1Y2VyIGRlY29tcHJlc3NlcyBEQ0MgYW5k
IHRoZW4gZGlzYWJsZXMgaXQgYW5kIHVwZGF0ZXMgdGhlIEJPIGZsYWdzLgo+IFRoZSBjb25zdW1l
ciBkb2Vzbid0IG5lZWQgdGhlIG5ldyBmbGFncywgYmVjYXVzZSBldmVuIGlmIERDQyBzdGF5cyBl
bmFibGVkCj4gaW4gdGhlIGNvbnN1bWVyLCBpdCdzIGluIGEgZGVjb21wcmVzc2VkIHN0YXRlIChp
dCBoYXMgbm8gZWZmZWN0KS4gT25seSB0aGUKPiBwcm9kdWNlciBrbm93cyBpdCdzIGRpc2FibGVk
LCBhbmQgYW55IG5ldyBjb25zdW1lciB3aWxsIGFsc28ga25vdyBpdCB3aGVuCj4gaXQgcXVlcmll
cyB0aGUgbGF0ZXN0IEJPIGZsYWdzLgo+IAo+IEl0IGRvZXNuJ3Qgd29yayBpZiBib3RoIHNpZGVz
IHVzZSB3cml0ZXMsIGJlY2F1c2UgaXQncyBub3QgY29tbXVuaWNhdGVkCj4gdGhhdCBEQ0MgaXMg
ZGlzYWJsZWQgKEJPIGZsYWdzIGFyZSBxdWVyaWVkIG9ubHkgb25jZSkuIFRoaXMgaGFzbid0IGJl
ZW4gYQo+IHByb2JsZW0gc28gZmFyLgo+IAo+IElzIHRoZXJlIGEgd2F5IHRvIGRpc2FibGUgREND
IGNvcnJlY3RseSBhbmQgc2FmZWx5IGFjcm9zcyBwcm9jZXNzZXM/IFllcy4KPiBTbyB3aHkgZG9u
J3Qgd2UgZG8gaXQ/IEJlY2F1c2UgaXQgd291bGQgYWRkIG1vcmUgR1BVIG92ZXJoZWFkLgoKWWVh
aCBidXQgaW4gdGhpcyBjYXNlIHlvdSBjYW4gZ2V0IGF3YXkgd2l0aCBqdXN0IHNhbXBsaW5nIHRo
ZSBibyBmbGFncwpvbmNlICh3aGljaCBpcyB3aGF0IHlvdSdyZSBkb2luZyksIHNvIGRvaW5nIHRo
YXQgYXQgYWRkZmIgdGltZSBzaG91bGQgYmUKcGVyZmVjdGx5IGZpbmUuIE9mYyB5b3UgbWlnaHQg
d2FzdGUgYSBiaXQgb2YgJHNvbWV0aGluZyBhbHNvIHNjYW5uaW5nIG91dAp0aGUgY29tcHJlc3Np
b24gbWV0YWRhdGEgKHdoaWNoIHRlbGxzIHRoZSBodyB0aGF0IGl0J3MgYWxsIHVuY29tcHJlc3Nl
ZCksCmJ1dCB0aGF0IGRvZXNuJ3Qgc2VlbSB0byBiZSBhIHByb2JsZW0gZm9yIHlvdS4KClNvIHRy
ZWF0aW5nIHRoZSBsZWdhY3kgYm8gZmxhZ3MgYXMgaW52YXJpYW50IGZvciBzaGFyZWQgYnVmZmVy
cyBzaG91bGQgYmUKcGVyZmVjdGx5IGZpbmUuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29m
dHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
