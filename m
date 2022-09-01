Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D475A92D3
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 11:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513D610E662;
	Thu,  1 Sep 2022 09:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82FC610E662;
 Thu,  1 Sep 2022 09:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662023667; x=1693559667;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mPsYVkELLDfImD0xrHFX8wTa0pnh8/wBBtyojUQ2j+o=;
 b=JAGu/S8egIfxQ4IeEG7PxmZkSaQnvstoxD9EiZflfgg786ruikRIhMZs
 zySXG49EbIwzRjJR5WoEgeONFZyjHCcfFs7loGkXH904FqP/1xXU6DerR
 qHgReHceP+Kt/vqHbemEzF02WAR/BetFZtFqOpm/Y1hOFBy52UfIjGnfQ
 sDykaC777pzCv6A2gJLVpIPOr/p6fBWzpEUk9DVAcieNkErxV3MCAL3Ov
 UIXRrDaY91pXuPBss/f4C3povuyynGODkzeaCT4cNQ+Bdqt6nPYxzs8ZC
 0mSZapa13GpvwUye3FRheUnmIeYG+cAGONVaRQPzbzIX+IrfIOK//uvAU g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="295672026"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="295672026"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 02:14:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="615271858"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga007.fm.intel.com with ESMTP; 01 Sep 2022 02:14:09 -0700
Received: from [10.249.153.67] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.153.67])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 2819E8fX002181; Thu, 1 Sep 2022 10:14:09 +0100
Message-ID: <5a5538e3-9a79-2210-3632-483b4ee329db@intel.com>
Date: Thu, 1 Sep 2022 11:14:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.13.0
Subject: Re: [PATCH v3 01/11] drm/i915: Move display and media IP version to
 runtime info
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220831214958.109753-1-radhakrishna.sripada@intel.com>
 <20220831214958.109753-2-radhakrishna.sripada@intel.com>
 <878rn3czbh.fsf@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <878rn3czbh.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 01.09.2022 09:45, Jani Nikula wrote:
> On Wed, 31 Aug 2022, Radhakrishna Sripada <radhakrishna.sripada@intel.com> wrote:

...

>>  	struct ip_version graphics;
>> +	struct ip_version media;
>> +	struct ip_version display;
> 
> The runtime display info is now in an unnamed struct under struct
> intel_runtime_info below, and this belongs there.
> 
> There's also some pressure to name it, and "display" would be the name,
> so this would collide.
> 
> Seems like all of the above are overly generic names, including the
> pre-existing "graphics". Something to consider.

maybe

struct {
	struct {
		struct ip_version version;
		...
	} graphics;

	struct {
		struct ip_version version;
		...
	} media;

	struct {
		struct ip_version version;
		...
	} display;
} runtime;

then

drm_printf(p, "display version: %u.%02u\n",
	runtime->display.version.ver,
	runtime->display.version.rel);
...

Michal
