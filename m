Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82607AAE491
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 17:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA48310E834;
	Wed,  7 May 2025 15:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0eSppIxy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E1A10E834
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 15:24:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEHeUeQtdLE+BYhKQCCweHjlUEIEi7pswKcoDtTdFQndhYn5eBiso+wS5IplE+59sbsBx5Wh/aky6+ooWTMA598fckpYZihL9PEV47JHKXbX0f1IrFLiUjtba/Tjp1cd0Xz/G3MquEKI3c2fj305axc1xB8Aemcgkz//auKi/9Ey7SKM/eX/aRzqmphAi2DXqErJUw4yPM15/nAg+k89dTKJFimkZ0R7JWV/VE5jWLA9edoW9ZcxT6F2oeSnTS6VJ4lf/zH6DNWM607S1hclUD7xWtnMVlj/ZA9woY4FC9Z/t2mb0naR6eHuXH/qqdRvbSNbixSuHu1UfmniKrRHHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGbgyzGFRT/U/W4KCzlyXkwlqEmfYo70eLmDQh0xqqQ=;
 b=XFLKLkypNa5NoRtac4i5+p0ptIuC0NHbpSPMI9TuYdhPvKnhoPogA9Z02Oj7iuyV2uY+kA1+4pIQQ6piRbqu8VMm/B9fZahtE13ICmj3rXcVkQHMXMoylpEmDUIJAuVGq5FxP6ImRKH+oYiAy3BCqNgh9d76QvJcUimDCCbR1cSIWUZ8XJBPPN4ygLAFlWTk83AfyVNPUz/R7zB7opb7R/2cVKsjts6iT2Es1Lu9pfL5jwiomFfsOxP07SwfdjEbF6Yk4wkcHhenkSYIEO3kOF5wFbYSnZHDRAAi/Lho+QKJFnxwgkiEdttN3lRmxXbz7Db9L+N8gHWK514AWz9UpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGbgyzGFRT/U/W4KCzlyXkwlqEmfYo70eLmDQh0xqqQ=;
 b=0eSppIxyHmykVHoJBHsBbrsPyt9JHq1tKxptTXEyvYze7SfIzhoPyHCwom9epa+ZbMQ7fTfzYQxYhVWlhdMw3dKCuvGIP5w0MJc+eTto57OWRYNt4zBNDaXg/bowQlP+M+Mb/KRDoJk2c36/kbSO9rpnzbsL9cm5ZXLUFBW5JBU=
Received: from BL6PEPF0001641B.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:10) by DS2PR12MB9663.namprd12.prod.outlook.com
 (2603:10b6:8:27a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 15:24:43 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2a01:111:f403:f901::7) by BL6PEPF0001641B.outlook.office365.com
 (2603:1036:903:4::a) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Wed,
 7 May 2025 15:24:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 15:24:42 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 May
 2025 10:24:42 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 May
 2025 10:24:42 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 7 May 2025 10:24:41 -0500
Message-ID: <08a17170-b991-f520-6aca-0690a28917a4@amd.com>
Date: Wed, 7 May 2025 08:24:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/ivpu: Use firmware names from upstream repo
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <jeff.hugo@oss.qualcomm.com>, <stable@vger.kernel.org>
References: <20250506092030.280276-1-jacek.lawrynowicz@linux.intel.com>
 <abf77771-ca6a-3b29-f5e7-fbb11c53844a@amd.com>
 <35f0d2b1-e958-44db-b4d2-978cd741c3ab@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <35f0d2b1-e958-44db-b4d2-978cd741c3ab@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|DS2PR12MB9663:EE_
