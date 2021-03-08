Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCF73310B0
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 15:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815DE89B68;
	Mon,  8 Mar 2021 14:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CBD89B68
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 14:22:34 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128ELpMf030911; Mon, 8 Mar 2021 15:22:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=selector1;
 bh=rlricdE70O7GaP5H/fDILnTjjifnjoiAsY/5cN+eJZs=;
 b=iMS7rb9/23O7p7wbK2kMLiG3T5WHiHR76IapC+OHgtUdhzKISlSLvj9bVejy/TrMn3Ms
 wh8WiuEc4gTauHGVk1PnKVUavGVB2f+VZ7bY3tiaxZUV2LG2+rLAsVaWurzdScMNZyJw
 0QxH5juL8GDCQK76XwmtOUFAobSIN5M1Pv0fs5W122Za1NSjj68xahg0mERgeW78FFXA
 e+brdhKVPtg/3TjBHMclFNbUh92N4OlNiUmV2PnkhaIX5tDAAHATYAdcVbUlq/mBgzXA
 uvOffkJEyqac/TR+cVhjbRqDo2WOIAl/NYreciyFNpOgry7tT4d1f98vXgAp5Y9axal7 jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3741y6k04e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 15:22:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1F3F410002A;
 Mon,  8 Mar 2021 15:22:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EF32424AF08;
 Mon,  8 Mar 2021 15:22:29 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 8 Mar
 2021 15:22:29 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Mon, 8 Mar 2021 15:22:29 +0100
From: Philippe CORNU - foss <philippe.cornu@foss.st.com>
To: Yannick FERTRE - foss <yannick.fertre@foss.st.com>, "Raphael GALLAIS-POU -
 foss" <raphael.gallais-pou@foss.st.com>, Yannick FERTRE
 <yannick.fertre@st.com>, Philippe CORNU <philippe.cornu@st.com>, "Benjamin
 Gaignard" <benjamin.gaignard@linaro.org>, Vincent ABRIOU
 <vincent.abriou@st.com>, Sam Ravnborg <sam@ravnborg.org>, Joe Perches
 <joe@perches.com>
Subject: RE: [PATCH 1/2] drm/stm: dsi: Avoid printing errors for -EPROBE_DEFER
Thread-Topic: [PATCH 1/2] drm/stm: dsi: Avoid printing errors for -EPROBE_DEFER
Thread-Index: AQHXCPxP1JW0jPBz9kimszP//+ain6p50u6AgABm/FU=
Date: Mon, 8 Mar 2021 14:22:29 +0000
Message-ID: <1615213345469.50782@foss.st.com>
References: <20210222092205.32086-1-raphael.gallais-pou@foss.st.com>
 <20210222092205.32086-2-raphael.gallais-pou@foss.st.com>,
 <7db3bebd-2cfa-d8d8-40e5-81702295e151@foss.st.com>
In-Reply-To: <7db3bebd-2cfa-d8d8-40e5-81702295e151@foss.st.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_08:2021-03-08,
 2021-03-08 signatures=0
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
Cc: Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Content-Type: multipart/mixed; boundary="===============1138515426=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1138515426==
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_161521334546950782fossstcom_"

--_000_161521334546950782fossstcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Applied on drm-misc-next.
Many thanks Rapha=EBl & Yannick for your patch.
Note: I have updated the "From:" field to yannick.fertre@foss.st.com for mo=
re consistency.
Philippe :-)


________________________________
De : Yannick FERTRE - foss
Envoy=E9 : lundi 8 mars 2021 10:10
=C0 : Raphael GALLAIS-POU - foss; Yannick FERTRE; Philippe CORNU; Benjamin =
Gaignard; Vincent ABRIOU; Sam Ravnborg; Joe Perches
Cc : David Airlie; Daniel Vetter; Maxime Coquelin; Alexandre TORGUE; dri-de=
vel@lists.freedesktop.org; linux-stm32@st-md-mailman.stormreply.com; linux-=
arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Philippe CORN=
U - foss; Raphael GALLAIS-POU; Alexandre TORGUE - foss
Objet : Re: [PATCH 1/2] drm/stm: dsi: Avoid printing errors for -EPROBE_DEF=
ER

Tested-by: Yannick Fertre <yannick.fertre@foss.st.com>

