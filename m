Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E2BC42AA0
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 10:39:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401F610E168;
	Sat,  8 Nov 2025 09:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ls7tILJ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F60E10E120
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 08:30:06 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-429c8632fcbso984653f8f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Nov 2025 00:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762590604; x=1763195404; darn=lists.freedesktop.org;
 h=mime-version:msip_labels:content-language:accept-language
 :message-id:date:thread-index:thread-topic:subject:cc:to:from:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2uIu0CumvTbQ6vLAamRpxY6bY0AfTVFLPioOXX+otFw=;
 b=ls7tILJ6P31wxLhmrjIIbS6tb1pdF/xLL8G6ys/doxS6N4RocSeHAvdAMJSpLl/Zxb
 vfIxegBcPbHV6W7bpMsU5hJ92OHx7Geoz5P8JpTUGvXzAKOwad8TO/XmmKrVWjZXhDv3
 sLRwz1TXYrRonEb4qZ83/aRuNNDQ3KFQrv3lLbap4xRv+yha3YJL/xS10SRtqfjJk9lH
 6r04UNwZGsatwr5XNM9bFdlqZS2p11Ox7poHm024M53R5xkRtcwy5iqOsDFUmBtmpexz
 XORT9tdq8LP0ikm4CcLghu4U0tKoiSkt3slYoHu1/5sQqVWT09xLGAhWCSi+xYVBj66c
 ZvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762590604; x=1763195404;
 h=mime-version:msip_labels:content-language:accept-language
 :message-id:date:thread-index:thread-topic:subject:cc:to:from
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2uIu0CumvTbQ6vLAamRpxY6bY0AfTVFLPioOXX+otFw=;
 b=wc0xXe1uht1Ne5mmDkz1PR08RaWKsUpCBcIf90SVnWF5t73L/kOYOfTLUHJZIb4qH0
 4jauwMC48MtkOnJ+ebsAQfSEdN7YHH6jmgEat/Ej79BHlyy8ecDzB+Sq4xfANHaJyawf
 dI1/R0aWnInP8EhC7tGy4zo9G7lqJLzeFXJXeJwkrlmeAIHPDpdEgiHFWKebVAeeBEoZ
 mbzADhQ82FkfXaUjftr8zCQVSJcHAP7t1Pe+xEQXiwJnSxFiHIlmm8+O/QlHu5nCHmc2
 yA3rBh50h9X4LfCYfGtTeqGtEUDcBUFF1juhy6Uhv3NKRH4c70R2lAFPHGORG+UpgmzL
 Vheg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFKZJjr2z5nix9Zajy5yD3sRCA/853OFMLbesjkJAKPDBMPaSGBbFPhEPAUmOXsvIIVITAq3C3FLw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzur2AEw7xcsZJlc53x8d3eM6FBIV53K5wK0AztnBTNV12ACBYT
 aW1XgNY61hdPrw1A43VUUYCd9ehr8MrTHGDgAXVzO+FxLtubjZe3NDu4
X-Gm-Gg: ASbGncsEoEi6aivoR++deskM/FWCADynCNCy7X+YAj/qQQ3ODcavwmCa9SRd6PAm4nN
 UyEDSuN0L4forvShmuxvUX+UzaNLfcxVjGjNq1z+G95AZJapf8Nc035U8nxfY904ycFFGa0vFxb
 uOqV6wLXWWzxFcV/tX+zbIOmLrKBLQ5xNPbYTQYmL12k7mNVN0g0iRU4fmv5Fgx4Z3yZdSAoR3A
 /AJo9dD68t5jujZ2MhMJ+NFTvFhHeHEX8ZWnRlkHAszBja07p92OVv/cVPK6IYiuVx3ug6lhxLs
 FeS8dFpUNXtmx3qtKAatRKdJVe10AZpaxH4XAlaBMYwYRSuwkBA4BrbDsd4O3rYe/JT/Q+s+ZRm
 rkWn7Et6ugz/Fjl+YZGYsconSZ3v5kJvDuY92EoIg+P0O/RK3dYz4TpaHmur6RIeU2wPKN+gGnL
 1oqHLNl2EQH9ogCEll9usmkBGwTAKcrLwlIITg9lGFkrb/plWC6dJ17g0CfzxRm+Mg/pLehC4Qw
 A==
X-Google-Smtp-Source: AGHT+IGrYnsBv09aF3r9URdali17Sj7bKqYDyGGbPy+1GWjgsQs6NcrfDubQABz1QTp/gBxcP0EuQg==
X-Received: by 2002:a05:6000:230c:b0:429:8c4e:b0c8 with SMTP id
 ffacd0b85a97d-42b2dc03e78mr1544394f8f.27.1762590604111; 
 Sat, 08 Nov 2025 00:30:04 -0800 (PST)
