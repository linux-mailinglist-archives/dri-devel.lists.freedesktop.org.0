Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 902B712840F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 22:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB14F6ECB7;
	Fri, 20 Dec 2019 21:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28DA6ECB7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 21:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576878250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8zSG1RPASkHkV56GZulUOiAvmwOUPVucW5rPiy8WYI0=;
 b=KdRbRENdtu9V5hPGWZ56S0uZNeB2Ftn3mpdZywqnT7TEvt2hlzYClFGHCYj1lZ8mS1hTVS
 R/e7vmA+8C6wxj8uHqoBrpY9rL1SKO0qK2rbqQS6bFVysfUVV9B2kfMI4lLg2KRgAJ/rre
 yOCEL/hEeQcuhTL7Dbt2Tdmr19V/HE4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-XzzzKDEpOt2mRt_qWPDBhQ-1; Fri, 20 Dec 2019 16:44:09 -0500
Received: by mail-qv1-f69.google.com with SMTP id x22so5232670qvc.18
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 13:44:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=8zSG1RPASkHkV56GZulUOiAvmwOUPVucW5rPiy8WYI0=;
 b=ns0+B3CW8Ld/yEsm6pTGKC6JyZ6FPvv4t0budIvD+QrHXyc4ibC9VAf18PpkLZeB+/
 64mcRxI+5CikQA5Ayex0eHPrXPv8Qe39X9JsgOR07oWhKma/RVkaKZP9ZI0Ds4F0+Tzm
 BBdWBks1qTVTPCYAxQsox7cM7/iLH2B7Fo5m+JrGEKxXDQm22cbg89ZjdFd/+ZXl4gsw
 /UVFawwmn1gwljwaj3Cc4NbMV/Mmh5JR1Ex86ddHlbF54h1ixQANV2WCD54iE5VF6IEo
 qT57r/lYwhbmdX93MBKHaajEnYk06Qmhj713CaO7FWIi9/5kXoiq3pn7iSleQfjewwuX
 +dlw==
X-Gm-Message-State: APjAAAWLMtVVg2YLUL9sQK2/uqG5fv1Q0C0EGr3SKc35+R09Jo8fy29t
 DQF0ceeEpkOrq5Wi43VTEsH5qw7K2ov8MpA8qOFCFQ7QAF6QZUkzMyu0nX41FuTWLEO+9zOypiR
 OC8/hrM12ctBT13ed2ZAbwNW/g6cf
X-Received: by 2002:ac8:7516:: with SMTP id u22mr13347195qtq.229.1576878249304; 
 Fri, 20 Dec 2019 13:44:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqzvTHN7McuqaMs0DzRwA0Cr2fJYDyz2KZJJKzarXufNvHYFhYEp4zKajefQ3+t73J0fXsyMFg==
X-Received: by 2002:ac8:7516:: with SMTP id u22mr13347183qtq.229.1576878249079; 
 Fri, 20 Dec 2019 13:44:09 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id 40sm3421307qtc.95.2019.12.20.13.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 13:44:08 -0800 (PST)
Message-ID: <79fe00bc7373bb8b448b4c0b7a1140d87a2afdf5.camel@redhat.com>
Subject: Re: [PATCH v9 14/18] drm/amd/display: Add PBN per slot calculation
 for DSC
From: Lyude Paul <lyude@redhat.com>
To: mikita.lipski@amd.com, amd-gfx@lists.freedesktop.org
Date: Fri, 20 Dec 2019 16:44:07 -0500
In-Reply-To: <20191213200854.31545-15-mikita.lipski@amd.com>
References: <20191213200854.31545-1-mikita.lipski@amd.com>
 <20191213200854.31545-15-mikita.lipski@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31)
MIME-Version: 1.0
X-MC-Unique: XzzzKDEpOt2mRt_qWPDBhQ-1
X-Mimecast-Spam-Score: 0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Lyude Paul <lyude@redhat.com>

On Fri, 2019-12-13 at 15:08 -0500, mikita.lipski@amd.com wrote:
> From: Mikita Lipski <mikita.lipski@amd.com>
> 
> [why]
> Need to calculate VCPI slots differently for DSC
> to take in account current link rate, link count
> and FEC.
> [how]
> Add helper to get pbn_div from dc_link
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c   | 8 ++++++++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h   | 2 ++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 7557edee7db0..c376c8ccd391 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -491,3 +491,11 @@ void amdgpu_dm_initialize_dp_connector(struct
> amdgpu_display_manager *dm,
>  		aconnector->connector_id);
>  }
>  
> +int dm_mst_get_pbn_divider(struct dc_link *link)
> +{
> +	if (!link)
> +		return 0;
> +
> +	return dc_link_bandwidth_kbps(link,
> +			dc_link_get_link_cap(link)) / (8 * 1000 * 54);
> +}
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> index 2da851b40042..a553ea046185 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> @@ -29,6 +29,8 @@
>  struct amdgpu_display_manager;
>  struct amdgpu_dm_connector;
>  
> +int dm_mst_get_pbn_divider(struct dc_link *link);
> +
>  void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>  				       struct amdgpu_dm_connector
> *aconnector);
>  
-- 
Cheers,
	Lyude Paul

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
