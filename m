Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52978B3BFDD
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 17:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DA410EC07;
	Fri, 29 Aug 2025 15:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hYRdS1rp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789BB10EC0C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 15:52:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tEtosoDZ8D4/Yc0zK3u25TJAOdPV0IevCwb4aH7CgeUbLqCPVERfy2iwVEPSOi76FHF1YOzu+eQe3DvsItH4wsURSMcuUy0XvOq+J73kBlY9vabomr2nYPWsCQvz8Hf+aPGk0ub3G5+qK/StSFdebFFuccUslmrSDTCj7V7HjzWvYEpfm9PXycO+m37/P+RXvTHW7K82Uaj11N8NCjY9qEoFjMq+qDwAJGUCev3rXNCoATQzY02w13OQiOQcA+/5EDG7bFMns30MoVLgcdMOdWos0plLTmGKj525q7KlumasLcQFirsMaBqzHcoE2nnD+rN7Vs+l7C5ItVGroJa9/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/iaNgkhBMzGX9fvgrNa7r9245puRvO3O4+yWwaKqOE=;
 b=UyoLuyJXX6qd/6tM4NrPwyl7+zjI3NM2ng1zAndtzoT4cHJTvmXv0ph5DtjSE2OhbNUAfqI4ydQp4Oes5AZn9qMyL+P+TbktJz9Fzv6kRnuYUPZ+5hZZjo9jPrLcZAbkFCnpIZjWK3d+ooFb2knDCCRUMHy+IjI44ZD2jWM5gFBuValPiHKYE3YnLtF2dtbRUySgFERybRYfn2LRIeAr6OfNoCu64qOkUxoVaXBGOBTSNALGTmqVMh6YlcLDgDqIIbE0q67g1vTUk0GOfWAigUy6gZ8IGon//KJ5uAEV2P7OgqhOWD9k5cgnK78/RtQ0wLzYvd45J+bXOekLyjOhJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/iaNgkhBMzGX9fvgrNa7r9245puRvO3O4+yWwaKqOE=;
 b=hYRdS1rpEk1mi4/MKES06NPg7aRHzaE8ZOYbcp/Odon7rYW04x3g1YFiE9pqXXsnX0RteWQV5iNNU2qPwkZ/GtfOWKyiHztTKU+7SAb2H4XKN6sIqKFYyzYOz9wSGJ7YEIvTlS8paXyS688KRVxepKBd/UpWSAx31B92ss+VG5Y=
Received: from BY3PR05CA0031.namprd05.prod.outlook.com (2603:10b6:a03:39b::6)
 by CH1PR12MB9671.namprd12.prod.outlook.com (2603:10b6:610:2b0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Fri, 29 Aug
 2025 15:52:32 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::43) by BY3PR05CA0031.outlook.office365.com
 (2603:10b6:a03:39b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.9 via Frontend Transport; Fri,
 29 Aug 2025 15:52:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Fri, 29 Aug 2025 15:52:31 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 29 Aug
 2025 10:52:30 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Fri, 29 Aug
 2025 08:52:30 -0700
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 29 Aug 2025 10:52:30 -0500
Message-ID: <dc0227cb-7e02-10c6-9790-2e2331ddfd6e@amd.com>
Date: Fri, 29 Aug 2025 08:52:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] MAINTAINERS: Update Min Ma's email for AMD XDNA driver
Content-Language: en-US
To: Min Ma <mamin506@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <jacek.lawrynowicz@linux.intel.com>,
 <linux-kernel@vger.kernel.org>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>
References: <09906ca7-62c7-2ca7-5436-662a6c4b19f5@amd.com>
 <20250829063607.789-1-mamin506@gmail.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250829063607.789-1-mamin506@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|CH1PR12MB9671:EE_
