Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 399A8802F4E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 10:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6DE10E156;
	Mon,  4 Dec 2023 09:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F7810E31B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 09:52:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 24C86B80C8B;
 Mon,  4 Dec 2023 09:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54150C433C8;
 Mon,  4 Dec 2023 09:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701683556;
 bh=G90ktrbPDxw748635+u97Ko+qELy1kB46DRPsEHwDCA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p5ZZxdWOpPSX67byQl+sDsl6cNX7yLy3arbNeCYFq2IihlaU8O+3dfknjleNlPU4l
 2Dih0HGT+Xft39xeEij98/2ryVtOAG1Cp2Trihxi9SXDn0IY3oR8CuVkkTdoAxU/i4
 aaCUOK9S0CyJ7S8BEY9u0u5TVB7Yr6d5fZFE2j0yWvASO1BH9sN8kwqrLt8wT43mX0
 Sef8n94W+sQguRkye5Fq6FcPjp+zmpX7WF5F1U+FfQ6QI/dQtxuQb5LPi+6dEh5HZV
 Cd+Gwu52tF8/1fHX8X9h8AV8WP9LNjnVTYNtDlaUHcG9/aEEjOxZt+SagrELbE+b4o
 bjRXbGQLmM0+Q==
From: Michael Walle <mwalle@kernel.org>
To: dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v2 09/10] drm/bridge: tc358775: Add support for tc358765
Date: Mon,  4 Dec 2023 10:52:13 +0100
Message-Id: <20231204095213.2573620-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <CAA8EJppYoBxYaFnu7UHxCgNiRwcjmVgPXXcQboaeu_dGCosJXg@mail.gmail.com>
References: <CAA8EJppYoBxYaFnu7UHxCgNiRwcjmVgPXXcQboaeu_dGCosJXg@mail.gmail.com>
MIME-Version: 1.0
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
Cc: Michael Walle <mwalle@kernel.org>, pavel@ucw.cz, tony@atomide.com,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 ivo.g.dimitrov.75@gmail.com, rfoss@kernel.org, jernej.skrabec@gmail.com,
 simhavcs@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 jonas@kwiboo.se, merlijn@wizzup.org, mripard@kernel.org, robh+dt@kernel.org,
 philipp@uvos.xyz, neil.armstrong@linaro.org, sre@kernel.org,
 andrzej.hajda@intel.com, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> The tc358775 bridge is pin compatible with earlier tc358765 according to
>> the tc358774xbg_datasheet_en_20190118.pdf documentation. Compared to the
>> tc358765, the tc358775 supports a STBY GPIO and higher data rates.
>>
>> The tc358765 has a register bit for video event mode vs video pulse mode.
>> We must set it to video event mode for the LCD output to work, and on the
>> tc358775, this bit no longer exists.
>>
>> Looks like the registers seem to match otherwise based on a quick glance
>> comparing the defines to the earlier Android kernel tc358765 driver.
>>
>> Signed-off-by: Tony Lindgren <tony@atomide.com>
>> ---
>>  drivers/gpu/drm/bridge/tc358775.c | 26 ++++++++++++++++++++++----
>>  1 file changed, 22 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
>> --- a/drivers/gpu/drm/bridge/tc358775.c
>> +++ b/drivers/gpu/drm/bridge/tc358775.c
>> @@ -15,6 +15,7 @@
>>  #include <linux/kernel.h>
>>  #include <linux/media-bus-format.h>
>>  #include <linux/module.h>
>> +#include <linux/of_device.h>
>>  #include <linux/regulator/consumer.h>
>>  #include <linux/slab.h>
>>
>> @@ -107,6 +108,7 @@
>>  #define RDPKTLN         0x0404  /* Command Read Packet Length */
>>
>>  #define VPCTRL          0x0450  /* Video Path Control */
>> +#define EVTMODE                BIT(5)  /* Video event mode enable, tc35876x only */
>>  #define HTIM1           0x0454  /* Horizontal Timing Control 1 */
>>  #define HTIM2           0x0458  /* Horizontal Timing Control 2 */
>>  #define VTIM1           0x045C  /* Vertical Timing Control 1 */
>> @@ -254,6 +256,11 @@ enum tc358775_ports {
>>         TC358775_LVDS_OUT1,
>>  };
>>
>> +enum tc3587x5_type {
>> +       TC358765,
>
> I'd suggest adding = 1 or =0x65 so that the specified type differs
> from 'no data' = 0 / NULL.
>
>> +       TC358775,
>> +};
>> +
>>  struct tc_data {
>>         struct i2c_client       *i2c;
>>         struct device           *dev;
>> @@ -271,6 +278,8 @@ struct tc_data {
>>         struct gpio_desc        *stby_gpio;
>>         u8                      lvds_link; /* single-link or dual-link */
>>         u8                      bpc;
>> +
>> +       enum tc3587x5_type      type;
>>  };
>>
>>  static inline struct tc_data *bridge_to_tc(struct drm_bridge *b)
>> @@ -424,10 +433,16 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
>>         d2l_write(tc->i2c, PPI_STARTPPI, PPI_START_FUNCTION);
>>         d2l_write(tc->i2c, DSI_STARTDSI, DSI_RX_START);
>>
>> +       /* Video event mode vs pulse mode bit, does not exist for tc358775 */
>> +       if (tc->type == TC358765)
>> +               val = EVTMODE;
>> +       else
>> +               val = 0;
>> +
>>         if (tc->bpc == 8)
>> -               val = TC358775_VPCTRL_OPXLFMT(1);
>> +               val |= TC358775_VPCTRL_OPXLFMT(1);
>>         else /* bpc = 6; */
>> -               val = TC358775_VPCTRL_MSF(1);
>> +               val |= TC358775_VPCTRL_MSF(1);
>>
>>         dsiclk = mode->crtc_clock * 3 * tc->bpc / tc->num_dsi_lanes / 1000;
>>         clkdiv = dsiclk / (tc->lvds_link == DUAL_LINK ? DIVIDE_BY_6 : DIVIDE_BY_3);
>> @@ -643,6 +658,7 @@ static int tc_probe(struct i2c_client *client)
>>
>>         tc->dev = dev;
>>         tc->i2c = client;
>> +       tc->type = (enum tc3587x5_type)of_device_get_match_data(dev);
>
> Would it make sense to use i2c_get_match_data() instead?

FWIW, I' planning to add a dsi binding for this driver. So I'd
suggest either the of_ or the device_ variant. Not sure though,
if the new device supports the DSI commands.

Otherwise, the patch looks good:

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

>
>>
>>         tc->panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node,
>>                                                   TC358775_LVDS_OUT0, 0);
>> @@ -704,13 +720,15 @@ static void tc_remove(struct i2c_client *client)
>>  }
>>
>>  static const struct i2c_device_id tc358775_i2c_ids[] = {
>> -       { "tc358775", 0 },
>> +       { "tc358765", TC358765, },
>> +       { "tc358775", TC358775, },
>>         { }
>>  };
>>  MODULE_DEVICE_TABLE(i2c, tc358775_i2c_ids);
>>
>>  static const struct of_device_id tc358775_of_ids[] = {
>> -       { .compatible = "toshiba,tc358775", },
>> +       { .compatible = "toshiba,tc358765", .data = (void *)TC358765, },
>> +       { .compatible = "toshiba,tc358775", .data = (void *)TC358775, },
>>         { }
>>  };
>>  MODULE_DEVICE_TABLE(of, tc358775_of_ids);
>> --
>> 2.43.0



-- 
With best wishes
Dmitry

