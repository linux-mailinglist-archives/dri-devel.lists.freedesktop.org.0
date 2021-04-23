Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 955BB368BD7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 06:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4CD76EB38;
	Fri, 23 Apr 2021 04:11:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8436EB38
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 04:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619151072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UEsttLkpBkpq2SJNDxCdn4ntrP1/pMb5ophnX8OcNHQ=;
 b=anYwAMcb46SASDoZpyKMlMWHKr/qIBryvcIWntskBHQ1/0xvPAbf2Kskj7dGFMZadvTXiQ
 jhEfSxn0vUnXumq4FOyoqYczqtNDd31L2NFT/M4XjJUMCk1+T/F4e2h3BInQ/qdTHnbgaZ
 7gSDatMHyULglsXWFY4nF/YYCnCSei8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-ktDP-46cMMa32OpxDGRxCw-1; Fri, 23 Apr 2021 00:11:10 -0400
X-MC-Unique: ktDP-46cMMa32OpxDGRxCw-1
Received: by mail-qt1-f198.google.com with SMTP id
 d10-20020a05622a100ab02901b8224bae03so11488468qte.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 21:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=UEsttLkpBkpq2SJNDxCdn4ntrP1/pMb5ophnX8OcNHQ=;
 b=XPdLZ7oGbup4itCZcvbQ8ryPU63cYSDDEuFL+Cwb645r9TQhEKOv4wh6atEao4Zg9j
 H+lk0bHLfucgdhDMbU1roDsC4N6FyVtj9eDrWVlSwxUH4uYpivMTXt27BsOpNo8vG45J
 sCljSGCktvH6NYDxjmGaC4E2idRoXUC8DLU1Wv2NT1LD1aq32v0t/cAZl/x0285w29F8
 2vwSSJLxsM7ayholrDrEr0w3cOOshdBQ/O1PO4Luckt+iNeMxV840cp1CtgZt7+VhWNn
 OzFI1Co2mepocFkP3H3B35s69l0gqAygnmLaQ6Loiaq8zfWoZ2dxTWgmb4escPvRAak/
 WiGg==
X-Gm-Message-State: AOAM532UBQjVrdvhGq5CD0cJl9I9GbqiFNbpeNRk1WXtGnBSHK1N1Rck
 28qjOTg497IidAXu8ES8u/VOqUsE5Kzm+a+mkya7b0yIS4tyKZADfgHs/WGjRNetCOGVMKvAQz0
 9YKOczI4rZrKU1gJ6tJB174sp8Rmx
X-Received: by 2002:a05:620a:759:: with SMTP id
 i25mr2051954qki.193.1619151070421; 
 Thu, 22 Apr 2021 21:11:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylBePZmlCk3b2HVjreUYqrF7R043bNOhqz9vj7MTklILGEdtzIHic9P0aNqf5EMN/2bwB8Yg==
X-Received: by 2002:a05:620a:759:: with SMTP id
 i25mr2051902qki.193.1619151070183; 
 Thu, 22 Apr 2021 21:11:10 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id f22sm3495254qkm.134.2021.04.22.21.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 21:11:09 -0700 (PDT)
Message-ID: <17aa145e4cfa3d8852f7411067c5c37bff771b16.camel@redhat.com>
Subject: Re: [PATCH v3 03/20] drm/dp: Move i2c init to drm_dp_aux_init, add
 __must_check and fini
From: Lyude Paul <lyude@redhat.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>
Date: Fri, 23 Apr 2021 00:11:06 -0400
In-Reply-To: <2e211a6623664714af1d180eadcd74aa7ef417db.camel@redhat.com>
References: <20210419225523.184856-1-lyude@redhat.com>
 <20210419225523.184856-4-lyude@redhat.com> <YH4PPbY1qqF2NtrN@intel.com>
 <56a931c9f284ee6a23583eb3dc59de4afaa60e93.camel@redhat.com>
 <2e211a6623664714af1d180eadcd74aa7ef417db.camel@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Oleg Vasilev <oleg.vasilev@intel.com>, dri-devel@lists.freedesktop.org,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Parshuram Thombare <pthombar@cadence.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Michal Simek <michal.simek@xilinx.com>, amd-gfx@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>, Swapnil Jakhade <sjakhade@cadence.com>,
 Thierry Reding <treding@nvidia.com>, Jonas Karlman <jonas@kwiboo.se>,
 Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Joe Perches <joe@perches.com>, Yuti Amonkar <yamonkar@cadence.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Sean Paul <sean@poorly.run>, Navid Emamdoost <navid.emamdoost@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Chris Park <Chris.Park@amd.com>,
 Eryk Brol <eryk.brol@amd.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Robert Foss <robert.foss@linaro.org>, Julia Lawall <Julia.Lawall@inria.fr>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIxLTA0LTIyIGF0IDE4OjMzIC0wNDAwLCBMeXVkZSBQYXVsIHdyb3RlOgo+IE9L