On 2/22/21 10:22 AM, Raphael GALLAIS-POU - foss wrote:
> From: Yannick Fertre <yannick.fertre@st.com>
>
> Don't print error when probe deferred error is returned.
>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
>   drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/=
dw_mipi_dsi-stm.c
> index 2e1f2664495d..8399d337589d 100644
> --- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> +++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> @@ -363,8 +363,7 @@ static int dw_mipi_dsi_stm_probe(struct platform_devi=
ce *pdev)
>        dsi->vdd_supply =3D devm_regulator_get(dev, "phy-dsi");
>        if (IS_ERR(dsi->vdd_supply)) {
>                ret =3D PTR_ERR(dsi->vdd_supply);
> -             if (ret !=3D -EPROBE_DEFER)
> -                     DRM_ERROR("Failed to request regulator: %d\n", ret)=
;
> +             dev_err_probe(dev, ret, "Failed to request regulator\n");
>                return ret;
>        }
>
> @@ -377,9 +376,7 @@ static int dw_mipi_dsi_stm_probe(struct platform_devi=
ce *pdev)
>        dsi->pllref_clk =3D devm_clk_get(dev, "ref");
>        if (IS_ERR(dsi->pllref_clk)) {
>                ret =3D PTR_ERR(dsi->pllref_clk);
> -             if (ret !=3D -EPROBE_DEFER)
> -                     DRM_ERROR("Unable to get pll reference clock: %d\n"=
,
> -                               ret);
> +             dev_err_probe(dev, ret, "Unable to get pll reference clock\=
n");
>                goto err_clk_get;
>        }
>
> @@ -419,7 +416,7 @@ static int dw_mipi_dsi_stm_probe(struct platform_devi=
ce *pdev)
>        dsi->dsi =3D dw_mipi_dsi_probe(pdev, &dw_mipi_dsi_stm_plat_data);
>        if (IS_ERR(dsi->dsi)) {
>                ret =3D PTR_ERR(dsi->dsi);
> -             DRM_ERROR("Failed to initialize mipi dsi host: %d\n", ret);
> +             dev_err_probe(dev, ret, "Failed to initialize mipi dsi host=
\n");
>                goto err_dsi_probe;
>        }
>
>

--_000_161521334546950782fossstcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!-- p { margin-top: 0px; m=
argin-bottom: 0px; } .EmailQuote { margin-left: 1pt; padding-left: 4pt; bor=
der-left: 2px solid rgb(128, 0, 0); }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<div>Applied on drm-misc-next.<br>
</div>
<div>Many thanks Rapha=EBl &amp; Yannick&nbsp;for your patch.<br>
</div>
<div>Note: I have&nbsp;updated the &quot;From:&quot; field&nbsp;to yannick.=
fertre@foss.st.com&nbsp;for more consistency.<br>
</div>
<div>Philippe :-)<br>
</div>
<p><br>
</p>
<hr tabindex=3D"-1" style=3D"color: rgb(33, 33, 33); font-size: 12pt; displ=
ay: inline-block; width: 98%;">
<div style=3D"color: rgb(33, 33, 33);">
<div>
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>De :</b> Yannick FERTRE - fos=
s<br>
<b>Envoy=E9 :</b> lundi 8 mars 2021 10:10<br>
<b>=C0 :</b> Raphael GALLAIS-POU - foss; Yannick FERTRE; Philippe CORNU; Be=
njamin Gaignard; Vincent ABRIOU; Sam Ravnborg; Joe Perches<br>
<b>Cc&nbsp;:</b> David Airlie; Daniel Vetter; Maxime Coquelin; Alexandre TO=
RGUE; dri-devel@lists.freedesktop.org; linux-stm32@st-md-mailman.stormreply=
.com; linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; P=
hilippe CORNU - foss; Raphael GALLAIS-POU;
 Alexandre TORGUE - foss<br>
<b>Objet :</b> Re: [PATCH 1/2] drm/stm: dsi: Avoid printing errors for -EPR=
OBE_DEFER</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Tested-by: Yannick Fertre &lt;yannick.fertre@foss.=
st.com&gt;<br>
<br>
On 2/22/21 10:22 AM, Raphael GALLAIS-POU - foss wrote:<br>
&gt; From: Yannick Fertre &lt;yannick.fertre@st.com&gt;<br>
&gt; <br>
&gt; Don't print error when probe deferred error is returned.<br>
&gt; <br>
&gt; Signed-off-by: Raphael Gallais-Pou &lt;raphael.gallais-pou@foss.st.com=
&gt;<br>
&gt; Signed-off-by: Yannick Fertre &lt;yannick.fertre@foss.st.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 9 &#43;&#43;&#43;-=
-----<br>
&gt;&nbsp;&nbsp; 1 file changed, 3 insertions(&#43;), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/s=
tm/dw_mipi_dsi-stm.c<br>
&gt; index 2e1f2664495d..8399d337589d 100644<br>
&gt; --- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c<br>
&gt; @@ -363,8 &#43;363,7 @@ static int dw_mipi_dsi_stm_probe(struct platfo=
rm_device *pdev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dsi-&gt;vdd_supply =3D devm_=
regulator_get(dev, &quot;phy-dsi&quot;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (IS_ERR(dsi-&gt;vdd_suppl=
y)) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D PTR_ERR(dsi-&gt;vdd_supply);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (ret !=3D -EPROBE_DEFER)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;Failed =
to request regulator: %d\n&quot;, ret);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; dev_err_probe(dev, ret, &quot;Failed to request regulator\n&quot;);=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt; @@ -377,9 &#43;376,7 @@ static int dw_mipi_dsi_stm_probe(struct platfo=
rm_device *pdev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dsi-&gt;pllref_clk =3D devm_=
clk_get(dev, &quot;ref&quot;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (IS_ERR(dsi-&gt;pllref_cl=
k)) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D PTR_ERR(dsi-&gt;pllref_clk);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (ret !=3D -EPROBE_DEFER)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;Unable =
to get pll reference clock: %d\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; dev_err_probe(dev, ret, &quot;Unable to get pll reference clock\n&q=
uot;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; goto err_clk_get;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt; @@ -419,7 &#43;416,7 @@ static int dw_mipi_dsi_stm_probe(struct platfo=
rm_device *pdev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dsi-&gt;dsi =3D dw_mipi_dsi_=
probe(pdev, &amp;dw_mipi_dsi_stm_plat_data);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (IS_ERR(dsi-&gt;dsi)) {<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D PTR_ERR(dsi-&gt;dsi);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; DRM_ERROR(&quot;Failed to initialize mipi dsi host: %d\n&quot;, ret);<b=
r>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; dev_err_probe(dev, ret, &quot;Failed to initialize mipi dsi host\n&=
quot;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; goto err_dsi_probe;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt; <br>
</div>
</span></font></div>
</body>
</html>

--_000_161521334546950782fossstcom_--

--===============1138515426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1138515426==--
