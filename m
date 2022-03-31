Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B38A4EDF9D
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 19:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8792010E1BC;
	Thu, 31 Mar 2022 17:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7EC10E1BC;
 Thu, 31 Mar 2022 17:27:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FsUjrptIx2eY2co60dhm8IVn6gBJpcwx0j6g8szWqHGhjPpd0hJTSHG+6622s4Mg1D9t341q/K8/oMu8fiOhQmC8v2tuqDPYHN9jT1S72xg+KScdykD/IY9iTlUeFHECoVtbclenLycXB7s1+hDt/yRA/s0XS+Fi8mE2syt7usx6rOviGaDLHdbjFuu6/AhkGrP60OkxwWtDBZXN6fqezNBPOCU1FvyQKX7d0ck7oZwuf0WYFAKHjHmuOEoe5s02xhwPGfKhMFNhJAplV+Mc45NvDHSiZ0he1sn0tIYwE8Y2e1fnBN2vbkNo9xacbuhxRFqs63wpTzlEVbEKzC3tiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DeY6aOIyMwl9eI9EOnH7cIr/wi5g7JheN6wOIysgCc=;
 b=gilu9KJSrzqY9bm/ypmsVc+eIIVBMjuE5OCQO53/H4+udE4wJHvr4VV45RRGr5uwfNq2kn1Fe1HvXXNFBaguCaV3ZSIHAFonkK3VvD4NCb1fdXpMSBRVnbnkCxOyBX3cs1iz7o4Zf85JpsGXMUuvKeRgAeyoAijrkoJXmxTOa6dEz0Q3tmz9h7dV0P7cMx9EZSVXeLyDplKV/YHUaH9sj/A5qPh883yC3D6hbXLo/inhsmMuJ5HQsZ7/7dwfBav/gJbMHnyf9pFW9zVtx/VRwedpwAT+DU0OQO5ndpZxvaUX4lyNNkNkNdh86AKKSsxGXhpFTrezd6nZ1/0y4Modkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DeY6aOIyMwl9eI9EOnH7cIr/wi5g7JheN6wOIysgCc=;
 b=yNk3CFCVF7tmp/EFkYJl5gfbVUsi/8rlccKNVm2bZULrrq2qrmk+jiXiZj/smGt1XnMR5uk9+3gZmD/HO4+eizs3gWqqt7JEvV0laODBcKzCzeqHX/o4KRiVEZaOHcPnS5GvMmxG4swAX3xRTBbTK2eFuR7rZ1EsrEZBvcnSj8A=
Received: from DM5PR07CA0138.namprd07.prod.outlook.com (2603:10b6:3:13e::28)
 by BL0PR12MB4898.namprd12.prod.outlook.com (2603:10b6:208:1c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Thu, 31 Mar
 2022 17:27:08 +0000
Received: from DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13e:cafe::d6) by DM5PR07CA0138.outlook.office365.com
 (2603:10b6:3:13e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.22 via Frontend
 Transport; Thu, 31 Mar 2022 17:27:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT056.mail.protection.outlook.com (10.13.173.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5123.19 via Frontend Transport; Thu, 31 Mar 2022 17:27:07 +0000
Received: from Gundam.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 31 Mar
 2022 12:27:06 -0500
From: David Zhang <dingchen.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/1] add PSR-SU DPCD bitfield definitions as per eDP 1.5
Date: Thu, 31 Mar 2022 13:26:51 -0400
Message-ID: <20220331172652.3445223-1-dingchen.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17f420e6-bcaf-4f6d-1b8a-08da133baeaf
X-MS-TrafficTypeDiagnostic: BL0PR12MB4898:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB4898CDE06D6FF23B7F64870A8DE19@BL0PR12MB4898.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LUfSRfGUgk7q/OUNNM+9Ysavy2I2/a33G+bBkJt8IZFu8LPX/PAAIBcr6f3zr2hB0SUV0d5Z7fDaQge/5ur8jsjXm3i6pxUY+EmKoE51b9/aTStn78+rIcvMgMMG3+t2b9v64IGxGqPHpsmMfH1rbRX84ti8cad+1o2v3cWqXRbqU3qH0c4cYyKuMf9Fg96rMs7AEKYSSO4ufSS3edWgjij10A6g4Pk6gYVZDJuKs5Lxjz+Iw7frHPUmrjNWrHaFqaDGZubh9TFe/ppQ3cBV8YmUa3Z6iGzj0csDeJUb6izj5anKP0vl968KppxyhC1ZiBKyuu6ds6OORKiUbpRvkxVXjbk4AM0lSeTearE7hakU20FTmKyg24rJOlpuyn2I351a8iMmNw3BqqRfBV3gHXi+uKvAMAxZh/HDX8v3EK+xgrwqqfhdAZhLTMFHyAcq2zl/kD5CsiMTko1raEpEX1ci4EvypEVBUgfEp4Mecm0hfB5kN6dYkBfijwi1Tro1iJO1CozDYWVWKA2Cwnh576nY5MUB5m8ceUayOUFeZ7NdAtMTPtP6aeuDTtd5yex76G82BV5jWc5AR5M9kCbeDm0zUNhMCl3u3B0iB5yj+0vWYaGjsdPQn4s13xi5oH4KDwUOY9iYNSNIffMIAXChd6ly8BRYM1sstunuxyu8xQnXeS1X7nM7XKyMJOI9GACk8xaB8ZnuAmjuwE0iVFbvEQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(2616005)(36756003)(186003)(16526019)(2906002)(6666004)(40460700003)(47076005)(1076003)(36860700001)(336012)(558084003)(26005)(426003)(86362001)(54906003)(7696005)(81166007)(5660300002)(8936002)(508600001)(82310400004)(356005)(110136005)(8676002)(4326008)(70586007)(70206006)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 17:27:07.8868 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f420e6-bcaf-4f6d-1b8a-08da133baeaf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4898
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
Cc: stylon.wang@amd.com, airlied@linux.ie, Sunpeng.Li@amd.com,
 qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com, roman.li@amd.com,
 solomon.chiu@amd.com, jerry.zuo@amd.com, Aurabindo.Pillai@amd.com,
 wayne.lin@amd.com, Bhawanpreet.Lakha@amd.com, agustin.gutierrez@amd.com,
 pavle.kotarac@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

*** BLURB HERE ***

David Zhang (1):
  drm: add PSR2 support and capability definition as per eDP 1.5

 include/drm/drm_dp_helper.h | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.25.1

