Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C187AB853
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB41410E6EB;
	Fri, 22 Sep 2023 17:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6001610E6E7;
 Fri, 22 Sep 2023 17:52:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mW+rW/rhFMshlN01+rfFzD1DfjB3BjmZ7w61090PTBzBrNaEHTNMdbtX8vd2yb8ZboVXF2AJv2iOLC9tNsVy4G7tlaTPc9Ff59W9A4kOQODAbajLGOAd0vGmfxesXEjReyiA/A53oejSs7V1xuk/DfdiVMxBN0aWFgrzledo0Efv1BtJVGoteFKzWxy1bJjk4CahwB9oEiJxYYZaGfxLwrtcR0hyFHbVMt04NYziYBY02a+Ujdn7ctAQ0tbx4n0WmPXb4970fwtnh9OvTPMg+wF/WGhzgl+ybRGsDiU3FyRqcpS1RQ313EwwjkIEblwfCTOjOCFWwf//suBOoJ9t5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xS+5BixkfOE5EX9QuYophZBVswH4pHkTzPOe4TlftCQ=;
 b=h4gg+n7aQ/oQ2tPoeS2GK8y2UVgnmngKeNMSl8GafaMElQn7YVJd646h9QEkb4yEXdf8BKmcd2YRyj1nUJhPXTyl9wxnvX8xAv8+QdYksPwiKkBuVucZSfJWl+PIXfbWvZP89IdQjkdr4teSDfWEK8wEim3TOXPA8aJZn/PW4dtqqCODD+cXHRErPlQv3/Q9l7zcOdVBXJIoSIOXPQfMk27rWX8DiOKVo6A+7j71Z8VdZd4mC65FU0w3p6jF0JLtKPN+b+dGfoP5JBouXHatjB3oE3CZ67kB3TZ9wTWXjXvhyWJaqKKdQBF+GUWTM/sSco2znF1SN2zzec2Lon5pvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xS+5BixkfOE5EX9QuYophZBVswH4pHkTzPOe4TlftCQ=;
 b=d9OONSly1PAtfJ2Kizj+jW8S3qcIW70IAE4RkD42EVDh7WhMGfIAt8TLd+ZFcfXT9EjrBFdGvtxCgWcAnybh7Ep+FHYWdqrkhIfmrPQAdwLBmlcNi69NYsXWZqhrtJIqxp01N/GYXHAmfnQ8UBtZzqYKWHQH5NPQ0wLtnWTs5Lc=
Received: from BLAPR03CA0011.namprd03.prod.outlook.com (2603:10b6:208:32b::16)
 by IA0PR12MB8983.namprd12.prod.outlook.com (2603:10b6:208:490::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Fri, 22 Sep
 2023 17:52:36 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:32b:cafe::e1) by BLAPR03CA0011.outlook.office365.com
 (2603:10b6:208:32b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.34 via Frontend
 Transport; Fri, 22 Sep 2023 17:52:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Fri, 22 Sep 2023 17:52:35 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Sep
 2023 12:52:31 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <basavaraj.natikar@amd.com>, <jikos@kernel.org>,
 <benjamin.tissoires@redhat.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
Subject: [PATCH 11/15] platform/x86/amd/pmf: dump policy binary data
Date: Fri, 22 Sep 2023 23:20:52 +0530
Message-ID: <20230922175056.244940-12-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|IA0PR12MB8983:EE_
X-MS-Office365-Filtering-Correlation-Id: a925dada-4853-4ccc-6751-08dbbb94b45a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OFNr/msp7JYNAzNFIYM352unPpdB8xM/0+qNDMYsMt4g8b01BO1FDt0eDLZ2p1tXlCRMTz6Tpxls+edaG4BJQN+OPNLBnd6cmt35EzlORNueoz5PWXfJ+7PNFsqCOxWEcZFZCeCeNBLdJtpxFI2IfFnTeKa36W0eOLhdEjWMZuml821y9+W3dyX8LCNIcu/4v4jg/rSW3Lzq4yh6FMRIMFGE6q3uoJX/D2+TykwvmIhjWNUBZNMnGvxFw2GVlyimK07cdhyzWtb2wSvg868BsexQ3R3igSBMQ1yBCaqO89CN3ESnxlG7PsteQQebCuRgUuG7/sKTugiiFXzveG2N5AAbziDurnBYGOQH0UNdOAYdmTFqQ3TR7ChpvnRw5slszswjt/XoyjwOBmCcvESvgWWxuM/s95QGcMvkbYVjyz2m6aA7Esqr1B8VNkk2rXj0VKlrA5CVmEkRTcXe89mdO6VxN+26P4DR38ty0MYvfLndT5wQ4GaTq+yGtIVgwxPiD+lRJSBIJq9Iv0iFhqgMbKjwi8kw3IPGs2/ami4CdkOS+xiUWY4Kb9pZ9+WQe6Pd8vNJv3KMJEQmvqzyqwMCmeUJxIsvus+X/fxJC8AhXHpyLL0aTxhJWYyh46rXytCX18ekEPE9IWhp0me92duD2SbEgqUr2O9IwR0XyAH3Bodaqo9WO6wiH2mkxn2WppFHDHA2Z6EvY0nJEOwng/vDqO6/MrvWzfuRISv/O+9XG2iwMQIqi45kHe3x8QJYpya4gsA3gX8+LQmPeAyJnreqvoHYPTAkrcgsalfOy8kbF2Vl1i0cupC9Y1fShc7hHjVAc7aB2YbImDZmnzDeiccCLg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(39860400002)(396003)(346002)(186009)(1800799009)(82310400011)(230921699003)(451199024)(36840700001)(46966006)(40470700004)(6666004)(7696005)(478600001)(110136005)(2616005)(426003)(16526019)(1076003)(316002)(2906002)(336012)(70586007)(26005)(7416002)(54906003)(41300700001)(5660300002)(70206006)(8676002)(40460700003)(8936002)(36756003)(82740400003)(86362001)(47076005)(4326008)(36860700001)(356005)(921005)(81166007)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 17:52:35.7965 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a925dada-4853-4ccc-6751-08dbbb94b45a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8983
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
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Patil.Reddy@amd.com, linux-input@vger.kernel.org, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sometimes policy binary retrieved from the BIOS maybe incorrect that can
end up in failing to enable the Smart PC solution feature.

Use print_hex_dump_debug() to dump the policy binary in hex, so that we
debug the issues related to the binary even before sending that to TA.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/tee-if.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index fa37cfab2dc7..3daa122f35d5 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -290,6 +290,9 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
 	if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
 		return -EFAULT;
 
+	print_hex_dump_debug("(pb):  ", DUMP_PREFIX_OFFSET, 16, 1, dev->policy_buf,
+			     dev->policy_sz, false);
+
 	ret = amd_pmf_start_policy_engine(dev);
 	if (ret)
 		return -EINVAL;
@@ -329,6 +332,10 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
 		return -ENOMEM;
 
 	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
+#ifdef CONFIG_AMD_PMF_DEBUG
+	print_hex_dump_debug("(pb):  ", DUMP_PREFIX_OFFSET, 16, 1, dev->policy_buf,
+			     dev->policy_sz, false);
+#endif
 
 #ifdef CONFIG_AMD_PMF_DEBUG
 	if (pb_side_load)
-- 
2.25.1

