Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B26112B404
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2019 11:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E9A6E3EF;
	Fri, 27 Dec 2019 10:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836D089C07
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2019 14:41:37 +0000 (UTC)
Received: from [192.168.1.6] (x590e15ff.dyn.telefonica.de [89.14.21.255])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 8BDD5202254E9;
 Thu, 26 Dec 2019 15:41:34 +0100 (CET)
Subject: Re: [Regression drm-tip] Internal audio device missing
To: Takashi Iwai <tiwai@suse.de>
References: <6aa4e167-abb0-6a2c-c00e-558aa79d94be@molgen.mpg.de>
 <s5h1rsr769i.wl-tiwai@suse.de>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <91e1ebe8-270e-d62f-844e-2018fe77145e@molgen.mpg.de>
Date: Thu, 26 Dec 2019 15:41:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <s5h1rsr769i.wl-tiwai@suse.de>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 27 Dec 2019 10:39:14 +0000
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
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>, Jaroslav Kysela <perex@perex.cz>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Takashi,


Am 26.12.19 um 11:03 schrieb Takashi Iwai:
> On Thu, 26 Dec 2019 10:47:18 +0100, Paul Menzel wrote:

>> With
>>
>>      $ git describe --tags drm-tip/drm-tip
>>      v5.5-rc3-1481-ga20d8cd6901a
>>
>> the internal audio device is not available, and just a dummy device.
>>
>> Running `alsa-info.sh` [1], the messages below are shown with the
>> problematic Linux kernel.
>>
>>      alsactl: get_controls:567: snd_ctl_open error: Sound protocol is
>> not compatible
>>      cat: /tmp/alsa-info.ateDlDjrZX/alsactl.tmp: No such file or directory
> 
> That's an unexpected side-effect of the recent protocol version bump
> in sound.git for-next branch.  It seems that we can't change the minor
> version unless we really want to break something.
> 
> Below is the fix patch.  Please give it a try.

Thank you for the quick reply and fix.

> -- 8< --
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] ALSA: control: Fix incompatible protocol error
> 
> The recent change to bump the ALSA control API protocol version from
> 2.0.7 to 2.1.0 caused a regression on user-space; while the user-space
> expects both the major and the minor versions to be identical with the
> supported numbers, we changed the minor number from 0 to 1.
> 
> For recovering from the incompatibility, this patch changes the
> protocol version again to 2.0.8, which is compatible, but yet higher
> than the original number 2.0.7, indicating that the protocol change.
> 
> Fixes: bd3eb4e87eb3 ("ALSA: ctl: bump protocol version up to v2.1.0")
> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   include/uapi/sound/asound.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
> index e36dadaf84ba..30ebb2a42983 100644
> --- a/include/uapi/sound/asound.h
> +++ b/include/uapi/sound/asound.h
> @@ -936,7 +936,7 @@ struct snd_timer_tread {
>    *                                                                          *
>    ****************************************************************************/
>   
> -#define SNDRV_CTL_VERSION		SNDRV_PROTOCOL_VERSION(2, 1, 0)
> +#define SNDRV_CTL_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 8)
>   
>   struct snd_ctl_card_info {
>   	int card;			/* card number */
> 

Tested-by: Paul Menzel <pmenzel@molgen.mpg.de>

Are there CI systems, which should have caught this problem?

Which user-space component should forward this problem to the user 
(desktop environment displaying a warning)?


Kind regards,

Paul
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
