Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C199F990B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 19:07:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9863710F026;
	Fri, 20 Dec 2024 18:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SP5iT7Zx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945D210F024
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 18:07:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhAvDrp5o9uBb+ztvuTIk2ENyE7G1B0CQ50s9mFq3CL1IoHak6jdqzpajcVqwlfaIfFn9Xu401qgcIkvJjk1PG4QBuocwoVFR9e6remIueVorZ7iyTwZupx3w68V9HqteQ8mbmtz2pq10C8BpiQl0B7TM+Wz83mlosqztx3mjKK9fPtV0K9i1t2cJSVbml+cUKla2JyaYB8muNOf3BHE+JgiVKjgf52r5bPKDZFlpnRjo+qMWrrW9Rv2/7I658a6pqnxnrPr09EE/Q5GrVVWgkIg2GlIupAy5OUcy/Heyhtjr8YGqZTLgzzOyckesPFpauVq2x/V5/lBi9Kk1ORubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hk1DPUxb5VpOJRhExIA2DLyEWgeMEHC6LOtcMYNZ0G4=;
 b=TLoU2Cj7V/OaO2u9Q79qucT/5qi5bOuUIDmtsg6e7Gy8eQLxp1Rr7RBdfokWJ0QjbjIZfIqGDaqjxgpiJA5B2De4PpUDCJqylVdbQ5fuOIa3sFZrmn83XiNNgijkT1Pu3u/35KvwXAD//uDIerTMNggv/UEfEMs9mBS2E0SJb114fWG+IZN26q5xHDl6nD75xu1+HJ1lI3WN6XHpAZ5j7BA9pTqpShXcJo5sA18IrM8QO2ImRdoRYd6Hig52C370VynlYRumVycvuYNxHJSfWx2F41GUaqNjF7230la9CFXVCvjIpHoZZ8HyCpS1Hl4QoobnF4tF4vGdOdZdKrKORg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hk1DPUxb5VpOJRhExIA2DLyEWgeMEHC6LOtcMYNZ0G4=;
 b=SP5iT7ZxE+dLaQ211CpWmK+JPTFlmbFmCiuhlgiAXiKKR9TM5QWN6LXvOtWfrspBDS/o79kBWtsqblNJpdIHvhb11M1Thpq6TlLUIFiaimuNbD1H/SHXxVct4VfPIpdTuS19EVlqzKmts2MIjuNXthVf8LHHfk8fRBqmyeUFJZ0=
Received: from MW4PR04CA0038.namprd04.prod.outlook.com (2603:10b6:303:6a::13)
 by BN5PR12MB9511.namprd12.prod.outlook.com (2603:10b6:408:2a9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 18:07:19 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2603:10b6:303:6a:cafe::6a) by MW4PR04CA0038.outlook.office365.com
 (2603:10b6:303:6a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.16 via Frontend Transport; Fri,
 20 Dec 2024 18:07:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 18:07:19 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 12:07:17 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 12:07:17 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 20 Dec 2024 12:07:16 -0600
Message-ID: <fb92e217-8f0f-3bf2-1b81-ab0705e47732@amd.com>
Date: Fri, 20 Dec 2024 10:07:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 7/7] accel/qaic: Add AIC200 support
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <quic_carlv@quicinc.com>,
 <manivannan.sadhasivam@linaro.org>, <quic_yabdulra@quicinc.com>,
 <quic_mattleun@quicinc.com>, <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <jacek.lawrynowicz@linux.intel.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <mhi@lists.linux.dev>
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
 <20241213213340.2551697-8-quic_jhugo@quicinc.com>
 <65a59247-f028-28f9-1a65-5e4dd62dadec@amd.com>
 <dd83ba8c-0b37-7d1e-39a7-4b25ef7e5faf@quicinc.com>
 <ce41ab48-a923-7a29-1c50-3338fed39ea6@amd.com>
 <ed88797f-9094-ed93-5036-0af42767dbe3@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <ed88797f-9094-ed93-5036-0af42767dbe3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|BN5PR12MB9511:EE_
