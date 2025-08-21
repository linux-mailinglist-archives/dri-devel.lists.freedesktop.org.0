Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FDEB2F45B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 11:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60DB10E8FC;
	Thu, 21 Aug 2025 09:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2dSFhES";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F55F10E8F9;
 Thu, 21 Aug 2025 09:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755769530; x=1787305530;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/tCrZZ2AFceephPBRq4Hfkgk8ftesiHYsuCXhArVXZA=;
 b=L2dSFhES271MxyD2xtUHx+0gsdsEv+PwXDGOSHBJyw9yf/wOBCvzC/hY
 EOkTIX4ZzvYUc7fqqKsTPzoSWJvX1W78JhJuH5pvpq+HTXON/Em+f5AoN
 CZNTdeyG054RXYYCZiGbN2Mqy3qsYhZVdOLwlchrZhhUPDFA7pI+Prooy
 286aDGV9rC/CRUtWCwlW6ruTRJnWGgcZqbUUBXA0qQKF7FqhYDU/8C2wJ
 lOtd60HmmBTmXr2/o62SuchoL+4PAmGAn1YSBVeU+TBN3zvIuGWdOWu/S
 bcMl8hYFmz1FKMSEusQjd+dYNXpbfpNsUbBKl5k8FNmEwOqFHRrNIWgeB g==;
X-CSE-ConnectionGUID: DtZLNNcWQLmCsrbOWe5YRA==
X-CSE-MsgGUID: qqOYlaucSZCxC+MW8mwqhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57980124"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="57980124"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 02:45:29 -0700
X-CSE-ConnectionGUID: SYbTXIuiTzqvBGEcaf42CQ==
X-CSE-MsgGUID: 8FYbTqfxSfGC3yfZ5adL+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="172788899"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.208.247])
 ([10.247.208.247])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 02:45:25 -0700
Message-ID: <b0447abc-5082-4c87-a21d-6a43de5c788c@linux.intel.com>
Date: Thu, 21 Aug 2025 15:15:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 1/5] drm/netlink: Add netlink infrastructure
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Hawking Zhang
 <Hawking.Zhang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Michael J <michael.j.ruhl@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
References: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
 <20250730064956.1385855-2-aravind.iddamsetty@linux.intel.com>
 <b84ccec7-3971-4497-b563-21b4807f0c98@oss.qualcomm.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <b84ccec7-3971-4497-b563-21b4807f0c98@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 15-08-2025 22:37, Zack McKevitt wrote:
> On 7/30/2025 12:49 AM, Aravind Iddamsetty wrote:
>> +static void drm_genl_family_init(struct drm_device *dev)
>> +{
>> +    dev->drm_genl_family = drmm_kzalloc(dev, sizeof(struct
>> genl_family),
>> +                        GFP_KERNEL);
>> +
>> +    /* Use drm primary node name eg: card0 to name the genl family */
>> +    snprintf(dev->drm_genl_family->name,
>> sizeof(dev->drm_genl_family->name),
>> +         "%s", dev->primary->kdev->kobj.name);
>> +    dev->drm_genl_family->version = DRM_GENL_VERSION;
>> +    dev->drm_genl_family->parallel_ops = true;
>> +    dev->drm_genl_family->ops = drm_genl_ops;
>> +    dev->drm_genl_family->n_ops = ARRAY_SIZE(drm_genl_ops);
>> +    dev->drm_genl_family->maxattr = DRM_ATTR_MAX;
>> +    dev->drm_genl_family->module = dev->dev->driver->owner;
>> +}
>
> We are interested in using this infrastructure at Qualcomm to
> communicate telemetry information for the AI100 accelerators. It would
> be nice if this function could support drm_minor accel nodes
> (dev->accel) as well. 

Glad to know the interest,  at present the code does create drm netlink
family for accel device as well, but it is tries to register with the
drm primary node name which might not be present for dev->accel,
checking for the "DRIVER_COMPUTE_ACCEL" and registering with the name
will fix that.

But also to bring to your attention the current series focuses on
reporting RAS errors and hence the commands are as well oriented towards
errors, anything specific to telemetry needs to be added. Do you have
any thought as to what kind of data and what kind of command support you
might need.

Thanks,
Aravind.
>
> Thanks,
>
> Zack
