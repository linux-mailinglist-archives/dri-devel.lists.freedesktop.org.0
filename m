Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CB584B7E3
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 15:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3A710EE33;
	Tue,  6 Feb 2024 14:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="L/9SZdWe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B01E10EE33
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 14:29:06 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-33b1c33b9c9so314133f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 06:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1707229745; x=1707834545; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TWOQ71LrLgIgsgL5bXeuERFdYYQoZo8dj17ROfFft8M=;
 b=L/9SZdWeJmqGq1hRNrszQUFLZp4uqHIWeCfrQ0eWfsPYqRrkweA6czKlWkEdA2AOdB
 ZHFKVVBKpjUBdlY93T3cixZWXLUWcxiJqhEmhgJGwUrM641kgbd3uyq7h+xSELoabpzJ
 IFRhC4G/wU/GRMxJ/RMsQu51v3cOScnm2F6WE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707229745; x=1707834545;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TWOQ71LrLgIgsgL5bXeuERFdYYQoZo8dj17ROfFft8M=;
 b=RQT+MUceEQb6ItHJvi4rUwpQ0pxpTkdwEfz5LYk4JaaGVWktaMBAJF4fX2zpzzqgMs
 ci2sf7+wYwyoZ9cnH3xZXXXbykTmx3azMUeJqwSlZi0XdbgLxgMViYsHGbxkXyZjoaR+
 DTsGU5AS7iW2UVZFDTZKU2iyDbyz+zW28uKhDsLTvT2OIrpA2ChMApu+sv+DTUXIIbMH
 SuSFHtChEe/Iolt3XWPfAx3vJE2kflN1wsuTBJKlNtkvShMIs9m3a6soEYYpve2+NeDp
 YkYTxOGISyj03KGMKA18oISZGNjWyo/xuaN8E8g6FUpVJl8VD6VA+T5kZZZqYJlmGas5
 jOBQ==
X-Gm-Message-State: AOJu0Yw2/C0u0XlL/ro4ePmQUPVy+TeHRjm7YKdYCB00m8oG0GZ3PzGW
 om4LzLQeC7zK50hMKIxaKrtl1d27T0vB/tbc2u2wfobtujZwpUZxKIxBm9li3YQ=
X-Google-Smtp-Source: AGHT+IH33V7V++bUWZKaWd+va6xJSiIrhuBKp/eVo3sGP9z2KxVUkbvBhH3iIj8VIPlhnx5MoI98Hw==
X-Received: by 2002:a05:6000:100c:b0:33b:364c:e83d with SMTP id
 a12-20020a056000100c00b0033b364ce83dmr2127543wrx.1.1707229745032; 
 Tue, 06 Feb 2024 06:29:05 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVoCcUo7DPnMkJG9rZG82yok3YEF23k9MDDuLVMvmGXbP1QglISAc9VdbzNnoYrn2J7GNEehLv3p8Edu9ciKRKfJ0Lnp3hpHPIlfvF2LphdGUsMGlghMdhiYnZkG++GaCQzBMTNNzazhyyHgrQtubWVkeGLzKxKe89mH5lmKYWGAs/xibH8zJKWVhbbZB+xc1r/XgwdjrotBADBArj/1ecFukmu7WWyT80heE3Dw53+fXuhZPQAQtTiIUjC56FyPmVtpkDaScSS2dhqzohzi8IhJMMWOoG2KNF4m1aYa7n0qcKTEJDUx8K9aTIYcy0S3jG7cg2FoUHHbvEynuv3MIjfJRv0n+z+i39AjEQK2l8aNqFMgjJXmNoEgMPTqql+7kSxL5dJbiyxMZhf3efZr7RmhHyZylqHOeuQ9FBuYvfmSb1Q9wEQdHuD4I5xsSXN2PPGC+iDu7ejWOr0KOyco20R+Jj16+1HzZEeFW5eoZZMC5myaVhAIxqx0CSvlX3bW2HyTMnG5cnEYQDXH3PYwCd/FggV9c5F1UCPGG80Xlmo6yzHuuHbH6CU6ARa+Ka4JVWNrYxghhDII5E9Ozcza6dbJ5UHymrz8tvM7rFX/GEET16lgsysX0RRRgd9u3y5bAZLCEQunYH/V+IPyS9QjVPG1PNg5H9PHDjVrvEOTikl5sNqIt9msk+u1GtbbQDmCRGbeu3mg8lTpXAiNFllq9aH1n5CPOiNAsl/w/JgZIikkbRANTgr0D1kKz8dLorWue1IrE+RnpE=
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a5d4523000000b0033b17880eacsm2247787wra.56.2024.02.06.06.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 06:29:04 -0800 (PST)
Date: Tue, 6 Feb 2024 15:29:02 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Le Ma <le.ma@amd.com>,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 James Zhu <James.Zhu@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alex Shi <alexs@kernel.org>, Jerry Snitselaar <jsnitsel@redhat.com>,
 Wei Liu <wei.liu@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/amdgpu: wire up the can_remove() callback
Message-ID: <ZcJCLkNoV-pVU8oy@phenom.ffwll.local>
Mail-Followup-To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Le Ma <le.ma@amd.com>,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 James Zhu <James.Zhu@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alex Shi <alexs@kernel.org>, Jerry Snitselaar <jsnitsel@redhat.com>,
 Wei Liu <wei.liu@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org
References: <20240202222603.141240-1-hamza.mahfooz@amd.com>
 <20240202222603.141240-3-hamza.mahfooz@amd.com>
 <2024020225-faceless-even-e3f8@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2024020225-faceless-even-e3f8@gregkh>
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

On Fri, Feb 02, 2024 at 03:40:03PM -0800, Greg Kroah-Hartman wrote:
> On Fri, Feb 02, 2024 at 05:25:56PM -0500, Hamza Mahfooz wrote:
> > Removing an amdgpu device that still has user space references allocated
> > to it causes undefined behaviour.
> 
> Then fix that please.  There should not be anything special about your
> hardware that all of the tens of thousands of other devices can't handle
> today.
> 
> What happens when I yank your device out of a system with a pci hotplug
> bus?  You can't prevent that either, so this should not be any different
> at all.
> 
> sorry, but please, just fix your driver.

fwiw Christian König from amd already rejected this too, I have no idea
why this was submitted since the very elaborate plan I developed with a
bunch of amd folks was to fix the various lifetime lolz we still have in
drm. We unfortunately export the world of internal objects to userspace as
uabi objects with dma_buf, dma_fence and everything else, but it's all
fixable and we have the plan even documented:

https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#device-hot-unplug

So yeah anything that isn't that plan of record is very much no-go for drm
drivers. Unless we change that plan of course, but that needs a
documentation patch first and a big discussion.

Aside from an absolute massive pile of kernel-internal refcounting bugs
the really big one we agreed on after a lot of discussion is that SIGBUS
on dma-buf mmaps is no-go for drm drivers, because it would break way too
much userspace in ways which are simply not fixable (since sig handlers
are shared in a process, which means the gl/vk driver cannot use it).

Otherwise it's bog standard "fix the kernel bugs" work, just a lot of it.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
