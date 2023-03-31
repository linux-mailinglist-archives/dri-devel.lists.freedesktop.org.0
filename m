Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE8A6D20BC
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 14:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCCA10E0BD;
	Fri, 31 Mar 2023 12:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA5B10E0BD;
 Fri, 31 Mar 2023 12:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680266795; x=1711802795;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DNBTgkydAKy9RgdwAafCwZyOU0pinYOIVpjAN5c+Lfw=;
 b=ZOGb9d4WnyFNZC9ssalUpi+3SfLfYjLj4nbuU6+tj1ootbVGfoihdFFa
 NzcTzjcHsYrA9+/wM2ykEWVg1ilbdf1h+BbglIvLJiLNHXrnW0TsriUSs
 4EPd8GjOfMwumWRo953Gjf6cejM8BZGEnZqEgUVQXudn/OuoPfmTQTwoV
 MDLw44hGIyVYi6Pxapuyc1TXbydNSvKEKZbtKb9XMxejfhyPBbZnPDtC0
 cge5TXJwtrI3XURKHBL7g0JN8xzSGowrMIEw4Zyg0wPPd4A8ltFFuTDPR
 bBFVvf9x++6uaJQG6eR1u8Dtghz7bILcIjVloPMSZrlztMn3Gfo5+Hm15 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="325408594"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="325408594"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 05:46:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="809024958"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="809024958"
Received: from bpower-mobl3.ger.corp.intel.com (HELO [10.213.225.27])
 ([10.213.225.27])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 05:46:25 -0700
Message-ID: <3722f24b-0bad-ad35-5f24-66c1b17f8e71@linux.intel.com>
Date: Fri, 31 Mar 2023 13:46:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [PATCH v6 5/8] drm/i915/pxp: Add ARB session creation
 and cleanup
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
 <20230228022150.1657843-6-alan.previn.teres.alexis@intel.com>
 <fabe4123-53cc-005e-e0af-7683e0d45896@intel.com>
 <3b8091c51677878b968d1d275b9b16e5088d913d.camel@intel.com>
 <ZCAqDlUIp0YmCkyu@intel.com> <fef256a6-3027-8beb-0ef8-fddf972db441@intel.com>
 <cf63d62b-3e2d-f8fe-82b6-95e71e376cc2@linux.intel.com>
 <3359c9d371a25710891352061693637b37679734.camel@intel.com>
 <ZCMpXMj7GwDIp6Ll@intel.com>
 <118981ef-260d-4c1a-5ca5-ad435d5edbc7@linux.intel.com>
 <f87c39a243d84e53d6c292c63d032b30c89adb3e.camel@intel.com>
 <36548877-5352-8ff3-6e87-410089470a4b@linux.intel.com>
 <4ad872f1366802a717e13140d1da467ace1ae36f.camel@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <4ad872f1366802a717e13140d1da467ace1ae36f.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>, "Lahtinen,
 Joonas" <joonas.lahtinen@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Harrison,
 John C" <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 30/03/2023 20:44, Teres Alexis, Alan Previn wrote:
> On Thu, 2023-03-30 at 13:25 +0100, Tvrtko Ursulin wrote:
>> On 30/03/2023 01:10, Teres Alexis, Alan Previn wrote:
>>> On Wed, 2023-03-29 at 08:43 +0100, Tvrtko Ursulin wrote:
>>>> On 28/03/2023 18:52, Rodrigo Vivi wrote:
>>>>> On Tue, Mar 28, 2023 at 05:01:36PM +0000, Teres Alexis, Alan Previn wrote:
>>>>>> On Mon, 2023-03-27 at 17:15 +0100, Tvrtko Ursulin wrote:
> alan:snip (excuse my snips - my evolution keeps inserting CRs - still looking for solution)
>> But intuitively I thought that what Mesa wants is a no-cost getparam
>> which would somewhat reliably tell it if the feature is supposed to be
>> there and context create at a later stage, with the protected flag set,
>> is supposed to work. AFAIU it can still fail at that point or probably
>> block until the required setup is done.
> Yes - that's right - i had another round of discussions with Daniele about a cleaner approach - below..
> alan:snip
>> Even 200ms is possibly not good enough since boot time targets (to UI
>> AFAIR) are pretty tight. Don't know... Maybe I'd need a timeline diagram
>> showing the involved components to understand this properly.
> Absolutely, my experiences in i915 on embedded products even had PORs of <1000milisec to first-fully-renderered-display from cold-boot so yes, we need to work with this requirement
> in mind and do testing on real customer stack.
> 
> I spoke to Daniele and we have another idea - but would also impact mesa, for the better:
> 
> 1. Introduce get-param (is_PXP_avail)
> 	- will return a simple yes or no
> 		- yes means : i915-device-info supports it, kernel configs supports it and required-firmwares were found (not necessarily loaded/init yet).
> 			(NOTE: this would be made to hook up to pxp helpers such as intel_pxp_is_supported)
> 2. Gem-pxp-context-creation continues blocking like today with minor tweak:
> 	(same)- success = all dependencies are in place, all firmware init completed, pxp arb session successfully completed.
> 	(same)- non-success -ENODEV = if any dependency wasnt available or fw failed to create arb-session due to fw-init-failure/BIOS/platform config.
> 	(tweak)- non-success -ENXIO (or some other -E'FOO') if component-driver-init or firmware-init is still pending after brief timeout.
> 		- on timeout - TBD - need testing/debug on real world stack.
> 		- UAPI spec needs update but pxp implementation currently uses -ENXIO for similiar reason inheritted first merge.
> 
> Thus, with this: Get param would always be immediate. Pxp-context-creation would only block when all dependencies are in place and we attempt to create the pxp arb session.
> (firmware can take up to 200-milisecs, according to MTL spec, so I'd say ~210 given other overheads between i915 and fw and back).
> We would need to change MESA-get-caps to use get-param (and not pxp-context-creation) as it would always return immediately with kernel side support.
> And if application explicitly requires PXP support, then it needs to call pxp-context-creation that may block or require retry.

The above sounds good to me.

I am only not 100% clear on the ENODEV option from context create, does 
it include even things which can be detected without any timeouts at 
probe time, or just failures which take time to learn about.

> WRT to fast-boot-to-first-frame, I am hoping real customer stack doesn't require PXP on the compositor and first mesa instance works fine without PXP caps.
> And when customer apps that needs PXP starts, it would create pxp context which would block but the app would not have a choice.

Yeah that sounds like an unlikely use case and one that we cannot 
improve on the kernel or uapi side.

(I can imagine resuming directly into a full screen video playback post 
suspend, but a cold boot into it is a stretch.)

Regards,

Tvrtko
