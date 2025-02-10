Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EF0A2F377
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 17:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9253510E0C7;
	Mon, 10 Feb 2025 16:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MnJf4a9q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4E110E0C7
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 16:28:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r4tBYnRdoe9SkWcYQMPmieT1/Yi8fNsE28QwyVgBQpWr3TjpLby+xGRmblzes8xU7buZAU/FSfhkjrpLmBM5+cXeKmuGIfubpg0jzgC50nAq77RsSXqhnrVOC16pmLiCdb/mfi/cSKhrJD1zoqRJCWZmdUrylLsFf+Uj+M1FvhHHYjuzMga34jj/+ypyecmNED60jGsDhxzIWtX5dC8Kr77I49QuzHR5ACK6l4d8mxDU22swhwwCz7u28UuxfAsjUd5c56+Th1XNWHFXEjIp2BQd3nXNN3sYIuNS8juxbS9ZjGNYUzmWgOi1wX7uwbaVPnCYnmQJun74gTLZ0Augow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3LByvb98fsUobWrB3PGXb6hpWBsaplH5Rylt5+IdJk=;
 b=uGG+zXfIim0FUB03FasX2q+lxsKdE95Ew25W8UGdcag3o+Ls9xHDSL+wWLK8nzfsjxqzFLxZ2ekURsegfHI0qhG0noIfLU2ZfjtL/K81vaACAJsNlRnR8I4x7ld6vbxC2Pn34/bPqAK6bsOkGOhUff6v1VTg+qVNSzKfwhvYv6UUL8uqdRW5dUQfB3arYlscRMHsBK0sLDpuV8WYAWzSci+VbUSkJJ6+ZoQy/v6TLvWsRUv54Iz67IGkTFHgH53/HaKveLAoMvX8M5sx2a5xpibJ6UsXRgfcUANOqLw7hDTGBzeVN+h1iPvV3S2dVVwMge0DBPZpHbon//0X0G/NgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nfschina.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3LByvb98fsUobWrB3PGXb6hpWBsaplH5Rylt5+IdJk=;
 b=MnJf4a9qu93M31r0bxScphJhJyX1UYfF3fRQT7eWGP3Le/CRxxG8KTr4ST9WDd1GGM6CtAtdXe9zalwcImbbRG2TQE6K7NGa7zyjJu8G6hljH2eYjs+dKe8Wh28I7mGYZQZcx2sGBjQ8UhXe96NuzeWIGXreI2QcaELOnkOsHUA=
