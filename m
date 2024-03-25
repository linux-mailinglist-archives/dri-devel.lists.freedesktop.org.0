Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AE988ACFC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 19:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECC010EA66;
	Mon, 25 Mar 2024 18:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VhCdvttI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0146C10EA66
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 18:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711389955;
 bh=mUYnD6oTf1zCJ7WHtJ7zkwwUff31i8XMxreQLYCn2rU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VhCdvttIdjc/C64k7mqXlLaGCzUANSc9dCU7r/GRif4wCcD5m5V2kU2cZzNF1Srft
 2eN/Nw8/JxhsusJcDnN3ZKmiQ02nquuBSR8g/w4aU1HI345bsOWFhx26hX53k53sRY
 UhxeNUjOM2jMqoN/p7Zl1PcziGA9TEDuQZT5tfkUOOHhz3P0S1vOa3IarQDC7R3XYz
 vcTUzEW+YZlOsk7SW8Coi7UjJLq3QbMo2+VZRzG9Fl5vI4egUxyh4QXQS6vbG9CVIS
 ZNtL3C76aE22bbl2oKDWQciSgnU2hYyo+bTc78QAYziVzEKMhRQD4Vf1QBLg8UlXm0
 BP5/IVOSsBTPA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5E8E637820A3;
 Mon, 25 Mar 2024 18:05:55 +0000 (UTC)
Date: Mon, 25 Mar 2024 19:05:54 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Steven Price <steven.price@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 3/3] drm/panthor: Actually suspend IRQs in the unplug
 path
Message-ID: <20240325190554.10385bf8@collabora.com>
In-Reply-To: <ZgGzQZebQ_67SRWY@e110455-lin.cambridge.arm.com>
References: <20240325135705.3717293-1-boris.brezillon@collabora.com>
 <20240325135705.3717293-3-boris.brezillon@collabora.com>
 <ZgGzQZebQ_67SRWY@e110455-lin.cambridge.arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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

On Mon, 25 Mar 2024 17:24:17 +0000
Liviu Dudau <liviu.dudau@arm.com> wrote:

> On Mon, Mar 25, 2024 at 02:57:05PM +0100, Boris Brezillon wrote:
> > panthor_xxx_irq_suspend() doesn't mask the interrupts if drm_dev_unplug()
> > has been called, which is always the case when our panthor_xxx_unplug()
> > helpers are called. Fix that by introducing a panthor_xxx_unplug() helper
> > that does what panthor_xxx_irq_suspend() except it does it
> > unconditionally.  
> 
> I understand that drm_dev_unplug() messes up with the cleanup, but I'm a bit
> reluctant to see a function that completely ignores if the device has been
> unplugged or not. Like mentioned on the review of 2/3, can we move the masking
> of the interrupts outside the critical section and not add drm_dev_unplug() ?

Nope, because the whole point of this drm_dev_enter/exit() section was
to prevent accesses to registers when the associated iomem range has
been returned to the system after the device has been removed. If you
move this gpu_write() outside of the drm_dev_enter/exit() you're better
off dropping this check entirely...
