Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 549833910D8
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 08:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD206EC19;
	Wed, 26 May 2021 06:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F03C6EC14
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 06:42:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E48EC613C3;
 Wed, 26 May 2021 06:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1622011373;
 bh=lEpDCkdGFxeAtsrwix5D4X1FiG+U93Ll7WS12qIJF1k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MA5ONux5V0tTneMn7Of6bbOMAxEYY3vkFYvARGb4wbTeAH5AJYidLmZxwSxg4fQLJ
 Lk9PQCjml2RMsDLy+iRyO8+y1vH6b36scZTH8HHMHDbW7qzvdKAF15vVfI1uHZatmI
 OTdye/DISGOOo5dLCpK4S0x/kRT/f3EzYtJYNF5U=
Date: Wed, 26 May 2021 08:42:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hridya Valsaraju <hridya@google.com>
Subject: Re: [PATCH v4] dmabuf: Add the capability to expose DMA-BUF stats in
 sysfs
Message-ID: <YK3t6+kOVSkGOuyb@kroah.com>
References: <20210525183720.1739480-1-hridya@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210525183720.1739480-1-hridya@google.com>
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
Cc: kernel test robot <lkp@intel.com>, surenb@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, kernel-team@android.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 25, 2021 at 11:37:13AM -0700, Hridya Valsaraju wrote:
> This patch allows statistics to be enabled for each DMA-BUF in
> sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
> 
> The following stats will be exposed by the interface:
> 
> /sys/kernel/dmabuf/buffers/<inode_number>/exporter_name
> /sys/kernel/dmabuf/buffers/<inode_number>/size
> /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/device
> /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/map_counter
> 
> The inode_number is unique for each DMA-BUF and was added earlier [1]
> in order to allow userspace to track DMA-BUF usage across different
> processes.
> 
> Currently, this information is exposed in
> /sys/kernel/debug/dma_buf/bufinfo.
> However, since debugfs is considered unsafe to be mounted in production,
> it is being duplicated in sysfs.
> 
> Procfs also uses the proc/<pid>/fdinfo/<fd> file to expose some
> information about DMA-BUF fds. However, the existing procfs interfaces
> can only provide information about the buffers for which processes
> hold fds or have the buffers mmapped into their address space.
> The sysfs interface also exposes attachment statistics for each buffer.
> 
> This information will be used to derive DMA-BUF
> per-exporter stats and per-device usage stats for Android Bug reports.
> The corresponding userspace changes can be found at [2].
> Telemetry tools will also capture this information(along with other
> memory metrics) periodically as well as on important events like a
> foreground app kill (which might have been triggered by Low Memory
> Killer). It will also contribute to provide a snapshot of the system
> memory usage on other events such as OOM kills and Application Not
> Responding events.
> 
> A shell script that can be run on a classic Linux environment to read
> out the DMA-BUF statistics can be found at [3](suggested by John
> Stultz).
> 
> The patch contains the following major improvements over v1:
> 1) Each attachment is represented by its own directory to allow creating
> a symlink to the importing device and to also provide room for future
> expansion.
> 2) The number of distinct mappings of each attachment is exposed in a
> separate file.
> 3) The per-buffer statistics are now in /sys/kernel/dmabuf/buffers
> inorder to make the interface expandable in future.
> 
> All of the improvements above are based on suggestions/feedback from
> Daniel Vetter and Christian König.
> 
> [1]: https://lore.kernel.org/patchwork/patch/1088791/
> [2]: https://android-review.googlesource.com/q/topic:%22dmabuf-sysfs%22+(status:open%20OR%20status:merged)
> [3]: https://android-review.googlesource.com/c/platform/system/memory/libmeminfo/+/1549734
> 
> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
