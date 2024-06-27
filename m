Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE3A91AD4B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 18:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B003F10E276;
	Thu, 27 Jun 2024 16:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="co43xkgV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5AD10E259;
 Thu, 27 Jun 2024 16:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719507418; x=1751043418;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JHz6erOPmMXOL5HH5YPKI+H7g3zJvm9sN1WupPV1hrI=;
 b=co43xkgVyAoyiJiBjxThByfurLcFMS4B+KHPDxpA9FPLoj5+Y7ow2aNx
 lFqHaWg8KQIeSWN8ZaBPI347IjzCoU3DvoKSGmVQ30SwLRyxGFkyzhT/o
 HQMtD5Ul/doG3ART8eyj5ihVijaBsxSFNx75oHX5ZwduyHpDpaErA7TOf
 CcR4uYRalaIAWv92NOWD3AiVVGwzf+6vIRyL0/u1je1RG+Xhcp0Msr3qg
 SI9Yt5vvMLyilix/HSNYbdB6Vfh6CnziFoZFjZPiYTWWBqcl8xNJqj+oG
 KPDIK3XfVnQQueeveA7CP9nIgfnWeWe5H22uMDcrIaeejq1+K3mZtBgSw w==;
X-CSE-ConnectionGUID: TTsdpKG9QKeXel2QaHZOsA==
X-CSE-MsgGUID: BoIpgg0xRV+Lv5iiRzGmhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="12286792"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="12286792"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 09:56:57 -0700
X-CSE-ConnectionGUID: XYsooz17Q/C24f9E4U7VdQ==
X-CSE-MsgGUID: 2KWJXXdKTaqzqKntxdLpIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="45202674"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.253.180])
 ([10.94.253.180])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 09:56:56 -0700
Message-ID: <fe18bed7-5a25-4abb-9745-e887d8211de8@linux.intel.com>
Date: Thu, 27 Jun 2024 18:56:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gem: Suppress oom warning in favour of ENOMEM to
 userspace
To: Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240626143318.11600-1-nirmoy.das@intel.com>
 <Zn05EPD0PRLdUmuj@ashyti-mobl2.lan>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <Zn05EPD0PRLdUmuj@ashyti-mobl2.lan>
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

Hi Andi,

On 6/27/2024 12:04 PM, Andi Shyti wrote:
> Hi Nirmoy,
>
> On Wed, Jun 26, 2024 at 04:33:18PM +0200, Nirmoy Das wrote:
>> We report object allocation failures to userspace with ENOMEM
>> so add __GFP_NOWARN to remove superfluous oom warnings.
> I think this should be the default behavior.
Yes, when drivers handle ENOMEM situation which is the case for i915/gem 
code
>   ENOMEM doesn't
> necessarily mean that there is a kernel failure. Most of the time
> we just run out of memory, deal with it :-)
>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks!


>
> Thanks,
> Andi