X-MS-Office365-Filtering-Correlation-Id: 887d6a09-6ff4-4b3c-65cd-08dd8d7b4aa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnhnNnRSKzRTTy92b1A1SEg3T0FvOUppOHZYSk9ib0lVeUg3ck5kVGxhTVcr?=
 =?utf-8?B?NEFRNnJkUHBVSmNlRnlxT0haMFVtSU9pNEF2eVM0bTliMnllY1NiblI4UVVH?=
 =?utf-8?B?UytKeEpLTVh4WkxOOGhmTUpBM2tNTENrV1hTR3Qya3N3cjU2WE5mU3g4WFA5?=
 =?utf-8?B?eVlmK0hXN0J6YnVVTlN4c3R1cndVNlJpQmFFanlpK1Uzenc4S3M1enVKRkVv?=
 =?utf-8?B?dFQ4VlZscktPL2tRaitOb2kySjBLNEorZGY1UHl2UTVjOFI0NFlSUHlGZzA3?=
 =?utf-8?B?Tjhma1JjRXc3UWVTTkNKQXNOZU9YS0xJV08xd09YUUVnMG53VWFmVElhRndx?=
 =?utf-8?B?NGpGTE4vRVNNOGs2UVllZGJDYnhkNGJHK2toY0J4SEpmQzJrd3YxTU9GY1JQ?=
 =?utf-8?B?MjZCRWJLQmUzanBUMWx5dWFaSFdmeHEwUGluVUR1dFU3M1pFSDBadUJpeGJ0?=
 =?utf-8?B?NSs1U0xrT2dnZmV2TTRSMVVZWDdHbnJMR1k1QmluT1VvcDAzNjdnZXVGYzk4?=
 =?utf-8?B?c0ZKaUp3UVd1bWtsMUNoN1FseS94TXdwY1VVdUpHaDM3MVZzc0NIMmZMNWdH?=
 =?utf-8?B?ZzRnRHJ5ay83RGJtZVJFOVcwaWVxREtJN0FwV0tWdEdvUjhWTjZnYmNvSFZx?=
 =?utf-8?B?QzVSR0pRTjRjVUtBMkl2ejROUmtoWDJtYlZ1L1Foc1NZU3BnY0xhQlNmNEtE?=
 =?utf-8?B?bFRuaXgzV3lkUzZOSUFNL0N6MkhvWDVwL1oxMHlSeC9INXVCaGJmcUN2dG5r?=
 =?utf-8?B?NWpEWVFSeU1HWmRCUTR0ZFVINDVSOTVQcFBkRzluZnUzSHUwWlRkSHVSUzRp?=
 =?utf-8?B?WXhid1NDbVdpcXVZKzIvT0VCc2NoUkFPekNyYlNHSHh1Q05uK1FZV3FoMlM4?=
 =?utf-8?B?d281aFhMNFBBQnA1QzYydFRtRnoxUmE2L3J1TkhYMUtsdm9kcEdKZEFkNkhn?=
 =?utf-8?B?U3Z3Zy9aNFR4WU1jTitRS3RJeGZQWDVPcmJXQTNmTFJadm0rdnNIRzFjcXF4?=
 =?utf-8?B?anhQZFBLN0xjODB6TmFuZXRhZ2FqSEVUR0dISjNpcm8wYWtSanNnekNyRUlW?=
 =?utf-8?B?QUFyZGt1TXZNcmxjZHF4NU0vZmd1cXdVd2N5WG8wWndERmZqZ3BvVDNua25w?=
 =?utf-8?B?ZndtMG04U2VRemswTzBNM2pnb1ZJNEZzMW93OXFqOWpSdEthbDNSeTh6RXFS?=
 =?utf-8?B?R0NJaE5BYWh3a0x4VnZRSVZVdStQTlppK1ZYcnFnV0s1S2hQWFhDQWM4Z1ZD?=
 =?utf-8?B?UzZObU5oWjJ1bVFhdksvS2RrR3JieTdWUzlLR3EzOWh6RmpHOUVvK3Q4blhY?=
 =?utf-8?B?cHZJYWM2bng5U2N4NmJLb1hmWmpQSlNFaE56NHY1SDdITWhlNlcvRk5EVm5H?=
 =?utf-8?B?N1Azc3ViVU5pVzFLS2FtOFovY0syYjN4Ykw3N1F0UzJ0NkZrRWYvaSsydU53?=
 =?utf-8?B?UXVKRkxCcDRwMTdJWDVEVmhNQzM1ZEJ2VStmNlhrV29rUXVSN2hGM1NjQUJv?=
 =?utf-8?B?UDFDTjcwSVcrU2NFVUczbXBvbURURER6Y00zaTExVk5uS3VvNEFBYldBZnRZ?=
 =?utf-8?B?enNUb0pzRktyQVEwQmd6d3d2YU1hMmxlMUhBb3JDbnAwaW9hU1kvWHA3OU0v?=
 =?utf-8?B?cW8ySThId1RvYWlRbFNnSmJ3dGFuOXdxOWhVaThFU002SW5CTHlpVlAzai9V?=
 =?utf-8?B?SVhKUmsyQVl2THBxV1l1aXVPelJZckVlVy93bG0yczhRNWNDMnE2eVRhNEtT?=
 =?utf-8?B?T3RZNnl2ZmphVGNjQ1Y2UUVBL21nQURRV0hDV09odkpHdHZmVnJYRGpJUXpk?=
 =?utf-8?B?NEU5dlhvWlU5SUJucC9CYjR0RitLQWprMlpuYTNMTU9lSmlrT0lJMUQyemJo?=
 =?utf-8?B?OFQrTUpUOWV2NXRJdEI2SEZJQ21lVjVad25LL0pTdlpzOFdrQit3c3pOQ1lQ?=
 =?utf-8?B?dGNhZ2pzRG9WK2czNjdvTXNYMmpvQUJjY1B0Um5GZVc5K1ZFRmZjb1ZHY0Nr?=
 =?utf-8?B?cDFqNVZSUkpTNFVmZ2FkYzBOZ0ZtOWZudlhrcUtTdkJkd1dYV3pNVUZDOUUv?=
 =?utf-8?Q?7embbp?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 15:24:42.9064 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 887d6a09-6ff4-4b3c-65cd-08dd8d7b4aa8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9663
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


