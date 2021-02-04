Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4A530FCE6
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 20:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364006EE40;
	Thu,  4 Feb 2021 19:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265A26EA54
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 18:41:18 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DWnSX3N9Yz1qsjm;
 Thu,  4 Feb 2021 19:41:16 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DWnSX2YMLz1t6pl;
 Thu,  4 Feb 2021 19:41:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id U9vwHNIkL1yo; Thu,  4 Feb 2021 19:41:14 +0100 (CET)
X-Auth-Info: GbPy/6ar7eSBsQr9PL6XPeNNIubz4yU/8L8FRxX1qPI=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  4 Feb 2021 19:41:14 +0100 (CET)
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 driver
To: Doug Anderson <dianders@chromium.org>
References: <20210130181014.161457-1-marex@denx.de>
 <20210130181014.161457-2-marex@denx.de>
 <CAD=FV=WzW1L=nwcnhagCXfX5SStE0jr0bqRrEOi-46g4huD4Sw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <49db7ef3-fa53-a274-7c69-c2d840b13058@denx.de>
Date: Thu, 4 Feb 2021 19:40:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WzW1L=nwcnhagCXfX5SStE0jr0bqRrEOi-46g4huD4Sw@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 04 Feb 2021 19:34:32 +0000
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/4/21 6:15 PM, Doug Anderson wrote:
> Hi,

[...]

>> +static const struct regmap_range sn65dsi83_volatile_ranges[] = {
>> +       regmap_reg_range(REG_RC_LVDS_PLL, REG_RC_LVDS_PLL),
> 
> Why is REG_RC_LVDS_PLL volatile?

See register 0xa bit 7, PLL_EN_STAT .

>> +       regmap_reg_range(REG_IRQ_STAT, REG_IRQ_STAT),
> 
> Do you need to list REG_RC_RESET as volatile?  Specifically you need
> to make sure it's not cached...

Isn't volatile table exactly for this purpose -- to make sure the reg is 
not cached ?

>> +};
>> +
>> +static const struct regmap_access_table sn65dsi83_volatile_table = {
>> +       .yes_ranges = sn65dsi83_volatile_ranges,
>> +       .n_yes_ranges = ARRAY_SIZE(sn65dsi83_volatile_ranges),
>> +};
>> +
>> +static const struct regmap_config sn65dsi83_regmap_config = {
>> +       .reg_bits = 8,
>> +       .val_bits = 8,
>> +       .rd_table = &sn65dsi83_readable_table,
>> +       .wr_table = &sn65dsi83_writeable_table,
>> +       .volatile_table = &sn65dsi83_volatile_table,
>> +       .cache_type = REGCACHE_RBTREE,
>> +       .max_register = REG_IRQ_STAT,
>> +};
> 
> I'm curious how much the "readable" and "writable" sections get you.
> In theory only the "volatile" should really matter, right?

They are useful when dumping the regs from debugfs regmap registers .

