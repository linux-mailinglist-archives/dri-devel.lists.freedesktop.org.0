Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46969A72E08
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 11:45:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E5E10E89B;
	Thu, 27 Mar 2025 10:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hdR5Ft+a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C0910E89B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 10:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743072324;
 bh=ZG3rMmTx+yMtVLwYOUM1iwCNQ7qk3qeCktu62BjST2I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hdR5Ft+aumm8X7GhdiLTS5sSyuHmjTrfiqLTbzin1jSKZcGY/cxy6bzobPznrGOF0
 VmEJcUJplukZ8CrIac7j1yZcdjwOWUafV2veshWB4GWyxpJgZZ7eiUQA+95YRV6QsK
 MoqYlsS8mghRaAJFvCbilPoUTQoeZyDBRk+ec+FCX9ftD+qCulfVPalW3Msi5tZXRo
 vmeveYanblqGjNZZQGGsdMPKrsWBz6QHHIS/bafKDzlkEW1A6WjC2HyDKD2TGYRk2k
 Wd9JyalO3uHQbEBIWf800GlyoEw2WLaNchw6ks/SvnPPryRxKLMJ3Fblklv3WXasZ7
 dtuJy2yE0lOaw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 32DAB17E0A5F;
 Thu, 27 Mar 2025 11:45:24 +0100 (CET)
Date: Thu, 27 Mar 2025 11:45:20 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Qiang Yu <yuq825@gmail.com>, Steven Price
 <steven.price@arm.com>, Frank Binns <frank.binns@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v20 00/10] Add generic DRM-shmem memory shrinker (part 1)
Message-ID: <20250327114520.5b470d8e@collabora.com>
In-Reply-To: <1c9daef3-cd64-4f2f-8021-6ab2f17ae572@collabora.com>
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
 <0e0686da-ae96-4a7a-81b2-b9ece1fa4837@suse.de>
 <1c9daef3-cd64-4f2f-8021-6ab2f17ae572@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Wed, 26 Mar 2025 23:08:55 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> On 3/25/25 17:17, Thomas Zimmermann wrote:
> > I've looked through this before, so
> > 
> > Acked-by: Thomas Zimmermann <tzimmermann@suse.d>
> > 
> > for the series.  
> 
> Applied to misc-next, thanks!

Looks like the accel drivers were left behind. I just sent a patch
series to address that [1].

[1]https://lore.kernel.org/r/dri-devel/20250327104300.1982058-1-boris.brezillon@collabora.com/

