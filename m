Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9C534AFCF
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 21:07:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7D96E2A3;
	Fri, 26 Mar 2021 20:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6D86E2A3;
 Fri, 26 Mar 2021 20:07:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cyx4yt9R12m6vHcfqqzZk4R+zXy/gV0QTzPWcnyED5o40Fa9wivVDy6STPHiWRq7eu0y1t/QJKNkxbpQ/2GZsXqWMuMASC7RuiqXXZa8w34oL8+rAlmREU4a/rciBAu5LhquH0Z/kO4CA4tLS6LcJCRy+pnQr7WQWeabinpQSkR/dJgBrULJYwuVIJ3fBAkq8fJV2rQTuqsu3un25i+kp7sPwK3l+q+gWm+cWz0cNeSUQrGH80zTLjDYcunlB4mYCXVo9tvoTzjbbFttOAuImqCO/DlBo9Wf8SECl47oTn/Uk50hF0ATUOAXkINUak8MkhJrHfMr0qXsPlmQObhfqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHpzb/JgmQwcqvSwKc6nn/vpj7WZfjollLZXJfWhc8s=;
 b=DhQhpkFw/HSPCEIliLcbG1JCymqTPkYQbxpuK/+FfpTS9zVKIk3f7LFmE0g6Es6uUbAPLebXEHyRxAaFkR+tf1m86FPsD95q5Qop4Zo9SOVtP1X7ZmE5fxUbUOJYBhB3M6XBJtsjo0inLXtbAfnmseBYFvenNCacNxKNAylrCLyJSLiu2ZLxEYg/CTWMv8MbCt5GO3WW4xszzomD+vjOu2JP/hsmLZvr+1VH5PBlk3kB6BY0edoxCCniAv43UjyDgk2Hyr3Ta+56p7euP88EozfT7sP3PeAj2Xy/4GLszdBneWtxUkJw29XahTVwp+CMpMlz7jTPVvyOLVPIb5YJcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHpzb/JgmQwcqvSwKc6nn/vpj7WZfjollLZXJfWhc8s=;
 b=3G3xISnq0DxmiRalFrFCXSRR0SHXrYuRb+C3kRJ9DmYJF1VV0aPHFoYo24jHk3Qj0wiH55SpOyReIm67GnfOH2hUJV3D0EM1vnG2qMB6EeoWj/6O9ZJ0pdFkrvsXNKTFfE6XV3RcKNe6U5x+PjZZ/jUGn3BhCdLMzrX/3RcKaUU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4437.namprd12.prod.outlook.com (2603:10b6:208:26f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 26 Mar
 2021 20:07:36 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e%7]) with mapi id 15.20.3977.026; Fri, 26 Mar 2021
 20:07:36 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/display: fix merge breakage
