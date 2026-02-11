Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GHBHtL7jGlnwgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 22:59:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB5A127EFC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 22:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D42610E664;
	Wed, 11 Feb 2026 21:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="barkhG3x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010030.outbound.protection.outlook.com [52.101.61.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53C010E664
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 21:59:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O9JS1jOe1k3gzDfpdqqMELUAHnAV6guAi1vrRW65SvRFoMDE+l4SZ8JR4JMlrIDRoYMZVMgksewlCtFozUV+2X3WyrUH/UIa+uLeYlz5WGOAePOcncz10rt/mhZcsdpEcDzb9wQRD+tp0S4ARtZevzqs0C02jWD/5huwjVYAgjPjM6mlwaHMM8IGNj28Z17oFttmaQ1/9wKj+keha/yHmgEjK/bZxsOJbvOdrms+PUAYrJpuXw+/j33Gt2sSVILULGRvUNABCUzBfxbqgiv+Xj1oQ8GqG+mvYuvkx6afqY/JbmRw17qh1SV6B4nNG7M65AuaWicPkAmhMYIej1g0NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2UYv36powwAq4ASDhTGSz7EqJDBvzcf5aXTXvXqw+I=;
 b=Es/FNfbVnXkWziwfpUozQTFr0TY+K53ZuE3V43tcTOQ/zqaguKtRCrgH3Y0zj0Dsb+MLmNnSFb8e45dCzSyev+Dr9yiCtciurQtmQMi6rfypC/FQ91HXn/w4ocXGP0Is79YmNXeK6NRMXn4LIO3/vcd+6lfgmYAFvddW/tdlqRsltuoIXnkrU7lx1jRa8oV/WS+SlMh8cMBGNi9qn3llRowij3hexxYgO4PeZXjayuz/vHP6GIoqvuQq/pvq/hfXpTQtq/o8aFt6rLXxoZvu/63pYR8fyknxv2XZSFdh545iNpkvJMnoIhmGA4rlzc4K2vJ9hUv/9ud/RyFGxtaWEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2UYv36powwAq4ASDhTGSz7EqJDBvzcf5aXTXvXqw+I=;
 b=barkhG3xQdm8Thxqr8HHYOvH2rdQOmGj6/UBCVtcHofDBdVZzHqMst5zRNpsVI5Z/6N72KoInIYaqo2obx1S++qXpkbJlOKCcyYi6DZf2cW3L49Es+5F1ueo94Be84PZS51eCA+kOFPhmoqbxvWeb1Zj1ebhx4lNT0mgSVd8mRo=
Received: from BN9PR03CA0475.namprd03.prod.outlook.com (2603:10b6:408:139::30)
 by CH2PR12MB4038.namprd12.prod.outlook.com (2603:10b6:610:7b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 21:59:37 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:408:139:cafe::cd) by BN9PR03CA0475.outlook.office365.com
 (2603:10b6:408:139::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 21:59:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.0 via Frontend Transport; Wed, 11 Feb 2026 21:59:36 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Feb
 2026 15:59:36 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 11 Feb 2026 15:59:35 -0600
Message-ID: <ade9f2b8-3bec-77e2-d5ab-6850a7ee3f9b@amd.com>
Date: Wed, 11 Feb 2026 13:59:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2] accel/amdxdna: Fix dead lock for suspend and resume
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20260211204644.722758-1-lizhi.hou@amd.com>
 <5fae036f-1ce6-4276-9376-b26209d2a67f@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <5fae036f-1ce6-4276-9376-b26209d2a67f@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|CH2PR12MB4038:EE_
