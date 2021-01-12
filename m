Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6234A2F3349
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 15:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992DA6E252;
	Tue, 12 Jan 2021 14:55:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30B46E23B;
 Tue, 12 Jan 2021 14:55:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dTw6CV9qHnumGjULcP4NrfCGSfLg9YvALO+xsFx+PMwAPiy6akHdzv/y0PEVx7hzsG0gkMjxA+Ghjra8eoERmYlikmCc9uGkzYHwo/VtbZ8Ph1gtdo/3WT6wcNOM6HoBwHPuhyGm0wm/zPezdtNWdHEphgBbfOikPhP6OAiu0KffTji7HIf5OrK/IAEF6j4oEI4y8Yg01tdzQUvKAKzkfsmMOsCvL6K3OZ0aQSuv3AzCFrsrf9G3VunXIvQXFfgfIkOpLG0Cb5ENYiSn0jywEOLI6NsrIEQdxcC9TCcEBw7HAnS+oSiTS+p49TnFlvddpaVOSFYTYRDu8a1oEf81Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nlec4M4dz0fHAOeUVWmoLQbgcDT9sQ9Hs/Sxdf4i4IM=;
 b=WjTAJdJbm+ZU9FXsNvLFHYk7dXb4xnx/ixrthiVfovQ6FC6FtFfNbJA/tGZgD4cMeYGoROxcxRo5X2i1H4zbQSLDRU2kwghMGhDBU3aq46lZdWMJaS/+Hy106dCdv9vGXczdpXTGibsVFax02o9bhteTxW91Wcl9MfPFRrHBCzXLEMnbWTiubfbF9wPx3h2CUM0XMqnOsDHZOxJzQwidfEGUkvUApxQpBen2ZJ4ofeUTXTNyN9XFwtKRufYoKbyyHBofxoCc05GCcNW6/+1ow1UxXyeJ2+8yO3Zi3Mdgo3pd+JkMfEqQJGvJtdN3W913Tm1Pcp5aQat0dB6tbyUpJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nlec4M4dz0fHAOeUVWmoLQbgcDT9sQ9Hs/Sxdf4i4IM=;
 b=znLz1/IX1W8eyiiNBGDiO8BZo0rgi08U9ZqtpvU0YMe1384Gpbe3ExtjsKOg71mdo5SaGLL+xJZpsy0IG0sUXw+QuA7q2+buCI3PmDfnxbNoXwr5iRJredyz7QrcdxarCrpJWpHBLY966xuYjJ4/9u+3kkTCp6LLDI0fe5OWgJ0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1753.namprd12.prod.outlook.com (2603:10b6:3:10d::16)
 by DM5PR1201MB2490.namprd12.prod.outlook.com (2603:10b6:3:e3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 14:55:51 +0000
Received: from DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::1cf5:9c9e:7374:4540]) by DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::1cf5:9c9e:7374:4540%12]) with mapi id 15.20.3742.012; Tue, 12 Jan
 2021 14:55:51 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] Revert "drm/amd/display: Expose new CRC window
 property" and changes associated with this commit
