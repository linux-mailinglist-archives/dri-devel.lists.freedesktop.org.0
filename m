Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F3D6C44C2
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 09:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AAD910E8A2;
	Wed, 22 Mar 2023 08:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2071.outbound.protection.outlook.com [40.107.20.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A0010E0A2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 05:13:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMvRsPlsK0W8KWfhGFQQQna7R4VOmseqh/vMbwOgVXiYZmQLUE4mGWoOdCYE47xB1gQYwvcehSP8J3CteW5frI2/Dj2fALsib6ogMwtgol9GH6HEVJWfBYriIvqRe5go5oUeQYo6LchyPmwryJQ8nMCLA3EKnsFH3AJBYjcv/mAeDKbIq7cDMnOou6WO0SrkslUh66Vq/F4fk3slhiJF/5qBvSwmU0LYNPKu/iezmuQ236I0ztRzAf4WNWzGb4QzkKFA3s2Ycqa/SPDv8MyUKQ7kB4JSFsmlcB4M/2kOYz6Y74K7ALaHm7Q2jiwRsdQXqpOiXmJdROM9uoWA9qP3sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sldI6X65jjJ+msiJYM4gXqHTuqRYY8LhNwyWxPOOyc=;
 b=Ou721I1VO7xJimXZGQxsBRlqHNwXvvjVhcZXCvTTIQjrKuioYFS1GG5HT0DF4nTHv/8Ag1wjG/xJtoE4vmDcX+YknWQYGl2CIh59eL1ZX3g4bdpFBcNZo+hEJLwOrt6RrgQv7q5q1lj1gTKSGP3C30m9quZBlpYDvwJtDC/3O5jdk0t3X7Qt23p3JaDPxF8WQof9x/uYfvo4to4BS5rvTVnNNtA6783kiIUardoLH0IPF7ftd/AA/QOW/3y4zb1dOXzc6O6fxJ8psIzL+sAqlhftmKkv7ESsRDPCAoGSUvfbbQEOqmQsDoR8nbY0+T5Xc09ekkYDTf9EwpkaWZK+jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sldI6X65jjJ+msiJYM4gXqHTuqRYY8LhNwyWxPOOyc=;
 b=q1b5Jk7JbN3DGrbELd7+bK72rBRTFGGqo7e6tcRPZLqh2H2dQ6mv7sO21sdxijXotOKt9S7/0ai9D7Na+wPssOL6+HLFHNjakj0trjYbJo41A06oLn/LmuIUmNYOlbYKplt4XIudIS+WOpBEmYRk91X0hpf4PqqdkMWMN6OYkwM=
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by PA4PR04MB9591.eurprd04.prod.outlook.com (2603:10a6:102:270::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 05:13:24 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::3d8f:f805:bf35:b33]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::3d8f:f805:bf35:b33%4]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 05:13:24 +0000
From: Aisheng Dong <aisheng.dong@nxp.com>
To: "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 1/2] backlight: pwm_bl: Configure pwm only once per
 backlight toggle
Thread-Topic: Re: [PATCH v2 1/2] backlight: pwm_bl: Configure pwm only once
 per backlight toggle
