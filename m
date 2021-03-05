Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A84DC32E62D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 11:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BC26EB5C;
	Fri,  5 Mar 2021 10:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0B3456EB5C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 10:21:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56EF5101E;
 Fri,  5 Mar 2021 02:21:47 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 751173F7D7;
 Fri,  5 Mar 2021 02:21:46 -0800 (PST)
Subject: Re: [PATCH 0/2] Fix purging buffers in the shmem helpers
To: Neil Roberts <nroberts@igalia.com>, Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20210223155125.199577-1-nroberts@igalia.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <a4b35b00-4f4d-b086-9ad4-dd2038d8df75@arm.com>
Date: Fri, 5 Mar 2021 10:22:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210223155125.199577-1-nroberts@igalia.com>
Content-Language: en-GB
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/02/2021 15:51, Neil Roberts wrote:
> These two patches fix a problem with the madvise purging code for the
> shmem helpers where the mmaping for a purged buffer wouldn't get
> invalidated correctly. This presumably ends up as a security hole
> where the mapping can be accessed from user-space to read and write
> random pages from other buffers. This is currently affecting Panfrost.
> The second patch is a v2 from a patch that was sent standalone.
> 
> There is a WIP IGT test for Panfrost which demonstrates the bug here:
> 
> https://gitlab.freedesktop.org/nroberts/igt-gpu-tools/-/commits/panfrost-purgemap/
> 
> Neil Roberts (2):
>    drm/shmem-helper: Check for purged buffers in fault handler
>    drm/shmem-helper: Don't remove the offset in vm_area_struct pgoff
> 
>   drivers/gpu/drm/drm_gem_shmem_helper.c | 25 ++++++++++++++++++-------
>   1 file changed, 18 insertions(+), 7 deletions(-)
> 

Pushed to drm-misc-fixes

Thanks,

Steve
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
