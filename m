Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 157733698AF
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 19:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60796E091;
	Fri, 23 Apr 2021 17:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A5B6E091
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 17:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619200418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iMN2vr30yb/ELiIJb3jXFJDgM9IBXB6WS94R3EgBst0=;
 b=QTgKjEO9QviHC202r72SLho/D8bidgBP99vm4U8ejzjwDsIPB1pdOng81Zy8JSkIGhnUPV
 KvPe2XzDCxS8k/CagOOVUO1xPI0+BlqrbMTKrNuozFxD8XwC1QGgtAv6CiHDJfZjVwYem1
 Uz/IvW396a/sb7B6AlYMvEbx78RqvQo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-okdhZTNAPaKi-XQDX5qLCw-1; Fri, 23 Apr 2021 13:53:36 -0400
X-MC-Unique: okdhZTNAPaKi-XQDX5qLCw-1
Received: by mail-qk1-f198.google.com with SMTP id
 t126-20020a37aa840000b02902e3c5b3abeaso12250760qke.10
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 10:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=iMN2vr30yb/ELiIJb3jXFJDgM9IBXB6WS94R3EgBst0=;
 b=MvGwMeJ7QYVGXBmkv2XqMneWL8KJE/L1fBKqf6Uvsw7cxttXHkrZnniet6l0X1gZ3h
 UMlIPSdTuoWThXFodPUeo7Ag+iFwQ20ieORZkGjPjKyVTEYLthiyt1+8O2mRt+bQEnJv
 qVv5g4k94naq4qJ7NueVD0jtX41fojwYokdMYEYUYTwYuVAAMQuIzb72hWalbkjZhcgd
 /FSE1End/g5JmXeMGo3FS78/4CQCIgEcqLw9OffOpOnDHqJhUNxcbnb4STEL3JdfMjoT
 D4Z1WkD5pu5EvXSvLFNfm5JIkiZqAk0dSSWu8MDcA7oyFSuJTk7dgHXDLfNQy4hq9wF2
 Cy6Q==
X-Gm-Message-State: AOAM530OC7ayOw3UlbQCHJPnWomcGQy+CFmU6stYLXszKcDySd1q69eg
 3Rv2SRS3qZ25lLKdzAWsFglJqIO0ZL54OnvxrEhKfCKUcnYPAn1KljsVAvBxTi+Zb0+l1UBBWm8
 xZbDzdFw03YkVLqM6/KUjSJ/504bS
X-Received: by 2002:a0c:dc11:: with SMTP id s17mr5457289qvk.18.1619200415940; 
 Fri, 23 Apr 2021 10:53:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTUVUlVfoiWl//W0HjPD0d13jw9avPkrwnpeZvBDIw6oqnKzSgsucO2i02vJ5q3mqdmlhTGw==
X-Received: by 2002:a0c:dc11:: with SMTP id s17mr5457242qvk.18.1619200415744; 
 Fri, 23 Apr 2021 10:53:35 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id c5sm4715913qkl.7.2021.04.23.10.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 10:53:35 -0700 (PDT)
Message-ID: <cb7339fe172f31c615d824b56a709d2df6b79bb7.camel@redhat.com>
Subject: Re: [PATCH v3 03/20] drm/dp: Move i2c init to drm_dp_aux_init, add
 __must_check and fini
From: Lyude Paul <lyude@redhat.com>
To: Thierry Reding <treding@nvidia.com>
Date: Fri, 23 Apr 2021 13:53:33 -0400
In-Reply-To: <YILABCrcMb5MksxD@orome.fritz.box>
References: <20210419225523.184856-1-lyude@redhat.com>
 <20210419225523.184856-4-lyude@redhat.com> <YH4PPbY1qqF2NtrN@intel.com>
 <56a931c9f284ee6a23583eb3dc59de4afaa60e93.camel@redhat.com>
 <2e211a6623664714af1d180eadcd74aa7ef417db.camel@redhat.com>
 <17aa145e4cfa3d8852f7411067c5c37bff771b16.camel@redhat.com>
 <YILABCrcMb5MksxD@orome.fritz.box>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Joe Perches <joe@perches.com>, Yuti Amonkar <yamonkar@cadence.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Sean Paul <sean@poorly.run>, Navid Emamdoost <navid.emamdoost@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Chris Park <Chris.Park@amd.com>,
 Eryk Brol <eryk.brol@amd.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Robert Foss <robert.foss@linaro.org>, Julia Lawall <Julia.Lawall@inria.fr>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2021-04-23 at 14:39 +0200, Thierry Reding wrote:
> 
> I'm curious: how is a DP AUX adapter reference count going to solve the
> issue of potentially registering devices too early (i.e. before the DRM
> is registered)?
> 
> Is it because registering too early could cause a reference count
> problem if somebody get a hold of the DP AUX adapter before the parent
> DRM device is around?

Well currently the problem is that we kind of want to avoid setting up the i2c
adapter before the DRM driver is registered with userspace, but it's not
really possible to do that if we need the core device struct for the ddc
adapter initialized so that tegra can call get_device() on it in
drivers/gpu/drm/tegra/sor.c. So my thought is instead of calling get_device()
on the ddc adapter that the AUX channel provides, why not just call it on the
actual platform device that implements the AUX channel instead? I think this
should work pretty nicely while still preventing the platform device for the
AUX channel from disappearing before the SOR has disappeared.


> 
> Thierry

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
