Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E8625A287
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 03:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D742C6E118;
	Wed,  2 Sep 2020 01:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100B56E2D8;
 Wed,  2 Sep 2020 01:07:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByNCSgxS8hLO+gccY/bOXwDIfNKfp+fN9Z9gA61dx7QpjnEQsgxEd6rNSg+kIpBrWi1XobK8MsXlglobb911XYTAK+bwiLsJbdAmLy9sJslwstcbTmfUIvHpXny1l3D0KVUgX2I7BzpcLhgFxZ3aXCOozdAvVJ1xGoIE8a+BCXPOskq8oN7inTnJS56kyfESmHyDmr15lGi5trGOzYazO4F9J4dnLYzzjYXtx9dFFhdxy31PtQTxwkSKhph5/6kBhljYS2vqy+gpQnkwH+iWsPSEq8MYAa9j+k2XcPNZjJRiQ17+E0HmK0kL5DOQePFY6KbFJ0mHrhGia6g1pc3wPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JURMxh1ahuHkje/vRCMIuaPcWHTra6unlzcyjchDyFI=;
 b=PuV+hTAGm7gx86L/8Ptw32l7gsu1AyEdTDmfsRNFF3iaap5VJNyCJE4GxLqXUDDDpVOM3U5Ms+dQeAFOmtauiVMgvST0LCVM89LfNx8I9JE9JQ8bM31Mf0g7yOcbV6tCQ0SgRAX9a+wySvxO2684DesMFnl8pRmv66Swm0CfqpzhoQJ+1tIpX7o/bsrsrvrI7XWyAdmZCnbF41G6uzJftJAu3S6vxNy5atmUdeSXPzR0j956klmsp98fN516dLj+TPuYgRxDTYvS7CpxnRQVQD9P6+rQZ/wmXHrXOdB4OXOmiA+1M/MOlo0FSwy4xH16bHzCwbh2GlQZdSPpsrZRoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JURMxh1ahuHkje/vRCMIuaPcWHTra6unlzcyjchDyFI=;
 b=PTFcMZeRwiIw6WWBiZ03+gPYk7eYNGjeqcfDrwUIkdjavDFbbj7RUy1C/ij7E22j0+oZXSEzXY7jpkjvECXnRalxbFxKNalK87mOWOo9tTGSjWWYlBVXwTguSmEvTWNrcPlVw05XTx1VoYh7EAxrG4SsS+aurpIJ/TMbUEbLc3w=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB4058.namprd12.prod.outlook.com (2603:10b6:5:21d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Wed, 2 Sep
 2020 01:07:16 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e%6]) with mapi id 15.20.3326.025; Wed, 2 Sep 2020
 01:07:16 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] Use implicit kref infra
Date: Tue,  1 Sep 2020 21:06:42 -0400
Message-Id: <20200902010645.26943-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.28.0.394.ge197136389
X-ClientProxiedBy: YTXPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::25) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 YTXPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 01:07:15 +0000
X-Mailer: git-send-email 2.28.0.394.ge197136389
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8210d461-cd75-4658-bd93-08d84edc8844
X-MS-TrafficTypeDiagnostic: DM6PR12MB4058:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB40584ECEE5E094B6105625BA992F0@DM6PR12MB4058.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OaZzzh/y53S4+61eTTkISz2oRWpI30nP4WRU2SvtwfycuKVANHmuuo6zfk9lnnTusYQfQQ/Kntwea0DO5mqlr5h4XAL9LPfAnXO9n9sHZYL8i44dEL1BJq1NKvSvmEkIKxoRjP15deLD0K/FeWWlN9dAgrvO234Sn3pa99x7Qm3Pts0Cw5SJC7hYr9IvU3Ay2WO5EPQvAYV7KXeuDiHfbVCwjBUwyhcwPhKHdFPCvEyVfzA0kk+YnmcCYjyEUl7z88OjWwlPlwE0InaG2PLYioI7tOLXzGPeND+mY7uC3wF3I0zvIr31roEfP4oJg4THuzvv9MIgYdYJPbNLPtE+gg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(2616005)(8936002)(52116002)(44832011)(316002)(83380400001)(956004)(66556008)(4326008)(66946007)(36756003)(66476007)(16576012)(8676002)(54906003)(478600001)(6666004)(6486002)(1076003)(86362001)(5660300002)(26005)(2906002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: FgPPHI/y7ETsDfR8DCtaT9gqIS2Z+GAhlANytT/KLeVBwhF+NEAbc12O1alQ/L7lp0b5XA4P3gixrHHWwEFGmsbK45BlGF7oy0URi3kuVlCpKjXSfaWH8IRLNHnok7HQCsY2GrodUEKtUrSBT4P2oYy+HwsZm6khf101HPS2NJYYyXhmt5Lja1cnWOmA6j3DjqfUZ/dEZMZWdE5gosJK7PBV4nlxPcXHblwua4IO3CBNLRZcFI42b3bN1iqzxETsrF38/wrewZeE/wnX0pfN0Uz54n93OLsPOAaYOthW3KjXQiXo7THUXLCefniN46iDAs3De/+2oVTMs9UyW44bWQPh33MN+FxwewZrBZSYuoH14MiTiUfluCxkqrEKEFE0M9BAucRwoFgrIJCoKhGIuPHAhgoMdFHv8F0CC1hYKSiSuGRzL1bNfpGxXLOjlPRvYR2RilhjNf2WpamUvEyUAh3n2Usfn2TgY1n+/GNOz48Amuo1FXLGX5IHHs1jBpcLQhB8AwBIV5+lJZKDkXjrPX3ClsUbdSTAqCjR19e9flRCTaphinGYkak7w7FyvTYJ3AU0L+xTSrkwD1tlfDvoMyC4mN5Etio6Z39LyeW8qw9ypkz1jA2b2jq8kZn9drwkb9k12emsQ5NSqcysS0kVTQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8210d461-cd75-4658-bd93-08d84edc8844
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 01:07:16.3370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQbTaeev2aF3VhFg0MsgO6t9JaXVExwEgEE1Q4sSGh12/eXIaxqpEfoDOa8f68VS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4058
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Xinhui.Pan@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the implicit kref infrastructure to free the container
struct amdgpu_device, container of struct drm_device.

First, in drm_dev_register(), do not indiscriminately warn
when a DRM driver hasn't opted for managed.final_kfree,
but instead check if the driver has provided its own
"release" function callback in the DRM driver structure.
If that is the case, no warning.

Remove drmm_add_final_kfree(). We take care of that, in the
kref "release" callback when all refs are down to 0, via
drm_dev_put(), i.e. the free is implicit.

Remove superfluous NULL check, since the DRM device to be
suspended always exists, so long as the underlying PCI and
DRM devices exist.

Luben Tuikov (3):
  drm: No warn for drivers who provide release
  drm/amdgpu: Remove drmm final free
  drm/amdgpu: Remove superfluous NULL check

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 ---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 2 --
 drivers/gpu/drm/drm_drv.c                  | 3 ++-
 3 files changed, 2 insertions(+), 6 deletions(-)

-- 
2.28.0.394.ge197136389

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
