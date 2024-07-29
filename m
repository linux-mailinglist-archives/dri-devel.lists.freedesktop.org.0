Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2508093FF83
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 22:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F3B10E055;
	Mon, 29 Jul 2024 20:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="VOXTlI3C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msa.smtpout.orange.fr (smtp-75.smtpout.orange.fr [80.12.242.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C659010E055
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 20:30:36 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id YX0rsofdW6NRTYX0rsbYtL; Mon, 29 Jul 2024 22:30:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1722285035;
 bh=KGacKLXgEMga9PvcN1pKMM3xGXU2O6qYmPh2vo3fje4=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=VOXTlI3C1yxm634ADdu8Ct0o6s57EC3ZmzkKkHi4UEEyUM5Ff3xYey7pjbXDkEGXP
 b2veknTxzzFBd+nyXJMGozbIRfnGS0nG8PDwHepOnvAgHBa1RgvXmdN7kbuoJSFWwT
 mYaPI3lYB1mflwqU1VVP7CAgiHEMfLTu9C+y+87iC5OuOMbjGiu31ZAwIElJPS9ebz
 hm3mpi6JRREhYGPuYBRs0RCz61lKYc7lpDQCda3nFbylvaTMyliq50lDXj1Kk5aM22
 tVr1ExmHPmYAXUDOAIPcElpfSMGm689kiNJDkzs0KY+yDcOWvGfVTkYCyLk1r/9HiW
 yaKvq2NxhadjQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 29 Jul 2024 22:30:35 +0200
X-ME-IP: 90.11.132.44
Message-ID: <aa9fd67e-3498-4152-abbd-3f2f40b0e294@wanadoo.fr>
Date: Mon, 29 Jul 2024 22:30:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/hpfb: Fix an error handling path in hpfb_dio_probe()
To: Helge Deller <deller@gmx.de>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <dc4fe3d857849ac63131c5620f1bacf1a3d7172e.1722191367.git.christophe.jaillet@wanadoo.fr>
 <698958fb-4fc8-4288-b067-5843c651b093@gmx.de>
 <ac4c6712-c47b-4414-9640-3018bf09e8fa@suswa.mountain>
 <9dbb2b52-4fc9-4bbf-a6a2-ab6ec32adb8f@gmx.de>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <9dbb2b52-4fc9-4bbf-a6a2-ab6ec32adb8f@gmx.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 29/07/2024 à 22:09, Helge Deller a écrit :
> On 7/29/24 17:59, Dan Carpenter wrote:
>> On Mon, Jul 29, 2024 at 10:13:17AM +0200, Helge Deller wrote:
>>> On 7/28/24 20:29, Christophe JAILLET wrote:
>>>> If an error occurs after request_mem_region(), a corresponding
>>>> release_mem_region() should be called, as already done in the remove
>>>> function.
>>>
>>> True.
>>>
>>>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>>>
>>> I think we can drop this "Fixes" tag, as it gives no real info.
>>
>> If we're backporting patches then these tags really are useful.  As
>> I've been doing more and more backporting, I've come to believe this
>> more firmly.
> 
> Sure, "Fixes" tags are useful, but only if they really refer
> to another patch which introduced the specific issue.
> 
> But the tag 1da177e4c3f4 ("Linux-2.6.12-rc2") isn't useful, as it's
> just the initial git commit. It has no relation to why release_mem_region()
> might have been initially missed. See:

I agree that the description of this specific tag is not useful by itself.

But at least it means: should it be backported, it can be done up to 
there. (and sometimes LWN gives some statistics on how long it took to 
fix an "issue", should it be considered as such)

Without it, it is not easy to guess in which branch the patch is meaningful.

I'll sent a v2 with your suggested minimal change, but I'll keep the 
Fixes tag.


Up to you to remove it or not, and to add a <stable@kernel.org> or a 
<stable+noautosel@kernel.org> or none of them.

Any solution is fine with me.


> 
>   commit 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 (tag: v2.6.12-rc2)
> Author: Linus Torvalds <torvalds@ppc970.osdl.org>
> Date:   Sat Apr 16 15:20:36 2005 -0700
> 
>      Linux-2.6.12-rc2
> 
>      Initial git repository build. I'm not bothering with the full history,
>      even though we have it. We can create a separate "historical" git
>      archive of that later if we want to, and in the meantime it's about
>      3.2GB when imported into git - space that would just make the early
>      git days unnecessarily complicated, when we don't have a lot of good
>      infrastructure for it.
> 
> Helge
> 
> 

On:

 > HP300 are old HP machines with an m68k CPU.
 > Not sure if someone still has such a machine 🙂

so it really was the one I found on wikipedia, LoL!

So, another way to "fix" the issue is maybe to deprecate the driver or 
everything related to this old architecture?

No strong opinion about it.

CJ