Thread-Index: Adlcb4jabv+aAJvFTvysosjUWHNaHw==
Date: Wed, 22 Mar 2023 05:13:24 +0000
Message-ID: <DB9PR04MB84779AF9758B7FE747C6693D80869@DB9PR04MB8477.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8477:EE_|PA4PR04MB9591:EE_
x-ms-office365-filtering-correlation-id: c0b0e1fb-c091-43a2-8bdb-08db2a94296b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 602Vm58t3VMZtpGLs+/3/NWNIU9MJ9wFv22m5PNLG3cwbQMnzDsRsT9OVWtyFtP5c4Bf2LAWThKXAaw07pkDFyY/Ylj0daQFywIhWfgrJNSrk8fXhxoRp1yNRymN1wisbs2vh+HJARV6aDPfccDFTgcYTGOauPwDmV14TOl3pwd2skJtQv2pNkuZm9FFP/lBuB8wJwMvF4ORh9JMS9JGGc0tYzLLc6rAQVwv7ngeb1Q4PkUmprkpHPCgawJiOlUUE+uGNtv3oa3SWVl+aUKsecbQg+jfTfA9Am8EYOzPwCpPMwBWETE/uVTpRuxvlpe4Jeh/1ka7ZTMkrJYT7BARRukJ/L4QEqUSLaRxsPoHHRnfTJ3QAmWZadVE6Uth1eaOmnr4qFtwdQ8jDWw28SddMYpidwJXkZmzMsTdF+k/w+fVABmngiAoauRpBgug43YSNuwP/FOPgCpR+zpHcjGWA9JfRZVfNjqiJFxrYV0CsY8wESVJcKkax7f2WJiMeHDxFqVASiuxrl50waHy++MOhOEWtK+fHQ9IuM6KXLUmcR0JXq8pqKRaqg4Nwuh/bt4XD7/NoS7mWJRLn/ctgAZ1jiiGF1iLk+7S59rvs06/qKah21Q6KSQmz4D6fNTTI7nJCtPFQfk+6xBqD/0VfZ0JYAiUrGboYJR7Aza+tposoNebG5u3zZLo5lAydzyLU+Ca
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB8477.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(451199018)(186003)(38100700002)(9686003)(122000001)(2906002)(26005)(44832011)(6506007)(38070700005)(7416002)(5660300002)(52536014)(8676002)(8936002)(66476007)(86362001)(66946007)(76116006)(66556008)(64756008)(55016003)(7696005)(66574015)(41300700001)(33656002)(66446008)(6916009)(4326008)(83380400001)(54906003)(71200400001)(478600001)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2LWWLOs6EgeAjvnQo2nGh3ZGARfjdy72UFKcxo9zUUwczRnF3Wv13AS48B?=
 =?iso-8859-1?Q?SoWEHYSShc5LoeRE7f1Xpp+9hefTJTN2cActda793wh14x9HjgUyPgByWQ?=
 =?iso-8859-1?Q?pPQGe+1o6FP8tW16n9QlbfYIjDVGtoMlN1ypt8/8kqUtQvULAnSgOIz7iz?=
 =?iso-8859-1?Q?P1vmTZSYUCImasIpwJRxv+fL2xcy2tbDRMnQJmilEwWjOg4tDdNqY1FeGd?=
 =?iso-8859-1?Q?0O700WbEU3iQsTaTb4hgc3O4RanF9wPkT4xn5c1jmzG/AFk4TFruz1PYtg?=
 =?iso-8859-1?Q?SoeJ50HXCZMcS6hsQCo3EWtzAlOX00YixYOORw3T2VJMlaRncqKBY1B9P7?=
 =?iso-8859-1?Q?GGYhQuOtvFN9FRHWX8qx7wNA0jr1kNOuJdra2u7e9ge3QcsdgFyxzsGbLQ?=
 =?iso-8859-1?Q?SOjOVVux1+Bg3hx/6SGTCb1/ZmHzlLX/Af7c54z2DJQYkhUJ0CrVW+Q8Bi?=
 =?iso-8859-1?Q?R4OcF4A6diZrxOQ+S3G2YcVRgcvyFuGBR87ksNpxz8pbzG/QyT/tj+ilEa?=
 =?iso-8859-1?Q?cBGTh+kiPvke4zkLD76XcKBjTRmyyHqOnYXtlZfk3/6uCdhMEhrRNzbx/b?=
 =?iso-8859-1?Q?HhWH4aDocSjvq+ig0Z5PP8W/4d0VJ//SI+fhHkjXtgNzXztgZVEiKh3yR1?=
 =?iso-8859-1?Q?R6TPd1xJYW3G9tB4mvhv+n1f48a+VhlaWdVa6KzHYKVy+VAKpCtNQNp+iC?=
 =?iso-8859-1?Q?Ns9Y2zYqOywUGoBDga9TW0WgsO/fxKgFUinQK/zvSi98aQnl8rsmXfzfSq?=
 =?iso-8859-1?Q?ezSDFjOQI/EfGyOrt3E9mFr09enKGyikmf1BufAl/R8pHreT6m6Y0I384v?=
 =?iso-8859-1?Q?0RL+erEZjTek1xJXdMWVgawsk+BamJuuvJHgMEIwfNOwwIHlGs+zVdgizN?=
 =?iso-8859-1?Q?oSoHjG+L8q5h2ytxpz2i12Xm2Vt925gcp4poWBq+z9XRnaC+XM2SUsoCP3?=
 =?iso-8859-1?Q?UU5OfWUJCR4IgM5Doq887zDrFKraHXQfXS61YUZTtc6RMLMzEuCu0Q02b9?=
 =?iso-8859-1?Q?FIVHjF5E9QMKzsJqrb1IyfpAd5xxWFdOR5rh9CpjZyYZbdFh1qIxBIizDl?=
 =?iso-8859-1?Q?o2kvNBYBNEKgBdU7HhppHOdufK7H7STjjL4qipeP+HvYb/nIVG2UYokwFH?=
 =?iso-8859-1?Q?vsjSlxqiJXdkldIkVmmXAzu9Nj3g1nECl6b3HDHf7Kp7anZ30Dnn24X0a2?=
 =?iso-8859-1?Q?wfugBA5y23ckFyDc9dx8yIx8wCcuZWWp0flqdIDY4STim4z18jL6aFocyc?=
 =?iso-8859-1?Q?W55ebJBgIPRg/YUmkcF6CJrk5yp1mL62Lx3Y5OLC+9rmCiLRxCvfvp1pT/?=
 =?iso-8859-1?Q?M7vrmaMf30Wsj9t/0SSuWKIum3r8bZnFeiy+cipTf324wYrVCnWn3/LfGL?=
 =?iso-8859-1?Q?dSTSmTA4/IlxNt9MhypYlnFcCrraXLeOD4q/1e7kUE89VgfqoRIItB3zX8?=
 =?iso-8859-1?Q?9vleQ2hHid/hynZkMq9gVhmTDAD0oBwJwVQa2llHxtj1A610m348KGWKh2?=
 =?iso-8859-1?Q?Bazs83NoW0Gti6CFRpbHlksMEGnhP9HFVJhJfL/sqSYy3lhXZMSrf0uayr?=
 =?iso-8859-1?Q?crB4gfyJx7vK27AftbMlXrVF8SbMhY4wr2ltpHWHUQLXuFMUZH26f9OLdj?=
 =?iso-8859-1?Q?db4ihyq9R6B8Z8/GtGTfUNhsIYtbYa1SWY?=
