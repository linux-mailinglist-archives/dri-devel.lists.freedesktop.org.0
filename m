Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 272D470B92A
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 11:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19EA910E29A;
	Mon, 22 May 2023 09:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BBE10E299
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 09:37:35 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1q11yt-0007Y3-RF; Mon, 22 May 2023 11:37:31 +0200
Message-ID: <d1aee7d3-05f6-0920-b8e1-4ed5cf3f9f70@leemhuis.info>
Date: Mon, 22 May 2023 11:37:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] drm/ofdrm: Update expected device name
Content-Language: en-US, de-DE
To: Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Cyril Brulebois <cyril@debamax.com>
References: <20230412095509.2196162-1-cyril@debamax.com>
 <20230412095509.2196162-3-cyril@debamax.com>
 <CAMuHMdW4rZn4p=gQZRWQQSEbQPmzZUd5eN+kP_Yr7bLgTHyvig@mail.gmail.com>
 <5694a9ab-d474-c101-9398-eea55aab29df@suse.de>
 <10077a22-3055-75dd-2168-310468618f99@gmx.de>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <10077a22-3055-75dd-2168-310468618f99@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1684748255;
 a0bec253; 
X-HE-SMSGID: 1q11yt-0007Y3-RF
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: linux-fbdev@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michal Suchanek <msuchanek@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
for once, to make this easily accessible to everyone.

Was a proper solution for the regression the initial mail in this thread
is about ever found? Doesn't look like it for here, but maybe I'm
missing something.

Reminder, the problem afaik is caused by 241d2fb56a ("of: Make OF
framebuffer device names unique") [merged for v6.2-rc8, authored by
Michal Suchanek; committed by Rob Herring].

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

On 24.04.23 11:35, Helge Deller wrote:
> On 4/24/23 11:07, Thomas Zimmermann wrote:
>> Am 24.04.23 um 09:33 schrieb Geert Uytterhoeven:
>>> On Wed, Apr 12, 2023 at 12:05 PM Cyril Brulebois <cyril@debamax.com>
>>> wrote:
>>>> Since commit 241d2fb56a18 ("of: Make OF framebuffer device names
>>>> unique"),
>>>> as spotted by Frédéric Bonnard, the historical "of-display" device is
>>>> gone: the updated logic creates "of-display.0" instead, then as many
>>>> "of-display.N" as required.
>>>>
>>>> This means that offb no longer finds the expected device, which
>>>> prevents
>>>> the Debian Installer from setting up its interface, at least on
>>>> ppc64el.
>>>>
>>>> Given the code similarity it is likely to affect ofdrm in the same way.
>>>>
>>>> It might be better to iterate on all possible nodes, but updating the
>>>> hardcoded device from "of-display" to "of-display.0" is likely to help
>>>> as a first step.
>>>>
>>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217328
>>>> Link: https://bugs.debian.org/1033058
>>>> Fixes: 241d2fb56a18 ("of: Make OF framebuffer device names unique")
>>>> Cc: stable@vger.kernel.org # v6.2+
>>>> Signed-off-by: Cyril Brulebois <cyril@debamax.com>
>>>
>>> Thanks for your patch, which is now commit 3a9d8ea2539ebebd
>>> ("drm/ofdrm: Update expected device name") in fbdev/for-next.
>>>
>>>> --- a/drivers/gpu/drm/tiny/ofdrm.c
>>>> +++ b/drivers/gpu/drm/tiny/ofdrm.c
>>>> @@ -1390,7 +1390,7 @@ MODULE_DEVICE_TABLE(of, ofdrm_of_match_display);
>>>>
>>>>   static struct platform_driver ofdrm_platform_driver = {
>>>>          .driver = {
>>>> -               .name = "of-display",
>>>> +               .name = "of-display.0",
>>>>                  .of_match_table = ofdrm_of_match_display,
>>>>          },
>>>>          .probe = ofdrm_probe,
>>>
>>> Same comment as for "[PATCH 1/2] fbdev/offb: Update expected device
>>> name".
>>>
>>> https://lore.kernel.org/r/CAMuHMdVGEeAsmb4tAuuqqGJ-4+BBETwEwYJA+M9NyJv0BJ_hNg@mail.gmail.com
>>
>> Sorry that I missed this patch. I agree that it's probably not
>> correct. At least in ofdrm, we want to be able to use multiple
>> framebuffers at the same time; a feature that has been broken by this
>> change.
> 
> Geert & Thomas, thanks for the review!
> 
> I've dropped both patches from fbdev tree for now.
> Would be great to find another good solution though, as it breaks the
> debian
> installer.
> 
> Helge
