Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD96662490
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 12:48:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003F610E3E8;
	Mon,  9 Jan 2023 11:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD6610E3E6
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 11:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673264889; x=1704800889;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fM/va18LoRHTWRRQfPUDWc+PQrs1F2EYgU8kCndc2NY=;
 b=l3AcEM4NzWCw++yvwrSyHEO+AVkoLk5nggasJuL2Cr+o3UZRyNucdEcE
 c72PliuA4LGGBuHIYWIHnzHLXobYtCNMChu7SC95XBjzduH+SQWxCEgdd
 FBTtU4ZR5MaQ5ckOodBmdNLk1GS7FuYCsXIiRi1zYFlSGGNyOwI0+Urbl
 s+W+23eOh09heQDD7W9NcWB0XHPVLE774M6UTZJNvjT7Aovt5g9pVx+iX
 R7kIXKCpggajS7v58MNuCnbIHpb761r3ZJwxMb2GUWfZKXE8sG+WSYtHe
 uO8fQyoS/+UStrv0LRPze6YFbzFTiEkNqx2SK0mnZ9bORhrqUUzkCPmQv g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="321557189"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="321557189"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 03:48:07 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="725139625"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="725139625"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.157.189])
 ([10.249.157.189])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 03:48:05 -0800
Message-ID: <87fe183b-c487-161d-b57b-08c38fd751ab@linux.intel.com>
Date: Mon, 9 Jan 2023 12:47:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 3/7] accel/ivpu: Add GEM buffer object management
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Andrew Davis <afd@ti.com>
References: <20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com>
 <20221208110733.5498-4-jacek.lawrynowicz@linux.intel.com>
 <5b068dd9-1363-f611-9f86-acc224c10621@ti.com>
 <20230106132951.GE1586324@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230106132951.GE1586324@linux.intel.com>
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
Cc: andrzej.kacprowski@linux.intel.com, quic_jhugo@quicinc.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 06.01.2023 14:29, Stanislaw Gruszka wrote:
> Hi
> 
> On Thu, Jan 05, 2023 at 12:46:51PM -0600, Andrew Davis wrote:
>> On 12/8/22 5:07 AM, Jacek Lawrynowicz wrote:
>>> Adds four types of GEM-based BOs for the VPU:
>>>    - shmem
>>>    - userptr
>>
>> Do you have some specific need for userptr that would not
>> be covered by prime import + heaps? I'm just trying to get
>> a feel for the typical use-cases for these.
> 
> Honestly, I'm not sure. I think we have use-cases that justify
> adding userptr, but have to check with our team members that
> better understand the requirements.

It would be great if userptr could be replaced by dma-buf heaps.
I will add this to TODO and we will look into this after the driver is merged.

Regards,
Jacek
