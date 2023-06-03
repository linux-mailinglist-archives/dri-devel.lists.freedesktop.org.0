Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4BF7213D1
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 01:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CEC010E00E;
	Sat,  3 Jun 2023 23:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dijkstra.felixrichter.tech (dijkstra.felixrichter.tech
 [37.120.184.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB8210E090;
 Sat,  3 Jun 2023 14:52:04 +0000 (UTC)
Received: from [10.130.10.1] (unknown [10.130.10.1])
 by dijkstra.felixrichter.tech (Postfix) with ESMTPSA id 74B5E1A11E3;
 Sat,  3 Jun 2023 16:52:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=felixrichter.tech;
 s=20210926; t=1685803930;
 bh=++KCYjmX9uo0LGttOcVGQ/FxfudHb6hFvPLyCTBafY4=;
 h=Date:From:To:Cc:References:Subject:In-Reply-To;
 b=ULhFkocjTufsZ/lUVX7AIhHa1mIhpamocWhxoWkJZRHy6ZWXoqr/83KkbTW6tsxcL
 khcLPWv8MU936WxQ9xhF5KjKj34/Rol1PI8OaKAmQbsuv3rgQd1B3+DuBmpQwDYU6E
 O/DGaQFRPdjOd2Z5JFvjI2zJXno/Dm2AFL3OzrrE=
Content-Type: multipart/mixed; boundary="------------jdDldEW0mALp7eOLhAsN1b2c"
Message-ID: <e24373f9-4405-d7f7-dd54-d0bde111242c@felixrichter.tech>
Date: Sat, 3 Jun 2023 16:52:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: Felix Richter <judge@felixrichter.tech>
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Alex Deucher <alexdeucher@gmail.com>
References: <46a7eb80-5f09-4f6a-4fd3-9550dafd497c@felixrichter.tech>
 <1efbf587-e7b5-74a3-89e4-ca70386bd191@leemhuis.info>
 <CADnq5_M-5SD6HDRVtFHPNF3q9XKz75PECdUxR-OaVpPe2Zw=EQ@mail.gmail.com>
 <8d23a70e-b132-9b25-917a-1f45918533cc@leemhuis.info>
 <0cac032a-0f65-5134-cde5-f535fc58c5ab@felixrichter.tech>
 <e7eed5ce-e7a0-e03e-f8c7-3582d9771a33@leemhuis.info>
Content-Language: en-US
Subject: Re: PROBLEM: AMD Ryzen 9 7950X iGPU - Blinking Issue
In-Reply-To: <e7eed5ce-e7a0-e03e-f8c7-3582d9771a33@leemhuis.info>
X-Mailman-Approved-At: Sat, 03 Jun 2023 23:51:50 +0000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------jdDldEW0mALp7eOLhAsN1b2c
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Guys,

sorry for the silence from my side. I had a lot of things to take care 
of after returning from vacation. Also I had to wait on the zfs modules 
to be updated to support kernel 6.3 for further testing.

The bad news is that I am still experiencing issues. I have been able to 
get a reproducible trigger for the buggy behavior. The moment I take a 
screenshot or any other program like `wdisplays` accesses the screen 
buffer the screen starts flickering. The only way to reset it is to 
reboot the machine or log out of the desktop.

With this I did a bisection to figure out which commit is responsible 
for this. I attached the logs to the mail. The short version is that I 
identified commit 81d0bcf9900932633d270d5bc4a54ff599c6ebdb as the 
culprit. Seems that there are side effects of having more flexible 
buffer placement for the case of the internal GPU. To verify that this 
actually is the cause of the issue I built the current archlinux kernel 
with an extra patch to revert the commit: 
https://github.com/ju6ge/linux/tree/v6.3.5-ju6ge. The result is that be 
bug is fixed!

Now if this is the desired long term fix I do not know …

Kind regards,
Felix Richter

On 02.05.23 16:12, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 02.05.23 15:48, Felix Richter wrote:
>> On 5/2/23 15:34, Linux regression tracking (Thorsten Leemhuis) wrote:
>>> On 02.05.23 15:13, Alex Deucher wrote:
>>>> On Tue, May 2, 2023 at 7:45 AM Linux regression tracking (Thorsten
>>>> Leemhuis)<regressions@leemhuis.info>  wrote:
>>>>
>>>>> On 30.04.23 13:44, Felix Richter wrote:
>>>>>> Hi,
>>>>>>
>>>>>> I am running into an issue with the integrated GPU of the Ryzen 9
>>>>>> 7950X. It seems to be a regression from kernel version 6.1 to 6.2.
>>>>>> The bug materializes in from of my monitor blinking, meaning it
>>>>>> turns full white shortly. This happens very often so that the
>>>>>> system becomes unpleasant to use.
>>>>>>
>>>>>> I am running the Archlinux Kernel:
>>>>>> The Issue happens on the bleeding edge kernel: 6.2.13
>>>>>> Switching back to the LTS kernel resolves the issue: 6.1.26
>>>>>>
>>>>>> I have two monitors attached to the system. One 42 inch 4k Display
>>>>>> and a 24 inch 1080p Display and am running sway as my desktop.
>>>>>>
>>>>>> Let me know if there is more information I could provide to help
>>>>>> narrow down the issue.
>>>>> Thanks for the report. To be sure the issue doesn't fall through the
>>>>> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
>>>>> tracking bot:
>>>>>
>>>>> #regzbot ^introduced v6.1..v6.2
>>>>> #regzbot title drm: amdgpu: system becomes unpleasant to use after
>>>>> monitor starts blinking and turns full white
>>>>> #regzbot ignore-activity
>>>>>
>>>>> This isn't a regression? This issue or a fix for it are already
>>>>> discussed somewhere else? It was fixed already? You want to clarify
>>>>> when
>>>>> the regression started to happen? Or point out I got the title or
>>>>> something else totally wrong? Then just reply and tell me -- ideally
>>>>> while also telling regzbot about it, as explained by the page listed in
>>>>> the footer of this mail.
>>>>>
>>>>> Developers: When fixing the issue, remember to add 'Link:' tags
>>>>> pointing
>>>>> to the report (the parent of this mail). See page linked in footer for
>>>>> details.
>>>> This sounds exactly like the issue that was fixed in this patch which
>>>> is already on it's way to Linus:
>>>> https://gitlab.freedesktop.org/agd5f/linux/-/commit/08da182175db4c7f80850354849d95f2670e8cd9
>>> FWIW, you in the flood of emails likely missed that this is the same
>>> thread where you yesterday replied "If the module parameter didn't help
>>> then perhaps you are seeing some other issue.  Can you bisect?". That's
>>> why I decided to add this to the tracking. Or am I missing something
>>> obvious here?
>>>
>>> /me looks around again and can't see anything, but that doesn't have to
>>> mean anything...
>>>
>>> Felix, btw, this guide might help you with the bisection, even if it's
>>> just for kernel compilation:
>>>
>>> https://docs.kernel.org/next/admin-guide/quickly-build-trimmed-linux.html
>>>
>>> And to indirectly reply to your mail from yesterday[1]. You might want
>>> to ignore the arch linux kernel git repo and just do a bisection between
>>> 6.1 and the latest 6.2.y kernel using upstream repos; and if I were you
>>> I'd also try 6.3 or even mainline before that, in case the issue was
>>> fixed already.
>>>
>>> [1]
>>> https://lore.kernel.org/all/04749ee4-0728-92fe-bcb0-a7320279eaac@felixrichter.tech/
>>>
>> Thanks for the pointers, I'll do a bisection on my desktop from 6.1 to
>> the newest commit.
> FWIW, I wonder what you actually mean with "newest commit" here: a
> bisection between 6.1 and mainline HEAD might be a waste of time, *if*
> this is something that only happens in 6.2.y (say due to a broken or
> incomplete backport)
>
>> That was the part I was mostly unsure about … where
>> to start from.
>>
>> I was planning to use PKGBUILD scripts from arch to achieve the same
>> configuration as I would when installing
>> the package and just rewrite the script to use a local copy of the
>> source code instead of the repository.
>> That way I can just use the bisect command, rebuild the package and test
>> again.
> In my experience trying to deal with Linux distro's package managers
> creates more trouble than it's worth.
>
>> But I probably won't be able to finish it this week, since I am on
>> vacation starting tomorrow and will not have access to the computer in
>> question. I will be back next week, by that time the patch Alex is
>> talking about might
>> already be in mainline. So if that fixes it, I will notice and let you
>> know. If not I will do the bisection to figure out what the actual issue
>> is.
> Enjoy your vacation!
>
> Ciao, Thorsten

--------------jdDldEW0mALp7eOLhAsN1b2c
Content-Type: text/x-log; charset=UTF-8; name="bisect_final.log"
Content-Disposition: attachment; filename="bisect_final.log"
Content-Transfer-Encoding: base64

Z2l0IGJpc2VjdCBzdGFydAojIFN0YXR1czogd2FydGUgYXVmIGd1dGVuIHVuZCBzY2hsZWNo
dGVuIENvbW1pdAojIGJhZDogWzU1YzdkNmE5MWQ0MmFkOThjYmZiMTBkYTA3N2NlOGJiNzA4
NGRjMGVdIE1lcmdlIHRhZyAnZHJtLW5leHQtMjAyMi0xMi0yMycgb2YgZ2l0Oi8vYW5vbmdp
dC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybQpnaXQgYmlzZWN0IGJhZCA1NWM3ZDZhOTFkNDJh
ZDk4Y2JmYjEwZGEwNzdjZThiYjcwODRkYzBlCiMgU3RhdHVzOiB3YXJ0ZSBhdWYgZ3V0ZShu
KSBDb21taXQocyksIHNjaGxlY2h0ZXIgQ29tbWl0IGJla2FubnQKIyBnb29kOiBbMWViMjA2
MjA4YjBmM2Y3MDdjNjcxMzRlZjZiYTM5NDQxMGVmZmI2N10gYmxvY2ssIGJmcTogb25seSBk
byBjb3VudGluZyBvZiBwZW5kaW5nLXJlcXVlc3QgZm9yIEJGUV9HUk9VUF9JT1NDSEVECmdp
dCBiaXNlY3QgZ29vZCAxZWIyMDYyMDhiMGYzZjcwN2M2NzEzNGVmNmJhMzk0NDEwZWZmYjY3
CiMgZ29vZDogW2RkNmY5YjE3Y2Q3YWY2OGI2YTUwOTBkZWVkZjFmNWU4NGY2NmY0ZTZdIE1l
cmdlIHRhZyAndHR5LTYuMi1yYzEnIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9ncmVna2gvdHR5CmdpdCBiaXNlY3QgZ29vZCBkZDZmOWIxN2Nk
N2FmNjhiNmE1MDkwZGVlZGYxZjVlODRmNjZmNGU2CiMgZ29vZDogWzVmNmU0MzBmOTMxZDI0
NWRhODM4ZGIzZTEwZTkxODY4MTIwNzAyOWJdIE1lcmdlIHRhZyAncG93ZXJwYy02LjItMScg
b2YgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Bvd2Vy
cGMvbGludXgKZ2l0IGJpc2VjdCBnb29kIDVmNmU0MzBmOTMxZDI0NWRhODM4ZGIzZTEwZTkx
ODY4MTIwNzAyOWIKIyBnb29kOiBbNjA5ZDNiYzYyMzA1MTRhOGNhNzliMzc3Nzc1YjE3ZThj
M2Q5YWM5M10gTWVyZ2UgdGFnICduZXQtNi4yLXJjMScgb2YgZ2l0Oi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25ldGRldi9uZXQKZ2l0IGJpc2VjdCBnb29k
IDYwOWQzYmM2MjMwNTE0YThjYTc5YjM3Nzc3NWIxN2U4YzNkOWFjOTMKIyBnb29kOiBbNTQ2
MWUwNzkwMDlhZTI3MzJjODMzMjgxYzRiNTBkZmI1OGQxNWJhNV0gTWVyZ2UgdGFnICdtZWRp
YS92Ni4yLTInIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9tY2hlaGFiL2xpbnV4LW1lZGlhCmdpdCBiaXNlY3QgZ29vZCA1NDYxZTA3OTAwOWFl
MjczMmM4MzMyODFjNGI1MGRmYjU4ZDE1YmE1CiMgZ29vZDogWzlkMmY2MDYwZmU0YzNiNDlk
MGNkYzFkY2UxYzk5Mjk2ZjMzMzc5YzhdIE1lcmdlIHRhZyAndHJhY2UtdjYuMi0xJyBvZiBn
aXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdHJhY2UvbGlu
dXgtdHJhY2UKZ2l0IGJpc2VjdCBnb29kIDlkMmY2MDYwZmU0YzNiNDlkMGNkYzFkY2UxYzk5
Mjk2ZjMzMzc5YzgKIyBnb29kOiBbZDFhYzFhMmIxNDI2NGU5OGMyNGRiNmY4YzJiZDQ1MmU2
OTVjNzIzOF0gTWVyZ2UgdGFnICdwZXJmLXRvb2xzLWZvci12Ni4yLTItMjAyMi0xMi0yMicg
b2YgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2FjbWUv
bGludXgKZ2l0IGJpc2VjdCBnb29kIGQxYWMxYTJiMTQyNjRlOThjMjRkYjZmOGMyYmQ0NTJl
Njk1YzcyMzgKIyBiYWQ6IFtkMTE4YjE4ZmIxZGEwMmI0MWRmMmRhNzhjYjI3OTRiMzYzOGQ4
OWNkXSBkcm0vYW1kL3BtOiBhdm9pZCBsYXJnZSB2YXJpYWJsZSBvbiBrZXJuZWwgc3RhY2sK
Z2l0IGJpc2VjdCBiYWQgZDExOGIxOGZiMWRhMDJiNDFkZjJkYTc4Y2IyNzk0YjM2MzhkODlj
ZAojIGJhZDogWzMyNzNmMTE2NzVlZjExOTU5ZDI1YTU2ZGYzMjc5ZjcxMmJjZDQxYjddIGRy
bS9hbWRncHU6IFJlbW92ZSB1bm5lY2Vzc2FyeSBkb21haW4gYXJndW1lbnQKZ2l0IGJpc2Vj
dCBiYWQgMzI3M2YxMTY3NWVmMTE5NTlkMjVhNTZkZjMyNzlmNzEyYmNkNDFiNwojIGJhZDog
W2Y5NWY1MWE0YzMzNTdlYWJmNzRmZTE0YWI3ZGFhNWI1YzA0MjJiMjddIGRybS9hbWRncHU6
IEFkZCBub3RpZmllciBsb2NrIGZvciBLRkQgdXNlcnB0cnMKZ2l0IGJpc2VjdCBiYWQgZjk1
ZjUxYTRjMzM1N2VhYmY3NGZlMTRhYjdkYWE1YjVjMDQyMmIyNwojIGJhZDogWzQ3ZWEyMDc2
MmJiNzg3NWE2MmUxMDQzM2EzY2Q1ZDM0ZTkxMzNmNDddIGRybS9hbWRncHU6IEFkZCBhbiBl
eHRyYSBldmljdF9yZXNvdXJjZSBjYWxsIGR1cmluZyBkZXZpY2Vfc3VzcGVuZC4KZ2l0IGJp
c2VjdCBiYWQgNDdlYTIwNzYyYmI3ODc1YTYyZTEwNDMzYTNjZDVkMzRlOTEzM2Y0NwojIGJh
ZDogWzgxZDBiY2Y5OTAwOTMyNjMzZDI3MGQ1YmM0YTU0ZmY1OTljNmViZGJdIGRybS9hbWRn
cHU6IG1ha2UgZGlzcGxheSBwaW5uaW5nIG1vcmUgZmxleGlibGUgKHYyKQpnaXQgYmlzZWN0
IGJhZCA4MWQwYmNmOTkwMDkzMjYzM2QyNzBkNWJjNGE1NGZmNTk5YzZlYmRiCg==
--------------jdDldEW0mALp7eOLhAsN1b2c
Content-Type: text/plain; charset=UTF-8; name="bisect_final.result"
Content-Disposition: attachment; filename="bisect_final.result"
Content-Transfer-Encoding: base64

ODFkMGJjZjk5MDA5MzI2MzNkMjcwZDViYzRhNTRmZjU5OWM2ZWJkYiBpcyB0aGUgZmlyc3Qg
YmFkIGNvbW1pdApjb21taXQgODFkMGJjZjk5MDA5MzI2MzNkMjcwZDViYzRhNTRmZjU5OWM2
ZWJkYgpBdXRob3I6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
RGF0ZTogICBXZWQgRGVjIDcgMTE6MDg6NTMgMjAyMiAtMDUwMAoKICAgIGRybS9hbWRncHU6
IG1ha2UgZGlzcGxheSBwaW5uaW5nIG1vcmUgZmxleGlibGUgKHYyKQogICAgCiAgICBPbmx5
IGFwcGx5IHRoZSBzdGF0aWMgdGhyZXNob2xkIGZvciBTdG9uZXkgYW5kIENhcnJpem8uCiAg
ICBUaGlzIGhhcmR3YXJlIGhhcyBjZXJ0YWluIHJlcXVpcmVtZW50cyB0aGF0IGRvbid0IGFs
bG93CiAgICBtaXhpbmcgb2YgR1RUIGFuZCBWUkFNLiAgTmV3ZXIgYXNpY3MgZG8gbm90IGhh
dmUgdGhlc2UKICAgIHJlcXVpcmVtZW50cyBzbyB3ZSBzaG91bGQgYmUgYWJsZSB0byBiZSBt
b3JlIGZsZXhpYmxlCiAgICB3aXRoIHdoZXJlIGJ1ZmZlcnMgZW5kIHVwLgogICAgCiAgICBC
dWc6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vYW1kLy0vaXNzdWVzLzIy
NzAKICAgIEJ1ZzogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9hbWQvLS9p
c3N1ZXMvMjI5MQogICAgQnVnOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJt
L2FtZC8tL2lzc3Vlcy8yMjU1CiAgICBBY2tlZC1ieTogTHViZW4gVHVpa292IDxsdWJlbi50
dWlrb3ZAYW1kLmNvbT4KICAgIFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+CiAgICBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CiAgICBDYzogc3RhYmxlQHZnZXIua2VybmVs
Lm9yZwoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyB8IDMg
KystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCg==


--------------jdDldEW0mALp7eOLhAsN1b2c--
