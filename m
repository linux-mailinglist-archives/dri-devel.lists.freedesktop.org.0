Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C10BFA91CDC
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 14:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5D310E22E;
	Thu, 17 Apr 2025 12:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dMagUnC9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F94210E22E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 12:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744894183;
 bh=ga2C+4bmtFy6ADHKw3yPYdWhOVlxKKHh397DFmapHkQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dMagUnC9BGneGMpIZpxHFbJo53/QiobXJhotospiw36HcpDvk9QEF9llAqsnyeNDm
 4wGTGi4dcoQiaN3Q/XJ6yJhKtfDIg444f3ZReB1JZUN47ettJKi9Rm1X2YweXeAijX
 qQOUFUo2vurvTMfjWnbwNd0tJyCuxxZs4Jem+Vzs1NW89lBQYjuqsZR3vxmW7AJMcV
 +eO+QuZ2ZseIenoKwkFXtt1e7llco133BleJ9YrvwHTPW8XteghbVqZfsXAWnvJo4a
 MaAqKUa9PVirNUjXE4/P3IEfPJvJYWT9lvOLY9TXfY623CJ/MP9K9nb+VYrFKDOQ5H
 /WTMxp66tBNdg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0ADE717E0FA5;
 Thu, 17 Apr 2025 14:49:43 +0200 (CEST)
Date: Thu, 17 Apr 2025 14:49:38 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH 2/2] drm/panthor: Fix the user MMIO offset logic for
 emulators
Message-ID: <20250417144938.1488a2f7@collabora.com>
In-Reply-To: <20250417141031.35b17c68@collabora.com>
References: <20250417100503.3478405-1-boris.brezillon@collabora.com>
 <20250417100503.3478405-3-boris.brezillon@collabora.com>
 <a7c6a9e3-1217-4dea-9b51-96d9962e0630@arm.com>
 <20250417141031.35b17c68@collabora.com>
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

On Thu, 17 Apr 2025 14:10:31 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> > I can't help feeling we can just simplify this to:
> > 
> > 	u64 mmio_offset = pfile->user_mmio.offset;
> > 
> > 	if (offset >= mmio_offset) {
> > 		offset -= mmio_offset;
> > 		offset += DRM_PANTHOR_USER_MMIO_OFFSET;
> > 		vma->vm_pgoff = offset >> PAGE_SHIFT;
> > 
> > 		ret = panthor_device_mmap_io(ptdev, vma);
> > 	} else {
> > 		ret = drm_gem_mmap(filp, vma);
> > 	}
> > 
> > Or even go further and push the offset calculations into
> > panthor_device_mmap_io().  
> 
> Sure, I can do that.

Actually, if I drop the lock in favor of a

	u64 mmio_offset = READ_ONCE(pfile->user_mmio.offset);

I can't move the vm_pgoff/offset adjustement to
panthor_device_mmap_io() because userspace might have called
SET_MMIO_OFFSET in the meantime, thus changing the final offset. One
option would be to pass the mmio_offset to panthor_device_mmap_io(),
but I think I prefer keeping the offset adjustment here if you don't
mind.
