Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F76A3C7D7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 19:47:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F73B10E35E;
	Wed, 19 Feb 2025 18:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Z2QH8Sxx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C2710E35E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 18:47:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fACvvsLLyNIAauUxctgbiBgGGAlmKPJj062/1x1++yXmUux/HkNrfjwkxB7CZLwlnG/0bowVYYm+xMOIm1xYzJ77dnMmzUg7LynYV6Ye5iMZQ+YsLI0Kf+38kHUc7QZhFCgHWKy2sFuFceaMMCPfoyuIF4RMLV7n01ZF0FP8wnFcR5snKJ95mnaMKXGlSGu7Si3RHwVm0zbbkx3mQEuISclf94vsTYl5Z1104gSJSHLS5JQ/GFQlBE7dBWRGhXQKHC/j4RJD4xz3Q8tX2LsLy2qCbGJixbPqFNevwYx/eomWQGakq9A0L3p6JvF44LrzUNjImV0PRBCXcPQaPpSgWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scT/KsI42Z/eyT34daJd2VXa/5Vxm+ZdLwiMkCSUVMc=;
 b=CS3Ef18sN5leLF0qfYmw3hsVvYPYZ0dqIEKh/H3z4Vg5Fg+oXCDvHnsQMXmkVzcg5CFtpyXN/enhr/DKbcdbYC987URStNDJBiGIOYrhQEuJwTdtcHPswvLlDBE9xBSaj3B5nGqdre34twmM47geY0XyFlAM0wNOgcB9RLv4npG6Y1rYRbIRs1QyRLX9iQaUqEBmgcZomQT1A0NZzx3zR4GySObYYxUTZSm0brFWhNATtp2ztqjhBy4k80E9rEaBMdmhxWJPl5qtLXUPX5kUJEK1ipGumt5817Pr8cxDPoeguiyPx+olY3jKs1L6wIFS/GzoANSurDzXbz/+E0jAPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scT/KsI42Z/eyT34daJd2VXa/5Vxm+ZdLwiMkCSUVMc=;
 b=Z2QH8SxxVFIBjPJ9ethzY9avITwPFf6eATVXcU33A0tDrCSLTPxPwMriM+vVzQff66r2+qvGKySdGTBNElComVLAi9VNskOFIIq2Ou4d4hnrxc6HGVTTFErJYpI5fIkGD0EoNuYh27URPXKZY4flE+cITnaM6UEBtQOVHl5ezkY=
Received: from BY5PR17CA0013.namprd17.prod.outlook.com (2603:10b6:a03:1b8::26)
 by CY8PR12MB8266.namprd12.prod.outlook.com (2603:10b6:930:79::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Wed, 19 Feb
 2025 18:47:16 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::a3) by BY5PR17CA0013.outlook.office365.com
 (2603:10b6:a03:1b8::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.14 via Frontend Transport; Wed,
 19 Feb 2025 18:47:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Wed, 19 Feb 2025 18:47:15 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Feb
 2025 12:47:15 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Feb
 2025 12:47:14 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 19 Feb 2025 12:47:14 -0600
Message-ID: <c3075150-94f5-7187-007c-0037eaed6077@amd.com>
Date: Wed, 19 Feb 2025 10:47:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] accel/amdxdna: Add missing include linux/slab.h
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, Su Hui <suhui@nfschina.com>,
 <jacek.lawrynowicz@linux.intel.com>, <min.ma@amd.com>, <ogabbay@kernel.org>
CC: <George.Yang@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <20250211015354.3388171-1-suhui@nfschina.com>
 <60700ca3-8d9a-d284-d2d8-343d770ca384@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <60700ca3-8d9a-d284-d2d8-343d770ca384@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|CY8PR12MB8266:EE_
