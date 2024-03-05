Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F698718B2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 09:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E96E10E1F4;
	Tue,  5 Mar 2024 08:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="MNkEdBId";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D1610E1F4
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 08:54:48 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2cd3aea2621so14000501fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 00:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1709628886; x=1710233686; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nQrdFGTzl2dweCQUPSW0EBKwoDyzx87CMamEL7rty8Y=;
 b=MNkEdBIdfXu1vABqeUt2d1oAMeXQjScihD18jCjblX8tNT3VnJ4R0x8KipmteWMdTx
 rdgQNPjht81mF7oPqkhCoJoTY3qBkO5UTxNu6P2loyFv2Na50/l5hS9YF4dAZ7JHKj0A
 bwJi03NT3XIwD4cO88rXjsyA8SMT04spDO15M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709628886; x=1710233686;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nQrdFGTzl2dweCQUPSW0EBKwoDyzx87CMamEL7rty8Y=;
 b=IzwdSrdbsqtd4ccAAE42/fsahTOHHjdUWj1X6H0K1p2C8tQEeNtB9OstdKKW7pS2d+
 x7qvgppveCIxbZpbMJbomwiPQCps1z/W3OiwVvsdfHkBMuZuGBbqVRDKDwkC1ZbyM2wP
 FFplLKGfZ3UfjXsBj6hoSH8nuITpQm+3m0SZiuCi6KyZWNBF4sesDD9/0EICr6vH7ylY
 7Id8fc5scPIGVHh9nwdMObBZhCJzI8evstLTTr5PGmsfZT86Hnb2A+CwthHIM1HmcvRN
 NC/YVAht5DAHosEmO488J7m7jb8bdqtHv2rg9vBFflrTQ4tacVheRSvcQytPnTkKsFtV
 rBdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1hzdTPO5nUv2mVPFe8kHIuVWRxyPmW+hqPOWxNZXX2RVlfPnSiTzE8sYEwMvHrGiguBUdUu37+GGOkiZHAlMXotYFVAmRFRTUBwQgTvfJ
X-Gm-Message-State: AOJu0YwtyfEW0aKa5GUzzNMzk37msIkfbWkXlL94jR1sH/ViVH0HyO3c
 Pu68a/DEcmys2+tbjfJE8YeKCeauxJoW1GAkLAA/5C/pyS0q5HTXySfpngwTbbY=
X-Google-Smtp-Source: AGHT+IEZqk8YK77lULQVqIQ+W2hrIEcGi2vrmttCn5YhREmOC9fxZ2GD5irofP1qhPxrTdqpuIJiNQ==
X-Received: by 2002:a2e:9bd8:0:b0:2d3:ed14:7e13 with SMTP id
 w24-20020a2e9bd8000000b002d3ed147e13mr1085825ljj.2.1709628886248; 
 Tue, 05 Mar 2024 00:54:46 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 v29-20020a50a45d000000b005649f17558bsm5832879edb.42.2024.03.05.00.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 00:54:45 -0800 (PST)
Date: Tue, 5 Mar 2024 09:54:43 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] MAINTAINERS: Update email address for Tvrtko Ursulin
Message-ID: <Zebd08SA4ZQ6hIzg@phenom.ffwll.local>
Mail-Followup-To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Dave Airlie <airlied@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240228142240.2539358-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240228142240.2539358-1-tvrtko.ursulin@linux.intel.com>
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

On Wed, Feb 28, 2024 at 02:22:40PM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> I will lose access to my @.*intel.com e-mail addresses soon so let me
> adjust the maintainers entry and update the mailmap too.
> 
> While at it consolidate a few other of my old emails to point to the
> main one.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Directly applied to drm-fixes as requested on irc.
-Sima

> ---
>  .mailmap    | 5 +++++
>  MAINTAINERS | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/.mailmap b/.mailmap
> index b99a238ee3bd..d67e351bce8e 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -608,6 +608,11 @@ TripleX Chung <xxx.phy@gmail.com> <triplex@zh-kernel.org>
>  TripleX Chung <xxx.phy@gmail.com> <zhongyu@18mail.cn>
>  Tsuneo Yoshioka <Tsuneo.Yoshioka@f-secure.com>
>  Tudor Ambarus <tudor.ambarus@linaro.org> <tudor.ambarus@microchip.com>
> +Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko.ursulin@intel.com>
> +Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko.ursulin@linux.intel.com>
> +Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko.ursulin@sophos.com>
> +Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko.ursulin@onelan.co.uk>
> +Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko@ursulin.net>
>  Tycho Andersen <tycho@tycho.pizza> <tycho@tycho.ws>
>  Tzung-Bi Shih <tzungbi@kernel.org> <tzungbi@google.com>
>  Uwe Kleine-König <ukleinek@informatik.uni-freiburg.de>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 19f6f8014f94..b940bfe2a692 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10734,7 +10734,7 @@ INTEL DRM I915 DRIVER (Meteor Lake, DG2 and older excluding Poulsbo, Moorestown
>  M:	Jani Nikula <jani.nikula@linux.intel.com>
>  M:	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>  M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
> -M:	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> +M:	Tvrtko Ursulin <tursulin@ursulin.net>
>  L:	intel-gfx@lists.freedesktop.org
>  S:	Supported
>  W:	https://drm.pages.freedesktop.org/intel-docs/
> -- 
> 2.40.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
