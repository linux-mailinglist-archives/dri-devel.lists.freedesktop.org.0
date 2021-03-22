Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94988343F44
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:09:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F766E406;
	Mon, 22 Mar 2021 11:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288CC6E2F2;
 Mon, 22 Mar 2021 11:08:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5Zzk1tR7G+OAtAdw+amsqQvy8jxsoNT8mKtO+x7z+1mvZzx5k+5G2bQMHT4YdcPDBDlCQhW5ALNUNuUdjzGqVwzoFA7Zg+kgtZ5ZLLrCwAn/fOlUmNa8rKPMFsdpGtddaN9WXYq2iL24bKFmlqiRWPg9IxnSQZvbelizqtu0nmKjaOX92/X83BHLW80pICD4VeE/nwHfgK1YmX6pTtcSfbXSg0oVQ9DBef7fFPYWeoGsxm+lXrNSOB5mA51EeVf4eICnpiKCsklv7ZmjD8b47XDKvs3z4VpKJFKFUaNTwwhvr8+j8wpkdtWdcM4q3lF3sFuWUhikhv3L8SSL6xbww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezA62SBigG5ssBduvpwkfGnOrOzYvInAKXNP97VjJdQ=;
 b=DpWOMnYeVRJFceSCZq3ohuSxc3OpZILTn9RZ4TRguzwb159ry89NZRNO0zRuGNVQIJa5xkPju6icFQdlM1De7v6BLL+swZ13D6QGvLl8FsjiJNhEURXKXSqTDDWjj8JIsHrT9LOb7zzbk2A6CAD0RRkVKxPuKbWViHSYrJRMz+G4ApGENU7Uvusr0jWcgv+UET2Vswmgs/gQ13pVd5jZckHjRZ65QhADnyGq9o3uta9QhtLlpa/2zfZPz1FXaN/t+lrS//IvTkEutl25mW+kFMwwY+3i9m5w3uwWa+HzrSAR2w+Ef4KtpERpqhqBMPvE8VL5M4lhtvk6y2MwQ14TSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezA62SBigG5ssBduvpwkfGnOrOzYvInAKXNP97VjJdQ=;
 b=X69AdaKzpYfLNczMQrZn8Y2UJ6EedGVIq2UTGkbHtN+l6nCWNMV/36mXaSu+uRGqM/pFsffw2+/eSNEmA6uTYdD167w1ACvpYc/fUCxSq1AJaIMWwV64aSnRQ6pLKyG1KyOZNay/rE2/ILyA8uSo3DEsmLA1KiYApSELmV64wAg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Mon, 22 Mar
 2021 11:08:19 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:08:18 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 35/44] drm/amdkfd: Call mutex_destroy
Date: Mon, 22 Mar 2021 06:58:51 -0400
Message-Id: <20210322105900.14068-36-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210322105900.14068-1-Felix.Kuehling@amd.com>
References: <20210322105900.14068-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24 via Frontend
 Transport; Mon, 22 Mar 2021 11:07:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bf84f3f4-5bb5-4f23-2dd1-08d8ed22ba2e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4255:
