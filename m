Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA0140245F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 09:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D86897EE;
	Tue,  7 Sep 2021 07:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A0A897B5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 07:31:54 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210907073152euoutp02fd0ca450771c2f5d8e5027c6271ac151~iecdnt9ee0898308983euoutp02I
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 07:31:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210907073152euoutp02fd0ca450771c2f5d8e5027c6271ac151~iecdnt9ee0898308983euoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1630999912;
 bh=VHwoThu2t13RTtKG/UpRWTOzMMH/Ns2mGqMF4LWCs/U=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=EbvsSUEllJMZIRDCpYq2MxTJSGrWJflZm5Xj5iUfQ2HIsD1jyx90mzcadBsuJvrbw
 d0qQ/iVjilOGrnA+TjvHbkh+vIlWD+dRSFcfJkeKh5WMYJzfoOOEAa1D+Ej0Z+Hgb9
 wz6ukULdjlTQDXej3G5e3RWTAIFGhGSp6ycUT2hg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210907073152eucas1p18a3f04148dc1f09f393b2d249f2156a4~iecdgx1xf0242902429eucas1p1G;
 Tue,  7 Sep 2021 07:31:52 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id FF.33.42068.86517316; Tue,  7
 Sep 2021 08:31:52 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210907073151eucas1p196543fbd114f34f6de700013fd0e4168~iecdHNxmg1063810638eucas1p15;
 Tue,  7 Sep 2021 07:31:51 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210907073151eusmtrp1357c552bfe9273c7bf11edf87b7feabd~iecdGXezZ2542025420eusmtrp1B;
 Tue,  7 Sep 2021 07:31:51 +0000 (GMT)
X-AuditID: cbfec7f4-212c7a800002a454-5a-613715684f00
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id EE.CD.20981.76517316; Tue,  7
 Sep 2021 08:31:51 +0100 (BST)
