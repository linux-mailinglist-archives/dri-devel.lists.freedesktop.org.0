Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AD794889C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 06:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B1210E2F0;
	Tue,  6 Aug 2024 04:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="LGV9dpt8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011003.outbound.protection.outlook.com [52.101.125.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E34510E2EF
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 04:58:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSlY8SA0DU+enZq9GiRzGz9GfTfs08Y/zFrAxZ7OYeJ72SQB6DORhsOGHps2uVYc7Xd8iF8zFUn4VqXLt0sKzhQpxX3SALcfMrzHK+9xKCZ2Y2t6t/QWmsHwbXKieImq5iH1LNhALoOoEJRtPPnb6EvztAb+EgNhXwhkMfZyX22DviewbzoNov5BzAGR9WYgsoaEmatY/T+3oEjfRCXDzhxIv9sFiY/z2EhILD9g1v2+2RnbIdid+ri1dvuXE5ddVAPDzaRsZftvHICaRyJFYKhIgzpnFBN6VTb/yncxqBn7FeTOR3MOAkS8gywp3uCA7R+FJKODAv3KHPl8dmks2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGGX+Q3luKrdwPd/jnIYOtaxjjFA+XQ3cahzrZILqSU=;
 b=dvymjYHlW22CUqB6V74U+3dbzsnnx17nfAloNRe7TQi3kpqh7LmqrjGLNhXAlJM/NvkREWKNO2W+t+uXxCxHqLhUJgKEfm90CCLQzWvmjlsFOteFPxFjnj+xg75JGGw0PLp/RFibmppIQyA6Tb7CDCG3jjIsSiq1WXPJvKD61GWanawvIO6P3klo+kFqyJx925HSZJ6NQPoTFF7qFEqhTejOHe/L0wA7auKAZqZwTLFK/jYR1Ol5ZvQNmPpA5W3z+m/sIu+SeT4beblfkOeSEWIhyksB5OhRLhZsGO1dWseK1NO8qXHQlJVuysoVLoZWkaFCWLHSsCvot5gmnutRew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGGX+Q3luKrdwPd/jnIYOtaxjjFA+XQ3cahzrZILqSU=;
 b=LGV9dpt8g9IPFcTYBN6d4WvQcxl6S5CzMZWe0rdeC2dmm+H69weIn1DHo3F1KZuZktxr5q4Q6xN2Yw1FX0pqu1uXDl/PYD1i00tdfY4bgHTKUyLISnv1GyjnL8E9Cj5h828FSLe1XkOnAtPKAb608HWhwW+WaOSgHUxI5KZr200=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10409.jpnprd01.prod.outlook.com
 (2603:1096:400:24d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Tue, 6 Aug
 2024 04:58:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 04:58:38 +0000
Message-ID: <87h6byw8le.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 4/9] ASoC: rcar_snd: use new of_graph functions
Date: Tue, 6 Aug 2024 04:58:38 +0000
X-ClientProxiedBy: TYBP286CA0013.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::25) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10409:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b291b25-6394-4d73-e733-08dcb5d46f49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|366016|376014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rzApNqoHy/1NVOdpNHhxJKnOHdpnZiSZVSbZjacEcU4kIhBaosBOLnjBTM5l?=
 =?us-ascii?Q?3/Il0MSxspqz2f4nbDxGwUbPwr6wSbBtKappxZRv2hJPhpM4Eoa9+rn7wPi4?=
 =?us-ascii?Q?LLKA154Mqw95cJgToTXBy5AP8MavXM0+KGotuXLc/pObbKdcV0EVWcq5Cj70?=
 =?us-ascii?Q?t2edbmr/HRnSs+5sdtN4k5TMaosYTd7mlc3FcmkNhNy5/XWOxEx2ExvUKiJ9?=
 =?us-ascii?Q?9dP6kqGFJ6bwRIuI0gtffoHc7Tk13kzMGmOlKxueZkaaE8BOauLNNqKr18Yp?=
 =?us-ascii?Q?3iQNjQSYKVsBm02jcMOGiQFFZ/vnSsg5V07bHv1SQ/4YWiTz2lwEtKOT5wBn?=
 =?us-ascii?Q?psTDXTHNjnlKn0Yu9AF3g20llrNQiy0mdKJVUoo5MxtcaU06j5dMhICeU3oa?=
 =?us-ascii?Q?dAKFCEEDof4ypQ139zA5R/OijdTULCZY4rDWaAERPN+76c6iPfvkztVvuM2W?=
 =?us-ascii?Q?nahitBmmolNBd7dKgtT5biQPZJdIaqwZzHWbYFNBnAUsw5s/y/rCcpQK4W7N?=
 =?us-ascii?Q?8Ab/XZVDPyR0MspDr53XVndEvwyOZW194E+fptz7HzjYtQEe1MEhm8fnD+er?=
 =?us-ascii?Q?MW9zXbmW1sL4W4DgJNWaK3zDr7oze0GC6BukDeSkJ6/FS2DpYZHOH8DcFm2m?=
 =?us-ascii?Q?XupcviLeTitodvP0yrWUukz9bPMyGzAZi6ND8kkP+nxTcnCrP1gKVdq1tf3G?=
 =?us-ascii?Q?h6zyPQj/awFveXoEYXl21r1r3qbwsiBiAgwOye8kOxPkxzsPhYhMkorBj8/h?=
 =?us-ascii?Q?0QICbrU4UxkEPc9beASvSYt7th2CTzG677x1mVaeZEPZfYQHPdubSfbqWTTl?=
 =?us-ascii?Q?BeCJnGUD4qXZIXtuACOmkUMpMilFkAckIY07lkSJA362gkZ4VCyoY2wQP/8o?=
 =?us-ascii?Q?dKByBJLKx9qQ06cnTWiQRKjFYSRNrlVlx94LIPW0MuMMIZ3LGsc1Z4I33lpy?=
 =?us-ascii?Q?ncrutks395z+1II9ICQ/BL7CChG5ApDIbzq9Xoyd4SETn3DBh3Mb3yaaRm3U?=
 =?us-ascii?Q?wsNkvaBZCqUIGkUw6yfPxRlJBB/4kIRkDIUkdxNt9YW7APkGNB7ldWR2ZLgj?=
 =?us-ascii?Q?lrWnQg/ribh/8ZxVtqK6eg+sdUktDd8ifYpsjPcQgJffVUEcJYowrfq35ihx?=
 =?us-ascii?Q?DQfsI5rhcfDYW9uJM9f22ro74+/MlNwAu99u/H4ZiBeZPOpvOzKrNh9qod8d?=
 =?us-ascii?Q?BObfP/b2/Su3TCgWrsGQ0XKPJEWtDUv+V5ln62D6H4F+grI8Ra2sznTZpZHk?=
 =?us-ascii?Q?r5z1A81hw9zDPKQHS+OjTbR5NZvPkLxfvy8rQtkoUZG8okpA8Fx5kGKW7c/A?=
 =?us-ascii?Q?2/gO077AfYGCwYRnrxqmde6UPv8c9xfgujj33zRf3V8a7L7TD2k/DERpXgBZ?=
 =?us-ascii?Q?gX5h5w8bBZry0/5fv8K+qaUMNAEzM7d0Pb29/hwi0jMkqdbsnQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(366016)(376014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3DRH8cZrglQxsiP6im3SxXaNI2/oVa5rb3EOVNBHUwiU5e5fKgKks69GEluL?=
 =?us-ascii?Q?sHZPwBA3KYq/r6tvmsDKUxhq76ivqbPDzGXJkcQlPofUoGefJtHSyr95F+oL?=
 =?us-ascii?Q?OTho3RlU3xb2qKnR2W2rPUctYM+7p/NIFGfXxRdO4/dR308FJ1qKeAjlPttd?=
 =?us-ascii?Q?dQahyi1ATfh1/wtHcc/iXBOkOAwK2+F+YVRNDUsrZFIxNOFWUWBXnlRxMwRj?=
 =?us-ascii?Q?JaXWzDbe+s7Bjgm8N612COnbklq+UWoLG1roWn7JunKBOBjWVK63VRYHCr9E?=
 =?us-ascii?Q?R0Ke8EldQrLiRwaeSya28yN+5uw0VOwhu2Ai7zfHh6Ej38XC+/mYhJIlgzhD?=
 =?us-ascii?Q?8/ElseTBcEBV/92UdiKb5B5oSqyUEMLXSFidgZaY/j6GoUHdP03XN0kK9y1N?=
 =?us-ascii?Q?lfe0Dvu4QbejTY4E3djNi+K1+PzYBDgUv5aPujt64jX9oW50NWFO5Ob/pUy3?=
 =?us-ascii?Q?19XBBAk0Q7jF2KP4/LrkXCgS63ktnXDb/KdW1bVW/1Am4Y0L6fnEZM+7G0zh?=
 =?us-ascii?Q?ZwIIvC3Y1Igm6e9CXaQR1XdWnmrA99ogQTMyYLTU5d2hhyvpjx4sLFCDYyLt?=
 =?us-ascii?Q?87/lMF26Sq4aEXyjDxeCGSynwsb6TESYPCX+MxlErF1K8e2E0Q1J6aL76dZn?=
 =?us-ascii?Q?npMFAZ9eqbLYZJIj7GuH1QUJDsydGvfSzfHtZj86Cp5G3jf1801bsoM9EBVX?=
 =?us-ascii?Q?tkZ/+lQyTpKjMqbqXLdpIGiBBS0s4DwsRG3JKsrxSWmfCDwU8tShXgxAfMpn?=
 =?us-ascii?Q?5gqol3g7MkJkyJdoEGp7+q5jyMP74vh9Fzt+6eRSif/PJdeAiHLTygRSyxAi?=
 =?us-ascii?Q?b4ILy5+/UistuP10ImUAe6OhYrJkWbmR+9tvCPJy/q+cOTDP2nBwLeCGHNfq?=
 =?us-ascii?Q?ITaLBNzm7iX2oZyUxgbU0eyM2LSBjH2YwMuDC8eSXkFYgCKgZzVk3svrP3vj?=
 =?us-ascii?Q?HHSeNbI4ONQ3wG78oGqKYe98gRrf2kHJWxs7nVr945xiINItonuiJ+m5knDQ?=
 =?us-ascii?Q?l3Cfu3gx9VGG7LgfpvyAXzgxevPNRVTSYma1JTn/6C0WX/BZZB9pys75qzZZ?=
 =?us-ascii?Q?zGGfmFSQVCL+Bja7u40JTNQLuUmlC+SEvG01Qv6gWUUDWPg6wwaqQYt6iGXi?=
 =?us-ascii?Q?OD2qNUwY1fo7Cam18i/qbXFv5XQxlJksMWieVTGdoaAFVDAcHw6YX9H8u/Dx?=
 =?us-ascii?Q?fIvNEyJGHNDUuexTy9bCEP6r0vX9eX/IjZ3XcBsijrTopT3PQcFwzDp4Whlo?=
 =?us-ascii?Q?x4PY+KsGHgRZLzGSfLSAFkxbkBFlUHCjIBcou0qZ/zX6N6egmo9RnseUulIk?=
 =?us-ascii?Q?hW4zYyAXg4aTCnB1n4j2mEgokTM4y7ZSMrDhcqbv2utUWBKzBf5xLcBhrtKr?=
 =?us-ascii?Q?rP9+skstuDdZLh9txj19RxUSpguEZUBH5iU1yyAUXt7DYWZ/8yYGwfeijAqo?=
 =?us-ascii?Q?3fnZastBJQ+gvR8h42lI272Xn+l3XNvzkozVs2g6wtSRbu59sl+i6Utr1Vpc?=
 =?us-ascii?Q?qCnorC5DUbaDabJXd4kO6lX0MKqRNgYDIbHp6/IlT7g0O32IBVpQaZC8NaLK?=
 =?us-ascii?Q?Y8Bx0uYakEHfHM2l8y1iO6sdAyMnBdRZCCXRBSfldjEe7Cn9v8alEA/edaeK?=
 =?us-ascii?Q?ulJILePXiWVdaiKQrxBskrM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b291b25-6394-4d73-e733-08dcb5d46f49
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 04:58:38.5465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3pzmX4J5AgQ+XOjsfEzThoXLY/QfI9qMH185izZWMm7sWYGmE23yQXMWtIfvGSmaLZh5C6VHpQmJCmE7Bjkt4xi4su80a9TpEaPSjXbCCHBXmtqyBgv67KWegkhbLls
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
 sound/soc/sh/rcar/core.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 63b3c8bf0fde..eb146cf836eb 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1294,11 +1294,8 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
 	/*
 	 * Audio-Graph-Card
 	 */
-	for_each_child_of_node(np, ports) {
-		if (!of_node_name_eq(ports, "ports") &&
-		    !of_node_name_eq(ports, "port"))
-			continue;
-		priv->component_dais[i] = of_graph_get_endpoint_count(ports);
+	for_each_of_graph_ports(np, ports) {
+		priv->component_dais[i] = of_graph_get_port_count(ports);
 		nr += priv->component_dais[i];
 		i++;
 		if (i >= RSND_MAX_COMPONENT) {
@@ -1506,10 +1503,7 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
 		struct device_node *ports;
 		struct device_node *dai_np;
 
-		for_each_child_of_node(np, ports) {
-			if (!of_node_name_eq(ports, "ports") &&
-			    !of_node_name_eq(ports, "port"))
-				continue;
+		for_each_of_graph_ports(np, ports) {
 			for_each_endpoint_of_node(ports, dai_np) {
 				__rsnd_dai_probe(priv, dai_np, dai_np, 0, dai_i);
 				if (!rsnd_is_gen1(priv) && !rsnd_is_gen2(priv)) {
-- 
2.43.0

