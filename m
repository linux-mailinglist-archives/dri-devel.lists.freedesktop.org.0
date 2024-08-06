Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5919D9488A0
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 06:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F1710E2F2;
	Tue,  6 Aug 2024 04:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="T4ps4g5Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010011.outbound.protection.outlook.com [52.101.228.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE15C10E2F2
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 04:58:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDlA7xyYKoK4wDYmUMRY5vHDcWZ4vhEG7xq3avHME0C4hF4FcffV5pM9mM0gT7D/kJ1Ca3+sCUPfRmL0HI8PmJ4cEKrItlV9HADeGdiIXx78uKFszJGL2byPMwvl/akmDkVCfi2yuttXZl4ose4mmRdSb5rsdL/5yn0e9k7/H/e5Sx/OcViPQx59KQuDiPWfh6CEYd44+8+Ka9PKlghck+r4SDjWhnuJCAknwI33Ucn4TsiTj/HypRi8lWfuNil2BE7dZfwT9xktvrj3e2fkfhgMxq4g7S4qcWzKsEQ1KXduD1/jD9WF3WU2H42NC2Ir9trlsK4XjD8wIXMon8IuXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0PPNhmLMToUGTc1xc0ZLEjyUCHOkhsP/J1V+F62KzQ=;
 b=T/1fzZogAwbz7LZB+YnEAKtCEnQi7VnjRdW+YUvFzmxkEe3F4oNQeJFAbJK2RiPTZAzptljOcFbNSdhH8Pg3smrHiN7IRLoaWhp1ZCl9AKrQoy073w/cnmm5UTyG7P3NmYHh3xpTX/htSwVEk04H0IIa+pxvwztCc/aUhjnjZRLZbkDjWQq/pC0b6XtsK1p+J6G0TYTe6+TZTJZEinHamuFEyMOZX6OLwguiF28cKTH+3i7zycyBb2GcdsCUNTnEJRgxIVlwzhcTnba63uppHiL1kKJEBurbRZxHx7J+D8m7YlLiVAUqgmhqcy1gwIbAKSg21wfaKqD3F5OhZp4ayA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0PPNhmLMToUGTc1xc0ZLEjyUCHOkhsP/J1V+F62KzQ=;
 b=T4ps4g5Z2z1p0JBasStQDLbyrtqv4Q/VGTMCiGMxeugoyxyXNxod7Zkf/+NETwXJit1t5tjfz0S80DEhov5kZm/qqWK9MoCvws3ZsPTF+77VJk2sfx5tkWYsnNbvdhnxELVRsJQRp2gu0s25rOTI8RW6uhpJfLSQV4lGtIwtvBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10409.jpnprd01.prod.outlook.com
 (2603:1096:400:24d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Tue, 6 Aug
 2024 04:58:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 04:58:42 +0000
Message-ID: <87frriw8l9.wl-kuninori.morimoto.gx@renesas.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Helge
 Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime
 Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, Rob Herring
 <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Takashi Iwai
 <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-fbdev@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, <linux-sound@vger.kernel.org>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Helge Deller
 <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime
 Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, Rob Herring
 <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Takashi Iwai
 <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-fbdev@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, <linux-sound@vger.kernel.org>
In-Reply-To: <87mslqw8mj.wl-kuninori.morimoto.gx@renesas.com>
References: <87mslqw8mj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/9] ASoC: audio-graph-card: use new of_graph functions
Date: Tue, 6 Aug 2024 04:58:42 +0000
X-ClientProxiedBy: TYCPR01CA0200.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10409:EE_
X-MS-Office365-Filtering-Correlation-Id: 753066bc-f524-4c9a-3312-08dcb5d471bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|366016|376014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NwdG2q4amh9huDOBkJ7auHmnfodumPxGcq0d4G2Pc33Nj1Wrc15DAXptSGCO?=
 =?us-ascii?Q?aHmS3mbVvxkzw+gBLry0bO642da3bneRsagjNc+RNlOUmEHhP00590PYFMJy?=
 =?us-ascii?Q?kazsFl7irRDry+YYjhxBVQrN8jeLvLx+3HzbGJhaVgbmHbmkaKobNqMuMh91?=
 =?us-ascii?Q?Q5hB35YPFSd+EUhHUOq85HVatk73hnsvlc8NX/r44Mhssy3Zri7r+rN9qqNs?=
 =?us-ascii?Q?FfmJ5XDwAv0mfYgqOCkqUbjcTyI931uCYwFyIKMRw/5zbtP5Bu5TCmiJWRuG?=
 =?us-ascii?Q?yoBfGUKbVBMxfdR94WvwQEz7oNHXtRCx/8cQ9LvmbX95lgdHdDVfiBrl7k1O?=
 =?us-ascii?Q?dggXJNXe5HKZ3QaWK54Ikz/XKGx3Nq204HHM1KqKSBvbVWTSNmWrYru6CBiF?=
 =?us-ascii?Q?5Md4/kLFlv8q0oz8XmVNnkCXdynmHsuozDh9Aln5sAi/xzx8Q6P7MjP8m+vK?=
 =?us-ascii?Q?jYnu6H329oeEHVTOoG+/bAqMlycgy8uwNTz8Sj4wNk5NUlbPiSY1RWMrNDm0?=
 =?us-ascii?Q?JthUq+g0hXxCJGQ9UMh6Blj/SxKORz15siE/5o0aTKqvumefo8Zh0JxZueDE?=
 =?us-ascii?Q?34ChkXLbGYX4T8WZNYsDAA63ZhszjOKnWvf4tFexlVKlnh8JStsldiCcevAA?=
 =?us-ascii?Q?Fw4he9cGFOFaL7TS2+Affhzg3RQFUmkvqBYX0QIrapKbg/IErVf6ejulxYyi?=
 =?us-ascii?Q?RGrY6gqA2T0Dw7+f+LTCoMOWj3g+cw+ReHmhGEJCC8qYgH6Jxt8do1uDs9fh?=
 =?us-ascii?Q?fL/B6f7XZS0k0rgP3ovpCCfm18wnLDtdezSnH6ovhywYdrgteUGWhrcLY9V0?=
 =?us-ascii?Q?dza0WWDCNqteW5GFo+L1VntbYIuyyxfPDqk7BpatmOISy/0A/HDszJJlAgKZ?=
 =?us-ascii?Q?8981Try5rV+nu2a4Yq+yfIKto0X9dGbp0DKlfYGmE7+LfLXKLxwo3vovVK3U?=
 =?us-ascii?Q?FjKRdW+6xx6lPhK5x7/vokUP0unftSJml20OwLnNdv/3O9b9a3HpWS95eIQn?=
 =?us-ascii?Q?GyGNiYPtzKFiP1hLFAQM5s5BJuls4X/sUoUp0Z17jdx/9njePruY0YwfW8cq?=
 =?us-ascii?Q?Ip8fBLubz1J2LqN9vyiEJm0ONsZ3gN5VVUBZhpzRtMBmJU7e2fNY2k38hd3U?=
 =?us-ascii?Q?WUZtY6Bo/dA3rHsdfFccI2Eh9hLkN8OZZh746Q+CT3g3mDQOnrfVFwJHeJwC?=
 =?us-ascii?Q?glw0Dgyx3gH+hYPjA+ZgDw9WWGEKFtavwYA5JGR427wq4Bsa85mJlRsewdZ6?=
 =?us-ascii?Q?qxaNRVjhp5a9VIfa36hsB1yr4CmLRXmLNfYlBM4c+1mJCVPwBxLJxN6sNhtj?=
 =?us-ascii?Q?8YwR1eAKAWl4STR77xun5mH+PfjzAe/LNZL7UXaC0aQG0lKA6WNMPSwN/jV+?=
 =?us-ascii?Q?mCqix1k+P5a11BMMgfcVVVIO0SmgXQJxkX+PSn9fWe3uBjd3gWFrVUd/77um?=
 =?us-ascii?Q?igqp4uKqDoE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(366016)(376014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CoSAtgRwamX9dF+FR9245QuzRCW6FL/DkQuychuLzLnhSuTZuhYSfVGFtgxU?=
 =?us-ascii?Q?R2S245aTMxBDHcbX34JZSVJ8uNf6yliUAqSWQ9C4FDFIglTUkREK5uP3pDYd?=
 =?us-ascii?Q?iRdfTIabEcIoKhPqUx0/kHqSpXZGGgAvbH0iEdvDUGmHuctnVgGWRalI8LG9?=
 =?us-ascii?Q?xs4lMFRg/R5Yas/NI22zfKmnmry1bboRq4eSEviN+HBxRxCLQ3H9l5rGdLtk?=
 =?us-ascii?Q?GtfjtndhA3N4aMab1Xdi7DY4ydWMcNYT62UdvmpcKOUnN8aVc8vt/7KZuefO?=
 =?us-ascii?Q?B9cOMHK8WLWzysOYhFVbaxs+bhu/RiAPfttfkd87w/d8xlzwmwBD0X5B+prB?=
 =?us-ascii?Q?U7LjnFcuDIy7dupMd+EByAAGVWowaJkDNxH6cdiKxx4m4AULKqi7lfLtMJKS?=
 =?us-ascii?Q?/EugG1qywzpUQXWXzwQR1OJLrVgQ1NMQmNSHG/4lk8IVUrj/bKgEvXBB15qd?=
 =?us-ascii?Q?HkS2KxWltoD42yGlFUb3MyI6xcnI+BcTMzNcSAIRtrb1L1rNWS3r6zubqE+k?=
 =?us-ascii?Q?49mRB4PsmH+IKQXg195UDhhJxKAauZw90Jp8hOX51vaBwBn4wQNaiIabOAVT?=
 =?us-ascii?Q?oEQUizbd3AdXwWAZ6gAK9YcrmuBHZhZEex2wgY9RcoGLViM1yrBU7vuZd8aK?=
 =?us-ascii?Q?7ZVZmJFOxLE1C1yvAQZ46DE4tW4ig23jVzU+gdeJQm3RjBPIRgfGbRnRVWs2?=
 =?us-ascii?Q?99719Ko+kWdj9suNtpCc9v/V/jHDksIsdQPtXSO2he0B8oS2j4J1Ik9M1qZI?=
 =?us-ascii?Q?XUPwVFN5PejgqBuxRkVXT0YvMxg4vAhXPflvUq+pZoyvFBqwjUvtZ2aAegBi?=
 =?us-ascii?Q?MathRG2jzVXDw319FBmpOAuEKND2Whp4L3g/JlvdFrpX5mDjeL0tDu5xEKbz?=
 =?us-ascii?Q?faiJRLfx/HnqF345qUVcmuWQSYoAkBUzhssgA5bZaqJa8R1Zwty8j1dALIsG?=
 =?us-ascii?Q?MLLvbFD/cgFRCi8Q44qLaSRMWwyrm5nLhuz/nDw+MRqms+/rS8QOFy/95I5J?=
 =?us-ascii?Q?ZTDbgH6691UmMP4FrwlZrPkUbgtKyH31UHwqTvUj7GjvS7ZWxCXr9y/hDQfB?=
 =?us-ascii?Q?PTHA0TwgPsV3irWXDDxMyT47sR1EuLkFlG9eZXja+UKc0zAbFNi1DtKVea5c?=
 =?us-ascii?Q?8vSTLHJYVFBS2jAxQ90kn349gyp6ALDOJxCRAopFvZWzU2zLTlDO06mwCaZD?=
 =?us-ascii?Q?im1j8Imw77bCu263I1jekyyx/40GCfuHGeAL+IteZwuEeCRNr34m3Ly5DcXF?=
 =?us-ascii?Q?6wucQq5DqTRDu2DZHmxkpXZd82kzXI2FwooHAeiqYXJkzqC1pNa/6C52A09l?=
 =?us-ascii?Q?HQkOybFOj4pwOxIv/yzWFpEoPPQkzBEeoqGAbSmuI+HNrp5oZ8nAX1PtmX3G?=
 =?us-ascii?Q?DoFwvgU9FUWYkYu8W2+kpl9QkK9uOriMEqcAyjfn2Mhvieh1MBK9Dynbi9wv?=
 =?us-ascii?Q?RmUGWf+SvWJl9LbD4nUuINcA6sCIJjgpo2sbx22WPmho9id2z3pLQLfNs27O?=
 =?us-ascii?Q?Jx4dX0Glo406iLkx1p905GqnVJnwGIkOnCRpcNWEbHq33MQiLNu9jJA+X+dS?=
 =?us-ascii?Q?9kDNFjGB7Bc0l/EzY6e6vmFSlzUV85GZMueXqLeUmV3Vj/HYKr2V22wX1qTu?=
 =?us-ascii?Q?ww3c4TnnHC23z/c9zkeb6T0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 753066bc-f524-4c9a-3312-08dcb5d471bb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 04:58:42.6359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alQWY8uZDp8LYBk7Hewat1fXFvtDktv3MOgrrerbZggelaBI5i2TKkWtVp78V9KpDi0iEO7kd/GtqHStPVV1RFw+SRCRRJhC2KgpjSlngjHUJDGF4LAlGxlA3CBvBOzh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10409
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

Now we can use new port related functions for port parsing. Use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 3425fbbcbd7e..040c271e13c6 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -376,10 +376,7 @@ static int __graph_for_each_link(struct simple_util_priv *priv,
 		cpu_ep	 = NULL;
 
 		/* loop for all CPU endpoint */
-		while (1) {
-			cpu_ep = of_get_next_child(cpu_port, cpu_ep);
-			if (!cpu_ep)
-				break;
+		for_each_of_graph_port_endpoint(cpu_port, cpu_ep) {
 
 			/* get codec */
 			codec_ep = of_graph_get_remote_endpoint(cpu_ep);
-- 
2.43.0

