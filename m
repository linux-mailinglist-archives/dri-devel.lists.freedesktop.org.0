Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BE194AA26
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 16:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9518110E540;
	Wed,  7 Aug 2024 14:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="FRKpzVpD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE5A10E540
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 14:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/yIq5F1sLYz2Im6abuL/kV0BHEUBUSXsQ6EP5OWWl0Q=; b=FRKpzVpDCAq0/ytJHoZSNvBDRe
 7MZcgfxBe3aMcQs27qDcw7haJgYq0XXey29sTC5+bXP53ATVv32SNBesO5hQLWmky66zjot2V8TH3
 hFZoR9HPDenoUJO6ncQqniUSurHjLCBp/cnJ1B6WHLNIdUSo1Ggp8EaKEz6gaZ/eNIMhlqQ7KDmYl
 PUYfkRGYjbdxIFmS7LSeNtpwk20ZNN/5SEIeLuTFw9mjWHgGwlBx+p4M+DHNamrK/C9zUDm8QJLJU
 7ntvWO45U2UVa91+wL9l0WX8vapuf2+5UO6MP6axGBrjgRctV//myX4elkrmIvh39gGnAleYNFF2M
 a1fdql1Q==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sbhhT-0091B7-MS; Wed, 07 Aug 2024 16:31:39 +0200
Message-ID: <c67738d6-9c52-45e3-8053-e7c0b415895d@igalia.com>
Date: Wed, 7 Aug 2024 11:31:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 09/16] drm/vc4: v3d: simplify clock retrieval
To: Stefan Wahren <wahrenst@gmx.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Jiri Slaby <jirislaby@kernel.org>,
 Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com
References: <20240728114200.75559-1-wahrenst@gmx.net>
 <20240728130029.78279-1-wahrenst@gmx.net>
 <581726ae-dd9c-476f-817d-4140f7217ec7@igalia.com>
 <b34cc73c-721f-48b6-a7a3-da8190d80dd8@gmx.net>
 <6047643f-e1f5-4be4-b55d-f59576999d91@igalia.com>
 <a19767c3-c457-4e52-bc66-8f1898a83193@gmx.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <a19767c3-c457-4e52-bc66-8f1898a83193@gmx.net>
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

Hi Stefan,

On 8/2/24 10:00, Stefan Wahren wrote:
> Hi Maíra,
> 
> Am 02.08.24 um 14:56 schrieb Maíra Canal:
>> Hi Stefan,
>>
>> On 7/31/24 13:41, Stefan Wahren wrote:
>>> Hi Maíra,
>>>
>>> Am 30.07.24 um 13:23 schrieb Maíra Canal:
>>>> On 7/28/24 10:00, Stefan Wahren wrote:
>>>>> Common pattern of handling deferred probe can be simplified with
>>>>> dev_err_probe() and devm_clk_get_optional(). This results in much
>>>>> less code.
>>>>>
>>>>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>>>>> ---
>>>>>   drivers/gpu/drm/vc4/vc4_v3d.c | 13 ++-----------
>>>>>   1 file changed, 2 insertions(+), 11 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c
>>>>> b/drivers/gpu/drm/vc4/vc4_v3d.c
>>>>> index 1ede508a67d3..4bf3a8d24770 100644
>>>>> --- a/drivers/gpu/drm/vc4/vc4_v3d.c
>>>>> +++ b/drivers/gpu/drm/vc4/vc4_v3d.c
>>>>> @@ -441,20 +441,11 @@ static int vc4_v3d_bind(struct device *dev,
>>>>> struct device *master, void *data)
>>>>>       vc4->v3d = v3d;
>>>>>       v3d->vc4 = vc4;
>>>>>
>>>>> -    v3d->clk = devm_clk_get(dev, NULL);
>>>>> +    v3d->clk = devm_clk_get_optional(dev, NULL);
>>>>>       if (IS_ERR(v3d->clk)) {
>>>>>           int ret = PTR_ERR(v3d->clk);
>>>>>
>>>>
>>>> Super nit: you could delete this line ^
>>> Can you please explain? ret is required for dev_err_probe or do you mean
>>> the empty line after the declaration?
>>
>> Just deleting the empty line after the declaration. It is a super small
>> nit indeed.
> AFAIK an empty line after a declaration is part of the coding style. Or
> is different in drm?

TBH I just checked the result of `git grep "dev_err_probe"` and I
noticed that most of the times, we don't add an empty line after the
declaration in this case or we don't even create a variable, something
like:

return dev_err_probe(dev, PTR_ERR(v3d->clk), "Failed to get V3D clock\n");

But it is a pretty small nit. Feel free to ignore it.

Also, let me know if you need me to apply any patches to drm-misc-next.

Best Regards,
- Maíra

> 
> Best regards
>>
>> Best Regards,
>> - Maíra
>>
>>>>
>>>> Reviewed-by: Maíra Canal <mcanal@igalia.com>
>>>>
>>>> Best Regards,
>>>> - Maíra
>>>>
>>>>> -        if (ret == -ENOENT) {
>>>>> -            /* bcm2835 didn't have a clock reference in the DT. */
>>>>> -            ret = 0;
>>>>> -            v3d->clk = NULL;
>>>>> -        } else {
>>>>> -            if (ret != -EPROBE_DEFER)
>>>>> -                dev_err(dev, "Failed to get V3D clock: %d\n",
>>>>> -                    ret);
>>>>> -            return ret;
>>>>> -        }
>>>>> +        return dev_err_probe(dev, ret, "Failed to get V3D clock\n");
>>>>>       }
>>>>>
>>>>>       ret = platform_get_irq(pdev, 0);
>>>>> -- 
>>>>> 2.34.1
>>>>>
>>>>
>>>
> 
