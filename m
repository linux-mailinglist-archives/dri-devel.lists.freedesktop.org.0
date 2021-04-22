Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A94368909
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 00:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05CD6EADA;
	Thu, 22 Apr 2021 22:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3706EADA
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 22:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619130832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f/vRB79wkOkQwRN4IMQD6uSpNtDOh8JtWPvQm40S7Z8=;
 b=T4r8Dkwm4JPgV+QQSSN2PrYjvK9e+vHHRpRu1zYzf4CSxZQ5/0fFI/ToJo02TEjVkxi3zv
 Tl3vSM05F4GDhh6EvngR2Nudyl4nGQtZ7vGJINjFPzqL7ygfjfpeB8Tm4c2xJNWXWvnM2i
 w/BAgcBG10TlFVj7IS0/GEGDGRvDong=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-sqwx2oyyOnWUuYQAESg-FA-1; Thu, 22 Apr 2021 18:33:48 -0400
X-MC-Unique: sqwx2oyyOnWUuYQAESg-FA-1
Received: by mail-qk1-f198.google.com with SMTP id
 g184-20020a3784c10000b02902e385de9adaso12634697qkd.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 15:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=f/vRB79wkOkQwRN4IMQD6uSpNtDOh8JtWPvQm40S7Z8=;
 b=L1x97TYdFUQQTiL/Zm9yKJYFMqRr5w4nniyRc59MpcjjFAZ7iScqK6WXJfDHC0TUgL
 Nxqc73nmB7MScayK4Zia+qxYd+Qjc+Rl9BZBHAlkWS5JTZz4NG+JssA3yzn5jawtstvh
 RTK/66cKbc6O/hLC59GkLGMoGW937LHFdpCimtWSQKfZzWhMy2VFwocFQ8avN47tTroG
 +wnW4msQ109dNFDeGrM5ywR1qy9GkdmRwo/6jm0+3tzRIhnv7gl+4qYe8O6FsyWz/OUq
 UXGWsux0cPwehbZrcvtRvfCdvhva+rKIp8Dz0L5clJR1fX/o+io2AuBhQn+i+rVXQCJ0
 0zyQ==
X-Gm-Message-State: AOAM532KKaHmtKo2qjQEtT6jPQFgLefGcM2rMSoQqABsukZ+7f2XwTl7
 7oLRSYL+aV2zanlMYSmstKFQYX/Se5JEX3WyIVB1EYkOpVQmISL5OINnPsdxPxKwNm2mahSxmv1
 j2EZBBlpD35lMrNmzS0nPkylxT0Qv
X-Received: by 2002:ad4:4947:: with SMTP id o7mr881601qvy.18.1619130828604;
 Thu, 22 Apr 2021 15:33:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz02Kh6a2SHHB692u3GqETh7EMROD4F/lD1uak4N1xfhj+PZRZ3m979UGgrkSpKy+qKyYfYag==
X-Received: by 2002:ad4:4947:: with SMTP id o7mr881548qvy.18.1619130828362;
 Thu, 22 Apr 2021 15:33:48 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id j185sm3229184qke.1.2021.04.22.15.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 15:33:47 -0700 (PDT)
Message-ID: <2e211a6623664714af1d180eadcd74aa7ef417db.camel@redhat.com>
Subject: Re: [PATCH v3 03/20] drm/dp: Move i2c init to drm_dp_aux_init, add
 __must_check and fini
From: Lyude Paul <lyude@redhat.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>
Date: Thu, 22 Apr 2021 18:33:44 -0400
In-Reply-To: <56a931c9f284ee6a23583eb3dc59de4afaa60e93.camel@redhat.com>
References: <20210419225523.184856-1-lyude@redhat.com>
 <20210419225523.184856-4-lyude@redhat.com> <YH4PPbY1qqF2NtrN@intel.com>
 <56a931c9f284ee6a23583eb3dc59de4afaa60e93.camel@redhat.com>
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

