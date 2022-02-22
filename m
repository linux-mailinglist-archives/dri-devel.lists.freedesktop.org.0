Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD9F4BF52B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 10:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4887410E79B;
	Tue, 22 Feb 2022 09:53:50 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E25610E765;
 Tue, 22 Feb 2022 09:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645523628; x=1677059628;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/0gc7MYOrMtVM1VaCVl3VgLuKMkXDTdGeiY1W+xGG1g=;
 b=S76V1B2IaG9/7I34u+HGCnwg/ymXFhXqoYfly6kKDW6g8iqZri6Tb3CH
 SWABlbviLxeKf4xCTNYnkGvq3JYGF0HenIflDHcQACubHe9UTPghoPsUd
 AwvC/8FFGSobwLHxkK0JljxiFArGqXqrjv8Qjfv61ErOXwjsw94AQnhA4
 rEh+F6DLU3Fqt69s0JT4Lkj2gq59etBaoIovP8+rvdN8yzAP5GOQIW5j4
 a2nZlbJfVPadf7JHusmjAuAtKJfMm+ds5vtO9zhjPqNKNjWmctRMkQZ4Y
 zlidSKIILGQn45YUP5+mhg7slK1exotCzP9OB5LMxn/QDhw8idkFIuYDS w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="231625544"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="231625544"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 01:53:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="507924100"
Received: from sjgillin-mobl.ger.corp.intel.com (HELO [10.213.218.63])
 ([10.213.218.63])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 01:53:46 -0800
Message-ID: <647b611a-d159-3a6f-2e3a-c8039a9503ec@linux.intel.com>
Date: Tue, 22 Feb 2022 09:53:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 0/3] Improve anti-pre-emption w/a for compute
 workloads
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18/02/2022 21:33, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Compute workloads are inherently not pre-emptible on current hardware.
> Thus the pre-emption timeout was disabled as a workaround to prevent
> unwanted resets. Instead, the hang detection was left to the heartbeat
> and its (longer) timeout. This is undesirable with GuC submission as
> the heartbeat is a full GT reset rather than a per engine reset and so
> is much more destructive. Instead, just bump the pre-emption timeout

Can we have a feature request to allow asking GuC for an engine reset?

Regards,

Tvrtko

> to a big value. Also, update the heartbeat to allow such a long
> pre-emption delay in the final heartbeat period.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> 
> 
> John Harrison (3):
>    drm/i915/guc: Limit scheduling properties to avoid overflow
>    drm/i915/gt: Make the heartbeat play nice with long pre-emption
>      timeouts
>    drm/i915: Improve long running OCL w/a for GuC submission
> 
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 37 +++++++++++++++++--
>   .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 16 ++++++++
>   drivers/gpu/drm/i915/gt/sysfs_engines.c       | 14 +++++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  9 +++++
>   4 files changed, 73 insertions(+), 3 deletions(-)
> 
