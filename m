Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8896F3E45
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 09:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA4510E1FF;
	Tue,  2 May 2023 07:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dijkstra.felixrichter.tech (dijkstra.felixrichter.tech
 [37.120.184.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A89410E454;
 Mon,  1 May 2023 21:00:46 +0000 (UTC)
Received: from [10.130.10.1] (unknown [10.130.10.1])
 by dijkstra.felixrichter.tech (Postfix) with ESMTPSA id 5B5581A0201;
 Mon,  1 May 2023 23:01:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=felixrichter.tech;
 s=20210926; t=1682974873;
 bh=l4mT8NJ464Hh9X02LK4fhG7AyFEZIXxn9wWQXJKvD/E=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=ER1JsTp+SO5qrl+w0BfId9cfw+1HMydNadarutY9X9lyAeDDEdX+tOAwv7Jp4HFUB
 MpivM2UIQC8A3blkmTuTd4JC/e+i5SWUv5IIAcWsHJon+WoWtbdCx7Ll6WpzuSfkDY
 bU/KL9ELpKfAlJ3Ex/L70CdIFyEIHvzrhl0vDbfo=
Message-ID: <04749ee4-0728-92fe-bcb0-a7320279eaac@felixrichter.tech>
Date: Mon, 1 May 2023 23:00:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: PROBLEM: AMD Ryzen 9 7950X iGPU - Blinking Issue
Content-Language: en-US
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <46a7eb80-5f09-4f6a-4fd3-9550dafd497c@felixrichter.tech>
 <CADnq5_Nuu7hAFR6A8SqaENA_CUV_F3J1qgCwE=Yn_1rY-n5GLg@mail.gmail.com>
 <9525dac3-05d9-3943-c43a-e5b475e6088b@felixrichter.tech>
 <CADnq5_OsjBMOy4rT3z+y2zznW_28fOALbB=YPteiCmo=_V2N7g@mail.gmail.com>
From: Felix Richter <judge@felixrichter.tech>
In-Reply-To: <CADnq5_OsjBMOy4rT3z+y2zznW_28fOALbB=YPteiCmo=_V2N7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 02 May 2023 07:15:23 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01.05.23 20:47, Alex Deucher wrote:
> On Mon, May 1, 2023 at 2:44 PM Felix Richter <judge@felixrichter.tech> wrote:
>> On 01.05.23 15:27, Alex Deucher wrote:
>>> On Mon, May 1, 2023 at 3:20 AM Felix Richter <judge@felixrichter.tech> wrote:
>>>> Hi,
>>>>
>>>> I am running into an issue with the integrated GPU of the Ryzen 9 7950X. It seems to be a regression from kernel version 6.1 to 6.2.
>>>> The bug materializes in from of my monitor blinking, meaning it turns full white shortly. This happens very often so that the system becomes unpleasant to use.
>>>>
>>>> I am running the Archlinux Kernel:
>>>> The Issue happens on the bleeding edge kernel: 6.2.13
>>>> Switching back to the LTS kernel resolves the issue: 6.1.26
>>>>
>>>> I have two monitors attached to the system. One 42 inch 4k Display and a 24 inch 1080p Display and am running sway as my desktop.
>>>>
>>>> Let me know if there is more information I could provide to help narrow down the issue.
>>> It's related to scatter/gather display.  As a workaround, you can
>>> disable scatter/gather display by setting amd.sg_display=0 on the
>>> kernel command line in grub.  It's fixed properly in:
>>> https://gitlab.freedesktop.org/agd5f/linux/-/commit/08da182175db4c7f80850354849d95f2670e8cd9
>>> Which should land in Linus' tree this week.
>>>
>>> Alex
>> Thank you for your quick response. Sadly I have to report that using the
>> workaround kernel parameter did not resolve the issue for me. The
>> monitor still
>> turns full white although less frequently. I'll be sure to look out for
>> the update once it hits mainline ;)
> If the module parameter didn't help then perhaps you are seeing some
> other issue.  Can you bisect?
>
> Alex
>
>> Kind regards,
>> Felix
I would like to. I am currently stuck trying to figure out which commits 
in the archlinux tree refer to the lts release version. Sadly the 
versions are build from different sources. LTS from tarball from 
kernel.org and mainline from there own fork of linus tree. So the commit 
hashes are different and I can not easily figure out the good commit to 
start from.

Kind regards,
Felix

Edit: just noticed I forgot to hit "reply all" and send it to the list …