On 5/6/25 23:59, Jacek Lawrynowicz wrote:
> Hi,
>
> On 5/6/2025 5:41 PM, Lizhi Hou wrote:
>> On 5/6/25 02:20, Jacek Lawrynowicz wrote:
>>> Use FW names from linux-firmware repo instead of deprecated ones.
>>>
>>> Fixes: c140244f0cfb ("accel/ivpu: Add initial Panther Lake support")
>>> Cc: <stable@vger.kernel.org> # v6.13+
>>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>> ---
>>>    drivers/accel/ivpu/ivpu_fw.c | 12 ++++++------
>>>    1 file changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
>>> index ccaaf6c100c02..9db741695401e 100644
>>> --- a/drivers/accel/ivpu/ivpu_fw.c
>>> +++ b/drivers/accel/ivpu/ivpu_fw.c
>>> @@ -55,18 +55,18 @@ static struct {
>>>        int gen;
>>>        const char *name;
>>>    } fw_names[] = {
>>> -    { IVPU_HW_IP_37XX, "vpu_37xx.bin" },
>>> +    { IVPU_HW_IP_37XX, "intel/vpu/vpu_37xx_v1.bin" },
>> What if old only vpu_37xx.bin is installed but not intel/vpu/vpu_37xx_v1?
>>
>> Maybe just put *_v1 line in front without removing { ..., "vpu_37xx.bin"} ?
>>
> The vpu_37xx.bin style names were never released. This was only for developer convenience but it turns out that developers don't use this anymore, so it is safe to remove. Maybe it make sense to mention this in commit message :)

Sounds great.

Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>

>
>>>        { IVPU_HW_IP_37XX, "intel/vpu/vpu_37xx_v0.0.bin" },
>>> -    { IVPU_HW_IP_40XX, "vpu_40xx.bin" },
>>> +    { IVPU_HW_IP_40XX, "intel/vpu/vpu_40xx_v1.bin" },
>>>        { IVPU_HW_IP_40XX, "intel/vpu/vpu_40xx_v0.0.bin" },
>>> -    { IVPU_HW_IP_50XX, "vpu_50xx.bin" },
>>> +    { IVPU_HW_IP_50XX, "intel/vpu/vpu_50xx_v1.bin" },
>>>        { IVPU_HW_IP_50XX, "intel/vpu/vpu_50xx_v0.0.bin" },
>>>    };
>>>      /* Production fw_names from the table above */
>>> -MODULE_FIRMWARE("intel/vpu/vpu_37xx_v0.0.bin");
>>> -MODULE_FIRMWARE("intel/vpu/vpu_40xx_v0.0.bin");
>>> -MODULE_FIRMWARE("intel/vpu/vpu_50xx_v0.0.bin");
>>> +MODULE_FIRMWARE("intel/vpu/vpu_37xx_v1.bin");
>>> +MODULE_FIRMWARE("intel/vpu/vpu_40xx_v1.bin");
>>> +MODULE_FIRMWARE("intel/vpu/vpu_50xx_v1.bin");
>>>      static int ivpu_fw_request(struct ivpu_device *vdev)
>>>    {
