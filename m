Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBA8124143
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6B56E249;
	Wed, 18 Dec 2019 08:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 602 seconds by postgrey-1.36 at gabe;
 Tue, 17 Dec 2019 12:05:13 UTC
Received: from olimex.com (olimex.com [IPv6:2001:470:0:1f2::b869:4820])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733208997C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 12:05:13 +0000 (UTC)
Received: from 94.155.250.134 ([94.155.250.134]) by olimex.com with ESMTPSA
 (ECDHE-RSA-AES128-GCM-SHA256:TLSv1.2:Kx=ECDH:Au=RSA:Enc=AESGCM(128):Mac=AEAD)
 (SMTP-AUTH username stefan@olimex.com, mechanism PLAIN)
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 03:54:59 -0800
Subject: Re: [PATCH 1/1] drm/sun4i: hdmi: Check for null pointer before cleanup
To: Maxime Ripard <mripard@kernel.org>
References: <20191216144348.7540-1-stefan@olimex.com>
 <20191216161258.lmkq2ersfm746t7q@gilmour.lan>
 <cebda755-2649-79a1-fd08-79b13edef1a5@olimex.com>
 <20191217114603.6cyrfx3sekn6uwmp@gilmour.lan>
 <20191217114906.lrjup35tngrjhwuj@gilmour.lan>
From: Stefan Mavrodiev <stefan@olimex.com>
Message-ID: <83088170-1753-6a2f-aa25-c4f6f54462d6@olimex.com>
Date: Tue, 17 Dec 2019 13:54:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191217114906.lrjup35tngrjhwuj@gilmour.lan>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 18 Dec 2019 08:13:03 +0000
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
Cc: Stefan Mavrodiev <stefan@olimex.com>, David Airlie <airlied@linux.ie>,
 linux-sunxi@googlegroups.com, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Chen-Yu Tsai <wens@csie.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 12/17/19 1:49 PM, Maxime Ripard wrote:
> On Tue, Dec 17, 2019 at 12:46:03PM +0100, Maxime Ripard wrote:
>> On Tue, Dec 17, 2019 at 08:45:07AM +0200, Stefan Mavrodiev wrote:
>>> Hi,
>>>
>>> On 12/16/19 6:12 PM, Maxime Ripard wrote:
>>>> Hi,
>>>>
>>>> On Mon, Dec 16, 2019 at 04:43:48PM +0200, Stefan Mavrodiev wrote:
>>>>> It's possible hdmi->connector and hdmi->encoder divices to be NULL.
>>>>> This can happen when building as kernel module and you try to remove
>>>>> the module.
>>>>>
>>>>> This patch make simple null check, before calling the cleanup functions.
>>>>>
>>>>> Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
>>>>> ---
>>>>>    drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 6 ++++--
>>>>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
>>>>> index a7c4654445c7..b61e00f2ecb8 100644
>>>>> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
>>>>> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
>>>>> @@ -685,8 +685,10 @@ static void sun4i_hdmi_unbind(struct device *dev, struct device *master,
>>>>>    	struct sun4i_hdmi *hdmi = dev_get_drvdata(dev);
>>>>>
>>>>>    	cec_unregister_adapter(hdmi->cec_adap);
>>>>> -	drm_connector_cleanup(&hdmi->connector);
>>>>> -	drm_encoder_cleanup(&hdmi->encoder);
>>>>> +	if (hdmi->connector.dev)
>>>>> +		drm_connector_cleanup(&hdmi->connector);
>>>>> +	if (hdmi->encoder.dev)
>>>>> +		drm_encoder_cleanup(&hdmi->encoder);
>>>> Hmmm, this doesn't look right. Do you have more information on how you
>>>> can reproduce it?
>>> Just build sun4i_drm_hdmi as module (CONFIG_DRM_SUN4I_HDMI=m). Then try to
>>> unload the module:
>>>
>>> # rmmod sun4i_drm_hdmi
>>>
>>> And you get this:
>>>
>>> Unable to handle kernel NULL pointer dereference at virtual address 00000000
>>> pgd = 6b032436
>>> [00000000] *pgd=00000000
>>> Internal error: Oops: 5 [#1] SMP ARM
>>> Modules linked in: sun4i_drm_hdmi(-)
>>> CPU: 0 PID: 1081 Comm: rmmod Not tainted 5.5.0-rc1-00030-g6ec417030d93 #33
>>> Hardware name: Allwinner sun7i (A20) Family
>>> PC is at drm_connector_cleanup+0x40/0x208
>>> LR is at sun4i_hdmi_unbind+0x10/0x54 [sun4i_drm_hdmi]
>>> ...
>>>
>>>
>>> I've tested that with sunxi/for-next branch on A20-OLinuXino board.
>> Yeah, you detailed the symptoms nicely in the commit log, but my point
>> was that we shouldn't end up in that situation in the first place.
>>
>> Your patch works around it, but it doesn't fix the underlying
>> issue. Is drm_connector_cleanup (or the encoder variant) called twice?
> Answering myself, yes it is. It's both the destroy call back and
> called in unbind. We should just remove the one in the unbind then.

Should I do this or leave it to you?

Stefan

>
> Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