>> +
>> +static struct sn65dsi83 *bridge_to_sn65dsi83(struct drm_bridge *bridge)
>> +{
>> +       return container_of(bridge, struct sn65dsi83, bridge);
>> +}
>> +
>> +static int sn65dsi83_attach(struct drm_bridge *bridge,
>> +                           enum drm_bridge_attach_flags flags)
>> +{
>> +       struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
>> +       struct device *dev = ctx->dev;
>> +       struct mipi_dsi_device *dsi;
>> +       struct mipi_dsi_host *host;
>> +       int ret = 0;
>> +
>> +       const struct mipi_dsi_device_info info = {
>> +               .type = "sn65dsi83",
>> +               .channel = 0,
>> +               .node = NULL,
>> +       };
>> +
>> +       host = of_find_mipi_dsi_host_by_node(ctx->host_node);
>> +       if (!host) {
>> +               dev_err(dev, "failed to find dsi host\n");
> 
> I notice that the sn65dsi86 driver usually uses DRM_ERROR instead of dev_err().

I guess you want DRM maintainers to comment on this one. I think simple 
dev_err() is clear in what it does, DRM_ERROR seems like another level 
of indirection.

>> +               return -EPROBE_DEFER;
>> +       }
>> +
>> +       dsi = mipi_dsi_device_register_full(host, &info);
>> +       if (IS_ERR(dsi)) {
>> +               ret = PTR_ERR(dsi);
>> +               dev_err(dev, "failed to create dsi device, ret=%i\n", ret);
>> +               goto err_dsi_device;
> 
> Why not just "return ret" and get rid of the "err_dsi_device" label?

Oh, right, or even dev_err_probe().

[...]

>> +static void sn65dsi83_pre_enable(struct drm_bridge *bridge)
>> +{
>> +       struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
>> +
>> +       /*
>> +        * Reset the chip, pull EN line low for t_reset=10ms,
>> +        * then high for t_en=1ms.
>> +        */
>> +       gpiod_set_value(ctx->enable_gpio, 0);
> 
> Why not use the "cansleep" version to give some flexibility?

Does that make a difference in non-interrupt context ?

>> +       usleep_range(10000, 11000);
> 
> It seems like it would be worth it to read the enable_gpio first?  If
> it was already 0 maybe you can skip the 10 ms delay?  I would imagine
> that most of the time the bridge would already be disabled to start?

How do you guarantee the GPIO was LO for 10 mS here? You can sample that 
it is LO, but you won't know how long it was LO before this code was 
executed.

>> +       gpiod_set_value(ctx->enable_gpio, 1);
>> +       usleep_range(1000, 1100);
> 
> This fully resets the chip, right?  So you need to invalidate your regmap cache?

Right

>> +}
>> +

[...]

>> +static void sn65dsi83_enable(struct drm_bridge *bridge)
>> +{
>> +       struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
>> +       u16 val;
>> +
>> +       /* Clear reset, disable PLL */
>> +       regmap_write(ctx->regmap, REG_RC_RESET, 0x00);
> 
> I don't think you need to clear reset, do you?  The doc says "This bit
> automatically clears when set to 1 and returns 0s when read."  Maybe
> was needed because you forgot to list this register as volatile?

I need to check this one.

>> +       regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
> 
> Probably you don't need this?  It's the default and in pre-enable you
> just reset the chip.  Maybe it was needed since you don't flush the
> cache in pre-enable?

Have a look at the Example Script in the DSI83 datasheet, this PLL part 
is needed.

>> +       /* Reference clock derived from DSI link clock. */
>> +       regmap_write(ctx->regmap, REG_RC_LVDS_PLL,
>> +               REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(ctx)) |
>> +               REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY);
>> +       regmap_write(ctx->regmap, REG_DSI_CLK,
>> +               REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx)));
>> +       regmap_write(ctx->regmap, REG_RC_DSI_CLK,
>> +               REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx)));
>> +
>> +       /* Set number of DSI lanes, keep reserved bits. */
>> +       regmap_write(ctx->regmap, REG_DSI_LANE,
>> +               REG_DSI_LANE_RESERVED |
>> +               REG_DSI_LANE_CHA_DSI_LANES(~(ctx->dsi_lanes - 1)));
>> +       /* No equalization. */
>> +       regmap_write(ctx->regmap, REG_DSI_EQ, 0x00);
>> +
>> +       /* RGB888 is the only format supported so far. */
>> +       regmap_write(ctx->regmap, REG_LVDS_FMT,
>> +               (ctx->mode.flags & DRM_MODE_FLAG_NHSYNC ?
>> +                REG_LVDS_FMT_HS_NEG_POLARITY : 0) |
>> +               (ctx->mode.flags & DRM_MODE_FLAG_NVSYNC ?
>> +                REG_LVDS_FMT_VS_NEG_POLARITY : 0) |
>> +               REG_LVDS_FMT_RESERVED |
>> +               REG_LVDS_FMT_CHA_24BPP_MODE);
>> +       regmap_write(ctx->regmap, REG_LVDS_VCOM, 0x00);
>> +       regmap_write(ctx->regmap, REG_LVDS_LANE, REG_LVDS_LANE_CHA_LVDS_TERM);
>> +       regmap_write(ctx->regmap, REG_LVDS_CM, 0x00);
>> +
>> +       regmap_bulk_write(ctx->regmap, REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW,
>> +                         &ctx->mode.hdisplay, 2);
>> +       regmap_bulk_write(ctx->regmap, REG_VID_CHA_VERTICAL_DISPLAY_SIZE_LOW,
>> +                         &ctx->mode.vdisplay, 2);
>> +       val = 32 + 1;   /* 32 + 1 pixel clock to ensure proper operation */
>> +       regmap_bulk_write(ctx->regmap, REG_VID_CHA_SYNC_DELAY_LOW, &val, 2);
>> +       val = ctx->mode.hsync_end - ctx->mode.hsync_start;
>> +       regmap_bulk_write(ctx->regmap, REG_VID_CHA_HSYNC_PULSE_WIDTH_LOW,
>> +                         &val, 2);
>> +       val = ctx->mode.vsync_end - ctx->mode.vsync_start;
>> +       regmap_bulk_write(ctx->regmap, REG_VID_CHA_VSYNC_PULSE_WIDTH_LOW,
>> +                         &val, 2);
>> +       regmap_write(ctx->regmap, REG_VID_CHA_HORIZONTAL_BACK_PORCH,
>> +                    ctx->mode.htotal - ctx->mode.hsync_end);
>> +       regmap_write(ctx->regmap, REG_VID_CHA_VERTICAL_BACK_PORCH,
>> +                    ctx->mode.vtotal - ctx->mode.vsync_end);
>> +       regmap_write(ctx->regmap, REG_VID_CHA_HORIZONTAL_FRONT_PORCH,
>> +                    ctx->mode.hsync_start - ctx->mode.hdisplay);
>> +       regmap_write(ctx->regmap, REG_VID_CHA_VERTICAL_FRONT_PORCH,
>> +                    ctx->mode.vsync_start - ctx->mode.vdisplay);
>> +       regmap_write(ctx->regmap, REG_VID_CHA_TEST_PATTERN, 0x00);
>> +
>> +       /* Enable PLL */
>> +       regmap_write(ctx->regmap, REG_RC_PLL_EN, REG_RC_PLL_EN_PLL_EN);
> 
> After you turn on the PLL, I think you should be waiting for
> "PLL_EN_STAT" to show that the PLL is actually enabled and then
> delaying 3ms, right?

