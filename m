Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACCD4FF5F6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 13:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFE710E154;
	Wed, 13 Apr 2022 11:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A786B10E154
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 11:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649850163; x=1681386163;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=02FhdWkup3maGCO3D8h0u2UM6XV5GYq1KQBrX4FuMio=;
 b=i5R2bRBXlG1mFXcek58fzEOIo44v36lr1jcwZoSZiU5GNOpxKpU8P0+V
 mc2daOK2A9svzsNEQVKcHHEic2OdSMHnpHVh7SY1RYIVvSYk5kl1pra6H
 xMIPidp9fEBeAznX9XNeRbe+wnV1FKTl8Z3vuF2w4g94lBQ5h6ZNhFnh5
 EFuMPzVPoqeLUq5TmO82s22pA8qkwMu6vLZIh6WxfSc5lOdduVLa0AOim
 DiizH5B8I0EAJzROor+1glKfg0R2WF1emyRiHqph+g8T4Rj2mRrVkUx0e
 wKrwXvXzSJlGk/bZybX2Z2h5YDpNj7wkHgjNJZ2t/sLg6GpdurK5dps3M w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="243227607"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; d="scan'208";a="243227607"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 04:42:43 -0700
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; d="scan'208";a="507947098"
Received: from peiwangc-mobl1.ccr.corp.intel.com (HELO [10.249.254.177])
 ([10.249.254.177])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 04:42:42 -0700
Message-ID: <aa226c58-361b-0522-efb5-32c6633d7aee@linux.intel.com>
Date: Wed, 13 Apr 2022 13:42:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [bug report] drm/ttm: Add a generic TTM memcpy move for
 page-based iomem
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20220413111126.GA20082@kili>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220413111126.GA20082@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Dan Carpenter.

Thanks for the report.

On 4/13/22 13:11, Dan Carpenter wrote:
> Hello Thomas Hellström,
>
> The patch 3bf3710e3718: "drm/ttm: Add a generic TTM memcpy move for
> page-based iomem" from Jun 2, 2021, leads to the following Smatch
> static checker warning:
>
> 	./include/drm/ttm/ttm_bo_driver.h:259 ttm_bo_move_sync_cleanup()
> 	error: NULL dereference inside function 'ttm_bo_move_accel_cleanup()'
>
> ./include/drm/ttm/ttm_bo_driver.h
>      256 static inline void ttm_bo_move_sync_cleanup(struct ttm_buffer_object *bo,
>      257                                             struct ttm_resource *new_mem)
>      258 {
> --> 259         int ret = ttm_bo_move_accel_cleanup(bo, NULL, true, false, new_mem);
>                                                          ^^^^
> Passing a NULL for "fence" will crash.  The first place where it will
> crash is in dma_resv_add_fence() where it does:

Indeed, and this has been discussed thoroughly on dri-devel lately. The 
bug was introduced in a recent patch that made NULL pointers here crash. 
Not the patch indicated.

Thanks,

Thomas



>
> 	WARN_ON(dma_fence_is_container(fence));
>
>      260
>      261         WARN_ON(ret);
>      262 }
>
> regards,
> dan carpenter
