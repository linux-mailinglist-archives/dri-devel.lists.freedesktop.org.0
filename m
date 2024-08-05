Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B14948110
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 20:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798A68826D;
	Mon,  5 Aug 2024 18:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Jp3QO6s6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E198826D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 18:03:23 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5a0d75431cbso4117a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2024 11:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1722881001; x=1723485801; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=88BvRd35V/OzPhdKOSQqndCPusN42hnrznZaISah2qc=;
 b=Jp3QO6s6HREnh0zKrEIYW+8PUuQQ9hQzqqNOUsmKSea0VEZL5zs6pZ+AulvlklS5wQ
 Zo90TukumqMOspjalAj1qS0VX6eFEf/wmrvcLCEPfwlmSnNLCfVPU9uMIgBb62rb/p5C
 8sOGBIHm9A8jlEme7vvotkPHzsp8Y7mXmNQDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722881001; x=1723485801;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=88BvRd35V/OzPhdKOSQqndCPusN42hnrznZaISah2qc=;
 b=uL3D/JPpsJL3nuiD9BXpNFpnrsxDhCilK3TbXzyDIJmbDpHTk5u0nJzqQrqdUtelIO
 o1uwUtDN6RbMQ4qJEdRfuzi+u/bsGumdm+csA99nPmgnbKOfiaSWMx9FJkYg+ET1phA2
 1xiZR9in2LM5zAOFpJo1Sbb2K9LW9cVpWPJBH0/b/Ur/SRmGTVWIqjNkqsLixH7o5Ud2
 DB7qxi5Gw5xSa18pUjUO87dmJffkVz5cp8nxqZk1lXEBkRYo7+P9p8UcPnntSrFKe3VU
 nKUq4aqUTttUIJmWQeGwDoZ7k1FtGO4KhEPG4drJpUykM/OYlaGpA44xTMslEkNWKx7i
 sYIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4noS7XnKHI/zd4E4YLibLzVqcQVADgXt9lC+JKX//yG0y1DEzAEICDgYNkbAT43ARAyst8amkj+gO6ZoepW3O0869H0jMSCBBrCHiOZ/7
X-Gm-Message-State: AOJu0YxcI5dhnE3mhDCLWtlFiILCjBTLr4OB6VnSrTOLF1OZKqOKvIR8
 GWjrtN2sAws/yYzxdki2Caf0PZV0ET8k6lsIwyPAZ/xCg2dpHFLgx9oAa6w3ve1kJD4CUAPM0V7
 X
X-Google-Smtp-Source: AGHT+IGdpz/yYrmGFTQMOGtgTZn3Z402QM4zK/U6N+5QV3x/wA63dYI2Qhmr9ppi70K8/k0WlBcuaA==
X-Received: by 2002:a50:9308:0:b0:5af:c82a:7f64 with SMTP id
 4fb4d7f45d1cf-5b7f61a9c92mr5442785a12.5.1722881001130; 
 Mon, 05 Aug 2024 11:03:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ba51da9c41sm3305453a12.36.2024.08.05.11.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 11:03:20 -0700 (PDT)
Date: Mon, 5 Aug 2024 20:03:18 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/connector: Document destroy hook in drmm init
 functions
Message-ID: <ZrET5jlPptivP6T2@phenom.ffwll.local>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240804170551.33971-2-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240804170551.33971-2-jose.exposito89@gmail.com>
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

On Sun, Aug 04, 2024 at 07:05:52PM +0200, José Expósito wrote:
> Document that the drm_connector_funcs.destroy hook must be NULL in
> drmm_connector_init() and drmm_connector_hdmi_init().
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Applied to drm-misc-next, thanks for your patch.
-Sima

> ---
>  drivers/gpu/drm/drm_connector.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 7c44e3a1d8e0..292aaffb6aab 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -426,6 +426,8 @@ static void drm_connector_cleanup_action(struct drm_device *dev,
>   *
>   * The connector structure should be allocated with drmm_kzalloc().
>   *
> + * The @drm_connector_funcs.destroy hook must be NULL.
> + *
>   * Returns:
>   * Zero on success, error code on failure.
>   */
> @@ -474,6 +476,8 @@ EXPORT_SYMBOL(drmm_connector_init);
>   *
>   * The connector structure should be allocated with drmm_kzalloc().
>   *
> + * The @drm_connector_funcs.destroy hook must be NULL.
> + *
>   * Returns:
>   * Zero on success, error code on failure.
>   */
> -- 
> 2.45.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
