Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 069F4C637D3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 11:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5230910E340;
	Mon, 17 Nov 2025 10:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Qv0xn7XT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A17B10E33F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 10:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763374783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8Sj1yzB+yodW9emJVWyrm3VZBnBWrcQvlOUnMxJLYhU=;
 b=Qv0xn7XT351EP4000yIc+/f+dIjGouHejtUFBzsPi173Fdp2O5Fh4TjCZejbabcero3sYq
 JNBrMnog8mer21geky3YxCi8SWwGJVjpCnc08bOJ/iLehE27+cGW4KsvKfjtF+KBUvJn/T
 K1Xqr7QFyHCWITcABElN0fnvCdRwvzI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-ihCDv0PSN22CnYKJXpL0lQ-1; Mon, 17 Nov 2025 05:19:42 -0500
X-MC-Unique: ihCDv0PSN22CnYKJXpL0lQ-1
X-Mimecast-MFC-AGG-ID: ihCDv0PSN22CnYKJXpL0lQ_1763374781
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-429c76c8a1bso2451074f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 02:19:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763374781; x=1763979581;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Sj1yzB+yodW9emJVWyrm3VZBnBWrcQvlOUnMxJLYhU=;
 b=DcKMi7Du0ZuJ10gYCFarehqmIEavH26jlZSMOhl1leFyWaISGZ939KlCuuAoDWofBG
 PXFdmXxCGk+s3vkhJ6fQ797ZSXlRRLtu9oZi9CbR+Ajqxk3+JtkKCTdts1RqHHulWhBM
 JqSXi1gyKiGmc0IYHwWTVWa3cKM2HMxaXuqB/XXnxlb/wxImzZqe/ycEL5EBqr3XpoD+
 QcP/s6wy8SFGBSuqY8u9ur2YzMe+dig8eRkf6DxXwrlSL+0uISkxfSquLspEpFfOcrZC
 GxZQvrgkgvrl/1ZFmShWTMLEgNBD3o2d0dcmD9yKgeLPDcdlfsjMS31q9wNDJNyYCtH9
 GZhg==
X-Gm-Message-State: AOJu0YzUqAxdKr+FJ1ChCwKu5L5FzjAHIIrzWeOutaF0SjbA7bV1PuMm
 5fOGKq9SPWiqOyQPgqEFrxnds5Y23BsLhUMzoUDjo9Y/b1xxscHEIHbxkbBU+JVGoT0btHrkxDc
 TE9PiO/2waUEv7BOh/w0N+sZsJepZ+wrN1H80WRKyuyTimEYiQcPI9IiEXxxRfePwbwIlnQ==
X-Gm-Gg: ASbGncv2LnvIiYijwFzkhHGZW1swAmm1Z8x/kJFGMIjOU2IjXvqfmi/7/KQ1VaJ7xcK
 nYZln6CPuFRWjS8gfKJhjQ201ky01oPAsaWfD/NUQ/ei4EqvVfxngmf9ZRADfAtat3omzDmXmoq
 a6ljZ794cjmmkFbbCQ2Ojj9FRVZX2FLKeUVCpc5/5PYZYQftBTd89Yanx1zdlHJAlP+5vD+zxy2
 E1bvsMHRo4sB0xBsHj14pBujB7fcBXwgu+LwmgpJ9WASENwmqtoy2KcA5BSr2ibD3/iC011LJk9
 /+NyRKkpu6FLnYlrDrgBWNevazMQKQTMeUjd56UE1iSU8t7KG3vNBLUUv5euKMmcyq5cyzbCrpq
 LmdpWM8pcIhGRu1alnoxeiiKP3yhxD0botxWOeAAB
X-Received: by 2002:a5d:5f47:0:b0:427:9e6:3a64 with SMTP id
 ffacd0b85a97d-42b593847f2mr10779177f8f.47.1763374780942; 
 Mon, 17 Nov 2025 02:19:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuLJzRkeZwRTSmYiDMNFB5b9Y04M5/X3K0AsCLwjmRlR2lS/HTXuIsn1n38y2t71o3SspdXw==
X-Received: by 2002:a5d:5f47:0:b0:427:9e6:3a64 with SMTP id
 ffacd0b85a97d-42b593847f2mr10779119f8f.47.1763374780429; 
 Mon, 17 Nov 2025 02:19:40 -0800 (PST)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f0b8d6sm26377484f8f.28.2025.11.17.02.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 02:19:39 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 simona@ffwll.ch, linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, patrik.r.jakobsson@gmail.com,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org,
 tomi.valkeinen@ideasonboard.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, thierry.reding@gmail.com, mperttunen@nvidia.com,
 jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] drm/fb-helper: Allocate and release fb_info in
 single place
In-Reply-To: <20251027081245.80262-1-tzimmermann@suse.de>
References: <20251027081245.80262-1-tzimmermann@suse.de>
Date: Mon, 17 Nov 2025 11:19:38 +0100
Message-ID: <87ikf9kll1.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _8G-iu6eDuDvmkHrz8Gr-0dzM-HOg-AUKMl1dogIzEE_1763374781
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Move the calls to drm_fb_helper_alloc_info() from drivers into a
> single place in fbdev helpers. Allocates struct fb_info for a new
> framebuffer device. Then call drm_fb_helper_single_fb_probe() to
> create an fbdev screen buffer. Also release the instance on errors
> by calling drm_fb_helper_release_info().
>
> Simplifies the code and fixes the error cleanup for some of the
> drivers.
>
> Regular release of the struct fb_info instance still happens in
> drm_fb_helper_fini() as before.
>
> v2:
> - remove error rollback in driver implementations (kernel test robot)
> - initialize info in TTM implementation (kernel test robot)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

It simplifies the drivers' code indeed.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

