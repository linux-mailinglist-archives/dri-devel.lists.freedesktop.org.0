Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BF696159F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 19:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464F110E3DA;
	Tue, 27 Aug 2024 17:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="UUjGSIiP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEB310E3DA
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 17:38:33 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-428119da952so51341315e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 10:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724780312; x=1725385112; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Oi0iVeC+22hM0Z6/xqSP26E9/FaSKteW3sOUSP1o+hM=;
 b=UUjGSIiPd6+gF3CffSLrn8ugGup2YOSKPCF2xTygmjT8Djc01YaTmIeAtLRw+fZ9TP
 42Y0I1jfI89lzWv75z/fxmGrdCzeh1PsZhFFQUJWCdJGnjyvEUyK9tLl1f0Yc/tS/H2P
 4BEotaZZzWHECXPqDMV3YMtFahGtftdcjzqf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724780312; x=1725385112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Oi0iVeC+22hM0Z6/xqSP26E9/FaSKteW3sOUSP1o+hM=;
 b=IbhpaAFSog1uL0oVVUHp2JpoGdYpyVaRvH+M75Wk/d/OiZqTDh83QdBmHv0nFzmoKW
 dcJkWppB0m7WQPcYs/c2dnBRA/91keMaeCGeXgusg0PjDL+QNdEhLKlNmgb3zShu6Q31
 38xsvsiKXPhVYjHIw9ZTdD5zI4+N2xm2WoOdY9h4yVZa5nOsia056dIlXwxX92tYt6Ki
 4NL9lbEimGd3sAEx6KBnfM+FKWi0ZQcmxSR95gSOHvfWAmogGT7N1o1Z7tAxgpmgB4yE
 OATDDUF8mLCr8K8G18ymTFNFEPEp+iOgPl6Cox93sQglL4RbkzlB/l5K/zlsG0VWSVYi
 Q3jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1QsHkOtbS12KW+YAXktxvnkIKqW0kCaIt2UfukLFl+uRzWIrZIXU3CajFh6cx2+bCM3uebXGDtlQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyrc5IEpFF+QqOLp/ztV8XF6CXh9bgvbHDtlDdBdJ9dUCwZEgCa
 PmFNBmpEjRrt4aTnps+2pQ7DiwXTB8+BPhzQK5Ds4KC6Xb5wKBe3tdOfe0PW2AM=
X-Google-Smtp-Source: AGHT+IHlfSim3wI9SmmtbZEkqRnDajCx4xKEpfzc+88Mu4rbCI4aSdNKB58CSYa/0NegZbPSiJzT1g==
X-Received: by 2002:a05:600c:1f87:b0:421:7bed:5274 with SMTP id
 5b1f17b1804b1-42acc8ddcdcmr114250435e9.10.1724780312104; 
 Tue, 27 Aug 2024 10:38:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42abef81777sm228089715e9.27.2024.08.27.10.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 10:38:31 -0700 (PDT)
Date: Tue, 27 Aug 2024 19:38:29 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: daniel.vetter@ffwll.ch, vitaly.prosyak@amd.com,
 dri-devel@lists.freedesktop.org, ltuikov89@gmail.com
Subject: Re: [PATCH 4/4] drm/todos: add entry for drm_syncobj error handling
Message-ID: <Zs4PFRxJGKPwkHf2@phenom.ffwll.local>
References: <20240826122541.85663-1-christian.koenig@amd.com>
 <20240826122541.85663-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240826122541.85663-4-christian.koenig@amd.com>
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

On Mon, Aug 26, 2024 at 02:25:41PM +0200, Christian König wrote:
> That would be rather nice to have and the kernel side is really trivial,
> only the userspace side might be a bit more complex.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

I think patch 1 should ideally have acks from a few drivers using
drm/sched, but patches 2-4 make me happy, thanks a lot for creating them,
so on those.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Sima

> ---
>  Documentation/gpu/todo.rst | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 96c453980ab6..c771f0c9610f 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -834,6 +834,22 @@ Contact: Javier Martinez Canillas <javierm@redhat.com>
>  
>  Level: Advanced
>  
> +Querying errors from drm_syncobj
> +================================
> +
> +The drm_syncobj container can be used by driver independent code to signal
> +complection of submission.
> +
> +One minor feature still missing is a generic DRM IOCTL to query the error
> +status of binary and timeline drm_syncobj.
> +
> +This should probably be improved by implementing the necessary kernel interface
> +and adding support for that in the userspace stack.
> +
> +Contact: Christian König
> +
> +Level: Starter
> +
>  Outside DRM
>  ===========
>  
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
