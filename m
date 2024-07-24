Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 239A993B71D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 21:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FE410E79E;
	Wed, 24 Jul 2024 19:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="XuErSEQV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD0F10E79E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 19:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721847635;
 bh=NkPLrp+DvJ2qkX/aT+LXxDGVGJDmAwtqvl6lVPEpaYo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XuErSEQV8D2cc650zcKHplavmK3SBilWlD1wTlM2guWzSzAz46fTok5+K1hHZbZmy
 o/JFlHI1+M1+JFi8NDFgLB7bQZSxNu5bLV56SFFKN73shodONVSCxs+54quiLYa74F
 dRumTEZlC2wsK2f4A/CSPUyBV8nySXGOZOeA3LAIzNaANEazgnjal9qvArz/hgyk4w
 Wuq2hSetTGXdlIgk/wm9nnUlC+l8NX9Gj0gKOTN6JXhj9TtJuKotXeok3+rzG18IK6
 l/RdnoLtSGQ1Fs4sMKnbShXEchvVRmcrsyA6T9VS1z8du8EF2cx/K2pz1UrgR2XdDA
 PsHQQyou6JN4w==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 76C2237813E1;
 Wed, 24 Jul 2024 19:00:34 +0000 (UTC)
Message-ID: <942afa37-a24c-48ed-ae10-c811849165bf@collabora.com>
Date: Wed, 24 Jul 2024 22:00:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/virtio: introduce the HOST_PAGE_SIZE feature
To: Sergio Lopez <slp@redhat.com>, gurchetansingh@chromium.org,
 tzimmermann@suse.de, mripard@kernel.org, olvaffe@gmail.com,
 kraxel@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 airlied@redhat.com
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <20240723114914.53677-1-slp@redhat.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20240723114914.53677-1-slp@redhat.com>
Content-Type: text/plain; charset=UTF-8
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

On 7/23/24 14:49, Sergio Lopez wrote:
> There's an incresing number of machines supporting multiple page sizes
> and on these machines the host and a guest can be running, each one,
> with a different page size.
> 
> For what pertains to virtio-gpu, this is not a problem if the page size
> of the guest happens to be bigger or equal than the host, but will
> potentially lead to failures in memory allocations and/or mappings
> otherwise.

Please describe concrete problem you're trying to solve. Guest memory
allocation consists of guest pages, I don't see how knowledge of host
page size helps anything in userspace.

I suspect you want this for host blobs, but then it should be
virtio_gpu_vram_create() that should use max(host_page_sz,
guest_page_size), AFAICT. It's kernel who is responsible for memory
management, userspace can't be trusted for doing that.

-- 
Best regards,
Dmitry

