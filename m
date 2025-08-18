Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BCAB2AC54
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 17:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7511F10E479;
	Mon, 18 Aug 2025 15:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="gg1Uggjv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 319 seconds by postgrey-1.36 at gabe;
 Mon, 18 Aug 2025 07:54:56 UTC
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.79.153])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CE410E412
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 07:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
 s=mxsw2412; t=1755503661;
 bh=M7FG8rcP3ahTEEVM6NGqGjxSRQwruFZ03rYRJPa/Wxk=;
 h=Date:From:To:Subject:Message-ID:MIME-Version;
 b=gg1Uggjv+rScTKYJEhC0aZqoipSbtYZDQpOPdmkzZw8c284UDUjVzAHf79ReQyGN1
 mxczeH2WTAa9ih2qOMeucPAYEQInxWU7xvGd0BkA9zFjt2/bTKjLifa8J2rROXSni6
 frn7drJfCaeaIZh8kNOCgZiuyxHJwar5+UUdaR5o=
X-QQ-mid: esmtpgz14t1755503659t78ac8189
X-QQ-Originating-IP: ZO7sqOcVCqag9e3u+tTDpLwUHxzVsU3LE4vNP/SahMk=
Received: from = ( [61.145.255.150]) by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 18 Aug 2025 15:54:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8049969608128099302
EX-QQ-RecipientCnt: 29
Date: Mon, 18 Aug 2025 15:54:17 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Icenowy Zheng <uwu@icenowy.me>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Heiko Stuebner <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH 5/8] drm/bridge: add a driver for T-Head TH1520 HDMI
 controller
Message-ID: <A3089DC4F031A2C0+aKLcKYtWzpLdB0lH@LT-Guozexi>
References: <20250814164048.2336043-1-uwu@icenowy.me>
 <20250814164048.2336043-6-uwu@icenowy.me>
 <sp2pdifimqych5zn3mt7pnba3vl25qflgiys76s7dwmyt3jd72@bmwkc7s6p6c4>
 <63b2ac72fe1d15d214e880f223bb3035e177a07b.camel@icenowy.me>
 <F2C43938B17FA1E1+aKLaKQfN1Ax8Blcx@LT-Guozexi>
 <7ad9a700dce9342d720740525626340237eb8d9f.camel@icenowy.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ad9a700dce9342d720740525626340237eb8d9f.camel@icenowy.me>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NvKPgl6nhXeJ0i1AzucknNYoQ9S4pmEuXT9vmM+n/P7THJET7vYBi28D
 WZfnC+HWfLd5qGsoe8dIF3ZWRBDuX77CwnKDK6+1n1DLH9qxrs8c06N5VrxTcSbUGP6Ek0s
 xzEXiCPN7/r2lrDd/F1SO/OpNrUKHMsx5jLlFtO9go4lLiqw8yBihu2bv/orCfk5OapDdHa
 QmNYoVV7kJwdmnl2D6AeUlrDKS/N/gqyDiCiyvyNF4e79s9M81n/svWvJgp7eF3bSVIqCM2
 sh58I9wdgN8PBGFJHK3Z5BPegPTAyec7Q1sfvfhPuOHG+dO833/thUPsVkreBRZd8M/NG+u
 AVslVrjiRBcGBhTw/Gcss2jiSemaBcEFk41sX5nrCpp+OvejvyYhaF7MQAqFGz/9Xfbx7m0
 bOc7q6Q9oIbQgaYJq21IYv2NDQELkeQ53L2UlBWjHwuSnQ9uGgIKQC8q1MZg05vnOMAHj5P
 SGr56e4B4wY5cCvSuq3lOz44TiUGoeAxvK59llGc102Kyo7kIBmzOU6H62a2Szp32iAtYfb
 aVOa1ogbs4me7rT0GjWrBJk8Dh6xHtUtKFm31eGCR+VOiovqZg42t9PnjpFxqhaWjp9vUDF
 yoSBYLnnKbh2DhFFX2ipQXeB0P3/dJwneZrguDJ5iWOFTGLUI94NK8eRadVnagezNLnvJDL
 JTB9QN4WDSEZeiSxALhKhbPeG+HjhgAAjxUYCR1KXxJiBz/NFDYBwXU9tJMhAp5aqSWI0J6
 tnv+5xqMm/gpEUu9mocuVIJuzBmroxZSscVTInZMO6f85JfQtsdzq814eXuG/MWyHCY1TGz
 qYLxjCiOHcGbPPpjKWky0oTpOSmQy52QGpnshRK3C8eZiIYl2mu4ZJ/v/xnuk0D6yyxk8nF
 0ICr5acVsbmHZS9ENYV+NNOPvqr5RnR4eEpTI7reO+UW0IoILgIY3wO104fv/84Ig1JTR1V
 OkRZgtLNE+l4DwoWp3nAXNhiuin/H4aL8oQW0le+Fw9+Cm2Vtq/pz7qMu/MqtB9PKEzBUTv
 OYsVDY+Us4ceOfvWRRClNs/G98hKb9Gps5BYsHrdfDbj8GbnSByOJSraSWTY67LZ8BamvH4
 QrVvA5SMwCrYkR0HckvB+krH94hel/NxQ==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-Mailman-Approved-At: Mon, 18 Aug 2025 15:16:13 +0000
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

