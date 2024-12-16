Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AC29F3914
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 19:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C0610E769;
	Mon, 16 Dec 2024 18:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bUDq8/D5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B884610E768;
 Mon, 16 Dec 2024 18:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734374154; x=1765910154;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Qdn3fI5lj6Tj1U0ErF9OaeZrxuIrUFFAYAvNW9VmQ0U=;
 b=bUDq8/D5xsucEgBnUXTwc2TA9ci0Zk5siDA9UXXsvTKssN+02lP2l2km
 nNQ1AhlrGC9Hu9BQdG7FtqI0oPUGMNY02IB2YThjtvLZTz05sKgxFQk8J
 sHv/8Z45mf8n4gYb9+T3amFK1PVvLWhPj/L+aSmHSG3I9O+GyEHUPhVUm
 qnDa5L0MH+HuyKGtdR8upU2Acxx/MDKqpDA1WxmgZeR2/13iy4Pdregto
 Ddlg6B01Y4iIeoFEDuzwSvSKSWaoBr/rcyn87CoXwyzJ/soJKRJGX9Akp
 RhyF2HYVGzuv9qBYUXl33V6xxV2SwXjqRzyMVhopqDHz3RNGeO4OdR9iZ Q==;
X-CSE-ConnectionGUID: VagtirsmROS0xkB9DOAqBw==
X-CSE-MsgGUID: UcNTgAy7SuGHt63OvCBjvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34998794"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; d="scan'208";a="34998794"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 10:35:53 -0800
X-CSE-ConnectionGUID: mCVjxT6qRXK5aDl9uwKxuw==
X-CSE-MsgGUID: d9W5U2HXS/2V9sXpMRIOLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; d="scan'208";a="128084201"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 [10.245.244.246]) ([10.245.244.246])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 10:35:52 -0800
Message-ID: <7745ad07-8300-4625-a443-21e82bdc992d@intel.com>
Date: Mon, 16 Dec 2024 18:35:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/buddy: fix issue that force_merge cannot free all
 roots
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 "Lin . Cao" <lincao12@amd.com>
References: <20241216130735.314298-1-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241216130735.314298-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 16/12/2024 13:07, Arunpravin Paneer Selvam wrote:
> From: Lin.Cao <lincao12@amd.com>
> 
> If buddy manager have more than one roots and each root have sub-block
> need to be free. When drm_buddy_fini called, the first loop of
> force_merge will merge and free all of the sub block of first root,
> which offset is 0x0 and size is biggest(more than have of the mm size).
> In subsequent force_merge rounds, if we use 0 as start and use remaining
> mm size as end, the block of other roots will be skipped in
> __force_merge function. It will cause the other roots can not be freed.
> 
> Solution: use roots' offset as the start could fix this issue.
> 
> Signed-off-by: Lin.Cao <lincao12@amd.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
