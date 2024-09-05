Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BCA96D090
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 09:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A7BD10E703;
	Thu,  5 Sep 2024 07:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="l1r5SLHA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28AE10E703
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 07:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1725521966;
 bh=6PVIDeH5+SCHyQgXpSCPJGW2vBWFSE2R18JkRXg2fy4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l1r5SLHAinmX5GH3XdbcDGHgxIP59IRIO4BfwfXkgQMjd9p1nJW8kZQhdNAY1YNAp
 5SdAmzzPc2gp95yxF8qStTeSWSV/5IvkxZ8A7RXiDO6kuG/dWlL0o+kwbKDkco1eEJ
 Vl0g8KAasK4HPDYhviTFavg9/TnzObqu72Wqn1CDcPgd7Dth3SPXonBTBq2ptggNgB
 Rd6LpkaTGFiKeN3W4a6Etx+NIbFpBUO8xp1rZYYbH+xkW4O6lpDug35WmFrPX2IsU5
 qo8CbXYZjL3HY7f2w0ZdSN1qoKDQQMPVRJttmd3WfKG7cyNI//ccsWhsknABkhDW9e
 S1z+HfAr7aUVQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D86C217E0F93;
 Thu,  5 Sep 2024 09:39:25 +0200 (CEST)
Date: Thu, 5 Sep 2024 09:39:23 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Mary Guillemard <mary.guillemard@collabora.com>
Cc: linux-kernel@vger.kernel.org, kernel@collabora.com, Mihail Atanassov
 <mihail.atanassov@arm.com>, Steven Price <steven.price@arm.com>, Liviu
 Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4] drm/panthor: Add DEV_QUERY_TIMESTAMP_INFO dev query
Message-ID: <20240905093923.64ca39e1@collabora.com>
In-Reply-To: <20240904121911.31ddaf09@collabora.com>
References: <20240830080349.24736-2-mary.guillemard@collabora.com>
 <20240904121911.31ddaf09@collabora.com>
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

On Wed, 4 Sep 2024 12:19:11 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Fri, 30 Aug 2024 10:03:50 +0200
> Mary Guillemard <mary.guillemard@collabora.com> wrote:
> 
> > Expose timestamp information supported by the GPU with a new device
> > query.
> > 
> > Mali uses an external timer as GPU system time. On ARM, this is wired to
> > the generic arch timer so we wire cntfrq_el0 as device frequency.
> > 
> > This new uAPI will be used in Mesa to implement timestamp queries and
> > VK_KHR_calibrated_timestamps.
> > 
> > Since this extends the uAPI and because userland needs a way to advertise
> > those features conditionally, this also bumps the driver minor version.
> > 
> > v2:
> > - Rewrote to use GPU timestamp register
> > - Added timestamp_offset to drm_panthor_timestamp_info
> > - Add missing include for arch_timer_get_cntfrq
> > - Rework commit message
> > 
> > v3:
> > - Add panthor_gpu_read_64bit_counter
> > - Change panthor_gpu_read_timestamp to use
> >   panthor_gpu_read_64bit_counter
> > 
> > v4:
> > - Fix multiple typos in uAPI documentation
> > - Mention behavior when the timestamp frequency is unknown
> > - Use u64 instead of unsigned long long
> >   for panthor_gpu_read_timestamp
> > - Apply r-b from Mihail
> > 
> > Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>
> > Reviewed-by: Mihail Atanassov <mihail.atanassov@arm.com>  
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Queued to drm-misc-next.
