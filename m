Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 872671228CB
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43226E97B;
	Tue, 17 Dec 2019 10:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from olimex.com (olimex.com [184.105.72.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288D589D9B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 06:45:12 +0000 (UTC)
Received: from 94.155.250.134 ([94.155.250.134]) by olimex.com with ESMTPSA
 (ECDHE-RSA-AES128-GCM-SHA256:TLSv1.2:Kx=ECDH:Au=RSA:Enc=AESGCM(128):Mac=AEAD)
 (SMTP-AUTH username stefan@olimex.com, mechanism PLAIN)
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 22:45:11 -0800
Subject: Re: [PATCH 1/1] drm/sun4i: hdmi: Check for null pointer before cleanup
To: Maxime Ripard <mripard@kernel.org>
References: <20191216144348.7540-1-stefan@olimex.com>
 <20191216161258.lmkq2ersfm746t7q@gilmour.lan>
From: Stefan Mavrodiev <stefan@olimex.com>
Message-ID: <cebda755-2649-79a1-fd08-79b13edef1a5@olimex.com>
Date: Tue, 17 Dec 2019 08:45:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191216161258.lmkq2ersfm746t7q@gilmour.lan>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
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

On 12/16/19 6:12 PM, Maxime Ripard wrote:
> Hi,
>
> On Mon, Dec 16, 2019 at 04:43:48PM +0200, Stefan Mavrodiev wrote:
>> It's possible hdmi->connector and hdmi->encoder divices to be NULL.
>> This can happen when building as kernel module and you try to remove
>> the module.
>>
>> This patch make simple null check, before calling the cleanup functions.
>>
>> Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
>> ---
>>   drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
>> index a7c4654445c7..b61e00f2ecb8 100644
>> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
>> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
>> @@ -685,8 +685,10 @@ static void sun4i_hdmi_unbind(struct device *dev, struct device *master,
>>   	struct sun4i_hdmi *hdmi = dev_get_drvdata(dev);
>>
>>   	cec_unregister_adapter(hdmi->cec_adap);
>> -	drm_connector_cleanup(&hdmi->connector);
>> -	drm_encoder_cleanup(&hdmi->encoder);
>> +	if (hdmi->connector.dev)
>> +		drm_connector_cleanup(&hdmi->connector);
>> +	if (hdmi->encoder.dev)
>> +		drm_encoder_cleanup(&hdmi->encoder);
> Hmmm, this doesn't look right. Do you have more information on how you
> can reproduce it?

Just build sun4i_drm_hdmi as module (CONFIG_DRM_SUN4I_HDMI=m). Then try 
to unload the module:

# rmmod sun4i_drm_hdmi

And you get this:

Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = 6b032436
[00000000] *pgd=00000000
Internal error: Oops: 5 [#1] SMP ARM
Modules linked in: sun4i_drm_hdmi(-)
CPU: 0 PID: 1081 Comm: rmmod Not tainted 5.5.0-rc1-00030-g6ec417030d93 #33
Hardware name: Allwinner sun7i (A20) Family
PC is at drm_connector_cleanup+0x40/0x208
LR is at sun4i_hdmi_unbind+0x10/0x54 [sun4i_drm_hdmi]
...


I've tested that with sunxi/for-next branch on A20-OLinuXino board.

Best regards,
Stefan

>
> Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
