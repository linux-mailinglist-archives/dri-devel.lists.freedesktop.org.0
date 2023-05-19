Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC607092C9
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 11:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05D910E10C;
	Fri, 19 May 2023 09:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6D110E5EC
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 09:15:37 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2A69C6606842;
 Fri, 19 May 2023 10:15:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1684487734;
 bh=cAzerlz2ktFyeiGx3TN+5S1PEBRGhKaN65/TtDdbOLc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Wdn42oXeDSJ5YUBkMb7FPNqfkemm4p577yPCI92PfKbP7qz4giIshoa66iQsZVAxT
 52pRpvvF0FCq304fC5Q5S9ynTBJ7aNlf4aY2wc+O6SkYZXQFZr4TeNLJoWHc2DxXlG
 KLwo6Lws3GA99mPyE/dw4GInCHCVgepIw6OAOt21wIxvINStxJfgtRJoZKtId0rEc+
 QnetGsM5wJmzuUeQqbDRgHs+lw/LPRoIo7fTvv42d35Iif3eonmSf6rsX7/FoO1N97
 xzbYFtqwfr6ILUa0efev3tWgcDq+iDHx9qXdrbOmz88C+ZUOe/YHVh6rvT9oaFF0dw
 xeR7EPx0ocBmg==
Date: Fri, 19 May 2023 11:15:31 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Subject: Re: [PATCH] drm/managed: Define drmm_mutex_init() as a macro to fix
 lockdep
Message-ID: <20230519111531.57501858@collabora.com>
In-Reply-To: <CAM0jSHNhH77Q99Xmprz-=U9J0Oi3L=W8g99dABZ3Cxb7LO21cw@mail.gmail.com>
References: <20230519085525.1275339-1-boris.brezillon@collabora.com>
 <CAM0jSHNhH77Q99Xmprz-=U9J0Oi3L=W8g99dABZ3Cxb7LO21cw@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
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
Cc: Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 May 2023 10:05:27 +0100
Matthew Auld <matthew.william.auld@gmail.com> wrote:

> On Fri, 19 May 2023 at 09:55, Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > drmm_mutex_init() needs to be defined as a macro if we want
> > lockdep to classify locks properly. If we don't do that, all locks
> > will be considered as belonging to the same lock class, leading to
> > false positive deadlock reports.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Reported-by: Sarah Walker <sarah.walker@imgtec.com>  
> 
> Yeah, we also encountered the same issue. Patch is here:
> https://patchwork.freedesktop.org/patch/537605/?series=117891&rev=2

Cool! Added my R-b to this patch.
