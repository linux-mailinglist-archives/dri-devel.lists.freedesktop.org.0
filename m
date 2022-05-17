Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4B552AC48
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 21:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023B110E52A;
	Tue, 17 May 2022 19:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F7B10E2AB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 19:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652817180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HwEpCwWlcxdGpOh2tFBezSPA0lfra9DVTBWTEtNs0uA=;
 b=cYQCcyv0STn88qos2771zcZmL5rA23B8GhTeORsh+GZJiSTvOZPkb3gb4dOfus6Lj4yX2X
 L9/CZAEK9nDriuncj6fXgbrbOvEFW3GZ8szFX54qCTQLobs7tIP8yBNWEVB+CkyDFFVwMY
 AR8E6VW99HS0uoil8QG9Xe9HX5MZaRk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-MDAWARXVMmak6H9H1g5ckg-1; Tue, 17 May 2022 15:52:59 -0400
X-MC-Unique: MDAWARXVMmak6H9H1g5ckg-1
Received: by mail-qk1-f200.google.com with SMTP id
 27-20020a05620a041b00b0069fd7a60a43so14501930qkp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 12:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=HwEpCwWlcxdGpOh2tFBezSPA0lfra9DVTBWTEtNs0uA=;
 b=f0wI8FjoVFwBgefxfdUytzLkisaW5oj4GZq5triE8Xvr6b3K6fEb6aNVCYH3mukWpG
 Ds8DiLGRLHcG2xQtXeSyzbdiFXmVMAaIHDBbuusrZaoqTiNJ4NWCTki8XJ1GpFcqmCVz
 +JZw90q4LNaRxfe7tra94AXUrXbaHVsbPLBkxZQh8Rg+a2zSikcjhhw6LepRbCWLT3Ld
 pBvIDcK2w5VBFkYNbGpUlbvClYxMsmPbJ1c0ZnTTkSctj4P0aKplg+OTGYIGC+ktGyHG
 +jlCn0pV9y1B+ZDmeinIvYxBrJyst7NSri8xKHAXOglo41FT1D67DJO/+ld80URajoOU
 7u6w==
X-Gm-Message-State: AOAM530M6vGPR32UtLNCEebg/MdqSiunxfIeWCvMjMTjfwo1Nv9hL4fA
 KX5Ounb0mYc2Vq3bgVyKgy2N6w4Fn6escdRwHYMLNoXZQrAy/R2r8W7Dtt0hyJHfI/iCL7bQ9Qw
 7udY+5/CN5BU5YUxgvaHSNkb4G99e
X-Received: by 2002:ac8:7f04:0:b0:2f3:d6d6:8406 with SMTP id
 f4-20020ac87f04000000b002f3d6d68406mr21140166qtk.509.1652817178786; 
 Tue, 17 May 2022 12:52:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzI74W9XBXed/MCxieJlQiY3NWMHtAwR2gds0+hD9NzYRsIWSES9Qsw4mJKcoCLwfVUxPTf0A==
X-Received: by 2002:ac8:7f04:0:b0:2f3:d6d6:8406 with SMTP id
 f4-20020ac87f04000000b002f3d6d68406mr21140150qtk.509.1652817178417; 
 Tue, 17 May 2022 12:52:58 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 j63-20020a378742000000b0069fc13ce1efsm61251qkd.32.2022.05.17.12.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 12:52:57 -0700 (PDT)
Message-ID: <876ef490a577b8af71d1a8d24a55e43616b7d45b.camel@redhat.com>
Subject: Re: [PATCH] drm: dp: fix a possible memory leak in
 fetch_monitor_name()
From: Lyude Paul <lyude@redhat.com>
To: Hangyu Hua <hbh25y@gmail.com>, airlied@linux.ie, daniel@ffwll.ch, 
 tzimmermann@suse.de, jani.nikula@intel.com, Bhawanpreet.Lakha@amd.com, 
 Wayne.Lin@amd.com
Date: Tue, 17 May 2022 15:52:56 -0400
In-Reply-To: <20220516032042.13166-1-hbh25y@gmail.com>
References: <20220516032042.13166-1-hbh25y@gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to the appropriate branch in a bit

On Mon, 2022-05-16 at 11:20 +0800, Hangyu Hua wrote:
> drm_dp_mst_get_edid call kmemdup to create mst_edid. So mst_edid need to be
> freed after use.
> 
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> ---
>  drivers/gpu/drm/dp/drm_dp_mst_topology.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/dp/drm_dp_mst_topology.c
> b/drivers/gpu/drm/dp/drm_dp_mst_topology.c
> index 11300b53d24f..7a7cc44686f9 100644
> --- a/drivers/gpu/drm/dp/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/dp/drm_dp_mst_topology.c
> @@ -4852,6 +4852,7 @@ static void fetch_monitor_name(struct
> drm_dp_mst_topology_mgr *mgr,
>  
>         mst_edid = drm_dp_mst_get_edid(port->connector, mgr, port);
>         drm_edid_get_monitor_name(mst_edid, name, namelen);
> +       kfree(mst_edid);
>  }
>  
>  /**

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

