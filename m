Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85779574F2
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 21:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0109710E067;
	Mon, 19 Aug 2024 19:51:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="afbDiaz5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF58510E067
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 19:50:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EmdgrBjjISJOQf6JV6eJVBrtUqT91G0qWtmNt4kqT5iWTtXPWNlcgtoMee4YWskbxk3C4oob1hc7XCmPnwl4/pmm54UHY8aldzOt8sI5Bw7MNCKJMdx/BIL0wLGg8BP3fT4X4i7ex6Zadgr2hqvFVIdlJztDPmd40wqacrquTfnE13wbqODdv52CytBXev6cPtTNohBtue3VHZYnSMYYM+ICg5YF89Z8pM2pOWQR1ZbS73ZBHEYyrdo1Y5rFE3QB6n6+oK4vHUzocgyfFgNp1rts8naorfilFYSvWDPgg3nDA+fOTGKIQHNVn70VNPA3y2UUs5V2cD9rXYG2Pttc+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCsUxg5kXNGkOntUUKrd0gdFTtb6db9vuQYvjIRIGko=;
 b=adUmMlETw6swY7ePp9HKDmVreEqlbwWMdrdk6we0G3pMTqCWKIuX5FGVmIi/r4oC/xSoOPGb77u0LfCwmSOMlFpif97ieyduBjoVGomD+uPR6Sn33JFdtJ+a8dcY23JjXbxZ870ItBKi51fRYKwTCYy7HvGq9e8g+4Jluv9ZhvNEH0uZ3GH0hu81dM/dw/3fs/QqZ8Btb7hVoOgd7P9jU04wp3Y1dH/c5t+c21JZuxs8NgiRLhZ3+/6U6n+PTIIprbuotywz6Ds+Ko7/dVf75XDwSPA3etU9p2YCb7p8aH6pNtDCcrqVWRoOI8wjGUsOWqnq8kjDhZqqhJiK3px6pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCsUxg5kXNGkOntUUKrd0gdFTtb6db9vuQYvjIRIGko=;
 b=afbDiaz5n9WkiAaxkVsIEbApcvcyRy7RpAPCPEYYXYSs9rpuNKnD9S2h08bIDXJVvzYuJgSfGsQbcodo4KDOQFCpV9DE0Fl8VJ4Kyta2jIzpy2POs3ujAixf3qhFuHk71eT/4zYi9Jvl82UfYQBGBehIHgwvj3vll+3PDX5QpBI=
Received: from BN1PR10CA0005.namprd10.prod.outlook.com (2603:10b6:408:e0::10)
 by SA0PR12MB4477.namprd12.prod.outlook.com (2603:10b6:806:92::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.22; Mon, 19 Aug
 2024 19:50:50 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:e0:cafe::f2) by BN1PR10CA0005.outlook.office365.com
 (2603:10b6:408:e0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 19:50:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 19:50:49 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 14:50:44 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 14:50:44 -0500
Message-ID: <77d405d0-0f1a-202f-886d-c0a283a9d2cf@amd.com>
Date: Mon, 19 Aug 2024 12:50:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2 09/10] accel/amdxdna: Add query functions
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20240805173959.3181199-1-lizhi.hou@amd.com>
 <20240805173959.3181199-10-lizhi.hou@amd.com>
 <3f79b66c-89fa-ce78-e34b-294df1d9d1a0@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <3f79b66c-89fa-ce78-e34b-294df1d9d1a0@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|SA0PR12MB4477:EE_
