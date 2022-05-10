Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F875212FE
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 13:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9936010F442;
	Tue, 10 May 2022 11:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FD410F442
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 11:00:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA22B6159A;
 Tue, 10 May 2022 11:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03059C385C6;
 Tue, 10 May 2022 11:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1652180440;
 bh=KGn/TH6jy9oduWBq+vUyZA4hXFzpFADN7M2aHHBomVQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q9ZSbEHxwZJxQeNu7bI2Robwy7il5VzTxxOECL3cPkvfGe0WN0mtjG8zRwMIzCYl7
 ZSjjbchKlOnplbqU313WHo2QStErWJ5w9+fD1HGuwsty8QL6b/jahAo6Oc4gOtv4Sm
 0c4ydpG14hkHmQ9WMfvQ2BcFulY993U/4gdpQ1W8=
Date: Tue, 10 May 2022 13:00:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Charan Teja Kalla <quic_charante@quicinc.com>
Subject: Re: [PATCH] dmabuf: ensure unique directory name for dmabuf stats
Message-ID: <YnpF1XP1tH83uBlM@kroah.com>
References: <1652178212-22383-1-git-send-email-quic_charante@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652178212-22383-1-git-send-email-quic_charante@quicinc.com>
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
Cc: christian.koenig@amd.com, daniel.vetter@ffwll.ch,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tjmercier@google.com, linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 10, 2022 at 03:53:32PM +0530, Charan Teja Kalla wrote:
> The dmabuf file uses get_next_ino()(through dma_buf_getfile() ->
> alloc_anon_inode()) to get an inode number and uses the same as a
> directory name under /sys/kernel/dmabuf/buffers/<ino>. This directory is
> used to collect the dmabuf stats and it is created through
> dma_buf_stats_setup(). At current, failure to create this directory
> entry can make the dma_buf_export() to fail.
> 
> Now, as the get_next_ino() can definitely give a repetitive inode no
> causing the directory entry creation to fail with -EEXIST. This is a
> problem on the systems where dmabuf stats functionality is enabled on
> the production builds can make the dma_buf_export(), though the dmabuf
> memory is allocated successfully, to fail just because it couldn't
> create stats entry.

Then maybe we should not fail the creation path of the kobject fails to
be created?  It's just for debugging, it should be fine if the creation
of it isn't there.

> 
> This issue we are able to see on the snapdragon system within 13 days
> where there already exists a directory with inode no "122602" so
> dma_buf_stats_setup() failed with -EEXIST as it is trying to create
> the same directory entry.
> 
> To make the directory entry as unique, append the inode creation time to
> the inode. With this change the stats directory entries will be in the
> format of: /sys/kernel/dmabuf/buffers/<inode no>-<inode creation time in
> secs>.

As you are changing the format here, shouldn't the Documentation/ABI/
entry for this also be changed?

And what's to keep the seconds field from also being the same?

thanks,

greg k-h
