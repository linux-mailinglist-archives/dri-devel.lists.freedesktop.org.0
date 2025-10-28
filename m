Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D71C16CE6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 21:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7990E10E139;
	Tue, 28 Oct 2025 20:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Io0NqZeo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010071.outbound.protection.outlook.com [52.101.61.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7067710E139
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 20:39:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bW7An7fByGKeHbEoPH0V6yPKh+dIhibRiqDFXRhKgOA+w+hrEda3yz0BODxZARDiD5MnvvFGRGgV4MrgHGDTsT82A5xTiuJcPWzk7IQml/501teGuwTl2t7J+U0o6sMpP2LXuT0b5Y5dsNCEPnzoP50GcqNSmxSbz8KQBqNVsR4GHMk0yQFmYKkbTm94F6BOMQrZZXhiscOC+hyiQ5DUqWrPhCssIrLR2Fb0VYKukABoHpJqLJFTE62V6+hAz1WLJS29z+IKJaIShe18ty5ZhTLQbwEH8DK/SLA26Kuh+H8jSFNKXHd1zfzCJJW08TqI9GPKofnY4+zVM+MVHfGRSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D84BXZVcatiqkBk4QCtRM6KNu3tYcx1Ulf2c1xyim5w=;
 b=pH105n44Ywhmu1hhdtezsduSXhxD1nhtK6AxI8ycxitLNEaSPMIN+U2kh07agaJ9jV+LWAZrSZMfBWXoPoxZ90ZfI2dNW0q/Or0vET1Bv9GuqzF6c2JRiQaEFL3FN+yuymdkLTXeIQtclnI9kMeRHc3Qfv1DTKE4cQ6wfTJVbr39lJIyalz3tD2gpPLHiR3hi143A98yO6FyfJ1EsU4z47hFOUyC6Z0Nw2SflAKIcDFOX62XWEXph8YKzqwJmVW1fwGIFMvZQrr1jkimBoAvTQWtzGTl7wmiWVAKSKicuY+UpMO4MKmccAYGfOOCdifq8OWBt2I4/oXK+QKRoPTrCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=web.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D84BXZVcatiqkBk4QCtRM6KNu3tYcx1Ulf2c1xyim5w=;
 b=Io0NqZeoOmQQeiVFNNBx9QqqnSCGYjgS3j29+DWzg3JlvCl7dj+OXvxr5xHVXFyUTBYwC+HIMaSpBM2ZFILT5TC/q1VZqzzMLzZEs+cCZnMZH3NJhnOPO8vIg/Jt+rH5afoaHxGhKe+WTNu1wYw7x30YOAuRAawjlczJj4w3o00=
Received: from SA9PR10CA0017.namprd10.prod.outlook.com (2603:10b6:806:a7::22)
 by MN2PR12MB4440.namprd12.prod.outlook.com (2603:10b6:208:26e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 20:39:11 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:a7:cafe::83) by SA9PR10CA0017.outlook.office365.com
 (2603:10b6:806:a7::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Tue,
 28 Oct 2025 20:39:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 20:39:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 28 Oct
 2025 13:39:10 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Oct
 2025 15:39:10 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 28 Oct 2025 13:39:09 -0700
Message-ID: <605e6f4f-8e96-dbe4-d43d-16bcac63f94e@amd.com>
Date: Tue, 28 Oct 2025 13:39:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/amdxdna: Fix incorrect command state for timed out
 job
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>, <dri-devel@lists.freedesktop.org>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Maciej Falkowski
 <maciej.falkowski@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Mario Limonciello
 <mario.limonciello@amd.com>, Max Zhen <max.zhen@amd.com>, Sonal Santan
 <sonal.santan@amd.com>
References: <20251028175452.2329497-1-lizhi.hou@amd.com>
 <b7a2ac2a-53c3-49ce-862d-eaba86f0b298@web.de>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <b7a2ac2a-53c3-49ce-862d-eaba86f0b298@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|MN2PR12MB4440:EE_
X-MS-Office365-Filtering-Correlation-Id: fd286949-5c84-4e6f-0020-08de16620ce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmFhL1dDdXRsRVArZHFabVN5cUtKbGRQSlJVc3NKQmJvNmc3NlNzSHZGK1Zh?=
 =?utf-8?B?N0ZkR01WVUltclRtMS9WVWozMk1IS2RyNUVWWmdPS1FMYldieERscEZXR01H?=
 =?utf-8?B?Ujg0NDl0eVJxZTRvZmtxbEY3cUoxV05NYjZqSGdoWTdKckFPdGFiWDdVYWtn?=
 =?utf-8?B?NGNBanB0THNJbld0T2pVRjdUelRVWVI1Qng2T3JmSWhqUUl6NlFoKzczdjMy?=
 =?utf-8?B?V0xKczBucGN2Q2xtQStVZE4zY25ENWdOeGVscVFZWFBlQVk4VGVvdXF5OVBV?=
 =?utf-8?B?ZFVaM01oRFV3T3BSTTBIKzFNNEtDOUJrRnZBc3lUWXFwZDZLYzNtaW93Nnpj?=
 =?utf-8?B?YUFQZ00zQmVSSDlBb2ZqVmt4YWRDbUlTNjVZMVBMNE5lMzZrQVM4SDZaM2du?=
 =?utf-8?B?TElTdlV3c0hyUlNyc0MvUWZiVHRKekIzaGZlU0hqejVqbm1sV0JSNjVTY3lX?=
 =?utf-8?B?UlNyNzNrSnhlWEY4WlcxVlJSYU5FRVc4KzNBdkhIOG5lV1JweWhFcEJwZXlS?=
 =?utf-8?B?Wi9XWnpvNUZDS3hlL0NkN01vS0hhYy9FVWhTMGpCSHJPVWJ6YUZvdTZGY2dq?=
 =?utf-8?B?dy9qVVltQkY2Ni9ZZUJzRzR6T2M4ZWZhTzN6TEpKZmpkdE85a0pEMDFBLzVa?=
 =?utf-8?B?RGZUQ1g0dHZ0b21rZXNhZVpMTHNETjhnekVRbU92V0dXckVmMlVvTjNHZFVT?=
 =?utf-8?B?ZlhhdHhjMzl4elRoQVNVRWhhcWRNQ2lPM2NnU2JnWFNEOHVpNnhzUUxMZTdZ?=
 =?utf-8?B?TjVJTUZrRjQ1ckIzMUJnY1htSDE0MHFZdVN2RUFFM293MzhRbEV3UndPNGFj?=
 =?utf-8?B?UjBBVW1CWHBWaUUweDJSVXZYSVF1ditQYTdHWFFodXN6ZlVoNmExZkMyMHpt?=
 =?utf-8?B?TStEYjE1ckhTQ1dSYnFMRGF1NzBDUHliQUljZTEyZC92eVRtdTBoY3p4bHdx?=
 =?utf-8?B?ZnhjRGhVZWpjNEthYlVaM015RUhVQ0JxSXNCZXRINm92anVkU0pZZW1YRlZI?=
 =?utf-8?B?Tk9xNHpmNXRIa1Q2VURoTGU1M3BTV2VRMEpFMGdCcU1IazNHVnNTeVA1RVln?=
 =?utf-8?B?UWlpSUF2UGNaV21WZXpZWHNzcFhLOFB1Tm0zaW1FZHZKTEE1MlJkbFRsUllo?=
 =?utf-8?B?STJRWWRxalZxa1l3Um93SGRsV2ZnZkU1VTZReGUrTjkrUjFxZit5N3hER01u?=
 =?utf-8?B?c25aNndiZWc2KzdCbmkvTG5kZlhPS0RHMnlpNktOV0ZDTkg2NzRzTC8xSVgz?=
 =?utf-8?B?MFpaNzAyeVZvUXAvRkJoa054T1hnTlJDTVJSbmNTZjhpeHF5eGEweXVObWgv?=
 =?utf-8?B?dExmeTVUVlpwbCtIemhLTHBscCtETWY1c0ZzNlRYMVd5YmJtbS9BazlUcnhu?=
 =?utf-8?B?RnkyR0xHZ2tDQ21naHVFQ3Flc2E2eGV2eFVSWWNpN2xuY3d2SWJLUm5vUjd6?=
 =?utf-8?B?dDVsTENpeGxSYmlJUWdxWGNMUm4vaWFUMWJvMjZpbllKK3BURnZqS1dvZ1JF?=
 =?utf-8?B?STFuMXRyUTVtWktHTjJyaUYwMVJObi9KUlo5YWdNNzc4QTc4ZUNldnA1ZTRh?=
 =?utf-8?B?QkF2dk9JL0JHZmV6cUpkKzNXRDJYbmcvZnVaWjdJTUhiVkQrQStWUWpSVXYr?=
 =?utf-8?B?amRjYVhBOFBTcldGQlRMN2ErR0I0Mk5aWWk1Y2hWazQ2YWdvTVdhWGROSnMv?=
 =?utf-8?B?aXVNTnAzUm51c2lVSWcxZnp0akhkZWpXL1FEcndReGwwRGVpUjVUZS9HTnVa?=
 =?utf-8?B?L2xLUjg5TUpFWXRnSEhjcldZa3ZLUHFJTVFnQ3RGemxlRzY5T0JWOTFzTjdG?=
 =?utf-8?B?OUJqaCtSSGVqbC9jN0VwT2hrTTJaRDlHMVcyUk9sTkI2OElBeHNnYmhPclM4?=
 =?utf-8?B?Z0oxS1UxQ3lyT0hXcHJpQ05nQ1NlZ2tlNHhVbDB0dnJNWDAvZEw0YmxBYTBo?=
 =?utf-8?B?cE41N3NpWkgzdWg0djBUekhqRjhCWVhmRE91U2d5alN4NWt5cmVUZ1VMandN?=
 =?utf-8?Q?KmJdJuV6iZ3VAiCOK5BZ3hqk8Q1Jg4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 20:39:11.1524 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd286949-5c84-4e6f-0020-08de16620ce5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4440
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


On 10/28/25 13:30, Markus Elfring wrote:
>> When a command times out, mark it as ERT_CMD_STATE_TIMEOUT. Any other
>> commands that are canceled due to this timeout should be marked as
>> ERT_CMD_STATE_ABORT.
> Would it become helpful to use additional labels for the same state settings?
> https://elixir.bootlin.com/linux/v6.18-rc3/source/drivers/accel/amdxdna/aie2_ctx.c#L197-L226

I do not fully understand your comment. Could you explain more?

Thanks,

Lizhi

>
> Regards,
> Markus
