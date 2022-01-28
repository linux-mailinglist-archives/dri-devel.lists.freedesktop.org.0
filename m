Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8878349F5B7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 09:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AED10F3B7;
	Fri, 28 Jan 2022 08:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D16892F1;
 Fri, 28 Jan 2022 08:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643360085; x=1674896085;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/cfNHI/1fnG0b27p3MtXGThjSco0XchfLu0UcRpp3cs=;
 b=JkD3rgJm+eIfs7+c57RyCZEsgZBAfOc3aYovyvmehPv+dV9tJq2C6hXq
 37nh6JCJYu7Wuq4VlKoiiEA/Mo50pt1RfCIG9HLvcd4ZHxs4/0UxF7xxV
 JnoW8JXu6IQvecRu5x5aVD3jrALKen1V87n7qdYuPz95iJQp9hmEnbekY
 88BiMMAoOsOj+j6JAHaieQv8DS9cetR1hAfYTCcvgoKdqMQHE1ZolI2aT
 esIg4z4feZxxRzfuMZscdHOyk9mHiSgs/g56csRcC8L9zG8X9NRyfOrwX
 lkNrutp3161txB42TOii/kR0VWhehF7bob3HmjPeiVS9YFCga6CNgPyTc w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="227059356"
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="227059356"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:54:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="697026916"
Received: from rbresug-mobl.ger.corp.intel.com (HELO [10.252.55.61])
 ([10.252.55.61])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:54:42 -0800
Message-ID: <38412f9b-314c-65a7-87d3-0d5f67804aab@linux.intel.com>
Date: Fri, 28 Jan 2022 09:54:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Lock dpt_obj around
 set_cache_level, v2.
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220126073703.1215696-1-maarten.lankhorst@linux.intel.com>
 <fdea6db7-44e4-dcbc-548a-7888c089d25e@intel.com>
 <83aec5cf-2e5c-77ec-b716-0416551c3f2a@linux.intel.com>
 <27506ac8eff06662f063d563662555cb08f2ce64.camel@linux.intel.com>
 <982820d1-0d9a-ac01-e4f5-9a11556d8690@linux.intel.com>
 <44532d97-6701-93f2-dd06-4429b523f666@linux.intel.com>
 <e73bb44a-04fe-a7ca-abab-da1002ec9623@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <e73bb44a-04fe-a7ca-abab-da1002ec9623@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 27-01-2022 om 13:45 schreef Thomas Hellström:
>
> On 1/27/22 13:38, Maarten Lankhorst wrote:
>> Op 27-01-2022 om 13:09 schreef Thomas Hellström:
>>> On 1/27/22 13:05, Thomas Hellström wrote:
>>>>> The bug on vm_close is a separate bug, and would probably best be
>>>>> fixed in a separate patch.
>>>>>
>>>>> Could I get a r-b on this? It should fix some issues, even if the
>>>>> unbind there is a separate bug.
>>>>>
>>>>> ~Maarten
>>>>>
>>>> Recognizing that it doesn't fix the vm_close issue,
>>>>
>>>> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Oh, BTW should probably carefully review those seemingly unrelated stall warnings from BAT to check whether the newly introduced object lock might stall a workqueue causing those.
>>>
>>> /Thomas
>> Which ones? I mostly see ext4 failures, where it doesn't seem to have any i915 lock held at all.
>>
> Oh, I was looking at v1 version of the patch, but just noticed a hang. Didn't look to carefully at what was the cause.
>
> /Thomas
>
>
Thanks, pushed!