IC0gdGFsa2VkIHdpdGggVmlsbGUgYSBiaXQgb24gdGhpcyBhbmQgZGlkIHNvbWUgb2YgbXkgb3du
IHJlc2VhcmNoLCBJCj4gYWN0dWFsbHkgdGhpbmsgdGhhdCBtb3ZpbmcgaTJjIHRvIGRybV9kcF9h
dXhfaW5pdCgpIGlzIHRoZSByaWdodCBkZWNpc2lvbgo+IGZvcgo+IHRoZSB0aW1lIGJlaW5nLiBU
aGUgcmVhc29uaW5nIGJlaGluZCB0aGlzIGJlaW5nIHRoYXQgYXMgc2hvd24gYnkgbXkgcHJldmlv
dXMKPiB3b3JrIG9mIGZpeGluZyBkcml2ZXJzIHRoYXQgY2FsbCBkcm1fZHBfYXV4X3JlZ2lzdGVy
KCkgdG9vIGVhcmx5IC0gaXQgc2VlbXMKPiBsaWtlIHRoZXJlJ3MgYWxyZWFkeSBiZWVuIGRyaXZl
cnMgdGhhdCBoYXZlIGJlZW4gd29ya2luZyBqdXN0IGZpbmUgd2l0aAo+IHNldHRpbmcgdXAgdGhl
IGkyYyBkZXZpY2UgYmVmb3JlIERSTSByZWdpc3RyYXRpb24uIAo+IAo+IEluIHRoZSBmdXR1cmUs
IGl0J2QgcHJvYmFibHkgYmUgYmV0dGVyIGlmIHdlIGNhbiBzcGxpdCB1cCBpMmNfYWRkX2FkYXB0
ZXIoKQo+IGludG8gYW4gaW5pdCBhbmQgcmVnaXN0ZXIgZnVuY3Rpb24gLSBidXQgd2UnbGwgaGF2
ZSB0byB0YWxrIHdpdGggdGhlIGkyYwo+IG1haW50YWluZXJzIHRvIHNlZSBpZiB0aGlzIGlzIGFj
Y2VwdGFibGUgdy8gdGhlbQoKQWN0dWFsbHkgLSBJIHRoaW5rIGFkZGluZyB0aGUgYWJpbGl0eSB0
byByZWZjb3VudCBkcCBhdXggYWRhcHRlcnMgbWlnaHQgYmUgYQpiZXR0ZXIgc29sdXRpb24gc28g
SSdtIGdvaW5nIHRvIHRyeSB0aGF0IQoKPiAKPiBPbiBUaHUsIDIwMjEtMDQtMjIgYXQgMTM6MTgg
LTA0MDAsIEx5dWRlIFBhdWwgd3JvdGU6Cj4gPiBPbiBUdWUsIDIwMjEtMDQtMjAgYXQgMDI6MTYg
KzAzMDAsIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPiA+ID4gCj4gPiA+IFRoZSBpbml0IHZzLiBy
ZWdpc3RlciBzcGxpdCBpcyBpbnRlbnRpb25hbC4gUmVnaXN0ZXJpbmcgdGhlIHRoaW5nCj4gPiA+
IGFuZCBhbGxvd2luZyB1c2Vyc3BhY2UgYWNjZXNzIHRvIGl0IGJlZm9yZSB0aGUgcmVzdCBvZiB0
aGUgZHJpdmVyCj4gPiA+IGlzIHJlYWR5IGlzbid0IHBhcnRpY3VsYXJseSBncmVhdC4gRm9yIGEg
d2hpbGUgbm93IHdlJ3ZlIHRyaWVkIHRvCj4gPiA+IG1vdmUgdG93YXJkcyBhbiBhcmNoaXRlY3R1
cmUgd2hlcmUgdGhlIGRyaXZlciBpcyBmdWxseSBpbml0aWFsemllZAo+ID4gPiBiZWZvcmUgYW55
dGhpbmcgZ2V0cyBleHBvc2VkIHRvIHVzZXJzcGFjZS4KPiA+IAo+ID4gWWVhaC10aGFuayB5b3Ug
Zm9yIHBvaW50aW5nIHRoaXMgb3V0LiBUaGllcnJ5IC0gZG8geW91IHRoaW5rIHRoZXJlJ3MgYW4K
PiA+IGFsdGVybmF0ZSBzb2x1dGlvbiB3ZSBjb3VsZCBnbyB3aXRoIGluIFRlZ3JhIHRvIGZpeCB0
aGUgZ2V0X2RldmljZSgpIGlzc3VlCj4gPiB0aGF0IHdvdWxkbid0IHJlcXVpcmUgdXMgdHJ5aW5n
IHRvIGV4cG9zZSB0aGUgaTJjIGFkYXB0ZXIgZWFybHk/Cj4gPiAKPiA+ID4gCj4gPiAKPiAKCi0t
IApDaGVlcnMsCiBMeXVkZSBQYXVsIChzaGUvaGVyKQogU29mdHdhcmUgRW5naW5lZXIgYXQgUmVk
IEhhdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
