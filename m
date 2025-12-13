Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F53DCBB2D4
	for <lists+dri-devel@lfdr.de>; Sat, 13 Dec 2025 20:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9882610E462;
	Sat, 13 Dec 2025 19:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QDU/FPdw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012056.outbound.protection.outlook.com [52.101.43.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068EE10E462
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 19:45:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjPGSCZHRbGmZPssM/qUkjfTs+OR+Yy2LIRr2tLs+0ZRwg4iZOI98rLEHT33UK9KVEnH9ErJAJoW7pNbGUglwqH4jGszmOzGbWGbizgyg0wIws5szo1XAVBIAyiMvIPJ6ym5SAMQobUoIWhU88HWR5sska7YjL2mIoFiDJDx8bEWPA5QqqbcShDb/4qbBpCT74Z000En9/XQKRhtNUquCz2gbemy6COLJ+n7gYEPV3OjO7uniqnTT061ijDC+xLg0kYu+iEQTCzmn1uj6DPTDNqu9x0Zrcb7yBiZk5qa2SWuuWEjnjGF1ageG+9ZzithyE1grvUteWY7p4r0UuJIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ccvIl+To6yyyvujCSMr/GvsT+sPyZwGEVCtg7DOAX40=;
 b=u96xPDPJukHXxpp2pP85gWUqFC+UzndsG9p2OkXnpJQVDKpllYjzmCAJ936MbzJLxuvjCl3yCvaEWzHx13Xnm7uPrj5OxCj5hKexX7YZoHFk5u2USGpBEaXBhMgxmgmpiQnI/8aIYn1UnZoOJ7n8kvtRnTfz7rITWWAPffCKwQuygcXuhIZQVaxi8WQhoUAMOVSdfa+Rc0kcCz3AaCnAPazZPjbduWIwOa8ZbPkBTdCuUgT0MoNMO6Apzi9buLMb9XKFw5ItAEmKzQvREsrQf+aZ0GM//m+c7ZQt2rdZobdbassYDpV61+KFWjSd8exhRPGlGQ2xuk913SN6mTGDlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ccvIl+To6yyyvujCSMr/GvsT+sPyZwGEVCtg7DOAX40=;
 b=QDU/FPdwjm+KCShXUejtWancmLSCEc3BzwwnbKyYfyRGUgJkGGl4OMpevdTB5RzNbVyjxNoAd51KrrNr/LNB5Dfm7XzKyvyGihabBgIp4+ggvHkc6OHt851OcCMKhk9i6AvHoNeaJaq2m5QlUxzbGHS0J9HNKDrGXrIKHADVykU=
Received: from SJ0PR13CA0163.namprd13.prod.outlook.com (2603:10b6:a03:2c7::18)
 by CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Sat, 13 Dec
 2025 19:45:49 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::7b) by SJ0PR13CA0163.outlook.office365.com
 (2603:10b6:a03:2c7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Sat,
 13 Dec 2025 19:45:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Sat, 13 Dec 2025 19:45:48 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sat, 13 Dec
 2025 13:45:48 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sat, 13 Dec 2025 11:45:47 -0800
Message-ID: <bb8065d2-7ab9-ac1f-cb7d-81cad9a2f7c9@amd.com>
Date: Sat, 13 Dec 2025 11:45:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/amdxdna: Block running under a hypervisor
Content-Language: en-US
To: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 <mario.limonciello@amd.com>, <mamin506@gmail.com>, <ogabbay@kernel.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20251213054513.87925-1-superm1@kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20251213054513.87925-1-superm1@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|CH2PR12MB4133:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bb5cf09-932a-46db-4526-08de3a803741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUJ0aE14U2wxUW1VOTYxdmJLQVB4TE9sSjNQZFJDejMyWTZieWVmdWhzQU5M?=
 =?utf-8?B?NjNsZUlZNHNENmxubU9POU1YeUFXWVZVZFhrcXFib1VjdEwzbFVuczhTYTVF?=
 =?utf-8?B?WlNUYVFnOXprZW1nV0NZMTlOSTdtalNNQlpKcWRHQ0hLY1pjbm1VVlA3RHk1?=
 =?utf-8?B?VTUzOHMrSTFwSjkzUmpqQXFiaEM1REt1T25ZOWpLMzFQdGVUT3Vocjd5dUZr?=
 =?utf-8?B?cS9sM0Y2b3l5UGN5NlE4a3hEaVIwbjk0dXcrRFg5VWJsK0hJV3NLTDRXWU1y?=
 =?utf-8?B?M3d3L01GNUx6bVlNeGxmM0lFQUJtWm4wSGJnYjNjR1pwd2RlZzRiajhaNnJx?=
 =?utf-8?B?YjdEUnFvaXR2cFZERlFweE9tb29TNzhaYkVGOW15ZFRjcDhkdTRDb2ZDTXgx?=
 =?utf-8?B?dlFLeitRV3U2NEdHV1Ewajh2L0dsQ1JyZHhOT1V2SlNzSlpTTStHYnVMZXRs?=
 =?utf-8?B?U2lETGV5NGlBMElHbm9xY1JCSGt2VHNPZlpuWmRNVkhzMk9OZG9ZdmNZZXZ2?=
 =?utf-8?B?TnFOZG1FdmI1WkpNUkNPbHpmd0s2YjgrbS9LZ2lrTmdjdXJYYksyT0Vaamo1?=
 =?utf-8?B?UG1Wd05aTTc4dFR3WGRqRjIyL1pXT3plVG0xeExHV0VYSXF0T0p3RENxTDcv?=
 =?utf-8?B?QTFGQ1NWL2h2dlAwZnNJK09ybllsWCtBNzN4QlQ3dFhGVVhzdFNjaTR0cThq?=
 =?utf-8?B?KzZENDN2WSthaUZLRmZXeGtjanFqQk9pTzh3ZytnRGxJS3picWpnZGw3elcr?=
 =?utf-8?B?T0VFb3loRloxamdVYmw4aE9IMjA2YWVLVUdlcXV5NS9pdWhGQThSblk1Sk1X?=
 =?utf-8?B?a2ovWk1MM2hOb2dvcFlSMnhFMzNsVnE3cDR5cm9sZEpBeWhYMi84VDA3bVpn?=
 =?utf-8?B?am9OM0NnL3psNWdlcTEva1lTTDVCeXluRzY4QVV3T09yYWNVM2QxVnhnS084?=
 =?utf-8?B?NGhpN0FFSTlkcVdFQjRGcUpCS253WXRHWUFaYmV0blpzT2JybHJKQVY1SmNY?=
 =?utf-8?B?M2sxdnp2V3E1SXNNTjZpK3Y0NE5pL3RCS29BenRMdGNwdHhCVDVjdVNkalZa?=
 =?utf-8?B?d0hVa1F0TXZVR0ZXVUhvMGo5UGl1VThWUzA0S2c0OWJXTWpFTUltZzR4WXJm?=
 =?utf-8?B?VXBEZ2FzaklQSmtzTlorUkVtVHByRDJHUGduZThDQnNOWTJuVk1NMmZ2MTBz?=
 =?utf-8?B?eVJXMlFVZzVUNzAwdHpIZ1JYaWxWejBYYVVrN3psb29LVW0vbERvK0JYK3U0?=
 =?utf-8?B?TkpkeXd4ZnA5OGt4RDAxQ0NnS3VPZ1huS1A5YXlxWHRiY3NKeTZsUnVrSjJH?=
 =?utf-8?B?NHBNbGlmbFNWUWd3MTA4SHFFdXBzOGVUd1BncjlTdVRQOXE5dTBRWW9TMk9N?=
 =?utf-8?B?Mk5CdEErVzNtc09nSlhuOVRyUXo1QUxHTngvcmNDZmNFSWN3TktCc2Uwenp2?=
 =?utf-8?B?UWNYbTl2VlZJbDQ5L1hSVXhNaEthM3VUbjNReEREMHhRNDhIVzV5WDNqd3BI?=
 =?utf-8?B?elZid2VRN1dQaGg1K2Y2bFQrSDZpTWNmOThuTVd6dk9NaWx3K0NUNWtXM09o?=
 =?utf-8?B?NXJoVkkxbkFYY2VuNHNvTDZPekR6RmczRzNCRHRYSnFMWERDYlowUUlkcnBI?=
 =?utf-8?B?cjhUNkNMOWtJRWJjbm91QTdsN1JxVmlJc1ZyVllERFlrckpCcGVCdVBFelk0?=
 =?utf-8?B?OU9FeTFraUtRUnRsN1lBcWtneVdrdW5mMjlTVi9QaHlYd2tYM1VBRjFlbHoz?=
 =?utf-8?B?NXcxYngvd2VsenBHeHo1NlJRZWpzaTUzQkxtQUcyL1J6TGhCMFBicVhSZDRQ?=
 =?utf-8?B?R3J1T2lXRUhzODJpdGtMSkRKYXhrek0zV213c2NRKzBnL20yNGpTRklsN2NB?=
 =?utf-8?B?S2VvdHRUdWdNaEVWRms5MTZocmRySGFlNDE1ZENZMmZ0Rkh2QTBmSkdySGI0?=
 =?utf-8?B?QlZCQzIvb3B6KzRjS0c2bndhN3lTODBoV3dwT1M2dDVOYVZxNmQyM3R2TVpv?=
 =?utf-8?B?dUM2QmkxS0hWd2lFYzl4b1A2Q0J1cGw5cXJEbjVKOGgxSDlPc2FWU3JwRVo5?=
 =?utf-8?Q?jh7qce?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2025 19:45:48.9104 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb5cf09-932a-46db-4526-08de3a803741
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4133
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

On 12/12/25 21:44, Mario Limonciello (AMD) wrote:
> SVA support is required, which isn't configured by hypervisor
> solutions.

Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>

I think it is because aie2 can not load firmware in hypervisor solutions.


Lizhi

>
> Closes: https://github.com/QubesOS/qubes-issues/issues/10275
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4656
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   drivers/accel/amdxdna/aie2_pci.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index ceef1c502e9e2..d892b412e4c0e 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -17,6 +17,7 @@
>   #include <linux/iopoll.h>
>   #include <linux/pci.h>
>   #include <linux/xarray.h>
> +#include <asm/hypervisor.h>
>   
>   #include "aie2_msg_priv.h"
>   #include "aie2_pci.h"
> @@ -508,6 +509,11 @@ static int aie2_init(struct amdxdna_dev *xdna)
>   	unsigned long bars = 0;
>   	int i, nvec, ret;
>   
> +	if (!hypervisor_is_type(X86_HYPER_NATIVE)) {
> +		XDNA_ERR(xdna, "Running under hypervisor not supported");
> +		return -EINVAL;
> +	}
> +
>   	ndev = drmm_kzalloc(&xdna->ddev, sizeof(*ndev), GFP_KERNEL);
>   	if (!ndev)
>   		return -ENOMEM;