Date: Tue, 12 Jan 2021 09:55:04 -0500
Message-Id: <20210112145508.1564863-1-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [2607:fea8:56e0:6d60:24ef:ec9:b88:9a22]
X-ClientProxiedBy: BN8PR16CA0011.namprd16.prod.outlook.com
 (2603:10b6:408:4c::24) To DM5PR12MB1753.namprd12.prod.outlook.com
 (2603:10b6:3:10d::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56e0:6d60:24ef:ec9:b88:9a22) by
 BN8PR16CA0011.namprd16.prod.outlook.com (2603:10b6:408:4c::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Tue, 12 Jan 2021 14:55:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 55040de1-c058-40cb-737d-08d8b70a276d
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2490:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB249033CC791DA8253A252EAB98AA0@DM5PR1201MB2490.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dnL+32VYb6ltm4yhcLL3+FyGAoltXpCOk804tQ4wCEL+yYlfxMY3BQHf47zMu/iI8lRNT4PLqh+tj5khbEmPzTWqdeEUEfYeWfRz0C5lGnYtkJz2jUzu85fBUrJQxKXuiYtSm24aNmZxnURDW2+lNIfQrVYIil7LLSoBl4UfkYl2xUeRve9jBPcBUTJAAIGSmscNwcv/03C0WDtHgkpjix4LM6AxHEkwIm34xjsZYDUKpfDjYuP7Wgt913Zv8TqJ2HbWCguR6TqPMyRy0GMafOyhbPoiyU6uu8kWEtxeMohgecTMktzwwP+HUMIxeGo9Jul0hRX9ueGXPtaHBPJEf6MXEcMmlM0wSt0vEfX6hM++zt3RP8BX0rJguPZoY8ugKYfxRmmM0mlJ3jjlWNAxyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(54906003)(186003)(6666004)(6506007)(6512007)(8936002)(86362001)(52116002)(66946007)(83380400001)(16526019)(8676002)(5660300002)(6486002)(2906002)(316002)(4326008)(1076003)(478600001)(66476007)(66556008)(36756003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?v7qyejyZF2ieZSVJfI7p6J4nfOZ04+xv/tkHi/y+vWD/v7JNZvBlrFjngqOz?=
 =?us-ascii?Q?2HdXLxAhV43jPcsxXYtlf6XD6jr9N6b6tQ1KIBuMdydb072o58/8p0SmnfyO?=
 =?us-ascii?Q?YlCnToL9OWOx9QEdXhBgpgr53LsT4yqZyizQBi1QQpQh0wrCqVhm/ZgFxKhS?=
 =?us-ascii?Q?wY2Cu10c0cW6f/PNJkDUGY3Y55+1yNGiRBTyAr/JS3TKuaO7kNMDPVkxSsJs?=
 =?us-ascii?Q?4/MgQ826WxXc+x9rOQ5ZrTkSbTqUmv/xFWtzwlABW8iZ0luP3wvy5qv9b5sc?=
 =?us-ascii?Q?NVqt3v/ps3/3389lxBfWshILDySz8P7CGhzxo9PlCMmaEubJOKMp5wLtjZBe?=
 =?us-ascii?Q?5zrEolrcuSbVJyui6FH8BIDgctMZF9C8iVYysYHUJs36ye4WyfgwRujhsqgB?=
 =?us-ascii?Q?4RQJPdVNDiNX6eIvmVQAp9JAkYIfNEzEvti2D1+PyO0xY1/tGo0rmJwT4bEd?=
 =?us-ascii?Q?BaRlZc0ennIGDSrvLzjEwpNQjUzwY0B6P81UMhof1It2LSae+MAqPDBV9Kh+?=
 =?us-ascii?Q?yL6MSk6DYYUYipUV3/K0/xLSzbVxT8zDUKGGj82fgg/gK7OI2qrRMEnzTuZJ?=
 =?us-ascii?Q?8vKaff94dCixhzz2kcacErSzFOE00Q2LA4a/aaSvVjunJgyjZ7udU8Orupfy?=
 =?us-ascii?Q?EaURACuUg7mZoWDWh4PLnh8rnCig38uJc4H/qfkr+WIc78s4cQWFzU2gU87D?=
 =?us-ascii?Q?/apBbIjJwRwARRrn8kKH7j6fGhhkhjDi1RD3NTLzwUT/BeTRxpGmdsFX35/k?=
 =?us-ascii?Q?ryHI9w9/KVdT4hBIJbmUr3XoME0yKTfYJgCImJcOp15hqVIj2HE3OC7XWApe?=
 =?us-ascii?Q?+Skyga2zZnl5vQivQyEeYQsXPY2fViXEOMUCbP5NMfkLL+9wwIQodWs5Eti3?=
 =?us-ascii?Q?OGWPiZS7LJ4CtB39ieRPwGrY9/B1Pzquqd30khjz7Fz+UD6PrS5pVXAwLI1V?=
 =?us-ascii?Q?+CshyqXz+H638OZMf2GnGwf6K7WYxUV0uuiydl/odrypKvycrWVaMeE30W2z?=
 =?us-ascii?Q?qZFMkVJWHd0q5TEyfCUBY85MtYHE67Y7HZriUWdb2jOckIUyw2uXTCmSef07?=
 =?us-ascii?Q?bTsicJ+W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 14:55:51.0666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 55040de1-c058-40cb-737d-08d8b70a276d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: isYqqvkQu4xI+ppAWnt3Sew+6oW+ZvygJ72OzbJyojkZt81/Uykox8wF96XBlha6JgsxwrPwGigQHitGjuuFFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2490
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
Cc: Roman Li <Roman.Li@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>, Bindu R <Bindu.R@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

In the V1, Wayne pointed out two problems:

1. The revert patch included one extra line that does not belong to it;
2. The original patch also had other fixes in the same commit;

I removed the extra line from the reverted patch for tackling this
issue, and I added one additional patch to this series that includes the
other fix requested by Wayne.

Thanks

Original cover letter:
A couple of weeks ago, Daniel highlighted  [1] some issue related to a
patch entitle "drm/amd/display: Expose new CRC window property". After
discussion, we realize that we can revert that patch because we will
need to create a debugfs or full UAPI for CRC soon, which will make this
code obsolete. We got two other patches related to this same code; for
this reason, this patchset reverts all changes associated with that
specific commit.

Rodrigo Siqueira (3):
  Revert "drm/amd/display: Fix unused variable warning"
  Revert "drm/amdgpu/disply: fix documentation warnings in display
    manager"
  Revert "drm/amd/display: Expose new CRC window property"

Wayne Lin (1):
  drm/amd/display: Fix to be able to stop crc calculation

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 142 ++----------------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  38 -----
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c |  54 +------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h |   5 +-
 4 files changed, 11 insertions(+), 228 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
