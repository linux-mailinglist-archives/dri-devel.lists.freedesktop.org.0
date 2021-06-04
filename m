Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E926F39C661
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jun 2021 08:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425C46E8B5;
	Sat,  5 Jun 2021 06:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id E7A226E108
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 15:47:15 +0000 (UTC)
Received: from [192.168.86.35] (c-73-38-52-84.hsd1.vt.comcast.net
 [73.38.52.84])
 by linux.microsoft.com (Postfix) with ESMTPSA id AE8E520B7178;
 Fri,  4 Jun 2021 08:47:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AE8E520B7178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1622821635;
 bh=Ta7AVDVq80wxtJAhEMWvq0u4Gd9WlURarydMVI8XT1k=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=EvwSr33U36IyVGLo2CVg17brY69lpZrFsmUl6MgJ+yGjNKKMWS2uLcxj9J0FeLCtA
 JP4K36MdJ9ZcHXSVXw2eK5uSuCwqdCJ6lYnPC66W1FRf8UqbxqEbEG1vfI7nxVmDCf
 gNIn7BXiph6Hz0wJB+Qs0C71qlqG09i+yYUtgMP0=
Subject: Re: [bug report] Commit ccf953d8f3d6 ("fb_defio: Remove custom
 address_space_operations") breaks Hyper-V FB driver
To: Wei Liu <wei.liu@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>
References: <87v96tzujm.fsf@vitty.brq.redhat.com>
 <20210604130014.tkeozyn4wxdsr6o2@liuwe-devbox-debian-v2>
From: Vineeth Pillai <viremana@linux.microsoft.com>
Message-ID: <e5c90203-df8c-1e72-f77d-41db4ff5413f@linux.microsoft.com>
Date: Fri, 4 Jun 2021 11:47:13 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210604130014.tkeozyn4wxdsr6o2@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Sat, 05 Jun 2021 06:47:36 +0000
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
Cc: linux-hyperv@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michael Kelley <mikelley@microsoft.com>, Matthew Wilcox <willy@infradead.org>,
 linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/4/2021 9:00 AM, Wei Liu wrote:
> On Fri, Jun 04, 2021 at 02:25:01PM +0200, Vitaly Kuznetsov wrote:
>> Hi,
>>
>> Commit ccf953d8f3d6 ("fb_defio: Remove custom address_space_operations")
>> seems to be breaking Hyper-V framebuffer
>> (drivers/video/fbdev/hyperv_fb.c) driver for me: Hyper-V guest boots
>> well and plymouth even works but when I try starting Gnome, virtual
>> screen just goes black. Reverting the above mentioned commit on top of
>> 5.13-rc4 saves the day. The behavior is 100% reproducible. I'm using
>> Gen2 guest runing on Hyper-V 2019. It was also reported that Gen1 guests
>> are equally broken.
>>
>> Is this something known?
>>
> I've heard a similar report from Vineeth but we didn't get to the bottom
> of this.
I have just tried reverting the commit mentioned above and it solves the 
GUI freeze
I was also seeing. Previously, login screen was just freezing, but VM 
was accessible
through ssh. With the above commit reverted, I can login to Gnome.

Looks like I am also experiencing the same bug mentioned here.

Thanks,
Vineeth

