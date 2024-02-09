Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DFB84FDBA
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 21:36:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4787D10FCC9;
	Fri,  9 Feb 2024 20:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fYnylFL6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AB610FCC9
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 20:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707511002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p9uKALDa4xvpDOgXpU+zACctLYHRXfYppo59UjRsLlE=;
 b=fYnylFL6RwSOX6iJuBrmzYEB4fUccma8rEWAbF/jujbA/reL57tYd8WD8fyyfjDSQ+L2O3
 1oxR7c2jobGf0y8PFwSio2e61CW9emH0/R/2fwEm1NLhshgUmxyLd/UXbyA1KszRKz2XxH
 57Re89bKQvTjqj1U9tE7gsgJrfvpdfQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-k5NFlmm1Oe6ceVx2hS_JHw-1; Fri, 09 Feb 2024 15:36:40 -0500
X-MC-Unique: k5NFlmm1Oe6ceVx2hS_JHw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40e40126031so8574375e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Feb 2024 12:36:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707510998; x=1708115798;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p9uKALDa4xvpDOgXpU+zACctLYHRXfYppo59UjRsLlE=;
 b=GY//CWm5egTEqZ29fZd6NzvQKFofFlVZtHV6ASHdHyBKDNyA2eMci2GW0ix3GcqqF7
 wuyBdoFVA+q9suEhSSiquuEOEdzvqhSHGnbFBHkv4EnM7jQSI/kNU0zE96G4Znrf6G8Q
 z3rXc2wJbL/Cvhvi8PocrViAaktzLZ2c4u2n9ucK2e09UMq1kdyPfu295y2GHOe/+NSH
 M8QVn4dqdc2JPlEB7DjAYXuPBa6v8CSplFgBFvsuuiMK+V9QyKi3EpyLc9En/y7JdBlQ
 9ITpCFu4RLOGTevZsvZ8j1ZJn1EjiPA8aDdS5f3RBidXgRqF5gc0Wcz1J9TA5akXzXiX
 FOrw==
X-Gm-Message-State: AOJu0YyX6H4eSJhibqD2L8DGeUSdUqT79IgZyEaPfeEeGokJxIiNnfkr
 snDBe8dT8p9suonhZqzKAW800a3cXOoq8nHnBtoIWKnULI2U1M/VYoi9dYzuhR+Gt3eyCMPDpXY
 fbjkgT9Jgts1TRx+C5IuVSPly09PsKeeaoa+VeafxCSG9vtzykDhKKoVWIiCJxiGtJw==
X-Received: by 2002:a05:600c:a004:b0:410:61d:24d1 with SMTP id
 jg4-20020a05600ca00400b00410061d24d1mr305682wmb.9.1707510998312; 
 Fri, 09 Feb 2024 12:36:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcmSyKJncShOeaAgda+WnS0MFFful3+mXlrdA7RG3Z4UTFtjICGMrBLU4CTpvxLx2N+rqrvg==
X-Received: by 2002:a05:600c:a004:b0:410:61d:24d1 with SMTP id
 jg4-20020a05600ca00400b00410061d24d1mr305670wmb.9.1707510998029; 
 Fri, 09 Feb 2024 12:36:38 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWucFdWqrJTLxDrTZ+5vSo3AoKHiRtM6AlYvTIm/A9Io+ncNh8L988I8TJXlKN82nacDdPeLbpR56DvnwLYEbn8MSfqZFx9uX50ulNfYpuW1K+Y+IGposmfSk2i7jZPdYrWVg==
Received: from toolbox ([2001:9e8:898e:7200:1f00:29c:19b0:2997])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a05600c4f0400b0040ecdd672fasm1658749wmq.13.2024.02.09.12.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 12:36:37 -0800 (PST)
Date: Fri, 9 Feb 2024 21:36:36 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Xaver Hugl <xaver.hugl@kde.org>
Cc: dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 contact@emersion.fr
Subject: Re: [PATCH] drm: document userspace expectations around the
 Colorspace connector property
Message-ID: <20240209203636.GA996718@toolbox>
References: <20240209165307.29856-1-xaver.hugl@kde.org>
MIME-Version: 1.0
In-Reply-To: <20240209165307.29856-1-xaver.hugl@kde.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Fri, Feb 09, 2024 at 05:53:07PM +0100, Xaver Hugl wrote:
> Signed-off-by: Xaver Hugl <xaver.hugl@kde.org>
> ---
>  drivers/gpu/drm/drm_connector.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index b0516505f7ae..01e13984629b 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2158,6 +2158,14 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
>   *     one supported. Sink supported colorspaces should be retrieved by
>   *     userspace from EDID and driver will not explicitly expose them.
>   *
> + *     As userspace can't currently know whether or not the output is using
> + *     RGB or YCC signalling, the driver must translate properties to their
> + *     relevant RGB or YCC counterparts, depending on the actually used
> + *     signalling. Property values that are only valid for either YCC or RGB
> + *     and have no equivalent for the other signalling type must not be
> + *     exposed as supported, unless the driver can guarantee it never uses
> + *     the signalling that doesn't match the property.
> + *
>   *     Basically the expectation from userspace is:
>   *      - Set up CRTC DEGAMMA/CTM/GAMMA to convert to some sink
>   *        colorspace
> -- 
> 2.43.0
>

Thank you!

Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>

