Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F9967FD89
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jan 2023 09:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1BD10E186;
	Sun, 29 Jan 2023 08:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAA810E186
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 08:11:26 +0000 (UTC)
Received: from fsav119.sakura.ne.jp (fsav119.sakura.ne.jp [27.133.134.246])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 30T8BKFv033866;
 Sun, 29 Jan 2023 17:11:20 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav119.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav119.sakura.ne.jp);
 Sun, 29 Jan 2023 17:11:20 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav119.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 30T8BKmt033863
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 29 Jan 2023 17:11:20 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <bb654908-4cd2-c6a5-c1f0-ee64c5a75078@I-love.SAKURA.ne.jp>
Date: Sun, 29 Jan 2023 17:11:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [vmwgfx] crash upon vmw_open_channel() when booting on Oracle VM
 VirtualBox
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
References: <c59cbadb-7671-2d7c-d535-24f41aff18cc@I-love.SAKURA.ne.jp>
 <34c6e0413acb43d746e7dc95e0886ea22fd1cc82.camel@vmware.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <34c6e0413acb43d746e7dc95e0886ea22fd1cc82.camel@vmware.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/01/29 15:00, Zack Rusin wrote:
> On Sat, 2023-01-28 at 20:44 +0900, Tetsuo Handa wrote:
>> Hello.
>>
>> I noticed that a kernel built with vmwgfx driver fails to boot a Linux guest
>> on Oracle VM VirtualBox 7.0.4 on Windows 11 on DELL Inspiron 14 5420.
>> I didn't notice this problem when I booted an older kernel on an older version
>> of Oracle VM VirtualBox on Windows 8.1 on an older PC.
>>
>> The location that crashes is
>>
>>         VMW_PORT(VMW_PORT_CMD_OPEN_CHANNEL,
>>                 (protocol | GUESTMSG_FLAG_COOKIE), si, di,
>>                 0,
>>                 VMW_HYPERVISOR_MAGIC,
>>                 eax, ebx, ecx, edx, si, di);
>>
>> in vmw_open_channel(). It might be that some changes in VirtualBox side
>> is conflicting with how VMware tries to test if the guest is VMware.
>> How can I debug this problem?
> 
> You'd have to figure out what exactly is the problem. I couldn't reproduce it on
> vmware hypervisors with your .config.

This problem happens on not VMware hypervisors but VirtualBox hypervisors. 

>                                       FWIW that code has been there and hasn't been
> changed in years. Oracle emulated svga device always had problems, was never
> supported by vmwgfx and afaict is not maintained by Oracle so I'd strongly suggest
> that you switch to some other graphics device on virtualbox.

Indeed, not selecting VMSVGA as Graphics Controller in the screen tab of display
setting allowed me to boot the guest.

The reason I built-in vmwgfx is that I want to reuse the same kernel configuration on
multiple environments; syzbot uses a large kernel configuration that builts-in almost
everything.

> 
> In the meantime I think the attached patch should at least get you booting. You can
> give it a try and if it works I can push it sometime this week.

Yes, this patch allowed me to boot the guest when selecting VMSVGA as Graphics Controller.

Thank you.

