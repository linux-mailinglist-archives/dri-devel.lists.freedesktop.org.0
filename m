Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3149096435C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 13:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401D710E644;
	Thu, 29 Aug 2024 11:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nmmVM3d1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA64410E644
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 11:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724931803; x=1756467803;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2L5clSdNBS/T6QTGXkM3oBsR50kY8JLLlyNTq5ZNk7s=;
 b=nmmVM3d1IU9Jozar5w+pIHt6FfrA3pgSJFJouFrmARm+Hlt1KcmUMBzu
 JoszT4zFgchlznOmD9lsxrgUYe6QIh3a5r1TzEuNYcVqDXD1Qrsz1PGx1
 pE4oTopCu/R991ZROLpChslY8pJyd8Ub0zNRlCt04vcMNMKM4vEE0g62N
 URvtUMPRYtzUF+xOGCxBqn2OVewUqytXf1o3bHNDO1KHgrsHzGMytbgEL
 3cU/Czayn4x/NNQlh5ZvppHOek6TWzU+AeNYW4OUPYXAvl1w+O57R0Q8R
 QWikyWOQyiXHnbYfOAmyBl53jf9aFKW4SGUlThWb0INp2PeAqR0vQVVdS g==;
X-CSE-ConnectionGUID: lj8XzHSHR0i/GTC78DeXeA==
X-CSE-MsgGUID: /xL2WNs/QY6xvScotbpYqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34174091"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="34174091"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 04:43:23 -0700
X-CSE-ConnectionGUID: wjhhsfb6RaOOelKKSvefqQ==
X-CSE-MsgGUID: LvcbZOWsTz+6hLzyG+qTTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="63380853"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.14])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 04:43:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Mikko Perttunen
 <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH 4/6] drm/tegra: convert to struct drm_edid
In-Reply-To: <qdzaanzxm3yfkyokc5pacfuuyic5zbfmp2teaxfcf2knimvleb@gdd6g4htpfv5>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1724348429.git.jani.nikula@intel.com>
 <e764b50f4ad2de95e449ccb37f49c3f37b3333fc.1724348429.git.jani.nikula@intel.com>
 <qdzaanzxm3yfkyokc5pacfuuyic5zbfmp2teaxfcf2knimvleb@gdd6g4htpfv5>
Date: Thu, 29 Aug 2024 14:43:16 +0300
Message-ID: <87wmjzwo4r.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 29 Aug 2024, Thierry Reding <thierry.reding@gmail.com> wrote:
> On Thu, Aug 22, 2024 at 08:42:50PM GMT, Jani Nikula wrote:
>> Prefer the struct drm_edid based functions for reading the EDID and
>> updating the connector.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> ---
>> 
>> Cc: Thierry Reding <thierry.reding@gmail.com>
>> Cc: Mikko Perttunen <mperttunen@nvidia.com>
>> Cc: Jonathan Hunter <jonathanh@nvidia.com>
>> Cc: linux-tegra@vger.kernel.org
>> ---
>>  drivers/gpu/drm/tegra/drm.h    |  2 +-
>>  drivers/gpu/drm/tegra/output.c | 29 +++++++++++++++++------------
>>  2 files changed, 18 insertions(+), 13 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
>> index 682011166a8f..2f3781e04b0a 100644
>> --- a/drivers/gpu/drm/tegra/drm.h
>> +++ b/drivers/gpu/drm/tegra/drm.h
>> @@ -133,7 +133,7 @@ struct tegra_output {
>>  	struct drm_bridge *bridge;
>>  	struct drm_panel *panel;
>>  	struct i2c_adapter *ddc;
>> -	const struct edid *edid;
>> +	const struct drm_edid *drm_edid;
>
> It perhaps might've been less confusing if this wasn't gratuitously
> renamed, but either way (and assuming you want to take this through
> drm-misc):

I've been doing that to ensure all call sites, especially kfree(), get
changed.

> Acked-by: Thierry Reding <treding@nvidia.com>

Thanks, pushed to drm-misc-next.

BR,
Jani.


-- 
Jani Nikula, Intel
