Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD40BAC335A
	for <lists+dri-devel@lfdr.de>; Sun, 25 May 2025 11:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AFE10E0B6;
	Sun, 25 May 2025 09:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z0e70Sgl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BC110E0B6
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 09:20:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 11CDB60007;
 Sun, 25 May 2025 09:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB1AC4CEEA;
 Sun, 25 May 2025 09:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748164804;
 bh=M6wNUdl+f/LJKZELy9CIlDDMGL8GGdionU7cG+oIVJQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z0e70SglbUOUYIUwGE9EvW/JcY14JljkXPcrXvRwOWMfKnOoZdPxFBk8x8EpFANPI
 vG1u78itnbNpPvqJV9za7eDRQY7XiGc2O7R63dkSTog6u6Uhs9V0ueAnnn3xAPPb5N
 NwgpL7Hr54FI18ZatUXKTjIXNlibhMXTDRag936yRj1pELwLfCoJnG4HDYHId6DCex
 74tRpY6EUPIkdT8JgYWiDgVG4pfAUzLo+J6CpUlIxjEgTttC2+uVcp+CRt0A56C/PS
 4Dw7oQHewMIHBpcl9NpvXPNpOrRqIeUMG/Kt/haznyrvxckVqMqHM4XmaH8IuvBeSY
 SF/KBNh4I7ppw==
Date: Sun, 25 May 2025 10:19:53 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, Mahesh J Salgaonkar
 <mahesh@linux.ibm.com>, "Oliver O'Halloran" <oohall@gmail.com>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Jacek
 Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, Maciej Falkowski
 <maciej.falkowski@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Nuno Sa <nuno.sa@analog.com>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Lars-Peter Clausen <lars@metafoo.de>, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 linux-iio@vger.kernel.org, Markus Burri <markus.burri@bbv.ch>
Subject: Re: [PATCH v4 1/6] iio: backend: fix out-of-bound write
Message-ID: <20250525101953.7930a410@jic23-huawei>
In-Reply-To: <20250511152707.294bc7b9@jic23-huawei>
References: <20250508130612.82270-1-markus.burri@mt.com>
 <20250508130612.82270-2-markus.burri@mt.com>
 <20250511152707.294bc7b9@jic23-huawei>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
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

On Sun, 11 May 2025 15:27:07 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Thu,  8 May 2025 15:06:07 +0200
> Markus Burri <markus.burri@mt.com> wrote:
> 
> > The buffer is set to 80 character. If a caller write more characters,
> > count is truncated to the max available space in "simple_write_to_buffer".
> > But afterwards a string terminator is written to the buffer at offset count
> > without boundary check. The zero termination is written OUT-OF-BOUND.
> > 
> > Add a check that the given buffer is smaller then the buffer to prevent.
> > 
> > Fixes: 035b4989211d ("iio: backend: make sure to NULL terminate stack buffer")
> > Signed-off-by: Markus Burri <markus.burri@mt.com>  
> I'm looking for a tag from Nuno on this one before applying.

Please make sure to pick up tags on earlier versions. Nuno had sent a RB for
this one which I've now added.

People don't tend to look again at patches that they've already tagged so Nuno
probably didn't see my ask for a tag above.

Anyhow, now applied but will have to wait for a rebase of my fixes-togreg tree
on rc1 once available.

Thanks,

Jonathan

> 
> J
> > ---
> >  drivers/iio/industrialio-backend.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iio/industrialio-backend.c b/drivers/iio/industrialio-backend.c
> > index a43c8d1bb3d0..31fe793e345e 100644
> > --- a/drivers/iio/industrialio-backend.c
> > +++ b/drivers/iio/industrialio-backend.c
> > @@ -155,11 +155,14 @@ static ssize_t iio_backend_debugfs_write_reg(struct file *file,
> >  	ssize_t rc;
> >  	int ret;
> >  
> > +	if (count >= sizeof(buf))
> > +		return -ENOSPC;
> > +
> >  	rc = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, userbuf, count);
> >  	if (rc < 0)
> >  		return rc;
> >  
> > -	buf[count] = '\0';
> > +	buf[rc] = '\0';
> >  
> >  	ret = sscanf(buf, "%i %i", &back->cached_reg_addr, &val);
> >    
> 
> 

