Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0D451D614
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E8610E441;
	Fri,  6 May 2022 10:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77EA10E441
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 10:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651834704; x=1683370704;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=yqnraxmWFdrF3iXpI9TM6Pl7iFJX6FhCIWXAG4nCudM=;
 b=GwR7RCBIgWLhnl2QLsDs3wZyWwqBdv20IyeG5JcDaR6e6EhcCeUZt5k6
 MAFZDjU4W9RSorbEMLED2Og74f55kzmEtpxEkYRyuqgEtv/z6HOk85z0j
 sFeZ2K7LjNugv6WErs95/1EPPKYDyQxW9l0ea2Fh3U7PM+aojJYTT9H17
 HHF24mtBCn9UUhTomvvJMXGrMo2nNAySuNE4n+QBhUIvMKb74L13Ph4Rs
 PIywMwSbdtN5IpIWa41qgawKM8IPkNlAmxBWO8kRxoNPUgiuYIbQmKnvz
 rx1S4x0Pem6ar4D+hnYOQukKOFwiRLksXHja2ehDAOxpX4khKqLmrvE8U A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268581186"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268581186"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:58:24 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="537838523"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:58:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, marex@denx.de,
 dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH 1/2] [RFC] regmap: Add bulk read/write
 callbacks into regmap_config
In-Reply-To: <165176353878.543269.16463883419414078766.b4-ty@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220430025145.640305-1-marex@denx.de>
 <165176353878.543269.16463883419414078766.b4-ty@kernel.org>
Date: Fri, 06 May 2022 13:58:18 +0300
Message-ID: <877d6zkjw5.fsf@intel.com>
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
Cc: tzimmermann@suse.de, sam@ravnborg.org, jagan@amarulasolutions.com,
 robert.foss@linaro.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 05 May 2022, Mark Brown <broonie@kernel.org> wrote:
> On Sat, 30 Apr 2022 04:51:44 +0200, Marek Vasut wrote:
>> Currently the regmap_config structure only allows the user to implement
>> single element register read/write using .reg_read/.reg_write callbacks.
>> The regmap_bus already implements bulk counterparts of both, and is being
>> misused as a workaround for the missing bulk read/write callbacks in
>> regmap_config by a couple of drivers. To stop this misuse, add the bulk
>> read/write callbacks to regmap_config and call them from the regmap core
>> code.
>> 
>> [...]

Hey Mark, sorry for hijacking the thread a bit. regmap.h seems to have
comprehensive API documentation, but there's very little in terms of
higher level documentation that I could find. Is there any?

I've been toying with the idea of adding a regmap based interface for
accessing Display Port DPCD registers, with caching, and regmap seems
like it's got the kitchen sink but I find it a bit difficult to
navigate...

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
