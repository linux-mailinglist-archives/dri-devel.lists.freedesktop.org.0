Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOncK1EefWlQQQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 22:10:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A41BEB97
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 22:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CC010E239;
	Fri, 30 Jan 2026 21:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nXpGKMC9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011000.outbound.protection.outlook.com
 [40.93.194.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4669C10E239
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 21:10:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OobF5xTdA0fupyQQSqSU+4/TIanJPyZQUPkbjqXSOsXKE4Cx4kjwCHTv1oSWJ1spbOVBphA39y6RjuD2Bt2t9cvN1QM22msMBDqsW7EHSxmyucLeNxWPvKAQAeUHXwP4zbWNseaSFDJJL4U3e6CDwOJzHVGUtkM0uC8q3q2/Gg1MOTHQfSGxpOL374N9X6TyhXwznexBKYBpDISl/nWsft+vDb/grtGXHx/ut4dXx6sPefrGo1VrmzTF43Megk6sQ/Do6JdjBaYdTnVUc7WFM6GxS+qH3mB9D4AarCv8h7UUnVz9r3ie+GzCTWBhJoL+MTOeqgUK9ZEoJZpzE71vcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZbvuyyieZWDczwhU44B1lvhMkVbXYuaCX/Zjviyp98=;
 b=YUbstjKYYEifKJMMURDBtiZlWoAw6Fn9TaNO4y1+97cltgcp6R74z6TiNEeGS6MlBret9K4KpgiZg6ev8NjhvW16oOv0u9Z3yw14T9gZX3Se7qcsB3sHaMNDnGMXHqoD6QBuqF47/8BPwNewctULytRnubB0SAAaZYfsHoVMGCE4tCexUDpPtoGUfMV25HZyAGXuh+9Be9W1tJ8afbiQ4Xq73BPQ5GDAp9ksJHRQJL3JCK132L5y/iY6iUp9KDo6ap6lzXBlZKhJaK9osRoFwLhifOsTLOS2V61SJaR2y9D40L0rKg47onGeFlCFqNukW6AcvwutdhlY6VRCX93IKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZbvuyyieZWDczwhU44B1lvhMkVbXYuaCX/Zjviyp98=;
 b=nXpGKMC9ppfNTTJCH0Zq7+keUumzkQfMmJSTXqwOD1fuTZaCTT55hShKeh1lbMTN2ku76OHB3YMWfSyhP+BjHIdoFW947Z2PitbcOeAGTbNJxFo4J5kQz6q7GCgvzMc2PT7YI3iM9msU55RbMbAPxrAfYRyoK/UTlIasLtAYcQE=
Received: from SN6PR01CA0009.prod.exchangelabs.com (2603:10b6:805:b6::22) by
 MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.12; Fri, 30 Jan 2026 21:10:33 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:805:b6:cafe::4c) by SN6PR01CA0009.outlook.office365.com
 (2603:10b6:805:b6::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Fri,
 30 Jan 2026 21:10:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 21:10:32 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 30 Jan
 2026 15:10:32 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 30 Jan 2026 15:10:31 -0600
Message-ID: <61d54b62-9582-a945-be83-57e651c8691d@amd.com>
Date: Fri, 30 Jan 2026 13:10:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Hold mm structure across
 iommu_sva_unbind_device()
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20260128002356.1858122-1-lizhi.hou@amd.com>
 <bfcf20f8-1390-4add-bf83-1d3087ac05c9@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <bfcf20f8-1390-4add-bf83-1d3087ac05c9@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|MN2PR12MB4342:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a7c92d3-ddba-419d-4685-08de60440105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjFXZ0tCQXkrRDAranNCdEdUVVhBK0NjbTJtMmJJYUxSU2E2WHBJZU9HYmdX?=
 =?utf-8?B?WVRWQS9pSkwxcUowaGg3bHY4M3c5S3JneWRtM1lxbXlRUVIra0ZYMDJVMTNm?=
 =?utf-8?B?ejllaktzUDVEenJCTUVJeDBjc045TGNKRWhIM3RMcW1GZEd0blU3QVV0Z0xz?=
 =?utf-8?B?c2orYnQ0RkJzQXlxSUV6ZlNLVDlXcUZNK0dzUHVDT2JJMXpCZzEvU3MrQTJM?=
 =?utf-8?B?OWwwdDZsMjM3V2hkZXJiY096c0JNS1prczEzd1gva2pyRUgwZ0c2SkRGTThy?=
 =?utf-8?B?UklzZ1ZKdTdJV0lrTVBpTWZRcDFTSFc1VWRyU2xkeGNIZk1RM2xRb0dvMC9K?=
 =?utf-8?B?d1JGL1VCUk40WXE3bkRwaUNxQTVTd2NZSWJDQkxJdnpmMStsejZ6eDhvUDR4?=
 =?utf-8?B?UWlMRjNVYzFQU2xtNnJlSHBaVldQbVVxOFZhVXl3b1J2Z3RSa2VGTm1IUlFv?=
 =?utf-8?B?WjR5N1h3VzVpZ210QlhaU1VLWVEwUkloQjRsY0djcWw5S1lTOWRjTThsVHhO?=
 =?utf-8?B?UGhTSWkzc2VwRE8yQzh4V3loTnUvcHJhNVYvNWZ6bWpkRmpyTjhaQUcwZjQ4?=
 =?utf-8?B?WmREWWx6U21xcGRaTG8yY0dTT3pUYUliV3lsZGc0YnRpUERidHptY3c2ZG9x?=
 =?utf-8?B?RkxYVHRLTUNSalhQbFkwMVBXMWkxWTNJNTZKK0VkT3dIeUVVdG1WZVhON2p2?=
 =?utf-8?B?Z1pjZnk4dDVwNXFPU0lnN1JLcWdSTXNvQkJ3VnUzTVVNZXNmOGQ4OTFad09P?=
 =?utf-8?B?UHpvUUVSN3JqbXdMMzBxZy9ZUWpJc21QM0ozdFdSWWZmNmFWSmhZbXpPS3Mr?=
 =?utf-8?B?OXQ1R0FsTE9CdWx5SkJLcGFnTUFXYThPOVVNVER0SW5wNXpGMUdPNU9ybTE0?=
 =?utf-8?B?WVdyN0N3UW9hYXNUK2VmYk1sQTlWL0d1WHZnTU5TNis5azFJOGRvMHpORmox?=
 =?utf-8?B?RFBrM3NqYm1GSUpqNjJFNGdwcWFkZldWb2cyVk1MNTJlUllMRG45cmZDS3ZF?=
 =?utf-8?B?eGNTOFpwKzdyYUE1eEpUV1NxcHhjNFR0clpwZ2RsaWE2NmF1WkYrVHkyYUFI?=
 =?utf-8?B?bzUxSXkwRFpuS0U1T1p3VE1aRHVkc0d6VDVNTzFHQSt0R1pDR2Q0WDlzVWZX?=
 =?utf-8?B?M2UzMDBZQjhlQVBBUDk4VGN6blRGMFpjTmJBUUluMGhqK2FSZG9FNWNqRnU1?=
 =?utf-8?B?ZnR5SkZHeG44elNCTXkycjB0K0MwSUwrTDVjMGtRdk1MQW8wSVM2clRzMU1w?=
 =?utf-8?B?UlRRS2JMQTBhOWduakJMeDduRngranFpdGsrNGVPYndpcmd5K0ZKd2E5dlRV?=
 =?utf-8?B?Q3ZDaVYvV2ZJd0ZsTDJsakhmU1hOZmdPNGFCdktuR1lNbm5OTlFqUkF1RVEz?=
 =?utf-8?B?ZnhVUk50SDh4YTdyeUFkYk9rMkZaR1k4RzdZdTEyaW9hR0RscDkxZFRzZ1ow?=
 =?utf-8?B?SUR2KzRJTG82VjZpcHZuUjBSdDFmVnN1Wmk2dzVhRmFOYlJ3d0ZvYk1MdTJi?=
 =?utf-8?B?Y2Q1MG91RjFmSTFEY3BtM2QvYnNuVllrQTJJUXNweDU2NlV3c0NtcjMyQjJq?=
 =?utf-8?B?Snh5aXpid3NSbmoySEI0blY1R0I1cnJ2ZldxU3JSaUU4Q3ZkSUU0L0p2em93?=
 =?utf-8?B?UGh2aE9mYVRuSUxDaEczQWhmdjNCNldLeG9oRlpiK3RUNjFReGN0RHNVdmpR?=
 =?utf-8?B?b2VDQTdKelpUNkNqYjlFZy9ZOHpRdTgxYW1PTko4NFJkNnFTOEJKcU1QdHFC?=
 =?utf-8?B?cE5yNzJEZDRRUUxXdGVDYUhlbU54VERTaGREREY0V2Q4TXcvb1FPNnJDQ2s1?=
 =?utf-8?B?RkdXcEd0RjF6TXFyd0dZOXo4cHI5S3BlME9Yc1V0UStEejVzeEFGMks5aSto?=
 =?utf-8?B?T1RnVmV4RCtVVWttR0hQdlAxZ2FNTUl0cjdZcXZON1dJYWtYOFZ0M0c0MEVB?=
 =?utf-8?B?UUVyUjJXMFJ1WHB0VFZEb1ZyMVpsdWJIbmNjN2VOWmNkWmlVUklVR3hlYjRF?=
 =?utf-8?B?aG9hZHNyaDV1QW1LT2h3WU9kNlpyK0xWYm9JcHJnbUhxNVIvNkhYaWQ4K1B0?=
 =?utf-8?B?VEZiZnkzS0RLM2g1ZUdaQlA2S2l1WUNBdUg4czcxdEhSaDZNNERWYzlXc2Jp?=
 =?utf-8?B?eitNRU84Ymo2RnFGT3pBVzM4Um9GZmFCajdFNzhjK1dybHlsTDQxSjY3bWUz?=
 =?utf-8?B?ODBIN3RVMTVtVy9FaXY5WDBTUUNtQmlXRDNLenJqdE82aSs4ekhud2VOMmNG?=
 =?utf-8?B?eWNwSXZiaXZ3eGRWSnVxZ2JPcjVRPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LSdnA5Q8lILJ5X6BvKQtZ9VsWepxM0+4VnykkOJkBCDfNKyItynQD8jU9yZg7QGqQP05YiBbu+OfJ72inykOImqF6fFzupSV4EDITYzy+tPBARTjW9Mf54le+GHJ35TbE2q3oI7kXoZ8HLXpPiZC68MUZuXERnUNqeCWQUungyGu+oa1nD9zuGuWTxez3+MAY+/KvBNFfXuzqLxukTiBR2+KUaA5UEA5troauIvSfiJbVfxUQDmUJ4TqJEGwL1jARi2XC5gHGeuEjx/RM3RPfk38S/t2jpuaTC6KuCQeXxBjIvYidfoy/EUFHsaBtAoc7l/ckMUs7i+uFRD/U3wrEhMeYI3Inx3XFOJZDfGNTExZty178fYUbaU+qiDR2WfUXRT+9T2nBqwS1Q5HgG2sWjWr7zrAWRUEyZwYnnVHs8Z++ce8pounwX6AyfmYPM8E
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 21:10:32.3991 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a7c92d3-ddba-419d-4685-08de60440105
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4342
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 19A41BEB97
X-Rspamd-Action: no action

Applied to drm-misc-next-fixes

On 1/30/26 11:39, Mario Limonciello wrote:
> On 1/27/26 6:23 PM, Lizhi Hou wrote:
>> Some tests trigger a crash in iommu_sva_unbind_device() due to
>> accessing iommu_mm after the associated mm structure has been
>> freed.
>>
>> Fix this by taking an explicit reference to the mm structure
>> after successfully binding the device, and releasing it only
>> after the device is unbound. This ensures the mm remains valid
>> for the entire SVA bind/unbind lifetime.
>>
>> Fixes: be462c97b7df ("accel/amdxdna: Add hardware context")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> ---
>>   drivers/accel/amdxdna/amdxdna_pci_drv.c | 3 +++
>>   drivers/accel/amdxdna/amdxdna_pci_drv.h | 1 +
>>   2 files changed, 4 insertions(+)
>>
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c 
>> b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> index 45f5c12fc67f..fdefd9ec2066 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> @@ -82,6 +82,8 @@ static int amdxdna_drm_open(struct drm_device 
>> *ddev, struct drm_file *filp)
>>           ret = -ENODEV;
>>           goto unbind_sva;
>>       }
>> +    client->mm = current->mm;
>> +    mmgrab(client->mm);
>>       init_srcu_struct(&client->hwctx_srcu);
>>       xa_init_flags(&client->hwctx_xa, XA_FLAGS_ALLOC);
>>       mutex_init(&client->mm_lock);
>> @@ -116,6 +118,7 @@ static void amdxdna_client_cleanup(struct 
>> amdxdna_client *client)
>>           drm_gem_object_put(to_gobj(client->dev_heap));
>>         iommu_sva_unbind_device(client->sva);
>> +    mmdrop(client->mm);
>>         kfree(client);
>>   }
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h 
>> b/drivers/accel/amdxdna/amdxdna_pci_drv.h
>> index 6580cb5ec7e2..f08406b8fdf9 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
>> @@ -130,6 +130,7 @@ struct amdxdna_client {
>>         struct iommu_sva        *sva;
>>       int                pasid;
>> +    struct mm_struct        *mm;
>>   };
>>     #define amdxdna_for_each_hwctx(client, hwctx_id, entry)        \
>