X-MS-Office365-Filtering-Correlation-Id: 82fd6ef5-dcb7-4cdf-e679-08dde71410a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzE3b1RvNkp1SGxpR1o5NWFSenB5UUtEZzFkYm13MHBFWnFnQVUyaFVjenJ3?=
 =?utf-8?B?TnFyN2wxQVZzSUNDNXdIQ1FKbDFEK2xzYVRRV1MvMldnSStWYTEwVEw1TWkw?=
 =?utf-8?B?b1BJcWh1TFRyektoajdtVHphbzRra3lOT21KbWlHWWprQktXUFBRTjlpL0Zo?=
 =?utf-8?B?MWsrampCSmF3bE5wZUQ2UWJGd0JuZDJxWXlMOTcwZndjSkVjeUVic1lhVTZ2?=
 =?utf-8?B?VGtZV1FVQ1ZxY1AzNHp4MjduL0I4S0dYcUJ3NVBsZ01mbWxGV0krc09xd2Y1?=
 =?utf-8?B?VFltbDI0RUhiYzhBMVBHbXB6cW9EaGcremE5TWI2QmdjQWUwSHpKSHRaRnBL?=
 =?utf-8?B?K3NxclRGQVY1Mi9aQ21hSDA2KysxazkvME9lZEV6MzAxanE3MlVUR1pVUUVM?=
 =?utf-8?B?bGluSUpaRmFyVUtjemJUdVVtL3lLcnFuY3pCZVBIMTk5VDZ1cElFd1ZBRzAy?=
 =?utf-8?B?S01ybG9kdHYwWnRCNVBGVHFLeEs0TVpmRDFKRVpNdkdaTHFPZ2k5MmI2cXh2?=
 =?utf-8?B?RDhvaEhwWEQyYzJwR0FERXJ6YThjUUtCWWNzMWpEQ2Q0RnhFTGZZbVkranRG?=
 =?utf-8?B?TWdneWJhWkUvcG5lL1V0TmZNbzEyZWpHbXdldi9CVmNXaDRBYXlnMzZpbGlr?=
 =?utf-8?B?dndTYWZoOWdnWGwyUTA2cWF6c3pQUlBUOXFTeVJKcm9lcXQ0Wmp1SWZBOWtp?=
 =?utf-8?B?SnRkaThOdE84em9QRitIekU5dVZHTVozQWhhSHhGQUFLR0Q5bTBkMEJWRXds?=
 =?utf-8?B?VWQ1ZGNQSHpoQWU5d0ZkL3lhSHhHNzdYYXBTRmJNZTNYNkhtbWdQbm16Q0NN?=
 =?utf-8?B?dnk4WmQ2Zkc5QnJkSTRaSEU3NWlqNCtYUXFGOTRjWHBxdmtmRzJBMG5manFM?=
 =?utf-8?B?UEJ4WkNQb2dlWnZ2eUNqWnRCM2dOL0l0YXJ1dk1ySktGUmNMeFlEMU9UakZp?=
 =?utf-8?B?U29NaUlmSkdMbGRLTFh5eHBHRjY1ZEJSam1Ld2ZQMlNKWW9SMUpMQW9WZk90?=
 =?utf-8?B?M0JxT2JYWndFczYrdXRKTXJocDRvOE95RUhLZVdBZzFuN3dBWHU3Um8yTEp1?=
 =?utf-8?B?a3Z6TU45NENaaWdwRlN2bE9SZnE5b1V4SGJ2SWNGcGgrRmE5VWpZV3lPNko5?=
 =?utf-8?B?d1YxcVZHV3ZMdmpGSk11VHZoNjdCcU94Ni9rUHM1b21DUUdvU3JncDJrVzQ1?=
 =?utf-8?B?emhGOXpuWnMvSTNnSStmNzVFM1Yxd0MrUHQyOW9NKzlMWTlJWHJaRFlYM1A1?=
 =?utf-8?B?M1kzR2VpcHpLMmlMR3BXTk1wRnphWTZndzJPc1ZKM1pHY0lhZU5TM2tJMDZJ?=
 =?utf-8?B?VkRYZzkyczV6R01mNmZZR2RUOVllR0VjKzVtRldsdjdjMDhCUGFqTWloWHZy?=
 =?utf-8?B?TnRpT3BpbXcvYU5jZ29OcDgvaDhRNW0waWlHY0JWWUV6dGJxT05vbjJVZmNn?=
 =?utf-8?B?SVRibURYVTBnbVB2SzE1TENDVWVDZVpHb2p4SHpRUnErOEZ1aGsvNGhHa1JK?=
 =?utf-8?B?T1ZaeXZRYnpEb1RQbDdHaHhxNHAxMnVIR0lrT2hTcHpqa3RzOFc3VitRaTY2?=
 =?utf-8?B?S01vaGJFYkpXV3I2bnVKNk5neHhodHZZWUN4MXQzOFJEVWl3TTFBUTZZYlpU?=
 =?utf-8?B?NXNWeTk0TzhYcmFrYzJpVng5SWhvVklYYTRzOW1ncEVpVlJxU3YzTDN6M21E?=
 =?utf-8?B?Y29RM0N2YzdxQTIxWGR5U0J3dzkzdzJleXJLd0tmK08zd0lxM3laSEVqZHNL?=
 =?utf-8?B?bTVJczBmNHVvODRsL3dvS1pUVHE1R09DRGdNQ1NmZFI3WU9uNG9JbTVMemtj?=
 =?utf-8?B?Tm8rVzVNZGNiZVpxdGJ5OS9BekhXNWFEMWF4SXZBdlNQNUNtOVJxSk1kUFpH?=
 =?utf-8?B?SHFtakVsOXZneFhnWkNNNTdiR2RmQnhIdzVjMWxhREtUNDBablhibkhIQ1pa?=
 =?utf-8?B?dkRUdEZvQ29OaDJpcEdJaGd2ejcwMXc0QkhVajVQdzlOK1RPVXZ3NFVaUGFJ?=
 =?utf-8?B?bnFSSkFTcHl1VVFyRmxyVTlrVXRNRUJBRkVqUDN0eVd0ZkVSTml3Q3Y3ZUp6?=
 =?utf-8?Q?QlsAOr?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 15:52:31.9736 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82fd6ef5-dcb7-4cdf-e679-08dde71410a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9671
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


On 8/28/25 23:36, Min Ma wrote:
> I recently left AMD and would like to continue participating in
> the review and maintenance of the XDNA driver using my personal email address.

Check patch warning

-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line 
(possible unwrapped commit description?)

> This commit updates my contact information accordingly.

s/This commit updates/Update/     or remove this this line.

See: https://docs.kernel.org/process/submitting-patches.html


Thanks,

Lizhi

>
> Signed-off-by: Min Ma <mamin506@gmail.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 10850512c118..6eefa494000c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1231,7 +1231,7 @@ F:	drivers/spi/spi-amd.c
>   F:	drivers/spi/spi-amd.h
>   
>   AMD XDNA DRIVER
> -M:	Min Ma <min.ma@amd.com>
> +M:	Min Ma <mamin506@gmail.com>
>   M:	Lizhi Hou <lizhi.hou@amd.com>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Supported
