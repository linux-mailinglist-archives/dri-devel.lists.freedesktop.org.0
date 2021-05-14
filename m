Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6223B380C82
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 17:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7406EEAE;
	Fri, 14 May 2021 15:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA526EEAB;
 Fri, 14 May 2021 15:03:10 +0000 (UTC)
IronPort-SDR: g/f+nh9BL48xmipoDMXNr1iVDptu+XkCFih3mUJvB90yJMrzYi7qHZQynEHB15o1dhg8RI3PAZ
 GBQcWQpzI6Pw==
X-IronPort-AV: E=McAfee;i="6200,9189,9984"; a="285714065"
X-IronPort-AV: E=Sophos;i="5.82,300,1613462400"; d="scan'208";a="285714065"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2021 08:03:08 -0700
IronPort-SDR: ZL3EDOZzF4m0PijERz92q++EGnMt0CEKJKax/dDCpYx9VyN5WrQbVsFRvdXLyFHwdpYCaJk5TX
 3IcY4mgF43Nw==
X-IronPort-AV: E=Sophos;i="5.82,300,1613462400"; d="scan'208";a="393658662"
Received: from ankitsi2-mobl.ger.corp.intel.com (HELO [10.213.242.91])
 ([10.213.242.91])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2021 08:03:06 -0700
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
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <6cf2f14a-6a16-5ea3-d307-004faad4cc79@linux.intel.com>
Date: Fri, 14 May 2021 16:03:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b2203d34-2de3-7c58-de2f-bf6fafc3f67c@amd.com>
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


On 14/05/2021 15:56, Christian König wrote:
> Am 14.05.21 um 16:47 schrieb Tvrtko Ursulin:
>>
>> On 14/05/2021 14:53, Christian König wrote:
>>>>
>>>> David also said that you considered sysfs but were wary of exposing 
>>>> process info in there. To clarify, my patch is not exposing sysfs 
>>>> entry per process, but one per open drm fd.
>>>>
>>>
>>> Yes, we discussed this as well, but then rejected the approach.
>>>
>>> To have useful information related to the open drm fd you need to 
>>> related that to process(es) which have that file descriptor open. 
>>> Just tracking who opened it first like DRM does is pretty useless on 
>>> modern systems.
>>
>> We do update the pid/name for fds passed over unix sockets.
> 
> Well I just double checked and that is not correct.
> 
> Could be that i915 has some special code for that, but on my laptop I 
> only see the X server under the "clients" debugfs file.

Yes we have special code in i915 for this. Part of this series we are 
discussing here.

>>> But an "lsof /dev/dri/renderD128" for example does exactly what top 
>>> does as well, it iterates over /proc and sees which process has that 
>>> file open.
>>
>> Lsof is quite inefficient for this use case. It has to open _all_ open 
>> files for _all_ processes on the system to find a handful of ones 
>> which may have the DRM device open.
> 
> Completely agree.
> 
> The key point is you either need to have all references to an open fd, 
> or at least track whoever last used that fd.
> 
> At least the last time I looked even the fs layer didn't know which fd 
> is open by which process. So there wasn't really any alternative to the 
> lsof approach.

I asked you about the use case you have in mind which you did not 
answer. Otherwise I don't understand when do you need to walk all files. 
What information you want to get?

For the use case of knowing which DRM file is using how much GPU time on 
engine X we do not need to walk all open files either with my sysfs 
approach or the proc approach from Chris. (In the former case we 
optionally aggregate by PID at presentation time, and in the latter case 
aggregation is implicit.)

Regards,

Tvrtko
