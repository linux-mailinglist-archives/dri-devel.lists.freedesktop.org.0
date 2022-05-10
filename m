Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EA25214DE
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 14:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63CBD10F0FF;
	Tue, 10 May 2022 12:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E4F10F0E5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 12:10:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 779B76195B;
 Tue, 10 May 2022 12:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2A8C385A6;
 Tue, 10 May 2022 12:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1652184642;
 bh=DpHjuqVa+SSlkOsM/Gej0YHbCu1wZMGTmd4rbhVUBqE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a6PjO9Ow4kq9o7cWrnq2GFU5qa9QpEuWuWHq1GreqkvmbEABkI24Doocn1CkwAc9t
 bNAOVxVTY/DP5mjRphxpzPQjJenPUkiTIEgYWhRTkAukpn/pTwmJnj/IwEQo+EH7fk
 0GanbfHet/iJ8P9I6jsZp4rvq9ZRWAykdEAYyX28=
Date: Tue, 10 May 2022 14:10:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] dmabuf: ensure unique directory name for dmabuf stats
Message-ID: <YnpWNSdAQzG80keQ@kroah.com>
References: <1652178212-22383-1-git-send-email-quic_charante@quicinc.com>
 <YnpF1XP1tH83uBlM@kroah.com>
 <039e1acc-8688-2e06-1b2a-1acbe813b91e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <039e1acc-8688-2e06-1b2a-1acbe813b91e@amd.com>
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
Cc: daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tjmercier@google.com,
 linaro-mm-sig@lists.linaro.org, Charan Teja Kalla <quic_charante@quicinc.com>,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 10, 2022 at 01:35:41PM +0200, Christian König wrote:
> Am 10.05.22 um 13:00 schrieb Greg KH:
> > On Tue, May 10, 2022 at 03:53:32PM +0530, Charan Teja Kalla wrote:
> > > The dmabuf file uses get_next_ino()(through dma_buf_getfile() ->
> > > alloc_anon_inode()) to get an inode number and uses the same as a
> > > directory name under /sys/kernel/dmabuf/buffers/<ino>. This directory is
> > > used to collect the dmabuf stats and it is created through
> > > dma_buf_stats_setup(). At current, failure to create this directory
> > > entry can make the dma_buf_export() to fail.
> > > 
> > > Now, as the get_next_ino() can definitely give a repetitive inode no
> > > causing the directory entry creation to fail with -EEXIST. This is a
> > > problem on the systems where dmabuf stats functionality is enabled on
> > > the production builds can make the dma_buf_export(), though the dmabuf
> > > memory is allocated successfully, to fail just because it couldn't
> > > create stats entry.
> > Then maybe we should not fail the creation path of the kobject fails to
> > be created?  It's just for debugging, it should be fine if the creation
> > of it isn't there.
> 
> Well if it's just for debugging then it should be under debugfs and not
> sysfs.

I'll note that the original patch series for this described why this was
moved from debugfs to sysfs.

> > > This issue we are able to see on the snapdragon system within 13 days
> > > where there already exists a directory with inode no "122602" so
> > > dma_buf_stats_setup() failed with -EEXIST as it is trying to create
> > > the same directory entry.
> > > 
> > > To make the directory entry as unique, append the inode creation time to
> > > the inode. With this change the stats directory entries will be in the
> > > format of: /sys/kernel/dmabuf/buffers/<inode no>-<inode creation time in
> > > secs>.
> > As you are changing the format here, shouldn't the Documentation/ABI/
> > entry for this also be changed?
> 
> As far as I can see that is even an UAPI break, not sure if we can allow
> that.

Why?  Device names change all the time and should never be static.  A
buffer name should just be a unique identifier in that directory, that's
all.  No rules on the formatting of it unless for some reason the name
being the inode number was somehow being used in userspace for that
number?

thanks,

greg k-h