X-MS-Office365-Filtering-Correlation-Id: 58a9b5ad-9f7b-478a-516b-08dd21212508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnRZOG45NDkzeHlRc2JOYklGb1FRZ3c5RDhUdDlZejRmakZFekdZcWFMZ3g4?=
 =?utf-8?B?Mlhrb05veDc3RDBVSFZqMUtWbjduQWJXVlZrZW4vcDgySmhUd0VrZjdLK0V0?=
 =?utf-8?B?WmF0SHpFam5SRFA5VkhTTllxWWppb3NtZjJYRy9zMFcvRHozNVV0MDVBbWp3?=
 =?utf-8?B?eUlzcXJwaXlqaHFzYVBuY2tKSlF5cW05eXR5QkU1UjJEVUZ0RjRVUlUzVjJt?=
 =?utf-8?B?U2NQM1ZkcEI3aW5WNVJSakRubHlHZXZoKzNOLzlIWTQyOVBXVzBNYzZEeEpK?=
 =?utf-8?B?NTVLeWIzenBwU2U0QXhBWWl1NHIvOWtUd1BnT1BUTmFxeC80Ty84NGpjOG51?=
 =?utf-8?B?bS9jNXc0MkIrZFlwLzJPRHI2Um1RQkJzSmxrZ2JBUWwwMTJNUnRPZmdqa0Vx?=
 =?utf-8?B?TUtsbDVLUnRsSjlycnZQc3YwbXpBMGkydGN1Z2Z4VEdSVld0dGdzWERnRWJ4?=
 =?utf-8?B?Y3JRejhLMmVDY2txSkRkZjdEQXpLdEpiMG0vd2xRUWQyQTV4TlgyOGVnNWdm?=
 =?utf-8?B?NitwOGZ1RUVtT0p3UUlnY3lPZFVSUTNyMzdONUcrZE84bmNJL0x6MWkwSktU?=
 =?utf-8?B?VWtXTTRaYkh0dFRhWEc0MDR5dlRzRzk2WERnT1ZJOTl0K0M0eU01YnhIeWh2?=
 =?utf-8?B?eEtvRVVpcTEvSmsyOFRHZ0lPaDVVTE50cG9OZy8yNUcrS2hLQ0VKYXlCZFBG?=
 =?utf-8?B?NUNLOVcrU2ZlcXpxK21iTEhLdVFyS1QzVWZmbmQ3ZndpWHVXTlMrdEVBOXBM?=
 =?utf-8?B?S2VpY1JUWmdQLzBJNTRLREpacm5WbVRDMUYwalZ3MmgwbUt0NkhTOHllaXN1?=
 =?utf-8?B?bG1Fb1I0Mk0wcmVFR3huMC9maUg4T0lqYXUyTExKRUNiZllwbVRBTnVkU21G?=
 =?utf-8?B?QWIydjN2RHdWbit3VndCa3Q5eWtxNjhmWkZLcXRhR2VWRnNKR2wvbXEvUENV?=
 =?utf-8?B?WXdHWGh3bHhrblMzRGVuQjV0UDRiTVpZZ3NhMnBYTGl3QlpxdkowNFBNekwy?=
 =?utf-8?B?N3hwY3ppY1YzM3oyK1VlcVhlTmlwRUpEQmduWlVuUlo5NUM1UHB0T1lEeHo1?=
 =?utf-8?B?MThTdXVRSlB1ZFB1TTJWSmMzN1pTUFdqaTFMK2hGL3lRN2NleWFDcjBZUU5v?=
 =?utf-8?B?dzRPT3FNRE4zRXZrZW9Rdk82UHd0b0crYW56OHk0cWp2VXFaRUh2cUxtd2FF?=
 =?utf-8?B?LzJqMnVWU0xrMFd3Ni9OQ20vL0xueXg5QkZFd1hxUDY1M1QvbVlJOWdnZk9h?=
 =?utf-8?B?alRRNGQ4eDYvRi83cGpmY2xLQ1NNZUg1cTdlbXovM1NUUEFMVHRZTkpuMmRD?=
 =?utf-8?B?NmN5Tkt0OTUwVzFGc3p4RFh0Rm1TZXB5VjhJS1AvVG5zZ1JHOEx3Zk8vRmhY?=
 =?utf-8?B?Uy9vdHlBRVVHQmM3ZFpLQ2ZEaDltaEVCbnBnTGx2Y09BazFKLzVvU0h2dWFN?=
 =?utf-8?B?SE9xK1RSWWJuUWhQZkQwTTNEWXhXT01KMU1haW10QlBxT0R0bHMxQjlLOXZG?=
 =?utf-8?B?WWliWE5xT0x3YWkyakFScUQzNC9kM0dlYzdaTWRmV3Jsc2lDYXNwaUd4WkpX?=
 =?utf-8?B?Zzg0bUVkaFNqZ0JkTXR3MURiMTcwb1BtVElJRDhKYTY1UFRIQmtWRjcvb29X?=
 =?utf-8?B?YzJtRHhXQndENHhOOHMyTno4UU01MzJNMisvZ1hidW1xT0hIaTluVE9KdjJE?=
 =?utf-8?B?K3NPdDJYVlYzaDlJOUtGTFQ1VXdqOEkzYldWd2hXSzdndkVuUThLWXQ0elRX?=
 =?utf-8?B?UTgxT055M3puUnpxNGVPT2FnVVZwaHJwbnJnL1N2N3JpKzdMYzlwQWxzZnZp?=
 =?utf-8?B?L0F0Z0ZVRVN0eDRJaE9QL2lYSERlQ2pmbG5BMjV4bmVmSllHRnBGbnJTZEYx?=
 =?utf-8?B?ZFVmYVJEYVo5SGRtZ0RLZzl1d0FuY2YrZkkvMG1wWWtYNUpuUnZtNlBEWFFH?=
 =?utf-8?B?QVRSTURkdERUR3hqWWhpbFlwZkhRcXBzdzM4U0NQSmJDNmJHOWhuOXhGa01R?=
 =?utf-8?Q?lbfyYxAu32jt2QdB7w6C1jgMEGxz98=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 18:07:19.3699 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a9b5ad-9f7b-478a-516b-08dd21212508
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9511
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


