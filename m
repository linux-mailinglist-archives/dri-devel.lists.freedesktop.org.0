Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 681461FDF42
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 03:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD8B6E2ED;
	Thu, 18 Jun 2020 01:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BA36E2ED
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 01:40:54 +0000 (UTC)
IronPort-SDR: MnDkpjMI7lE9yJXpbVPML+VuQb3hW/71k3HEanam2pVK4t907Uda9q6XWoSUUkW0AZ2562r8rc
 X9R+TudlpalQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 18:40:54 -0700
IronPort-SDR: L8T22R0MGr2syrmYiisdYinsDSOwMEZ82Ykc66RmiBcbaeF6gtc1LGt9rhGU+KgmALAPzcybG4
 8DBOyCm+/20g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,524,1583222400"; d="scan'208";a="477066040"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.3]) ([10.239.13.3])
 by fmsmga005.fm.intel.com with ESMTP; 17 Jun 2020 18:40:51 -0700
Subject: Re: [PATCH] drm/mgag200: Don't set <rammapen> in MISC
To: Thomas Zimmermann <tzimmermann@suse.de>
References: <20200616142630.20129-1-tzimmermann@suse.de>
 <CACvgo52NY98wQ4Pm3LozSmdewQf_ftX4cYZbx=t6=s9CNE27kA@mail.gmail.com>
 <ea09692a-5a8f-d315-3bce-d416e8a01c7a@suse.de>
 <20200617092252.GA5279@shao2-debian>
 <f888c170-ee0f-5efa-768d-908ce2507a5b@suse.de>
From: Rong Chen <rong.a.chen@intel.com>
Message-ID: <c6412de2-45af-09c0-3e6e-367fe63d302b@intel.com>
Date: Thu, 18 Jun 2020 09:40:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f888c170-ee0f-5efa-768d-908ce2507a5b@suse.de>
Content-Language: en-US
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
Cc: John Donnelly <john.p.donnelly@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/17/20 8:29 PM, Thomas Zimmermann wrote:
> Hi
>
> Am 17.06.20 um 11:22 schrieb Rong Chen:
>> On Wed, Jun 17, 2020 at 08:28:02AM +0200, Thomas Zimmermann wrote:
>>> Hi Emil
>>>
>>> Am 16.06.20 um 17:14 schrieb Emil Velikov:
>>>> Hi Thomas,
>>>>
>>>> On Tue, 16 Jun 2020 at 15:26, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>>>> The original modesetting code set MISC to 0x2d, which is <hpgoddev>,
>>>>> <clksel> and <ioaddsel>
>>>>>
>>>>> With the conversion to atomic modesetting, <rammapen> accidentally
>>>>> got enabled as well. Revert this change and initialize MISC with a
>>>>> constant value of <hgoddev> and <ioaddsel>. The <clksel> bits are set
>>>>> in mga_crtc_set_plls(), sync flags are set in mgag200_set_mode_regs().
>>>>>
>>>> Let's keep the remove (restoring original functionality) and rename
>>>> (cosmetics) separate patches. The read has also disappeared, which
>>>> should be safe although might be better on it's own.
>>> I'm waiting for Rong Chen's performance results on this patch. Moving
>>> the rename into a separate patch makes sense, but removing the read is
>>> part of restoring the original behavior. I think it should be in this
>>> patch. Maybe I can write a better commit message to highlight the change.
>>>
>> Hi Thomas,
>>
>> I tested the patch based on previous patch series, it seems doesn't take
>> effect, and commit 39fb72816c4ee brings a larger regression when
>> comparing to commit caac4dda44f37:
> Thanks for testing!
>
> I still don't understand these numbers, but are you sure that
> e44e907dd8f93 is really the regression?

Yes, it's a regression too, according to the previous report 
https://www.spinics.net/lists/dri-devel/msg260034.html
the bot bisected to commit e44e907dd8f93 which let the 
glmark2.800x600.score reduced by 64.9%,
but the bot doesn't notice the improvement of commit caac4dda44f37, and 
commit 39fb72816c4ee
causes another regression.

Best Regards,
Rong Chen

>
> It would make sense that 39fb72816c4ee has an impact on performance, as
> it changes memory management and the way the driver updates the display.
> I'll take a closer look at that patch and maybe send out an update.
>
> Best regards
> Thomas
>
>> 4606edf870927 drm/mgag200: Don't set <rammapen> in MISC                                              3 3 3
>> 39fb72816c4ee drm/mgag200: Replace VRAM helpers with SHMEM helpers                                   3 22
>> caac4dda44f37 drm/mgag200: Convert to simple KMS helper                                              238 233 240 234 239
>> 4b11c90431108 drm/mgag200: Use simple-display data structures                                        35 34 34 34
>> db22c903c9322 drm/mgag200: Remove out-commented suspend/resume helpers                               34 34
>> 87d4880d2aeb5 drm/mgag200: Move register initialization into separate function                       35
>> 0c51726f95396 drm/mgag200: Move hiprilvl setting into separate functions                             35
>> 8078e8b182e73 drm/mgag200: Set primary plane's format in separate helper function                    35
>> 19f7b409d95b7 drm/mgag200: Set pitch in a separate helper function                                   35 34
>> 9b9a363828c60 drm/mgag200: Update mode registers after plane registers                               34
>> e44e907dd8f93 drm/mgag200: Split MISC register update into PLL selection, SYNC and I/O               34 34 34 34
>> bef2303526adb drm/mgag200: Move mode-setting code into separate helper function                      97 97
>> 5cd8460e81e8f drm/mgag200: Clean up mga_crtc_do_set_base()                                           96
>> 0671ca8c559ba drm/mgag200: Clean up mga_set_start_address()
>> e82c8969a2474 drm/mgag200: Remove HW cursor                                                          96
>>
>> Best Regards,
>> Rong Chen
>>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
