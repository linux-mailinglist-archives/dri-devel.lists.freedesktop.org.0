Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7FE41ED97
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 14:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06156ECA1;
	Fri,  1 Oct 2021 12:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4416E52F;
 Fri,  1 Oct 2021 12:34:42 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 191BRtrN004209; 
 Fri, 1 Oct 2021 12:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=D4UnEYEAOvalaJjZbDQXHN1EA8IdvxV28mDIcY2JZ+k=;
 b=RlldPlK8Ek8TF1nXxd6ggtTU4SiUR7CGQopmD7LE4Nt4Z/XYwcUz7Yq2nEtiTTmQBitN
 G//uDHBN41KiQPlaikTugW2g75sbTS+Lm1uE8HzGKDv1+cUrYpsqL4VzwDeu3cuOXoBU
 KSd66vvspCHSTC1DyTHUnDgNJDMPtHf3jv86BneZR0dxGntHXt6CP/a9/i83iFzTaGfx
 8/csA19t07p3PQpfMW9MeKrNRh+pEMZIyb3trm49/MZ8DvVLOGhy1HJjHYZdLs8sMyb0
 6/YBTGJP2OTbYHXz+YHVp21JaNHRV6mt7LJkPV/c54l8H0lAN8icXjnbDIsCZHSDdRtc +w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bddu8ybyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Oct 2021 12:34:37 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 191CUMcG064625;
 Fri, 1 Oct 2021 12:34:36 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2044.outbound.protection.outlook.com [104.47.74.44])
 by userp3020.oracle.com with ESMTP id 3bc3cheg14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Oct 2021 12:34:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcEPyo3drmw6imYg3Lmxx4cbII0LMoreZet0EI8kCFwW2UWgropYDP/tcUGVT3XnrseHWeCJa1mINvgPFCjiR2qpA3sdYUD2OIceKjoECI7nUfLfEuvQKVla3Eq0vc7GoRCaV/0ZKvix9FaSKZClPhHFIbfNIfz5Mtasj59uzdmURFG3RS5gxvj0J6PUHiPz2QLu4nvWmGkDG7LLho9N/RgYgFEhKIdORw5ErbPhvqsxlUFgzXXdjGipc3J9GBQ1aNN8TKEAWfy+h5rxfNvz83nbNP4fTiyMQYjW4guNSu2SjmhjTjjyQQwFQ6pqRRi6vmV4Aq5vOm6cCex5VOBpYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4UnEYEAOvalaJjZbDQXHN1EA8IdvxV28mDIcY2JZ+k=;
 b=PTUhAIOXzYY/m6pivdeuJUc8nAumTTZm2Cwwg6rL2aF1RraDD5VzM4DCULNou9/2xeBtwB99JwjXmZh12/IQ2XVdf7qnD5fYP02nA4Ihk/gLGhVfWhiZmp6A+nF21pDtcnm9l10nByLdcIroGZKxje7qc2GBAZ/LdAYYorVidNu0QceQiPEHQ3y2KFAH5cit5d17SS1YFnAf4EWTiTqpziwHZn9ykVogOwZsE0Hk/Wb2CBd6moGTaL2C+J6DHOfe/ZK2fkJ2TfZULhvjqNbltxyJ+jDaK6fFeDiiPebCY2735EqTtmed1h9QvasDMsJ/OKXr8eadDF1aOB/mwS62wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4UnEYEAOvalaJjZbDQXHN1EA8IdvxV28mDIcY2JZ+k=;
 b=LveKp8w29O3wKEWAeuRBlfpTITti+Sfo4R9jumGb4iO0tF1cOfCC5ZVTBVa+NhLRPjpZujPWyKaZIStOJQ4DLKDOq0pa4H5DEAwxbiMQ0ud/i1yw3doShJZK52Lz/En39yCka0OhVPEmufFoW1E0zB9bJ6LU3DfG86+OY9aMhL8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1567.namprd10.prod.outlook.com
 (2603:10b6:300:25::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Fri, 1 Oct
 2021 12:34:34 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4544.025; Fri, 1 Oct 2021
 12:34:34 +0000
Date: Fri, 1 Oct 2021 15:34:09 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Rob Clark <robdclark@gmail.com>, Archit Taneja <architt@codeaurora.org>
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, Yangtao Li <tiny.windzz@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH 2/3] drm/msm/dsi: fix off by one in dsi_bus_clk_enable error
 handling
