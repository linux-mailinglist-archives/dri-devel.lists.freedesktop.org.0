Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 952693685AA
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 19:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB99189ED3;
	Thu, 22 Apr 2021 17:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAED89ED3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 17:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619111896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LfDSNIXXrzz4FbE4CwlcLSSxDEOGT/2JNoxma+lfpdU=;
 b=LGE0KLTw6vo+kiXq3BJ8yr4ZZWUdgbQ0/6pJP6TWqAOy3isJu8NTKDnM9ZBGM+bVyxnkbW
 ArarH1RUw9cjqPvezkyyImaM5+1Q++V0+u46KpLbV8X6GKnj1VoPn1bluUpGaCrrngldOH
 TS9wDnnKBXUbLa3Eb+GXlySdVJ288KY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-9YzHRqYPPweuE8fqd9-xnA-1; Thu, 22 Apr 2021 13:18:13 -0400
X-MC-Unique: 9YzHRqYPPweuE8fqd9-xnA-1
Received: by mail-qt1-f197.google.com with SMTP id
 y17-20020ac870910000b02901a7f2d61003so15802403qto.20
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 10:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=LfDSNIXXrzz4FbE4CwlcLSSxDEOGT/2JNoxma+lfpdU=;
 b=KZX3ZT9fvNO6A0ZLBAA0Oyi79LnZ1ZALOAg90Og+LBAB+KC0GuWL6KTv2HgDCdYzbH
 O/oXXO/2lPOVH9QIRIH/GvQSmIvIHvbgIupFeCkvn5xZQck6Coewd31pXq2nW/atn3ej
 C6VuRCwGlcPqwNGOG9/gFLg+RpeQ+tgh7WvOO2e4GPIdJDoyV16yIioNfTLynMPbN8xt
 96c3HxwsDBzAc3Bmay/xcTxZSyF4nboJek8yZW16MrWEwPkGor362+P3BcGRIsU2lXbn
 sSZ8tPT7twzoJjQsATbXIJ6C8KOZcoPcrH28hiY4gB/xuEr973k0mL+ZkTvgn0CkcELu
 Yb8w==
X-Gm-Message-State: AOAM531HNYFC9GTYCOUXr1GQE6nK5SB+gJLC9EOYZT8bMtf9ys1cl5kP
 GDtJf7p9LH1hbjemqgi3wK2dXF2rhroYN3gBP1lsrgye/VVvShUQ2SXlzX1S9qI+aJmbb0mLBWX
 U3l41N0C5TPuH7fwEYGRNUEDIGrGi
X-Received: by 2002:a37:9547:: with SMTP id x68mr4649698qkd.474.1619111892937; 
 Thu, 22 Apr 2021 10:18:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxL+wipZ8wslP+tJgr/etmf17aGBKnIbho/C7QbmqdQYxpKccy8EwWdn+YgrbEvV+9kokVRew==
X-Received: by 2002:a37:9547:: with SMTP id x68mr4649649qkd.474.1619111892722; 
 Thu, 22 Apr 2021 10:18:12 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id v4sm2561004qto.50.2021.04.22.10.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 10:18:12 -0700 (PDT)
Message-ID: <56a931c9f284ee6a23583eb3dc59de4afaa60e93.camel@redhat.com>
Subject: Re: [PATCH v3 03/20] drm/dp: Move i2c init to drm_dp_aux_init, add
 __must_check and fini
From: Lyude Paul <lyude@redhat.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>
Date: Thu, 22 Apr 2021 13:18:09 -0400
In-Reply-To: <YH4PPbY1qqF2NtrN@intel.com>
References: <20210419225523.184856-1-lyude@redhat.com>
 <20210419225523.184856-4-lyude@redhat.com> <YH4PPbY1qqF2NtrN@intel.com>
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
 Thierry Reding <thierry.reding@gmail.com>,
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

T24gVHVlLCAyMDIxLTA0LTIwIGF0IDAyOjE2ICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
Cj4gCj4gVGhlIGluaXQgdnMuIHJlZ2lzdGVyIHNwbGl0IGlzIGludGVudGlvbmFsLiBSZWdpc3Rl
cmluZyB0aGUgdGhpbmcKPiBhbmQgYWxsb3dpbmcgdXNlcnNwYWNlIGFjY2VzcyB0byBpdCBiZWZv
cmUgdGhlIHJlc3Qgb2YgdGhlIGRyaXZlcgo+IGlzIHJlYWR5IGlzbid0IHBhcnRpY3VsYXJseSBn
cmVhdC4gRm9yIGEgd2hpbGUgbm93IHdlJ3ZlIHRyaWVkIHRvCj4gbW92ZSB0b3dhcmRzIGFuIGFy
Y2hpdGVjdHVyZSB3aGVyZSB0aGUgZHJpdmVyIGlzIGZ1bGx5IGluaXRpYWx6aWVkCj4gYmVmb3Jl
IGFueXRoaW5nIGdldHMgZXhwb3NlZCB0byB1c2Vyc3BhY2UuCgpZZWFoLXRoYW5rIHlvdSBmb3Ig
cG9pbnRpbmcgdGhpcyBvdXQuIFRoaWVycnkgLSBkbyB5b3UgdGhpbmsgdGhlcmUncyBhbgphbHRl
cm5hdGUgc29sdXRpb24gd2UgY291bGQgZ28gd2l0aCBpbiBUZWdyYSB0byBmaXggdGhlIGdldF9k
ZXZpY2UoKSBpc3N1ZQp0aGF0IHdvdWxkbid0IHJlcXVpcmUgdXMgdHJ5aW5nIHRvIGV4cG9zZSB0
aGUgaTJjIGFkYXB0ZXIgZWFybHk/Cgo+IAoKLS0gCkNoZWVycywKIEx5dWRlIFBhdWwgKHNoZS9o
ZXIpCiBTb2Z0d2FyZSBFbmdpbmVlciBhdCBSZWQgSGF0CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
