Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B61D9103026
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 00:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF6E6E9D9;
	Tue, 19 Nov 2019 23:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12076E3AE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 18:46:38 +0000 (UTC)
Received: from p200300ccff1223001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff12:2300:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1iX8WD-0001Sp-G9; Tue, 19 Nov 2019 19:46:29 +0100
Date: Tue, 19 Nov 2019 19:46:28 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [RFCv1 33/42] drm/omap: dsi: use atomic helper for dirtyfb
Message-ID: <20191119194628.7709b1fe@aktux>
In-Reply-To: <46aba805-1d3a-2efc-23f6-d957bf6a44c3@ti.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-34-sebastian.reichel@collabora.com>
 <20191118230535.GG35479@atomide.com>
 <e91c7fc9-18e0-cc22-4617-127fe9be2c1b@ti.com>
 <20191119143243.GH35479@atomide.com>
 <edff7dfa-8b95-48ac-59e0-14553f3c8d39@ti.com>
 <20191119150643.GI35479@atomide.com>
 <46aba805-1d3a-2efc-23f6-d957bf6a44c3@ti.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Tue, 19 Nov 2019 23:28:08 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vcCURScca5q+E26er1wwSs3sdbFMPQz0U/MLgTCv6xg=; b=c4Nik4fD2ICEryqmGjuw6MNMSA
 PnXgpWWQfdfMelcWUljwehjaF7PXp6YcpfFfm9NDviPtPRYLjYjUn1dPKC3AdJtUbBdjNR3P9qQ6D
 REfIQyWRTnQxDvOfeWRn6zt84vu419IbdDDFzw8MNrxTOBBZI0BGSlNXsx9tJzajnk+g=;
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxOSBOb3YgMjAxOSAxNzo1NTo1NyArMDIwMApUb21pIFZhbGtlaW5lbiA8dG9taS52
YWxrZWluZW5AdGkuY29tPiB3cm90ZToKCj4gT24gMTkvMTEvMjAxOSAxNzowNiwgVG9ueSBMaW5k
Z3JlbiB3cm90ZToKPiAKPiA+PiBUaGUgdXNlcnNwYWNlIGFwcHMgbmVlZCB0byBkbyB0aGlzLiBJ
ZiB0aGV5J3JlIHVzaW5nIHNpbmdsZS1idWZmZXJpbmcsIHRoZW4KPiA+PiB1c2luZyB0aGUgZGly
dHlmYiBpb2N0bCBzaG91bGQgZG8gdGhlIHRyaWNrLCBhZnRlciB0aGUgU0dYIGhhcyBmaW5pc2hl
ZAo+ID4+IGRyYXdpbmcuICAKPiA+IAo+ID4gU291bmRzIGxpa2UgdGhhdCdzIG5vdCBoYXBwZW5p
bmcuCj4gPiAKPiA+IEJ1dCB3aHkgd291bGQgdGhlIHVzZXJzcGFjZSBhcHAgbmVlZCB0byBrbm93
IHRoaXMgbWlnaHQgYmUgbmVlZGVkIGZvcgo+ID4gYSBEU0kgY29tbWFuZCBtb2RlIGRpc3BsYXkg
YW5kIHRoYXQgaXQncyBub3QgbmVlZGVkIGZvciBIRE1JPyAgCj4gCj4gV2hlbiBkb3VibGUtYnVm
ZmVyaW5nLCB0aGUgdXNlcnNwYWNlIGRvZXNuJ3QgbmVlZCB0byBjYXJlLCBhcyB0aGUgCj4gcGFn
ZS1mbGlwIGlvY3RsIGV4cGxpY2l0bHkgdGVsbHMgdGhhdCB0aGUgYnVmZmVyIGlzIHJlYWR5Lgo+
IAo+IFdoZW4gc2luZ2xlIGJ1ZmZlcmluZywgZWl0aGVyIHRoZSB1c2Vyc3BhY2UgaGFzIHRvIHRl
bGwgdGhhdCB0aGUgYnVmZmVyIAo+IGlzIG5vdyByZWFkeSwgb3IgdGhlIGtlcm5lbCBoYXMgdG8g
Z3Vlc3MgYmFzZWQgb24gc29tZXRoaW5nLiBCdXQgYWZhaWNzLCAKPiB0aGUgbGF0dGVyIGlzIGFs
d2F5cyBhIGd1ZXNzLCBhbmQgbWF5IG5vdCBiZSBhIGdvb2QgZ3Vlc3MuCj4gCj4gVGhlIGtlcm5l
bCBjb3VsZCB0cmlnZ2VyIGEgZGVsYXllZCB1cGRhdGUgYmFzZWQgb24sIHNheSwgcGFnZSBmYXVs
dCBpZiAKPiBkcmF3aW5nIHdpdGggQ1BVLiBCdXQgaG93IG11Y2ggZGVsYXllZC4uLiBBbmQgd2l0
aCB0aGlzIHNjZW5hcmlvLCB3ZSAKPiB3b3VsZCBzb21laG93IG5lZWQgdG8gZmluZCBhIHdheSB0
byBjYXRjaCB0aGUgd3JpdGVzIGZyb20gYW55IElQIHRvIHRoZSAKPiBidWZmZXIsIGFuZCBhZmFp
ayB0aGVyZSdzIG5vIHN1Y2ggdGhpbmcuCj4gCj4gPj4gSXQncyBwcm9iYWJseSBzb21ld2hhdCBk
aWZmaWN1bHQgaWYgRUdMIGlzIGNvbnRyb2xsaW5nIHRoZSBkaXNwbGF5LCBhcywKPiA+PiBhZmFp
aywgU0dYIEVHTCBpcyBjbG9zZWQgc291cmNlLCBhbmQgdGhhdCdzIHByb2JhYmx5IHdoZXJlIGl0
IHNob3VsZCBiZQo+ID4+IGRvbmUuCj4gPj4KPiA+PiBCdXQgYWRkaW5nIGJhY2sgdGhlIGhhY2t5
IG9tYXAgZ2VtIHN5bmMgc3R1ZmYsIGFuZCB0aGVuIHNvbWVob3cgZ3Vlc3NpbmcKPiA+PiBmcm9t
IHRoZSBzeW5jIGZpbmlzaCB0aGF0IHNvbWUgZGlzcGxheSBuZWVkcyB0byBiZSB1cGRhdGVkLi4u
IEl0IGp1c3QgZG9lcwo+ID4+IG5vdCBzb3VuZCByaWdodCB0byBtZS4gIAo+ID4gCj4gPiBSaWdo
dCBpdCdzIHVnbHkuIFN0aWxsIHNvdW5kcyBsaWtlIHdlIG5lZWQgc29tZXRoaW5nIGluIHRoZSBr
ZXJuZWwKPiA+IHRoYXQga25vd3MgInRoaXMgaXMgYSBEU0kgY29tbWFuZCBtb2RlIExDRCBhbmQg
bmVlZHMgdG8gYmUgdXBkYXRlZCIuICAKPiAKd2VsbCwgaWYgd2UgbG9vayBicm9hZGVyIGFyb3Vu
ZCBhbmQgbm90IG9ubHkgYXQgdGhlIHJlbWFpbmluZyBkaXNwbGF5cwp0byBiZSBjb252ZXJ0ZWQg
ZnJvbSBvbWFwZHJtIHRvIGdlbmVyaWMgYW5kIGxvb2sgYXQgbW9yZSBkaXNwbGF5cywgdGhlcmUK
YXJlIGFsc28gRVBEcy4KCj4gSSB0aGluayBvbmUgb3B0aW9uIGlzIHRvIHJlZnJlc2ggdGhlIGNv
bW1hbmQgbW9kZSBkaXNwbGF5IGFsbCB0aGUgdGltZS4gCj4gRWl0aGVyIHVzaW5nIGEgdGltZXIs
IG9yIHRyaWdnZXIgdXBkYXRlcyBiYXNlZCBvbiB0aGUgcHJldmlvdXMgdXBkYXRlIAo+IGJlaW5n
IGZpbmlzaGVkLgo+IAo+IE9mIGNvdXJzZSwgdGhhdCdzIGtpbmQgb2YgYWdhaW5zdCB0aGUgd2hv
bGUgcG9pbnQgb2YgbWFudWFsIHVwZGF0ZSAKPiBkaXNwbGF5LCBidXQgdGhlbiBpdCBzaG91bGQg
ZWZmZWN0aXZlbHkgYmVoYXZlIGxpa2UgYSBjb252ZW50aW9uYWwgCj4gYWx3YXlzLXVwZGF0aW5n
IGRpc3BsYXkgKGV4Y2VwdCB5b3VyIEhXIGlzIG1vcmUgZXhwZW5zaXZlIGFuZCBjb25zdW1lcyAK
PiBtb3JlIHBvd2VyIHRoYW4gYSBjb252ZW50aW9uYWwgZGlzcGxheSkuCj4gCkFuZCBhZ2FpbiBh
cyBhbiBleHRyZW1lIGV4YW1wbGUgYWJvdXQgcG93ZXIgY29uc3VtcHRpb246IEVQRHMuClNvIEkg
Z3Vlc3Mgd2UgbmVlZCBhIGdlbmVyaWMgaW50ZXJmYWNlIGZvciB1c2Vyc3BhY2UtdHJpZ2dlcmVk
CnJlZnJlc2hlcyBhbnl3YXlzLiBBbmQgaW4gdGhhdCBjYXNlIHRoYXQgYXJlIG9ubHkgcGFydGx5
IHJlZnJlc2hlcy4KClJlZ2FyZHMsCkFuZHJlYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