X-MS-Office365-Filtering-Correlation-Id: df605341-f27d-443e-cd9d-08dcc08839f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjA4SlIyMUQvdUx5enZaUFBhK1hmRCtGK1FNV3ljWnZGbzVGVHJVbVBmM1E0?=
 =?utf-8?B?WnV5Smd5Y2pjZUdYazZHRXdPNnBaRXZyMWJlTEJiaTVETVFLeHdLekcrSVNw?=
 =?utf-8?B?b2ZPMWIvM0o4RThReEJQZFlhT1VDQTFscGRQK09HMkZvcUtRNmVZbmlsNXpN?=
 =?utf-8?B?Wm0rZzZlOU5hMXdOaU9wWTVySkx0M0ZFdTBBd1ZRNng1VEtTWUhCUWorZlZ4?=
 =?utf-8?B?Y3dTcHNLcGQxdUQ4clhQMHhTM0pPeUFDRjlDZ1lRKytHa2p0bkMvQzA5UjIz?=
 =?utf-8?B?eG82RVh5K0hsWnlCckllQkRGVzlWWUlRMmx3RDViU2dmU2k1VVNHb2dOeFMy?=
 =?utf-8?B?T1FzYS9iYU9FTWxySjJoY25iVkVwU2ppbkwva0RpSnllQTNKU3owM1Y0eXRo?=
 =?utf-8?B?SHpqeHZINzhPdVcvbklPNTM3bFIzcHdNRnlQUGRjYmMyMVRNUEZiWWZ3Z2hw?=
 =?utf-8?B?Qk4xVU8xc3cyVTFHbm9qU0ZOcWpPZXYrWXZhRjlQQkcvdjJMcHhnRGMwdHBD?=
 =?utf-8?B?TXc1czVYTW5aZXpTQVlXWjAxYWxuaE1ZNzIxVDFnV1JYWnk5cDErc0lNTWN4?=
 =?utf-8?B?ZVBTU0szQmxyMC9ib1B2RzdIcUNydGh0QTBWWHFxNkRRZjI0VWZXUWNjaWJI?=
 =?utf-8?B?V1JPN1R5UTQvdUJUbjdZNTZjbjlzVnJJTVg0YjlaaW5vRkptbVU0Ny9zZzJJ?=
 =?utf-8?B?eUErOHNBZFNwWHd6TmhOMUJIdlVkYS9ucnRFNkNDUU9oR05tQ2ltbmFMaDJ0?=
 =?utf-8?B?VlFibDVRZEU0TjV5S25ZWFlsdGdubFJmS2NxN2pSWXdoeW54Nlg4MHFoSmVn?=
 =?utf-8?B?aHozdjBlaGNjdndvVm1pcmdCOVJGaVdQajlpRDF6UzJGZDlJZTdBaDl2Rm5x?=
 =?utf-8?B?TVVzTmFOakNtL3JBVCtVRk5SMkthMG03OUlJUWhNR2E5Sk9mQ2NjVDdNR3RO?=
 =?utf-8?B?c29Lbm5LRFc1YVlhaStsKzRQUUJVekJmZWJtRy9rVW9kMTNZbThWaFVQT2wv?=
 =?utf-8?B?dlhSb3loNUtBQmFBUm1ZWThpd1pzcWlFNDNudEovVGorZXVhbmJRa04vK1NG?=
 =?utf-8?B?cEx4UzZDcTJZeVVpSGFudTNQMCtHeGFRcmw0RkxEM0s4dkN6VDdzQTRlZy9X?=
 =?utf-8?B?RTgwYjhTRjBaTE9OcUFWeVJtcE5ETUJKV0hzTStOYXM3NDlkZTZ4a0xmUFA0?=
 =?utf-8?B?cy84TjZiQWJDRmZHSWt3WThYdm5SQzg2WUJIMVZET1QzMVU4UEZ0N2x0R0g2?=
 =?utf-8?B?U0xlRjBvYVRlV3lveXptWkI4SmdaNXdmY2Vva2JrTnFxU25MNlo5aXYzdm0w?=
 =?utf-8?B?ZnpISGFkM0NrYTRWWHFwWTJUTHloQnUxN1RoN1VpVy9wNUZZd0txWW1sNjln?=
 =?utf-8?B?Wktqc1pueE1nUTluc0JhR1drdHpGZ0xuWFFvYStyYXFaOTF1dGcvSHlqb2hM?=
 =?utf-8?B?alRHSDFrYUlOdURMVDNEWHMveDZiSjd2RllkVzBIcm5mOFBVT0hhVmVRRmI1?=
 =?utf-8?B?Qkk4NkZLWXVLTFJrZTVaMWg2VTlSYnhsUkhkN1BsL3poZGY1bWNndjF0Nmxa?=
 =?utf-8?B?UTJYdGJ1Z0REWUhwb0hnMWd3R0dPMFhWSlp2dHhtbGh6ZEN5L3RQVWpJUEJR?=
 =?utf-8?B?dVBuemVRei9VampoWTc2Vy9tSFJJMmtsRmJyVVhmbHZHOFNMYnR3NTZpWGMw?=
 =?utf-8?B?eHAzRDZQSlB0WVdubFBSNlhKVG9hSUM3NldJaW5WaklkRHNtWURqeEpOQUZp?=
 =?utf-8?B?eTh5M1NJWVpCSjJsMjdFZkRJMjhaZ2h4TWNWUGZRNjdsdDhzdHNJYi9SNlpJ?=
 =?utf-8?B?ZnBsaWl6TWh3dXZpOFpJejdTdS9LRmcwSmxEbS8zMVp2Z205ZlR6NEZVa2pn?=
 =?utf-8?B?UVh3MTAyMjcxNTZtTVN0dWhkQW1SR2NyUS8rc2VFby9lNUlTUFVtUjRTZXVv?=
 =?utf-8?Q?LYlv11O80CW6sXDs+gaI6XmApmYaoEt/?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 19:50:49.9572 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df605341-f27d-443e-cd9d-08dcc08839f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4477
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


On 8/9/24 09:42, Jeffrey Hugo wrote:
> On 8/5/2024 11:39 AM, Lizhi Hou wrote:
>> +/**
>> + * struct amdxdna_drm_query_hwctx - The data for single context.
>> + * @context_id: The ID for this context.
>> + * @start_col: The starting column for the partition assigned to 
>> this context.
>> + * @num_col: The number of columns in the partition assigned to this 
>> context.
>> + * @pid: The Process ID of the process that created this context.
>> + * @command_submissions: The number of commands submitted to this 
>> context.
>> + * @command_completions: The number of commands completed by this 
>> context.
>> + * @migrations: The number of times this context has been moved to a 
>> different partition.
>> + * @preemptions: The number of times this context has been preempted 
>> by another context in the
>> + *               same partition.
>> + * @pad: MBZ.
>
> Did you make the documentation?  This looks like it'll generate errors 
> from missing fields, and not having the same order as the struct.

make htmldocs and make W=1 did not capture this (it seems doc is 
generated for .c file but not .h?). And kernel test robot did not complain.

I will review header files and fix this kind of issue. Please let me 
know if there is a tool I need to run through.


Thanks,

Lizhi

>
>> + */
>> +struct amdxdna_drm_query_hwctx {
>> +    __u32 context_id;
>> +    __u32 start_col;
>> +    __u32 num_col;
>> +    __u32 pad;
>> +    __s64 pid;
>> +    __u64 command_submissions;
>> +    __u64 command_completions;
>> +    __u64 migrations;
>> +    __u64 preemptions;
>> +    __u64 errors;
>> +};
