Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3887E7D7BCF
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 06:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40F210E753;
	Thu, 26 Oct 2023 04:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D9B10E753
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 04:44:41 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32003aae100so955423f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 21:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698295480; x=1698900280; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WmgUqShVRpp/vxWnT3LQDEFmhiSdp+ySB57jdJRdwMo=;
 b=qCqEQs995DybwhDLqMI8slkJjv74rW/lpFs9OYF4CGhwVNowpW8CAjp0ZtDyAk2QZA
 Ooz0WjExJuVlpB4jS6wy6dGQlmI/PFyp1p2t9w/lreuGll6sBfoELuXxdz2ecdYOP27R
 sgq2gtUTyNTvAjuvI/ZjujrEvIAhyUvIyVbabQ+pMHvX9+zQcb95JOeLMz4claQ+c7Y5
 0K7Q/0A3Pv/F6YJgiJiKpgn3kv/RmFK/I9C18X7HgrvEvl8mj/Xl6GuzR67p15x5iCNd
 4nOhs+rzyZ1UeWH4zMygwsNZFvhjePEe8gSGdgZMJhkQIvhOsJmBon51Lxdt1vkeEke5
 O9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698295480; x=1698900280;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WmgUqShVRpp/vxWnT3LQDEFmhiSdp+ySB57jdJRdwMo=;
 b=YxX+htfLwqwETqhj60XxU+F6YZ7SsxjbuX/uNVgIJ+ofrsKCCTFO9huU82PhcKjEhS
 8vt53d8PtPlB6WfB4WqFccO9ooD37scMC/09JoYMPcEIGgpjnyju6LIhibclETDtQgb+
 pU5J13gaW/V5UuY7ly8Cc1C62OYX5bFZpZ2JSvF8sxmm2TaHJr8QwoJIjF+jOXRYjWfm
 E7UM+ev2Cs75HiDe0aUIgVbbWqBMisklH2+mWcoJ7v/D43L7kn95oRORt7CdHkPtK/v5
 w5aGI9+p6wAWqHpmpMTcPIToSk5nUCjQZrTW/KVmutj16C4dWYCNizyft9SirZc6llyn
 tOOA==
X-Gm-Message-State: AOJu0YyfObzpQd263K16MCA5tlaDCdczc+aboCrOCofK6C32hpAxZyAn
 cfOFHfWCzmxsqlSDhyJAEb2IZg==
X-Google-Smtp-Source: AGHT+IFM0o0/kjpc5CCxbqLAeNT0gKpGFUpYRc2EnPItqfKIOyQ2Q/I0iu16fvKe4xui0rK8KHcMQA==
X-Received: by 2002:adf:d1ca:0:b0:32d:8c67:be05 with SMTP id
 b10-20020adfd1ca000000b0032d8c67be05mr1572772wrd.22.1698295480221; 
 Wed, 25 Oct 2023 21:44:40 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 o12-20020adfe80c000000b0032da49e18fasm13438465wrm.23.2023.10.25.21.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 21:44:39 -0700 (PDT)
Date: Thu, 26 Oct 2023 07:44:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] vga_switcheroo: Fix impossible judgment condition
Message-ID: <4ec2b80b-f042-4abf-b799-0a9ef364f0fa@kadam.mountain>
References: <20231026021056.850680-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026021056.850680-1-suhui@nfschina.com>
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
Cc: tzimmermann@suse.de, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, mripard@kernel.org, Jim.Qu@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 26, 2023 at 10:10:57AM +0800, Su Hui wrote:
> 'id' is enum type like unsigned int, so it will never be less than zero.
> 
> Fixes: 4aaf448fa975 ("vga_switcheroo: set audio client id according to bound GPU id")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/gpu/vga/vga_switcheroo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
> index 365e6ddbe90f..d3064466fd3a 100644
> --- a/drivers/gpu/vga/vga_switcheroo.c
> +++ b/drivers/gpu/vga/vga_switcheroo.c
> @@ -375,7 +375,7 @@ int vga_switcheroo_register_audio_client(struct pci_dev *pdev,
>  	mutex_lock(&vgasr_mutex);
>  	if (vgasr_priv.active) {
>  		id = vgasr_priv.handler->get_client_id(vga_dev);
> -		if (id < 0) {
> +		if ((int)id < 0) {

Hi,

I feel like you're using Smatch?  Which is great!  Fantastic!

Have you built the cross function database?  If you have there is a
command that's useful.

$ ~/smatch/smatch_db/smdb.py functions vga_switcheroo_handler get_client_id | tee where
drivers/gpu/drm/nouveau/nouveau_acpi.c | (struct vga_switcheroo_handler)->get_client_id | nouveau_dsm_get_client_id | 1
drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c | (struct vga_switcheroo_handler)->get_client_id | amdgpu_atpx_get_client_id | 1
drivers/gpu/drm/radeon/radeon_atpx_handler.c | (struct vga_switcheroo_handler)->get_client_id | radeon_atpx_get_client_id | 1
drivers/platform/x86/apple-gmux.c | (struct vga_switcheroo_handler)->get_client_id | gmux_get_client_id | 1
$ make cscope
$ vim where
Use cscope to jump to each of those four functions.  Move the cursor to
the nouveau_dsm_get_client_id and hit CTRL-].

They never return negatives.  The enum vga_switcheroo_client_id has a
VGA_SWITCHEROO_UNKNOWN_ID define which I guess these functions are
supposed to return on error.  They never do return that, but I bet
that's what we are supposed to check for.  It honestly might be good
to check for both...

		if ((int)id < 0 || id == VGA_SWITCHEROO_UNKNOWN_ID) {
			mutex_unlock(&vgasr_mutex);
			return -EINVAL;
		}

regards,
dan carpenter