T0sgLSB0YWxrZWQgd2l0aCBWaWxsZSBhIGJpdCBvbiB0aGlzIGFuZCBkaWQgc29tZSBvZiBteSBv
d24gcmVzZWFyY2gsIEkKYWN0dWFsbHkgdGhpbmsgdGhhdCBtb3ZpbmcgaTJjIHRvIGRybV9kcF9h
dXhfaW5pdCgpIGlzIHRoZSByaWdodCBkZWNpc2lvbiBmb3IKdGhlIHRpbWUgYmVpbmcuIFRoZSBy
ZWFzb25pbmcgYmVoaW5kIHRoaXMgYmVpbmcgdGhhdCBhcyBzaG93biBieSBteSBwcmV2aW91cwp3
b3JrIG9mIGZpeGluZyBkcml2ZXJzIHRoYXQgY2FsbCBkcm1fZHBfYXV4X3JlZ2lzdGVyKCkgdG9v
IGVhcmx5IC0gaXQgc2VlbXMKbGlrZSB0aGVyZSdzIGFscmVhZHkgYmVlbiBkcml2ZXJzIHRoYXQg
aGF2ZSBiZWVuIHdvcmtpbmcganVzdCBmaW5lIHdpdGgKc2V0dGluZyB1cCB0aGUgaTJjIGRldmlj
ZSBiZWZvcmUgRFJNIHJlZ2lzdHJhdGlvbi4gCgpJbiB0aGUgZnV0dXJlLCBpdCdkIHByb2JhYmx5
IGJlIGJldHRlciBpZiB3ZSBjYW4gc3BsaXQgdXAgaTJjX2FkZF9hZGFwdGVyKCkKaW50byBhbiBp
bml0IGFuZCByZWdpc3RlciBmdW5jdGlvbiAtIGJ1dCB3ZSdsbCBoYXZlIHRvIHRhbGsgd2l0aCB0
aGUgaTJjCm1haW50YWluZXJzIHRvIHNlZSBpZiB0aGlzIGlzIGFjY2VwdGFibGUgdy8gdGhlbQoK
T24gVGh1LCAyMDIxLTA0LTIyIGF0IDEzOjE4IC0wNDAwLCBMeXVkZSBQYXVsIHdyb3RlOgo+IE9u
IFR1ZSwgMjAyMS0wNC0yMCBhdCAwMjoxNiArMDMwMCwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+
ID4gCj4gPiBUaGUgaW5pdCB2cy4gcmVnaXN0ZXIgc3BsaXQgaXMgaW50ZW50aW9uYWwuIFJlZ2lz
dGVyaW5nIHRoZSB0aGluZwo+ID4gYW5kIGFsbG93aW5nIHVzZXJzcGFjZSBhY2Nlc3MgdG8gaXQg
YmVmb3JlIHRoZSByZXN0IG9mIHRoZSBkcml2ZXIKPiA+IGlzIHJlYWR5IGlzbid0IHBhcnRpY3Vs
YXJseSBncmVhdC4gRm9yIGEgd2hpbGUgbm93IHdlJ3ZlIHRyaWVkIHRvCj4gPiBtb3ZlIHRvd2Fy
ZHMgYW4gYXJjaGl0ZWN0dXJlIHdoZXJlIHRoZSBkcml2ZXIgaXMgZnVsbHkgaW5pdGlhbHppZWQK
PiA+IGJlZm9yZSBhbnl0aGluZyBnZXRzIGV4cG9zZWQgdG8gdXNlcnNwYWNlLgo+IAo+IFllYWgt
dGhhbmsgeW91IGZvciBwb2ludGluZyB0aGlzIG91dC4gVGhpZXJyeSAtIGRvIHlvdSB0aGluayB0
aGVyZSdzIGFuCj4gYWx0ZXJuYXRlIHNvbHV0aW9uIHdlIGNvdWxkIGdvIHdpdGggaW4gVGVncmEg
dG8gZml4IHRoZSBnZXRfZGV2aWNlKCkgaXNzdWUKPiB0aGF0IHdvdWxkbid0IHJlcXVpcmUgdXMg
dHJ5aW5nIHRvIGV4cG9zZSB0aGUgaTJjIGFkYXB0ZXIgZWFybHk/Cj4gCj4gPiAKPiAKCi0tIApD
aGVlcnMsCiBMeXVkZSBQYXVsIChzaGUvaGVyKQogU29mdHdhcmUgRW5naW5lZXIgYXQgUmVkIEhh
dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
