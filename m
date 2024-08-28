Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 572269627AE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 14:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C640B10E503;
	Wed, 28 Aug 2024 12:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="i3LdVT7T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD82F10E503
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 12:49:14 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-428e0d184b4so56098415e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 05:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724849353; x=1725454153; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tKQbsR6t0zyT0T0u069DtZPBK28xMAmfPt12nKiFneA=;
 b=i3LdVT7TZ0x7bV3KUkzt0J+TTTriBZRKbxjSXYMl94QH8nhT+my6Ve512Lb7mWX0K0
 CMgJIN8KklYoHJezO1CN+J2qqj/cvNxQyN/lHAZv0Q0luLypj4wBpb/fSFvxurPc3eFm
 tmF4WQDr7eSMnRXqnxvW3DHMa83cVA2Kp26rI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724849353; x=1725454153;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tKQbsR6t0zyT0T0u069DtZPBK28xMAmfPt12nKiFneA=;
 b=jRSOd99xjiXz/Z7xmm2Vz9uYMA7yFgQXDm0bpr7cAotXEb2naqwhOC1rsb7EAlUipr
 LCYdLBLySuWP2M9XS94QVIB9OeZNe8LQEv24k67kgryxyiwx2+b4bVyGqmPOeeumcw0+
 IORl6/RCPTuQRmEq7bGlnZAuRBoUxTtFZ+YntnrD1u6Z8Se94JHYVC6R76Q8N4thI4o4
 +aKtmrwrQqcDzOLXcdQzJG4lLNKa38te9//F44B4CFR1G6vWHEpES6rSK4uaCkK8dE+E
 0FdBouFhDuWjyiKBBLNsMPRweFeyrV1q7KdkA3O5edl1cbkDsVEtjymqeyiMXw4O2lCa
 8ccw==
X-Gm-Message-State: AOJu0YyAnUNwOMNWpNk3FkomgjzXT2Fflh1T9T7zYh7oiLCSDButcFJG
 VXt31ZWD62mmDjQNkWTjbsDjaepVTtokBaYDbgXx4leO80Hog8+H0qsdVjgx96Y=
X-Google-Smtp-Source: AGHT+IGSICLuUsKT4MpwCGir7rnr1SSTgkeA2AfvMdaKTHC3Ud4kYkdnKz+swzlgZ51nFTSJIsMWPA==
X-Received: by 2002:a05:600c:4e01:b0:426:654e:16da with SMTP id
 5b1f17b1804b1-42acd39e07cmr129520165e9.0.1724849353031; 
 Wed, 28 Aug 2024 05:49:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba61c0666sm21470905e9.0.2024.08.28.05.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 05:49:12 -0700 (PDT)
Date: Wed, 28 Aug 2024 14:49:10 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 6/6] drm/tiny/gm12u320: convert to struct drm_edid
Message-ID: <Zs8cxu-T_HZdwSBJ@phenom.ffwll.local>
References: <cover.1724348429.git.jani.nikula@intel.com>
 <c31c3afa883a3321345608c480c26161b638a83e.1724348429.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c31c3afa883a3321345608c480c26161b638a83e.1724348429.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Thu, Aug 22, 2024 at 08:42:52PM +0300, Jani Nikula wrote:
> Prefer the struct drm_edid based functions for allocating the EDID and
> updating the connector.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> ---
> 
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/tiny/gm12u320.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
> index e0defb1d134f..0bd7707c053e 100644
> --- a/drivers/gpu/drm/tiny/gm12u320.c
> +++ b/drivers/gpu/drm/tiny/gm12u320.c
> @@ -464,7 +464,7 @@ static int gm12u320_set_ecomode(struct gm12u320_device *gm12u320)
>   * Note this assumes this driver is only ever used with the Acer C120, if we
>   * add support for other devices the vendor and model should be parameterized.
>   */
> -static struct edid gm12u320_edid = {
> +static const struct edid gm12u320_edid = {
>  	.header		= { 0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00 },
>  	.mfg_id		= { 0x04, 0x72 },	/* "ACR" */
>  	.prod_code	= { 0x20, 0xc1 },	/* C120h */
> @@ -523,8 +523,15 @@ static struct edid gm12u320_edid = {
>  
>  static int gm12u320_conn_get_modes(struct drm_connector *connector)
>  {
> -	drm_connector_update_edid_property(connector, &gm12u320_edid);
> -	return drm_add_edid_modes(connector, &gm12u320_edid);
> +	const struct drm_edid *drm_edid;
> +	int count;
> +
> +	drm_edid = drm_edid_alloc(&gm12u320_edid, sizeof(gm12u320_edid));
> +	drm_edid_connector_update(connector, drm_edid);
> +	count = drm_edid_connector_add_modes(connector);
> +	drm_edid_free(drm_edid);
> +
> +	return count;
>  }
>  
>  static const struct drm_connector_helper_funcs gm12u320_conn_helper_funcs = {
> -- 
> 2.39.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
