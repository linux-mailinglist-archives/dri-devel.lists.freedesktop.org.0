Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E413DA78CBB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 12:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EC910E74F;
	Wed,  2 Apr 2025 10:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="c1Y/5c68";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5991210E753
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 10:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743591503;
 bh=4EPwAlNJr3H6JD+UwJAKwqbZXjdFsp2NJPkmH/wLjhs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=c1Y/5c687GnypHjYLUHf5yk4QlH8LjtNKvL7LbblfXvIOf3YQuGfyKB3Gjj1kb+Gw
 X+UlJ7p8NtJHgd04dPv8HWq7A2KFVcnOrAPJDEHr847xn3AE+ONjsVHGHW5agHvbon
 65+5yqILvT7O0+lkioYHTf29VZ5X0OVcasaWwvEppuKzkwNmIvm4bMBMMGOv8FrJW7
 Uh/n/db40BleIooK0EM5aVgwjLsvLSC2nah1kHlnNcT31mDENdPNncbiJJfkmzd7y8
 FyGFTv9PTySE6BawW63nKKPlZpdordI9XrWyAlFSUKK+dyLRyzxL80p4caOasQCKwE
 BbQrpBHf86rTQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A7FAA17E0809;
 Wed,  2 Apr 2025 12:58:23 +0200 (CEST)
Date: Wed, 2 Apr 2025 12:58:20 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 4/5] drm/panthor: Let IRQ handlers clear the
 interrupts themselves
Message-ID: <20250402125820.49c5a450@collabora.com>
In-Reply-To: <2e565589-4845-4007-80be-adb6b370e911@arm.com>
References: <20250401182348.252422-1-boris.brezillon@collabora.com>
 <20250401182348.252422-5-boris.brezillon@collabora.com>
 <2e565589-4845-4007-80be-adb6b370e911@arm.com>
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

On Wed, 2 Apr 2025 11:20:17 +0100
Steven Price <steven.price@arm.com> wrote:

> > static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
> > {
> > 	bool has_unhandled_faults = false;
> > 
> > 	status = panthor_mmu_fault_mask(ptdev, status);
> > 	while (status) {
> > 		u32 as = ffs(status | (status >> 16)) - 1;  
> 
> panthor_mmu_fault_mask() masks status with GENMASK(15, 0), so AFAICT
> (status >> 16) is always 0.
> 
> Which isn't a big issue, other than you are now only clearing IRQs which
> are recognised by the loop.

Quick note on that: I think it's been written when I was trying to add
support for CSF in panfrost, and panthor_mmu_fault_mask() (at the time
it was panfrost_mmu_fault_mask()) was a way to have a different
fault_mask for JM and CSF. Now that JM support in panthor is being
considered [1], I'd prefer to keep this logic, even if it seems silly
right now.

[1]https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/16
