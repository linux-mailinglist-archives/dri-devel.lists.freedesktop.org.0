Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 806C8662E2C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 19:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3F110E4DB;
	Mon,  9 Jan 2023 18:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9C510E4E3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 18:09:14 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 309I9CSW129309;
 Mon, 9 Jan 2023 12:09:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1673287752;
 bh=z6Jz6iasahTBkQMB+SG8lr9uKH9K7ZN2CVXIZPIv3PI=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=qSudw0hN6z8q+jxk4OHo+Joqos/B7MenADNmMRv7DmX21J9N50b/4EAfph9ewJC7P
 Kal3uY+S99RjmAEy5zG9oWrTQzu3XQzGDm/UhPjPEBHIy6DFtHkCYFcpdSA19ie+XD
 6WUUb6a+KyQ8YTaGLfv15g42t4WXeK/o7gnTznmA=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 309I9CiK009575
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Jan 2023 12:09:12 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 9
 Jan 2023 12:09:11 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 9 Jan 2023 12:09:11 -0600
Received: from [10.250.34.87] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 309I9AtP036888;
 Mon, 9 Jan 2023 12:09:11 -0600
Message-ID: <fce001ec-9c2e-a10f-807c-8ed975e0511f@ti.com>
Date: Mon, 9 Jan 2023 12:09:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 3/7] accel/ivpu: Add GEM buffer object management
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, Stanislaw Gruszka
 <stanislaw.gruszka@linux.intel.com>
References: <20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com>
 <20221208110733.5498-4-jacek.lawrynowicz@linux.intel.com>
 <5b068dd9-1363-f611-9f86-acc224c10621@ti.com>
 <20230106132951.GE1586324@linux.intel.com>
 <87fe183b-c487-161d-b57b-08c38fd751ab@linux.intel.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <87fe183b-c487-161d-b57b-08c38fd751ab@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: andrzej.kacprowski@linux.intel.com, quic_jhugo@quicinc.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/9/23 5:47 AM, Jacek Lawrynowicz wrote:
> Hi,
> 
> On 06.01.2023 14:29, Stanislaw Gruszka wrote:
>> Hi
>>
>> On Thu, Jan 05, 2023 at 12:46:51PM -0600, Andrew Davis wrote:
>>> On 12/8/22 5:07 AM, Jacek Lawrynowicz wrote:
>>>> Adds four types of GEM-based BOs for the VPU:
>>>>     - shmem
>>>>     - userptr
>>>
>>> Do you have some specific need for userptr that would not
>>> be covered by prime import + heaps? I'm just trying to get
>>> a feel for the typical use-cases for these.
>>
>> Honestly, I'm not sure. I think we have use-cases that justify
>> adding userptr, but have to check with our team members that
>> better understand the requirements.
> 
> It would be great if userptr could be replaced by dma-buf heaps.
> I will add this to TODO and we will look into this after the driver is merged.
> 

We should also be clear on the export capabilities up front
for these kinds of drivers. DRM allows re-exporting as DMA-BUF
no matter the allocation style/location which has caused issues.
Lets start accel framework with the rule that if you want a shareable
buffer you should allocate it from Heaps not the driver, then pass
it into the driver.

Merging as-is to save churn now would be fine, but it must be clear
that this is not a stable ABI just because it was allowed to be
merged. userptr/export will be removed later and should not be used
by the userspace driver.

Andrew

> Regards,
> Jacek