Received: from PH7P221CA0054.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::34)
 by DM4PR12MB6011.namprd12.prod.outlook.com (2603:10b6:8:6b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 16:28:43 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:510:33c:cafe::4c) by PH7P221CA0054.outlook.office365.com
 (2603:10b6:510:33c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Mon,
 10 Feb 2025 16:28:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.0 via Frontend Transport; Mon, 10 Feb 2025 16:28:41 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Feb
 2025 10:28:39 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Feb
 2025 10:28:39 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Feb 2025 10:28:39 -0600
Message-ID: <0db60138-2e9b-1ccb-9c0e-1b781f19ebd6@amd.com>
Date: Mon, 10 Feb 2025 08:28:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/amdxdna: Add missing include linux/slab.h
Content-Language: en-US
To: Su Hui <suhui@nfschina.com>, <min.ma@amd.com>, <ogabbay@kernel.org>
CC: <quic_jhugo@quicinc.com>, <George.Yang@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>
References: <20250208080548.1062441-1-suhui@nfschina.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250208080548.1062441-1-suhui@nfschina.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|DM4PR12MB6011:EE_
X-MS-Office365-Filtering-Correlation-Id: 81fd1023-8b68-4fc3-6f5c-08dd49effb53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aCtUNXBXUDdFcWJ6eC8wK1IrcDgwaDBQN2JQWExvTElCN1RCUzZSblFFMlEy?=
 =?utf-8?B?a3JZaEdVZndHbjVOdzVhQkJhbUlSNThmM053NElaTEhnWnNDR3VBSTU1L3ho?=
 =?utf-8?B?SWZEZnRlL2FlL1Y1czZRa0JQMzlIdUw5THkwRW1Xd2NxbjNrbEt0elYxZysz?=
 =?utf-8?B?dDV2R0ZxcllKWHJYWnU2ZW1raUsxaXdwK21nZE1NcEU1eUtCdzZOakJaMGp5?=
 =?utf-8?B?OXFBMFUrWmUzaFBTQmg1S08vL3NDM1prOGg5UlpzN0pZTG0wdGtMbkNMcUNB?=
 =?utf-8?B?NHJwRDNJbkl0TUlRVjBpQXhVMURtV21XdXk1OFRNc0xTQTBSZnJ1b01qYWs5?=
 =?utf-8?B?TGRSNW90Ky9VTWsxKzU4NmVuanhsMzVvUUdjUlIwK2xpdmdqWEFQNlZUcU5E?=
 =?utf-8?B?U2w0RVllQVR0NG5XaW9zcmY3UzY3QVZ6SWMvQUF2N0wzeEFvK3ZReDBWUm1l?=
 =?utf-8?B?UmRITUd0V2hVNVZpZFpIeG1yTlJ5b0c1d05ET25xWTFVeklqRjhmd0Y1aWZR?=
 =?utf-8?B?dTUvVDhkTUlSNkZ2UzhBZm1tOCtaejRPQzJ5NDF5bks4VVdVdHNZMm1CMThE?=
 =?utf-8?B?MTFNbnNTcEpQK1pBdGNjMmVZV0NXRmh0TUNFd1QyQWRVTytFUWkwaE8wbEdQ?=
 =?utf-8?B?WGs1L0l1U1FUMldmSHJlS3RSbkM0QzhIQmtEUDZ2cktwWGdETTd6Y3g2d2o0?=
 =?utf-8?B?N21OTkxscUdFemVCRCsvRUhZbU9GZGJucXBvMDBhTTBKRTkyL3JLMTdheUJk?=
 =?utf-8?B?dnNDSzVrODA4Nk9KQ3I2MWdZbHNpOHFsRmhqUzUwZm9uc0hrS1N1N1Y1RGlt?=
 =?utf-8?B?cjNoRWxxRWFoZFVaa080c1c1M0J5VVdodE9vR0RmSDFYSnAwaGlKTUtEeFB3?=
 =?utf-8?B?ckhZSU9KSTJCSGRJTTU2U0RCRjRTL1lzTUJFdzRQTlNPc2QxbU1pSDZJSUd1?=
 =?utf-8?B?aTVWd0FpdVRMRDdCbUwzekN1NitOMGFwbTFFaWhTd2x0Y2lzYnExNFRRNUZK?=
 =?utf-8?B?bkZFTXVUT3R5Zk9FT2V4QnhuRkFraGFSeEcvQXloV1ROU3M3RzhjYlFmTEpk?=
 =?utf-8?B?NWJGaUswdmZacmlnaThsY0hOS0xSTjFldWw4c1ZlOW1hMkhkYnluRU1zL2FW?=
 =?utf-8?B?R3JMWTdlaVBXV2MwL2hRZzhnRFltN0dtOEpyQ2VCRTBxMWU3U2dYa3lvaVYr?=
 =?utf-8?B?djdQSlEzdUhZcnJqdmZKYTFTbSsxMXR1NVVYYTJQb1dCVVdqdE5Oc0Jac2to?=
 =?utf-8?B?em9qREc5VXNzSXNBdENsaE1DK0haYTAwaThlVFN3ekRjbExsdFBZaXNaeUI0?=
 =?utf-8?B?dmFKc3FjTGlvTEZ0Z0hnSkVBVHpuWnJheGNFRlc3MkFxWGhqREVMd3JJN0VV?=
 =?utf-8?B?VGVEd0pSc2JQUkpmdUVSM1Q5UWJMa3Iyc1dPRVZQekxhcjBFaWZGdG9OVUlR?=
 =?utf-8?B?K2svcFFmYVBUSVFTR3AvZm1wbksyN3JDWEZBYUdTQjZkZXpyZ3BWZE1MTG11?=
 =?utf-8?B?OVlWZktDMW0xdHpEMHhmVjlaZUI0aWxNeE1xVEpCdUlIS2JWRk5SVjY2UU9O?=
 =?utf-8?B?S2t1a1h3QTJyb3RIcG1YVE9WaytKcDBIMmVJaEJUWE5Sam1ZSkh3dnFScGRB?=
 =?utf-8?B?WVN4UnBDelYvQlI1cWM1YTl3MVVrWEVDc29aVTV4TnppWXJEL1o0U2lnSGdy?=
 =?utf-8?B?SnhzYjMzQm1DRVpSNThHOWdObzdWRUR1dzlhdDg3OEJjUUNjN2tJWjRrYUlG?=
 =?utf-8?B?ZU5CTzFOUUFIQlJBaTRaMnp3cmRuaGxLS1l2T3ExN2l2V28wZFE1ZG9SMjBF?=
 =?utf-8?B?djdxWWtFb04xRW1hV09XM3czUDZ1eXk2N0grek80MWUyWTdGQlZBOWwvOTc2?=
 =?utf-8?B?dU1oeE51N1BtVUZXNEdtbCtoempVNVJaNGpwL1BLeXBqeTNsOHlSMVlWY2NJ?=
 =?utf-8?B?eXcvOE9HZTgzU1N1OWFKeWFaaWhvTHFkeEg0WG1Tam5kUWxYaGpXYmxvWHdz?=
 =?utf-8?Q?PGvwL7ye/qIUwKhLkc89gznIr7fTFI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 16:28:41.7320 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81fd1023-8b68-4fc3-6f5c-08dd49effb53
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6011
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


On 2/8/25 00:05, Su Hui wrote:
> When compiling without CONFIG_IA32_EMULATION, there are some errors:
>
> drivers/accel/amdxdna/amdxdna_mailbox.c: In function ‘mailbox_release_msg’:
> drivers/accel/amdxdna/amdxdna_mailbox.c:197:2: error: implicit declaration
> of function ‘kfree’.
>    197 |  kfree(mb_msg);
>        |  ^~~~~
> drivers/accel/amdxdna/amdxdna_mailbox.c: In function ‘xdna_mailbox_send_msg’:
> drivers/accel/amdxdna/amdxdna_mailbox.c:418:11: error:implicit declaration
> of function ‘kzalloc’.
>    418 |  mb_msg = kzalloc(sizeof(*mb_msg) + pkg_size, GFP_KERNEL);
>        |           ^~~~~~~
>
> Add the missing include.
>
> Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>   drivers/accel/amdxdna/amdxdna_mailbox.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
> index 814b16bb1953..80b4b20addd6 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
> @@ -12,6 +12,7 @@
>   
>   #define CREATE_TRACE_POINTS
>   #include <trace/events/amdxdna.h>
> +#include <linux/slab.h>
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>   
>   #include "amdxdna_mailbox.h"
>   
