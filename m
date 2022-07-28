Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA90C583CCD
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 13:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30880113293;
	Thu, 28 Jul 2022 11:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 810 seconds by postgrey-1.36 at gabe;
 Thu, 28 Jul 2022 11:03:33 UTC
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C86112B67
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 11:03:33 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26S84P8O013301;
 Thu, 28 Jul 2022 05:49:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=DRVfCCRNsnENGtq2cW3SlRNLo38VF3FslJXOnUBH2UI=;
 b=O3/dbz7qB27x+Zq9tOBxX5vHJ6WO2OynJc6HdqSDPj282EG1rRyx523RxjJExlk8fhWY
 RVYDG/HxmFU0NByOqX3EHJmI79rU6OmPMZSCKDx+XcQpRr5uzpAWzIxWAaZrxXfhyHmA
 WBBTi//v2uGinHVxf4jWy0v/ksD3UFySA8iKhjC+UyWOfWD+WgFef4rkyTEiRNBPcTuf
 Hm2jSxt9SV1BCVgvSzyZ5lnZojUvVF67NlqZMPqRU4BVw8TAHns6kksMVaY6nWbutZd4
 DcorerWFgWvq84c57GTjfOkiNimS23qEVZcgVd16drzFXLkItZHlvEw79bfkHiF4mXid dQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3hgddp6dba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jul 2022 05:49:59 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Thu, 28 Jul
 2022 05:49:58 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Thu, 28 Jul 2022 05:49:58 -0500
Received: from [198.90.251.95] (edi-sw-dsktp-006.ad.cirrus.com [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 266D72C5;
 Thu, 28 Jul 2022 10:49:58 +0000 (UTC)
Message-ID: <85bb9c36-33e9-c3e2-1838-9ef45311669b@opensource.cirrus.com>
Date: Thu, 28 Jul 2022 11:49:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] component: try_module_get() to prevent unloading while in
 use
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20220725160859.1274472-1-rf@opensource.cirrus.com>
 <Yt7cT66p0Bn+aXn5@kroah.com>
 <4165774b-2b96-83d1-67eb-f7c49dd8041e@opensource.cirrus.com>
 <YuAkQtik4ud6xw8L@kroah.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <YuAkQtik4ud6xw8L@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: naVEaElw3sYTSuWtQs-l5VtxEAuGjdDA
X-Proofpoint-ORIG-GUID: naVEaElw3sYTSuWtQs-l5VtxEAuGjdDA
X-Proofpoint-Spam-Reason: safe
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
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rafael@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/07/2022 18:28, Greg KH wrote:
> On Tue, Jul 26, 2022 at 11:32:28AM +0100, Richard Fitzgerald wrote:
>> On 25/07/2022 19:09, Greg KH wrote:
>>> On Mon, Jul 25, 2022 at 05:08:59PM +0100, Richard Fitzgerald wrote:
>>>> Call try_module_get() on a component before attempting to call its
>>>> bind() function, to ensure that a loadable module cannot be
>>>> unloaded while we are executing its bind().
>>>
>>> How can bind be called while the module is unloaded?
>>>
>>
>> I didn't say it could. What I said is "unloaded while we are executing
>> its bind()". Maybe that's already guaranteed to be safe somehow. It's
>> actually the problem below that I was trying to fix but placing the
>> try_module_get() before the bind() rather than after bind() seemed a
>> trivial extra safety.
> 
> It should be safe, bind() can't race with module remove as the driver
> core locks will handle this.
> 
>>>> If the bind is successful the module_put() is called only after it
>>>> has been unbound. This ensures that the module cannot be unloaded
>>>> while it is in use as an aggregate device.
>>>
>>> That's almost never the correct thing to do, what problem is this
>>> solving?
>>>
>>
>> What I see is that when a loadable module has been made part of an
>> aggregate it is still possible to rmmod'd it.
>>
>> An alternative workaround would be for the parent to softdep to every
>> driver that _might_ provide the aggregated components. Softdeps aren't
>> unusual (we use it in some drivers that are directly related but don't
>> directly link into each other). But to me this feels like a hack when
>> used with the component framework - isn't the idea that the parent
>> doesn't know (or doesn't need to know) which drivers will be aggregated?
>> Wouldn't it be better that when a component driver is bound into an
>> aggregate its module is automatically marked in-use?
>>
>> If there's a better way to mark the module in-use while is it bound
>> into an aggregate, let me know and I'll look at implementing it.
> 
> No module references should be incremented if a device is bound to a
> driver, that's the old (1990's) way of thinking.  If a module wants to
> be unloaded, let it, and clean up everything that it was
> controlling/talking to before the module remove is finished.
> 
> That's the way all busses should be working, you don't increment a
> module count when a driver binds to a device, otherwise how would you
> unload a module that was being used at all?
> 
> So just remove the components controlled by the module properly when it
> is removed and all should be good.
> 
> Do you have example code in the kernel tree today that does not properly
> do this?  Why not just fix that instead?
> 

The actual code I'm working on isn't upstream yet, but it's a derivative
of the way these two interoperate:
  sound/pci/hda/patch_realtek
  sound/pci/hda/cs35l41_hda.c

In these systems the host audio interface is HDA but the amps are not
HDA devices. Audio goes through the Realtek HDA codec to the amp but
the amp is on a different bus (i2c or spi). The modules in the HDA stack
all get marked as in-use, but the amp driver doesn't. So if it's
unloaded the audio system is left in a limbo state where ALSA and the
HDA stack are still up but the amp driver code has gone.

However I realised that my try_module_get() isn't a fix anyway.
It's claiming use of the module implementing the component but not
of the bus that owns that module. I assume that's what you were
referring to by having to deal with an unload instead of trying to
prevent the unload.

(And yes, I'm aware that in that patch_realtek.c it's missing
locking around the shared struct to prevent it being accessed during a
bind and unbind.)

> thanks,
> 
> greg k-h
