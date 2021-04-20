Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA330365C7A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 17:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3D76E843;
	Tue, 20 Apr 2021 15:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750099.outbound.protection.outlook.com [40.107.75.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C396E843
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 15:44:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUuIBtNxM04XMqDKOd9t26mQjj5qPiTcSOTsO6FMiOvXfaYNoakafzAuj1ln5rQcJQJPEbBo+WUcuN5Lzb3ZfE+64IYT32YAUJx+FPsOJaXnkPYAbAzgERE8bvklEymrIOxaFalu01+/oPXRqs6n7+As8PwzwKswkv/ZM4hSZ8peQoYpbvpDxSMaajqgNEbiwVoL3348GQpjE+M9E95o+s+T5CZXEd1sHjLL0k4Igca3rcot8+6H22lT1hVauIkx/s2FLlkjYSEssnxWlbZS9MIXamimg3A+vfkdpLDVM74z5qDGDo7Kp6XQvwGBDPEIdpGXeWoty0gan5j5W8mfcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5+edhKgshdWyjXx4xTZ/G6ZEEtMlZx9+PxCso7lOUo=;
 b=AysIUqrIPVDMWwm/EJkcJEQW3sVjEjFAZ1oHPcWCfoo6XFN9Rp4QbRtC8bVNpQOREby/xyIyaGYpt+/3IohQwLQJw9F0Vbgjj9QJbH2jjAZA9D9injGdil87O1OvkMZ5873F1f2jmjuRjd0aQzT8OYUTpWT6h4qUmdLfMNwHtKDWATCp52Kr0Bg0+6IAPzZlIOKVs09EZe2B4O8o/+WGUVm5mQGb3rlVRbvP/erdkrgDD6FTSXgwn7REXSUjc/SWdFlVOxBDO+Dq627uPSaTXH/5vHdQyoVNhIxWWvLFaQI9zkapCVbLeH6KcdEpmAneDqifitwGKJOIVfyMhVt2Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5+edhKgshdWyjXx4xTZ/G6ZEEtMlZx9+PxCso7lOUo=;
 b=HGdZYednUX6e8JfAteE1W7Vhk9Yi7NhXll8N2umIGHRoynJiC3S0x2YjdpJe3a4Mp/R+lKgrqknTToQRVO8fP6OpQ2rpSoLdcTmA4JSWunWoU/KodrQF0xqRhLqOXdWkr7w5frC1KUH5fpPqxhQG02hD/dIFr9BqAfxh1ChtIfA=
Authentication-Results: microsoft.com; dkim=none (message not signed)
 header.d=none;microsoft.com; dmarc=none action=none
 header.from=microsoft.com;
Received: from DM6PR21MB1514.namprd21.prod.outlook.com (2603:10b6:5:22d::11)
 by DM5PR2101MB1062.namprd21.prod.outlook.com (2603:10b6:4:9e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.11; Tue, 20 Apr
 2021 15:44:53 +0000
Received: from DM6PR21MB1514.namprd21.prod.outlook.com
 ([fe80::7903:384:ac51:1769]) by DM6PR21MB1514.namprd21.prod.outlook.com
 ([fe80::7903:384:ac51:1769%7]) with mapi id 15.20.4087.015; Tue, 20 Apr 2021
 15:44:53 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] video: hyperv_fb: Add ratelimit on error message
Date: Tue, 20 Apr 2021 08:44:19 -0700
Message-Id: <1618933459-10585-1-git-send-email-mikelley@microsoft.com>
X-Mailer: git-send-email 1.8.3.1
X-Originating-IP: [131.107.160.144]
X-ClientProxiedBy: MWHPR04CA0069.namprd04.prod.outlook.com
 (2603:10b6:300:6c::31) To DM6PR21MB1514.namprd21.prod.outlook.com
 (2603:10b6:5:22d::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mhkdev.corp.microsoft.com (131.107.160.144) by
 MWHPR04CA0069.namprd04.prod.outlook.com (2603:10b6:300:6c::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 15:44:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19d6a8cf-18aa-4ca6-a337-08d904133d77
X-MS-TrafficTypeDiagnostic: DM5PR2101MB1062:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR2101MB106207FEDB6E85D1CCDF2FCED7489@DM5PR2101MB1062.namprd21.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wDdQKPqaLykqKsm0owXG9jGTjCcLJitPrbZ0L7RohxueBuoY4GXSm1uHG/+csYMjiGJVC3w/67E8qg3O1c+XCs3jQ7uv9N86RmHZhoh0aNWcnSFRZzHl55noNklXsXwUT+Qe970bhb6IvN6ZFaUht3d0fwMCs03IOFELDFHJM8Ptzbf1UZUDuvAqwqYWXHbK09wYHHKqy2Z1qxbvqP//887KkPwJspTuIVskQe5RrTflyZpIo3Tc0pZsGhI1F94TE+JMybhSKGXzSB0LVILUfZVh9w1kvpwkyxFEoBeKRrAPvZDAYz20WZmCtUZVI3mp7qZgpi2lqLbbJ3IGG614dlfLPa+6Jvz45DRQCxTmv13N8GUEBxr8HJEyj1pkIyW41n1gMlrFkMooWEzM7J04frXnglTiA6EbP3n+d61XXeRk1lRMNiWzttkviCFn/009CWUSBX8u88AvzyDkIspNpcLhnqqjv3ajQ+Ka7Ymeq8XTiiV+8uzar/hfLHN8tD4wfh9BBCR/Ca8+7iULdzPYiMr2kbumwvRikm+B63fMhH8RV6ikCo3HldXUCwWkKzlB7l32Zvzuch3mopd8LuiAoqJ3k2F6f0Uop0YjzMy7+sc1n6cmDuwhTwyJFvEttm4KyxHysPQrw6uvRDkgQLZrJwaSH74I9Q2/4ogLeFzOXKI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR21MB1514.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(4326008)(2616005)(83380400001)(5660300002)(498600001)(6486002)(8676002)(36756003)(26005)(7696005)(15650500001)(107886003)(6666004)(10290500003)(186003)(16526019)(86362001)(38100700002)(82960400001)(8936002)(38350700002)(956004)(66556008)(82950400001)(4744005)(66476007)(2906002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WCe5JKyv3gG/NI1ZN0aIU2QPLE4jdtr3JIua0NjUTzlipeR+8NuvK5SVKZ8c?=
 =?us-ascii?Q?Sm9SLooTNiQdyNFA591C08vr8TSqx13hZnDMgEPoBWO8ikhUuR73KNFMhaFX?=
 =?us-ascii?Q?PrHg6avJRhai9XlZ0VQVYJY9I6+E/nx92y9CIslzScMhWLVXCkBrR69iY3ft?=
 =?us-ascii?Q?rvHXJjIwFqfZw3aYLDRKYdE5OaxKMoEX7EqGHx76Q8jW4YwkKIWYRrf2yf95?=
 =?us-ascii?Q?INlYqeQPYX+NxM8UWNMeAvFTkm09joh7SqvYBeKsOEq/4BY4JMKZ/+0O+5BF?=
 =?us-ascii?Q?iFqAvpCRjyQe5eC/AEVHhgx8cPfITq4JqF/NdK7sUxsqqbqpv1uJ9NJbLvHg?=
 =?us-ascii?Q?6rlIgVEar4GGUfF314Ta8WEWQ+tIivmwFJAofnlZIHHJJf+7cx//5sla0cyv?=
 =?us-ascii?Q?o8XSTKz8pbsFXcOA2pXw7wuUQqb7rof4OrvI2dipP7T+70/OwGdigDyUMzKZ?=
 =?us-ascii?Q?iPulrHNvF4yzcfDUSe7zrn0C5qgz6VE98GZ5Lt/rkzyfsN+plHTvC6MvwkAx?=
 =?us-ascii?Q?RKZm+2/652U3Jilf2awlzKshQpYu2+RI+dWmvVb52oXfYEBr3JylLwr/3k9t?=
 =?us-ascii?Q?sPBusEZjNCF0Run7l821Pavv8JSzaSKicgojAVryosIHIaPJei0utKSBTCau?=
 =?us-ascii?Q?SGbACPDf69Nagd7x2jnL3asplAyMndyKYtedpAjubFkt5hdjuSE8ZesBRTWP?=
 =?us-ascii?Q?voKV8pIO+1eWfLkDJS3AmZzHW2RP7ddNsZvnoXtkUo/OqSp8joOyVd5Zn4ur?=
 =?us-ascii?Q?oP/Qvgh+wKZ3tAPC9wTRD8e5/vKpX7cJFpAvQEc4Q9pFJAMKblxe5M94r+r2?=
 =?us-ascii?Q?ry3PLxUF9cy3ONTKyYLi+zgru39NtGcl3F/TwFm7VIEMLM+0xJ5Z82A5iTxx?=
 =?us-ascii?Q?QHrYjBm+OPq4oNpVaN4Os0WeD/ZyHuhlayHV6l66uhIO3tvFWYUCVB5MXYGx?=
 =?us-ascii?Q?WTF6Kh/4mIn72deR+SobWue/leZrNxmjZyd74fu6XMwTN+2loWuJTVyDqDdL?=
 =?us-ascii?Q?StD/90yDj1yvpGW3pcH70qOQwNhyRGBW+ByScI7rSHmwyf1qaQQ8zVQ0shZE?=
 =?us-ascii?Q?+CiAmmaKsK0tXy4GuJaoCCf94rZe18TZO5t26O0OIBwvNnW3YyRxLclylmXN?=
 =?us-ascii?Q?lKiKinM4CMJStmj6qUj+k1g4HAGeXWvfZcYno+rJanVB3nQXnqgvL6oRBZi/?=
 =?us-ascii?Q?niOPlbBuD8z9Dg8NLqkdFIeSmGFZvyMQJ/RWbdC+bLlgRzsR6DCmsDvNCcac?=
 =?us-ascii?Q?/KoEC0l8YnUznczG7RBtSlCXhEitSzH9Wye+ylKLjOWn4zmvnZJlTzY1e/jN?=
 =?us-ascii?Q?CZ54DOQfOI0KyYEh5BJv9biC?=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d6a8cf-18aa-4ca6-a337-08d904133d77
X-MS-Exchange-CrossTenant-AuthSource: DM6PR21MB1514.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 15:44:53.3210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4z7M/bYs+dQSWpkLxq4C6XMpt5Bpwy1Y+s8JCIqlEqQmXRYZ70T7CIC/6XeJii3WzHCfXsH2g0mkwTg+EorfSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR2101MB1062
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
Cc: mikelley@microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Due to a full ring buffer, the driver may be unable to send updates to
the Hyper-V host.  But outputing the error message can make the problem
worse because console output is also typically written to the frame
buffer.  As a result, in some circumstances the error message is output
continuously.

Break the cycle by rate limiting the error message.  Also output
the error code for additional diagnosability.

Signed-off-by: Michael Kelley <mikelley@microsoft.com>
---
 drivers/video/fbdev/hyperv_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 4dc9077..a7e6eea 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -308,7 +308,7 @@ static inline int synthvid_send(struct hv_device *hdev,
 			       VM_PKT_DATA_INBAND, 0);
 
 	if (ret)
-		pr_err("Unable to send packet via vmbus\n");
+		pr_err_ratelimited("Unable to send packet via vmbus; error %d\n", ret);
 
 	return ret;
 }
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
