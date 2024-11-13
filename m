Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045459C74E6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 15:58:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A894D10E71F;
	Wed, 13 Nov 2024 14:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wf32Kn6j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CEE10E71F;
 Wed, 13 Nov 2024 14:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731509911; x=1763045911;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=X24yyBmMKWlCDsByrpVknt1MPni2cbO2tE1LVAy+jxw=;
 b=Wf32Kn6jKQliYNAoBOHEjVqrGM+rktkqGxgvye2pEmEU23cxI3SaFyWL
 YMyJ0bmTnVOxr/uzYNRxMaV1tHZjkSnHXfeC1MyKoa4GtndBxYhG6O06X
 OE7VIRpdUnKN8TVZ1DEyjeYLK99ttZ2CbOe7RsX44G1L21FxUgwYQhxve
 d9gUsCulownlxwKFpvM7QIGGprwxpsNCiv7HdTy5Oz+IOPed9zDEZ+ZLK
 A6SoqBl9jBlxzPxtfQNIJN+p0vhjurMYMPWO/lI82NKNcnkKqi4MRQie+
 rwb5opRtLPJzbl4+35Tr6cd7OCgIXSGtw49jjsnJLtCqWrhgScsXfGjjf Q==;
X-CSE-ConnectionGUID: frA3dtYxQi2d6atrG7NhFw==
X-CSE-MsgGUID: 1jwi1FPWT4mhQLZnXojRRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48856354"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="48856354"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 06:58:31 -0800
X-CSE-ConnectionGUID: Bc6jQQN4S02Ll+J+ofCI0w==
X-CSE-MsgGUID: Kyb9bbZNSx+iy0bO1f/hmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="118833767"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.245.192])
 ([10.245.245.192])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 06:58:27 -0800
Message-ID: <d6c57862-1593-44ff-a192-7af308cac94b@linux.intel.com>
Date: Wed, 13 Nov 2024 15:58:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] kernel/cgroups: Add "dev" memory accounting cgroup.
To: Tejun Heo <tj@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Zefan Li <lizefan.x@bytedance.com>, Andrew Morton
 <akpm@linux-foundation.org>, Friedrich Vock <friedrich.vock@gmx.de>,
 cgroups@vger.kernel.org, linux-mm@kvack.org
References: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
 <ZxlRLMwkabTaOrjc@slm.duckdns.org>
 <20241024-beautiful-spaniel-of-youth-f75b61@houat>
 <Zxp-nLXOJXoSy8BN@slm.duckdns.org>
 <20241028-meaty-mega-nuthatch-3d74b1@houat>
 <20241029203834.GA636494@cmpxchg.org>
 <20241106-vivacious-eagle-of-gaiety-44a419@houat>
 <ZyuzeIhTgXU5CCk0@slm.duckdns.org>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <ZyuzeIhTgXU5CCk0@slm.duckdns.org>
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

Hey,

Den 2024-11-06 kl. 19:20, skrev Tejun Heo:
> On Wed, Nov 06, 2024 at 11:31:49AM +0100, Maxime Ripard wrote:
> ...
>>> How about dmem for this one, and dpu for the other one. For device
>>> memory and device processing unit, respectively.
>>
>> dmem sounds great to me, does everyone agree?
> 
> Sounds good to me.
> 
> Thanks.
> 
Thanks for all feedback and discussion. I checked mostly on patchwork so 
I missed the discussion here. Fortunately it's only been about naming. :)

I'm thinking of adding a 'high' knob as well, that will work similarly 
to high in normal mem controller. (so not proportionally calculated like 
'max', but (usage + allocated) < max = ok.

Recursively of course.

Cheers,
~Maarten
