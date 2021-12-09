Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBE346EDB9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1A310E1CF;
	Thu,  9 Dec 2021 16:52:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A680988F9B;
 Thu,  9 Dec 2021 05:53:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UduZ8Uq+pTfwrvHqjhrMZeZvqG9DPejTqHKr/gF+Giyas33sqWPvQVhJE2nYZ+oiy/zj891pO2lF8SYxmMntTmBbMAjV4ia/Q/JPcOCNoiQvhTD10N4HDj/xCx7ErC6KO/bejqtpeRI3qzRiIxCU0BqxKcqWTUHZ1nAb3byGlfR6iHlMZh3yR4zJ6XrGsS+L7CM84WTmjXexV+voP4kqTHFxE6NFYOj4bKYn+BKCBQC3hLTyemIXQMSlHnWaQg6/ycc/fAWDuvKp7ff+yTtWmvwFRJLK+DTga71BV+Qi3Mi1MN+pmSrJqUNHLbIGQlsCT1J2wNh3o9lUorh77D4oYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SCjVaT/Y2ygBviUnuAUP/B6S49zFa6fufEf8XzF1XM=;
 b=PxhRvxpSVp7Clmz3nnZWk8Kv5+GJjLlXIHo5ifOl8A0f+lV7UMAe1AodtZdnG97NsQFrK3QfHC7w28Y9C++Eqfn9SjbZgbi9pdOSyw9vYAYi3Npxz95d/j6EP6nlWOZXZhisqYsrVSluPwZs8VZSiFTa8uoXmStXVaU4RLrSVXbOcXwEfc0z9LxzdNdYB1POIDZZ5V8p+yPKQZtsT0fnIx9Wl8IrzZF0RmVItDIbrCD0UH0GZye6o2kyFNfo/gWH7lufObJqaXEE5fOaQqocvG4VH9/aFMe00WnM7MhdudQg6h4Hqtjoi2y4+hD/IbrM7NjnTuZkpml94RK/Cn8KPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SCjVaT/Y2ygBviUnuAUP/B6S49zFa6fufEf8XzF1XM=;
 b=tLv+K+r0UposkuD99newp30MLYYh5cpVlAVx2ruVRnF+mgYY97nud7XBcbtpL/XHqCruAFYEUbXeIKJ+z8E9+xd5h6ETQYuxMAj5xHqT4+3p3ZT5vwmfz02pSVsWZv3UUqNOM6SkTWw+HlTpyA02aKbMESo9lbIkJqIyxF93z14=
Received: from DM5PR06CA0093.namprd06.prod.outlook.com (2603:10b6:3:4::31) by
 BL1PR12MB5110.namprd12.prod.outlook.com (2603:10b6:208:312::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.19; Thu, 9 Dec
 2021 04:28:44 +0000
Received: from DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:4:cafe::5f) by DM5PR06CA0093.outlook.office365.com
 (2603:10b6:3:4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Thu, 9 Dec 2021 04:28:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT015.mail.protection.outlook.com (10.13.172.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Thu, 9 Dec 2021 04:28:43 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 8 Dec
 2021 22:28:42 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-5.16
Date: Wed, 8 Dec 2021 23:28:24 -0500
Message-ID: <20211209042824.6720-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36fb8a31-f5eb-44aa-b730-08d9bacc6276
X-MS-TrafficTypeDiagnostic: BL1PR12MB5110:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5110764378403A691C3B80CDF7709@BL1PR12MB5110.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:352;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: upWIBINv/Q80sMrwc4GOizsoYeJvP3isf9ZyulVOjIPWLu5Kg92EYCxS5sKoyw7lrpur6qyCI79nmh+UFdOxuSHXpm5V7/pqaWDchtxPZ58zqg619CHu8g6O8kbIp8qQFmLBHm35uJjFIvrIlQ1S+mdRh+HYoCaaKsWo0lUUVpMlSiAy7NWXNxuo+f/voWnKMDHcUMbSUf1i6XStxIBwvxEYDcNAavybl5Xc+bjjzkAOQarM1fU2y7eLb4v9d65odCzZhMK2qhJwWk0r/ME+bzaAfThHFytSuylfSJTeKJAN4wZqQ4DlD+WU0gncaA+g26cXRBvloBl1Nyq1sK4szXTM4sh8xeikjWAeJSwEhfYmyi4xNxvdMtQsIU6S0BE/S4RiUuSJ8CgVPZxKpyx4uuRV59iG/Dabp9FlZSa56cKv2at5gdSfpFBOZdTYJSET+RofL7Em4ox1lsuVXi1HD645LQVNOTz7h0h2aflzumGnpW2StpUCZEu5S0WLUrCQYl97nDDqrsjVsqHEJJgSllWEhNYJhy4lPS5hhrI2zDuHeoD9M8zWI5RNQF1V2G7cSeQw/2MNQSJ1ErIqS1NnIRP2QttY4dR8yDRMDUUeXW//xQhEQNCxCxnU0cMLh/jz8HpNkQhsJkSPlKV95FREx0d+IaWIY1lc7l2hjDxFXhAPgypRBHlaDUtvpvKAh8zFoNy7bwXNAhE8bjAv9kubSMrRNAClEgiD0ZTTZk8YGbBbRylxpFQ40Bi8w1ZnfMR3Qs+5TtIft73bW4cCJJELCEtCF6VjfT9zJIKEgUH7yT8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(1076003)(966005)(336012)(2616005)(426003)(110136005)(8676002)(70206006)(316002)(70586007)(2906002)(7696005)(508600001)(16526019)(26005)(6666004)(8936002)(5660300002)(82310400004)(186003)(356005)(40460700001)(47076005)(81166007)(86362001)(36860700001)(83380400001)(36756003)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 04:28:43.7052 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36fb8a31-f5eb-44aa-b730-08d9bacc6276
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5110
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Fixes for 5.16.

The following changes since commit a687efed194bdc185fd7cb33920fe8b4e60ecb9e:

  Merge tag 'drm-intel-fixes-2021-12-02' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2021-12-03 05:59:31 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.16-2021-12-08

for you to fetch changes up to 0755c38eb007196a5f779298b4a5f46c4eec41d2:

  drm/amd/display: prevent reading unitialized links (2021-12-08 23:24:08 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.16-2021-12-08:

amdgpu:
- DPIA fix
- eDP fix

----------------------------------------------------------------
Mikita Lipski (1):
      drm/amd/display: prevent reading unitialized links

Nicholas Kazlauskas (1):
      drm/amd/display: Fix DPIA outbox timeout after S3/S4/reset

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 7 ++++++-
 drivers/gpu/drm/amd/display/dc/dc_link.h          | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)
