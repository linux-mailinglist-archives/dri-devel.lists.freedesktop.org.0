Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D51C16D6E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 22:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FB310E1E2;
	Tue, 28 Oct 2025 21:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oBrviH0d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010029.outbound.protection.outlook.com
 [40.93.198.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B4D10E1E2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:00:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=angN6Apbb+5oj3g9efnLOWOI2xtXEKwfCRo+chu1AGj2jsY6MbmClGx018+imhGYQhUXeNh1G0qFi7JXGPfxFjSZWwDwvaEnt1rGot8qGXEFzWk5t4eDz2lWQs/lNseBWJ6konaC+rm/ia99uhCDRP3qsjKpREZAXhkIsoTY/0IJnBze6Lh5bbJ0okCJXsnKhfUIdBsE4jsNUXE33wIri7qqr2YEsNqCC+de6rUf4GtR4/9aJI1nDdSeZZF4iJtFJPIZgAFmzMVJ3Ks2rX0hZeqiDs7BmRAbK04yXXylf8Hwq54AU0GLT3rnMq0i+ACw6Pvzk54LJbjRyeAMAxiHuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXp903yPhl1IoSb6OXzRqM0cq9GrRDCtUmqFeOrN9Do=;
 b=kFi6eGxIz9+AEbI0kCj6uw5kCe+J/PzrKQWkxOpBYW4d1NpoIqto9vWiR7qK0IhvD9eMtBhbnEfXOfZe5ZCp2VU88x67Ol12CSdKELYtC6sQgAWROahqJ2tPmBTxaRmcqlsG1c569hMxGIsrIDBaTym6SQpqq+X3zfSA1Aw1cwX7ZuU51lGOHyevfReUNLuQ2FYf3xxSNEkYNTvXRXhMwuhP2vrgazYVsLkRXktknm+DGzFbUYOhemP8NNsysmvS/KI1dO1Zc+jsKfkwAjIM6ChUi6QGzLjulrhG15LDwS3T1E5c2eZAxlnodVzTrPcGZy7DLbh4NSOMn7mZUgfDJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=web.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXp903yPhl1IoSb6OXzRqM0cq9GrRDCtUmqFeOrN9Do=;
 b=oBrviH0dyXXi31sunzPxcK9wBYD70YXuc7XjJVQiKXFfbby3BlBZxjiiX52h9pGhNBUwoakUh+yk6I4nmNciy3C73K1CHxSkqrsKpM5vXuVaED3hTrTETmyC1ZnclU4qEPFx1BJxhUXKqWe0bxlvv2RBcPnVJWw815Rc1TlBzBc=
Received: from SJ0PR03CA0349.namprd03.prod.outlook.com (2603:10b6:a03:39c::24)
 by CH0PR12MB8463.namprd12.prod.outlook.com (2603:10b6:610:187::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 21:00:19 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::d3) by SJ0PR03CA0349.outlook.office365.com
 (2603:10b6:a03:39c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Tue,
 28 Oct 2025 21:00:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 21:00:18 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 28 Oct
 2025 14:00:13 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Oct
 2025 16:00:13 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 28 Oct 2025 14:00:12 -0700
Message-ID: <b2cf67a4-6795-d743-e90b-db10f636db2e@amd.com>
Date: Tue, 28 Oct 2025 14:00:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: accel/amdxdna: Fix incorrect command state for timed out job
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>, <dri-devel@lists.freedesktop.org>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Maciej Falkowski
 <maciej.falkowski@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Mario Limonciello
 <mario.limonciello@amd.com>, Max Zhen <max.zhen@amd.com>, Sonal Santan
 <sonal.santan@amd.com>
References: <20251028175452.2329497-1-lizhi.hou@amd.com>
 <b7a2ac2a-53c3-49ce-862d-eaba86f0b298@web.de>
 <605e6f4f-8e96-dbe4-d43d-16bcac63f94e@amd.com>
 <3dd7e061-8e6f-4d3d-b56c-7005da8197f6@web.de>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <3dd7e061-8e6f-4d3d-b56c-7005da8197f6@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|CH0PR12MB8463:EE_
X-MS-Office365-Filtering-Correlation-Id: c0d69a46-387e-4de4-808f-08de1665005d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFA0c2FYSUtxVCtWM3BmVUEwdDI5eHVkL1p6R3drbktkTXhDZCtlUU4wRW5Y?=
 =?utf-8?B?L0gvUC9YZ3dTSHN2c2JldHpBOGUzbFlSSHB2Ykx5dXdub1JQa0ZqbFZGSGJt?=
 =?utf-8?B?QU0xbWRaYkZkRlpoNzA5WkZqK0dzL2p0c2xseGNBV3NqRTVxZ3ZkbXNUSDZY?=
 =?utf-8?B?bk9qUVZURFNONjMzcHpkSzNNa2swdkVhL2h1M01tN0VvVCtGSTlkUlNxUU9y?=
 =?utf-8?B?T0tDTmZ3dElEMHo4L0VRaVJyekoyUGhjdzlkdkNNZnBRVG5tdGxyL0FIQlZs?=
 =?utf-8?B?cXBzc28vYVVMbzVaQ2doaVhjSkZpUlVaNk0zZVFpZ1czNis1SnRLdW9YVUxV?=
 =?utf-8?B?TUtYTlNjNVU4VmNvZHc4U1hvTWMrb0NINmMrM1hNQlJzQjVZb1FBbEdSdlds?=
 =?utf-8?B?VUY5QXpqT2ZNRDFvR2x5VkVQdkUyZ0hjems0eVdBTTcwM2kxcjllNHRjM0dE?=
 =?utf-8?B?UnRiTTZxT2ZaZHFPSkErWXQ3VG5hbUhFR1p4cHJPTkZ3Uk1aaWdJWVhOREJy?=
 =?utf-8?B?VjgvVGRwYUZjRUU3TVZjNnFoMmpDMEdFamtQd3FGVUNwRUMvWFFrTEZxcjRl?=
 =?utf-8?B?elNjUWdzMFJleU01R3VCdENtb3VWTU1TWElsQWRrTnR6bkFaUlZpRUl0aHJs?=
 =?utf-8?B?QnZUbzVmTjZiRzVpRWVLcWxPQm9xWTdLMWRHTVE2REJObmNXQko5WnNtM1Iy?=
 =?utf-8?B?anE1Qmp3VVE1MnllYnNkMHZNZjZmUVNGN0p2bGdKMmV3Sm1YU2xpdS8weHpP?=
 =?utf-8?B?dlJGYW9oNGRPaUh0OVVqOEJPL0RaMHFUYmt6NVM0OFl4TWYwUFN4Vkw1VXpW?=
 =?utf-8?B?T3ZxR1VjT3hqdlFmUXpNVUdLdHZyUnZkUU1JMTByOFViWTZyRkdwTlJOKzlD?=
 =?utf-8?B?c3VVem9XajY4cHdjb0tWaldKZm5rUlc1MlJaeUdSN0p2VEZpMEs1ZXo4RTlR?=
 =?utf-8?B?eVJFNEV4Yi93TFJxODBJZUZNR1d3NWxPSUhINzhXTEtYcEZqYVd4UUNJRWl2?=
 =?utf-8?B?NzJVR2h4RmJoWGpEbXhTakJjL3V1SlQ2NHdpVTZ1b2tmUzMzT1hvTHF3RUND?=
 =?utf-8?B?SUh6Q0RKUEVuNnJtNUtyMkYyWnRiQ21oRDA4RE42VXZRV0FxZ09IZGZrS3NY?=
 =?utf-8?B?SVdwQTlTTmxIakg1L3Qva3V4VXR3U2RYczlXOC84M29hRE5BZi9MV2s0L3ZT?=
 =?utf-8?B?cTZtM3dsazBQOVRHcUlMbElBbnJtakpqSTJXU1ZlR0pPNnUyT05lTGpWQkYy?=
 =?utf-8?B?bk9GVjBKWjh2ZGdCUWh4NWdCdml4R1VVeVh2UzlLK0FMOW5pZXl1b3ZoUVFz?=
 =?utf-8?B?TnlBTFowNitwUVFGekJ4ci9EVkptWHltUmdUL2hzQlBUYkFQSFdLV3JGRHVB?=
 =?utf-8?B?dHVqQjY2UTFQTXEwcXcvWlZKQ2ZoL3QzaGZmSTVxUC9kKy9maXdKQVk1OEJ5?=
 =?utf-8?B?SFVjZkJHY2I2N2FsV0dIZzBXalZqOEZIYkRzN3hBb2oxNy9TVGZ6VE9sZ00y?=
 =?utf-8?B?ZnJGMjV1M1JzMG1wZ2ZNRzlBZU1YdFM5dnkzM29sZzJVK1p1N2xzNUlUNVRQ?=
 =?utf-8?B?TTNmckYyZEw2WnJkT1NhNVNmSUZyM1hIdXJyZnE0MjIwb004RkQvcVNPZTlH?=
 =?utf-8?B?OHExaE5LdWw4M0EwUEdBbkl2WTVxRElObmVSNlJPRHBnWG0xRWxHaGd2M0pY?=
 =?utf-8?B?TktrbEQ5Zk92cFZucXJ2bFJyc0Vma2QzOHNNMGljNEpad3F5ZzRIOFBhRUtx?=
 =?utf-8?B?MERTRDdxZzdQdzRQaWY2cktTbmUxTy9teWpaMjhHdExxUmhYOE1YZUEyQ0Za?=
 =?utf-8?B?MW53L2E4ajREVXIxM04zaXIxUDVLcmFqVUJsQWxXQ3RmeXRyQ2FBamNPbFFs?=
 =?utf-8?B?ZkRaVjRWYXRrbCtGdEkzSW5RdjJYWVZlbENlM0FhL2JMZGd6aXpvbUNDOU51?=
 =?utf-8?B?RkRsbEtsMDhFTm53Z2FnYit3SGYrdjRDK3Rubzc2UkZ2U0JpN3d0NE5wSVZV?=
 =?utf-8?Q?QS1DuYSbW10N3I/vHhxPG+5FJ2MjM8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 21:00:18.6037 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d69a46-387e-4de4-808f-08de1665005d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8463
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


On 10/28/25 13:43, Markus Elfring wrote:
>>>> When a command times out, mark it as ERT_CMD_STATE_TIMEOUT. Any other
>>>> commands that are canceled due to this timeout should be marked as
>>>> ERT_CMD_STATE_ABORT.
>>> Would it become helpful to use additional labels for the same state settings?
>>> https://elixir.bootlin.com/linux/v6.18-rc3/source/drivers/accel/amdxdna/aie2_ctx.c#L197-L226
>> I do not fully understand your comment. Could you explain more?
> Do you propose to use the same state settings in a few if branches?
What are the same state settings?
> How do you think about to avoid duplicate statements accordingly?

What are the duplicate statements?

Sorry that I am still a little confused.


The code change is to distinguish between the job which is  timed out 
and the job is aborted.

Thanks,

Lizhi

>
> Regards,
> Markus
