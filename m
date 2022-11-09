Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0299B622F8C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 17:01:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C975D10E5ED;
	Wed,  9 Nov 2022 16:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C63310E5ED
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 16:00:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E9EEF61965;
 Wed,  9 Nov 2022 16:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FDC4C433C1;
 Wed,  9 Nov 2022 16:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1668009650;
 bh=zrKocyoA9vOJPLuwCmUr/r5EilxVL2Mb3dwLxuOroZw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mGuDVJ3Tf054mVcwp8j38WsBwxdbHFORJu++gSPfcy0bd0ck8y1WHS9XsdlOSlYkM
 A4DUZ4F1h9blsWxKgD3OZIW6zO5SvN37+G2JDbVO3YeSVfybLbi4booX10/656JESH
 zK3MSwwLoMxS9PDgnnVoiwiG1R0n5WW5GhNZU+4c=
Date: Wed, 9 Nov 2022 17:00:47 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: [PATCH] staging: fbtft: Use ARRAY_SIZE() to get argument count
Message-ID: <Y2vOrxwi1diR0JEY@kroah.com>
References: <Y1vZXUi0Bjiub8HZ@ubunlion> <Y1zXIjCe3LGwApWD@kroah.com>
 <Y11b0oCmle2pbRel@ubunlion>
 <alpine.DEB.2.22.394.2210291931590.2917@hadrien>
 <Y191LI7zKVRA5LEb@ubunlion> <Y1+YC5OuycA5hLFx@ubunlion>
 <7dc9b4d2-413-3f65-1381-b164d810c3ee@inria.fr>
 <Y2T/FA0Ws9ExS+uz@qemulion> <Y2UkwwUn+IaCq3wf@qemulion>
 <Y2vApJF0eNSkOQqP@qemulion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2vApJF0eNSkOQqP@qemulion>
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
Cc: linux-fbdev@vger.kernel.org, outreachy@lists.linux.dev,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Julia Lawall <julia.lawall@inria.fr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 09, 2022 at 08:30:52PM +0530, Deepak R Varma wrote:
> On Fri, Nov 04, 2022 at 08:12:11PM +0530, Deepak R Varma wrote:
> > On Fri, Nov 04, 2022 at 05:31:24PM +0530, Deepak R Varma wrote:
> > > On Mon, Oct 31, 2022 at 01:05:32PM +0100, Julia Lawall wrote:
> > > >
> > > >
> > > > I took a look, but it's pretty complex.  You could take the code and
> > > > reorganize it so that it is more readable, and then take the definition of
> > > > the ARRAY_SIZE macro, to better see what is going on.
> > > >
> > > > julia
> > > >
> > >
> > > Hello Greg, Julia,
> > > I was able to successfully build the fbtft object file for arm architecture as
> > > well. I used gcc 6.5.0 and 9.5.0 tool chains. It was successful using both. I
> > > have attached the build log from my machine for your reference.
> > >
> > > I am also looking at the .i file and rearrange the expanded macro to understand
> > > it. However, since it is built successfully, I am not sure if that is truly the
> > > problem area.
> > >
> > > Should I resend the patch and check if it still errors the kernel build bot?
> > > Anything else I can try?
> >
> > Looks like the change I proposed is causing nesting inside the write_reg
> > function due to additional set of { & } brackets for the __VA_ARGS__ symbol.
> >
> > Am I understanding it right?
> 
> Hello Julia, Greg,
> I am unable to reproduce this build failure on my local machine. I tried the X86
> and arm based build. I am unable to troubleshoot this further. Do you have any
> other suggestions? If not, I will drop this patch from my watch list.

Please just drop it, it is not a correct change to make.

thanks,

greg k-h
