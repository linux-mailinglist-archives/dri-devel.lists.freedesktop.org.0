Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B28622F22
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 16:38:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DEF210E5E5;
	Wed,  9 Nov 2022 15:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01olkn2064.outbound.protection.outlook.com [40.92.98.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A79910E5E5
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 15:38:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RvkniS11z+X9nsz5XwG+UUYga5lUAJO1oZ4VAmGzFxuLzyV6y4vIWbVqwroAYkL1eiOoHlKckqhrpDPMa3yzU81akd/DPZbKOtxOoxb8G/UeQMayn1SnxBb9dJcAmrdWMpPV8s+GP2+inMY/aGJwg3kzLE5alJnpQQyB7rkwVC+Zir89FjI2r0gA9SyVSN51ZcTw4hY7OLqZVjy8x0iogQb+1tJEl8/LbuMMHTNe6NJ2qiuhLFhZn7zS5mJnhPbmtEBy1nIeSHxNDfI06CKlTs3KYcy6bUxEwnvqVwH6Hi1BoQssqogjnPfpnm/+HKOdRpLuvBf7FKpA4JeumcBGRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wViQGHfeKAwQpWV0FZ/IcdzonCQadt8T8lqofGRWorA=;
 b=k3SF42vQLuthlugT7DLLTEsWdkg6itBPAGx6Hd18laZQDASH5GIjcSOEDgh4YphL2dRpblnBFCff3Rem1Uv+1UmEjT8oCnGd8Vy344smwBIYk3NAhqLjNNXFU7ZL8IjTnK7I1xuid5lJr3UOEhetk0JARPiLIU0w8Ek8T1sWCP0laK17Rqnjpuxcq1o8UOCLiv/jWLsePmkWc05WL69K0RvlqFWWc5cNxWksNtzK5DKcTDKzcmU6Xikk2TbAZTSFyEjEzPjo4BdepBrpjUWag5NFddr35/HpS5cSouqv+uktBMCIUCYIcXX0GLparAHZqEims73TtcGsJaNftmw/iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wViQGHfeKAwQpWV0FZ/IcdzonCQadt8T8lqofGRWorA=;
 b=OISu83yOtxmWZC/JmWhCMy7B0gECwa9kU2mYWbriV6yBYxfEG9vE6N8xeTisSfQSAeIV3rpwxh4+jr2gT9Nvsrjsn3hew88gdPWI2jkey0kdEsxl9rcYfBOpRi1F+oeuKZhGGbMkaCwqR4GZ6XooX/895pF/43XEI81vhT3OEUtDd8G5WF0CKpDi0N6cvyrBtj0f6Yc4q0HjCTZKyx/k8evevFlNk4ud8v02gNw+v7S9cMAozn2s3yhRTIgZMOH81rhhNB1D4y4ISiPLA6c/OgsoAKKdYm87L6M89tbkIO2kiZ8dCEmrjbGgpUvCKSVsRcuZJF/zGKd75jzlQbFYhA==
Received: from TYWP286MB2319.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:179::14)
 by TY3P286MB2674.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:255::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 15:38:17 +0000
Received: from TYWP286MB2319.JPNP286.PROD.OUTLOOK.COM
 ([fe80::1ceb:6c40:8072:cc20]) by TYWP286MB2319.JPNP286.PROD.OUTLOOK.COM
 ([fe80::1ceb:6c40:8072:cc20%3]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 15:38:17 +0000
From: Dawei Li <set_pte_at@outlook.com>
To: zackr@vmware.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH v3] drm/vmwgfx: Fix race issue calling pin_user_pages
Date: Wed,  9 Nov 2022 23:37:34 +0800
Message-ID: <TYWP286MB23193621CB443E1E1959A00BCA3E9@TYWP286MB2319.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [g9aQKeVsz2YFGD02l0l6IvPh/+ulB3n0]
X-ClientProxiedBy: TY2PR01CA0006.jpnprd01.prod.outlook.com
 (2603:1096:404:a::18) To TYWP286MB2319.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:179::14)
