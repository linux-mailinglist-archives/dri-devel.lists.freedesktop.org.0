Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0599885626D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 13:02:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31FCF10E6C8;
	Thu, 15 Feb 2024 12:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zRdfPrHU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BFA10E6C8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 12:02:38 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-33cddf4b4b5so564117f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 04:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707998557; x=1708603357; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vbgRA2GMlce397fPZXf/sJUC3uP4O/JDU4BLWHn2As8=;
 b=zRdfPrHUmSyROGMFmVfiYBgwSpPex0wPyNgLNrY7HtbcAXeg7ace9vUhIfCdqaoeeN
 WsswemJHfrC9IVGnzSrNHxbJWMKu9BQ82dqeyn3JS8akLBl/zfpjC+qOguPPozwGKGYk
 X6AL4QKKaJisZnp1GvF2YWgNgqw+vD8L42zyyTZJFSJxN1xEUBKbZdycU8wpcSi9XZAb
 i4ZndBOE3eFMDAkUO1z/g5+pnSxxAN9Fw14UrWbENfsKrx7+QZZSZRsGEuVbA534YYPB
 vnDATqdQxJfIDRUseUZ7n3exFMEv7Fhi1vC2cm4TsUoL45izDK7TCibpXBkkiET4TFL8
 i/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707998557; x=1708603357;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vbgRA2GMlce397fPZXf/sJUC3uP4O/JDU4BLWHn2As8=;
 b=otvZK5Ih8dEw8feQxouav9b/pBDjEeTwaPn1Q/KXF1DP35ve6ij/pfiw2+1kLp6Q7C
 xTMDVz3T0P+w/oO+M7fk5vXDPkM+ibRfLfhsd2E2TFI+/v982VzKuIL/iL2dEE3X3Z3S
 A0jPNxFz3FLgaaVdSnpQOq/XTw99w3ZLVNcEzPrWZGB/68NG2MOKqWr+srytvY0cmMgT
 wbId8u/NRWzEraCiiyiXe0c3DuVYRJO4bp4mNIDOJv3T7PIsTs3VjYsxjaS5Ry+KOqX2
 nR+Qnk5ftmI5LtlV1Bahb2fcPChkQq9XG+DS+jitGC/XtBmobeLQXurjHMWrshkl+dSu
 Ji3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMzDfe5IrL7hIDNLMcbPtWUZ42O4y+rLLagmVrgDuXCf3XoxqVgLHaDasn5nx/eA3FUQ8Gi4eJrA/EBH7fV9NPwVZnUyyImWdPfC0iuRWg
X-Gm-Message-State: AOJu0YyHAVEi6Wq8Lnvzzr4OqFHmo971ShallSH+OAG7idt6xgUApja6
 F9oCM53lDEBEHTZQjxsMq0HSQYUoEiG0B+vOnGZDY0nudGIMMRIIpLuwXMIGCBw=
X-Google-Smtp-Source: AGHT+IHkovjjm6uiGh8NEiN+5Igji2gmONxw1ozHtZ/fWfNAab/0bhMXeBul3IX7/uedCw8IfPnK6w==
X-Received: by 2002:adf:cf10:0:b0:33b:2884:edf2 with SMTP id
 o16-20020adfcf10000000b0033b2884edf2mr1196357wrj.56.1707998556956; 
 Thu, 15 Feb 2024 04:02:36 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 bo2-20020a056000068200b0033cdbebfda7sm1407012wrb.14.2024.02.15.04.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 04:02:36 -0800 (PST)
Date: Thu, 15 Feb 2024 12:02:34 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 01/10] backlight: Match backlight device against struct
 fb_info.bl_dev
Message-ID: <20240215120234.GG9758@aspen.lan>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212162645.5661-2-tzimmermann@suse.de>
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

On Mon, Feb 12, 2024 at 05:16:34PM +0100, Thomas Zimmermann wrote:
> Framebuffer drivers for devices with dedicated backlight are supposed
> to set struct fb_info.bl_dev to the backlight's respective device. Use
> the value to match backlight and framebuffer in the backlight core code.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
