Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C5358E0FE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 22:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD04911A6;
	Tue,  9 Aug 2022 20:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 311 seconds by postgrey-1.36 at gabe;
 Tue, 09 Aug 2022 20:22:19 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14BC78B3D0
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 20:22:19 +0000 (UTC)
Received: from [192.168.1.107] ([37.4.248.80]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mk0FM-1nfcK53OtE-00kLiH; Tue, 09 Aug 2022 22:16:53 +0200
Message-ID: <0692c98b-0776-0878-56eb-3c876ea98eb8@i2se.com>
Date: Tue, 9 Aug 2022 22:16:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 23/33] drm/vc4: hdmi: Move HDMI reset to pm_resume
Content-Language: en-US
To: Florian Fainelli <f.fainelli@gmail.com>, Maxime Ripard
 <maxime@cerno.tech>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20220613144800.326124-1-maxime@cerno.tech>
 <20220613144800.326124-24-maxime@cerno.tech>
 <ebd018b6-456e-fb22-b075-4da87f50b20b@gmail.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <ebd018b6-456e-fb22-b075-4da87f50b20b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:kg8Rgdeu+hZr/PFapjUC3daUAfxSt3h3SydiBjE2ImWGu35c2P2
 NpTbPhu8iq0TZhuVH+YQIMR7NZLuhR4Xya5/P4gG6skU4uLOicwOQnmB+J/+ozwFjUKIlet
 0J+FA8UGpG6fx/m87jPAYE/n/Wf0U/8fZaMiAdBhWfjJHtSf5gLoSGRTTtUKFwdXKvQ1txu
 fj6pamxDjd3Rjf8XKgXkg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+5g2SP1VuNo=:4/8RbxWyVRom6iHaxTIvy8
 VUUwKPR6/UrQIgPYNOySFwAxzof5WTYpMaS6q7tJsAJ3iORCpYoExv1nolNTr+DVo98JSMeah
 uSpXnh0z1XotQoUIy3EwVjmlGpdNW5mnNCD0aOtgzOCAhUoy8TKGI3AUXp9VhnnB8V+2z2BQm
 aE3+jd4CXPahbIuGDHPDmDHDf4YYqwpRU6HRVuHdNbTupHZtWzZu7g+W5Bk6J8yhQXt3mh7bC
 Ud6XzxnOiLa0qfFzH8yvN/RvX2870+lqFXOXmYkgnPs7ocFjhCWZqTPGzaSh85sxLYopsMKON
 4sFpzR6Adl5S6fw3oqq1S/XTESemJiIg88UsCjb/uXGUjtUQAqoi6u0l9dp8S3LIyAPpVWcBm
 afX6+e5pW8yfK74/m59K3wO9pcdrxsperrJw4hq1K9LnrPYrXQXstcKbcIgqW89O8VQ1PI2fK
 ejUPik/0XQoOprBSwWwBgN67GUu6DQ0s7QEuhRUlm3WLEpzbyyDuKx+j/TDs02p3VAZTVxNBS
 jPtFx/4BC49jaknnLQI6Xksq7CDsdnYfM0CYHr0+7exoSoGBXxZZ1JYwRzYLjS6VpIo+I1nEl
 x4+xOpKcJ6nAUbKSe997MP+ZbwAO5DF796TfokQy3iICe75+VpXNN6K6twxtrFHQ1v+zAs78W
 LWTsqW7b/+i27rjaz+xS35abkaX40jYj8uyV8Lfq5eKTIZNR0hjqOBUkPZhpMq5zX5kTByo3u
 FtWDu0F2Xtm3U/y0oDZxBqWaMWoPVvEvFeB7WA==
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Florian,

Am 05.08.22 um 01:11 schrieb Florian Fainelli:
> On 6/13/22 07:47, Maxime Ripard wrote:
>> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>
>> The BCM2835-37 found in the RaspberryPi 0 to 3 have a power domain
>> attached to the HDMI block, handled in Linux through runtime_pm.
>>
>> That power domain is shared with the VEC block, so even if we put our
>> runtime_pm reference in the HDMI driver it would keep being on. If the
>> VEC is disabled though, the power domain would be disabled and we would
>> lose any initialization done in our bind implementation.
>>
>> That initialization involves calling the reset function and initializing
>> the CEC registers.
>>
>> Let's move the initialization to our runtime_resume implementation so
>> that we initialize everything properly if we ever need to.
>>
>> Fixes: c86b41214362 ("drm/vc4: hdmi: Move the HSM clock enable to 
>> runtime_pm")
>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> After seeing the same warning as Stefan reported in the link below, 
> but on the Raspberry Pi 4B:
>
> https://www.spinics.net/lists/dri-devel/msg354170.html
>
> a separate bisection effort led me to this commit, before is fine, 
> after produces 4 warnings during boot, see attached log.
Which config do you use (multi_v7_defconfig + LPAE or arm64/defconfig)?
>
> Is there a fix that we can try that would also cover the Raspberry Pi 
> 4B? Is it possible that this series precipitates the problem:
>
> https://www.spinics.net/lists/arm-kernel/msg984638.html

I don't think this is related because this is a different driver.

Best regards

