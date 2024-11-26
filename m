Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AB99D9174
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 06:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF5D10E7A2;
	Tue, 26 Nov 2024 05:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="dmVfWxJR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011062.outbound.protection.outlook.com [52.101.125.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A1410E799
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 05:44:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vAgE31MaP0UOWS4wf73IwQM5o1OgDXnN1H2MCG8Uml+c9A34SQ7w577VSJ6m0vRl13EihnlhLmunWj3qzCXmJDRqf3zztD0kdTEhpTO+zvetazgzvx+dy1BMjs0znAAnyqd/8mOEcfKvw1AYdUING8exi/l7K+zPqIdzRbvIfJIZSe+0iTFLDxqOMyQUmVBnrUI2Nra0WsI3khZL2gV+I15b2/d/hy2TPJvJGLE27zmc3G3DgyewmPT/6eO+3zi6ntIbRS7RQqvd0IaHU0oRXIHYZ1kLviS3YqvbJ4pETTLn3wO52tSBDldN2qja2G1aounbbxQ2lQTjCnJOG5Towg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hoHIILdYdhgVrOmGGY+QnF/mZRsWpc5tN0JFEJlLxFg=;
 b=xkvDBmyonHrd8HlGVdYjK3zxQmqQIkN5FGU8elr+FgKBvwA2Uy0FAKnuJm7uEbNtCiQ9LZpTIZIE+R+Lu8gOeXblr4gdchdvD1pnWzxRA59DxDTukpunSoWIVgHypwiqehmzd8CGC5MrXm662Mh7G3tXbEdeXdQc4hmW0Kd7Ua13AGsHH041i1Bmj/3rcV6CmHPe04BDJVrUex4kiJFliyij3rogN3gc7KalSecKKGDhz5K430gEnrntyGwzbqyxiPuCImSpfnEAwLKstMPVOHZAIk6PCDPtjv+yTpY4OCEReVWS/OZ4s7I940iIdNfZuf5yNHI8tg/rbxxWdcroPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoHIILdYdhgVrOmGGY+QnF/mZRsWpc5tN0JFEJlLxFg=;
 b=dmVfWxJRZYT8J5XLg5iDx36eyGr3REBl7fGLkSh3ylfHRbPjG9+GqSf0/k34ieU/B4Zds+/GfXmV3cpWeNqYnBiiE+JKF10222zcO2DHzRIJPO9xLD50umEhF4kE/60bgS/KJ7lwpqcnlHqXNvIS6Ve9nTYHhKAQ2UhwScR7SB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5926.jpnprd01.prod.outlook.com
 (2603:1096:604:b5::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 05:44:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 05:44:11 +0000
Message-ID: <87jzcqsg5x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 3/3] gpu: drm: tiny: replace of_graph_get_next_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Rob Herring <robh@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Thierry Reding <treding@nvidia.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Alexey Brodkin <abrodkin@synopsys.com>
Cc: dri-devel@lists.freedesktop.org, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <87o722sg6y.wl-kuninori.morimoto.gx@renesas.com>
References: <87o722sg6y.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 Nov 2024 05:44:10 +0000
X-ClientProxiedBy: TYCP301CA0002.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: 80ae59d6-1507-41b1-5864-08dd0ddd5a5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?chiI5/w/2l4Uk1KwW+8DFUlKyRGlQeRhdUNi8a3DWgW07AgXREcmgTaWI2gB?=
 =?us-ascii?Q?5MlOw0bGoVTqZPY7Hgx/O5n5/NKb7wYioMtZ++uQ2FxkmOI3GOIuQu7aE3YQ?=
 =?us-ascii?Q?xwrunqKnprpKMc91LUic4mXfz3PM1uLnXaiiLeABs1D2YknhoN24fqJJFJaO?=
 =?us-ascii?Q?378q9d34ykcXISbm80PAVOQIuJ+jg8JkDRhR9W6eWZu+uvM1c6PW6mqpQgV8?=
 =?us-ascii?Q?g20A+h3Aq8o5GzaNwQPJ1j7K1l9SoCj2a5XQn9Q4FPDTl7bSAmKCeekFaUOt?=
 =?us-ascii?Q?eiv83qhQt8X1EDLGWjRhQPVGyaKhUymDtP9xMzfiwKbPm0xO9s7tawCpp0J/?=
 =?us-ascii?Q?zlDeu8By+IH2/w7pj6F1bQYNQoZcsyAjCM5n+ZfQmRm4yeatX5Rz1+9CaTyG?=
 =?us-ascii?Q?qATOW6wtMd0MPvuqF5gpH76RmZFvu+E3Owyqs3+tx8u0ojJak5TuV7wN3mTV?=
 =?us-ascii?Q?j4IFK3C+G4084Zg0RI+iXCzRUB2XOTSYADXb6A0+kIn+y+rb3NCUTdYPTt/h?=
 =?us-ascii?Q?tn7LDFT4mqV6n0AJATG8qDaEK8wNiyNnIxag30OLPzwQEWYzyQVv0zKKBWPY?=
 =?us-ascii?Q?mFW7dQcxxUcWGKzIpeRN6JVyJdVVoKctU5MM8hAmIidcOtvGMLg7xw9/dR8t?=
 =?us-ascii?Q?xvM14OvhgMRMELEJz2fFlxT8kri2hYuyG5KTzGaG62DdCMARZYDfmsne9L+y?=
 =?us-ascii?Q?1+2T9+hLFh9lOrg7o+rjoh5bj3sNqv9Vaky6M5TulEK1eSIpYfm90V/cZBRq?=
 =?us-ascii?Q?pHB8IswjrBthQCp7lBvQXYl5CmPByWWxGzPFhAAoppG3qP8mb2ITt74Emowm?=
 =?us-ascii?Q?TrXP/CJxnjvQ58hS+sr0Q3zoqqn0O3gPHpbf1QOC3U4NrcwxOFq2CxGfd7Er?=
 =?us-ascii?Q?J7eEW3z1T8KN8Hc0OFrH5/00xfnvHC/cJXCaK3K75lS5aTY4oJmknZha6Th0?=
 =?us-ascii?Q?AMtvMNNijPFqORRpsfJc8blYjzDPiN1leuLjgyMFYTOncNShWJCaZUwy4HF0?=
 =?us-ascii?Q?OQU61HdOjfHYBS9C6SGNJsbS/wpu743rRxFgbmVli2MeBBLWgENVHs+2EF97?=
 =?us-ascii?Q?P6DqhQJnd2IffMocrNR+sM7T5uD27/38s73JcGzbXTj5bcFTocXXDJV/19FX?=
 =?us-ascii?Q?neDZTkijoVVCFS2kcFmisolM27d8XKc35EbhX68wylu9bjqp/r6UAZyw0/wn?=
 =?us-ascii?Q?59rwmkbuW4eNaAuOhKd49p64AmLK0yryGNei2TqDrcUu6Yd4xELfamoOIJvd?=
 =?us-ascii?Q?XYVAf172FF3As1LdL+g8HN3suABhokkxkjJUGTpO/7Kwla1z6dMz8dmO5iH4?=
 =?us-ascii?Q?DsSFk8CBDcJOHBX6tRSg10ynYikg/j1ARrcnLMNnCz7htU2M4ff3/FCAB28I?=
 =?us-ascii?Q?4d7V9Hp2DsFvsCo7Hlm5T0jBM9sn5JnpW9+OdQz18vL1+PUym81i3xwipFk4?=
 =?us-ascii?Q?NAheWjq/AiA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xHxja6nzfR5U68UfrV6ICvNhFWPZKKZJY+vG51sIQpa0FZzFbuy379JnJOva?=
 =?us-ascii?Q?yScTXrDSkOkJWnerY6g33C1hUXAxJm8rmEeGbe/3YyD1BNrwVkAxKPCrF0FM?=
 =?us-ascii?Q?xokcu0ZO77p68jLkQwpanAHzNIaIOiublbdcsWPdsTvuPgFRtoXgwK64OY2g?=
 =?us-ascii?Q?3HKyuuAYV6eW5heL74ztsmTAZwOkR8RdmXsFH1U/d6zdA8Wo6MtAEyBTPQVM?=
 =?us-ascii?Q?laMzZBEBcCoSyna9B6BpGN32A0nanfD/Ge7BznYyol8J0mvpfAMVVyqPn3/q?=
 =?us-ascii?Q?JuUD2nw3KuBBFmEGxHMbTB8LpDcrVi5fPVAQbVzE+KfyjYwh4SJ9DSB+oGAT?=
 =?us-ascii?Q?p59rCNDxTrjUUQ7WyWdZHbZg40A1ZbLshFE+QzZluQKKQe201pXnIt8jLRpE?=
 =?us-ascii?Q?X7j2T5WTehia+H2ez0tsK2mVI1UBRHQCnq4kQ7Sl2hIBtIsii4TTr9Jm8l26?=
 =?us-ascii?Q?c87n1/i6jpX5ZPQNjrN1EBMPcfBBs3jIvXf/DlxMlPmiI+qO3zvlIZ82boaT?=
 =?us-ascii?Q?SoGV4fsAtpO5NWtHVvhqFeYQg+d0mfaTYv7zIiPcXYg/smta/OW70cMN3UR6?=
 =?us-ascii?Q?T5f3vRHsODYipo4CwUhmjcoDOxUUmZ0ihXTOfgqiuNtd0Sfgq48dpRMUEGZc?=
 =?us-ascii?Q?brU8B1JPKteWaz3IwPYbq15+tLUaPQu0LAQogoitTWD1lqd0NPFkNHtICVBR?=
 =?us-ascii?Q?udpbLbsbT+WijAuOm7OpkO/Y2gYybhv7W31aM4p/pAtqlKeOwaKRNkgBbx8L?=
 =?us-ascii?Q?tGZ2tVttMvEsdVFfFQOi6rlIVRGQ0UEzTU7fo0vZW0es19ocN++dk0IX0xiu?=
 =?us-ascii?Q?Sm5kN1eK1+FDL5CYWP/Q2HQH0tskdxd1MbXaAkCso9q2fVU+RsW00jZlcCJx?=
 =?us-ascii?Q?MlNJBhHuIxruo0YwtxwFFuKgCilcc/yb7jCrS0GXeRnfUFBl3Ty0CoHqOeFG?=
 =?us-ascii?Q?/micRkrefGs8yvPi+0ANPbf6U99wEWDcLJxSataMsf0dBsHlyAyHG/pQQPld?=
 =?us-ascii?Q?L5JFKZdKhcTDM0dinOVb+22oVN0Df7hk0EZk4/h8afbslYxY50NzmBVaGfRs?=
 =?us-ascii?Q?wgjEyikvD5dnEV9oDHEmchJX2brDnnufkdUKIb4SddlTbClGLuBGoJuP7Oy/?=
 =?us-ascii?Q?IGiqj5CJxhQ7DFqEH6LarloGIGswkjToO6Lzeo81qCbTp4BaXXUAx1PsGv9V?=
 =?us-ascii?Q?bxW/kA8cuP+056aUWij6oZlrNCUYSuny54xlV0i5+C0vUx2t0CXJfyJC1IXG?=
 =?us-ascii?Q?WgJooKLNBMUSJbl8h6KqWUUduB78o1C6ONo21q7fqRJmstKotHDb/H2xtkw4?=
 =?us-ascii?Q?vD1s6o6cD+xS3DTvUqDrEoCOkXvN3DG/9vvNCoy+MRn9ocoOwYkSwn0RfPhP?=
 =?us-ascii?Q?WD7pnvy/hj2SRVD2gJxozDS30C4CZDFGvV27cktl3+9K9WLgVzIO7QZNGnH/?=
 =?us-ascii?Q?aEcBIC7vI7AzZZENzayGe4t8Yihw3HpBDXjwjNMM+gq63qqLOnI67ZmS7my/?=
 =?us-ascii?Q?aD1WU3Ti1/zNUYtMhDoTIP4S5S296fOinCV2oWKYjkM9b1A8c23sTMbCRWzJ?=
 =?us-ascii?Q?vgQ/7SKWGo3OdstAQxPGAXN00Bxo7253zQd/1Typw6y7tZRz1D2D69nHAREu?=
 =?us-ascii?Q?GMAfTkHyf9WEs+BB2PvHjMo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ae59d6-1507-41b1-5864-08dd0ddd5a5b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 05:44:11.2286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nfCsvzubk35NFUWJl9ko97vJytXpnOoQ4EY/T+LsBrwM6g9Z+cw51IToNoyZ+0zWCHe5v66+wmb8nRmYqkKh2x9HQ5lVuJfcf2H+sOUe7Ycsbx0CuPm+nSKMPJiZVCqh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5926
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

From DT point of view, in general, drivers should be asking for a
specific port number because their function is fixed in the binding.

of_graph_get_next_endpoint() doesn't match to this concept.

Simply replace

        - of_graph_get_next_endpoint(xxx, NULL);
        + of_graph_get_endpoint_by_regs(xxx, 0, -1);

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/tiny/arcpgu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index 81abedec435db..b2dc02df74f89 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -289,7 +289,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpg=
u)
 	 * There is only one output port inside each device. It is linked with
 	 * encoder endpoint.
 	 */
-	endpoint_node =3D of_graph_get_next_endpoint(pdev->dev.of_node, NULL);
+	endpoint_node =3D of_graph_get_endpoint_by_regs(pdev->dev.of_node, 0, -1)=
;
 	if (endpoint_node) {
 		encoder_node =3D of_graph_get_remote_port_parent(endpoint_node);
 		of_node_put(endpoint_node);
--=20
2.43.0