X-Microsoft-Original-Message-ID: <20221109153734.53018-1-set_pte_at@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYWP286MB2319:EE_|TY3P286MB2674:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f16a6eb-efed-478b-72fc-08dac2686bd3
X-MS-Exchange-SLBlob-MailProps: a+H6FLLcF3q7oSzhUd6OsUif7N+k8LGcBGvMemvAeKdWIxz1DK4qv8bSbs9O0yCocqtw0d9zOU0y+5xfSMCi9xvEkWUsi63TNugW0DP8QHj0raHUaHhoJ/rHgEEehlpFqpw7yS3KnHX4hamAvLOfnC0m8rulouFzxLBqGVSqcr5rhdlHRlJvs+C386FhdCRP/orKW0nOJvoIcMqxanmFF2nIfXQmmwSkepCEvIw/a359L4jtxl3oN38VeUlo9m8qXzaiI1mdSKSDT94ndB9cPU0beC7TM6SwvaKrVEO+js/rXRGn5woooGAH1ZLTSVMBJcgbbpqg3DPWDcbEiXdzdCxq2MKS4ADvQM+LpoyK98UixTABfiUl+fnjrjcSB6XXssmmw4Xmchl6FEifVyWYed3oy3W2XzdZR7XOeqygw7aE/A4qXZJViUSMIDHrEbCad/kVC0ZEq/SYeOAfWLXT0SI5hiKGMqYn68D79kDP7+q6NplHG4u5B3pb3tmiUiCBOL3dqtxDk9T9M4dvYV8nOaWv3weNp9glcDsbjEsX75cNuocJrkQ9L0yPQcTjQTZBv1Tmmn4F4XLxk5HXeRWzwKRgwBUfDSGfC9INBXZ6hKnoGe9uChJlW698EdyK9VaSnkTF7D784UpTe55kNqj2vfq51qgC7nFmfSQc7E7i92axTRMSStqGqecMY0Sd7UFwWDFqCGeFzvB/hbeaQZx2R5zbAIaB8Ms2CXWiR29XLjT9iONEs6bcV1annFgktKqduKBno3AnWVt4LS2vAkn8+HaP++6cS5MMhY0bDxa8Ki1Yo9PnIgHtiVQCVvyzfECo
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ONDYFaJ1bPZKvlljCSrEZHqW0okcbrjCIYhNS8MvZnz016bA3eZeO6pmTvLSgL6hfwHQQXCMFXexudnNyLskhTp5d019YrnSJ9AIFokSxIarfNO32VOjB/pwTukwlucmaXo6MRXd3DPgyUCTC7Sy0OfxANMaWXd8NJmEpI0o78QBO042//EzHnPRKLzoe+So2RP4OVAM8KufYnJJzlHOgwoyIEUcr6xdUMl610Rb3xiC1lleZhzfB0cRKZrCQW4kDpv/GuieAjqcIbCZ80ACKIKqVGVNUiV6nxQz79kZaOAPpSg9Ek4Yukk7wEdaQwPy7LUQfv99hH/i+ZBs65pfxVUSGVk1jvfMCIpYBTunemJW5XBgEyLjfXJzksjKJ0LtURnUHlV2QzGMR4JWJS9ojb1PSoCGYCipz1L+ryuy4FRyP4iW3Gul5XqH+QdEwr9FdovLJPMKtISaFxSNOWzrAJlegXig5xVqBKp0jCHlNfJsPQD7owc5saI6h/O8MqCrQNGVu9hMG4SbLhoxNzaDsDDLMhpGqCu+DQxLmcDsJoq6W5+56iyaukdzJGOi5aC+SP5dPsSmri+pnkYkj0H5dVC8iGQ3sRuRRvVSXaj92Da8OZ1j7tsXeyNhQ4f+QPKRZCQuSXRwhY/V0WLLmhx2GRZqP4g9H8q810Lj07+ThKIUYbMgVAwIm6IV9OjFzO48
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I0Bt4toaMghaOTDQlIzjVwq7VtNB15juoaYom3cGmPTk3yTY2QPV4aH774cD?=
 =?us-ascii?Q?cW87lc6OOJ7OurYqNG4h3ex/2jY6B6geb3kzXU32D3XtZJwZthTIACYczdKJ?=
 =?us-ascii?Q?sdaCYlQ7zC4fq4MMqd0mKyv2AfaKxYLR8kx6fvINMJ8iyZb+aGvtcTAevhAy?=
 =?us-ascii?Q?r8mgF/L3GwnvspBvrhi8WHpUfAi07KGcnasXtjva78lYknaH4ylieOHdwKF2?=
 =?us-ascii?Q?WmUMdhv4po1ZyfspDysafiTYi1s5CTaxwipvAWPY8Qp62Qzv0bSO2JvWaaH5?=
 =?us-ascii?Q?CfNqrX5o0HENwHbP+eQmy4zoatXRF6U1jyjk3g+92alg5xIUO2CSAIKda1TN?=
 =?us-ascii?Q?1c0pjA58PlfDbGWL8RAnaAaaOLy3WqWVZHHeDIexsXR+kRCn61K5TqjAcZgB?=
 =?us-ascii?Q?X0bQppObbHrHBq7LtKN/GZaIFmYiP3413GK35NjVFp5euG0ZtsxD1lSO/qIV?=
 =?us-ascii?Q?hYtPgJ7iBF2JtsNAAKXGyASLk4PCsj+WuvntnwlW1qvayqheT3NLjhPllE7l?=
 =?us-ascii?Q?41V6N3mvcp8DhhM8aONyhIs4SGR8v9KD7sz1EyUwNQ8O1K7wagyK9HYPXd1J?=
 =?us-ascii?Q?Hm+iAkTJ7yw6q4E+vkCDmXLWPMXxnYK3Hu23a81ETAa1Jsn9g+6d60SMuwjH?=
 =?us-ascii?Q?EYMRaUEOBNyecERd0JjdZGFcBRnQQ5E9lkaqNFydPzcvFly7MWgFPHPZmkf6?=
 =?us-ascii?Q?VTeUPOa3uE+vquVXTUgUfFexeRxkM8PRnwcUIephkKCcR61PvZ5GJKU6ZW5N?=
 =?us-ascii?Q?ry+fnkIT4YCx8xn8LNcq4uo/cRw4mXaUGXliYXPOln2Mso5pnbLGxbSom+rn?=
 =?us-ascii?Q?l0qUQx2odtWP4rG2FU831qDmTzxszExs4RIfQJMxgD3H+vLebst117C91YmO?=
 =?us-ascii?Q?vPoiDOSt5tvBZvXvN92F0VyiLa9DdrtfbRdyRJxVYrI4tm29lO9iKOiB0iqR?=
 =?us-ascii?Q?24q6bJCRNTQZ7dp9IK4GbUCbUanTlr/Du+j/bCo35JxrmlDcvoO4d/WXdBqY?=
 =?us-ascii?Q?EvQ0j84DG7yns+703cJWgMMv2QSHiC5cWOgM5MrlSkcVszug/Ua7fHc3n2if?=
 =?us-ascii?Q?UTcOKctiGG0jxH9nt/j+ipR5qcnuqQi6m4ZtW92qkAhGg7IqIwrgrPRvn3p8?=
 =?us-ascii?Q?jn8NrXRS5cWfuydKXI+d7If09+5iP6BDg3zzJSspmM8boygXHJzOfHFa10RZ?=
 =?us-ascii?Q?PwyA0F9ICDMQcOLr3xITgXjnBsR/54lh+j6cXa6OpM1OZwKAgfYNw4yp7DF4?=
 =?us-ascii?Q?0Ix7cglelVXVVrZqzi9oFtl3KMN6N6bJGgX41hzktg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f16a6eb-efed-478b-72fc-08dac2686bd3
