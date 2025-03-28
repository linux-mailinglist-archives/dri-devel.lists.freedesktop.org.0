Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D72A75133
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 21:04:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F2D10EABC;
	Fri, 28 Mar 2025 20:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p64qXXd+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2067.outbound.protection.outlook.com [40.107.95.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BDE10EABA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 20:04:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/cKIil8QRS9dvvEoPazprygp+RKk+gH88rGVPTL95CjQOp3t65ZRRALBeBD/g/HdUo5hbKzjW3ZsoPbpue1tabN+qwDiS1YzcoxB5mOhc2w7VOE1DvHmVN68XyZQmWFlDff1ScCU8YaYxCdgc66s24k6Qlwd5L4vhoKmzU1+qzW1FV0ocZO+dmfJSPv8e0/5rh1nZirGLI6Ce/6INjwrVW4cNm4eAap2G8DuptyxZ0DN0fgcIhSpWrwPWiwli/VJZJbXs0fSjQncxSt/LDqPV4PpSag8/s8/A0CDQSsoyEYf7jzIKdJfPdfpB/tVth+7xr2/XilB3TbpxQDsG1r2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hUALTFN2Eppfgfref6kFRFekToq8pt/EpX7dVKINHg=;
 b=OoJIKJdiVjbvRn/T870UEdz5S8fjHq6tNxjZHJTPO7/BxJUhMOUDpx6HF+DyHrcrXDo50islWIdC2v3v+U/SY7U8mR/BJ2QOAqcYxxdOlJFkTydFoQ1NNIUFDPATta5xQ4Ey9efA6x4LQkvFYzdoIM1ScccF8dZLh7hqim3eJiQTBHmOct2YZalJNweU0o7sAU3RzlNoJMuiI8GqJyzvB415vlGexyRF09WsVRXMMNMHyXGxSFQa2hUkNBfCU41JtpBxHzjf5shCXHUO/4OkDPUwRfRF2lhOFgo1XfsKGs3DL17PCE3CpytiH8HQZGV03La5M0NBWIdVt97PELuzRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hUALTFN2Eppfgfref6kFRFekToq8pt/EpX7dVKINHg=;
 b=p64qXXd+Fa0th01hobsFF+riHRrjmgdKBm8f1c71WGt7hSu/6x8EUaoJYulgHdk1hbylisC28MiwygJxhvzuMWMvh4e4CjR9fTs1F+HdKYLrB2pB99FJ2ikm7eU+Kamu4j2EiKVipHK/IdmTquUh+aCXjrBIyBJrHqrX0C561MM=
Received: from MW4PR03CA0340.namprd03.prod.outlook.com (2603:10b6:303:dc::15)
 by IA1PR12MB8359.namprd12.prod.outlook.com (2603:10b6:208:3fc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 20:04:43 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:303:dc:cafe::50) by MW4PR03CA0340.outlook.office365.com
 (2603:10b6:303:dc::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Fri,
 28 Mar 2025 20:04:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Fri, 28 Mar 2025 20:04:42 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Mar
 2025 15:04:39 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 28 Mar 2025 15:04:38 -0500
Message-ID: <93bf01cb-e9c0-1091-d8bd-0ab6c666067c@amd.com>
Date: Fri, 28 Mar 2025 13:04:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3] accel/amdxdna: Add BO import and export
Content-Language: en-US
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, <ogabbay@kernel.org>,
 <jacek.lawrynowicz@linux.intel.com>, <mario.limonciello@amd.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20250325200105.2744079-1-lizhi.hou@amd.com>
 <8e8a2de5-14b7-420d-a80e-69422d43ce3c@oss.qualcomm.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <8e8a2de5-14b7-420d-a80e-69422d43ce3c@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|IA1PR12MB8359:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d257a51-6971-4a9d-aaf3-08dd6e33c77e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|34020700016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MW9wNUpYVVJTNW1GQjhST1pDd1A4KzlDcHZyOWZZbWprVlI5clVKQmROVEhK?=
 =?utf-8?B?UTRVWVRidVJNYlFrcGREYkI0TlVwYWZ6UHdDNFNaSzlHNkRYN05NU3FBeWRT?=
 =?utf-8?B?Mmt1d2UveTlHZThNbks3N3g3a1hySU11WXBLY1B2N0xuWUtUTlJZT3ovcjhE?=
 =?utf-8?B?RWNoVHUzMmI2eTFsOG1FZGV0WEc5c3JORXZEbVF0ZWVSZ2poYUVOd0tKa3o4?=
 =?utf-8?B?Tm1ScU4rU0ZwOGMwRG5SbWg5M3lVblMraTBCbTJOK0pGRmo3aXBRbjFxUGtn?=
 =?utf-8?B?L29OQmVKdjN4dS9JdGQySm84K21UY3VXbFo0VWJnM0FVcEViZ2lSZnpySDgz?=
 =?utf-8?B?S2FrcWdLcjJ1QmJHM2ZFT3RINWhKNTJYeTIzL1o0MHp0bXlNeFUwZUFieU5L?=
 =?utf-8?B?eFZBeUx1V05uSjNZdS92UUZqOW5hUXRXVGpySjA2V1FPSTk0OTB3amlGS2Qz?=
 =?utf-8?B?bmZNNTM3V0VWZGV3MFlHc0VEMGYwaHROL3RiVFJCZUwvTmxlUVI4WTk2S0ZQ?=
 =?utf-8?B?ZitzZW1KdTl5K1d0NlhnRTFWY0hSWXBFekszandLb0hlU2dlSURxeHJ0Ujdu?=
 =?utf-8?B?MkhPVy9EQ0dMNVNLb0ROWThqUHRrS1hyazRzcHJqdnZob1d5K05oNU13QUM5?=
 =?utf-8?B?YTdHeVNIaDgrQVdjVDEwTXcwSG5qcWFxRzZydTB0UDE2SjAxZmtlbVk3b252?=
 =?utf-8?B?NmptMnBBZWlPY3pyQmZKbHJ1aFliSWVTUk9LaE4zMUFuQm1aRllrS1hZbWhj?=
 =?utf-8?B?OVh0ajVTaUJyOEtzTE9vaXpQd2MxZDRmd2duVUtTQlE5MGs5UUZJbDNadWlO?=
 =?utf-8?B?SzJjSyt3U0hjSmVyQ0hSaktkTlhZdDJkakFQR0lyQmZIUHVuN3BNcjB2REwr?=
 =?utf-8?B?Q3E4bFJQZ2JqN254RVVobE1sUnpLclhybE1FRXR6UkZnR2JTcDFwUUtDSjJX?=
 =?utf-8?B?QUFqMkpHSWdzMDl2SWg5aGJBSTlZcVpQQlVNRy9hMUptZm9TNiswNEo0Y0Ru?=
 =?utf-8?B?M0VFQVFTUEZnNW9YZHk2ZnpiRFdqWld3djNRUFhOT0NOaTRGbDBxVGFlVjNG?=
 =?utf-8?B?RE1MUGNwWDdMUmlWZEhJS2NIUzdWa0RWN1FQaFcrUE1JRllreG1oaWJrMXNj?=
 =?utf-8?B?S2tYSk12d3hjaWdCaitqNXYvRm15KzczWlM1Vmg3WXlxcWtRNEpGMGl6N0U2?=
 =?utf-8?B?dzQ0aVVGZFhrZUEzeENKajFBb1R6K0w5dzJld2NSV2FjTTlSR3NWVStOSktR?=
 =?utf-8?B?MW5pS0FLN1JiUm5vaktRVGdaWExCOE02OUJzRnV1RmNqMVVOQnRZOTNYZnU3?=
 =?utf-8?B?OHROQzZhU3dSOFNuWGNYYkFIZTdsS1JrcWdjOGhXRlB3RTNRRmd1SnpaVFR1?=
 =?utf-8?B?U1lYTi81a3A5d3VxTzN1ZzYwNlNxLzZaS1dNdmU4K2ZXVzZtaWRxa0t3b0xZ?=
 =?utf-8?B?NWFLNGNNcGRiZjlnM3JvL3NvVkJqc0pWMHNwTXYraExiN3VXNURNUzJhUXRI?=
 =?utf-8?B?djU4UTNFdWRPTGxJS2k0YXJheElPV3R3cEVEbUJJak1lUGRpUGFkT0Rra1p3?=
 =?utf-8?B?Y2Z6endkcWhmRHVyRXFlZGFLYU5BVEZPa1d2ZGtoZ2lRR1lFa1BJSVdxbUFS?=
 =?utf-8?B?SG93cHVxVjg5c0w5MUFIOVk0S25SelFpclpUdmV2dkY2NDUrN1lLWlhKdEkv?=
 =?utf-8?B?bW5Fam9FRDZHeGNkZXRJanpaam9TcVpOZm81UThTdG5VdDdVdWxpclZZc291?=
 =?utf-8?B?ZzRXd3BUcXFCb0toOERQdll2dVJna3dJdFNwWU90U1NtTytXYkRianJaVVZr?=
 =?utf-8?B?Uk9UQitRa3pkbHJJYlBzVGd0YlFOekhHdHFsOTBPVk1zVWNwMTZTYUNvZ2pu?=
 =?utf-8?B?cURNcnNZTWMzbitvajJvcmR6VWlPYk56NktuUy9aQ2t0Z3JyU2ZrTEUyL2wy?=
 =?utf-8?B?MW44SDZwTWNrQ1ZvUks2QXJLem9MeGlKQVB4bXFUUzZjZmFlcFAzRWlsWWxa?=
 =?utf-8?Q?H49p3mf600A0pTsZxQOiOom9jkTXgs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(34020700016)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 20:04:42.4270 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d257a51-6971-4a9d-aaf3-08dd6e33c77e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8359
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


On 3/28/25 09:16, Jeff Hugo wrote:
> On 3/25/2025 2:01 PM, Lizhi Hou wrote:
>> Add amdxdna_gem_prime_export() and amdxdna_gem_prime_import() for BO
>> import and export. Register mmu notifier for imported BO as well. When
>> MMU_NOTIFIER_UNMAP event is received, queue work to remove the notifier.
>>
>> The same BO could be mapped multiple times if it is exported and 
>> imported
>> by an application. Use a link list to track VMAs the BO been mapped.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
>
> I think this was just a one time glitch, but please remember to 
> include a changelog for v2+.

Thanks a lot. Added log and pushed to drm-misc-next.


Lizhi


