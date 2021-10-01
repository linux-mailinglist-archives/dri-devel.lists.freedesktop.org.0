Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C002E41EDA2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 14:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265BD6E52F;
	Fri,  1 Oct 2021 12:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2856E52F;
 Fri,  1 Oct 2021 12:36:45 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 191BKXBX004210; 
 Fri, 1 Oct 2021 12:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=Ijb0vKGJG7Imn7Who5sxo8V7fj1tlCxR1FcCk9ADDcg=;
 b=Cs3kRwJ+IH6+tzpQxG3hnq/oTSIYkhU1HVMu+INMxiGd1k7uxTVW90AL8vrl7NwQftQ8
 Cb+H0b0sjQmo9WAeAzyZtlcpzT6HQk01eSXfsmOa1WjIttXfeg/aPZt/jyy0BF+EN8Fm
 38v0K0AoKxvmieZ+kgJ9cflUuMS5XSLYu5iNgqLzhzyDWzBfTwb+4B4FGRuyWjRowP/F
 Hwi/u5iGs7hi7Wzcw8jmizcNe1zO2dhmJ4BATlgRVycpVMKjMROXXzHvF6RcpDkZllXA
 NG2Za3lCKTKFgpH3clr43obyM3DUDw4vhiiOBoK9o5PWItcbR4q67OSeBqDXOjXxu+U9 JQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bddu8yc64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Oct 2021 12:36:40 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 191CaPAu086172;
 Fri, 1 Oct 2021 12:36:34 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by userp3020.oracle.com with ESMTP id 3bc3chej0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Oct 2021 12:36:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eyzzaHviw7G2ovFCK1wUvNVcZlKvtN+CLCiPyCLKhNVYZL3kQ+Ie7PTrB85YxnlkUvQV3meaC22GZDIVWuusYD9Qzbi3Q72O6sRBicUX7m+u8hMISNavzAUUmywQkacl8QZz4euAvB8bN03nr2ojMv9KtqtDulgKlIm4M1eiao3mWoZIZg4EzifbAYDeb6zWn6+atK5J5qSbA1FKfArc2v78LijFef+w5BwgaTiN35EbUiJOIrUntxt0h+qpNKY5AIv1fOolXElRjfzCzujqDbYHSjFCKL6U+TUPE50HtVM0JIVHwWH57cMwM4Lt+DQW1Umwe9o1n5BVxp4UoJDazg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ijb0vKGJG7Imn7Who5sxo8V7fj1tlCxR1FcCk9ADDcg=;
 b=e1/eZeYfCCjrGwQz95wJ0ORukkH06IsTk2Dobm2vC+vNryrLX10Y76EOqR7L9YpS1ZddwEHgyFlfhAlz7OLY2FzEXZCOkNowweKQZs5SlTe5bwEBaNLb+fpkQ+3jHKpTGS+C3RdFmxLvB7EBFQ8ZTeRa3tV4uslX+dCX9UK2goFEHaBtJVDuMjKY8+1XX36YFrYBPBWfgMtRqIAoy4DkwXk9ZxPgYcaOYy+EOs81GHA86NtZXk7Xj1MAcqjuqQd7UL/4qQl6zjWEfSJDBIGXvOhrhML3jSE+B8ZacvjYYPimq8miexMEwkPhgOVuaeCOPsLgfUODjockQNCTBy14rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ijb0vKGJG7Imn7Who5sxo8V7fj1tlCxR1FcCk9ADDcg=;
 b=CLduq6xcu1pu/jc7zgnhI6kYUyVh3qiJkvNRkFAtmKLkX8+YO/Xw/BzuuXZsdjW3/AkKSs8DnUuUJh3wjDFznzwyAugpgAlRT6CEv+y4U1UqVgQmEpCsLkPVb6V20YO1SZGkTswd18xwIZ0mueD6KTzW+XPoXORJkMliQOGXb18=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5572.namprd10.prod.outlook.com
 (2603:10b6:303:147::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Fri, 1 Oct
 2021 12:36:30 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4544.025; Fri, 1 Oct 2021
 12:36:30 +0000
Date: Fri, 1 Oct 2021 15:36:17 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Rob Clark <robdclark@gmail.com>, Hai Li <hali@codeaurora.org>
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, Yangtao Li <tiny.windzz@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH 3/3] drm/msm/dsi: fix signedness bug in msm_dsi_host_cmd_rx()
Message-ID: <20211001123617.GH2283@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001123308.GF2283@kili>
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0036.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0036.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Fri, 1 Oct 2021 12:36:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2244647a-064a-4338-3d63-08d984d8181d
X-MS-TrafficTypeDiagnostic: CO6PR10MB5572:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB557236FA8C1FB13F98BE291C8EAB9@CO6PR10MB5572.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +68aov7LlBN1EDQ7YCbMjooYH2bweJatV9IR27+HIJ0FyebUHoSrrS/Y8NbfOhtsT5xLkUZwY88neUDCqyFvP+eHi6f4YBAzkoVnXXc6vNlo1du1S+8ODVLiQL50TvRKlZwTy1yIBMZWlBFZ9aAgivJO3J6w2Gry5TdUiHpZj1SKx9CJgNmDumprnsixnF5EyXHwcN2W/Z91IZUB80hF1O23aO/L9xb5gGDjgsgZMTOpNGfRi7JHsHrQk+K6d/0FakhimiLy6iUU9yfZ2ztiNfu/WNAh29yWik2vDLLcflcjKM2B9kLPoae56D21D14y/DThP6Lz0svQ9YqkiJSZyqH1s2cgKdbpr9Mj68LfkASe2YRfsWGWx3pWxjkL7WKcV3L4uzlbKSwmk+VjV6JH1/lUVTb4yf/CCFzDTBRj2PYEnHESrzzN5ILhbDoDtePH32xncWCB31qJMCGxu9DCACwjUOi1NpyxMmOKGlnPAVh/w/y4hMRT2L7JGF2SRyOfbxQVN2g43/uCtieyuwgFr1M6igWJVAkx2g5BO4Tl4UsqnbUnY3sX0AdSq0b8FV1gcRKDlPxIae+cQ+ZBsDc7YYGnjm2Gnu9YHhBMTkRR35XGlemlAUw74eAW0wO3OLfbW+ApcsavyB74x+inU1Iwu2/4x1Fj5TJ6egtoGMC9yI3T7JrP0+hEKU+pafFDXiQ/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(2906002)(1076003)(186003)(4744005)(86362001)(9576002)(4326008)(316002)(54906003)(8676002)(44832011)(8936002)(110136005)(7416002)(33656002)(6496006)(52116002)(6666004)(83380400001)(956004)(66946007)(66556008)(66476007)(9686003)(38350700002)(508600001)(55016002)(33716001)(26005)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eoaA4UZoEXzE3cQCQx7T4QjYt1OyPHCUjXMNSSxqOrL9r+p/uh2WtsCqy5VK?=
 =?us-ascii?Q?7NGrKSgTOqcanuWzKV+HhE4k0UcLtto+9SHh1gAhXWU4YWgpdaAgfJtSiILP?=
 =?us-ascii?Q?UBGHTvfjvRBIxxhuAMGRX5g0IqseIco7ODEWpB+/O7U+8+Sy+pLt//uyt+Rl?=
 =?us-ascii?Q?1FqDtCjlbOsQcBbD/nFwsB6rJ/Zy8UAJhowegVoQvoX6W6Tr2ESi3cpcIQJY?=
 =?us-ascii?Q?ZYBDVo3N0Yrqs+4zmOsgOwJsB/hKdWgSVW0z3S/6wpXcQxjtuNaQlm9TgZGQ?=
 =?us-ascii?Q?p01nHNGjh67gFcWAGBaxXHAKrSKW7OMbGevjH1g0Jwyt4UjsSQ6zWrtkK3Rv?=
 =?us-ascii?Q?dfxkmBJKJeei7UNbmu90+Kna+5cx/bG3kZoKk4IPdPJFDcwCniFsaOiuG6Sj?=
 =?us-ascii?Q?+6rWe/s/oowc7jkH+G7hhqcrSx4a1PWAnaj1W4BLiw3CM87XE6nPQRmrUMmx?=
 =?us-ascii?Q?BeddxfpjWhwj04JPQZ2axsfv0gHWEsDCbxeCdyVcxDwt7mCQcNiOhf5LJOW6?=
 =?us-ascii?Q?mtkw0pS+BLZ//RaPETZ6WpSOP3ol45Bc2JyqaEK9ZF+mProfaZPWe1OXAmlD?=
 =?us-ascii?Q?OgljXKVFdc7FZFUJYHiOKjQtdXl7BMXr1BZpChSf5hgJtWoGmuSpZWnU08Hd?=
 =?us-ascii?Q?AEJ/P6M/o0A5ayQSMmn76+kSsEbm7ME3hlqgBxKgLQBOD+OhAFysXn/21XDb?=
 =?us-ascii?Q?GRP2MejctrqG0wK8zR/rzSXlvc+wFnHd3W6GnPW49fqc5yfXn3k7djkeh8JJ?=
 =?us-ascii?Q?mrbdG2YBhwkxHkGwLKMjNOqeJ9vyAPEuVaP9+FmBx78Df86Zhp8x26dOHoTQ?=
 =?us-ascii?Q?tiv678MC8flvO08QoifcbyiKEAKAUOBURS0IMhpEIWc2xx/92eZ/pCn3gvMV?=
 =?us-ascii?Q?O2gbqiKBoOK/8N9YbuLJKXb3HZxUwwmYZ44zzalyITJV5AXGJ9Ng8dXe74QA?=
 =?us-ascii?Q?6euYbzXn+iWMyaL6w0jDkWOfPJ64J8re5OtSQWUzODS0QZIEDVyUr0u9PVV5?=
 =?us-ascii?Q?krX7NX87Om3ETyOO0KTIJT2OvF0hLGWJmkUy65l49YsGt3lfAf4BLtioSXzI?=
 =?us-ascii?Q?9EAYKscOgaHxzSCon23HJdipjn4aRcA0LcKlsG9H/ncIySxjSv34Id0Fd0/E?=
 =?us-ascii?Q?X3Ek63T1i/kD0qcUq9WnJimuj9UVGprnFf0FycAKipRXOgldRFa9hGuTv9/P?=
 =?us-ascii?Q?5ecOMHzbsBSnAwfDPzXyp17Y0j5e0uFzK7RuglUC5qZMtWRenb9buo83UElD?=
 =?us-ascii?Q?8uF7TCKft7H/O0tiQWiz4/cc514eoDxt2/Uy+/PXTLKreNUUqQgBk8DBToQq?=
 =?us-ascii?Q?szWMyjVe34dh2MIJljTPrCdn?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2244647a-064a-4338-3d63-08d984d8181d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 12:36:30.3057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ik/1/OtIasDVskYmgIoAM1GrcPqgArBpwkgZhXX7oDe/BbZCpGOpE2HpetqdZMEZ7W33yEVcQkp9LMExGkCdIAgSsKqwXdV8wdkFsPVK5A4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5572
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10123
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110010083
X-Proofpoint-GUID: -1wFYrS0z8yeX1zf23m_gvL3I_lt53I2
X-Proofpoint-ORIG-GUID: -1wFYrS0z8yeX1zf23m_gvL3I_lt53I2
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

The "msg->tx_len" variable is type size_t so if dsi_cmds2buf_tx()
returns a negative error code that it type promoted to a high positive
value and treat as a success.  The second problem with this code is
that it can return meaningless positive values on error.

Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index c86b5090fae6..42073a562072 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2133,8 +2133,10 @@ int msm_dsi_host_cmd_rx(struct mipi_dsi_host *host,
 		}
 
 		ret = dsi_cmds2buf_tx(msm_host, msg);
-		if (ret < msg->tx_len) {
+		if (ret < 0 || ret < msg->tx_len) {
 			pr_err("%s: Read cmd Tx failed, %d\n", __func__, ret);
+			if (ret >= 0)
+				ret = -EIO;
 			return ret;
 		}
 
-- 
2.20.1

