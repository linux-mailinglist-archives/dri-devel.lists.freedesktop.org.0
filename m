Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9ED739D94
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 11:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6A310E51E;
	Thu, 22 Jun 2023 09:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7116F10E511;
 Thu, 22 Jun 2023 09:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687426830; x=1718962830;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2NhxX3rdSOywNGKYmhtGB0pRTH8j8R7PfKDrsXNYHAo=;
 b=c+NXvpn+o1jM9K94JyAjXkTaANPmfPn4txpLU7MFucMHVCOBsRgfaoBK
 /jYy0eQ8/4BdjRlW57yJvPbex/YY4yz7QbWIaltNXiwyZZ4i5xLMztvWs
 9qAQQGd6sTa6Hxdh2K9ega+wn90ivkRoPCvsn2+YBiceD9dc2ymssSupe
 dUMWuNCw5A1LOKoTQETi7S/5RX07Jjf7kHC1RnVcG3Z1cIXhxvUfZ8/bN
 +R7JwNm+BQ+qqojzeRF+fartoEFHVkbi607f5k2qHXWzUptW1hdVObYY+
 1/smtGsGBsB4qrBXoOXBU6u9z/SXW/Z4Kh9+ONFFO2W/neVWkh1aryhei Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="390129353"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="390129353"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 02:40:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="692179249"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="692179249"
Received: from gdoolan-mobl1.ger.corp.intel.com (HELO [10.213.228.155])
 ([10.213.228.155])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 02:40:23 -0700
Message-ID: <b414a7af-7333-498c-55ba-d60ae0a0507c@linux.intel.com>
Date: Thu, 22 Jun 2023 10:40:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/i915: Replace kmap() with kmap_local_page()
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Ira Weiny <ira.weiny@intel.com>, Sumitra Sharma <sumitraartsy@gmail.com>
References: <20230620180759.GA419158@sumitra.com>
 <79e1f37f-3ffa-0195-860b-08cc890d810e@shipmail.org>
 <649326df1b895_1c0dd29486@iweiny-mobl.notmuch>
 <d58c3dfd-e1d5-a8c5-7f0f-295dbf99e91a@shipmail.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <d58c3dfd-e1d5-a8c5-7f0f-295dbf99e91a@shipmail.org>
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
Cc: Deepak R Varma <drv@mailo.com>, Fabio <fmdefrancesco@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/06/2023 19:51, Thomas Hellström (Intel) wrote:
> 
> On 6/21/23 18:35, Ira Weiny wrote:
>> Thomas Hellström (Intel) wrote:
>>> I think one thing worth mentioning in the context of this patch is that
>>> IIRC kmap_local_page() will block offlining of the mapping CPU until
>>> kunmap_local(), so while I haven't seen any guidelines around the usage
>>> of this api for long-held mappings, I figure it's wise to keep the
>>> mapping duration short, or at least avoid sleeping with a
>>> kmap_local_page() map active.
>>>
>>> I figured, while page compression is probably to be considered "slow"
>>> it's probably not slow enough to motivate kmap() instead of
>>> kmap_local_page(), but if anyone feels differently, perhaps it should be
>>> considered.
>> What you say is all true.  But remember the mappings are only actually
>> created on a HIGHMEM system.  HIGHMEM systems are increasingly rare.  
>> Also
>> they must suffer such performance issues because there is just no other
>> way around supporting them.
>>
>> Also Sumitra, and our kmap conversion project in general, is focusing on
>> not using kmap* if at all possible.  Thus the reason V1 tried to use
>> page_address().
>>
>> Could we guarantee the i915 driver is excluded from all HIGHMEM systems?
> 
> The i915 maintainers might want to chime in here, but I would say no, we 
> can't, although we don't care much about optimizing for them. Same for 
> the new xe driver.

AFAIK i915 works on such systems so I don't think we can drop support 
just like that. Not sure what the process would be. Perhaps as part of a 
wider kernel deprecation would make most sense.

Regards,

Tvrtko