Message-ID: <20211001123409.GG2283@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001123308.GF2283@kili>
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0028.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::15) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0028.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend
 Transport; Fri, 1 Oct 2021 12:34:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4368600c-1abb-45b8-7a38-08d984d7d2ec
X-MS-TrafficTypeDiagnostic: MWHPR10MB1567:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB15677BB73B7203C049F429258EAB9@MWHPR10MB1567.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Xpw0M31Cxtep1WAGPWW3nhmHwP0UmEiwSTY5adbEg/T/OHHvdpNNo1JX0huqxmQiQc2LwkCpq4ZdSxpq+DVTr4bE19A+NRnh0MfyOvyLQBRe1HU4vcHqIuQ+vVrCDemSws24cqP3UJ/pahoVntw3T3EEZaMbiUn7WgMeybZk5yZjd/w2Ow2+RS+r8oYonklWkyMvBYvGBjwSH58vEfbzyH1zKhh8krGfGkPFp6/qBO6IwamC9B9S2tBNilMLI27ndevLRxWqL+x1L/wW250FDXBe7pTJ3/jFSuR3B9pDDat3DGAm/vtTAKrV2ye3WtmS7SWUU2fsPe8dVPndxkviqZ45geF/suiSl6hzs8CGu5AJmz4nxLmCRY2bxnkEGYWHMqdgeMCJxkEEgwZ4j2yAO3a0o2fKh0g25ft2nFi0LZpfXCZB43SoAROH6kG15hYhhuN74PEB71ZfqxmRbQuWPWZWiCaLBd1jcivIQQQ5jSg4RdKtsmp8XbuC/Fd1qSo8erPkI1rgXmlFKLRx1UhZ3uh8XaodZ3pmA6jRMZdTL4h1x/eRHWP4fP1NBDRVkIO5dauHAJ9xzkwYQjvM5Zb2QAKG36XbQfANo0CHqqrSpK9MqjMDVabfNfOZmKL0+Nck5tQFljgNgO30w9pLVS9SWXau0yCtrOe7R11lO77dsN2kOWTTg8PqbpzSCgplwLWSyxlavMXGXitln6Ue7WHVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(54906003)(6496006)(52116002)(66476007)(5660300002)(2906002)(55016002)(6666004)(33716001)(316002)(4326008)(7416002)(8676002)(9576002)(9686003)(44832011)(66946007)(8936002)(508600001)(4744005)(110136005)(66556008)(1076003)(956004)(33656002)(38100700002)(26005)(86362001)(38350700002)(186003)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e7ScwplS879u/S4NOS0ltIbXybkpqgZyJH5/+ncSiW8/ke8PbRumDXYu4oyF?=
 =?us-ascii?Q?nrhssiH3CQ6aMKCWho8+DheTZCAmuYUgPHR8kISDAmOT69y9d/6sgPiNjLsF?=
 =?us-ascii?Q?TuaG/co7dLAJ/LVtIiaCngEbv5olaRYtKmw6g0+Qf17swcDD8MTQBBKsB6MX?=
 =?us-ascii?Q?iXUrNvykeoB95ShhQUl2Fj+kDwAGd8vMs2Ro8ZV7TUtBKZ/4gNlpYHZJB/JT?=
 =?us-ascii?Q?Cr2rFspysP21e+qIUAAV7u8i81nqIT0F/lg0uuistpVHAn/MoIMHrYkq17b2?=
 =?us-ascii?Q?cxbJrSIk4ulDq6PdP4nZPQ4SUutcql3wM5VSKr1o1viS/0Ifnxmf67B3jeoH?=
 =?us-ascii?Q?WvYjsHkGLXd/n0Foy9P+weMSYPe+MaNjGy0E1XQqUlT3FesmbA0tVwGcZlqc?=
 =?us-ascii?Q?1iMW2ELRpT3KgA1HyLj/uTg/N7OsuZRJgfDEuq/UjKvLg9lYTfq4WSUyVnbS?=
 =?us-ascii?Q?Obt0I8soLuOMdQc1MpDEyT8XJzk1h9M+4n5wblA8ZMU7ZBqluZCVRsDK00bG?=
 =?us-ascii?Q?7h5sAQ+vLahbAoIVnSyFOhgqxkReBVPowMZl3vamSQZir7fc8mB/No5amiAp?=
 =?us-ascii?Q?WG8cXJm3WRVILbzXYWjtLk7p7jHZqIcAhd3AY1B9IQx22xWJTiqAbwICNz9L?=
 =?us-ascii?Q?E8jgSwDsv7BDXK8oJgI3u3U8E7rWmFV7jbB6YqBUnPACXAK5CwHXHPOXqRyD?=
 =?us-ascii?Q?i4olr6Jt66Y0WahzSgMQJ6VPnx1uSqDjZByL/dV/6P4DbnGbNWn5Xbd9Rk2J?=
 =?us-ascii?Q?cXHdSYsGzV+tBs4/f20PFKO0ohzEqp/tYgmsOzRGr6EoBqheZz3RFi0QNaaY?=
 =?us-ascii?Q?EjXwNf83DREJlay8PgzPeePBmoa26UkGOSxOX0dwVkN8uY1ABDb8tpYFIe6H?=
 =?us-ascii?Q?T1a7DZeNIAFo1QoZYq83R7SIoaG96ZLLHSlbnI3sZiIXw4q5LN0cujLiaxFq?=
 =?us-ascii?Q?FpFF84l9c4gEDFdRIySwKCIZT3jXHrs2bpasSToOJISrml7X6eq6K2kYqYJx?=
 =?us-ascii?Q?aF+EoHRjKXveqgh3No8VJMEuFqXdCbak1U/9dJHSwQNLnd7jVDu263t7sX3b?=
 =?us-ascii?Q?pXm/4SwtKpQ7sCQQFdAzYIRGCD0GmMV1IwfpAjTtibxyLZ85c0bbrgH7xqXX?=
 =?us-ascii?Q?tE4PZ3ox/gLXTfceht6VDz7rG/dwb/fwHF3gEQdxsQzpgnExLIQbSExpj8ek?=
 =?us-ascii?Q?MlXEQBgQKIoLJr0vC7eZwBxVLBkCMfh3Qt/3bXktC5LyyxUkk8hppmb/ouxO?=
 =?us-ascii?Q?oZgQHmT/vQ5iK/g8BWMQ9wGm9dnMVmzks506XrcGC2OArwTzn9CYGVeFWUrs?=
 =?us-ascii?Q?1+/91xXDYG3WDiC7f55fSon6?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4368600c-1abb-45b8-7a38-08d984d7d2ec
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 12:34:34.2613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SrRfb9pLoD6gK9D5QIxmL/WYIK7E6bIFmfy2bAfvzPR16jA4q2Wg37kXVFP7tdtoHcqusPc07mtkIr3r4YMy5e3aa/ZIbwwr52Y6o6Dj7+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1567
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10123
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110010082
X-Proofpoint-GUID: 3MqIHj-Lsri6luIaBPIHwrrTAVXGHypj
X-Proofpoint-ORIG-GUID: 3MqIHj-Lsri6luIaBPIHwrrTAVXGHypj
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

This disables a lock which wasn't enabled and it does not disable
the first lock in the array.

Fixes: 6e0eb52eba9e ("drm/msm/dsi: Parse bus clocks from a list")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e269df285136..c86b5090fae6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -451,7 +451,7 @@ static int dsi_bus_clk_enable(struct msm_dsi_host *msm_host)
 
 	return 0;
 err:
-	for (; i > 0; i--)
+	while (--i >= 0)
 		clk_disable_unprepare(msm_host->bus_clks[i]);
 
 	return ret;
-- 
2.20.1

