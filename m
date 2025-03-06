Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F72DA5531B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 18:31:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF73E10EA41;
	Thu,  6 Mar 2025 17:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="RnG4DDVX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2045.outbound.protection.outlook.com [40.107.22.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF37210EA41
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 17:31:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3qW3IqQGbN+27nDBGv7gVIryztPBbGZaxPkkreAwXwHHxOTe5KsfRwFTtYCiP6ZvuBrOQkruzTecxClun7W9qy8Hka0+KcOxjckh4RLvcO8HHJuum+cCDavnKejBLevKTkQ7lcehxnojFwaciRMc/XRslv9qn+fODjm1UrGwwTONSPNYUzuKHYzmGKszCFz/t08Y3LwaH4R4Q5rv5A5xfImTacSwcp+SXf91qqZvutH51Mmj7xMxNLbVwloX/PSnb4vTmcLnbExEdwfpukrhTKj61/GgpBXTJpXTAj08ylT1ZyrcfHw/oweMUYORkLrEz5xVjupjFw8M2RVjoqn7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVzzO7FWVa1iKwSWOpqsOdr+VG2WMePPJ2nWnMCdAbQ=;
 b=RQLwPefdSrzk+yE5RectrkE8BNjoPGKhIsNOrfO/0iaZeJbVu4UAniXJDgvklLQi+HTeM+Nk04atGaEWvm6+yxFVmZhz9dsVoIMffppCihtZg/TUys2Ds2dWEwAeMd9VdzUrq1avpLCeiyYnvUpN43TtAhY2I0gv5BzYcTAkX/6J+FIpFh9K+vQGqIVWr8BEHIQQgkIBmH/h2Z2cnF3JXgZSiSlZ2SRREQtu82sR/OWb5edhoFtd7G6CSblTGnH4OdR3FrXkygqpOEogMwFrUgh4ITpfrglkEF92Ybsr5tkCotrmGXLwB0njKFNG6M1fgDtaLy/RfhAO7Jb5xE5MIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVzzO7FWVa1iKwSWOpqsOdr+VG2WMePPJ2nWnMCdAbQ=;
 b=RnG4DDVXSqqhpyvQusf5J6TGp+mRatjRv9mrK1gPmtKuA5nCx9MT+Kdbfbwit19ceCT7eTDRNvELBWb4hkWpIBB9Jvy5WzKQkfk4NFRfolW4m6sTpWoRI1aEgUr41kO2YJ6YEWjG1+RPVuoypIlJI/vQBvPGlIg4Bhmh8rdTil875Jk+Wc4jdmR/f2sh7nXNZRZuLuMAyufsvfDCI5Fr0yOXspApxYXs+gO20Cl05nKh1jZpctLd4BAUMuQoH0uBIAlxTYHV5vSzu7SzB1yJKmM0Rsr4JuSCH28L9ln4/eKV8S4XcKUZs4mtIvX6Sj04SDQKv2V4O3IvE+ybYGqkWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10627.eurprd04.prod.outlook.com (2603:10a6:102:48b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 17:31:39 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 17:31:38 +0000
Date: Thu, 6 Mar 2025 12:31:28 -0500
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Guido =?iso-8859-1?Q?G=FAnther?= <agx@sigxcpu.org>,
 Robert Chiras <robert.chiras@nxp.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: display: nwl-dsi: Allow 'data-lanes'
 property for port@1
Message-ID: <Z8nb8F3x9R6PunkI@lizhi-Precision-Tower-5810>
References: <20250110161733.2515332-1-Frank.Li@nxp.com>
 <c5y6mocsd77wj5lah6n47vtteqc5ekcrbdod6z5vtcnxhleudw@kfhpyoiylqqp>
 <Z6prCyX+edpaSwUH@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6prCyX+edpaSwUH@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SJ0PR05CA0101.namprd05.prod.outlook.com
 (2603:10b6:a03:334::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10627:EE_
X-MS-Office365-Filtering-Correlation-Id: a1cb60f9-332a-474c-75ac-08dd5cd4c05f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RRmI+HstJq/A4UrpcWt1ErrCjipMIvSqkV9I+vuQ5QXFI/beKW4Ejh5RBUZQ?=
 =?us-ascii?Q?hiAAgL0kIabqn4A+3bl0G93sUdi5eUbl+qI8BbRb569CG1Li5L57zfjlG25U?=
 =?us-ascii?Q?1oTaTqJ4vxkDA1DJWRrvMl0TpJVvtjHG6QJwrw3I/HrExFk3o9ATZhQFhwr+?=
 =?us-ascii?Q?r+kpjmEuZQsG4NR9w/4ohyLbhBpUQ52SHVcuLW1Jl1MAF9Yaz0RxjIAWoQhU?=
 =?us-ascii?Q?PhuATdtz2krbfkPU7QtUElh7oWA3ZTdFO+DHRYkoTSa0QXjnEVCcmKsQuv4D?=
 =?us-ascii?Q?FoZju3LTX9QOXTBE1b5cfXGo4vBMS14fh44qAVuNwaDX1ZageXc3Jpv738d4?=
 =?us-ascii?Q?JPeNwMUD22DZndcx5PY+w7hqBhoFcaOlPtaAsgvU5hj3htTSoehIAiB5L8sw?=
 =?us-ascii?Q?VlS6ufxUgqQDEwTlhp7ZnwLLYC/A0vH8amD5Nn1Pew7QRrESYUtvVHPxupsj?=
 =?us-ascii?Q?lgcTPJTBn9O3dLyv0wW+YM9rsZjNjy70QwxREAAYH0r7T6q+Lt+E67Mt3GNf?=
 =?us-ascii?Q?lBxyrgtckI/lOuvG3ASX+9U2E2tfUQm006lq9l9+MqrNXdkiQiAQLZiNboXr?=
 =?us-ascii?Q?BLSpQDo4n7QYbE5fXFareqXK6Z9IOZ7EtAiHp/Ej7uifGiUk77nzfnUORFR+?=
 =?us-ascii?Q?cOlKA4HINJw1LggaiVaCQRzCRowyzYeBB1LVZgpU+K3rp87ubau/PVEm8O1o?=
 =?us-ascii?Q?c7Lk3G1cZTf0YbeFOGXvJ0/eFkRH/5x8FhWIq+LfcchMgK12MuCSwdiMW9Bd?=
 =?us-ascii?Q?QmNIvV1ILbgprCMfVsXd2lo5Sybjw75uTkQkA3ADfPTqJp/fZlyQ+PokSA2D?=
 =?us-ascii?Q?n4ED/5Q8I5pfA6KCVGw1MaYtKrC/2naIaAcirf+LYRp8+YZ3idoB35XspG/D?=
 =?us-ascii?Q?9XwutCw2kAsxENADvzjpoREmVkBaKJV5C1mjikaEpBUL/x9MrphcGg5d2lYh?=
 =?us-ascii?Q?6qFI3U3Lnd7DgZXqa0C0JAz7GlMRmNFyusf3yKNiZrUqf53/hG7SWH/o670e?=
 =?us-ascii?Q?E4zzQl02yabQx4RgVnss2GlY6VrD2W/vhWqC5a0O9IDfYRtQR09XRVCkqNrt?=
 =?us-ascii?Q?X6Z6Un3FV+HQ/AtmE55D6uh0xG3cWPoyLoYdt2VfsA4a7sNJUUwRDYqORHsn?=
 =?us-ascii?Q?lSWnnfAaxISStdRXEf/wgHFEgrnTPmcLo9ubitg8F2qWnGblHMub9twOeEwg?=
 =?us-ascii?Q?TEfXIb3hYdcGyiaqrTPKoJsxl0hMLDEP1Uuz6YOZw/b/VKO9YvrLAiqZEvw2?=
 =?us-ascii?Q?WTI/Mr63REgL2p32SEFoVNdIhYsOC9WMDNJhc0TIhz6exQFHFjnkATs9p/jU?=
 =?us-ascii?Q?nEBO/gfISlZ7eQdsrqVmfgddzvjYTfMHldJsgVgyTkyl9oafFZf5emQ2e9fV?=
 =?us-ascii?Q?udY+OKDRUXF2W4UDm3gGuY4IlEZWWWQt8AUx9TjtniGDQ90chlgRuCgZKksC?=
 =?us-ascii?Q?KdX9MmsZPDO27ouaxzYY8He3Jt3NS7vD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HAmH0ta6Y5nD3daD9+NSHksCSZ9Fezet/P/bt42E70gPYn+hWyKyijEMxrj8?=
 =?us-ascii?Q?7vTdZzpCv4HBkrOF4Rd8rvbpdtgf1B0iOMcAkmuxzIKxlNZxcZI6oBFe6aDJ?=
 =?us-ascii?Q?rfCCpGpqcI9hGxSQJ6gui/pHp/QCwb1QpZsQGhUg+wd13R9Lh5SIlgDJoSwG?=
 =?us-ascii?Q?8t6KGl61js/SF+fbALev/eweK5SDC06XC+DmHJUatYrL8F01gP5namXun34p?=
 =?us-ascii?Q?qUOFQw93px5uJZBKBjxJIlvJCIJIF2CtczVugdQi3lpY6cNBTV36bQlaMzVD?=
 =?us-ascii?Q?d9kur/Sr3dGCY7/iZaIGqsQf2E43UJbTBXbF3b6qRp3C+PtOVe2OaGpjgdvU?=
 =?us-ascii?Q?PEI4C+a4AmJjRJMU3UsufnVdKm5mVg/OewTqbi9m8LoutZb0YEhUszA7wEFI?=
 =?us-ascii?Q?5KouF07fTIGb6tktln4b4QhCAqFc1XHmzmyC+tRtsWWh1K+y2qYA5L6B9AXi?=
 =?us-ascii?Q?EkA/Kf9CjSjwlHVDcTYbIco8QnqIX4ZztAqLrmfRQN8RfkiocD+JZlqGGFgK?=
 =?us-ascii?Q?X5rZy/URpkABSCzx6qOkZFpIe2SI7uXBUBbPOYg/HBB0VZHU+UX4kmwgINwy?=
 =?us-ascii?Q?DBG8p03KSgS8AeJa5/huMF9A0wWmpkSmUd7PHHV+xhZ+qE7IfehdHbexCimC?=
 =?us-ascii?Q?VMhl5b4wYDlDdiQfI0KiuBeA+DSwFW9/m8vFf1K3hnWdGG2Yyv29+ZCB9iww?=
 =?us-ascii?Q?AHBjn9G1jLSd7uqS1a2wWo2Ab4+NtVYiEWhoccfMns62rUQQeZE44BSKDP71?=
 =?us-ascii?Q?2a4QQulq1AvVA07PaYTwask1i1EBs72xMdUkClr7vo+QEOgIWk7wTKNGRi8h?=
 =?us-ascii?Q?Dz8dCQ4Di9E5FrwJpTJZjiJDs9whiURu4KTA0fYZxAKkrDRXu8gWZxnQDTHM?=
 =?us-ascii?Q?pUCPTW05VleXXSrt2/LOY3cs+C+UMQyZIIdhgxhByhWTed0+jhehd+GovIqx?=
 =?us-ascii?Q?3Dvu1MyqcOF1Nb6e/euZlELiTI6kWolGJEnIebsD7jnEm+oNbdWcBGGeNGIZ?=
 =?us-ascii?Q?ZG5XlmYO2oIoYHoinsfz4IslU5RFIRF4xdIGVJ5t9srkUKma/yDoR95LGd/s?=
 =?us-ascii?Q?5NFmpudBI32JKmoHUxk41bltks3XjY0dt1/sIWbWF+xUoHMCk+aou+0BPHtL?=
 =?us-ascii?Q?92SzKZYDM9T0Z6gePM4ATjNucxDKKX+lrZlKbKbKUoWX66WO1oYOZRTnZ2bh?=
 =?us-ascii?Q?lJwQt5K4rcygWcBj8HF5VrQc7bvMgVZ0CEkTOgL36dPmw27VjejR0HWkvhUp?=
 =?us-ascii?Q?X6lnSvl7yhMoPNberzKwrI+BuOBltkW9TCFFKPXJ7feF4q0MWIaf8geDg5gB?=
 =?us-ascii?Q?BC3w70JwfouJSRbMErCk2hg74u1E87Nz+aHzyr7FUFQ5G+bFRLCpG/jL2l2f?=
 =?us-ascii?Q?jUFZJJWdQytTKrd8kw2vNEq37bvoW3IoYBxLco6hrdsj9c8LcV7g7ya/JJ2I?=
 =?us-ascii?Q?GrygclRMULdNBHSVKswmvO/78wVV+2fBmiBGA1smtYIShEJTe3rmUwVjBkBs?=
 =?us-ascii?Q?0nTp39kLITOR26ieihrm1ubz+uEzx6jRSv58hAKRvJ3Dn8X2Vu47OZHTXY8h?=
 =?us-ascii?Q?MqArrjY5083CdVktDj3V0gjjuyBXgpQsEZQpDAei?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1cb60f9-332a-474c-75ac-08dd5cd4c05f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 17:31:38.8054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NHljpvOTXVqGbOhe+3QvToejb3jKjRC0qB0Yy3qcWftiKbf4vFOoWFR3IveFHBr/+2VeBBU9T2QfH+YNJUmIFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10627
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

On Mon, Feb 10, 2025 at 04:09:31PM -0500, Frank Li wrote:
> On Tue, Jan 14, 2025 at 09:34:49AM +0100, Krzysztof Kozlowski wrote:
> > On Fri, Jan 10, 2025 at 11:17:32AM -0500, Frank Li wrote:
> > > This controller support scalable data lanes from 1 to 4. Add the
> > > 'data-lanes' property to configure the number of MIPI display panel lanes
> > > selected for boards.
> > >
> > > Change $ref of port@1 from 'port' to 'port-base' and add 'endpoint'
> > > property referencing video-interfaces.yaml. Allow 'data-lanes' values
> > > 1, 2, 3, and 4 for port@1.
> > >
> > > Fix below CHECK_DTB warnings:
> > > arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb:
> > >  dsi@30a00000: ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > Change from v1 to v2
> > > - Add the reason why need 'data-lanes' property in commit message.
> > > ---
> > >  .../bindings/display/bridge/nwl-dsi.yaml       | 18 +++++++++++++++++-
> > >  1 file changed, 17 insertions(+), 1 deletion(-)
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> All:
> 	Anyone take care this patch? Krysztof already acked.

Rob:
	Can you pick this patch?  look like display maintainer miss this
one.

Frank Li

>
> Frank
>
> >
> > Best regards,
> > Krzysztof
> >
