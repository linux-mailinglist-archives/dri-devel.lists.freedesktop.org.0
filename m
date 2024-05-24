Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 505028CEA71
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 21:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6481B10F5D6;
	Fri, 24 May 2024 19:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Rntw2+Li";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFB910F5D6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 19:46:56 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2e716e3030aso73990981fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 12:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716580015; x=1717184815; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Quo9VUto6uPX81U21h21/Sote2mqJ5XSyeYi0dVaj0I=;
 b=Rntw2+LiGOnC5KHrjEmX0qRZ76r8bEZS1CzqfzbQNveOdLcT0582QhYlKLoiaMpxDG
 Nx9K4DZm6CaqjrIWJBxzBpcJtr+sP50H71CbZipHeNYWlUqx9xiDCQdnIklG2/r6dMJ0
 TBvjFpCFzSyuXhJsgDAAfvp19clExyVhnAl367LLIa90bIQuLI4WTD/PBg7gXKjuRUc3
 HCBDG+kFkCSRdYj0LsIkZyzJHBHf9zg86LhEhMPeizYtV+o/kzOGys9xEjOEB5pvN+EE
 vW+Ai6ba1EKhAKYKuILp8RFt/2kgCwU+N/SZsem15DitosgB1kkLPaxWSCLxx7CGi+Hi
 yJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716580015; x=1717184815;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Quo9VUto6uPX81U21h21/Sote2mqJ5XSyeYi0dVaj0I=;
 b=mGnxicS5vWOdbSReQsdC9c1JL8hR7YzXaVcxduKxK5eUUQ1qccmSLIc4bQHxslWVoc
 f4BUpabZkjSWX3nC00NGnO04TtIamLomFNb8JN5jeH3ee2GOpS8HxRE06b2FfsnydjyI
 NaxqZWTg/zKrqv2Z2IB4uOBWm0ckp+Qnk0Wp+WqE0xPK8iu2b654zxtxbS0/npZMlHzg
 ZQfje8IJp8tuuMv66BA+zcgvYJrtXaPrf3MqqKKsQ1pO8nwiDj7FhOqfMTNRa69hWdan
 JFA2Ts9WbuL6DWHjYNKmYgWlMCpx5k6RAtJZqDeDLwQU0j3Zja8EoRdfAeWxseYjclRr
 XPcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDIZsdQiTiGM7n3iBqFLC8LL4vH+MfE0/sQ7ezmj00lx1CRbNg+C/tQQFSryVTV076mtA56b/fg9P4EwjOi30o7ScbvH69BFDcx3/ggKgF
X-Gm-Message-State: AOJu0Yxg0nMFjYiFvP1Uuo9mxAohwH/O7T8EB0RIKZBzC3MpArpiTY09
 wYT0+2sc6kImcPbKeLc3vHlUY31a9SbWz6G7tmujguh0OlaoS87w+q+F4y8QzAs=
X-Google-Smtp-Source: AGHT+IGGkwkIgDNujDfrkTUvU6TyZSMLZ2HS+RhhNILj1udlfwdmNchCCne3FxzMdqc27keq9rutHg==
X-Received: by 2002:a2e:3209:0:b0:2d8:34ec:54e6 with SMTP id
 38308e7fff4ca-2e95b24dee7mr21133711fa.33.1716580014516; 
 Fri, 24 May 2024 12:46:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95be00a0dsm3111601fa.105.2024.05.24.12.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 12:46:54 -0700 (PDT)
Date: Fri, 24 May 2024 22:46:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: linux-kernel@vger.kernel.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 sam@ravnborg.org, mripard@kernel.org, dri-devel@lists.freedesktop.org, 
 jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, a-bhatia1@ti.com
Subject: Re: [PATCH v3 1/2] drm/bridge: sii902x: Fix mode_valid hook
Message-ID: <x7i5miguht47wxliioos7npelzzicnwt7g5pfjqjvdztksgzga@c7djvf3lg3kf>
References: <20240524093509.127189-1-j-choudhary@ti.com>
 <20240524093509.127189-2-j-choudhary@ti.com>
 <y6ersd72tp2d6k4i2hja7bg37lahnvye2qion67urxeakw6rju@dher7oomt2ks>
 <4cd64cf5-d2b0-4aa9-b958-6b6fc54f0bf2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cd64cf5-d2b0-4aa9-b958-6b6fc54f0bf2@ti.com>
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

On Fri, May 24, 2024 at 05:54:02PM +0530, Jayesh Choudhary wrote:
> Hello Dmitry,
> 
> On 24/05/24 15:11, Dmitry Baryshkov wrote:
> > On Fri, May 24, 2024 at 03:05:08PM +0530, Jayesh Choudhary wrote:
> > > Currently, mode_valid hook returns all mode as valid and it is
> > > defined only in drm_connector_helper_funcs. With the introduction of
> > > 'DRM_BRIDGE_ATTACH_NO_CONNECTOR', connector is not initialized in
> > > bridge_attach call for cases when the encoder has this flag enabled.
> > > So add the mode_valid hook in drm_bridge_funcs as well with proper
> > > clock checks for maximum and minimum pixel clock supported by the
> > > bridge.
> > > 
> > > Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> 
> [...]
> 
> > > +
> > >   static enum drm_mode_status sii902x_mode_valid(struct drm_connector *connector,
> > >   					       struct drm_display_mode *mode)
> > >   {
> > > -	/* TODO: check mode */
> > > +	struct sii902x *sii902x = connector_to_sii902x(connector);
> > > +	const struct drm_display_mode *mod = mode;
> > > -	return MODE_OK;
> > > +	return sii902x_validate(sii902x, mod);
> > 
> > There is no need to. The drm_bridge_chain_mode_valid() should take care
> > of calling bridge's mode_valid callback and rejecting the mode if it is
> > not accepted.
> 
> I need some clarity here.
> 
> IIRC, if the bridge does initialize the connector in case
> where the encoder does not attach the bridge with the
> DRM_BRIDGE_ATTACH_NO_CONNECTOR (DBANC) flag (referring to tidss
> encoder before we implemented the DBANC feature), then
> drm_connector_helper_func are called and drm_bridge_funcs
> are NOT called (atleast from what I have seen in detect
> hook for cdns-mhdp-8546 driver which is there in both
> structures).

There are different kinds of bridge_funcs. detect is a part of the
connector-related interface, so it is not called by the drm core. On the
other hand functions like mode_valid, enable/disable, etc. are called
for all bridges.

> I do not have any platform to test non-DBANC encoders.
> And I did not want to break any platform that were still using
> bridge_attach without DBANC flag.
> That is why I kept mode_valid hook in both structures.
> 
> Are you implying that if connector_helper_funcs are not there
> then there will be some sort of fallback to bridge_funcs instead
> of passthrough for mode_valid check? Because that goes against my
> previous observations.

Not quite. See how drm_atomic_heler uses bridge_funcs.

-- 
With best wishes
Dmitry
