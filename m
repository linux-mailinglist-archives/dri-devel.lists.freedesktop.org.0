Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F07341D84
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 13:57:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1012F6E0D6;
	Fri, 19 Mar 2021 12:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1C46E0D6
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 12:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fs1BI/kDPxpUnN2YfyefcBRApTniZpGXEnNk5mbyRPI=; b=bR+IhlEU7m0zTEXNyKdnBRdnDp
 S64rpmFI69yooWeChT4QtgiW4qBjIjtAhJgC5GwNUjZgirSY5GWnG2wQ0bEvPqrshK9Ka8goBhikf
 pStXD170FQK8lPXtrd4L4hUiwVQ4ZsRv/6PcQupUqGh36AXLBcOlIwqdeTGGbZHa0bY2aKH0TI1ct
 btzOi4uajTKn/ZL14tzZjvqr+cJsMF0ZOj07/RZDrYukbnfeqDAczU4mm+SoRTNwvydtPE6SZMaHI
 SMpuXwo4P4WzzO8raSsiCegtwS4nXkKQgm9QaIiRSJ9J/ah/L4jqoy2ajOw9HRJ2nwlBQIc8RTbl6
 3PC69Row==;
Received: from webng-gw.kapsi.fi ([91.232.154.200] helo=roundcube.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <jyri.sarha@iki.fi>)
 id 1lNEh4-0004zv-6k; Fri, 19 Mar 2021 14:57:34 +0200
MIME-Version: 1.0
Date: Fri, 19 Mar 2021 14:57:31 +0200
From: Jyri Sarha <jyri.sarha@iki.fi>
To: Dario Binacchi <dariobin@libero.it>
Subject: Re: [PATCH] drm/tilcdc: fix LCD pixel clock setting
In-Reply-To: <1180006566.16525.1616104029554@mail1.libero.it>
References: <20210314151342.23404-1-dariobin@libero.it>
 <7df3a270-1cc4-7a71-5e55-49a0dfb2c21f@kernel.org>
 <1180006566.16525.1616104029554@mail1.libero.it>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <8adc90ef6ec8cb1ec3b8fdbdad0233cf@iki.fi>
X-Sender: jyri.sarha@iki.fi
X-SA-Exim-Connect-IP: 91.232.154.200
X-SA-Exim-Mail-From: jyri.sarha@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomba@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-03-18 23:47, Dario Binacchi wrote:
>> Il 17/03/2021 09:19 Tomi Valkeinen <tomba@kernel.org> ha scritto:
>> 
>> 
>> On 14/03/2021 17:13, Dario Binacchi wrote:
>> > As reported by TI spruh73x RM, the LCD pixel clock (LCD_PCLK) frequency
>> > is obtained by dividing LCD_CLK, the LCD controller reference clock,
>> > for CLKDIV:
>> >
>> > LCD_PCLK = LCD_CLK / CLKDIV
>> >
>> > where CLKDIV must be greater than 1.
>> >
>> > Therefore LCD_CLK must be set to 'req_rate * CLKDIV' instead of req_rate
>> 
>> The above doesn't make sense, the code already sets LCD_CLK to 
>> 'req_rate
>> * clkdiv', not req_rate.
>> 
>> > and the real LCD_CLK rate must be compared with 'req_rate * CLKDIV' and
>> > not with req_rate.
>> 
>> This is true, the code looks at the wrong value.
>> 
>> > Passing req_rate instead of 'req_rate * CLKDIV' to the tilcdc_pclk_diff
>> > routine caused it to fail even if LCD_CLK was properly set.
>> >
>> > Signed-off-by: Dario Binacchi <dariobin@libero.it>
>> >
>> > ---
>> >
>> >   drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 9 +++++----
>> >   1 file changed, 5 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
>> > index 30213708fc99..02f56c9a5da5 100644
>> > --- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
>> > +++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
>> > @@ -203,7 +203,7 @@ static void tilcdc_crtc_set_clk(struct drm_crtc *crtc)
>> >   	struct drm_device *dev = crtc->dev;
>> >   	struct tilcdc_drm_private *priv = dev->dev_private;
>> >   	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
>> > -	unsigned long clk_rate, real_rate, req_rate;
>> > +	unsigned long clk_rate, real_rate, req_rate, clk_div_rate;
>> >   	unsigned int clkdiv;
>> >   	int ret;
>> >
>> > @@ -211,10 +211,11 @@ static void tilcdc_crtc_set_clk(struct drm_crtc *crtc)
>> >
>> >   	/* mode.clock is in KHz, set_rate wants parameter in Hz */
>> >   	req_rate = crtc->mode.clock * 1000;
>> > -
>> > -	ret = clk_set_rate(priv->clk, req_rate * clkdiv);
>> > +	/* LCD clock divisor input rate */
>> > +	clk_div_rate = req_rate * clkdiv;
>> 
>> "clk_div_rate" sounds a bit odd to me. Why not lcd_fck_rate, as that's
>> the name used later? Or lcd_clk_rate. Or maybe lcd_clk_req_rate...
> 
> I prefer lcd_clk_rate.
> 
> How about adding an additional patch that changes the variable names to 
> make
> the code more readable?
> 
> req_rate -> lcd_pclk_rate
> clk_rate -> real_lcd_clk_rate
> 
> And add a comment to the function which highlights the relationship
> LCD_CLK = LCD_PCLK * CLDIV ?
> 

What about renaming current req_rate to pclk_rate (for pixel clock 
rate), and calling pclk_rate * clkdiv = req_rate, as that is the rate we 
need to request from the input clock? Adding lcd to local variable names 
here is quite redundant after all. In any case req_rate is bit 
misleading name here and probably part of the reason why the bug exists 
in the first place.

Best regards,
Jyri



>> 
>> > +	ret = clk_set_rate(priv->clk, clk_div_rate);
>> >   	clk_rate = clk_get_rate(priv->clk);
>> > -	if (ret < 0 || tilcdc_pclk_diff(req_rate, clk_rate) > 5) {
>> > +	if (ret < 0 || tilcdc_pclk_diff(clk_div_rate, clk_rate) > 5) {
>> >   		/*
>> >   		 * If we fail to set the clock rate (some architectures don't
>> >   		 * use the common clock framework yet and may not implement
>> >
>> 
>> I think this fix is fine, but looking at the current code, it's 
>> calling
>> tilcdc_pclk_diff(), but doesn't actually provide pixel clocks to the
>> function, but fclk.
> 
> Yes, I agree.
> 
> Thanks and regards,
> Dario
> 
>> 
>>   Tomi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
