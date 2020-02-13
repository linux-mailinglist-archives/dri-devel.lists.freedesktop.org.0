Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7B315CE98
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 00:23:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EB46E426;
	Thu, 13 Feb 2020 23:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6CD6E426;
 Thu, 13 Feb 2020 23:23:24 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e45da2a0000>; Thu, 13 Feb 2020 15:22:18 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 13 Feb 2020 15:23:23 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 13 Feb 2020 15:23:23 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Feb
 2020 23:23:23 +0000
Subject: Re: [Nouveau] [PATCH] nouveau: no need to check return value of
 debugfs_create functions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200209105525.GA1620170@kroah.com>
 <fdb35aa7-7e4a-c44f-94df-bd44585d4bef@nvidia.com>
 <20200213223931.GA3877216@kroah.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <482aafcb-a50f-1ec5-4e1b-3a1fb799464f@nvidia.com>
Date: Thu, 13 Feb 2020 15:23:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200213223931.GA3877216@kroah.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1581636138; bh=7wcDShWnkHYUQksh1CLg/vbAYj6TZCv5gD04JKo6+Wg=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=DU4lj1skqT1+veMtdgv6S/tZ1bTvQHS+sdPz9IkbsCcrURtVor/AdGmIZnWuYsBUz
 6FGhlUro9ukNlmui04+E9OnuFwbP4XhJfUcLN8iSwAKLSk3KHTfwuC9Vf/zjwFll3f
 QpuYn2xHs9qmN1l08a9+e793aiqRzAt1wOy/WCbverg+xeqHvCoThiiZ4i82E/60Xi
 5XuYOlv4grfVPZglv0K84Qk6JKXTzcJ1rMI83OBDXJUBkrpP5nI/YrczguOi7X/V6C
 1nZPCpIiHwXvwSTmahDSepx6lcOukDFl3foFqXpmKLoEga9pv4z+gBJSQIrOSqIN7z
 hfi99OSMyjHTw==
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/13/20 2:39 PM, Greg Kroah-Hartman wrote:
> On Thu, Feb 13, 2020 at 02:30:09PM -0800, John Hubbard wrote:
>> On 2/9/20 2:55 AM, Greg Kroah-Hartman wrote:
>>> When calling debugfs functions, there is no need to ever check the
>>> return value.  The function can work or not, but the code logic should
>>> never do something different based on this.
>>>
>>
>> Should we follow that line of reasoning further, and simply return void
>> from the debugfs functions--rather than playing whack-a-mole with this
>> indefinitely?
> 
> That is what we (well I) have been doing.  Look at all of the changes
> that have happened to include/linux/debugfs.h over the past few
> releases.  I'm slowly winnowing down the api to make it impossible to
> get wrong for this type of thing, and am almost there.
>


Oops, I see now that you have already been very busy with this. :)  
Looking good...


thanks,
-- 
John Hubbard
NVIDIA
 
> DRM is the big fish left to tackle, I have submitted some patches in the
> past, but lots more cleanup needs to be done to get them into mergable
> shape.  I just need to find the time...
>>
> thanks,
> 
> greg k-h
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
