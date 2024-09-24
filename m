Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F18A198426B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 11:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E27410E693;
	Tue, 24 Sep 2024 09:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ACAa2gc2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083A010E69A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 09:41:34 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5c42f406e29so7615033a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 02:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1727170892; x=1727775692; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2OJtpv/zrtvpIdOh+Bobca5Nt5qYNBhXmHeFh7kw0Rs=;
 b=ACAa2gc2hvEObzN9Jy0HwLAa/ZSvSXzp46v+fz95CNT55qu1+4EpC5PjRIs47tyBgr
 z+MLBIaHQkps3MFbws0K/jBXI42YJPJyeNL8dMSiEaxWB3HR+VxkiGeJ9vB974FBOYu3
 1DlrWr4XDRbq5nI4+iajuN+gs3dJNYethbbRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727170892; x=1727775692;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2OJtpv/zrtvpIdOh+Bobca5Nt5qYNBhXmHeFh7kw0Rs=;
 b=e/kIw/Q+YBoWknCXnXyz2X8Do46OkKlhj1PoERIWTsevSZu75SFosdUmWnR7pcbFlo
 dzZp6jikYBWyf9yEyxGMgNSJzLl8lzZS5nXZtJf+BaJhgmR0sSGdtzvquk5yWKIh3xhb
 q24BcOFr3Qx3yZhJzGWd1BSuxoevIprvoaYshbfTJLa4c1ZUQf3meBCUUYCSm69KORIY
 1aXP0JJTLX53cUnP87IkqQRCwQzhnLv9BTLaCtx26V2zyb3tyn4Iw7zlSvLPJdlPbms7
 UvkCgCjX/IVJ1GbnEBJn3ldX7dEuN9DluKbP62RyoeLUCnBBid9/8zw1XMNh04oJ2WQw
 gtnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9I9d17lXX0lAXA2BIKeWqeTzRPJfIryRIMlBOpSPr67vMfKMhN51e8omskvcGpjTMknvM3z76wRY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxweT7m99xvJCIfVa2dEnOYNB9Khf7hKB3wzthUjF0NaEm4XbHv
 QY+5OSmUb0A1TV5zgmv8L0lpMYYr7/MTYS6ZBmJof8s0CewcQY5aymEWHL4JM6D+zL/kyxoQJiG
 0
X-Google-Smtp-Source: AGHT+IHRH++vS20RPDRF9y4U3FUyH+S9hoiJ/DWkV+3dx9TvRm0HAjfZboRDxOmpoR2n/g0yJgDb+w==
X-Received: by 2002:a17:907:d3ce:b0:a8d:60e2:3972 with SMTP id
 a640c23a62f3a-a90d4ffdd3bmr1319924666b.23.1727170892348; 
 Tue, 24 Sep 2024 02:41:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9393134a97sm62805766b.207.2024.09.24.02.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 02:41:32 -0700 (PDT)
Date: Tue, 24 Sep 2024 11:41:30 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Andrew Kreimer <algonell@gmail.com>
Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] accel/ivpu: Fix a typo
Message-ID: <ZvKJSna2fkJh-AVY@phenom.ffwll.local>
Mail-Followup-To: Andrew Kreimer <algonell@gmail.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>
References: <20240909135655.45938-1-algonell@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909135655.45938-1-algonell@gmail.com>
X-Operating-System: Linux phenom 6.10.6-amd64 
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

On Mon, Sep 09, 2024 at 04:56:38PM +0300, Andrew Kreimer wrote:
> Fix a typo in comments.
> 
> Reported-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Andrew Kreimer <algonell@gmail.com>

Applied to drm-misc-next, thanks.
-Sima

> ---
>  drivers/accel/ivpu/vpu_boot_api.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/ivpu/vpu_boot_api.h b/drivers/accel/ivpu/vpu_boot_api.h
> index 82954b91b748..d474bc7b15c0 100644
> --- a/drivers/accel/ivpu/vpu_boot_api.h
> +++ b/drivers/accel/ivpu/vpu_boot_api.h
> @@ -8,7 +8,7 @@
>  
>  /*
>   * =========== FW API version information beginning ================
> - *  The bellow values will be used to construct the version info this way:
> + *  The below values will be used to construct the version info this way:
>   *  fw_bin_header->api_version[VPU_BOOT_API_VER_ID] = (VPU_BOOT_API_VER_MAJOR << 16) |
>   *  VPU_BOOT_API_VER_MINOR;
>   *  VPU_BOOT_API_VER_PATCH will be ignored. KMD and compatibility is not affected if this changes
> -- 
> 2.46.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
