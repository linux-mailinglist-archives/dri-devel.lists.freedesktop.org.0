Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A1A78C361
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 13:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B8410E239;
	Tue, 29 Aug 2023 11:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7161F10E239
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 11:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693309088; x=1724845088;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KNTXpZ43JQQDpzwcPqmLcc/hGpqEJJwB9uMU6mL4bk4=;
 b=Cv5A0s3ZL4QErf5lZxPzGir2iYAUK/vG+i7i8i0Ofjh6oEaK9KGvkJaK
 GxfndNmvNmLcnBsAw+dMqpiChX92p4HUhSYd2ZEA/lCi0/Y8EtH3wN+vz
 YgXGC5NobJHoPhq0MQZhTevBALzcgrCbVkGDIdbtCtjWa6WXAwTmNLDwd
 y+OgHc8MSkFd+jKRzhnZbEEbiSQZcmcisRQ8PEk6Ns6TyY0x7gyHYIZuo
 xk5Sy7/dqcJU4gOcMs9so4C1UsOynEqhrjbTo2OXTxBUsesOV75fHyExn
 utWv0jsX5N6PwX0xI8zla7EC5avzz0vJ2upSn0uGYI5tC8RPRDKt8zzSP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="441698590"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441698590"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 04:38:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="688465057"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688465057"
Received: from ogbrugge-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.249.42.59])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 04:38:05 -0700
Date: Tue, 29 Aug 2023 13:38:00 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Christian =?iso-8859-15?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/5] drm/debugfs: disallow debugfs access when device
 isn't registered
Message-ID: <ZO3YmCJKwcJydNGV@ashyti-mobl2.lan>
References: <20230829110115.3442-1-christian.koenig@amd.com>
 <20230829110115.3442-3-christian.koenig@amd.com>
 <ZO3XGchG9fGjoW9K@ashyti-mobl2.lan>
 <5ce9f1b6-0a9e-7cf8-25f9-de9621b342dc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ce9f1b6-0a9e-7cf8-25f9-de9621b342dc@gmail.com>
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
Cc: ogabbay@kernel.org, ttayar@habana.ai, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > > During device bringup it might be that we can't access the debugfs files.
> > > Return -ENODEV until the registration is completed on access.
> > just wondering, if the device is not registered, how do we get
> > there?
> 
> The workflow is:
> 1. Creation (DRM)
> 2. Initialization (Driver)
> 3. Registration (DRM)
> ...
> 4. Unregistration (DRM)
> 5. Deinitialization (Driver)
> 6. Destruction (DRM)
> 
> It is possible that debugfs files are created during driver initialization,
> but Daniel insisted that they should not be accessible until the
> registration is done (which makes the other UAPI accessible as well).

makes sense, but then why not -EAGAIN, or -EBUSY?

Thanks,
Andi
