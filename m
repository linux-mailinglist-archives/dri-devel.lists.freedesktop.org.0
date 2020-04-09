Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE4F1A2D5A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 03:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064C36EB2E;
	Thu,  9 Apr 2020 01:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE17989D64;
 Thu,  9 Apr 2020 01:32:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMnKRzDbmJr6tqFdFQKKA3Yr+hd5okqIrj/IHKaaA/cj8BLlT9lY0qvRdSlQvsQS5gWbGiogYLji2lafL4l1BY1oTPcTkZyQyi7hCLnxIEvJZcJJ1LHXB1CK0WEAAQ7owpcAovEaT3/GxkCqrjW5PdsfV+8wsR5M+cM6Ue2Q1+YHj1GTea+t+VCabry7snwGS0MiTDEd+pXM1atdTVgTbp89P/VCo0K5XbscQJGe+Zd/kd3kf7asL32cQyhKD+fj02md/+aIOIUOpl66YH7cXhvrklj9whGbBx3DAGRWfE+FUrYre7GNbKLrT3LahQ3vETMgjce6BHxZfCD07bNujA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQ1bbuLvKGjyJxOw4LZTxXXk3b0NfnxSqOUpzZWImHI=;
 b=PatWNMkLkBNy5Y4pWuWCutZ331+IZsR8VsdEhShWElQltqBXjFyiMuuebRREmuBMRef1Jf7Z+keWFutjPOPAklFj+vblbcE1op/1Gwy1loby9OT5m32Hm52RMycLNCccNjehuBEFQB9+Nh27wpTAqQ3Goxes/soowOVBwNE73vbnl6FAFHbiLM72sX75OPURtraLefY+X2UNGr2R+RU1WJDL3EvxYLyvJcQZ5IbDWJXUUiyabEPQYfulmm1er27zO9uN/vXFwqs3T7iBpGLFrEYmAi+l8v0VaNK521wWmZiCXaxZ2RImgPw8rezq6MJEuAzNeClvF9juFQtI3CuaYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQ1bbuLvKGjyJxOw4LZTxXXk3b0NfnxSqOUpzZWImHI=;
 b=IKGsER7m3AwGqR0G/2KBD+xBvE0QSxYrqcFUAYyhiDtjrfBecYsaGi8GNpMwgwwAMFOivYqdtfHbb8iBMnoaTXIWKplaMAxO+5eEf1d0ZrVzzMK83jD2IumMn502cU8XHjIpQzpvH1q2yXNe2kSGwUZqmgxAo2aYr405xm1S15w=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xinhui.Pan@amd.com; 
Received: from SN1PR12MB2558.namprd12.prod.outlook.com (2603:10b6:802:2b::18)
 by SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Thu, 9 Apr
 2020 01:32:45 +0000
Received: from SN1PR12MB2558.namprd12.prod.outlook.com
 ([fe80::8815:8e06:d0f2:c41e]) by SN1PR12MB2558.namprd12.prod.outlook.com
 ([fe80::8815:8e06:d0f2:c41e%3]) with mapi id 15.20.2878.022; Thu, 9 Apr 2020
 01:32:45 +0000
From: xinhui pan <xinhui.pan@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/ttm: Schedule out if possibe in bo delayed delete worker
Date: Thu,  9 Apr 2020 09:31:48 +0800
Message-Id: <20200409013148.4219-1-xinhui.pan@amd.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: HK0PR03CA0102.apcprd03.prod.outlook.com
 (2603:1096:203:b0::18) To SN1PR12MB2558.namprd12.prod.outlook.com
 (2603:10b6:802:2b::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pp-server-two.amd.com (180.167.199.189) by
 HK0PR03CA0102.apcprd03.prod.outlook.com (2603:1096:203:b0::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.15 via Frontend Transport; Thu, 9 Apr 2020 01:32:43 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [180.167.199.189]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0937499e-2888-459a-cd6c-08d7dc25e747
X-MS-TrafficTypeDiagnostic: SN1PR12MB2414:|SN1PR12MB2414:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2414B681AEBBA6EDA0FB0C5C87C10@SN1PR12MB2414.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0368E78B5B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2558.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(396003)(346002)(136003)(16526019)(81156014)(66946007)(66556008)(8936002)(4326008)(6916009)(8676002)(478600001)(86362001)(316002)(52116002)(450100002)(7696005)(36756003)(4744005)(66476007)(81166007)(2906002)(186003)(26005)(5660300002)(2616005)(956004)(1076003)(6486002);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yt2kpOfFDWO+hRPZSmI+vtnUBlkd0l+R70MAQ4oeb5YFfQTW4B++7TuPIo9ypsDRk1pp1liKMNA80xDROKCwax2wk7qQc+fc9BSPcVri5RFm7oVsBnpHSYP/iqQKThSwT937nADQEV0dmQLaxjuyPHzoA5G48uWy/2FqtXUvXSbNpBqA1ZjoaQxGZv06UUpHyAoxLp6HaTE/8UWUqGzHEyZ57O/3RtOmCtu1xCE7uHr9YqyJtq3fR2VX0zhHXVwNpHA2k2UVDTW77odyz9BJL8ygbBU5RGz/S/+bop2kZbSF8SXMSpd9vf9G63gOG36j+2+p/yw0dv9LfjLtzP0TFslZ3TVZkJUfd81PNbggwhQ+UsNzGep4UWPaLvf3lJADQRgOtX0oYeq3QXRq+Fic6uVxcAHamgzwBF6YKl1I4KAdL4+puAcHNXs0MS7VwMwF
X-MS-Exchange-AntiSpam-MessageData: WXEEQsf3j3hlhCZ2Qh55e8/pcQLB1/uuQZ0zbnUZ3nVlt7aopPR8AgqZ8DOzlNk6LJkBbBXX+ZVeZb3WNQSpwdBFvKU06KTybwlCbTKdBWc1ZBrV2tnPEHRjVM5X8EAffDN0/dWRNovX0r/xeyyAxA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0937499e-2888-459a-cd6c-08d7dc25e747
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2020 01:32:45.2275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: naBczMxh2EpFcNQgOXvpNC0zTF/tM2QdGrRI01GqMHhM6AUinHtJubwtH+PyIdVi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2414
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
Cc: xinhui pan <xinhui.pan@amd.com>, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The delayed delete list is per device which might be very huge. And in
a heavy workload test, the list might always not be empty. That will
trigger any RCU stall warnings or softlockups in non-preemptible kernels
Lets do schedule out if possible in that case.

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 9e07c3f75156..b8d853cab33b 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -541,6 +541,7 @@ static bool ttm_bo_delayed_delete(struct ttm_bo_device *bdev, bool remove_all)
 		}
 
 		ttm_bo_put(bo);
+		cond_resched();
 		spin_lock(&glob->lru_lock);
 	}
 	list_splice_tail(&removed, &bdev->ddestroy);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
