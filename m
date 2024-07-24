Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC51B93B794
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 21:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF69310E69D;
	Wed, 24 Jul 2024 19:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TZztriR2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C3D10E69D;
 Wed, 24 Jul 2024 19:30:44 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-70d153fec2fso140607b3a.1; 
 Wed, 24 Jul 2024 12:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721849444; x=1722454244; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=I4MvnsTGWo0THFyPD9MrsKyrQPqeYvDANUUTqm+As1o=;
 b=TZztriR2p/IvSeQAS4SGqqx+M2O+FCNLI93UgGrY4zuXLfdnx7laCXmPUxYIkJc2iv
 fsMxWF0WSac8zeE/TlxWp6QkyhwxOHl4i9NA4HhjN4mZvJz0GYSqHSYmY91/13M11QQX
 0ZfVSKJgIEjUfs62AZN8WhJExecVRw5rLQzZhlstRpC4c5W66MVh0suDcbEZeId/SaW7
 QrsQOGrt2tzxs2Qq3jPNQX5GPTwP03M0Jk7gfB93C1Xl8yaxIBZQ5beLuo+Ac21Ps8Yz
 PRwOZQRcuM1fJ+0AVWACE6OQuBEtxx+G2Nz+69ye347Cwh3roTuWCMDGUH9MgqM14Lth
 WhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721849444; x=1722454244;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I4MvnsTGWo0THFyPD9MrsKyrQPqeYvDANUUTqm+As1o=;
 b=PC9yQsFPw1VvQ77vg/7uS3fvC0uyaF2/OG9CKUU5GzMn40ju2lyHk6wyVofnvcNWgw
 isE2jxZ6ASAAR1viNzh+SeCqFfRPvNQGRQkZgl7ZC+wparfPx5F8ZYmwO0BqU722WIYj
 l1+yKdsXcP0ubLV1SutbtZtwz/QyKVpGvEXiG2VxG8W8jHqtwv/m+5eL/8BdHW4OIsrp
 oH3lUocFG7pSbUGlTp0gqRiQrGDRvFdH1fOGl4Rf/4b0qidJ0Www0M+QvdE9C1QVj2lo
 Ure+XZnRP347O/5i4iWDgmaQ63qKqc9jru84FQ8haDRfys1xMx2Nhk5uoxGA79z6Yapf
 8P9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL0sGSdO5aMSGKKiQNft20rpSHR1dnPGuEXJfEgcJvzQOEwupr5ezF014MLMD3jIKUjaDArLti5+Rvk598T/BVG8X6fN928fhJjsbWrRpnQNcMOrZoZSwXdiR+BSfZhKSg2S/jPXxvITW0z96G+g==
X-Gm-Message-State: AOJu0YyPPhdprwc+zxA1RUhLvFT54DwFhxn1gfQcco/JVk+GyVMm0e4i
 kswjcuVZSj133uIDxyystNE21nwBQZR9ZhM7WoDol6/LxHEbkbdB
X-Google-Smtp-Source: AGHT+IGeMQuCgTIh3sLr3bbX2Tu5TYy4tqK2HRcEnZ6n/KheSClihGZCYHx0kW/iSQRWZ+Lsku7jpA==
X-Received: by 2002:a05:6a20:840d:b0:1c4:2469:f893 with SMTP id
 adf61e73a8af0-1c472c6d61dmr1229216637.46.1721849443832; 
 Wed, 24 Jul 2024 12:30:43 -0700 (PDT)
Received: from localhost ([2804:2484:804c:b67b:f1b3:b8d7:cfb4:98a5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70d1971a5bcsm6395578b3a.0.2024.07.24.12.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 12:30:43 -0700 (PDT)
Date: Wed, 24 Jul 2024 16:30:39 -0300
From: "Ricardo B. Marliere" <rbmarliere@gmail.com>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, harry.wentland@amd.com, 
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, 
 marcelomspessoto@gmail.com, aurabindo.pillai@amd.com, adnelson@amd.com, 
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] drm/amd/display: Fix documentation warning for mpc.h
Message-ID: <qyoun6sfdpdxxzwystaimsiw3o33jwvoqxm3kpawczju2b3dl5@ytjpgyabbzet>
References: <20240724175423.18075-1-abhishektamboli9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724175423.18075-1-abhishektamboli9@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24 Jul 24 23:24, Abhishek Tamboli wrote:
> Fix documentation compile warning by adding description
> for program_3dlut_size function.
> 
> Remove the following warning:
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:1043: warning: Function parameter or struct member 'program_3dlut_size' not described in 'mpc_funcs'
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> index 40a9b3471208..615c69d966e7 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> @@ -1039,7 +1039,21 @@ struct mpc_funcs {
>  	*/
>  	void (*program_lut_mode)(struct mpc *mpc, const enum MCM_LUT_ID id, const enum MCM_LUT_XABLE xable,
>  			bool lut_bank_a, int mpcc_id);
> -	void (*program_3dlut_size)(struct mpc *mpc, bool is_17x17x17, int mpcc_id);
> +	/**
> +	 * @program_3dlut_size:
> +	 *
> +	 * Program 3D LUT size.
> +	 *
> +	 * Parameters:
> +	 * - [in/out] mpc - MPC context.
> +	 * - [in] is_17x17x17 - Boolean Flag.
> +	 * - [in] mpcc_id - MPCC physical instance.
> +	 *
> +	 * Return:
> +	 *
> +	 * void
> +	 */

Reviewed-by: Ricardo B. Marliere <ricardo@marliere.net>


> +	 void (*program_3dlut_size)(struct mpc *mpc, bool is_17x17x17, int mpcc_id);
>  };
>  
>  #endif
> -- 
> 2.34.1
> 
