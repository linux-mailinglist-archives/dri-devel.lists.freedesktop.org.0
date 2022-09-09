Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 253085B3DB3
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 19:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D0E10ECD2;
	Fri,  9 Sep 2022 17:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5334310ECD2
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 17:10:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3qOMpdcBzYi2Owbp84Bxx7U+Qy9DbvFhE2B+tPMcVmVJvWtcQzE5cYaz/JxSyvt4mrgq7QeuHCbGBOwv9VsfDQT7jGPjk+L8x6o2GGQsGzIyesx+cnnIi/TBRXDEdjqUzALR+y9cxNdGhpMnNdeYMQJzzvqPuDMOURfl3QEemScCT5wdEedsDcId7Pi9qIV+7G6opWfJkvUxXrD2oQUUoemsQi29eh4jsE5UWGOX1iizKsp1slvAzjmDumWwS1hR/LwjQTuW8hZA5EMY4Vjaapz2uwyVsz5gPuujdVUcNEjTHCCgRpt/t8fV4T9ewuSZ4jXfuDux2N4wzDjjyvEHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ngv9HHf0EsrqI0JDCd+SslcAuejTPxF3do7w2AIDIp8=;
 b=LYsdIzQ9b6YWf7HcXKVeuCYKWVnwKtql9a9G7wrqBmqZ8ZHeKfeIoT4xIpy4jHYYLb6ao2SZOKGAEa2qAtaaMt6GnJOVwAbiqUiO533AP0WD20/L2yNfQVwPuMzjzSWOcyu6h8V0lnpX5WMdZ5JNRF+ycPYYm+YXSJfBIPBL7v5oA2E0w/AAvxkwtlna9pWDt1/vcjG+MpZAWgPcx0SaAoW0DIk/16oLd7Z4jg+lJ1npOVSR/OfGy/dVef0NnJ6NO3BQzkHog+4Zey+zayNApvL6IY86UYrScYTEsAuibvMB256l8w7il253Z9X+WKG2+Nkjbz0HoJML4CMP869RBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ngv9HHf0EsrqI0JDCd+SslcAuejTPxF3do7w2AIDIp8=;
 b=htl9U26BIPy5QkSyVqHVZZPtYW0ko39wGOD8A15YIEhgguoixO1EUyqAxtVoksdHZokJ1P2b/qw+8hlAKzSYct350CxcDRoPJ9CuCyNGkcIKLI3CX6kc0IkD6aoJNz6vTOkkXRV8H8HrSIfj4fnIOY5QCHEuqFFFAXYJjWhupPk=
Received: from MWH0EPF00056D09.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:9) by DS0PR12MB6582.namprd12.prod.outlook.com
 (2603:10b6:8:d2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Fri, 9 Sep
 2022 17:10:35 +0000
Received: from CO1NAM11FT106.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::208) by MWH0EPF00056D09.outlook.office365.com
 (2603:1036:d20::b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.7 via Frontend
 Transport; Fri, 9 Sep 2022 17:10:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT106.mail.protection.outlook.com (10.13.175.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 17:10:34 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 9 Sep
 2022 12:10:30 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 4/6] drm/amdgpu: Enable signaling on fence.
Date: Fri, 9 Sep 2022 22:38:43 +0530
Message-ID: <20220909170845.4946-5-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220909170845.4946-1-Arvind.Yadav@amd.com>
References: <20220909170845.4946-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT106:EE_|DS0PR12MB6582:EE_
X-MS-Office365-Filtering-Correlation-Id: 54a9a75f-de33-409b-f492-08da928635b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1fFo4zeeKG5tG1T/lsKJOY5JqduY47DgjNQ+kZUi2pu1ISekkugmBHWyv9leeQyppDQCu6+7pB4RupHE7jg86RfTH+CBOBO1GZ9fpaMb/ieDcE6KuFGPtJRfd6uDAcPtxrq42EHhUr5O/066dg1Rtnr/4C85x4JPwYYPZrFQuYx8XX9srUK9tkM5cwqsvI5VK3R8YmMeqI34gx+6WNdppGQSgKEWG1cqHnfYfVmDL/QXDNfqJpiouztqJSTEJQw/dUsjyW/LvAfhP1gSQXlNd6DPXr6Dy0MBHpPv96Sh+UkMzWyWElPd7N1s2N54Hch7UeFvVZosLgcFIll7JHag3E02oz4UF9dr9UVf9gdrpW5/sLjzLtkEGNAI2zE4SYNl9cFpKDqFCY66fgf4fhT2AGtaESX+UuYlZYmlLqQMRkvHsofYTAGtN5DcG1Ski27y8fenbYAaVPsKCVDr0xw9As8tf+I0qq6mAnVnGuXIgrqJKJwjrw8R7fKCE+NeVrVmRsFIYKjF5H7SweIWbf3IfXkOlEkNz474cQHGociJHDSihUNKSvx+5tzstZjKOVQ/f3FzyRtpq7J3C4dwHc81G5cYBIbLgqf6EgHfNkdZhZuMLJb26efJgC0KxSAuD0kal2dSrHPnUv7gojTOwrMZNZ6nq4HoFp2W+os7GpUOEJmN8bIVaEkGpWBVwm7kdP26k1EnZRIRr1KQwY6MqXxtQjLqcWDrQsfCtOLPMP3eHZKbq4gUWVepHCp0CEOv9C0fCOKGE/mF46eX7IaQak4cQGNCxZd6czSGGxqWZed5n7an1uH3TauUQK/jc3F15qbDQxenjkHKlHo4vY2iU5LzqJNVcW+alFcyZFFkE6GN8C0r/rHnq4sC9SgMVEf8sHsO
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(346002)(136003)(376002)(40470700004)(36840700001)(46966006)(2616005)(82740400003)(70206006)(110136005)(426003)(478600001)(70586007)(2906002)(356005)(921005)(86362001)(316002)(81166007)(8676002)(41300700001)(47076005)(82310400005)(6666004)(1076003)(186003)(26005)(7696005)(16526019)(4326008)(36860700001)(40480700001)(83380400001)(336012)(4744005)(8936002)(36756003)(5660300002)(40460700003)(36900700001)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 17:10:34.8665 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a9a75f-de33-409b-f492-08da928635b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT106.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6582
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Here's enabling software signaling on fence because
amdgpu_ctx_add_fence() is checking the status of fence
and emits warning.

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---

Changes in v1, v2: This new patch was not part of previous series.

---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index afe22f83d4a6..21221d705588 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -730,6 +730,8 @@ uint64_t amdgpu_ctx_add_fence(struct amdgpu_ctx *ctx,
 
 	dma_fence_get(fence);
 
+	dma_fence_enable_sw_signaling(fence);
+
 	spin_lock(&ctx->ring_lock);
 	centity->fences[idx] = fence;
 	centity->sequence++;
-- 
2.25.1