On Mon, Aug 18, 2025 at 03:47:28PM +0800, Icenowy Zheng wrote:
> 在 2025-08-18星期一的 15:45 +0800，Troy Mitchell写道：
> > On Sun, Aug 17, 2025 at 01:10:44AM +0800, Icenowy Zheng wrote:
> > > 在 2025-08-16星期六的 19:24 +0300，Dmitry Baryshkov写道：
> > > > On Fri, Aug 15, 2025 at 12:40:45AM +0800, Icenowy Zheng wrote:
> > > > > T-Head TH1520 SoC contains a Synopsys DesignWare HDMI
> > > > > controller
> > > > > (paired
> > > > > with DesignWare HDMI TX PHY Gen2) that takes the "DP" output
> > > > > from
> > > > > the
> > > > > display controller.
> > > > > 
> > > > > Add a driver for this controller utilizing the common
> > > > > DesignWare
> > > > > HDMI
> > > > > code in the kernel.
> > > > > 
> > > > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > > > ---
[...]
> > > > > +static int th1520_hdmi_phy_configure(struct dw_hdmi *hdmi,
> > > > > void
> > > > > *data,
> > > > > +                                    unsigned long mpixelclock)
> > > > > +{
> > > > > +       const struct th1520_hdmi_phy_params *params =
> > > > > th1520_hdmi_phy_params;
> > > > > +
> > > > > +       for (; params->mpixelclock != ~0UL; ++params) {
> > > > > +               if (mpixelclock <= params->mpixelclock)
> > > > > +                       break;
> > > > 
> > > > for (...) {
> > > >         if (mpixelclock <= params->mpixelclock)
> > > >                 return th1520_program_phy();
> > > 
> > > There's no such a function here, and this check isn't used for
> > > another
> > > time, so having the matching code and programming code extracted
> > > out
> > > can help nothing.
> > I think Dmitry meant that the following code should be moved into
> > a new function, th1520_program_phy().  
> > 
> > This makes the code cleaner and also avoids one extra if check.
> 
> As there's no code reuse, it does not make code cleaner.
I respect your opinion, but let's also see what Dmitry has to say.

                - Troy
> 
> > 
> >                 - Troy
> > > 
> > > > }
> > > > 
> > > > return -EINVAL;
> > > > 
> > > > > +       }
> > > > > +
> > > > > +       if (params->mpixelclock == ~0UL)
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       dw_hdmi_phy_i2c_write(hdmi, params->opmode_pllcfg,
> > > > > +                             TH1520_HDMI_PHY_OPMODE_PLLCFG);
> > > > > +       dw_hdmi_phy_i2c_write(hdmi, params->pllcurrgmpctrl,
> > > > > +                             TH1520_HDMI_PHY_PLLCURRGMPCTRL);
> > > > > +       dw_hdmi_phy_i2c_write(hdmi, params->plldivctrl,
> > > > > +                             TH1520_HDMI_PHY_PLLDIVCTRL);
> > > > > +       dw_hdmi_phy_i2c_write(hdmi, params->vlevctrl,
> > > > > +                             TH1520_HDMI_PHY_VLEVCTRL);
> > > > > +       dw_hdmi_phy_i2c_write(hdmi, params->cksymtxctrl,
> > > > > +                             TH1520_HDMI_PHY_CKSYMTXCTRL);
> > > > > +       dw_hdmi_phy_i2c_write(hdmi, params->txterm,
> > > > > +                             TH1520_HDMI_PHY_TXTERM);
> > > > > +
> > > > > +       return 0;
> > > > > +}
> > > > > +
> > > > > +static int th1520_dw_hdmi_probe(struct platform_device *pdev)
> > > > > +{
> > > > > +       struct th1520_hdmi *hdmi;
> > > > > +       struct dw_hdmi_plat_data *plat_data;
> > > > > +       struct device *dev = &pdev->dev;
> > > > > +
> > > > > +       hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
> > > > > +       if (!hdmi)
> > > > > +               return -ENOMEM;
> > > > > +
> > > > > +       plat_data = &hdmi->plat_data;
> > > > > +
> > > > > +       hdmi->pixclk = devm_clk_get_enabled(dev, "pix");
> > > > > +       if (IS_ERR(hdmi->pixclk))
> > > > > +               return dev_err_probe(dev, PTR_ERR(hdmi-
> > > > > >pixclk),
> > > > > +                                    "Unable to get pixel
> > > > > clock\n");
> > > > > +
> > > > > +       hdmi->mainrst =
> > > > > devm_reset_control_get_exclusive_deasserted(dev, "main");
> > > > > +       if (IS_ERR(hdmi->mainrst))
> > > > > +               return dev_err_probe(dev, PTR_ERR(hdmi-
> > > > > >mainrst),
> > > > > +                                    "Unable to get main
> > > > > reset\n");
> > > > > +
> > > > > +       hdmi->prst =
> > > > > devm_reset_control_get_exclusive_deasserted(dev, "apb");
> > > > > +       if (IS_ERR(hdmi->prst))
> > > > > +               return dev_err_probe(dev, PTR_ERR(hdmi->prst),
> > > > > +                                    "Unable to get apb
> > > > > reset\n");
> > > > > +
> > > > > +       plat_data->output_port = 1;
> > > > > +       plat_data->mode_valid = th1520_hdmi_mode_valid;
> > > > > +       plat_data->configure_phy = th1520_hdmi_phy_configure;
> > > > > +       plat_data->priv_data = hdmi;
> > > > > +
> > > > > +       hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
> > > > > +       if (IS_ERR(hdmi))
> > > > > +               return PTR_ERR(hdmi);
> > > > > +
> > > > > +       platform_set_drvdata(pdev, hdmi);
> > > > > +
> > > > > +       return 0;
> > > > > +}
> > > > > +
> > > > > +static void th1520_dw_hdmi_remove(struct platform_device
> > > > > *pdev)
> > > > > +{
> > > > > +       struct dw_hdmi *hdmi = platform_get_drvdata(pdev);
> > > > > +
> > > > > +       dw_hdmi_remove(hdmi);
> > > > > +}
> > > > > +
> > > > > +static const struct of_device_id th1520_dw_hdmi_of_table[] = {
> > > > > +       { .compatible = "thead,th1520-dw-hdmi" },
> > > > > +       { /* Sentinel */ },
> > > > > +};
> > > > > +MODULE_DEVICE_TABLE(of, th1520_dw_hdmi_of_table);
> > > > > +
> > > > > +static struct platform_driver th1520_dw_hdmi_platform_driver =
> > > > > {
> > > > > +       .probe          = th1520_dw_hdmi_probe,
> > > > > +       .remove         = th1520_dw_hdmi_remove,
> > > > > +       .driver         = {
> > > > > +               .name   = "th1520-dw-hdmi",
> > > > > +               .of_match_table = th1520_dw_hdmi_of_table,
> > > > > +       },
> > > > > +};
> > > > > +
> > > > > +module_platform_driver(th1520_dw_hdmi_platform_driver);
> > > > > +
> > > > > +MODULE_AUTHOR("Icenowy Zheng <uwu@icenowy.me>");
> > > > > +MODULE_DESCRIPTION("T-Head TH1520 HDMI Encoder Driver");
> > > > > +MODULE_LICENSE("GPL");
> > > > > -- 
> > > > > 2.50.1
> > > > > 
> > > > 
> > > 
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
