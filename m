Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F19D078F4D4
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 23:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B64510E6E9;
	Thu, 31 Aug 2023 21:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E8610E6E9
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 21:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693518591; x=1725054591;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HKlZgWgdvBZC1rUKsd47f+6oCtr43k9Cd79+01PjrYU=;
 b=ji0JE8Zb0icGeS2BG6ujd1A921COvrJYFfUvd9J/miUHhksLCJb2BzVi
 XaVWhu/0rG7cFVUtOm4R6+WP4UOXGwC4NzxG3dANhYyRGcHiHeKsNeIEU
 dEdUyuEy06zZt1Hmt96SS7IIGekk1uKpa+cgtPgf+jeOcaYxbA/g8Y4Di
 f8qrWILShSl5RAR69NQdJxfxyoT83OyvajFd7nzVBRg+c2l04vJPyDT7v
 feXNf8w6RnXuIiTOf1FLvpepEEe+gqnVRNm1bqvMArwJQNSypY8Y/93Yj
 KX00LYW9ez9y9CsM3E3LWhFTXqUDwtr/rwiZ5r5HsNzgRYwC90WxXWtaq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442474174"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="442474174"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 14:49:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="854450756"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="854450756"
Received: from tkeuter-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.47.216])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 14:49:47 -0700
Date: Thu, 31 Aug 2023 23:49:44 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Christian =?iso-8859-15?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 3/5] drm/debugfs: rework debugfs directory creation v5
Message-ID: <ZPEK+Mcdt9Um5+LQ@ashyti-mobl2.lan>
References: <20230829110115.3442-1-christian.koenig@amd.com>
 <20230829110115.3442-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230829110115.3442-4-christian.koenig@amd.com>
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

On Tue, Aug 29, 2023 at 01:01:13PM +0200, Christian König wrote:
> Instead of the per minor directories only create a single debugfs
> directory for the whole device directly when the device is initialized.
> 
> For DRM devices each minor gets a symlink to the per device directory
> for now until we can be sure that this isn't useful any more in any way.
> 
> Accel devices create only the per device directory and also drops the mid
> layer callback to create driver specific files.
> 
> v2: cleanup accel component as well
> v3: fix typo when debugfs is disabled
> v4: call drm_debugfs_dev_fini() during release as well,
>     some kerneldoc typos fixed
> v5: rebased and one more kerneldoc fix
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Looks reasonable...

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
