Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 880A742E21B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 21:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F7B6EC37;
	Thu, 14 Oct 2021 19:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0216EC37
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 19:41:01 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id ad500f64-2d26-11ec-ac3c-0050568cd888;
 Thu, 14 Oct 2021 19:41:08 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 58DDD194B13;
 Thu, 14 Oct 2021 21:41:07 +0200 (CEST)
Date: Thu, 14 Oct 2021 21:40:57 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Wang Hai <wanghai38@huawei.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: fix null-ptr-deref in drm_dev_init_release()
Message-ID: <YWiHyT3abCm10Ces@ravnborg.org>
References: <20211013114139.4042207-1-wanghai38@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013114139.4042207-1-wanghai38@huawei.com>
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

Hi Wang,

On Wed, Oct 13, 2021 at 07:41:39PM +0800, Wang Hai wrote:
> I got a null-ptr-deref report:
> 
> [drm:drm_dev_init [drm]] *ERROR* Cannot allocate anonymous inode: -12
> ==================================================================
> BUG: KASAN: null-ptr-deref in iput+0x3c/0x4a0
> ...
> Call Trace:
>  dump_stack_lvl+0x6c/0x8b
>  kasan_report.cold+0x64/0xdb
>  __asan_load8+0x69/0x90
>  iput+0x3c/0x4a0
>  drm_dev_init_release+0x39/0xb0 [drm]
>  drm_managed_release+0x158/0x2d0 [drm]
>  drm_dev_init+0x3a7/0x4c0 [drm]
>  __devm_drm_dev_alloc+0x55/0xd0 [drm]
>  mi0283qt_probe+0x8a/0x2b5 [mi0283qt]
>  spi_probe+0xeb/0x130
> ...
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> If drm_fs_inode_new() fails in drm_dev_init(), dev->anon_inode will point
> to PTR_ERR(...) instead of NULL. This will result in null-ptr-deref when
> drm_fs_inode_free(dev->anon_inode) is called.
> 
> drm_dev_init()
> 	drm_fs_inode_new() // fail, dev->anon_inode = PTR_ERR(...)
> 	drm_managed_release()
> 		drm_dev_init_release()
> 			drm_fs_inode_free() // access non-existent anon_inode
> 
> Define a temp variable and assign it to dev->anon_inode if the temp
> variable is not PTR_ERR.
> 
> Fixes: 2cbf7fc6718b ("drm: Use drmm_ for drm_dev_init cleanup")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wang Hai <wanghai38@huawei.com>

Nice simple fix. Applied to drm-misc-next as I did not see the fix as
urgent. It will show up in -next in 1-2 weeks.

	Sam