Received: from [192.168.0.14] (unknown [106.210.131.79]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210907073151eusmtip1e53b5281582db40a50efe10e0f104438~ieccpvWhD2056720567eusmtip1U;
 Tue,  7 Sep 2021 07:31:51 +0000 (GMT)
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Check link status register
 after enabling the bridge
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: Jagan Teki <jagan@amarulasolutions.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Linus Walleij
 <linus.walleij@linaro.org>, Robert Foss <robert.foss@linaro.org>, Sam
 Ravnborg <sam@ravnborg.org>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <2f530ec2-3781-67eb-6f34-c7b6a29641ea@samsung.com>
Date: Tue, 7 Sep 2021 09:31:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210907023948.871281-1-marex@denx.de>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsWy7djP87oZouaJBpv3s1lc+fqezeLLpgls
 Fp0Tl7BbTPmznMniTVsjo8WnWQ+ZLVb83MrowO6x9uN9Vo95s06weMzumMnqcefaHjaP+93H
 mTyWTLvKFsAWxWWTkpqTWZZapG+XwJXxaN525oI7ghWr9xxmbWB8xtfFyMEhIWAisfavZhcj
 F4eQwApGiaUvXjBBOF8YJZZtbWeBcD4zSvQ0TWCC6diySw8ivpxR4v+m7+wQzltGiXN9G5i7
 GDk5hAVSJdqWXWEDsUUEHCQOtk9mBiliFrjBKNF9/hBYgk1AU+Lv5ptgNq+AncSxuTvYQDaw
 CKhIXHnnARIWFYiU+HtyFytEiaDEyZlPWEBsTqAjml6dZgKxmQXEJW49mQ9ly0tsfzsHbJeE
 wAsOiR+dhxhBEhICLhKbmp8zQ9jCEq+Ob2GHsGUkTk/uYYGw6yXur2iBau5glNi6YSdUg7XE
 nXO/wI5jBjp6/S59iLCjxI3/u1khocInceOtIMQNfBKTtk1nhgjzSnS0CUFUK0rcP7sVaqC4
 xNILX9kmMCrNQvLZLCTfzELyzSyEvQsYWVYxiqeWFuempxYb5aWW6xUn5haX5qXrJefnbmIE
 JqPT/45/2cG4/NVHvUOMTByMhxglOJiVRHj/mpslCvGmJFZWpRblxxeV5qQWH2KU5mBREudN
 2rImXkggPbEkNTs1tSC1CCbLxMEp1cDUHHfF/ax1y2vrSZ+l6ze21v3OEXtjz/1P6vmV+yvj
 dR/sCj+xWi52j5H5tCk1FV1n+zKObjootrdF4awZ/8wtS/vDrl1yXT+l6kMNg7FAmkB59j3W
 Pf8OntrTLMU8LbdWQvLwN+O21J7I/8/Ulrkd5asJCVkw8eAWxjkbOqeE5pc9t1hkfKu+xsKv
 wLc2cjfD2u8qe34u5b2wY/nXhIMrHxz6zT+niePstNplKoYda7xypbjmN/Msux/B07YgPCzY
 IdC2gC3mxtuvdhZHCh/slVsXslbyIuOcTcs3Bz79PLWBn53n6ESVS9te3It8dK+wJy3cLmbN
 7Wkl57WEfn9ZtN38zZv8vKNRFoavEv/3KbEUZyQaajEXFScCACIU7ZK1AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRmVeSWpSXmKPExsVy+t/xu7rpouaJBj8aNSyufH3PZvFl0wQ2
 i86JS9gtpvxZzmTxpq2R0eLTrIfMFit+bmV0YPdY+/E+q8e8WSdYPGZ3zGT1uHNtD5vH/e7j
 TB5Lpl1lC2CL0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst
 0rdL0Mt4NG87c8EdwYrVew6zNjA+4+ti5OCQEDCR2LJLr4uRi0NIYCmjxOw7raxdjJxAcXGJ
 3fPfMkPYwhJ/rnWxgdhCAq8ZJRofJoHYwgKpEm3LroDFRQQcJA62T2YGGcQscINRYsaNg+wQ
 DcYSs/4vAhvKJqAp8XfzTbAGXgE7iWNzd7CBHMEioCJx5Z0HSFhUIFKi6cRWqBJBiZMzn7CA
 2JxAdza9Os0EYjMLmEnM2/yQGcIWl7j1ZD5UXF5i+9s5zBMYhWYhaZ+FpGUWkpZZSFoWMLKs
 YhRJLS3OTc8tNtIrTswtLs1L10vOz93ECIy+bcd+btnBuPLVR71DjEwcjIcYJTiYlUR4/5qb
 JQrxpiRWVqUW5ccXleakFh9iNAV6ZyKzlGhyPjD+80riDc0MTA1NzCwNTC3NjJXEeU2OrIkX
 EkhPLEnNTk0tSC2C6WPi4JRqYJpySWYle2y/zdsvta+vcJYpfV4x67P3wqlOyecncdn3ha8L
 Pex4qOCt8XObxTGKqcsbvtjN9Wjve8xynr1M/VSy+YTVvwJfKWV0Sh/56Fl1tfWLec4bnpJr
 07ZFSSVMeLaCRZCT8UfKrHd7zptW2e3v0Zf5fNDM/eXkw6X+JU9appTlH9w/teTM18Jb32SO
 cVyfcHxFgcK1N9NUWESYGOa9aij5acguVnHKXyR7kytL91oevox5Kszrspjk//XZXOvm3/B4
 ynzhA/K+aTvDFTJqt7l6tK//qcReFP1INGrm4X/5Eg1HXfdaXjpSWLCleqXxKgYGkR15Z1bO
 mdfM8U/yYNbFxQrTXqo/qW0/U6DEUpyRaKjFXFScCABr7/M7RwMAAA==
X-CMS-MailID: 20210907073151eucas1p196543fbd114f34f6de700013fd0e4168
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210907073151eucas1p196543fbd114f34f6de700013fd0e4168
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210907073151eucas1p196543fbd114f34f6de700013fd0e4168
References: <20210907023948.871281-1-marex@denx.de>
 <CGME20210907073151eucas1p196543fbd114f34f6de700013fd0e4168@eucas1p1.samsung.com>
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

On 07.09.2021 04:39, Marek Vasut wrote:
> In rare cases, the bridge may not start up correctly, which usually
> leads to no display output. In case this happens, warn about it in
> the kernel log.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
> NOTE: See the following:
> https://e2e.ti.com/support/interface-group/interface/f/interface-forum/942005/sn65dsi83-dsi83-lvds-bridge---sporadic-behavior---no-video
> https://community.nxp.com/t5/i-MX-Processors/i-MX8M-MIPI-DSI-Interface-LVDS-Bridge-Initialization/td-p/1156533
> ---
>   drivers/gpu/drm/bridge/ti-sn65dsi83.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index a32f70bc68ea4..4ea71d7f0bfbc 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -520,6 +520,11 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
>   	/* Clear all errors that got asserted during initialization. */
>   	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
>   	regmap_write(ctx->regmap, REG_IRQ_STAT, pval);


It does not look as correct error handling, maybe it would be good to 
analyze and optionally report 'unexpected' errors here as well.


> +
> +	usleep_range(10000, 12000);
> +	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
> +	if (pval)
> +		dev_err(ctx->dev, "Unexpected link status 0x%02x\n", pval);


I am not sure what is the case here but it looks like 'we do not know 
what is going on, so let's add some diagnostic messages to gather info 
and figure it out later'.

Whole driver lacks IRQ handler which IMO could perform better diagnosis, 
and I guess it could also help in recovery, but this is just my guess.
So if this patch is enough for now you can add:

Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Regards
Andrzej


>   }
>   
>   static void sn65dsi83_atomic_disable(struct drm_bridge *bridge,
> 

