Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7CE9B350D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 16:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE3F10E4F6;
	Mon, 28 Oct 2024 15:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Tlj3K0CJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 992F510E4F7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 15:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730129912;
 bh=v3FxsCnnokKHKDCR5+0q1vGpFzp23LdZt9ed1N7nrYQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Tlj3K0CJJ0GqLdt+kJiwtFOjB1ozsQqkASD3SzrjDd1brqnEqGNNQqFLqFPgXcDlJ
 0AUFY5yWJmFs0FyUA/p0PCW2vSMUY005mrB/MD1LUkcdVTF122+oItTYrN6/BS5K/3
 /O9Dtyd7QOyzH1kLIm+Px4I/zTB3eG1uVUz4ioKMdbUBcjXB6LzIWSeS+iaToQsYp7
 KN/TisGhA6RWsBYvb4ub8c1S+nih3dBd4dYLQmAFKf4ZgbaQdscblD9Xxd/1gfjWrs
 zT8j92cyy2fuPIa35ZtIIqt2ocwzep5A1QQdEFdLOxkrT/7RTG5H5iPgK7iNkZDEp6
 CeRA6uSgvk34Q==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EA44C17E3638;
 Mon, 28 Oct 2024 16:38:31 +0100 (CET)
Date: Mon, 28 Oct 2024 16:38:25 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, Christopher Healy <healych@amazon.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v2 3/3] drm/panthor: Report innocent group kill
Message-ID: <20241028163825.1d5d4ed4@collabora.com>
In-Reply-To: <564021d1-9846-4b9e-b045-0d965c47639d@arm.com>
References: <20241028114815.3793855-1-boris.brezillon@collabora.com>
 <20241028114815.3793855-4-boris.brezillon@collabora.com>
 <564021d1-9846-4b9e-b045-0d965c47639d@arm.com>
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

On Mon, 28 Oct 2024 15:31:19 +0000
Steven Price <steven.price@arm.com> wrote:

> On 28/10/2024 11:48, Boris Brezillon wrote:
> > Groups can be killed during a reset even though they did nothing wrong.
> > That usually happens when the FW is put in a bad state by other groups,
> > resulting in group suspension failures when the reset happens.
> > 
> > If we end up in that situation, flag the group innocent and report
> > innocence through a new DRM_PANTHOR_GROUP_STATE flag.  
> 
> Sadly I don't see any code to return that new flag... Shouldn't there be
> a change to panthor_get_get_state()?

My bad, I had those changes in a debug commit and somehow overlooked the
following two lines when preparing the final version:

@@ -3570,6 +3586,8 @@ int panthor_group_get_state(struct panthor_file
*pfile, get_state->state |= DRM_PANTHOR_GROUP_STATE_FATAL_FAULT;
                get_state->fatal_queues = group->fatal_queues;
        }
+       if (group->innocent)
+               get_state->state |= DRM_PANTHOR_GROUP_STATE_INNOCENT;
        mutex_unlock(&sched->lock);
 
        group_put(group);

Will send a v3 shortly.
