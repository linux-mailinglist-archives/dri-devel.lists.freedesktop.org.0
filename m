Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4530641ED93
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 14:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653A86E51D;
	Fri,  1 Oct 2021 12:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4E76E51D;
 Fri,  1 Oct 2021 12:33:30 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 191BRGGq023263; 
 Fri, 1 Oct 2021 12:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=1Lm7nz1NCnfPPk5jPlT5SmJqo08knjF4PCRtbN3wrv0=;
 b=Z7yoJkInKmB/2jOgEFfJVZMUu1TDEsg/BEThMpPwZzIbrX/sNyyRpdl7HlOD3CcLbQsI
 6tTdnKSv4MLfT789wsykQCxnF6BKZ9Zcjm5x2jUb8AdJ7QNmI3aeTdgeZ7udnusIGxM/
 /UphRS3adEf4vXllilyxN2QvrLju7L7Lqz37R8AXNatVgMFgcHgga2RdPybEv0/jbLIo
 oFTSrqMoqgWCIQqnbnZq/Grxhm6WhKm3ySB6G6FiAdpXIBfgl3PP5qE6dvNNICAxTZtP
 OqUAff6clh2ycHZckHnpt9GldKMJrW5Don6YgBuJI4epZklRNgV1Thn6zR1yfsDr2ma+ tw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bdcqufq36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Oct 2021 12:33:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 191CTsn2159278;
 Fri, 1 Oct 2021 12:33:25 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by aserp3020.oracle.com with ESMTP id 3bceu8jq2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Oct 2021 12:33:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+Vx5Mvgg8ncKDpXKdG0le2ldSye6+LdLxUBxiT2C+v7WC4kym/zYxl+5kTO5WcVarkBWykm2w36wsju7eLCnkciiRx3riAWYcW8s+4kw80cMtJOnTiuiylpsI5VdGWEnnXTCVEvKAowKlKB9w28QPZ91brKpUFK3eyyTowzgMjc2OTpi9sXsfhrJluga8Qsy1eBQkPZiAd1FspuCZ7pM3Lidx1p7tpeAUxZ0X8GTbd3M4JUKxG8CMjOFcFItAP13fKPaY3boIP+exZhGHcDtw4rfQXYe2b7wYwIcdwj8py17M8NCoJd3vCh9XOw1EKX52jf+Vvf1DkcWcAdJYK7nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Lm7nz1NCnfPPk5jPlT5SmJqo08knjF4PCRtbN3wrv0=;
 b=lzx+dKH8V2PrOcK/f9FEELB849vYJpbIfiSEbIGOy2FWQPBMLjqkGqf21b/eGXtAXyWFshrWUlVH0PVrEAB2ER+0Ld//RvgRqWt1t+eZhByoLN1Ov+STug8w/dFb1/L+N4diBEJhMFwm7HH9zm8WEII1B6n44SxQQ51KcM9Wj/sowapJxJEiKu4tvSO35RAUol0RpiJobKlwq3MjgRYRjUcZVDnEWT6Aef03PZDcDwQhQS5/k2VyPPlebHaz+0ZWGuuS+xwmuLseU0ZIVCNatPT3idS0gnjmA1B0bDDdKoxxCwdEIcBLfRTMDpBChUkiuccYs/iPXV4EKN02k7k8Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Lm7nz1NCnfPPk5jPlT5SmJqo08knjF4PCRtbN3wrv0=;
 b=TarZF3yFznLIdSxHc1jyvozuDhif59tfe61DKGbtFhjeXrwYT8naSoZp+3IFNtT3CimS8wUcqjnv0v0AFbT4kXyeKLJwskq4Hn/TMCd4YcW6OBxMsUh3ijpIT6R5w3DQ+AR7gcnUbKqUOEt7TohBHR6QQBAV/ObFv+csDKi5vHc=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2319.namprd10.prod.outlook.com
 (2603:10b6:301:34::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 1 Oct
 2021 12:33:22 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4544.025; Fri, 1 Oct 2021
 12:33:22 +0000
Date: Fri, 1 Oct 2021 15:33:08 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Rob Clark <robdclark@gmail.com>, Chandan Uddaraju <chandanu@codeaurora.org>
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Archit Taneja <architt@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH 1/3] drm/msm/dsi: Fix an error code in msm_dsi_modeset_init()
Message-ID: <20211001123308.GF2283@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0042.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0042.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Fri, 1 Oct 2021 12:33:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1ac8c0c-f045-4198-66cf-08d984d7a7f8
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2319:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB23192C0741CCA7D4E1F2431A8EAB9@MWHPR1001MB2319.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uDOxgasmQouaDxy48f7bgfoL3tySNs2DzkB5CpWVOS3iK0T1ISKaAYDgjgAIJbTgtoNIqQafRE1NWCj2VdRDBYwlILxkIHRJyCm2bcbhfFjE0Q+1/gWLpi7bnHAp47wPs5D9h5HdhLorwdBG7tXZCTM2IQVYgxlui1PLIPEhZ/8vf9/E/J0a8wwlPexc12gbHAWHH37WvcoYk4O7+sI4ebwHRe6OwcD/zxzaqV4qcN769LrJQqJOMSKCI6pgl4FZsoUIco39Bdb34HYuugTuak0kHpEM53JKobcFD9YuMoFbfYjfYrJ0rFVZF01hZ0C0unjPikH9kfgN3GnaqpWnbPo4hQkjN7Moy860V1lQV+BCmmW/csHODaAGSP5fryDgOeTs5AGF5bR2JKF85vdYitC6+b3KYWSJEKyNu+pUioE5hr1/PDlCA4wkutuiO/RLg9hMEhX5LzBJHjxoMax14odGOs6rHcwSv10vagm82Ut1EaTNwqt3YUAh2mTDxI+JEv2HH0bSt3Zt5uLhlMSebPNenisWQrLYphFkx10/9W3D+tTv6ln8qAr7le+WXD2BooLsyMi2DBty28UiFNHyDp9RNJs/o7GWKA71ejPPJarhicwATnI83wTOZcJpWtAPI+MsgXHQLTcAH4kGJDXslvAdrtDp5oqvYWderOKBxAgRww6BYgE4BveSeGjwDVyfyBF00W+2Uq0FENo6/9Hzbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(9686003)(5660300002)(316002)(6496006)(8936002)(52116002)(33716001)(33656002)(55016002)(66556008)(4326008)(66476007)(8676002)(38350700002)(38100700002)(66946007)(44832011)(7416002)(1076003)(508600001)(4744005)(6666004)(110136005)(9576002)(86362001)(26005)(2906002)(186003)(54906003)(956004)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pg2CfupDzV8ROMPiW9xweAKFn4aRst7/kf2YQePsrZFeGAq5Y95E6+tJbVCq?=
 =?us-ascii?Q?VYR/63aVPuLVY0eSNopEIuIKzojVkfJoGERVhwR2G9DbOhWxYC7tIVkcDQcX?=
 =?us-ascii?Q?zb2F700rvsEyw9vxtuHaj+9abml6u3GPGRMRiF96rpTdakaFhXNTWOT7PVz0?=
 =?us-ascii?Q?NAs7TQxvWykRgTgv3JU6WZYsaTQ6m67ycBoPfb0wjwjgao/vebwPYQEWnc/a?=
 =?us-ascii?Q?goFBaifOHbcgOUWy3GpJIs86qFct71ixN/xJuJDB6NqalPegqECii0cWV4Wr?=
 =?us-ascii?Q?e5sp4XPlFa63k2T+OR4XBWEAaKK3ZuNeB4DNUX3aaDZ66D9K4mHPpUr1+/Ak?=
 =?us-ascii?Q?DI2U0HHWrpdb6XugEl+z949a3QTK9x6dFBc/dJcd2QB5O/+VJFqh+EwGI/Ex?=
 =?us-ascii?Q?aFqSIJK1Hjp9pg037i9Uy2LN3LikSHb74/fwFp/u32Ai0JMTbVLdhzZR/qhQ?=
 =?us-ascii?Q?FXsabIdWDqNDDAgxj9+rIRcI0Rp99+9uV28UsFCgogYFcuvpgWwO59yHPemQ?=
 =?us-ascii?Q?vgSMhmeceBHnWaqE2KfkrmgAQae558aD87pk5/2h4tuk0beD3tldkDkhLf6X?=
 =?us-ascii?Q?jY5LIxb0YDiO9ZzAmuTX9nFoWKQxWvNRKWlODtrR9qUlO9MJoa4VB+n9Ncy+?=
 =?us-ascii?Q?21JrM8MpU8qN7t0U6l9bYk21LP4/G1zp3qQTr8DF31F/gtawfrgxyWh5/ZLy?=
 =?us-ascii?Q?4L+BJUOlocnIBhJbCA7TevwBlye/XHLpT9oTrQNTV9BIaC3ezKoANhYG4JNP?=
 =?us-ascii?Q?7H9iTS+q0mNleZfVp2fUJVK5IUzT/F8Yk3O+hbd5t9BmHMNhU377jwH3PSQx?=
 =?us-ascii?Q?k+wnqavEWHLtmP1GpNSXwo1U0YLRkmo2dECWASUyY4Euct1O3yC96eduupT2?=
 =?us-ascii?Q?ymWXAvRcT78SyD5Qa3dIrwOnqt5Is0ivhlozlWOKSQO1GciMZw+uU0Z5Dzy1?=
 =?us-ascii?Q?D3xQ3S+ERNwf8qpGDgP1Hj3FtsENkOsVwMrT4uRiCKWh/vIWy9i3DTid9yvO?=
 =?us-ascii?Q?zy4PhDSXa9YHOieOeLA1mGn6BlJb2FVjZhpae5uVTikDJh7A9C8FKnTXz6WO?=
 =?us-ascii?Q?lxp/LqBACCdF5tMb7IpWfRQQa0iLqxoUW3NNDyvEWfuulfOAG6o2gdoLiXnw?=
 =?us-ascii?Q?9BjIoSk8nNh1nHt/89TRJZPGjnlASZzTeCiqoLgFjMOZZhEqunTnm5h8dUlh?=
 =?us-ascii?Q?7qMwqF8QKvRRXesuR1k5Nt5tspDUGWeMcOEyrm+dQ7/U6DW0ZYccLiVjYPeh?=
 =?us-ascii?Q?HRrARWU4SsTtoLwveSTXM8ADlAgaaihejMomh72uWwr8rgEnATNGz7uyluu5?=
 =?us-ascii?Q?D4LA99BilAEACGbA4AbS9eRl?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ac8c0c-f045-4198-66cf-08d984d7a7f8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 12:33:22.1634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fyxwQoBX7tks26FXQqZLI9zzE7oitVvbYdwGPDi3YxorpaArrn87mC7PI3EgWOzMq9NmG4QG6aE/GR31fRxiI43a/Kh+Qsn6jFBYUU8IFLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2319
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10123
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110010082
X-Proofpoint-GUID: qH3HZ1SJw2J9WPHaGm2j6DfawEwmt_rO
X-Proofpoint-ORIG-GUID: qH3HZ1SJw2J9WPHaGm2j6DfawEwmt_rO
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

Return an error code if msm_dsi_manager_validate_current_config().
Don't return success.

Fixes: 8b03ad30e314 ("drm/msm/dsi: Use one connector for dual DSI mode")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/msm/dsi/dsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 614dc7f26f2c..75ae3008b68f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -215,8 +215,10 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 		goto fail;
 	}
 
-	if (!msm_dsi_manager_validate_current_config(msm_dsi->id))
+	if (!msm_dsi_manager_validate_current_config(msm_dsi->id)) {
+		ret = -EINVAL;
 		goto fail;
+	}
 
 	msm_dsi->encoder = encoder;
 
-- 
2.20.1