Yes

>> +       /* Trigger reset after CSR register update. */
>> +       regmap_write(ctx->regmap, REG_RC_RESET, REG_RC_RESET_SOFT_RESET);
>> +}
>> +
>> +static void sn65dsi83_disable(struct drm_bridge *bridge)
>> +{
>> +       struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
>> +
>> +       /* Clear reset, disable PLL */
>> +       regmap_write(ctx->regmap, REG_RC_RESET, 0x00);
> 
> I don't think you need this--it self-clears.
> 
> 
>> +       regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
>> +}
>> +
>> +static void sn65dsi83_post_disable(struct drm_bridge *bridge)
>> +{
>> +       struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
>> +
>> +       /* Put the chip in reset, pull EN line low. */
>> +       gpiod_set_value(ctx->enable_gpio, 0);
>> +}
>> +
>> +static enum drm_mode_status
>> +sn65dsi83_mode_valid(struct drm_bridge *bridge,
>> +                    const struct drm_display_info *info,
>> +                    const struct drm_display_mode *mode)
>> +{
>> +       /* LVDS output clock range 25..154 MHz */
>> +       if (mode->clock < 25000)
>> +               return MODE_CLOCK_LOW;
>> +       if (mode->clock > 154000)
>> +               return MODE_CLOCK_HIGH;
>> +
>> +       return MODE_OK;
>> +}
>> +
>> +static void sn65dsi83_mode_set(struct drm_bridge *bridge,
>> +                              const struct drm_display_mode *mode,
>> +                              const struct drm_display_mode *adj)
>> +{
>> +       struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
>> +
>> +       ctx->mode = *mode;
> 
> IIRC you should be using adj, not mode.  If something earlier in the
> chain tweaked it then adj will be more correct.

OK

[...]
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