Content-Type: multipart/alternative;
 boundary="_000_DB9PR04MB84779AF9758B7FE747C6693D80869DB9PR04MB8477eurp_"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b0e1fb-c091-43a2-8bdb-08db2a94296b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2023 05:13:24.1341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aCaOLpR+nIeXg2m+uMZnKwylzmzwDdpa+QDgdSDLx2XXuFKmg/SO1RitLrPtETp4NddtXAfTuDeuQigSAZDFPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9591
X-Mailman-Approved-At: Wed, 22 Mar 2023 08:20:06 +0000
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
Cc: "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, "deller@gmx.de" <deller@gmx.de>,
 "lee@kernel.org" <lee@kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_DB9PR04MB84779AF9758B7FE747C6693D80869DB9PR04MB8477eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 20, 2023 at 01:00:18PM +0100, Uwe Kleine-K=F6nig wrote:
> Most but not all PWMs drive the PWM pin to its inactive state when
> disabled. However if there is no enable_gpio and no regulator the PWM
> must drive the inactive state to actually disable the backlight.
>
> So keep the PWM on in this case.
>
> Note that to determine if there is a regulator some effort is required
> because it might happen that there isn't actually one but the regulator
> core gave us a dummy. (A nice side effect is that this makes the
> regulator actually optional even on fully constrained systems.)
>
> This fixes backlight disabling e.g. on i.MX6 when an inverted PWM is
> used.
>
> Hint for the future: If this change results in a regression, the bug is
> in the lowlevel PWM driver.
> Signed-off-by: Uwe Kleine-K=F6nig u.kleine-koenig@pengutronix.de<mailto:u=
.kleine-koenig@pengutronix.de>

