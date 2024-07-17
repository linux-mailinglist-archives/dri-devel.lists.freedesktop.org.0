Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 878DD934074
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 18:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517CD10E2D5;
	Wed, 17 Jul 2024 16:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N+VygF+w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614E010E2D5;
 Wed, 17 Jul 2024 16:31:00 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1fc587361b6so3348055ad.2; 
 Wed, 17 Jul 2024 09:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721233860; x=1721838660; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fZhsh+wnWjt6cLcXDiRXnrrVDVKDoWotCT7UNQJ5Bng=;
 b=N+VygF+wX6cKxXfaXJOAhQo6q+Id9WuzL9oOCvWYD30tL2eevjZEEerLXBBvM7mY1E
 v1KOLPJpFB7sebhhTvQLnlmCchOmKb3kM2fx+Q0T5mL6mXOfMnI4IR8ZKwNdz8bxFGO1
 Y28HmaHKx1q1rL7WRcjiOyzTyNjq+AL0qd8qAj7wdTacOG3DZzVtsMcpKI2BI+iDYsbI
 AgMsJmOMgeYhCQicfvUPLEryNEq2aT1FAmZ9DzntGiUAm11aNIsQLNUwRvQ/cDPzXQQQ
 HO75fawt7W4AhkbuoejS7B5PU5f415rsvVmfK5atLryk7mz1AMA1xYFVH4VALRS01fIa
 XppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721233860; x=1721838660;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fZhsh+wnWjt6cLcXDiRXnrrVDVKDoWotCT7UNQJ5Bng=;
 b=CykaLsfRaTe4UbWlcFaMSyK+90UV1ZjjEd0wUyfvMvd15pgnzHbXUZSRAN83FHP1/0
 hionAVwxLUrLCR0VZy2Kq2fAO6g04i/FYgTJLqf7+mfYRKAiLmpsR14LnigwuhYSF1Jv
 OPwgM1bQjNAFgUjzZxH1ZxKk2nLxCIGz+nM5vgV1bH6u5KFZ/9BLLA4eBxPLoUVxtl1y
 XF0YoUdO/pBqi9xsATq5l3hfOZFAro4XO5inR1BMRtPEsrK7ne1QxaNDKqXrRV4ICYE6
 P9szdOg1bU8AjapBra5NrvHz0uWAzF3Pw3WzpWKMy3beDVuGBB22beNX5PwbhmSgohnQ
 gY0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnqF+2sVU6HJi7zOXezrwEEL6u9OSa5pWbyzlMEMwh5FdKHHKo1PStGiLWKp4byYNdNYUj8z3dEz74t8Y/Hy6Oo/6Kcif2vsNMNxpnBOiwtfid8bmFMUJwudFNAy9RYOKYh0IDVob/8NIfgwaPCA==
X-Gm-Message-State: AOJu0YxvhWqCDbL/G3BZdCdTw7vKAD13QVix4a8+/zWiLqehSaIx3dLz
 XPleQft6tyP3Fq39NwF6jZyNfTcyQdyUt5PcbC99DsBwSqFnioadBJiuHiNm
X-Google-Smtp-Source: AGHT+IGxeqX0fUugMvXSq1rVpJvLlkHouZdSRo4dovsKIrcHqbTZYwptDD/VOC3M9svMeLtuDbRMoQ==
X-Received: by 2002:a17:902:6841:b0:1f9:c508:acd5 with SMTP id
 d9443c01a7336-1fc4e105dcdmr13989135ad.5.1721233859603; 
 Wed, 17 Jul 2024 09:30:59 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([117.98.155.77])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc2733asm77343535ad.162.2024.07.17.09.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 09:30:59 -0700 (PDT)
Date: Wed, 17 Jul 2024 22:00:49 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, rbmarliere@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] drm: Fix documentation warning for read_mpcc_state in
 mpc.h
Message-ID: <ZpfxuUXAjmPJvLgR@embed-PC.myguest.virtualbox.org>
References: <20240712174510.70467-1-abhishektamboli9@gmail.com>
 <fb2b106e-aa51-4108-9d61-ba71935fba00@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb2b106e-aa51-4108-9d61-ba71935fba00@amd.com>
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

On Mon, Jul 15, 2024 at 05:46:38PM -0400, Aurabindo Pillai wrote:
> 
> 
> On 7/12/24 1:45 PM, Abhishek Tamboli wrote:
> > Add detail description for the read_mpcc_state function in the
> > mpc_funcs struct to resolve the documentation warning.
> > 
> > A kernel-doc warning was addressed:
> > ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:547: warning:
> > Function parameter or struct member 'read_mpcc_state' not
> > described in 'mpc_funcs'.
> > 
> > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > ---
> >   drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 16 ++++++++++++++++
> >   1 file changed, 16 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> > index 34a398f23fc6..9e65ecf1d3b0 100644
> > --- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> > +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> > @@ -282,6 +282,22 @@ struct mpcc_state {
> >    * struct mpc_funcs - funcs
> >    */
> >   struct mpc_funcs {
> > +	/**
> > +	 * @read_mpcc_state:
> > +	 *
> > +	 * Reads the state of a given MPCC instance.
> > +	 *
> > +	 * Parameters:
> > +	 *
> > +	 * - [in/out] mpc - MPC context.
> > +	 * - [in] mpcc_inst - MPCC Instance whose state is to be read.
> > +	 * - [out] mpcc_state - MPCC state structure where the state
> > +	 *                    of the MPCC instance will be stored.
> > +	 *
> > +	 * Return:
> > +	 *
> > +	 * void
> > +	 */
> >   	void (*read_mpcc_state)(
> >   			struct mpc *mpc,
> >   			int mpcc_inst,
> 
> Looks like fix for this has been already merged via a195f08636f9d7
> drm/amd/display: fix documentation warnings for mpc.h
> 
Thanks Aurabindo for pointing this out.

Regards,
Abhishek 	
> --
> 
> Thanks & Regards,
> Aurabindo Pillai
