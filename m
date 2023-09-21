Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA487A92FC
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 11:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4BE10E59C;
	Thu, 21 Sep 2023 09:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2115.outbound.protection.outlook.com [40.107.102.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DB210E59C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 09:15:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DeAMn4jd83ihrzFLgEeJ0IJUWePw8G8JL/Z+LwYMiMC6IBteYgBJwNdSvkZPHFgTQem3SylgN8c4zsjsZqHcFfvpNan9j8mkZ0DE+UumJYBYSE/SQERC6pDjRLq3Ssh8r7COELzg5z2flJPPHlVmNshsChptbW5WH+fchmUYt0Fb5BCjIymmeTKl8kBu4tue6K4T+S2bJGpvZRx8zxeEGGI8W9RJkUloBGEIVpCDffax8czp8kxWVA5dVI0+6WJgAVvkCVufvsYsW5FWujT6tSYqwUR8dGeQTrHgxCrC4GrMSAL47SpPFYfB4vk5nJJR+pkTxpYe8SJlNNYcrfhTIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtX/KXmv0z5jsJmknLRPakIP+8Nmz8TAzT85oCA1g6k=;
 b=f7jfRwdYTXQiLpCMCXemeFHpAtyXmhJ5d+IFwxZylUaeLyLr6dGvoiZAF7q5EuuIbOCDuGvefEVR8+YPwfFstXdBXG8VNgoTZmGaZ+iQpIOJnVL4ZW5ypg4jlhcWpFlRScCz3LDOF0OQnA4Gldku0y+3068ex74+zfo24I0ripbnDTvDJqgOGX6XH3P4KbChrRzSFpZ9nKVY22VuFXaTuBBPh5D9oLL1mimo6C0R0VsYySYHqHDEl+oFWzVR2EHGj2FHXhXDV61aaJIW6rsUfySxqRX5jVDVyHZxQScovW9J73vf45n5tXwbIMNzYga0ChltlF2aEp8cXM0hmcKpvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtX/KXmv0z5jsJmknLRPakIP+8Nmz8TAzT85oCA1g6k=;
 b=1Dks+sXRQ6BYjmAICrcMvaUDMDLIKG90dxmuHFjduPpGXxdbScxivtrzETxgCrbENdJ/J5QRlBObdTwxJV6urKaVOFtLuICLTDYLdXLV5Nimc59Xmr9juXJ4JnyT5xZ81bJNTgL4oxVZh/2JdgJU4Xm5rMiang4vwQUlRvuvd3U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SA0PR04MB7274.namprd04.prod.outlook.com (2603:10b6:806:e9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.10; Thu, 21 Sep
 2023 09:15:09 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::cd38:f20f:5778:a25]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::cd38:f20f:5778:a25%7]) with mapi id 15.20.6838.010; Thu, 21 Sep 2023
 09:15:09 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge: Add 200ms delay to wait FW HPD status stable