This patch broke imx7ulp suspend resume and got the following error:
Freezing remaining freezable tasks
Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
printk: Suspending console(s) (use no_console_suspend to debug)
asix 1-1:1.0 eth0: Link is Down
imx7ulp-tpm-pwm 40250000.pwm: PM: dpm_run_callback(): platform_pm_suspend+0=
x0/0x48 returns -16
imx7ulp-tpm-pwm 40250000.pwm: PM: failed to suspend: error -16
...

It seems this patch changed the behavior of pwm_backlight_suspend a little =
bit in
pwm_backlight_power_off() that pwm state keep unchanged during suspend.
Then pwm_imx_tpm_suspend() will return -Ebusy due to tpm->enable_count > 0.
Was this intended behavior? Should we fix pwm core or the driver?

Regards
Aisheng

--_000_DB9PR04MB84779AF9758B7FE747C6693D80869DB9PR04MB8477eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:DengXian;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:DengXian;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:DengXian;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word;text-justify-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Fri, Jan 20, 2023 at 01:00:1=
8PM +0100, Uwe Kleine-K=F6nig wrote:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt; Most but not all PWMs driv=
e the PWM pin to its inactive state when<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt; disabled. However if there=
 is no enable_gpio and no regulator the PWM<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt; must drive the inactive st=
ate to actually disable the backlight.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt; So keep the PWM on in this=
 case.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt; Note that to determine if =
there is a regulator some effort is required<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt; because it might happen th=
at there isn't actually one but the regulator<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt; core gave us a dummy. (A n=
ice side effect is that this makes the<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt; regulator actually optiona=
l even on fully constrained systems.)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt; This fixes backlight disab=
ling e.g. on i.MX6 when an inverted PWM is<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt; used.<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt; Hint for the future: If th=
is change results in a regression, the bug is<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt; in the lowlevel PWM driver=
.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt; Signed-off-by: Uwe Kleine-=
K=F6nig <a href=3D"mailto:u.kleine-koenig@pengutronix.de">
u.kleine-koenig@pengutronix.de</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">This patch broke imx7ulp suspen=
d resume and got the following error:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Freezing remaining freezable ta=
sks<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Freezing remaining freezable ta=
sks completed (elapsed 0.001 seconds)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">printk: Suspending console(s) (=
use no_console_suspend to debug)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">asix 1-1:1.0 eth0: Link is Down=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">imx7ulp-tpm-pwm 40250000.pwm: P=
M: dpm_run_callback(): platform_pm_suspend+0x0/0x48 returns -16<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">imx7ulp-tpm-pwm 40250000.pwm: P=
M: failed to suspend: error -16<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#8230;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">It seems this patch changed the=
 behavior of pwm_backlight_suspend a little bit in<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">pwm_backlight_power_off() that =
pwm state keep unchanged during suspend.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Then pwm_imx_tpm_suspend() will=
 return -Ebusy due to tpm-&gt;enable_count &gt; 0.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Was this intended behavior? Sho=
uld we fix pwm core or the driver?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Regards<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Aisheng<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_DB9PR04MB84779AF9758B7FE747C6693D80869DB9PR04MB8477eurp_--
