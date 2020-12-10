Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C662D5771
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 10:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864166EA59;
	Thu, 10 Dec 2020 09:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E8916EA59
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 09:43:46 +0000 (UTC)
Date: Thu, 10 Dec 2020 10:45:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1607593426;
 bh=tW8e+ZIMytQ67f0yQ5yA8t6EHe8cmb+Lh+QmxW6LBx8=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=M6/TTmEAydmbO5m1IjQqVv5WTsGFBBIl97FuFODGzM248Dw7oVpUk6nmSAWTU6tYP
 NVSG/WaqVlDa7iE1wG48Q2CyVbSAgAcVpkbZ5GNI/iLMEcyOD1ZExlJm23OHd+9SxF
 plDcqLf34ZbytFkCxi/KkkKgG9s8TXB+9y39JBh0=
From: Greg KH <gregkh@linuxfoundation.org>
To: Hridya Valsaraju <hridya@google.com>
Subject: Re: [PATCH] dmabuf: Add the capability to expose DMA-BUF stats in
 sysfs
Message-ID: <X9HuHFQntOEUNpst@kroah.com>
References: <20201210044400.1080308-1-hridya@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210044400.1080308-1-hridya@google.com>
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
Cc: surenb@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, kernel-team@android.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 09, 2020 at 08:43:57PM -0800, Hridya Valsaraju wrote:
> This patch allows statistics to be enabled for each DMA-BUF in
> sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
> 
> The following stats will be exposed by the interface:
> 
> /sys/kernel/dmabuf/<inode_number>/exporter_name
> /sys/kernel/dmabuf/<inode_number>/size
> /sys/kernel/dmabuf/<inode_number>/dev_map_info
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
> This information is intended to help with root-causing
> low-memory kills and the debugging/analysis of other memory-related issues.
> 
> It will also be used to derive DMA-BUF
> per-exporter stats and per-device usage stats for Android Bug reports.
> 
> [1]: https://lore.kernel.org/patchwork/patch/1088791/
> 
> Signed-off-by: Hridya Valsaraju <hridya@google.com>

Thanks for adding all of this, nice work!

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
