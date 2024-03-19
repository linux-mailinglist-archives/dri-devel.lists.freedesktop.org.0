Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F90C8800CB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 16:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E692010FB93;
	Tue, 19 Mar 2024 15:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="jHDuv0fW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E5E10FB93
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 15:36:11 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-568c6e65d09so319313a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 08:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1710862570; x=1711467370; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oMRrzjOPzthVrfn6KYAeeCpTeFZ11+LfDjNaDwcFwcY=;
 b=jHDuv0fWLQXLmDwarFzN5+gSLhvgxz54398li7ZXFBmwdbx8eYUEqjaFV/sDBSAixU
 6nUriY1BenPUNlV8eZK2h0087Bg/Gq6rWSp1XXLtZJEgXO+OqPwg5NiXKgMzbDrO962u
 S7OTbeak/EFhpt63b99qz1d9sYAk6vxdVfi4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710862570; x=1711467370;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oMRrzjOPzthVrfn6KYAeeCpTeFZ11+LfDjNaDwcFwcY=;
 b=mJsCV8rBael5JN6Gq3m93L9AfypjeZJBCQIfKpiW0CEcp8OdhL9BCFbOVPhk2LHgsY
 0LomPPbz3//PpX42EGOfYn8VE53ib2Hdd6jL3eFJQy5sAXdYTxFYERUjbF6vibyEaPDx
 mW4N2GzJO9sPEz5UMV+9aAyXtFTYZVeaCKBpNQaLqowPbZDQLFmMOtqm4BtDeved02CX
 yhG2/mv5aoxn7wCLRk5UANcBJILLgLG2BD+jUXAkKq/8B2egFYkhWdaT2H8PY+NWdvFg
 ankJFyPkymDVtX/Jj0vwYZITrDvzxUdJh3MmYxme4MHZLh+Rokl6qBF3+uwccmeBdd8B
 lU7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGtf66vmhatiA/An6SZs/PhtFuC7xq3f3M4SXO4TUuOmrL4knDRZ/Qi0998Sdcp1gnDeMTBh2wWYLjnj4QJiUN161ynxC0BOgp8IzePIKp
X-Gm-Message-State: AOJu0YyUZ/PVjTMSC5VanSIj1DTR/bXN6mULYTmNKRkVYRnps1HCm4Xh
 mqFCtKY3VRwpLTJ+ZrdNgaf9CZCNcU/ZBGNhnZ3bTOfxLEiG6WaOpjM3V25Y6QU=
X-Google-Smtp-Source: AGHT+IGqka02G9xZBUIJYUnMVsGDttJH1Lg5gp0y4iikQkmbEHNnKV4dqr/YUk062oXDQf+NP19rXg==
X-Received: by 2002:a05:6402:388b:b0:568:a65c:7aff with SMTP id
 fd11-20020a056402388b00b00568a65c7affmr1747003edb.4.1710862569608; 
 Tue, 19 Mar 2024 08:36:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a170906049700b00a3efa4e033asm6220139eja.151.2024.03.19.08.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 08:36:08 -0700 (PDT)
Date: Tue, 19 Mar 2024 16:36:06 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm: Document requirements for driver-specific KMS
 props in new drivers
Message-ID: <Zfmw5qjlQmiWRDIV@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240311155904.323488-1-sebastian.wick@redhat.com>
 <20240314-portable-pragmatic-weasel-7dd91e@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240314-portable-pragmatic-weasel-7dd91e@houat>
X-Operating-System: Linux phenom 6.6.11-amd64 
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

On Thu, Mar 14, 2024 at 11:20:09AM +0100, Maxime Ripard wrote:
> On Mon, Mar 11, 2024 at 04:58:58PM +0100, Sebastian Wick wrote:
> > When extending support for a driver-specific KMS property to additional
> > drivers, we should apply all the requirements for new properties and
> > make sure the semantics are the same and documented.
> > 
> > v2: devs of the driver which introduced property shall help and ack
> > 
> > Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>
> 
> We probably want to have Dave or Sima ack on that one too

Yeah that's a good idea and defacto how we handled this - additional users
of anything (whether library or uapi or whatever) get to clean up an
existing mess if it's too bad. But for uapi it's good to be really
explicit and document that.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
