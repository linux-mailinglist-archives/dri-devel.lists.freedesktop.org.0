Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEFB881799
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 19:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289C410E3B9;
	Wed, 20 Mar 2024 18:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kLhsDHvn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A4010E3B9
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 18:59:20 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-513e6777af4so344849e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 11:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710961158; x=1711565958; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uDx69RtQxFyew2zNRPx2nT1ZQv12YYyDo+1YlWLy1Kg=;
 b=kLhsDHvnEVq0K3Il5mNSWmVZXnRDf/rEjx9Jnb4prU4G4Wjcw7pBWRn4MrQkfyXjAR
 88DVsfbdCtPrhETY/cRCvaMx81KQxyK6FCtyCY78xfRJWycH8CI2gesGRXep3JsNTUIp
 u1i9SLqEOOxkS1nt3S8s/T+e+iYnYz1cFavtBq7z3vvrpLnnfDXWkVBQLu7/v+xQzIK7
 EY23JldbkffBhjI9xRnI9a/vCvhU79b3whgw5WZtfeRgQPeqRjiMYKqj/dypT+0KFErU
 XCcN77uElkfFCA1WhgfueFhTvlFTIaWjxVBmhCkZUL51b8Icuu0bJqk+V4iMWbCiaibX
 Fb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710961158; x=1711565958;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uDx69RtQxFyew2zNRPx2nT1ZQv12YYyDo+1YlWLy1Kg=;
 b=UcqoNgSDeMSVQ7z1t0AJiAwCzjdi1GnV6SK+AAJTDwdOVRZZGTng3JvNuZGlaIxcKu
 A6ffl6PC4qp9dblwz5lTsBQCdphEpAOyNKya4mvPbOBOwUQd9OGlnOzvZMToyinMHumH
 KW1faKtQW5lSXljJNpNl8zxLhNZa9GgaG9UV964Fpww340aXVXeW5V6KJEUfZs2KO3ts
 ZASE53QLWVfPawzpi0OOxkTN4GONoCpTAJoWMCFd3qLiT+xgdhOE5k1cpAXic0HTclvF
 ftjDkx5tPGJAl3zFYHd28LHUMQ986vzi+MQaNkcFvewgB7hH6jyksKVaDYb/qv5vD1L0
 014w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXk5i6w9oCv/dZcNexQEbr6fvNkBIRyTpOlbZAzkYqj4W/wTxZfiKjQBIdHEHzTTwO/KWzIj/UTU6TCs/KMF1M5aPaGRd7wAjXwttdtmKsP
X-Gm-Message-State: AOJu0Yx6gWmORW/ap+1JRDWttW1Vm00rdYsRTCYzRC7NRA4mnKmsqL+r
 VRzg1+r33Yo+NUjZRYbrIp1BmpNbBli9zZat+WiGvOaNIuGGO1je
X-Google-Smtp-Source: AGHT+IH/ceP2Pxa/IuRZRDzz0Pwy3ckqKVMWSsWh5JN5WyzR1CEU2WVpYfRZlMZa1f7TIzgH0F5dCw==
X-Received: by 2002:a05:6512:32a9:b0:513:d976:496a with SMTP id
 q9-20020a05651232a900b00513d976496amr11193764lfe.50.1710961155907; 
 Wed, 20 Mar 2024 11:59:15 -0700 (PDT)
Received: from mehdi-archlinux ([2a02:8109:aa27:2d00::e094])
 by smtp.gmail.com with ESMTPSA id
 jl27-20020a17090775db00b00a45c9ea48e3sm7586136ejc.193.2024.03.20.11.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 11:59:15 -0700 (PDT)
Date: Wed, 20 Mar 2024 19:59:13 +0100
From: Mehdi Djait <mehdi.djait.k@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: drm/tiny: QUESTION: What to use instead of
 drm_simple_display_pipe ?
Message-ID: <ZfsyAXPCRX5hXBc0@mehdi-archlinux>
References: <ZfiTbYAa7qxXlrPd@mehdi-archlinux>
 <da7cfff1-e147-48ea-bcda-9ea913e5feee@suse.de>
 <87o7ba1u3x.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o7ba1u3x.fsf@minerva.mail-host-address-is-not-set>
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

Hello Javier, Hello Thomas,

On Tue, Mar 19, 2024 at 09:52:34AM +0100, Javier Martinez Canillas wrote:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
> 
> Hello Mehdi,
> 
> > Hi
> >
> > Am 18.03.24 um 20:18 schrieb Mehdi Djait:
> >> Hello everyone :)
> >>
> >> I am implementing a tiny drm driver and I am currently working on the
> >> V2: https://lore.kernel.org/dri-devel/cover.1701267411.git.mehdi.djait@bootlin.com/
> >>
> >> I got a review on the v1 telling me not to use the
> >> drm_simple_display_pipe. Can someone please explain this further ? Or
> >> give me an example drm driver that does it the right way ?
> >
> > You can copy the code from drm_simple_kms_helper.c into your driver file 
> > and start inlining everything. For example
> >
> >   1) Your driver calls drm_simple_display_pipe_init(), so you copy that 
> > code into your source file
> >   2) drm_simple_display_pipe_init() uses drm_simple_kms_plane_funcs and 
> > drm_simple_kms_crtc_funcs, so you copy these into your source file; 
> > together with the drm_simple_kms_*() helpers that they use for their 
> > callback pointers.
> >   3) Mayb do this for other drm_simple_kms_*() code.
> >   4) Then start inlining: inline your copy of 
> > drm_simple_display_pipe_iit(). Instead of using 
> > sharp_ls027b7dh01_pipe_funcs, inline its functions into your copy of the 
> > callers. And so on.
> >   5) Rename the resulting code, so that it fits you driver.
> >
> > With careful changes, you 'll end up with the same functionality as 
> > before, but without the intermediate layer of the simple-KMS code.
> >
> 
> On top of what Thomas said, you can check 622113b9f11f ("drm/ssd130x:
> Replace simple display helpers with the atomic helpers") that did this
> change for the drivers/gpu/drm/solomon/ssd130x.c driver.
> 
> The driver is also for a monochrome panel controller and it does support
> SPI as transport, which means the controller is similar to yours in many
> aspects. You could use that driver code as a reference for your driver.

Thank you both very much!

--
Kind Regards
Mehdi Djait