X-MS-Office365-Filtering-Correlation-Id: 89aff0a5-0535-40b2-4429-08dd5115d4b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEZTSk5RSlMzS3NjbDRuajR4QUROcVQxRmZjSWUvUjZSa09EU3lTYnlwMDJK?=
 =?utf-8?B?VkhUZks3eXRzV1MvNUtNdVRqbHgvK1UwQVcxV25BcW1ZMmFZWTVnMXlNS1ls?=
 =?utf-8?B?bGk1VE9UUGYrelpLbDdKT0pQUE5LVG05ajZJSE0veklYZUs2V0dvb1JVVEw1?=
 =?utf-8?B?OTZKTmFjNnhJMFhSa09BcDZoYXRUaU5xSld6WnhNUkZteGE3RnRrM294azFt?=
 =?utf-8?B?Z0dxTWJlQWVGTEtyejNYSnArTWRMUS92Zytic29oNGhZWkdUaUVJOTFCdkJz?=
 =?utf-8?B?cEVFeUNaVDhtTEVhVSsrbmc1dlBHL2JYSWNpWS9qUU9aSWs4WGVmQ0pDaXNr?=
 =?utf-8?B?UWV2ZitvOTlpMi9SdkVSQzd6cVhkNFRYTW45Z3BScklkb0dLeWpsMEZMUG9W?=
 =?utf-8?B?aTZzMEFjSlphTDNiK0tYTWdPNWxTc3JNNDltN1RvWkNLeGMxQkJvY3dmSlYv?=
 =?utf-8?B?L0Z6RHNMM08wL0Z1QWdhbEhPc0hENEJkdXB0bGtObUVVZVp4dUszN0xrMWFq?=
 =?utf-8?B?RGdJTU9KYWRVdUZQTXF6Sit4VzkzdHhqWmF2NVR1VzZBQzNoa0JxOVZXYlhT?=
 =?utf-8?B?SlpvamIrN1RxeFVZVDhYelJoMWJOZkQ0S0k0UEQ2MXA3T1NTcHlkbXFsL2Np?=
 =?utf-8?B?YjE3c2xWNU13KzNrai85Y01ZSTZLdS9qVEV2bTk0MlB4ZzdraXpZelVxWVg5?=
 =?utf-8?B?YlBtZDlzTzFKdThtdTlXdmh6RU0zVjFFZUpHa0s4bDlqem5aNmFCVFVJR09G?=
 =?utf-8?B?ZFJqY0p5NWN1SHVXdWMvYjhEV1llNlkxS1lxSVhTY3BGcGFoVlFqZitWZkVU?=
 =?utf-8?B?Nnpvc0JIb0wva3RteEV4SndrcmVWZ0IySVFYdjFNN0VkNkZiY2cxUlcyb1Zw?=
 =?utf-8?B?eFliOGtwYjJ0ekZCcnZ5L0QzSGpyc1JlaWFlK1V1S3paa2hBdHhlcWtLU3dv?=
 =?utf-8?B?aHBhc2YwTThhV1c2c045YXZhR0hQNzRJc2d2S0c5NTdkVktjRFVOa0FaeGFR?=
 =?utf-8?B?STAzc3BBYmxhVUtzbktNeEdZdkYzeER0N1VJdWVPTFY3Y2FnVkxJTmRSNE1L?=
 =?utf-8?B?amlsV1hzNnZhOXM4bms5RTEwa1Y0UWE0ejRZMDQ3M0lROVBUZGdSZGNmTkg2?=
 =?utf-8?B?cVZZOHhKRFR5dHJnR1lJTmFOV0RCaStyL2h1bTRIK3dPZUQ3LzRaM0dZMG9T?=
 =?utf-8?B?d1BlcHQrczFjS2dZZUc1aDBrTkxtZVNrbGE4bFczaGZPQ0dpbHd5TFZVa2lu?=
 =?utf-8?B?UGM1cytpTEhXVWRBNkYrdlhKWDdBZnYwaFd4N0V6cHpubTlaYit3V3YrZ1dW?=
 =?utf-8?B?a1BVUDRoRVl1MkY1L0x0NTdBRUtLSWdnTWZ6Z2F2MDhlR0V3OE11L2JvWVVi?=
 =?utf-8?B?NXc3WFZEYS8zVklDdFpSVSs5Q01VZS9zM1ViMWh0ZC9iUHBuVVlFODJoeFVX?=
 =?utf-8?B?eXE4b2pQazl1c2Zkb0R3ekVQQzZrdzQwZUJ3QUVzVlFnQ2pmalBLSWZnZEJE?=
 =?utf-8?B?ZlBLU1BNZ0FrUnVsQWR0cWpVMnNFV29pNkxoWUltT1JKT1grbXhrT05jVExV?=
 =?utf-8?B?RVgxNlkzNUxJVklLRjVVR1A0T1JxdTZNWEFTYWlXalR4aXNwdmVDZW55Q2ZE?=
 =?utf-8?B?T3lJZXBUZUNXdlpoRWR2c2EybXBqM1JNME9WelV6TUpOK003RVh2aVBBeTR3?=
 =?utf-8?B?YjJ4WDNySEtNWk5FdllQZ2c4cG9mdzRGWWswUjV2MEo5N0FCMEZxVUtCZ3FL?=
 =?utf-8?B?MTYrZlFmUnNTVFlKZjZTVGZRSlZlOC9QMzh6U051UUNTMDQvSXlOa3BqMkhi?=
 =?utf-8?B?Q2M0Z3F0eHFJVW9WZHRKNUpZbHk2aGNOdGZCSE9mYnMvajFFbjk2KzdDQk5h?=
 =?utf-8?B?cTFKZWRIbDk1dXhrN2Y5c0pYZDkwU0hwTWllUnVWMUxsL1FpcHFOOTBramxv?=
 =?utf-8?B?K0hsZU9zVDNSWDRJdWVwRGlMTkFYbEVGc3dLanFwSWRoMk5IMklRQVpwc2RO?=
 =?utf-8?Q?dmWGjCZ9XTcDT5fu4KtQ4S3qwGxlN4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 18:47:15.9466 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89aff0a5-0535-40b2-4429-08dd5115d4b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8266
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


On 2/11/25 07:36, Jeffrey Hugo wrote:
> On 2/10/2025 6:53 PM, Su Hui wrote:
>> When compiling without CONFIG_IA32_EMULATION, there can be some errors:
>>
>> drivers/accel/amdxdna/amdxdna_mailbox.c: In function 
>> ‘mailbox_release_msg’:
>> drivers/accel/amdxdna/amdxdna_mailbox.c:197:2: error: implicit 
>> declaration
>> of function ‘kfree’.
>>    197 |  kfree(mb_msg);
>>        |  ^~~~~
>> drivers/accel/amdxdna/amdxdna_mailbox.c: In function 
>> ‘xdna_mailbox_send_msg’:
>> drivers/accel/amdxdna/amdxdna_mailbox.c:418:11: error:implicit 
>> declaration
>> of function ‘kzalloc’.
>>    418 |  mb_msg = kzalloc(sizeof(*mb_msg) + pkg_size, GFP_KERNEL);
>>        |           ^~~~~~~
>>
>> Add the missing include.
>>
>> Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
>> Signed-off-by: Su Hui <suhui@nfschina.com>
>> Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Pushed to drm-misc-fixes


Thanks,

Lizhi