On 12/20/24 09:50, Jeffrey Hugo wrote:
> On 12/20/2024 10:33 AM, Lizhi Hou wrote:
>>
>> On 12/20/24 09:26, Jeffrey Hugo wrote:
>>> On 12/13/2024 5:49 PM, Lizhi Hou wrote:
>>>>
>>>> On 12/13/24 13:33, Jeffrey Hugo wrote:
>>>>> +static const struct qaic_device_config aic200_config = {
>>>>> +    .family = FAMILY_AIC200,
>>>>> +    .bar_mask = BIT(0) | BIT(1) | BIT(2) | BIT(4),
>>>>
>>>> Will this pass the BAR mask check in init_pci()?
>>>
>>> Yes, BITs 0, 1, 2, 4 would be 0x17 and that value is & with 0x3f 
>>> (masking off upper bits).  The result would be 0x17.
>>
>> It seems BIT(1) is not expected in init_pci?
>>
>>      if (bars != (BIT(0) | BIT(2) | BIT(4))) {
>
> I think you are only referencing patch 5, when you should also 
> reference patch 6.  This check gets modified in patch 6 -
>
> -    if (bars != (BIT(0) | BIT(2) | BIT(4))) {
> -        pci_dbg(pdev, "%s: expected BARs 0, 2, and 4 not found in 
> device. Found 0x%x\n",
> -            __func__, bars);
> +    if (bars != config->bar_mask) {
> +        pci_dbg(pdev, "%s: expected BARs %#x not found in device. 
> Found %#x\n",
> +            __func__, config->bar_mask, bars);
>          return -EINVAL;
>      }
>
>
> Do you still see an issue?
No. :)
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
