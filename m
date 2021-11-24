Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4515C45C80A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 15:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1148897D4;
	Wed, 24 Nov 2021 14:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A65892CD
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 14:52:58 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AOEKVdc031449; 
 Wed, 24 Nov 2021 14:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=aREreVxc7pi6k0Co2VN1/WJq8uOP3GbLJEXGUwiCjBM=;
 b=Bi1EQ4tAN6Zhikyd6BW5OQHvz+2KiD8KBYc6fXW39kI0FhCb//PtIMT2uUdHUet16CTp
 1BfPfOna/0ZPuGuICEOJDZjgZz0JI7VdICK9B/hjEg2A+pghNqXL5/li9HUOlPHTt7cW
 tHIH878gO7GhGcdkZGZs2Fl3Xe7k5WI8cMJKLtzwLQgGgBFEGa1w3HdTh/wyKRYKR7jp
 IVdgGkudukzgCti7pgNIDtU3M5nNlJQOgTQN63aahr4v8Gy3qaq7taLKDemWGkXGP1IK
 sPY43Mp59zY2TckkyhZfv9pupripjtOinisaqmrOvvW5f94A8Ec7xi2AR6cKCSu7VjJh Hg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3chmfn14fp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Nov 2021 14:52:37 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AOEp11Y047663;
 Wed, 24 Nov 2021 14:52:36 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by aserp3030.oracle.com with ESMTP id 3ceq2g57r0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Nov 2021 14:52:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzxNtwYNeeVPsXCQVrfxzcnsuxfhv3fclno+IzrC8djOZ6istLJpVQSPdAwKde6QnJK3wLUzJCutDFy02kLMi28nvfJU04jcR4ke0EB9ZmVO6D0vEqx+3jpc7uf7Xw30m0M3Te+SS26gW20ludd+4Yfxy9Md5Rr2q09+a2pkbZB1AHF+dEWLG8aniCQDfY5Th6l25UdYBBkJVbZWoGkVWr8RoGHpCvjunSbEQ9BU78R8QkL3Fa24NUtSZgrSXz8HazfAj9DKhMAj6BeJ/rnfbV0iHnbvEM6RWNTJMPjFiMoViaJPZ7JV1FRcnOa9AE06CUVCBtJTh+zAs+EksrZ7aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aREreVxc7pi6k0Co2VN1/WJq8uOP3GbLJEXGUwiCjBM=;
 b=bvvBy4Qyisgrk4whLrg3d427dBGRrzQnsQuOyhvI0Gfzh8Vuf0UNU1/cIhj2izvNsy1y/ioQF9Vu5DvXFOGiEFP7oTlDeLFqZuffYzmcps0QKClpLO47zlmcs6eh/RM4uE1kmApC9VxbJbuWF7QesdzjWp2GggSBvlMSMLygo6QwxYLYgln0+Dj1RimFMsG5/R/GlF9UdPLbA2rLUAFQDNUMLX1t9M8g4OFPg27cHz3h0TQJlOSpafMRUwN1rhdRCtQHnPCazNlEauolPCjSKnLO6cuad56jBafrzagneTcPMlrJUhxQalASxk0uyZqZ1oDzvp3nKXBBnrvyxn+7Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aREreVxc7pi6k0Co2VN1/WJq8uOP3GbLJEXGUwiCjBM=;
 b=l1P1peW0gURIkiueNjeem/WNlYtHk87kiYlRznk/de1IGa6P4ghqzwW67CFatRMMmI32nm95dWbb2Gero3M0CVzR1T2CXJWXAoEtoo+OHhnABZL9TzVjUPMarhN1477g4Zvi2xwLTSTicYneLiK2plWxRcylmGexT/XD/pLo5+s=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4707.namprd10.prod.outlook.com
 (2603:10b6:303:92::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19; Wed, 24 Nov
 2021 14:52:34 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4734.022; Wed, 24 Nov 2021
 14:52:34 +0000
Date: Wed, 24 Nov 2021 17:52:19 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] drm/bridge: anx7625: fix an error code in
 anx7625_register_audio()
