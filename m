Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DC09B0BEA
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C4010EB55;
	Fri, 25 Oct 2024 17:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xf4Q4om+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9775110EB54;
 Fri, 25 Oct 2024 17:41:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ukm7rAIr2Z28zWfDil+iECPeI2+tc21mDv18dhnqC+VcaySMdOlW5Ggq4+uucFbxIDGteIDeP4hG6//ycGEIEdlkbi7NGA48fBd4fZZyLSsIBuHAaZzAnVWBAiAbvEfGpf8hh0yCtFLAbpHVWFEkFtJhrXhqFQ5W5m+NTSw8niUkpm3jnWBXrLgGOq5ze2Ofx7y4aYiZWC5MnDROJA4S8J+D30Vq634J8lztOg5bVwpvCRtGcQ0kGINuw0D33RPCc7q6hECGm1s0xEoJ6gUUbqhQO8A35xRzPK2LQphbk1UtoY69MR8hmaAA58aipydje0ypU8wMQpHYyMvD7vVPvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4weBKfUljWWqvtUCgP7YQhJdCk37bAmVCvz8c6wnkok=;
 b=kyX6oWg2G+I6rLeRBU8nNc3KiCYnivUBHhgHJ6TJLvb9lDtQk9XFOtn+0YVBNnzblTRUvyqrtre6Gu8baLPUe8mY85q5WAsBWctmeIrrPoBAMgWu771Oro2M3IoWyA/5Z6fhXyg3zH8m4jQYpCjaXQqp2AGWaeyevBnND4uGoVnFVyTknmGdzlpIn9laAWknt/FurzKC0JNcYEHp60S/hbYNZ8UMzxzp5u82KebeDmMsTeV6lhec7Epd1s84Ei5sL4C6Qy1pUPHu/B5wRoHNPe4SP+IudsKc6DVe2jeUrCXm6tFjO5fUha3xJVotl0FzlOMs3uFeHSAn3Vw1poEOpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4weBKfUljWWqvtUCgP7YQhJdCk37bAmVCvz8c6wnkok=;
 b=xf4Q4om+JKF7NsTUCRy6yNv/tTZz/Sey+LLQ20iBMu0kCwath+aTztW/VNufTTp5UTiAkZjuSUZz0vJHU+IGtwfu+WEibmXBp4HLuSkFvAIRBpHX+Dfjc2fCceWT2FCC2/GejM1fdY5tFrvYCkoZYbH6Xwn06AKH6HhliMp9IYs=