Received: from CWLP123MB4499.GBRP123.PROD.OUTLOOK.COM ([2603:1026:c08:c1::5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b303386f1sm1289466f8f.3.2025.11.08.00.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Nov 2025 00:30:03 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
To: "chris.brandt@renesas.com" <chris.brandt@renesas.com>
CC: "airlied@gmail.com" <airlied@gmail.com>, "biju.das.jz@bp.renesas.com"
 <biju.das.jz@bp.renesas.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "geert+renesas@glider.be"
 <geert+renesas@glider.be>, "hien.huynh.px@renesas.com"
 <hien.huynh.px@renesas.com>, "hugo@hugovil.com" <hugo@hugovil.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "mturquette@baylibre.com"
 <mturquette@baylibre.com>, "nghia.vo.zn@renesas.com"
 <nghia.vo.zn@renesas.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>
Subject: Re: [PATCH v4 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Topic: [PATCH v4 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Index: AQHcUIhzzvEMa+4Ez0iYgZqH/QRQ7w==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Sat, 8 Nov 2025 08:30:03 +0000
Message-ID: <CWLP123MB44995816738B58D66F4729B0FCC0A@CWLP123MB4499.GBRP123.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
msip_labels: 
Content-Type: multipart/alternative;
 boundary="_000_CWLP123MB44995816738B58D66F4729B0FCC0ACWLP123MB4499GBRP_"
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 08 Nov 2025 09:39:27 +0000
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

--_000_CWLP123MB44995816738B58D66F4729B0FCC0ACWLP123MB4499GBRP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Chris,

On Wed,  5 Nov 2025 17:25:29 -0500
Chris Brandt <chris.brandt@renesas.com> wrote:

> Convert the limited MIPI clock calculations to a full range of settings
> based on math including H/W limitation validation.
> Since the required DSI division setting must be specified from external
> sources before calculations, expose a new API to set it.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> ---
> v1->v2:
> - Remove unnecessary parentheses
> - Add target argument to new API
> - DPI mode has more restrictions on DIV_A and DIV_B
>
> v2->v3:
> - Removed Empty lines (Hugo)
> - Add dummy for compile-testing CONFIG_CLK_RZG2L=3Dn case (Geert)
> - Renamed label found_dsi_div to calc_pll_clk (Hugo)
> - Renamed label found_clk to clk_valid (Hugo)
> - Removed 'found' var because not needed
> - Move 'foutpostdiv_rate =3D' after if(foutvco_rate > 1500000000) (Hugo)
> - Move PLL5_TARGET_* for new API to renesas.h (Hugo,Geert)
> - Convert #define macros PLL5_TARGET_* to enum (Geert)
> - static {unsigned} int dsi_div_ab; (Geert)
> - {unsigned} int a, b;  (Geert)
> - Change "((1 << a) * (b + 1))" to "(b + 1) << a"  (Geert)
> - Change "foutvco_rate =3D rate * (1 << xxx ) * ..." to " =3D rate * ... =
* << xxx (Geert)
> - Move (u64) outside of modulo operation to avoid helper on 32-bit compil=
es (Geert)
> - Change DIV_ROUND_CLOSEST_ULL() to DIV_ROUND_CLOSEST() (Geert)
> - void rzg2l_cpg_dsi_div_set_divider({unsinged} int divider, int target)
> - Change "dsi_div_ab =3D (1 << AAA) * (BBB + 1)" to " =3D (BBB + 1) << AA=
A (Geert)
> - Added Reviewed-by and Tested-by (Biju)
>
> v3->v4:
> - Changed <,> to <=3D,>=3D  (Hugo)
> - Removed duplicate code bock (copy/paste mistake) (Hugo)
> - Fix dummy for rzg2l_cpg_dsi_div_set_divider when CONFIG_CLK_RZG2L=3Dn (=
Geert)
> - Remove comment "Below conditions must be set.." (Hugo)
> - Remove +1,-1 from pl5_intin comparison math (kernel test robot)
> - Remove default register settings (PLL5_xxx_DEF) because makes no sense
> - If any calcualtion error, print a message and return a rate of 0
> - Rename global var "dsi_div_ab" to "dsi_div_ab_desired"
> - Check the range of hsclk
> - The correct clock parent is determined by if the divider is even/odd
> - Add in all the restrictions from DIV A,B from the hardware manual
> - No more need to be a recursive function
> - DPI settings must have DSI_DIV_B be '0' (divide 1/1)
> ---
>  drivers/clk/renesas/rzg2l-cpg.c | 147 +++++++++++++++++++++++++++++---
>  include/linux/clk/renesas.h     |  12 +++
>  2 files changed, 146 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-=
cpg.c
> index 07909e80bae2..1a552ea1c535 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -74,6 +74,17 @@
>  #define MSTOP_OFF(conf)              FIELD_GET(GENMASK(31, 16), (conf))
>  #define MSTOP_MASK(conf)     FIELD_GET(GENMASK(15, 0), (conf))
>

>

> +     if (dsi_div_target =3D=3D PLL5_TARGET_DPI) {
> +             /* Fixed settings for DPI */
> +             priv->mux_dsi_div_params.clksrc =3D 0;
> +             priv->mux_dsi_div_params.dsi_div_a =3D 3; /* Divided by 8 *=
/
> +             priv->mux_dsi_div_params.dsi_div_b =3D 0; /* Divided by 1 *=
/
> +             dsi_div_ab_desired =3D 8;                 /* (1 << a) * (b =
+ 1) */

This block is duplicated may be add a helper function(), if you are plannin=
g to send another series.

> +     }

> +     /* Default settings for DPI */
> +     priv->mux_dsi_div_params.clksrc =3D 0;
> +     priv->mux_dsi_div_params.dsi_div_a =3D 3; /* Divided by 8 */
> +     priv->mux_dsi_div_params.dsi_div_b =3D 0; /* Divided by 1 */
> +     dsi_div_ab_desired =3D 8;                 /* (1 << a) * (b + 1) */
>


Cheers,
Biju

--_000_CWLP123MB44995816738B58D66F4729B0FCC0ACWLP123MB4499GBRP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<pre class=3D"elementToProof"><pre class=3D"elementToProof" id=3D"b"><div s=
tyle=3D"text-align: left; text-indent: 0px; white-space: pre-wrap; font-fam=
ily: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sa=
ns-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">H=
i Chris,=0A=
=0A=
On Wed, &nbsp;5 Nov 2025 17:25:29 -0500=0A=
Chris Brandt &lt;chris.brandt@renesas.com&gt; wrote:=0A=
=0A=
&gt; Convert the limited MIPI clock calculations to a full range of setting=
s=0A=
&gt; based on math including H/W limitation validation.=0A=
&gt; Since the required DSI division setting must be specified from externa=
l=0A=
&gt; sources before calculations, expose a new API to set it.=0A=
&gt; =0A=
&gt; Signed-off-by: Chris Brandt &lt;chris.brandt@renesas.com&gt;=0A=
&gt; Reviewed-by: Biju Das &lt;biju.das.jz@bp.renesas.com&gt;=0A=
&gt; Tested-by: Biju Das &lt;biju.das.jz@bp.renesas.com&gt;=0A=
&gt; =0A=
&gt; ---=0A=
&gt; v1-&gt;v2:=0A=
&gt; - Remove unnecessary parentheses=0A=
&gt; - Add target argument to new API=0A=
&gt; - DPI mode has more restrictions on DIV_A and DIV_B=0A=
&gt; =0A=
&gt; v2-&gt;v3:=0A=
&gt; - Removed Empty lines (Hugo)=0A=
&gt; - Add dummy for compile-testing CONFIG_CLK_RZG2L=3Dn case (Geert)=0A=
&gt; - Renamed label found_dsi_div to calc_pll_clk (Hugo)=0A=
&gt; - Renamed label found_clk to clk_valid (Hugo)=0A=
&gt; - Removed 'found' var because not needed=0A=
&gt; - Move 'foutpostdiv_rate =3D' after if(foutvco_rate &gt; 1500000000) (=
Hugo)=0A=
&gt; - Move PLL5_TARGET_* for new API to renesas.h (Hugo,Geert)=0A=
&gt; - Convert #define macros PLL5_TARGET_* to enum (Geert)=0A=
&gt; - static {unsigned} int dsi_div_ab; (Geert)=0A=
&gt; - {unsigned} int a, b; &nbsp;(Geert)=0A=
&gt; - Change &quot;((1 &lt;&lt; a) * (b + 1))&quot; to &quot;(b + 1) &lt;&=
lt; a&quot; &nbsp;(Geert)=0A=
&gt; - Change &quot;foutvco_rate =3D rate * (1 &lt;&lt; xxx ) * ...&quot; t=
o &quot; =3D rate * ... * &lt;&lt; xxx (Geert)=0A=
&gt; - Move (u64) outside of modulo operation to avoid helper on 32-bit com=
piles (Geert)=0A=
&gt; - Change DIV_ROUND_CLOSEST_ULL() to DIV_ROUND_CLOSEST() (Geert)=0A=
&gt; - void rzg2l_cpg_dsi_div_set_divider({unsinged} int divider, int targe=
t)=0A=
&gt; - Change &quot;dsi_div_ab =3D (1 &lt;&lt; AAA) * (BBB + 1)&quot; to &q=
uot; =3D (BBB + 1) &lt;&lt; AAA (Geert)=0A=
&gt; - Added Reviewed-by and Tested-by (Biju)=0A=
&gt; =0A=
&gt; v3-&gt;v4:=0A=
&gt; - Changed &lt;,&gt; to &lt;=3D,&gt;=3D &nbsp;(Hugo)=0A=
&gt; - Removed duplicate code bock (copy/paste mistake) (Hugo)=0A=
&gt; - Fix dummy for rzg2l_cpg_dsi_div_set_divider when CONFIG_CLK_RZG2L=3D=
n (Geert)=0A=
&gt; - Remove comment &quot;Below conditions must be set..&quot; (Hugo)=0A=
&gt; - Remove +1,-1 from pl5_intin comparison math (kernel test robot)=0A=
&gt; - Remove default register settings (PLL5_xxx_DEF) because makes no sen=
se=0A=
&gt; - If any calcualtion error, print a message and return a rate of 0=0A=
&gt; - Rename global var &quot;dsi_div_ab&quot; to &quot;dsi_div_ab_desired=
&quot;=0A=
&gt; - Check the range of hsclk=0A=
&gt; - The correct clock parent is determined by if the divider is even/odd=
=0A=
&gt; - Add in all the restrictions from DIV A,B from the hardware manual=0A=
&gt; - No more need to be a recursive function=0A=
&gt; - DPI settings must have DSI_DIV_B be '0' (divide 1/1)=0A=
&gt; ---=0A=
&gt; &nbsp;drivers/clk/renesas/rzg2l-cpg.c | 147 ++++++++++++++++++++++++++=
+++---=0A=
&gt; &nbsp;include/linux/clk/renesas.h &nbsp; &nbsp; | &nbsp;12 +++=0A=
&gt; &nbsp;2 files changed, 146 insertions(+), 13 deletions(-)=0A=
&gt; =0A=
&gt; diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg=
2l-cpg.c=0A=
&gt; index 07909e80bae2..1a552ea1c535 100644=0A=
&gt; --- a/drivers/clk/renesas/rzg2l-cpg.c=0A=
&gt; +++ b/drivers/clk/renesas/rzg2l-cpg.c=0A=
&gt; @@ -74,6 +74,17 @@=0A=
&gt; &nbsp;#define MSTOP_OFF(conf)		FIELD_GET(GENMASK(31, 16), (conf))=0A=
&gt; &nbsp;#define MSTOP_MASK(conf)	FIELD_GET(GENMASK(15, 0), (conf))=0A=
&gt; &nbsp;=0A=
=0A=
&gt; &nbsp;=0A=
=0A=
&gt; +	if (dsi_div_target =3D=3D PLL5_TARGET_DPI) {=0A=
&gt; +		/* Fixed settings for DPI */=0A=
&gt; +		priv-&gt;mux_dsi_div_params.clksrc =3D 0;=0A=
&gt; +		priv-&gt;mux_dsi_div_params.dsi_div_a =3D 3; /* Divided by 8 */=0A=
&gt; +		priv-&gt;mux_dsi_div_params.dsi_div_b =3D 0; /* Divided by 1 */=0A=
&gt; +		dsi_div_ab_desired =3D 8;			/* (1 &lt;&lt; a) * (b + 1) */</div><di=
v style=3D"text-align: left; text-indent: 0px; font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof"><br></div><div style=
=3D"text-align: left; text-indent: 0px; font-family: Aptos, Aptos_EmbeddedF=
ont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; =
color: rgb(0, 0, 0);" class=3D"elementToProof">This block is duplicated may=
 be add a helper function(), if you are planning to send another series.</d=
iv><div style=3D"text-align: left; text-indent: 0px; white-space: pre-wrap;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=3D"elementT=
oProof">=0A=
&gt; +	}=0A=
=0A=
&gt; +	/* Default settings for DPI */=0A=
&gt; +	priv-&gt;mux_dsi_div_params.clksrc =3D 0;=0A=
&gt; +	priv-&gt;mux_dsi_div_params.dsi_div_a =3D 3; /* Divided by 8 */=0A=
&gt; +	priv-&gt;mux_dsi_div_params.dsi_div_b =3D 0; /* Divided by 1 */=0A=
&gt; +	dsi_div_ab_desired =3D 8;			/* (1 &lt;&lt; a) * (b + 1) */=0A=
&gt; &nbsp;=0A=
</div></pre><div style=3D"direction: ltr; text-align: left; text-indent: 0p=
x; white-space: normal; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFon=
tService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0,=
 0);" class=3D"elementToProof">Cheers,</div><div style=3D"direction: ltr; t=
ext-align: left; text-indent: 0px; white-space: normal; font-family: Aptos,=
 Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; f=
ont-size: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">Biju</div></=
pre>
</body>
</html>

--_000_CWLP123MB44995816738B58D66F4729B0FCC0ACWLP123MB4499GBRP_--
