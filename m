Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0279F357C1F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 08:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9F46EA0D;
	Thu,  8 Apr 2021 06:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 457 seconds by postgrey-1.36 at gabe;
 Wed, 07 Apr 2021 19:19:36 UTC
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BD06E976;
 Wed,  7 Apr 2021 19:19:36 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 5ABA73ED55;
 Wed,  7 Apr 2021 21:11:54 +0200 (CEST)
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/mdp5: Configure PP_SYNC_HEIGHT to
 double the vtotal
To: abhinavk@codeaurora.org, Marijn Suijten <marijn.suijten@somainline.org>
References: <20210406214726.131534-1-marijn.suijten@somainline.org>
 <20210406214726.131534-2-marijn.suijten@somainline.org>
 <6413863d04df9743e2d7e81beff5c3e8@codeaurora.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Message-ID: <04860f05-f79f-de0b-13d1-aba85065b4da@somainline.org>
Date: Wed, 7 Apr 2021 21:11:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <6413863d04df9743e2d7e81beff5c3e8@codeaurora.org>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 08 Apr 2021 06:04:44 +0000
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
Cc: Sean Paul <sean@poorly.run>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 07/04/21 20:19, abhinavk@codeaurora.org ha scritto:
> Hi Marijn
> =

> On 2021-04-06 14:47, Marijn Suijten wrote:
>> Leaving this at a close-to-maximum register value 0xFFF0 means it takes
>> very long for the MDSS to generate a software vsync interrupt when the
>> hardware TE interrupt doesn't arrive.=A0 Configuring this to double the
>> vtotal (like some downstream kernels) leads to a frame to take at most
>> twice before the vsync signal, until hardware TE comes up.
>>
>> In this case the hardware interrupt responsible for providing this
>> signal - "disp-te" gpio - is not hooked up to the mdp5 vsync/pp logic at
>> all.=A0 This solves severe panel update issues observed on at least the
>> Xperia Loire and Tone series, until said gpio is properly hooked up to
>> an irq.
> =

> The reason the CONFIG_HEIGHT was at such a high value is to make sure that
> we always get the TE only from the panel vsync and not false positives =

> coming
> from the tear check logic itself.
> =

> When you say that disp-te gpio is not hooked up, is it something =

> incorrect with
> the schematic OR panel is not generating the TE correctly?
> =


Sometimes, some panels aren't getting correctly configured by the =

OEM/ODM in the first place: especially when porting devices from =

downstream to upstream, developers often get in a situation in which =

their TE line is either misconfigured or the DriverIC is not configured =

to raise V-Sync interrupts.
Please remember: some DDICs need a "commands sequence" to enable =

generating the TE interrupts, sometimes this is not standard, and =

sometimes OEMs/ODMs are not even doing that in their downstream code =

(but instead they work around it in creative ways "for reasons", even =

though their DDIC supports indeed sending TE events).

This mostly happens when bringing up devices that have autorefresh =

enabled from the bootloader (when the bootloader sets up the splash =

screen) by using simple-panel as a (hopefully) temporary solution to get =

through the initial stages of porting.

We are not trying to cover cases related to incorrect schematics or =

hardware mistakes here, as the fix for that - as you know - is to just =

fix your hardware.
What we're trying to do here is to stop freezes and, in some cases, =

lockups, other than false positives making the developer go offroad when =

the platform shows that something is wrong during early porting.

Also, sometimes, some DDICs will not generate TE interrupts when =

expected... in these cases we get a PP timeout and a MDP5 recovery: this =

is totally avoidable if we rely on the 2*vtotal, as we wouldn't get =

through the very time consuming task of recovering the entire MDP.

Of course, if something is wrong in the MDP and the block really needs =

recovery, this "trick" won't save anyone and the recovery will anyway be =

triggered, as the PP-done will anyway timeout.

>>
>> Suggested-by: AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@somainline.org>
>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Reviewed-by: AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@somainline.org>
>> ---
>> =A0drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c | 2 +-
>> =A01 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
>> b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
>> index ff2c1d583c79..2d5ac03dbc17 100644
>> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
>> @@ -51,7 +51,7 @@ static int pingpong_tearcheck_setup(struct
>> drm_encoder *encoder,
>>
>> =A0=A0=A0=A0 mdp5_write(mdp5_kms, REG_MDP5_PP_SYNC_CONFIG_VSYNC(pp_id), =
cfg);
>> =A0=A0=A0=A0 mdp5_write(mdp5_kms,
>> -=A0=A0=A0=A0=A0=A0=A0 REG_MDP5_PP_SYNC_CONFIG_HEIGHT(pp_id), 0xfff0);
>> +=A0=A0=A0=A0=A0=A0=A0 REG_MDP5_PP_SYNC_CONFIG_HEIGHT(pp_id), (2 * mode-=
>vtotal));
>> =A0=A0=A0=A0 mdp5_write(mdp5_kms,
>> =A0=A0=A0=A0=A0=A0=A0=A0 REG_MDP5_PP_VSYNC_INIT_VAL(pp_id), mode->vdispl=
ay);
>> =A0=A0=A0=A0 mdp5_write(mdp5_kms, REG_MDP5_PP_RD_PTR_IRQ(pp_id), =

>> mode->vdisplay + 1);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
