Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8593E6CD382
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 09:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D10210E4EE;
	Wed, 29 Mar 2023 07:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B9810E4D5;
 Wed, 29 Mar 2023 07:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680075818; x=1711611818;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=teJX4UjNTy0Lep0ahaCy0XDVc43fT1FYcbF85MQWYN8=;
 b=WPz85PrC4HyyJU9tvxY3LrhTI0/PlOuGaBF4YfhRsEexM45hgx6YKzaa
 xzV4pSl9tcXGf3o8K+UVB/fc61j0R+qoSim8Wn/2ZC/wHh5CDK+QnA6ic
 ciRIenbGtczvQXJynwDhzOsmklPmUWYPdxrr3mOsoYXp4Bh87XYg+Nrpt
 7UDGSI92akZADw/rIv4aV9tDQ3btcdW8vCAIkPa7Qv9rAuWQ9qqNJIEQp
 Gd0OZQMrtX+naJzW4+h3DTLtaMKm99sxmesnRUuDddH80zJX4rHpvDjzf
 Tv6uPhsEl4u5JiimA8aCLZ8xZ5cKqW7zrk3YbSA4dCyxMGnewghI9w8dB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="329272070"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="329272070"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 00:43:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="686734053"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="686734053"
Received: from jabolger-mobl2.ger.corp.intel.com (HELO [10.213.199.158])
 ([10.213.199.158])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 00:43:25 -0700
Message-ID: <118981ef-260d-4c1a-5ca5-ad435d5edbc7@linux.intel.com>
Date: Wed, 29 Mar 2023 08:43:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [PATCH v6 5/8] drm/i915/pxp: Add ARB session creation
 and cleanup
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
References: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
 <20230228022150.1657843-6-alan.previn.teres.alexis@intel.com>
 <fabe4123-53cc-005e-e0af-7683e0d45896@intel.com>
 <3b8091c51677878b968d1d275b9b16e5088d913d.camel@intel.com>
 <ZCAqDlUIp0YmCkyu@intel.com> <fef256a6-3027-8beb-0ef8-fddf972db441@intel.com>
 <cf63d62b-3e2d-f8fe-82b6-95e71e376cc2@linux.intel.com>
 <3359c9d371a25710891352061693637b37679734.camel@intel.com>
 <ZCMpXMj7GwDIp6Ll@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZCMpXMj7GwDIp6Ll@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Lahtinen,
 Joonas" <joonas.lahtinen@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>, "Landwerlin,
 Lionel G" <lionel.g.landwerlin@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/03/2023 18:52, Rodrigo Vivi wrote:
> On Tue, Mar 28, 2023 at 05:01:36PM +0000, Teres Alexis, Alan Previn wrote:
>> On Mon, 2023-03-27 at 17:15 +0100, Tvrtko Ursulin wrote:
>>> These two:
>>> e6177ec586d1 ("drm/i915/huc: stall media submission until HuC is loaded")
>>> b76c14c8fb2a ("drm/i915/huc: better define HuC status getparam possible return values.")
>>> They do not help here? It is not possible to use or extend the refined I915_PARAM_HUC_STATUS return values combined with huc load fence for this all to keep working?
>> Checking is-huc-loaded won't reflect is-pxp-available (in case fw/fusing isn't allowing it). But the connection between them is hw-internal so i915 asking PXP-fw to attempt a PXP
>> session depends on HuC (and the 3 other things i mentioned). However, Tvrtko's point on using fences-or-equivalent is the same thing John Harrison brought up offline with Daniele
>> as the proper kernel way to do this type of dependency checking. However, any form of dependency-checking won't improve UMD's experience. We still need to decide if i915-PXP should
>> wait-in-kernel or return some-new-spec-error. A useful data point: we are debugging a related issue on actual customer stack. The compositor using mesa is hitting this code path
>> very early.. even before gsc-proxy component is loaded and we are trying to figure out why delaying inside intel_pxp_start is not helping (more delays causes the gsc-proxy
>> component to also get delayed) but that is a different conversation. I'm only mentioning this because we have a strict requirement to get the desktop login window up within 1-2
>> seconds of bootloader->kernel handoff. That said, if use -EAGAIN, I'm not sure if that would work as it would delay the compositor startup beyond the typical end user experience
>> unless MESA has a timeout to give up on a cap-testing when seeing repeated -EAGAIN (doubt mesa folks like this?). Perhaps we could just immediately return with a different error
>> (instead of current PXP-UAPI spec of -EINVAL or -ENODEV)... perhaps use -ENXIO which apparently is already part of the original pxp code but was never mentioned in UAPI - but we
>> return this immediately and document it in UAPI as "hw/fw insfratructure is not yet ready to create pxp arb session, user space can retry but may need delays of up to x-seconds on
>> ADl/TGL or y-seconds on MTL, before getting a SUCCESS or one of the other errors).
> 
> fair enough. It looks like we need a new get_param! :)

To check I understood this - new parameter would be like "is pxp support 
present"?

And then later it can still fail to initialize due some parameters not 
easily detectable during boot/probe?

How will the context create path look like on those platforms:

1. Block, then potentially error out if the full initialization failed.

2. Error out "in progress" while initializing, error out "something 
else" if initialization failed.

?

Regards,

Tvrtko
