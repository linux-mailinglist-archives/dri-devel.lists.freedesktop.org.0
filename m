Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0954EA9A0EE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 08:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2A610E72A;
	Thu, 24 Apr 2025 06:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mobileye.com header.i=@mobileye.com header.b="Fum3L/7l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2064.outbound.protection.outlook.com [40.107.104.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAC510E72A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 06:08:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pbySaB37hDHyGuSA4xowaNZgSEJ8MSRaWMH8zSMkSPYPojfR39JTjMTK74pjlvOsnv7L8x617u5JsdobQ+5Yhjhq0Gq2YZoqfZ+DcVPM8+4TFvAJqWRvDblGMTZ2NU3CuLU1XOta29gHz9K73+fcjRwkbXtvKozgNnIxvR5DmxOb47wsUVPz8a4vz3xgU6+mv2hjtsNrHaHxvLzPg+WuI+WuWOqnxgQe5s9w5vdzde+PNP5ZjqODOsC+3TolJXSQ2BEtg/oj6SLXz5KGqelQu4PBr2DPREtIMEHR6WjlnwqsasrOMiJhy/1W8QWiWi29+DL1k2PtbVdqFGP7m+6CMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxjZclNBgBUGbO3XDswBkTne6HYi4bSpDwm/xXzKBOk=;
 b=NPdBxgl4Lfj7O8ChllHohDD+9cjgEbQ3SeuYeOiab1c0FzlWEhdsTxsAUz4XJ3AcfEKaHeNz+IHpPYZoQQFiDaQEIIqmFae9ussShVAQqPun9Lhyz0fz5PodnUgdWI9BfVXguIybq1RfpIhYTNySDCieVKqTpA0kw0j0r/U+KX+1tk+yWybYNIIsAKkNGAM2WE91qZ64EGD+CmlqX1/0kcjjKz7EmcxfPbgQfNN02FTI28lhzeQbCUlQD/SS/REdcnAjhMz+Awpgo15jChmIdBLZSFBGY1jMgkYxbvGzl1DBrEDt23wtsnqCYSCq9xGmqrOZu3J1zpoNtlDiqbZDbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxjZclNBgBUGbO3XDswBkTne6HYi4bSpDwm/xXzKBOk=;
 b=Fum3L/7ldz1hBY8mEPl8boK19hiZw+4KYeiCwxHT6bQSot/JSQc4ABnAQNZ+Vo8U2kQ2lkkz9mrNWYqM3Ts/dPcLEUAnlJLQIVvreDbJdx2uJoIf4kERQnFvtyDIvA8LZ91j7DpN02lUylRdOdftBu5tvcaPfNxs26V7VtHq+HE=
