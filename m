Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A09485B75A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 10:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E4310E291;
	Tue, 20 Feb 2024 09:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MnEpWMj0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6C710E291
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 09:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708421272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=obRxtLx6rLeO3YU/rqnXda0xS0dHIkiSbzya77n1Jfs=;
 b=MnEpWMj00gOQkqOmQczMdrFW+Iod0nGhLRNuoe0lIEh71XN9uVdjYBO1iwSFWLHcWakX5X
 q4ZskszBNiv2XkV5MLRlg9/UpEkPislMjCGkWDyURxmUfLjPlZW+r35BagzSJ41dMdmdfK
 q230nFN5lzX8grIVKKLe2foRKLWWulY=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-pNiyhdYtNAiUpGjBBV6fAQ-1; Tue, 20 Feb 2024 04:27:51 -0500
X-MC-Unique: pNiyhdYtNAiUpGjBBV6fAQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-512b41a2966so1387553e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 01:27:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708421269; x=1709026069;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=obRxtLx6rLeO3YU/rqnXda0xS0dHIkiSbzya77n1Jfs=;
 b=SKHCj+kDo5uPARYHc0K43tF2meUDnM396uJ+375WGTkhYBPUaqJhVzeV/7DoMwlZxz
 URJHvDuohUiyVR4Pmtf+n2Bi0gDXv0nLqfEVsjFukge61vv4uo57x9V1IuftnLSkQcir
 e11mCH2W7HTwOVUJ6mU0CKgwLMw6kokEkHl+dDdjyHYv0N70PgmJDKslLxqfefxm+qoW
 46poAwTdpV7lFWRxqPAR3PJrK/syo4cq64lzgJUj52EgAGCP1MliEfGBp059SGGKFzlj
 kp3LqWBxqUtX/K7BTY3EnmfmfaQXhTJwlz/eSs8r6AwHU+dyyVbGRPPNbZkMOaFlSmEl
 esqA==
X-Gm-Message-State: AOJu0YxzFV52WRXs5ajoepXeDvPckcu5s/kosUXHOsMDsen0dibBJWJn
 s9KcOgZhuU/6AJ1EDwjxoEedS9/gpYgPBk8T3Ek5J8+5zzESRtYTkLktqye5hyhKB0/DC0kaghh
 iKFgwY0sYC59ElCMACTSM1MOXfgFmreg3OE3+J3W+nF03Ohu1NLS45lhHY/KJIyO+WLVm06Olew
 ==
X-Received: by 2002:a05:6512:203a:b0:512:b362:e790 with SMTP id
 s26-20020a056512203a00b00512b362e790mr3016704lfs.34.1708421269256; 
 Tue, 20 Feb 2024 01:27:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFa5OX+BOUymJZ7SlIgyg3cW7L8Ltr9UOF5eSo06b5LnwaixDwHdhkSc1ftkjut2C8Il/ElUg==
X-Received: by 2002:a05:6512:203a:b0:512:b362:e790 with SMTP id
 s26-20020a056512203a00b00512b362e790mr3016699lfs.34.1708421269080; 
 Tue, 20 Feb 2024 01:27:49 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ci3-20020a5d5d83000000b0033cf2063052sm12834029wrb.111.2024.02.20.01.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 01:27:48 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: [PATCH 07/10] fbdev/sh_mobile_lcdc_fb: Remove struct
 backlight_ops.check_fb
In-Reply-To: <20240212162645.5661-8-tzimmermann@suse.de>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-8-tzimmermann@suse.de>
Date: Tue, 20 Feb 2024 10:27:48 +0100
Message-ID: <87ttm3iiy3.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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

> The driver sets struct fb_info.bl_dev to the correct backlight
> device. Thus rely on the backlight core code to match backlight
> and framebuffer devices, and remove the extra check_fb function
> from struct backlight_ops.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

