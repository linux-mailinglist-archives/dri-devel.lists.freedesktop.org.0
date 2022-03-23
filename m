Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C53524E504A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 11:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0700210E668;
	Wed, 23 Mar 2022 10:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E78E010E668;
 Wed, 23 Mar 2022 10:26:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94AEBD6E;
 Wed, 23 Mar 2022 03:26:58 -0700 (PDT)
Received: from [10.57.43.230] (unknown [10.57.43.230])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 172953F73B;
 Wed, 23 Mar 2022 03:26:56 -0700 (PDT)
Message-ID: <cfd7b57e-0573-db04-3692-acedd20fb51e@arm.com>
Date: Wed, 23 Mar 2022 10:26:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 1/2] drm/qxl: replace ioremap by ioremap_cache on arm64
Content-Language: en-GB
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20220322093444.1236582-1-liucong2@kylinos.cn>
 <e2bc20e4-41e1-7162-257c-f2ad3309f1cb@amd.com>
 <a6acb2ce-2465-6619-e3fd-ac34ddf07d35@arm.com>
 <20220323101138.7oiwefh7ofcxojgq@sirius.home.kraxel.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220323101138.7oiwefh7ofcxojgq@sirius.home.kraxel.org>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, ray.huang@amd.com,
 Cong Liu <liucong2@kylinos.cn>, spice-devel@lists.freedesktop.org,
 airlied@redhat.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-03-23 10:11, Gerd Hoffmann wrote:
> On Wed, Mar 23, 2022 at 09:45:13AM +0000, Robin Murphy wrote:
>> On 2022-03-23 07:15, Christian Kï¿½nig wrote:
>>> Am 22.03.22 um 10:34 schrieb Cong Liu:
>>>> qxl use ioremap to map ram_header and rom, in the arm64 implementation,
>>>> the device is mapped as DEVICE_nGnRE, it can not support unaligned
>>>> access.
>>>
>>> Well that some ARM boards doesn't allow unaligned access to MMIO space
>>> is a well known bug of those ARM boards.
>>>
>>> So as far as I know this is a hardware bug you are trying to workaround
>>> here and I'm not 100% sure that this is correct.
>>
>> No, this one's not a bug. The Device memory type used for iomem mappings is
>> *architecturally* defined to enforce properties like aligned accesses, no
>> speculation, no reordering, etc. If something wants to be treated more like
>> RAM than actual MMIO registers, then ioremap_wc() or ioremap_cache() is the
>> appropriate thing to do in general (with the former being a bit more
>> portable according to Documentation/driver-api/device-io.rst).
> 
> Well, qxl is a virtual device, so it *is* ram.
> 
> I'm wondering whenever qxl actually works on arm?  As far I know all
> virtual display devices with (virtual) pci memory bars for vram do not
> work on arm due to the guest mapping vram as io memory and the host
> mapping vram as normal ram and the mapping attribute mismatch causes
> caching troubles (only noticeable on real arm hardware, not in
> emulation).  Did something change here recently?

Indeed, Armv8.4 introduced the S2FWB feature to cope with situations 
like this - essentially it allows the hypervisor to share RAM-backed 
pages with the guest without losing coherency regardless of how the 
guest maps them.

Robin.
