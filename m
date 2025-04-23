Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA82A98385
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 10:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B7810E00E;
	Wed, 23 Apr 2025 08:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CGPEKNRX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6037910E00E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 08:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1745397264;
 bh=yNcym9AB15nC9Tu7sEWtC7GM04KbMiS2dWyXXltgH3g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CGPEKNRXsbehCZXs4NA5cZw4zmzXv5MuCy41cXQLI4yxUFDSRlSKQWwswuc2GDOQV
 1n0Sxo6wDzxQo0iczXrCIF8xxvv2KgBiFG3vswfMl5M0PmKwRWEZtd+hCCX6C9Rxgc
 L0Gzt546S+u3LZ9h2EY8+cLmFz6h6ZSTgR34BgbkyC+vYuWByLixZ47GvM+m9M6MSc
 xNfNlmkQ76VU7Ho8SE9S6+z4H0Ata/0FJzixfCHlPU4eWcgSlkOmkTGUeCQAIs6N41
 kGQOPv3ca8St1RgcVjr3QJDZ8dCl+tkQHMjqIc/xZXu3mzdZOjK3a4mVJS/L1YuVYp
 OchThd/qjHByw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CF55617E03B6;
 Wed, 23 Apr 2025 10:34:23 +0200 (CEST)
Date: Wed, 23 Apr 2025 10:34:19 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Liviu Dudau <liviu.dudau@arm.com>, Steven Price
 <steven.price@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v10 4/4] drm/panthor: show device-wide list of DRM GEM
 objects over DebugFS
Message-ID: <20250423103419.587a88f9@collabora.com>
In-Reply-To: <20250423090149.2748ef62@collabora.com>
References: <20250423021238.1639175-1-adrian.larumbe@collabora.com>
 <20250423021238.1639175-5-adrian.larumbe@collabora.com>
 <20250423090149.2748ef62@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 23 Apr 2025 09:01:49 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> > +
> > +enum panthor_debugfs_gem_usage_flags {
> > +	PANTHOR_DEBUGFS_GEM_USAGE_KERNEL_BIT = 0,
> > +	PANTHOR_DEBUGFS_GEM_USAGE_FW_MAPPED_BIT = 1,  
> 
> Now that you print the flags as raw hex values, you don't need those
> _BIT definitions.

My bad, I didn't notice you were still printing flag names as a legend.