Received: from AM8PR09MB5258.eurprd09.prod.outlook.com (2603:10a6:20b:3db::18)
 by DB8PR09MB3803.eurprd09.prod.outlook.com (2603:10a6:10:f8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 06:08:38 +0000
Received: from AM8PR09MB5258.eurprd09.prod.outlook.com
 ([fe80::2356:df22:d538:5e4d]) by AM8PR09MB5258.eurprd09.prod.outlook.com
 ([fe80::2356:df22:d538:5e4d%4]) with mapi id 15.20.8655.021; Thu, 24 Apr 2025
 06:08:38 +0000
From: Gregory Greenman <Gregory.Greenman@mobileye.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: drm/panfrost: question about cache coherency handling
Thread-Topic: drm/panfrost: question about cache coherency handling
Thread-Index: Adu0SSEc4kXYTmBeS9GvSLd4CpJpBg==
Date: Thu, 24 Apr 2025 06:08:38 +0000
Message-ID: <AM8PR09MB5258059DE4B54A464C8ADCF3ED852@AM8PR09MB5258.eurprd09.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR09MB5258:EE_|DB8PR09MB3803:EE_
x-ms-office365-filtering-correlation-id: 6ab3daa2-4582-46e4-dbf3-08dd82f674ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?CIU3FSdO9ACkR0os8XgjkaByMPj+9+RT/mZts914KpsjaMjD7aZmXJKJaqE7?=
 =?us-ascii?Q?F9+gWdHQiN909VBUQqQoEXLmpaVy18sKET8oNlHX32EMT5rggAwTjBzcM3Tp?=
 =?us-ascii?Q?fsWEjaGPKTWkmxm0sjPTkVsYmEaR/oGvvKLw/HLcU2UAHMk4TH4vbWTIjf3L?=
 =?us-ascii?Q?fgS0I4QzE2v3gdI0Km08D3wVj3WpLBwxILMzxdp6fIISP3RuGMx2vVFndViq?=
 =?us-ascii?Q?gDm48G5atMFoyG0HgsJ/c6vsunDAO2V0eE1p8yt6b/+37UkQ1Cw4jEWMgFwX?=
 =?us-ascii?Q?0tfca2cMWvVS1yvfh+qJWt3sbK0ATuO3BquKyNznZsuiqMqSA2GywwGq/Isi?=
 =?us-ascii?Q?B4HEqC+LCuilQjtd7O6GQlAtWERtsPNbJ+ueEPJV7wR7lKH78MaerJex2FF/?=
 =?us-ascii?Q?Awd2PJiFJLppEnZ8phbNhrcVDfF2gMoh6RrbiaZg5mIRTt+ppT0DSoz+3iWS?=
 =?us-ascii?Q?WqzLXoTmRIp9seNOrg6GulI6I7ct6WJ+fg1epN27eYbg7wXLbguvBsFzrwVY?=
 =?us-ascii?Q?gg8vtGaS2g1HJPTNyphtEPmEZhOytFJrP08oqzjSKlOTSvWHZG6l1z7dWOS5?=
 =?us-ascii?Q?Az39L0A0HgZWucs37Nd+f045ppJPv0WOTd08HaTrbH8Z0kItoW2/hKj1V3va?=
 =?us-ascii?Q?NntaYCW8etqFZQYI81vdRIRpL9pvPSlPqhrcfo2sdzdMhKWsRJ4LMZCIFJ4r?=
 =?us-ascii?Q?ClnXUNfkgKUqAnTdLOYs52izYfiHdjIK1eJsoaWHmkSgz/r8DPHoIT4QG4a4?=
 =?us-ascii?Q?d8+/lD6FJN0dZ2y1JNw/JH+j8g+m0/VWyGRQM5IcGmwEb0yn6rvQL1J8BH7n?=
 =?us-ascii?Q?5mGtJT16Q7BCseagQhHpGVgr3Spz4q8obzcwsr9jqJXJ/dO/5dcsZr1y4VXF?=
 =?us-ascii?Q?1X6z66wEwVsKqgE3mWe1wqmuxLxQGv9OY4NorY6JoFmESGYuE95APypVyuoI?=
 =?us-ascii?Q?MtMCR/LzLxTNL/klfxu1rRfXoPrmMAXc9ztdf98I4+7vS31IWXQc2eBoDOZp?=
 =?us-ascii?Q?nIBszlszQRm5lC1lmxILSRhxpPjnGsFJELhLM/QLyPwvFmt1gX92Wq3MEKmC?=
 =?us-ascii?Q?dQDpkZX8e1i3y+Ynvchc3fDBZF0AnfiLR9HqflCUVbSm6qOfn2tnILeDKT8R?=
 =?us-ascii?Q?u9ls7k/OHPQGmA0lFL/VB7HVnMPLvJ/pFnv30sivcN7o00/3PsZerLgsdUJe?=
 =?us-ascii?Q?t109raAbs4SrAeFAr/L/fy6ZL1jk3tDNDDXy9dtxnCFvyc4gwhaWryDpGHAi?=
 =?us-ascii?Q?XxVLci/Cv4XRYvYpHp/osjed3t2+mnegv+Y6gpRucMb3V0eear2EzMJpprSC?=
 =?us-ascii?Q?OJmEaDhQHNJS63UeVj48lvNeGp7oQhYbJk7sBxKtYOSHJJv5HzL0wKPPtCu4?=
 =?us-ascii?Q?ALBklyX5ISJ/IvGYtqz2CdAqhG/MWS3ifMrlJ0EjC3p6146a6ufZ7leVdnbx?=
 =?us-ascii?Q?HM854QE5eXYYqI60pFmzNuCJo+kBW+PLUiCTSLP6g3ul+w4TU1pLHA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR09MB5258.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KE1fyV3PV1LAmQlXN8TvyyHV35rftKnIvA2BzT8lh4PUGThvqm9T3SsPZx4P?=
 =?us-ascii?Q?XvTeHQ6m8Mkh4XvhCpYNxfDFM5EphaAajua9fqIzYmVGmXm4O5jzByf6KxGE?=
 =?us-ascii?Q?+JaMs4ratwMcGR83WgTIPNJHP7TdvfezOzeNudUrt76TqdMhR1LfljyeOwr1?=
 =?us-ascii?Q?Q0iMn3o+BH0m0ltyzhsErjg8sX5/5odN1VlOjQ5qqJpb6cUp0e2q3qvnxva5?=
 =?us-ascii?Q?jt5XjkyAygXjOagibs8Pq3bIkwCoCRy/IRz7jUZZk4eiSjdYFrRgIHRvUK+H?=
 =?us-ascii?Q?bt7xbl4sOrHuxpPnHmBw+9Uamb6arzD7SAuhd8vyHYJ5BKrIkbsGt8LBoOMA?=
 =?us-ascii?Q?u5S+CA1fMFERPcnFsqoPsRB/ToRepriGiiWzznCHVa+EOYSkbsuNiNzvNopU?=
 =?us-ascii?Q?MJdraM7tU6bhBloXeBXGEd8UluTcibRBRGXSSkfoIGwTERczsqSnGtslCt+8?=
 =?us-ascii?Q?C0QiIShZp7G9hHRR3km6FKZiew282Kl4+27Pu436uwYNp0AA/rAyGdkiF0KR?=
 =?us-ascii?Q?eoOiVMGmCKbuGFHjX14oFBgA729HAWGYYkwgiMOqSKeeikUG3S4zu2O4glrU?=
 =?us-ascii?Q?/TUrjEoo1EkFuQUGPF8B48QluTCwgIMc5tHMJMDEltXjml7q2AGNiG/dCr45?=
 =?us-ascii?Q?UOKzqIwmtw+9IuySY6FnBnE6hSTqGwkaXqA7JvsfNwYdQBzOv3pfSYIB2lKr?=
 =?us-ascii?Q?1LXFw5oqsh8aLgr77A0Sb1k6VNaxXmgxu6DL08qw8L8kzcxU4hhKQJxm9+Ls?=
 =?us-ascii?Q?O/TmZpckyWPC9q2zmOy7+J3PCLuIZxOEJnNo8fzVHw52FHHUHxaBAshDFMj3?=
 =?us-ascii?Q?6+ULMJfo1Oc1l6zkRJnEQ+6U7vakcx1qB5S5EAwss6J0C40wf8RVYGO6IXpL?=
 =?us-ascii?Q?0MIK4I/PRm0wIenUxDVjcnK7MbpY1QVady9uNbrW/FFhDN/BX1s+pchlooCi?=
 =?us-ascii?Q?m7bM/XK6Of9YnC0us/Czk0tArwZakvcKw8zF6nag4NFscI+CWursJgyQXvuI?=
 =?us-ascii?Q?d85tf23h73/mKIAB3SbNKj51acDKgpLgBR5Q4SBlQObq8XaS1VT7YEJ6QwRV?=
 =?us-ascii?Q?On1aMAhpNmtuAq0gcpLxPp6yInUDz/0Ew6wvHu73fDcRrhC8++AAws1We8fo?=
 =?us-ascii?Q?Wr7qbuAFB81uyOIF9Uc9IZr0AepcQy/WOKzGl5VcNWYNDaqldxJ2Zz5LdUiH?=
 =?us-ascii?Q?2rOQy2cARWuz3Wp+W4ex0nTxAgll29fSiMpx3Bz6198ojKmhGImp4Hb9xHaX?=
 =?us-ascii?Q?baqy6+Qd5Z1uRp6Jtmj6Y2EQsQ0L1cYdu3IHf4EXI8R+Y4rNxnmJAaaU0zeX?=
 =?us-ascii?Q?iswIXd581dZUUILn1wXLQyHW5b7OdQFLL6VN8mBM4DtdLboVIdVAx0r5bmjX?=
 =?us-ascii?Q?aylajpBHGVx2ypn8ExLLzdR7KNmz6pLVbvxuHWSRNTw/vVbiD3KY5JfuXkB9?=
 =?us-ascii?Q?t+Egk7r2+IVmnqKXbKeaXTGG6hhwtHR8drXXJ7A4wngKQBlxh+MIMeZkjIAA?=
 =?us-ascii?Q?RJTFNhum+6mClVlcaJowJxcToXHdPPTeRWD15YFTzjgh0YwUgCAoF20amP9U?=
 =?us-ascii?Q?2qEirQswNn3kEbl5qU6n2p1fysooEQ91nTy9ONvP?=
Content-Type: multipart/alternative;
 boundary="_000_AM8PR09MB5258059DE4B54A464C8ADCF3ED852AM8PR09MB5258eurp_"
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR09MB5258.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab3daa2-4582-46e4-dbf3-08dd82f674ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 06:08:38.7040 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FMie7Wnp5vwPvjR2X9puP/cQRSTg2VZvYGaMbFnyMzqYJGp6ay2+lEqAahjDvCJiOG2yklQdu+3NaO022FJqZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR09MB3803
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

--_000_AM8PR09MB5258059DE4B54A464C8ADCF3ED852AM8PR09MB5258eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I'm new to DRM development and ran into something in the Panfrost (but also=
 Panthor) driver I'm curious about.