Received: from SA9PR13CA0088.namprd13.prod.outlook.com (2603:10b6:806:23::33)
 by IA1PR12MB6580.namprd12.prod.outlook.com (2603:10b6:208:3a0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.19; Fri, 25 Oct
 2024 17:41:44 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:23:cafe::39) by SA9PR13CA0088.outlook.office365.com
 (2603:10b6:806:23::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16 via Frontend
 Transport; Fri, 25 Oct 2024 17:41:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Fri, 25 Oct 2024 17:41:44 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Oct
 2024 12:41:43 -0500
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <tvrtko.ursulin@igalia.com>
CC: <Alexander.Deucher@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>
Subject: [PATCH v6 0/5] rework bo mem stats tracking
Date: Fri, 25 Oct 2024 13:41:08 -0400
Message-ID: <20241025174113.554-1-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|IA1PR12MB6580:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c98469e-1538-48d0-b101-08dcf51c4b09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0pkdWRvc3VLRzhKQTZlUHRJZGpOd21HZ1EzT2UyOHNDdW9SV21nZUFYUXFa?=
 =?utf-8?B?YnI3R2ZhMmljM2grc05DR0J6QW5HbWJnNTMwVE9wT3BVL2VQRzBiZi84eFFI?=
 =?utf-8?B?Y1ZuK1VtK29JNlhSamV6SGhiU1piN0VoUlFpVjZIZDZUQ2JvcEJLeHlxc2pi?=
 =?utf-8?B?N0NTSVVkUUhsR1FNd0RWeUVJMzNpaWtqNzgrcTBUMVZIY29TMXNqWVQ2YkFz?=
 =?utf-8?B?bkQ4S0N2Vk0vSlVGZDVObUFaWEkxY1luVkkweHVBR1ZUM3lDOHdoSEFRZHNv?=
 =?utf-8?B?WGxFRmNrSW1lNUJOT2FUUDhBMU5MTGFPU2xhL29JZU1UV3pBOUhyM2JBckRh?=
 =?utf-8?B?VmVUNFptMlZ6N2ZqYnhJRW8vYmMzNmVTcVI1YXg3UWxwRUxFSVlzUGlMNGdV?=
 =?utf-8?B?WUovdjZPL2NqamZKOTFWVEh5dmQrWE8zNDJzNHNlQVV5bEJacVZFeGhxZDdq?=
 =?utf-8?B?RlN5Q3N6VUdJRkhmd3dUNHF1Yms5RlhGbk80eVZzQVVnME5MeVphZ2RiRlh4?=
 =?utf-8?B?Zmp6dUI4d3ZWRERMNXVVcWxidE1Wai9wTHFsRG00RFVFZHFidmlPaFIyWXEz?=
 =?utf-8?B?cjNFa0hscG93cEVJK090MlZrTGRrZnFoZkRxR0w5VmNLeUpzYWZwUEdaU0Yz?=
 =?utf-8?B?SHdNdkF3YzZoSm05dFhmMld4bWljbzdoUzFaYzY1N2xTRWdweHdYOGFlTlQy?=
 =?utf-8?B?N1dTT0FpZmF1dXphT1VobEE4U2FZYk1UZldDd0xqRGNGNldDa3hDT3QrN3Ex?=
 =?utf-8?B?Kzk2enUyeWZLcTVOVHAyUFlGTlErNDcyYXRlMThqVjBHUFMwQnZNNnlaMUlN?=
 =?utf-8?B?L2MrcXA4SW5QNjZ6V0RHb0hyR2twSkQzYWFORmdlZkVUSmxUVm0wRmJyaDZE?=
 =?utf-8?B?eWZzUDRkYmtLRFA0QWU5WEJuN1hxdS9IVGRWbjRteVI0QzRNV1BvODJJVFdj?=
 =?utf-8?B?cnp1dDFDbHFRMndnaHNLcHFIbktGaGExdUxTSDZJYktiT1BqYmg4aWFxaklW?=
 =?utf-8?B?dHE1cWxrek5URXl3QjNkTFNucGtwU05BUnFSK1gvVHlsVGl2d2ZmNFZiS0Nk?=
 =?utf-8?B?elhhMHJoK1VDOXJtK3NtRjJHWHp5bVhnWlFNRmNCd2NuMkZ2ZW4vdjZvZlpx?=
 =?utf-8?B?NmowdkxUU25PYWVjclJUd3BZTGpzTlVLelZ3U2lEbldWWXhPdHI4Wm9yaGtC?=
 =?utf-8?B?a3F0TU5EZXBoUHgzV2FhbDliZDNiZjB3ZmdaMGRHNHBCTkl0Nmh5bkczRnpq?=
 =?utf-8?B?andYNkZVQm4ydmFrd2d4ZFNacmNKMXBLcWxkZUJXZkdWZmV5QXB3TGg1N3VO?=
 =?utf-8?B?Y2ZJaVNSQzJVM1kxN3ZjUS9LUVFiSGo0RnJrQjVqM01uZmV3bDdPc1RnME8z?=
 =?utf-8?B?cjFiQ1hxaTF3RzMxMWplcmZwekFoVGx3RUVYSGpYRWMrQlM0RU5Uc1NVejhq?=
 =?utf-8?B?RjZmNnRldENraEpDSTZKaHU2cmhUaWFFeGpkQndtcEJtT0JOQjZtcXRBUThK?=
 =?utf-8?B?bzFYT2JiM1Z4c2RQenk5c05jR3ByM0s1Q215N3A5ZDRGU3U3SjNtUEZ0Ulhm?=
 =?utf-8?B?V0J3ZlpIQ0ZxVnJ0cGJDS3NMQ0tia0oxdXRDQkU4eTVtOVRHRW1aZFBSaHRH?=
 =?utf-8?B?MXkwV0JFNTRMaCt3L2d5Q3lMT1VHenkyYUxSNXZYc0hqVWRlOCswMFNBdmo2?=
 =?utf-8?B?NGI3NzF3UTJBcHRTVVFlTSt2ZHY2WEpxYjlKTDExOHEzTUFTWDAxejc2am5M?=
 =?utf-8?B?WkhuOGVFZHEvSWcvazVldTNCcGhqYWVoVlk3c1dWQTdBeWh5cjJLai9iYWpj?=
 =?utf-8?B?SS9wZS9OVmZjSlNNcGZ1Vlpya0R2MHZxMldnblRsRkxCRVlxdnJDSVNiSmJi?=
 =?utf-8?B?LzhMbWxPSjFyRER0ZjRPUU8yWW5mZkJSWlhreVlrQzRyMnc9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 17:41:44.5646 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c98469e-1538-48d0-b101-08dcf51c4b09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6580
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Right now every time the fdinfo is read, we go through the vm lists and
lock all the BOs to calcuate the statistics. This causes a lot of lock
contention when the VM is actively used. It gets worse if there is a lot
of shared BOs or if there's a lot of submissions. We have seen
submissions lock-up for seconds due to fdinfo for some workload.
Therefore, rework the implementation to track the BOs as they get moved
around.

Also the visible memory stat is removed to simplify implementation, it's
unclear how useful this stat is since kernel map/unmap BOs whenever it
wants to and on a modern system all of VRAM can be mapped if needed.

v5: rebase on top of the drm_print_memory_stats refactor
v6: split the drm changes into a seperate patch for drm-devel review,
fix handling of drm-total- vs drm-resident- and handle drm-purgable-.

I'm currently stuck on drm-active-, I don't know where would be a good
place to add such info, especially how I could remove a BO's stat when
it's fence is signaled.

Yunxiang Li (5):
  drm/amdgpu: remove unused function parameter
  drm/amdgpu: make drm-memory-* report resident memory
  drm/amdgpu: stop tracking visible memory stats
  drm: add drm_memory_stats_is_zero
  drm/amdgpu: track bo memory stats at runtime

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c  |  23 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 119 +++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 193 +++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  26 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c   |   1 +
 drivers/gpu/drm/drm_file.c                  |   9 +
 include/drm/drm_file.h                      |   1 +
 12 files changed, 230 insertions(+), 183 deletions(-)

-- 
2.34.1

