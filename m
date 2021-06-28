Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDAB3B5C67
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 12:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA286E419;
	Mon, 28 Jun 2021 10:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D8B6E417;
 Mon, 28 Jun 2021 10:18:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10028"; a="293561775"
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="293561775"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 03:18:19 -0700
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="419117739"
Received: from sankeeth-mobl.ger.corp.intel.com (HELO [10.213.225.79])
 ([10.213.225.79])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 03:18:17 -0700
Subject: Re: [PATCH 0/7] Per client engine busyness
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Nieto, David M" <David.Nieto@amd.com>, Alex Deucher <alexdeucher@gmail.com>
References: <20210513110002.3641705-1-tvrtko.ursulin@linux.intel.com>
 <CADnq5_NEg4s2AWBTkjW7NXoBe+WB=qQUHCMPP6DcpGSLbBF-rg@mail.gmail.com>
 <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
 <CADnq5_N03pz6GmptzhRnCRQH=qkd4eWuAbuUysHp-A9NZHQMHg@mail.gmail.com>
 <BYAPR12MB2840AA68BCAEBD9279C6184FF4509@BYAPR12MB2840.namprd12.prod.outlook.com>
 <39ccc2ef-05d1-d9f0-0639-ea86bef58b80@amd.com>
 <7d6d09fe-ec85-6aaf-9834-37a49ec7d6c5@linux.intel.com>
 <9144f63b-953d-2019-742d-6553e09f5b40@amd.com>
 <22e7d6ea-f2dd-26da-f264-b17aad25af95@linux.intel.com>
 <b2203d34-2de3-7c58-de2f-bf6fafc3f67c@amd.com>
 <6cf2f14a-6a16-5ea3-d307-004faad4cc79@linux.intel.com>
 <a2b03603-eb3e-7bef-a799-c15cfb1a8e0b@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <52dc8610-de57-a5a8-9a1d-0efebb29b881@linux.intel.com>
Date: Mon, 28 Jun 2021 11:16:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a2b03603-eb3e-7bef-a799-c15cfb1a8e0b@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14/05/2021 16:10, Christian König wrote:
> Am 14.05.21 um 17:03 schrieb Tvrtko Ursulin:
>>
>> On 14/05/2021 15:56, Christian König wrote:
>>> Am 14.05.21 um 16:47 schrieb Tvrtko Ursulin:
>>>>
>>>> On 14/05/2021 14:53, Christian König wrote:
>>>>>>
>>>>>> David also said that you considered sysfs but were wary of 
>>>>>> exposing process info in there. To clarify, my patch is not 
>>>>>> exposing sysfs entry per process, but one per open drm fd.
>>>>>>
>>>>>
>>>>> Yes, we discussed this as well, but then rejected the approach.
>>>>>
>>>>> To have useful information related to the open drm fd you need to 
>>>>> related that to process(es) which have that file descriptor open. 
>>>>> Just tracking who opened it first like DRM does is pretty useless 
>>>>> on modern systems.
>>>>
>>>> We do update the pid/name for fds passed over unix sockets.
>>>
>>> Well I just double checked and that is not correct.
>>>
>>> Could be that i915 has some special code for that, but on my laptop I 
>>> only see the X server under the "clients" debugfs file.
>>
>> Yes we have special code in i915 for this. Part of this series we are 
>> discussing here.
> 
> Ah, yeah you should mention that. Could we please separate that into 
> common code instead? Cause I really see that as a bug in the current 
> handling independent of the discussion here.

What we do in i915 is update the pid and name when a task different to 
the one which opened the fd does a GEM context create ioctl.

Moving that to DRM core would be along the lines of doing the same check 
and update on every ioctl. Maybe allow the update to be one time only if 
that would work. Would this be desirable and acceptable? If so I can 
definitely sketch it out.

Regards,

Tvrtko
