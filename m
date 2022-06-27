Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC83155B8F5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 11:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DA8113F6C;
	Mon, 27 Jun 2022 09:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D9A113F6C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 09:38:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 64B67B81084;
 Mon, 27 Jun 2022 09:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E409C3411D;
 Mon, 27 Jun 2022 09:38:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="fAPR5Jnx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656322720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aGTIlQ0ognNJhriKOu8KwAe4RJYfiDuDoUQUDY+58hY=;
 b=fAPR5JnxUvXSBQttuXGh/V5ytZ9k229MsPLuC0BSylr2gPWTgxims2aPgJH0Hh8Xt8JYLm
 Ry7jWuJlyu3tV1QqlhOW+O1OtGAKyxj+obfjETunznqOB7Zgws4loumtoRgESyw5jI/IMx
 U6LxF3s+3rTJ2GPbL+lPxBkYLirUi0I=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 70af3acb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 27 Jun 2022 09:38:40 +0000 (UTC)
Date: Mon, 27 Jun 2022 11:38:37 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
 Jens Axboe <axboe@kernel.dk>, linux-fsdevel@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2 7/8] dma-buf: remove useless FMODE_LSEEK flag
Message-ID: <Yrl6nTFibUS7xISn@zx2c4.com>
References: <20220625110115.39956-1-Jason@zx2c4.com>
 <20220625110115.39956-8-Jason@zx2c4.com>
 <YrlzkAlheCR0ZMuO@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YrlzkAlheCR0ZMuO@phenom.ffwll.local>
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

Hi Daniel,

On Mon, Jun 27, 2022 at 11:08:32AM +0200, Daniel Vetter wrote:
> On Sat, Jun 25, 2022 at 01:01:14PM +0200, Jason A. Donenfeld wrote:
> > This is already set by anon_inode_getfile(), since dma_buf_fops has
> > non-NULL ->llseek, so we don't need to set it here too.
> > 
> > Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> 
> I'm assuming this is part of a vfs cleanup and lands through that tree?
> For that:
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

With the exception of the first patch (which is more urgent), yes, that
is my assumption too.

Jason