X-MS-Office365-Filtering-Correlation-Id: 876df430-552f-449c-f05a-08de69b8d901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TytiaUlEaENRVktXS3dFRUw3cUpNS1lZRmVtV3E4Vkt2R3BsSmlZUGxHQW1U?=
 =?utf-8?B?UzJPY2IwTFZxdVJWQ2p1V1RSR1FKcDJtU2tBMDJMTWdrWW5tblVJS2JtUTZj?=
 =?utf-8?B?bkR3c0dWWWZFeGo3TGFFYldlbmlSaXkwekZxQ1pRRmNFRkhSUElpTUhkR0g0?=
 =?utf-8?B?R04xMnBRREFYcTQ2ZUsxSjJqOTlSOEhReFRmd2Jla3JsWTRlMjdRTHVJVWZM?=
 =?utf-8?B?QitOY1JoOHM2NXNpc1VERk9MWnZaNHhXTlhJWktTOVl2YlR1Yi92TlVDQmc4?=
 =?utf-8?B?VjZxZ0JpM0l0dG5xUzBCbmtjZXdIb3ZMV25XRkJybXZOQnNPVGNiNUVoME1q?=
 =?utf-8?B?aXduS1RDSmw3REtEd04yUUtrVE96cGg3YnUzYkJQcU0wMGVyR1JwcHRXOUsw?=
 =?utf-8?B?WnNrVWtDYXNqWktJaHIwNTZOL1RVTkduNGw5ZVFzK1RFOCtwYWovR0t3Qlhq?=
 =?utf-8?B?cjNoVVB5WWdPSzN6NHYreHIrNys3ais4UllLUXljWkNmeVBqQjZUNHY3VG1w?=
 =?utf-8?B?OXlMZEdVL29NSjRQbm1qdDNjVzBxdFVINUVLNXprYlRwVWx0cVgrcFVqbkJD?=
 =?utf-8?B?TUJGTmRTRFFLYWJvWThXaVFCZ2xMUG4ydmRrZmFTemN3VVkyQ1VnbFJLTDZS?=
 =?utf-8?B?SFFrdURnQzF4emEvVHExM3BKcUNlRGcyU2VIdkNTeVlhMWNvMGhyQ3hjRm5u?=
 =?utf-8?B?cUhwQkdURWJsUjdTRFQ1MDVmbW1oSTZJTXJLMEtNS0VqY01rU1pmcjVBOFk3?=
 =?utf-8?B?NUk5TzJueDUvbklsVzVjVi9SZzljczgzVjB3YXpyc1lZQ3U2aW9LUkVoaDhj?=
 =?utf-8?B?UmpMM3pMS0U5Z3BNQmlzTE1NdzdDY0wrZmpwT3dwN1lSVy9HY0lTZG9VWmJD?=
 =?utf-8?B?YzJ1UThNMUR2NklTRUE2UU1aejRET2l3WC85OG1GTzFRd2VYL01ZZDdTZS92?=
 =?utf-8?B?NE1jMDdJUUwvVlNzV0dlRTFkUlFiN1pFWGNQNVY1eCtzM2txL1pRd0I3cDMr?=
 =?utf-8?B?eXF1UGhEeE1ySHgyZmFxQmdnVWRFUU9WY0ljRjFaUHJDTjhIQnN6MGphbk8x?=
 =?utf-8?B?RzRFaU9yODlBaVR1cUE3UE4xY2FieDVVd0ZhYXFtelFFeFFMMFlOZm82MjN5?=
 =?utf-8?B?VU5ITmVCMGh2ZUpHTzY5MWtiQ0NvT1paYnVDTFYvWlVjSG9VR3ZKWDlqZ290?=
 =?utf-8?B?Q1RTUnBSY3kwNmpoL3VHUzFvVlNHamwwK2lscTkxcHJibXQ1VkJQbVBLWDFm?=
 =?utf-8?B?T0J1N1N0bXhGNkUxNGUvZmk3MHVTZ0NPRFdvQ3lBZVVSUXhrU21sc0xzNitr?=
 =?utf-8?B?L0FFWHBCSHJsU2drRU1XYXFlM0luR0pZQzlndS9WdGRwVG4yaDZGSW80TElq?=
 =?utf-8?B?TW4wTFQ4UWNZRTVqdk5ickNpaWlLNXc3emJVRmhTUG1QYmRpeVdSZThJTlkr?=
 =?utf-8?B?UnFaM29nT29vMlJINGd2QmUxVlI0MHVDZDQyZ2k1YjgwZ2hJeUhsdHRoakVo?=
 =?utf-8?B?WWtuY3pUNG5FSGhpOEdFeDNYc0xhbDR3SzI2ZnJYTVYyYjlzR3JsSGlBcUhw?=
 =?utf-8?B?VUl4TitQdzJCMktJcVFFWXQvN3VWN0pKdXhBUFNPUXJMZjFoUnlHbDNzY3h4?=
 =?utf-8?B?d2tnNWh0dzNRNVV2TC9TenFzV0lqK2hJeFBDVmoxTHhPYUdVT2YrU2xEdlVZ?=
 =?utf-8?B?TVVLZkdBMkI3enRxR0pHaURpZk5iNUZXd2ppQVRLa0crcEQ5aU5uVzBoMDVK?=
 =?utf-8?B?MVpFM0xtOWJseS9VMUtLREtBWEZCcjlZT2FCdnlsYlZoejZVVVl1RGE1Y01n?=
 =?utf-8?B?Wm9PdzhSY1FUNWh4d1dieUhCMGN2cVFxV25razRIdHQ2Mmp1SmNMbDh6bmlx?=
 =?utf-8?B?MWNOUTdtMElmbVEzeERlVElOWlVTVWZTQnZFVkl3MG9ELzI1UkFTTk9xODJF?=
 =?utf-8?B?RVpOK1FudzlTZUg1S01zUDhDTHdvUU9vVjdKZk1jV3BtRkJ2dERCWE4xNC9x?=
 =?utf-8?B?Nis2L3VaRWhQb0x0cisvci9IVk5XL2ZSckpkRStXYUt0dmFVUllEb0RIMlBh?=
 =?utf-8?B?ZkJHUCt4ckpYZ0RzQm9IeWtmcUVBblBkcXd5UytUdGFuMGVFSTZOcUVOUkVT?=
 =?utf-8?B?Zm1uTHdyc1ZlNXhPcmVwenlMTC9kNGQzWnJCUnN1Q0dwOGZkbUlwTFdCV1pH?=
 =?utf-8?B?Sko0Tk1KTHRmVnpwaU1pekpMdkdmVlcwTWk1b04wZGJRbG1wc3ZIM0xRSlpl?=
 =?utf-8?B?MXBHb3lKUGhEWTRHeE8yYWhSdHN3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dI/8VRu5t2acntpm+mW88nXspLptxs2OS3iA3h0Buup5tYubLasIGJtArGYDiyTQ8SpLU2iVHXWuMzFoHswNUhcF/uVvyrBhXBrWfLhd+ZkcgS9l88GA8SyXz11WJNnqbTJqmbG7oqyz/fX09ywR/raLhZEaE4IbxAReLqoL50IuYCkjYMCta/yQrNTSfajt8FrjD41udxBPZpfxbNiP1AcxwqzT0dsGRA54wDDGzhwjAnBGVv1wIzMANFfRjKd/ewpCLeGRZMI9R6EbraRpEQyN4VtNJKAcBxdnsWhcVHNHtgeddgiY48ph9YguiF7a/Pdd9gWr2upGbUp2C50s9E5B1+OkOEVunROhmUL0fYzoXHFQaoxrCr/ZB7pq6rQ6eSJvXzXP1JpRXaIyx+wxqGKb7ldwLYIOitQFJTfjFGtR9CF4OszViuBkw0/1Gy0E
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 21:59:36.8448 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 876df430-552f-449c-f05a-08de69b8d901
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4038
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS(0.00)[m:mario.limonciello@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BCB5A127EFC
X-Rspamd-Action: no action


On 2/11/26 13:54, Mario Limonciello wrote:
> On 2/11/26 2:46 PM, Lizhi Hou wrote:
>> When an application issues a query IOCTL while auto suspend is running,
>> a deadlock can occur. The query path holds dev_lock and then calls
>> pm_runtime_resume_and_get(), which waits for the ongoing suspend to
>> complete. Meanwhile, the suspend callback attempts to acquire dev_lock
>> and blocks, resulting in a deadlock.
>>
>> Fix this by releasing dev_lock before calling 
>> pm_runtime_resume_and_get()
>> and reacquiring it after the call completes. Also acquire dev_lock in 
>> the
>> resume callback to keep the locking consistent.
>>
>> Fixes: 063db451832b ("accel/amdxdna: Enhance runtime power management")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/aie2_ctx.c    |  4 ++--
>>   drivers/accel/amdxdna/aie2_pci.c    |  7 +++----
>>   drivers/accel/amdxdna/aie2_pm.c     |  2 +-
>>   drivers/accel/amdxdna/amdxdna_ctx.c | 19 +++++++------------
>>   drivers/accel/amdxdna/amdxdna_pm.c  |  2 ++
>>   drivers/accel/amdxdna/amdxdna_pm.h  | 11 +++++++++++
>>   6 files changed, 26 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_ctx.c 
>> b/drivers/accel/amdxdna/aie2_ctx.c
>> index 37d05f2e986f..58e146172b61 100644
>> --- a/drivers/accel/amdxdna/aie2_ctx.c
>> +++ b/drivers/accel/amdxdna/aie2_ctx.c
>> @@ -629,7 +629,7 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>>           goto free_entity;
>>       }
>>   -    ret = amdxdna_pm_resume_get(xdna);
>> +    ret = amdxdna_pm_resume_get_locked(xdna);
>>       if (ret)
>>           goto free_col_list;
>>   @@ -760,7 +760,7 @@ static int aie2_hwctx_cu_config(struct 
>> amdxdna_hwctx *hwctx, void *buf, u32 size
>>       if (!hwctx->cus)
>>           return -ENOMEM;
>>   -    ret = amdxdna_pm_resume_get(xdna);
>> +    ret = amdxdna_pm_resume_get_locked(xdna);
>>       if (ret)
>>           goto free_cus;
>>   diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>> b/drivers/accel/amdxdna/aie2_pci.c
>> index f70ccf0f3c01..5b326e4610e6 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -451,7 +451,6 @@ static int aie2_hw_suspend(struct amdxdna_dev *xdna)
>>   {
>>       struct amdxdna_client *client;
>>   -    guard(mutex)(&xdna->dev_lock);
>>       list_for_each_entry(client, &xdna->client_list, node)
>>           aie2_hwctx_suspend(client);
>>   @@ -951,7 +950,7 @@ static int aie2_get_info(struct amdxdna_client 
>> *client, struct amdxdna_drm_get_i
>>       if (!drm_dev_enter(&xdna->ddev, &idx))
>>           return -ENODEV;
>>   -    ret = amdxdna_pm_resume_get(xdna);
>> +    ret = amdxdna_pm_resume_get_locked(xdna);
>>       if (ret)
>>           goto dev_exit;
>>   @@ -1044,7 +1043,7 @@ static int aie2_get_array(struct 
>> amdxdna_client *client,
>>       if (!drm_dev_enter(&xdna->ddev, &idx))
>>           return -ENODEV;
>>   -    ret = amdxdna_pm_resume_get(xdna);
>> +    ret = amdxdna_pm_resume_get_locked(xdna);
>>       if (ret)
>>           goto dev_exit;
>>   @@ -1134,7 +1133,7 @@ static int aie2_set_state(struct 
>> amdxdna_client *client,
>>       if (!drm_dev_enter(&xdna->ddev, &idx))
>>           return -ENODEV;
>>   -    ret = amdxdna_pm_resume_get(xdna);
>> +    ret = amdxdna_pm_resume_get_locked(xdna);
>>       if (ret)
>>           goto dev_exit;
>>   diff --git a/drivers/accel/amdxdna/aie2_pm.c 
>> b/drivers/accel/amdxdna/aie2_pm.c
>> index 579b8be13b18..29bd4403a94d 100644
>> --- a/drivers/accel/amdxdna/aie2_pm.c
>> +++ b/drivers/accel/amdxdna/aie2_pm.c
>> @@ -31,7 +31,7 @@ int aie2_pm_set_dpm(struct amdxdna_dev_hdl *ndev, 
>> u32 dpm_level)
>>   {
>>       int ret;
>>   -    ret = amdxdna_pm_resume_get(ndev->xdna);
>> +    ret = amdxdna_pm_resume_get_locked(ndev->xdna);
>>       if (ret)
>>           return ret;
>>   diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c 
>> b/drivers/accel/amdxdna/amdxdna_ctx.c
>> index d17aef89a0ad..db3aa26fb55f 100644
>> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
>> @@ -266,9 +266,9 @@ int amdxdna_drm_config_hwctx_ioctl(struct 
>> drm_device *dev, void *data, struct dr
>>       struct amdxdna_drm_config_hwctx *args = data;
>>       struct amdxdna_dev *xdna = to_xdna_dev(dev);
>>       struct amdxdna_hwctx *hwctx;
>> -    int ret, idx;
>>       u32 buf_size;
>>       void *buf;
>> +    int ret;
>>       u64 val;
>>         if (XDNA_MBZ_DBG(xdna, &args->pad, sizeof(args->pad)))
>> @@ -310,20 +310,17 @@ int amdxdna_drm_config_hwctx_ioctl(struct 
>> drm_device *dev, void *data, struct dr
>>           return -EINVAL;
>>       }
>>   -    mutex_lock(&xdna->dev_lock);
>> -    idx = srcu_read_lock(&client->hwctx_srcu);
>> +    guard(mutex)(&xdna->dev_lock);
>>       hwctx = xa_load(&client->hwctx_xa, args->handle);
>>       if (!hwctx) {
>>           XDNA_DBG(xdna, "PID %d failed to get hwctx %d", 
>> client->pid, args->handle);
>>           ret = -EINVAL;
>> -        goto unlock_srcu;
>> +        goto free_buf;
>>       }
>>         ret = xdna->dev_info->ops->hwctx_config(hwctx, 
>> args->param_type, val, buf, buf_size);
>>   -unlock_srcu:
>> -    srcu_read_unlock(&client->hwctx_srcu, idx);
>> -    mutex_unlock(&xdna->dev_lock);
>> +free_buf:
>>       kfree(buf);
>>       return ret;
>>   }
>> @@ -334,7 +331,7 @@ int amdxdna_hwctx_sync_debug_bo(struct 
>> amdxdna_client *client, u32 debug_bo_hdl)
>>       struct amdxdna_hwctx *hwctx;
>>       struct amdxdna_gem_obj *abo;
>>       struct drm_gem_object *gobj;
>> -    int ret, idx;
>> +    int ret;
>>         if (!xdna->dev_info->ops->hwctx_sync_debug_bo)
>>           return -EOPNOTSUPP;
>> @@ -345,17 +342,15 @@ int amdxdna_hwctx_sync_debug_bo(struct 
>> amdxdna_client *client, u32 debug_bo_hdl)
>>         abo = to_xdna_obj(gobj);
>>       guard(mutex)(&xdna->dev_lock);
>> -    idx = srcu_read_lock(&client->hwctx_srcu);
>>       hwctx = xa_load(&client->hwctx_xa, abo->assigned_hwctx);
>>       if (!hwctx) {
>>           ret = -EINVAL;
>> -        goto unlock_srcu;
>> +        goto put_obj;
>>       }
>>         ret = xdna->dev_info->ops->hwctx_sync_debug_bo(hwctx, 
>> debug_bo_hdl);
>>   -unlock_srcu:
>> -    srcu_read_unlock(&client->hwctx_srcu, idx);
>> +put_obj:
>>       drm_gem_object_put(gobj);
>>       return ret;
>>   }
>> diff --git a/drivers/accel/amdxdna/amdxdna_pm.c 
>> b/drivers/accel/amdxdna/amdxdna_pm.c
>> index d024d480521c..b1fafddd7ad5 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pm.c
>> +++ b/drivers/accel/amdxdna/amdxdna_pm.c
>> @@ -16,6 +16,7 @@ int amdxdna_pm_suspend(struct device *dev)
>>       struct amdxdna_dev *xdna = to_xdna_dev(dev_get_drvdata(dev));
>>       int ret = -EOPNOTSUPP;
>>   +    guard(mutex)(&xdna->dev_lock);
>>       if (xdna->dev_info->ops->suspend)
>>           ret = xdna->dev_info->ops->suspend(xdna);
>>   @@ -28,6 +29,7 @@ int amdxdna_pm_resume(struct device *dev)
>>       struct amdxdna_dev *xdna = to_xdna_dev(dev_get_drvdata(dev));
>>       int ret = -EOPNOTSUPP;
>>   +    guard(mutex)(&xdna->dev_lock);
>>       if (xdna->dev_info->ops->resume)
>>           ret = xdna->dev_info->ops->resume(xdna);
>>   diff --git a/drivers/accel/amdxdna/amdxdna_pm.h 
>> b/drivers/accel/amdxdna/amdxdna_pm.h
>> index 77b2d6e45570..3d26b973e0e3 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pm.h
>> +++ b/drivers/accel/amdxdna/amdxdna_pm.h
>> @@ -15,4 +15,15 @@ void amdxdna_pm_suspend_put(struct amdxdna_dev 
>> *xdna);
>>   void amdxdna_pm_init(struct amdxdna_dev *xdna);
>>   void amdxdna_pm_fini(struct amdxdna_dev *xdna);
>>   +static inline int amdxdna_pm_resume_get_locked(struct amdxdna_dev 
>> *xdna)
>> +{
>> +    int ret;
>> +
>> +    mutex_unlock(&xdna->dev_lock);
>> +    ret = amdxdna_pm_resume_get(xdna);
>> +    mutex_lock(&xdna->dev_lock);
>> +
>> +    return ret;
>
> Like the other code you added in this patch, couldn't this be 
> simplified with a guard(mutex)?

This is unlock before resume_get, then lock after. guard(mutex) might 
not help here.

Lizhi

>
>> +}
>> +
>>   #endif /* _AMDXDNA_PM_H_ */
>
