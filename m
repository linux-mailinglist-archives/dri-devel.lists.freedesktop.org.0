Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D7B94CCBD
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 10:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3293E10E884;
	Fri,  9 Aug 2024 08:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="HMTvyQsH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE8510E884
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 08:53:42 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5b1a00750a4so158226a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 01:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1723193621; x=1723798421; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BrkvZd5Eh5WW5Mf9X1tdL5dePzKmYCNPHweFklCENn4=;
 b=HMTvyQsHTXCUghSWXetDQi/LhWMGKn5F04rOCsJbvaSAAZvjBPvnZi6mhNZPjopm++
 ZpJIlDjquJM1gTpa1oDQ71hwGz60G0e4RNaDZLrZ97TnBlJdXubW0sANGar/vxdmBLbR
 xLEKY1KvCNECazR5GQ5zjdd+vIZE9S2+mYKA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723193621; x=1723798421;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BrkvZd5Eh5WW5Mf9X1tdL5dePzKmYCNPHweFklCENn4=;
 b=YWKT27oYLa1Apipbeq2RkLlWWm3HeIIJTTrSjYzWEYtAphAAuF9Fn1EqTnt9T/9+/h
 +uL2LD/LZxgWZ4I/bdl0OxzI08oA11xgzcFsRKEVwz8RmZSkOSJfa+KhzF1Y4jqlTABG
 kapPSU5NWQKJbmS5mxP1jnzAdk3jYCP1L0SBYzeUPfPvlAAKxh8lQewSPKByTF6PvJZV
 aGhrV0bqVqVztUIy5buP/vomWyjCLB7oA/YLPQX1h7dXeyYsNz4S24f9/F1+0R5ihPIW
 fEQ49CapgEbcC8KqDdSIUas9wD/MZDKUuNHwHXpnY7xnmJzBvhlymuPhF5VI2z1CAV/3
 kEOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaW7oshsVxRGhPqzDdI9KBunBEGTQH6aRthYJp9HU+FcZHmiQA3mv1vilCifQ1iqUC/vhOGUoy7k+kWV9gD9poaOT0KmYrxO94zkmbRggH
X-Gm-Message-State: AOJu0YyvMTkKxvQyjb+c5mt9EnQcBGfKr3cnbYgg793Qp581/U8toCmB
 2+HCOHQIX2UbOWn9yVG7g158wAXov7t0qCWYpeS4OQDWX6D1+/EAwV4d1pi/JQs=
X-Google-Smtp-Source: AGHT+IF1wFtkuWBWCX/59HDf0t+FoPw4pcHDoIYbiO+O8It+DqK3snvT/N1lj43oxLY9+cj8Y9MiNQ==
X-Received: by 2002:a05:6402:3483:b0:599:b77c:7b5c with SMTP id
 4fb4d7f45d1cf-5bd0a698894mr351616a12.5.1723193621061; 
 Fri, 09 Aug 2024 01:53:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2bf869dsm1359506a12.1.2024.08.09.01.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 01:53:40 -0700 (PDT)
Date: Fri, 9 Aug 2024 10:53:38 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH 0/2] Allow partial memory mapping for cpu memory
Message-ID: <ZrXZEpplb6YA9T_d@phenom.ffwll.local>
References: <20240807100521.478266-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807100521.478266-1-andi.shyti@linux.intel.com>
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

On Wed, Aug 07, 2024 at 11:05:19AM +0100, Andi Shyti wrote:
> Hi,
> 
> This patch series concludes on the memory mapping fixes and
> improvements by allowing partial memory mapping for the cpu
> memory as well.
> 
> The partial memory mapping by adding an object offset was
> implicitely included in commit 8bdd9ef7e9b1 ("drm/i915/gem: Fix
> Virtual Memory mapping boundaries calculation") for the gtt
> memory.

Does userspace actually care? Do we have a flag or something, so that
userspace can discover this?

Adding complexity of any kind is absolute no-go, unless there's a
userspace need. This also includes the gtt accidental fix.
-Sima

> 
> Andi
> 
> Andi Shyti (2):
>   drm/i915/gem: Do not look for the exact address in node
>   drm/i915/gem: Calculate object page offset for partial memory mapping
> 
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 10 ++++++----
>  drivers/gpu/drm/i915/i915_mm.c           | 12 +++++++++++-
>  drivers/gpu/drm/i915/i915_mm.h           |  3 ++-
>  3 files changed, 19 insertions(+), 6 deletions(-)
> 
> -- 
> 2.45.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