In drivers/gpu/drm/panfrost/panfrost_gem.c, there's this line: obj->base.ma=
p_wc =3D !pfdev->coherent;
From what I can tell, this means when the CPU isn't coherent, it uses write=
-combining mapping.

I'm wondering why this approach instead of something like the dma_sync_sing=
le_* functions at the appropriate places?

Thanks,
Gregory

--_000_AM8PR09MB5258059DE4B54A464C8ADCF3ED852AM8PR09MB5258eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	text-align:right;
	direction:rtl;
	unicode-bidi:embed;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;}
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
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">I'm new to DRM development<span style=3D"font-size:12.0pt;mso-ligatu=
res:none">
</span>and ran into something in the Panfrost (but also Panthor) driver I'm=
 curious about.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">In drivers/gpu/drm/panfrost/panfrost_gem.c, there's this line: obj-&=
gt;base.map_wc =3D !pfdev-&gt;coherent;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">From what I can tell, this means when the CPU isn't coherent, it use=
s write-combining mapping.
<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">I'm wondering why this approach instead of something like the dma_sy=
nc_single_* functions at the appropriate places?<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">Gregory<o:p></o:p></p>
</div>
</body>
</html>

--_000_AM8PR09MB5258059DE4B54A464C8ADCF3ED852AM8PR09MB5258eurp_--
