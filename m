Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A6D94CCA3
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 10:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4487E10E879;
	Fri,  9 Aug 2024 08:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="DuaxmFf+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7DA10E879
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 08:48:02 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5b9d4eaf3beso189146a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 01:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1723193280; x=1723798080; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=X5AwRwVwTZmkq3oGoDJtamdAtUPilZp0Mb1FEZtX/Us=;
 b=DuaxmFf+Phv8S9HiZgkrru8s81TJ2A+HifXVjq1a8dCIZomnGTiEp/5oTwlw7FLJs8
 3Ozx4MH45MLijTG5vtKkwn1SCVDbgf/RYS6G6KPzKv1QHR2KnDLPGAjoxiUc0LTU4zBp
 5nwJNEPuqR3bWqt3SS25NufSEWhd7oa61Q3zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723193280; x=1723798080;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X5AwRwVwTZmkq3oGoDJtamdAtUPilZp0Mb1FEZtX/Us=;
 b=uJVy/vtz5cFdUo3LSD0DmsH+qlL+Cged8sdcCD9L0rLWjrFwSyx5DI6YwEVlpWj0kl
 SwXbPZDJH80qVxRkI9Zv15GPBXOepAWpGgTmIOJFJLGiISzIjJVp08pX09OR0Pi76041
 pYzht9Ao/3rERrPmDcNhe9imhP53KNzcEKETfkCW2UYuTUugO2zvpse763k+apJqb3It
 hYLPCCm0hTpGw9oiZQ7/YhbIt9i/XmLbQSj4OWc6g5gEdUPWiQ1cU8fEDnLzQ3YelZNh
 GoapwQKNu2EybY6mrLvdLbwDZDAok5/SkfLOnntq1dNC+vYovTIP6DWqmh7PW/nsZWqJ
 7e7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6TLq0j+9+P0W0MKn7+iijHAOdzMbGeHHlf8XT5gwG2/XX2A0YkQqq1eSf+Ex/TtbNNwAFe9F2YbY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2pDoMQ5T2EO91dxHGofHnCRIKvpd5DzS8W6VO/EkKnDkxe/kw
 8CPyRODnpfTccpcd2JGSWjGl2IogSeONlPrOGETT3IXKSnblb20ny/vKYEqMork=
X-Google-Smtp-Source: AGHT+IGrDlxJnCmNLqrjUzch8tJq3bfI6vWVJONzmqgEemt+YVn9Bzggh5dLbbui/xxZ9iff2V0O1A==
X-Received: by 2002:a17:907:2d89:b0:a80:91b0:f501 with SMTP id
 a640c23a62f3a-a80aa5cb79dmr40237966b.4.1723193280365; 
 Fri, 09 Aug 2024 01:48:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9d437bbsm815788066b.121.2024.08.09.01.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 01:47:59 -0700 (PDT)
Date: Fri, 9 Aug 2024 10:47:57 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH 5/8] drm/nouveau: Implement switcheroo reprobe with
 drm_client_dev_hotplug()
Message-ID: <ZrXXvcKeN2w3lZs_@phenom.ffwll.local>
References: <20240807084539.304014-1-tzimmermann@suse.de>
 <20240807084539.304014-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807084539.304014-6-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.9.10-amd64 
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

On Wed, Aug 07, 2024 at 10:41:37AM +0200, Thomas Zimmermann wrote:
> Replace the callto drm_fb_helper_output_poll_changed() with a call
> to drm_client_dev_hotplug(). It's equivalent in functionality, but
> use the DRM client infrastructure.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/nouveau/nouveau_vga.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
> index ee637f1fe03d..ab4e11dc0b8a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_vga.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
> @@ -58,8 +58,9 @@ static void
>  nouveau_switcheroo_reprobe(struct pci_dev *pdev)
>  {
>  	struct nouveau_drm *drm = pci_get_drvdata(pdev);
> +	struct drm_device *dev = drm->dev;
>  
> -	drm_fb_helper_output_poll_changed(drm->dev);
> +	drm_client_dev_hotplug(dev);
>  }
>  
>  static bool
> -- 
> 2.46.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
