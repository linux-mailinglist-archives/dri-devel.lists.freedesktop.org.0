Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 857CC2C0D0A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 15:15:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A59089FE3;
	Mon, 23 Nov 2020 14:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CAB389FE3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 14:15:49 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B42120781;
 Mon, 23 Nov 2020 14:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606140947;
 bh=8rpJx5QRw4RH0PddIzzUPjibWCFpM1TlEugxUnbUh3w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fxeh1kppeBrBLSEKbdR/gqH+4lKVGDv9ByAYQwPqryRdXqiSV6BHomjTzrQpxxn7F
 0X2v5od5ENGszhqM5pBaAc+lqDMo/IhzvuZsa59VoTL0NVoaercBVLEUcU/T/7OW7o
 N3p4LRTmbI10qkzi0bKBHpF2wmj25VwpNbRWStqE=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1khCd7-00CyGd-69; Mon, 23 Nov 2020 14:15:45 +0000
MIME-Version: 1.0
Date: Mon, 23 Nov 2020 14:15:45 +0000
From: Marc Zyngier <maz@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 1/2] drm/meson: dw-hdmi: Disable clocks on driver teardown
In-Reply-To: <1jwnyc41c6.fsf@starbuckisacylon.baylibre.com>
References: <20201120094205.525228-1-maz@kernel.org>
 <20201120094205.525228-2-maz@kernel.org>
 <1jwnyc41c6.fsf@starbuckisacylon.baylibre.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <763f505eececa3b02bd794aec5e36d22@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: jbrunet@baylibre.com, narmstrong@baylibre.com,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 guillaume.tucker@collabora.com, kernel-team@android.com,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 linux-amlogic@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-23 14:03, Jerome Brunet wrote:
> On Fri 20 Nov 2020 at 10:42, Marc Zyngier <maz@kernel.org> wrote:
> 
>> The HDMI driver request clocks early, but never disable them, leaving
>> the clocks on even when the driver is removed.
>> 
>> Fix it by slightly refactoring the clock code, and register a devm
>> action that will eventually disable/unprepare the enabled clocks.
>> 
>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>> ---
>>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 43 
>> ++++++++++++++++++---------
>>  1 file changed, 29 insertions(+), 14 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c 
>> b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> index 7f8eea494147..29623b309cb1 100644
>> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> @@ -145,8 +145,6 @@ struct meson_dw_hdmi {
>>  	struct reset_control *hdmitx_apb;
>>  	struct reset_control *hdmitx_ctrl;
>>  	struct reset_control *hdmitx_phy;
>> -	struct clk *hdmi_pclk;
>> -	struct clk *venci_clk;
>>  	struct regulator *hdmi_supply;
>>  	u32 irq_stat;
>>  	struct dw_hdmi *hdmi;
>> @@ -946,6 +944,29 @@ static void meson_disable_regulator(void *data)
>>  	regulator_disable(data);
>>  }
>> 
>> +static void meson_disable_clk(void *data)
>> +{
>> +	clk_disable_unprepare(data);
>> +}
>> +
>> +static int meson_enable_clk(struct device *dev, char *name)
>> +{
>> +	struct clk *clk;
>> +	int ret;
>> +
>> +	clk = devm_clk_get(dev, name);
>> +	if (IS_ERR(clk)) {
>> +		dev_err(dev, "Unable to get %s pclk\n", name);
>> +		return PTR_ERR(clk);
>> +	}
>> +
>> +	ret = clk_prepare_enable(clk);
>> +	if (!ret)
>> +		ret = devm_add_action_or_reset(dev, meson_disable_clk,
>> clk);
> 
> Thanks for fixing this Marc.
> 
> FYI, while it is fine to declare a function to disable the clocks, a 
> quick
> cast may avoid it
> 
> devm_add_action_or_reset(dev, (void(*)(void *))clk_disable_unprepare, 
> clk);

While this works for now, a change to the clk_disable_unprepare()
prototype (such as adding a second argument) would now go completely
unnoticed (after all, you've cast the function, it *must* be correct,
right?), and someone would spend a few hours trying to track down memory
corruption or some other interesting results.

Yes, casting C functions can be hilarious.

I can see a few uses of this hack in the tree, and I have my pop-corn
ready.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