Message-ID: <20211124145219.GD13656@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: AM6P192CA0054.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::31) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by AM6P192CA0054.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Wed, 24 Nov 2021 14:52:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a8a2a1e-5d63-4956-ae92-08d9af5a0c33
X-MS-TrafficTypeDiagnostic: CO1PR10MB4707:
X-Microsoft-Antispam-PRVS: <CO1PR10MB470703AD8B38F19EE40162728E619@CO1PR10MB4707.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ibAtnvISRlvbJoM8lBMciyDwSwrRYsnFJ+76OMrrZ+vUou1iGYnRFruSHHf03dQRO/K+M5A8tPHdFMpV9053wmqLrvh+yTokpu1p4nibG8l8mNaNHGlzS+9ijjpByuoIDzrw3HYqVUDk6A4Lt2OkXbG1y0XiCh9vXw35Ry8dSG7+00FLe7GhY/uze6DpYkAehqQTekSEBXLPUdqPb8T/6XWRGayFF0w6Mga21EVPvN6fqj8+B14t7RGQZnWHRThJBVWKChNbAM3rrz37B3M3rkVI00chB2xewIrks+KWEkU9hX3G8RrjjL94udTjS+TpJmEhjAu1LSpxoAjj8h4ApvbIV3Z5baOdv4hO0PXObYDpSzaNWa37iegxReJifV4YWa6kLQzbloyhYyzTEG7lxRgxAjdI741a8zgBDuAVElJFnwP/zYv3r7ybwBTFLALSyUT4wVEF0XLn281i07LvJAqBakz2AbH5H7/OGdHXj339dOEdX2KiqHmNAfUaKz+nGa+Db/WgNaqzD7ByVgeI4HVJz9YdUSayf4DLNnlxgJKZsv4BnoDgPj7koneRP/KSeNEbhzZGx14Gm5kHSVWsnb1WalMklwING0zUOayDqVzfXzz9U5eql2owGyOYf7/MdqmWoBRuspEhEhBdgXkCKx+h1psSZvHQgltiUv+JmMkQBeCuWsAjVQZ+QBM0dlIS0W5RWDNzUVQ1+ccappBJUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(6666004)(9686003)(4326008)(55016003)(33656002)(8936002)(66476007)(66556008)(316002)(6496006)(38100700002)(26005)(33716001)(83380400001)(186003)(508600001)(38350700002)(86362001)(54906003)(4744005)(44832011)(2906002)(8676002)(9576002)(1076003)(52116002)(7416002)(956004)(6916009)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XsU1VapbQQOwnBSfoU5Scd+ag35Bqs3UR5mSo5aV6a7Mim1GWI2bCcHTq7kI?=
 =?us-ascii?Q?Z3+RDRZx31N8Ttt2nyTc3EPEZVPWhO+vhKXF+Eemwlk5OUiEf088SaGGWni4?=
 =?us-ascii?Q?qcUXjU31gR6ryScNp99JamXWrB04y04VjwW2NkP7r7sUagnVaP7QmDz0IRf4?=
 =?us-ascii?Q?O3kKjIriRr2h0HF4BJLEdqny5zWvscqugmLnOmcc97/7b0cDFBThvhv+4xpY?=
 =?us-ascii?Q?rA36r/KnkjTdx29l6WvHym6kB8kKn5mHxJUi7TajQ5llWiIOdEY62f1LKS6V?=
 =?us-ascii?Q?sIsR0SXIJ4mUC0GYGacSIjhAj6/NIJPE/Gt5Y5zhOm6tnADeuIzhdpSMtEZd?=
 =?us-ascii?Q?jAD10w6BukpuygxViSNZ+CdwxSmoOZJ+5vztxJQ9M+aXMhUkpqgCRygs0Sag?=
 =?us-ascii?Q?Qor8HQXc0+hnk186dCOdRWSKVcA4NEqfGULy8SAGXf4pR2wq/CwYglFzieeU?=
 =?us-ascii?Q?o04AZQ8kcQOYXhyf0OdW/15xsPhFoTmAM1QNf5JVycHXei49L3bhT/xDkChj?=
 =?us-ascii?Q?i2H5Rs+FAqpVonj4Ykao3VpeJPioNsz5GTl/zmlssGTt7mQewWcdeAecB02w?=
 =?us-ascii?Q?EOqa2zR2eTykKvc+OIbm/1lUGpuGJ1ADVDOnkW4/SZAEYi8uJI9wckJkND92?=
 =?us-ascii?Q?eAy9fSnHlMVp/WcgKkMARF9iIwX7hc94YAhqRn5dhgJjPlfmsVeSxCfGtjCj?=
 =?us-ascii?Q?VbXPu0mlg1YcGRgQZsVK4fnrttrOL8sTuMedAt4L8VYh0IMwAVRTFy3qO3Ms?=
 =?us-ascii?Q?30ADOJh7fSfRu22/bxLKFI/mNsYXlNUJutawbc2dXCvj4SSB6InMKJ3oOxVO?=
 =?us-ascii?Q?DxXmFFzuAVI3c54oiTz8wqA+0ZXsNC/mFaX4EYPISscbeW54Ct9WBQAc5JLh?=
 =?us-ascii?Q?C7dSOqKWrJpmg1NcusrjJ/S4OGES4/CZsichFOhv62yFMtntv+hNWKNQCnI5?=
 =?us-ascii?Q?HDQKTNAKakJQffR4ebssgLPsHjkhDyiSbi5MiKdIAgZxdAVlKn3KgHgZ/6kl?=
 =?us-ascii?Q?wct0cpZc/82qfs/QzVmGjAAPk+nwZn+tpclIKOyiewcgCLd32a895AnTXR5E?=
 =?us-ascii?Q?R9O2rPD9GhfgWUkQFpy1/c3y2Zy99eizFBblNdtqTmHj+ed7UW/2hvZM9XhX?=
 =?us-ascii?Q?ZsB4rshHMaT1Yf0PqAtghH9JXOgSuaPh0FODdKc+psge3yb2RSWayxFwLZ6g?=
 =?us-ascii?Q?/usA8qg5NTCqQr5ENn1sGdw8Rap1EfEiYB9X7qKCx6lc9tovRhsDc4Q7oiPG?=
 =?us-ascii?Q?AyywPReoGx0nyOcyebIkXbiYLMaOeBKoELtKZN/Y5dTXzZiUc1FWYHFXK/Sh?=
 =?us-ascii?Q?2iPTUxF2RKiGJKzmonnPFcFV6I4ulWRiQALHz+EcOZVJF/WondfirvKg1CVa?=
 =?us-ascii?Q?/UrBpJENaAJVAHvudYQE6iYrp6qvK1W4QAA/bpks5NqHQlLoFB28wLu7qUW1?=
 =?us-ascii?Q?OOfGid8479q8gaqBAdlTcnFvvl5HOzDXsglown7Gn3JHCaBffMgkZqq6/J1P?=
 =?us-ascii?Q?/G/v5VuC0IVC/23ncwAAPYdSwKt4K1d06DDD1G1uNHWshYvcJCb4hj/J1SGr?=
 =?us-ascii?Q?w96OrjaRZJXahn42p30vngg1VMO1t+fqVqX26BIXEJE9sazIS75nFhE56vcV?=
 =?us-ascii?Q?DF3QYyevP2UeOTimwWhBzDuNyKPsTCJzfulE3gO/Am0s3euhJdUd92spIam2?=
 =?us-ascii?Q?cZk/6503ZfhMhw4uxos/8MCG3gU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8a2a1e-5d63-4956-ae92-08d9af5a0c33
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 14:52:33.9255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BbgH0C5X+CBYg26AGWPfFp7dZzASmTaLQagVTp2QfMCenpDHH+0nGD71rYuGO+GmLDK2Uau3wOrsnFhuq2woY1sm5w9Nc/df5aFvuG4t7y8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4707
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10178
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111240083
X-Proofpoint-ORIG-GUID: K7MOY5Kdtqp8iSUwvcsq0nRx-VcKs_Qj
X-Proofpoint-GUID: K7MOY5Kdtqp8iSUwvcsq0nRx-VcKs_Qj
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
Cc: Pi-Hsun Shih <pihsun@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 kernel-janitors@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Xin Ji <xji@analogixsemi.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This code accidentally returns IS_ERR(), which is 1, instead of
propagating the negative error code.  The caller doesn't check for
errors so it doesn't affect run time at all.

Fixes: 566fef1226c1 ("drm/bridge: anx7625: add HDMI audio function")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 001fb39d9919..f56e106b445d 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1636,7 +1636,7 @@ static int anx7625_register_audio(struct device *dev, struct anx7625_data *ctx)
 							sizeof(codec_data));
 
 	if (IS_ERR(ctx->audio_pdev))
-		return IS_ERR(ctx->audio_pdev);
+		return PTR_ERR(ctx->audio_pdev);
 
 	DRM_DEV_DEBUG_DRIVER(dev, "bound to %s", HDMI_CODEC_DRV_NAME);
 
-- 
2.20.1

