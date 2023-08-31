Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3D878F4E8
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 23:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4AA210E6EA;
	Thu, 31 Aug 2023 21:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A8A10E6EA
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 21:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693518976; x=1725054976;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5LWJ9L5WYuEUSB8IAv5fL1cBQxgVOC6LYuUVTW2wGuA=;
 b=HQYV9upSD+R0ZkaAXIIoqfTSRarQlYxE0RTwod2gx/fgYdwCMM/QyzH3
 BTIRuFV4vaktdbVJWg7g346tHsyB5s/EWUOqB1mpadNXnKppsFI2ofNB2
 EWksPGFdl9ieFyRIQY+yzxDOHn0d82ahaXBqqFY3pZMd7/1CD0T00e2zS
 d6x1E2jTuR3ghs8HnxMom4avB4PICvWhhPltZN1alli4dXigltJdZCXu5
 vFLRko0id2tO8YOq/Z1pCXo/vhoLYnIeAV8EuBcHw3cA43lGj+keEBMDq
 +PHqMwYeAcP2JewYZVBd5Ng/gKnBfM6aqTPYDLxFDbyP8v6EMY9klM7yu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="376010476"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="376010476"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 14:56:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="742887964"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="742887964"
Received: from tkeuter-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.47.216])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 14:56:09 -0700
Date: Thu, 31 Aug 2023 23:56:06 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Christian =?iso-8859-15?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 4/5] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex v2
Message-ID: <ZPEMdoMvIjX/54Dd@ashyti-mobl2.lan>
References: <20230829110115.3442-1-christian.koenig@amd.com>
 <20230829110115.3442-5-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230829110115.3442-5-christian.koenig@amd.com>
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
Cc: ogabbay@kernel.org, ttayar@habana.ai, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On Tue, Aug 29, 2023 at 01:01:14PM +0200, Christian König wrote:
> The mutex was completely pointless in the first place since any
> parallel adding of files to this list would result in random
> behavior since the list is filled and consumed multiple times.
> 
> Completely drop that approach and just create the files directly but
> return -ENODEV while opening the file when the minors are not
> registered yet.
> 
> v2: rebase on debugfs directory rework, limit access before minors are
>     registered.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
