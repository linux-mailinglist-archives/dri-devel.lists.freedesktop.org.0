Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADBF1292A9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:11:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F206E1A7;
	Mon, 23 Dec 2019 08:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754486EAFA
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:03:38 +0000 (UTC)
Received: from lhreml709-cah.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id 966C17D17AC8464734A9;
 Thu, 19 Dec 2019 10:03:34 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml709-cah.china.huawei.com (10.201.108.32) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 19 Dec 2019 10:03:33 +0000
Received: from [127.0.0.1] (10.202.226.46) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 19 Dec
 2019 10:03:33 +0000
Subject: Re: Warnings in DRM code when removing/unbinding a driver
To: Daniel Vetter <daniel@ffwll.ch>
References: <07899bd5-e9a5-cff0-395f-b4fb3f0f7f6c@huawei.com>
 <f867543cf5d0fc3fdd0534749326411bcfc5e363.camel@collabora.com>
 <c2e5f5a5-5839-42a9-2140-903e99e166db@huawei.com>
 <fde72f73-d678-2b77-3950-d465f0afe904@huawei.com>
 <CAKMK7uFr03euoB6rY8z9zmRyznP41vwfdaKApZ_0HfYZT4Hq_w@mail.gmail.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <fcca5732-c7dc-6e1d-dcbe-bfd914a4295b@huawei.com>
Date: Thu, 19 Dec 2019 10:03:33 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFr03euoB6rY8z9zmRyznP41vwfdaKApZ_0HfYZT4Hq_w@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.46]
X-ClientProxiedBy: lhreml712-chm.china.huawei.com (10.201.108.63) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
Cc: dbueso@suse.de, "airlied@linux.ie" <airlied@linux.ie>,
 "Chenfeng \(puck\)" <puck.chen@hisilicon.com>, Linuxarm <linuxarm@huawei.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kongxinwei \(A\)" <kong.kongxinwei@hisilicon.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Ezequiel Garcia <ezequiel@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/12/2019 09:54, Daniel Vetter wrote:
> On Wed, Dec 18, 2019 at 7:08 PM John Garry <john.garry@huawei.com> wrote:
>>
>> +
>>
>> So the v5.4 kernel does not have this issue.
>>
>> I have bisected the initial occurrence to:
>>
>> commit 37a48adfba6cf6e87df9ba8b75ab85d514ed86d8
>> Author: Thomas Zimmermann <tzimmermann@suse.de>
>> Date:   Fri Sep 6 14:20:53 2019 +0200
>>
>>       drm/vram: Add kmap ref-counting to GEM VRAM objects
>>
>>       The kmap and kunmap operations of GEM VRAM buffers can now be called
>>       in interleaving pairs. The first call to drm_gem_vram_kmap() maps the
>>       buffer's memory to kernel address space and the final call to
>>       drm_gem_vram_kunmap() unmaps the memory. Intermediate calls to these
>>       functions increment or decrement a reference counter.
>>
>> So this either exposes or creates the issue.
> 
> Yeah that's just shooting the messenger.

OK, so it exposes it.

  Like I said, for most drivers
> you can pretty much assume that their unload sequence has been broken
> since forever. It's not often tested, and especially the hotunbind
> from a device (as opposed to driver unload) stuff wasn't even possible
> to get right until just recently.

Do you think it's worth trying to fix this for 5.5 and earlier, or just 
switch to the device-managed interface for 5.6 and forget about 5.5 and 
earlier?

Thanks,
John
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