Date: Fri, 26 Mar 2021 16:07:19 -0400
Message-Id: <20210326200719.1256182-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.30.2
X-Originating-IP: [192.161.79.247]
X-ClientProxiedBy: BL1PR13CA0343.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::18) To MN2PR12MB4488.namprd12.prod.outlook.com
 (2603:10b6:208:24e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.247) by
 BL1PR13CA0343.namprd13.prod.outlook.com (2603:10b6:208:2c6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.16 via Frontend
 Transport; Fri, 26 Mar 2021 20:07:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: adb452db-5a80-419a-9f07-08d8f092cc72
X-MS-TrafficTypeDiagnostic: MN2PR12MB4437:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB443781BA69D35B2CA6036B1DF7619@MN2PR12MB4437.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:353;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qz0t/kjBQd46xaoFBfbWSAwZ+crNypB3avgLXm60+WZIuvxDW/FCQ6a54b9WOWIv5AOgeHgjx1JM74m3YXIWk3e4Q7BpqNcFyESUC0WQQszNwaFptiNCBz1z9wNUD0b4mLcvKQP85sjfIDPIULU8wQJmL6S9TletS8cIbwIu1zQtnE8tPCcsIAU+dnY+kttkY4nZdlll7fbCDuXGyiQ/cRWbXotHbeC04uc8qHnkKLI7pbHIrDv/Wy35db6uxwvVQleg4s223lyZ6Lyae3fco90Sy8v4Swh4ILYAVIvZdHAM6peC0j4WFUdPEgUzVrXxqnwx3Qo9ptX0IBPK+iJlsu4fE0I+o/Lf2rGHjEw2HhACywXA07HS9Mm4bt+EJuXURdXaCVbPJ91q2yjLzXyMrPQpi5BykWL/EZyamW+gvihJh0hLXmq26EtjUOd50qXQdt/bUDk3hFXNAH0+nHQuGRKyoeoI0PE7O6IwnnpS6hJiw5nlkmGPDtLTt0yhiv/WaXp5DS2vbdX9H8UGNNlMzXI2q8BUeFiNieyvtRbBDrLc9EcC5vnDuYuuGb+w/wa4Pe3VGR2VUej9sZqFCt7s/x7DUTi9UzW45xcTTWOmPr7jaZ1iGCwhmTPrqcowBjrfhd5O778TWT9ilVZKpuIEEiObVtCkw5PdTH1goLz4UyklJX81LvPyHVdtXzuZP2h6nwMI4t1vvQ3M4c//g+sWZiEm9pVLvACEus7/ZNzCzVM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(366004)(376002)(346002)(86362001)(16526019)(186003)(966005)(8936002)(4744005)(36756003)(6512007)(2906002)(38100700001)(2616005)(6506007)(8676002)(83380400001)(66476007)(69590400012)(66946007)(66556008)(6486002)(4326008)(6666004)(5660300002)(478600001)(1076003)(316002)(26005)(956004)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?c+Vqa+/eq4ZXQCrFQCMqu/z1dDWBk/HAsEmMxK19BSRFy/sq/G3ZoGb6a0Lu?=
 =?us-ascii?Q?lntPtduf9VXJbCnlos/CrwiOjT6QhRkM9W2PbJEkA51MW6PpsP1GSwzzug/8?=
 =?us-ascii?Q?3OUmONmGraLbsmvWr23RTrVGJbZrp8Omc/rG9uiqr7agCTYgHt0zmNuZ3XS/?=
 =?us-ascii?Q?4j1RF4j5V3qpq5Xd7C7FSuKi67y7NUaNUPdtTxQuiXgmxwZ+rJjoIC+kT3Zb?=
 =?us-ascii?Q?CNsCfNDuUR2V01b3x3UxSjq6kkCS1Ys2V4DJh/276F+fP8aWUBlhyQCdIOre?=
 =?us-ascii?Q?3NRHJ0AesKIdPpvu0rzgzhjyKhpAZLrChJUbsSmJAEW2mte53XmDk4BJfOC7?=
 =?us-ascii?Q?sq9rZFuI23GedsEMXHkAqvFDIu2FSjvgDXbC60vzPd4MLgDoNOB2NvkNhFXu?=
 =?us-ascii?Q?Ljujd+RZaXcVar6roztwz20lUW+Fcw3uyiVeBS0Zht8JhyQQGovTtNljircE?=
 =?us-ascii?Q?zh4YWeF6/xZX7BbBb2fye+hyNW4g/ibgenSSkytAx7yIaaBtkSqnt3gx2nhK?=
 =?us-ascii?Q?gMyeUWn7zv9LQxvNWv5BQuhaYBwsJpfbD6ekki94CxXw7qObeBfo+tKGdq7y?=
 =?us-ascii?Q?FkuP5BDJXLYt+NTJbC/hYsw9SR3v4JEyoHSA7kS0PkEAWTM+CEqbc2gX7zp3?=
 =?us-ascii?Q?oL0xKm9+Wt+XGu5ntchlJyR/lP7dqubrJv47phuSSyyZ4pMvb8HIgYoFiwD+?=
 =?us-ascii?Q?zqUJSxWkFDJV6jm3SrpAWpVFfirGwNGsLVP+tYMEPMgsoRNkrxWXGLCDiQGz?=
 =?us-ascii?Q?RCeV2O7187Aal6FnhIQtepCgku/x2EhuB+y6UPu3w0Eo9YVP7AbcIwWg4VEF?=
 =?us-ascii?Q?hOGt5FyFYPONzBfGEmt5VpqGxfQlRp7NyuYgFYrW3RBU1DoQk5tX0ivq3TRX?=
 =?us-ascii?Q?/5S6GADpsrEmvJG7oJmkGMr0Xm6gURla20i/Uqnn2g8l4s8uT6yfc9aqqNmS?=
 =?us-ascii?Q?x8Zz+1T04GsqMSkKkM7WP2cYd++txeuGlrJ/wInwypLzJAoH9ynwTPN9iir+?=
 =?us-ascii?Q?wkT6aiFljwuTODGF8AuVxOX2fApEgCt2vGopJDCOJrbd74r6l6xAHGYzJhze?=
 =?us-ascii?Q?VqWMwGyYbDjsJOPrUfsdXnWgAqbfUWoxkTLSbmMefC5fVOzuEciOd2a0fRfu?=
 =?us-ascii?Q?IGHlpymymaHTsYL+XdxZAfWAG/f5bUzNkhUy9bW7LMJxTkEoUx53+6TX5o6d?=
 =?us-ascii?Q?7ar9yMakw4KA2L8lHU8eZ8FKVJhz3nz6OaxzkvNpuZteDDhVznyM1yLffjhj?=
 =?us-ascii?Q?ViL74JnrpA65qeJ4JdcEXpH8eJXgY0Genq2gbgofVPXRrJEFsFSQ5hNzttSU?=
 =?us-ascii?Q?zq5cJiAsjcDWbTVELaNCXf/k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adb452db-5a80-419a-9f07-08d8f092cc72
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 20:07:36.0154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p31CaKoy4wcawsaNXeizXH5voQ1gOIQwgbIirbfZ4KiviidZUwPtLqw9AAk341vxGvu1MWZRIQspFof2VDHmGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4437
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
Cc: Alex Deucher <alexander.deucher@amd.com>, daniel.vetter@ffwll.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks like this got accidently dropped.

Fixes: 2cbcb78c9ee5 ("Merge tag 'amd-drm-next-5.13-2021-03-23' of https://gitlab.freedesktop.org/agd5f/linux into drm-next")
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: daniel.vetter@ffwll.ch
---
 drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c b/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
index c44bb68fe2e6..1a5be2792055 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
@@ -187,6 +187,10 @@ static const struct irq_source_info_funcs vupdate_no_lock_irq_info_funcs = {
 	.ack = NULL
 };
 
+static const struct irq_source_info_funcs dmub_trace_irq_info_funcs = {
+	.set = NULL,
+	.ack = NULL
+};
 
 static const struct irq_source_info_funcs vline0_irq_info_funcs = {
 	.set = NULL,
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