X-Microsoft-Antispam-PRVS: <MN2PR12MB42553FC12D4D54433BDA33EF92659@MN2PR12MB4255.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:66;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0nIRQMEp0zxgdF9TnZ8Af/erlBCeDmaZf8CO62ChY9LZGl5opMJFAqHkTXkHP8kpI5urlB3TVD/wSt7jLBn+Yo3ziqPx6C5VGGiyR8K6IRcRGlwG5BR0ajm+yiBKXt+UP1I9Z+0V2yjegD1Yv6uOAvpfdRw5lswOtLcdhtIEqu8fDX72qGXAZCRBdLDTHOO2F/YII1uPkP1m7yYEy91J+pZ5S8xvX7JCX+HI17S6AeOR/xGMXmsXIvDqJspCoOsnhQzOFfTLsUq5L/dUve46xl/r5ZppC5UndLgZw6CchP36A8VsFpgB9ERi0bsbqEyVx4rG+JAZ0Anf2UIUxmJBN6h0OZONdSqsKo6GGIz4rhBJ+nkc5V8gkWx7fOUaXeZcKyo0afMcuekvpBzJzk1PS88HqqGRU/IYF9VTXFE8rqKdZSHlsBHQJ3tIwz5ZFZ13Ds5wUR1qkssci8V2BxmX6cNyRvUCbbF8+KJ+dr7sYcL7cvByn78b1wXeSbZIz7DZHmstLhUsJEwExI5TRKSYUxtsFeENovaugotBbb/XkQ6rjq9sfpUjycUEDETqIsqyg5V3RKWH3/aMVgD1b8YL1EwQgWr9DR14s1GVjR53aGWuH8eTFUkMl+q1vQgnMWZqoIu4lHs1tWODqYbP9WuVJiWBlV+P6blG3qylE4L6eJs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(450100002)(1076003)(36756003)(4744005)(38100700001)(6666004)(66946007)(83380400001)(66556008)(66476007)(5660300002)(16526019)(186003)(8676002)(26005)(7696005)(52116002)(86362001)(478600001)(8936002)(2616005)(956004)(6486002)(2906002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?CGuswZyE6deIsW3cOnWbkDA7QdvSfF0valyt/S1QJ4g2Xc5GPwPGsYdzSD8g?=
 =?us-ascii?Q?kWjqBRfqBJo111h8nNMQ8rDyq0ed6rtUiFf0V43kTUBmljBB6B1A1A0B0MFJ?=
 =?us-ascii?Q?NBa08HSDiAE+qT+beIcv5XC0NGSozailMC26UGJdxqaTVKRl2OM7oxF1AU78?=
 =?us-ascii?Q?Ds658OjIay6V2aF0xfSB1PnDT5RljW51G8iuLo68Eq58bCDwVjfgD1mdTLOA?=
 =?us-ascii?Q?lnDSRrDxYx29t39IaTTzi5FWBP0cd5MF7370S6IxBeJTXoqOtPzgH1IU0u03?=
 =?us-ascii?Q?fW5HrIv3l8AT4WvYKRVtx8xRioatSzxTMuaPzMIsGz44ipBCMFpemG+wOvKU?=
 =?us-ascii?Q?y4QC+cjAR1Xfqxbo16rqHDe/EyBkYLr+N+xz2zH8IaPhpD25RufztvgUFi1x?=
 =?us-ascii?Q?NjXZruB6PEWlDjT1UMh3Rmq/QW5IWlKjaOzLOOQR10TXalUdzYqJVxn+V6YG?=
 =?us-ascii?Q?Bx2eHkECQJ8VIU46d/X6Z0kEsCQXnL26AkcYXXwllQH+wptbpdhaT0ae1m57?=
 =?us-ascii?Q?xLtkMMWTLdcEZ3R7TIUdgNYh9d6JtUw+UWH178Z7/2ThyItUNGZFafSUWM+z?=
 =?us-ascii?Q?ZkebQ05yHMi36SWnIHgteTuvFrsSZVfUTh2nSRCUYp/JZLTxyRbzRVPLTGim?=
 =?us-ascii?Q?IZd150WgBcMQK8x6IYPk1DNFHABdD9+XKPnEMG7o7DOad3XJHD4w72POqbCK?=
 =?us-ascii?Q?z+CbxQn1ef165wV8v3nSBAPXpefOzlSVCFxoCi94hR3irKR+tssnBtt1uXtC?=
 =?us-ascii?Q?PFSfDvbN7RptkrDAEQcqNemUZEFj48/u8z/jHGyoATS5gJi/6qVDCeRO73ez?=
 =?us-ascii?Q?QzU0UvFNh5bb0nLg0Q6x5xdzBJCManIVmvUG2Uyd07ZBKvpNQoTAqmNX5P1O?=
 =?us-ascii?Q?b3nkF15qAhQtGti3hU3HtziMrovewFN8GGPYmpx85DoYH/eJiJxn2nv8YE7b?=
 =?us-ascii?Q?zKa8/3DFKHKiDvoyni+vUWODgGg7OKstGTfUEdRlNkfnKfGwsgafFPOlIJSV?=
 =?us-ascii?Q?atyePJ/kQnoRru+7QD5OvrJ8EWA1K9+WU8mRKSrzme9woi4S/V7fa7go8Q/H?=
 =?us-ascii?Q?j54Xumss2l8nX+wH1UzGjnWY9OTP+5olndRYb18P+SrZAIWIxBnP+xfv+0ZO?=
 =?us-ascii?Q?HRv9Jf+1WHQBZ9BF+lbff8N8FYsRDi8MHfhHVvlacwyy06OVpUhTczLzSFZk?=
 =?us-ascii?Q?KMPYM3NGFiDoCvew9LSgvJmGW+Ngj0X59ouZ9C6bHynGhf1aZ7wCiDYafcu7?=
 =?us-ascii?Q?B7/OhF9twyVpoclPIeLQpHJk7DWUT226UE7ISwyZ1uqyYKni6FGoWlWgd/K1?=
 =?us-ascii?Q?GQTm7gewohuNHVYn+U5gvo4E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf84f3f4-5bb5-4f23-2dd1-08d8ed22ba2e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:48.3066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hw6puH3du/iQ+S7YIhwPGnTpFv9E5/QMyAGgQeTI8EG83NjRg6quQqsJvUv9mxk9mAB20LgmiyMwpnNFMSwLPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Destroy SVM-related mutexes correctly.

Change-Id: I85da30b1b0dce72433e6d3b507cb0b55b83b433c
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 3eea8f87724d..0fbc037b06e3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -209,6 +209,8 @@ static void svm_range_free(struct svm_range *prange)
 	svm_range_vram_node_free(prange);
 	svm_range_free_dma_mappings(prange);
 	kvfree(prange->pages_addr);
+	mutex_destroy(&prange->lock);
+	mutex_destroy(&prange->migrate_mutex);
 	kfree(prange);
 }
 
@@ -2220,6 +2222,8 @@ void svm_range_list_fini(struct kfd_process *p)
 	list_for_each_entry_safe(prange, next, &p->svms.list, list)
 		svm_range_free(prange);
 
+	mutex_destroy(&p->svms.lock);
+
 	pr_debug("pasid 0x%x svms 0x%p done\n", p->pasid, &p->svms);
 }
 
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