Date: Thu, 21 Sep 2023 17:14:35 +0800
Message-Id: <20230921091435.3524869-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::28)
 To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR04MB6739:EE_|SA0PR04MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: f0bdbfe1-7368-473c-4328-08dbba83407c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O0vtEfCvvmOWm+i8q6GLhbYmRY81bIWEegOjKbBcZYHIMkn/QSIvIYFyybU5VQu+K2RcROUdGtCycbODqpjNprqrlSZ9cS8e0ZCnytb7m8bi7W901spaZeX8tX9ye0rJZOdHq6RZ8KAEe4sGNeRpWzl+2+ZQvfyXLRN5c6Rg+MR1gVBmLaygi3VXOrPlO05khbLnTI9Oh2OCecGvu5V3qy3OoKgU+lppS/jt29zJ7sK2ULRFKobdNO6+n0G/LZYRXwv9L05FLGbsuZJlcDs2vKzplKT2slGtQL3NPNY9heabhU1PcWPUVnG8OskSlEyR50FNPNqvJVbfPWI84cA97tgb9AikRQTzbUxbfTNbUXYaO7wLtbZr3GTLuihJbgHpYK9c1JEt/MNU7Lapcw7hTM2uRKW2Il594vWHQrL1hz2wpviwUbI+m7SOFBmTQC11FVIcgMQv4JzrFFWzWSJorWFo1ajNuDxRzM2NvTvhvWKz1rZW/Py2NsPni0zAJldVimDTXm72Zo47wpf7byGcdGEDNvh3eOfh/LvAcfAnU+7YanLpHEDGs8g6wNhSsCGIgf+bvAnZyQ98WilaaZJj4vWJ3npRxcVkQSwdfiaBF5MGlpYC/Uecs5pd8Iov95JQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(376002)(39850400004)(396003)(451199024)(186009)(1800799009)(4744005)(2906002)(316002)(66946007)(66476007)(66556008)(110136005)(4326008)(5660300002)(7416002)(8936002)(8676002)(86362001)(36756003)(26005)(83380400001)(1076003)(2616005)(41300700001)(38350700002)(478600001)(38100700002)(52116002)(6506007)(6486002)(6666004)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3X6OOh3YWlTUJF+VX/mAwGI87MoqOpZBx2Qx+nokQUUyqJg2Mc7w9nEK6+TY?=
 =?us-ascii?Q?k5msnQ3Ls+XaS6LWwtypN+jiIbwi+J6oWNr93uHTeZR236endOsAR5kbSYSn?=
 =?us-ascii?Q?WyYkipcrujiMDukJLLdT0C/xEm2jAIV7+tbMEXd8klIgxOTRcvGNgoDWaxC1?=
 =?us-ascii?Q?oakqVUSELygmLsaLq5qfMPnyPBw2Wy+orUNexbpdNWDJvU5HxLG7kOywahno?=
 =?us-ascii?Q?ZO1kTkPK8mzp+hmgNJcxMBpqe3AcZH/BiZ2ENw9QDgzeKxvPMEFuzN5g0xHT?=
 =?us-ascii?Q?EQhIOqsiqwxBD9Au7KUcTHOOeNvSvBiBE5S1ynADsy5a3yvw8F57Rp1rGVAq?=
 =?us-ascii?Q?jbG4gCmr4O5YL0WR0cOQfAhbFqCh436YgnOd5isU+NaS5rE7BWlryOztdtIw?=
 =?us-ascii?Q?MUjnCpkY0wec6WrKUVco74fEmTKM0ytSy2f6FBWJwnzGfEB57TLBiLfk8jZv?=
 =?us-ascii?Q?AHLMOuUJhIrYPBVE1RLJj/OfJnXuzkW/6doOrROlcwJYO91uZOhQXkKb8Aim?=
 =?us-ascii?Q?pohlD2raF/C/v+ukDJZyAbhsk6XQtYfeENEyCbW0ZqgwibVG84IorZu16gE3?=
 =?us-ascii?Q?5CQwhRSRKQjea86Z/xXCuAXmlhjTchBd4JbSPEaD9uOop2bkCWud+oW8ss+E?=
 =?us-ascii?Q?W3BV6P5r2FMHcCU1oZTY8cG0WNDK7HyYA5IAhktzCHTKlNtiSWa3yvOEf6wW?=
 =?us-ascii?Q?YnDFZXsYoLEtzRA8rClJgAqgLffTzYuPEjUe3Q4iUXZNI+Mno3HR4OoGheU7?=
 =?us-ascii?Q?4JJ4hHT4069+xqaXqYVu8ywUgqdkZ0wrdXqjsuETTVHf3BuO2a2w6wne/3bN?=
 =?us-ascii?Q?6MTQ/9O1KqvfK0LXNhyzHFdioObfSGnvqQkGUZRb4WcrdZ1pbyzlvzsPiHIS?=
 =?us-ascii?Q?YQG4kOFGiFe1ORrJlv26QNZ4pSf0dW8QzkuWRYt/EqN+b6PZpR6imi/eH9PF?=
 =?us-ascii?Q?JmVf9YZUvwuI/yTtXgc8UM9pPw8w3etD2PUZTPlY9MOFp9SAAHhP6uwCLOdt?=
 =?us-ascii?Q?0psUj87+oT4UcirAHB0BbQZwMJDgWKe8MgtCYp0rRRcHlaqivmGXycl7ETh0?=
 =?us-ascii?Q?vD4GsX1S9tOSZcAoo4LAmmKt1zZFvPIXJrIzoeMznWCVwvtRSk168ngrzCFA?=
 =?us-ascii?Q?aG5lsNzIQCHKzYVerqzHySDShBxbMq9Rw+FN5oOJc/S9aFFCNnoCr4MOLEyb?=
 =?us-ascii?Q?QCuy1i9vy8SatNvBRVWfDRD5PJQv0C6a07J3H24u2gwImW3XHt4GJuVgrHYc?=
 =?us-ascii?Q?S0IQbeUxVKUvp3Xucb1hwnJSaH42uBQTdPmaGXbAG8zxX/Gb0OElw/BBCnsL?=
 =?us-ascii?Q?zhNHSsoOyP7GHVXmHKzSvPxc+drZlXcfyC/Y2LDqIT8mHri3+9eCK0khOryI?=
 =?us-ascii?Q?eRvs+fHh55fdYMQ2wAhIqNGQQizX3oQ7+m8MMS24LD6grCBnISAGhIeZQ74d?=
 =?us-ascii?Q?quVD9ils9KVH+M7PWzLXvtlQgZW9XeW+iEfEY5gtqkemiSVDh/S1qXvOUiUN?=
 =?us-ascii?Q?V7jVvE9kJd6R/LTMnmk+lmod+bZEPVKeQCtLe/TuBj8AOJseZ8GctAZR8N43?=
 =?us-ascii?Q?8j+9yxZ2CNTNyM5OhlAnF0vfDSupu4X0utP8yNRw?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0bdbfe1-7368-473c-4328-08dbba83407c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 09:15:08.9554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n60Pn4HiAoJIPTHyOzaPEf/sRx7ZUUesen1srpCgpdVbhbzy5jnyYRE+y/d81jiJADuVu1jxjmI9nvJIce3rIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR04MB7274
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
Cc: qwen@analogixsemi.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hsinyi@chromium.org, bliang@analogixsemi.com,
 Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the none-interrupt design(sink device is panel, polling HPD
status when chip power on), anx7625 FW has more than 200ms HPD
de-bounce time in FW, for the safety to get HPD status, driver
better to wait 200ms before HPD detection after OS resume back.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 51abe42c639e..833d6d50a03d 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1464,6 +1464,9 @@ static int _anx7625_hpd_polling(struct anx7625_data *ctx,
 	if (ctx->pdata.intp_irq)
 		return 0;
 
+	/* Delay 200ms for FW HPD de-bounce */
+	usleep_range(200000, 201000);
+
 	ret = readx_poll_timeout(anx7625_read_hpd_status_p0,
 				 ctx, val,
 				 ((val & HPD_STATUS) || (val < 0)),
-- 
2.25.1