X-MS-Exchange-CrossTenant-AuthSource: TYWP286MB2319.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 15:38:17.1502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3P286MB2674
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
Cc: krastevm@vmware.com, Dawei Li <set_pte_at@outlook.com>,
 linux-graphics-maintainer@vmware.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

pin_user_pages() is unsafe without protection of mmap_lock,
fix it by calling pin_user_pages_fast().

Fixes: 7a7a933edd6c ("drm/vmwgfx: Introduce VMware mks-guest-stats")
Signed-off-by: Dawei Li <set_pte_at@outlook.com>
---
v1:
https://lore.kernel.org/all/TYCP286MB23235C9A9FCF85C045F95EA7CA4F9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM/

v1->v2:
Rebased to latest vmwgfx/drm-misc-fixes.

v2->v3
Replace pin_user_pages() with pin_user_pages_fast().
---
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index 089046fa21be..50fa3df0bc0c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
@@ -1085,21 +1085,21 @@ int vmw_mksstat_add_ioctl(struct drm_device *dev, void *data,
 	reset_ppn_array(pdesc->strsPPNs, ARRAY_SIZE(pdesc->strsPPNs));
 
 	/* Pin mksGuestStat user pages and store those in the instance descriptor */
-	nr_pinned_stat = pin_user_pages(arg->stat, num_pages_stat, FOLL_LONGTERM, pages_stat, NULL);
+	nr_pinned_stat = pin_user_pages_fast(arg->stat, num_pages_stat, FOLL_LONGTERM, pages_stat);
 	if (num_pages_stat != nr_pinned_stat)
 		goto err_pin_stat;
 
 	for (i = 0; i < num_pages_stat; ++i)
 		pdesc->statPPNs[i] = page_to_pfn(pages_stat[i]);
 
-	nr_pinned_info = pin_user_pages(arg->info, num_pages_info, FOLL_LONGTERM, pages_info, NULL);
+	nr_pinned_info = pin_user_pages_fast(arg->info, num_pages_info, FOLL_LONGTERM, pages_info);
 	if (num_pages_info != nr_pinned_info)
 		goto err_pin_info;
 
 	for (i = 0; i < num_pages_info; ++i)
 		pdesc->infoPPNs[i] = page_to_pfn(pages_info[i]);
 
-	nr_pinned_strs = pin_user_pages(arg->strs, num_pages_strs, FOLL_LONGTERM, pages_strs, NULL);
+	nr_pinned_strs = pin_user_pages_fast(arg->strs, num_pages_strs, FOLL_LONGTERM, pages_strs);
 	if (num_pages_strs != nr_pinned_strs)
 		goto err_pin_strs;
 
-- 
2.25.1

