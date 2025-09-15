Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B83BB585D1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 22:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94FCB10E554;
	Mon, 15 Sep 2025 20:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="M+72cRg5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013019.outbound.protection.outlook.com
 [40.93.201.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B3E10E559
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 20:15:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8njQov1S7bO6fA1BDxTeKOBOiHiLla8nEk8aolw+zMdwPsUWLdZc8CdNKA/40QZW1PNUCZK85eMnYty04Egbf+CvrMkaRP1J1nJVoqOciQxuv/R2HolLCqmtUJPJNTXmeVQSDJ71AZ4tkau8PDeKSrZdNOvg0VOcYLQvKvvck3j0GB3qLDW1UeE+Vk/0FtWkq0wQQYv3JFd80FTnEZfuwatFzXJ3ihWxTiHow7sxnkIIs+jytLQSoT2TJ/AA9n1fneuSZUNy1irtJZNt/CIA+JAZ81X5PXQUEUF8Q/mCKaYSWHjZvXtTr3VeajoSk90bqzgeZiYRx23z5vTT0ItXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jotRKvXDJGPBDILz624tZOEPtruNCIvBpBvlWRTjMY4=;
 b=hDENR6M4mDhhKk0WEFDPn+2vVu0W4xtIPnjIuQO1X71MsMzWs2QAvHC3sCcM+yQhLJC1A2wPiW2+RMK3/yWZxmwsUKxfipNYut/bEV4bAbT4bLLrQrk38I8NPo9n0vRBBDWZiYteH8TySSpNw0uNKGgEnJmLL/NnGD2LMq9h1zkslwXbmbfRVd7tltWVRKkXFc0kNIea65yFhPAm6sHTXZiEQWfpmWc7y/8fy+Zl1GfNunD4btDMH11VV3FZA7wRE9LmnKdDOtup+97UMW+RwH2MgIlP9+Zl/NNhZNkP5H24FSMu5c7bKZpYlE5+l04jykYxwuS8tLzc59xvwiW/eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jotRKvXDJGPBDILz624tZOEPtruNCIvBpBvlWRTjMY4=;
 b=M+72cRg5WJG4cDMGxk6kg09m+/rwDswS808P9wkhOGgDtcyhnUbSkIU0bRlzylOACN7d3XRrtpZ9CLXD1MKKdy98XkYLskzIQRljgCmnlG4ce71V+deFh/C8gnrm7yFsH4sGE817j7RYCKRCcikegbbwZh85N7mV0eYvzAD1WKo=
Received: from CH2PR08CA0004.namprd08.prod.outlook.com (2603:10b6:610:5a::14)
 by DS0PR12MB7654.namprd12.prod.outlook.com (2603:10b6:8:11d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 20:15:10 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::b3) by CH2PR08CA0004.outlook.office365.com
 (2603:10b6:610:5a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Mon,
 15 Sep 2025 20:15:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 15 Sep 2025 20:15:09 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 15 Sep
 2025 13:15:03 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 15 Sep
 2025 15:15:03 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 15 Sep 2025 13:15:03 -0700
Message-ID: <b0f6a51f-5a83-79d2-7046-3dada6bb61b8@amd.com>
Date: Mon, 15 Sep 2025 13:15:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/ivpu: Ensure rpm_runtime_put in case of engine
 reset/resume fail
Content-Language: en-US
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <jeff.hugo@oss.qualcomm.com>,
 <maciej.falkowski@linux.intel.com>
References: <20250915103526.830130-1-karol.wachowski@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250915103526.830130-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|DS0PR12MB7654:EE_
X-MS-Office365-Filtering-Correlation-Id: fa2a7059-9979-4d68-3b25-08ddf49491ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1F0YUhUc2ZlQ2txYzlwckdGTlA5L1A2OEQ4bWh1M0tCNmplR2VuR1VKay85?=
 =?utf-8?B?Y0VCblJIZ3phcC9FVzVENm5XK3lhVDhrSFJxaFFJU3A0U2lNQ3hXY3VubDdt?=
 =?utf-8?B?VnVtdnBYQ05WSHNCbzVjUUVBZ0o0Tlc5MXU3N1kzaFRzZXVNTFoyZkhHY3M3?=
 =?utf-8?B?NUw2OEQyTmROZ2MrZmZlc1Bkdzk1SDRYZnplRHVXRit0NFhTajY5OERha0Ix?=
 =?utf-8?B?bzVDeTNIb2pIOVJZQVBmalBpUDQ0Z2R5WS9PT0pPOFR3S1BBQmFHVzk5cllN?=
 =?utf-8?B?NU1TUnYvK014VkwyWW5rUUczeEE0d1kwa1ZXZHpUYXpKTWxVSWtSZldFc20r?=
 =?utf-8?B?VCtFWnYxaWFGa0NyYXIzSEtwcGJBMkxiUWw3SXd0SHI3TjB4cHZMcGprdTNx?=
 =?utf-8?B?OVd5Yk5GL1pqSDFiaWp0RFA3U3huVzV5Zy90WG9WeGpiVU5MR3JrMitBOE85?=
 =?utf-8?B?S0RBaE1tWnpBUUZ5MEpmSjN2Y0ZBcXQ4MURqVU9mVlNHbldyREJ5YjdtZzJO?=
 =?utf-8?B?S0lVRlJjT3luVFJIK05sRVdZc0JCTTZSVVA3TEM1ME5NeHk1TnEyV1VleGFv?=
 =?utf-8?B?cE1ueEdMT3M5elI3NVlWSHI2bjBNTDA2RFZEckM5WGhDanl0U2l1VXB3VDIy?=
 =?utf-8?B?aUdUaXlIVjlpb0htZUR5Wlh3VXZPMEhiZ0RpLzczcUVVaTdkaklYVWZlOXBQ?=
 =?utf-8?B?OWlLNzNZZnpmZ3lGejVpNjBGemtIUEFXcEVvTGpBN1pUd2xGajBXbVZnS0Va?=
 =?utf-8?B?NFZxcFFFMUNEWTdXSDNFd2xjTTlDRUJUZFZoZkVtbkRqY3FHeWZMSjNFRGo4?=
 =?utf-8?B?dUI0Z0dFeUFnZDBoUDBHRXgwc3ZxdWl5Rnk3eG5Lb1JnQTZzLzJPazIzYitk?=
 =?utf-8?B?TDVrdVlRaHA0QUpZamVlZy9rdU5iM0Y2M1cxSTY3UkU2RFdwOTNkbUFBTE1Y?=
 =?utf-8?B?bjFvR29KOVJMZUpQVlVST3pUUTlQY2NYSDFrVzR1ZHNHM2kyVEludXBxeE1E?=
 =?utf-8?B?ZTdIYlFWZCtseUx3aTR0c2RCTmxQRUJHaEN1UmIvYStBdzQrV3lLc3J2Ymor?=
 =?utf-8?B?WkRHMDRaY2RlU3AzdE1VdFNwZ2x3VDgyZC9acnNaWm9vTzZBbEU2L0xiVjkr?=
 =?utf-8?B?SHhJM0RuNGFkem14bGFwZGVYVkJmL3NpRmtGN0tjU1F2ek5OSFVEK3hYcDBv?=
 =?utf-8?B?WWtHeGVtNTBINytXNVU5TGxWOEhrWjExNUo0RmlKcWVub29CVUtTNGJNc3hS?=
 =?utf-8?B?dVJiMnlsUVVRcTNiaUlFUDRNZlNTaE52YTV1U0h2RitKZFZSbzZyaGptN1dL?=
 =?utf-8?B?K05pN0ZSZVhDRnNZenhZTlB6Z0oybWxtYk9NeUcrMS9UQXNXbUhkNU5MOE56?=
 =?utf-8?B?Wm1xWjliQ3ZybUpXeFpFODgwN25YeVVIZmFiek1ia0RRZWxCZXlvT0Fkb2lW?=
 =?utf-8?B?NnN2Zll2eENGdkZLQXhDdjVqVnRZemFPV2hWQ094aXc5RlpvaDNoSFRYSWIx?=
 =?utf-8?B?aXM5ekx5NjRFeWtWV3RPcWpVZ3NDQy8wK2dENVlBc2ZiZ0hnTE9XaUk1cmxT?=
 =?utf-8?B?cS9FbmNRK0twcDNrc0w1d0VtYWVLWnA2MFFPWURvdzRDVktBbGdnK20rck1M?=
 =?utf-8?B?Vm44enR1VFBuaXZKT2hEL3phVU9BbVFxL0djMDkyWnZNOTMrbDd3SHorZG1r?=
 =?utf-8?B?RDN1U1VrcGYzRGREejZzQXIxVXJLMUtVMGx1Q0lDKzFPYjBTSWRtdW9IZCtF?=
 =?utf-8?B?b21tRTdQcTNFUkM3aUpCQWNKaXkyZ2N0b2Y5ZTRHT2oxcXVnZlJyZ3NBa2ZK?=
 =?utf-8?B?cnl6SzFZM0UyQnhrSkZTRnRONzVwbm5sK0wrTjBUZnVyeCtZVS9iK3QrbFN0?=
 =?utf-8?B?eVdXQ3NyUXZBdmRiSEFPQ001amJ0V2ltelJudG80aFJhK0JrVUsxZ2JybFJv?=
 =?utf-8?B?ZnZHUkxTQUlxaFNYYjA1Qy9PbGVqRkMreGxaMGYvSldkNXYxa0laTzZraWdi?=
 =?utf-8?B?ZDR0a0JnUnUyb080ZUVad2VHb3BkN1IwTHhxRDUxcVF6N0N1RG1HM2gyL043?=
 =?utf-8?Q?lQ4xXm?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 20:15:09.6318 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2a7059-9979-4d68-3b25-08ddf49491ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7654
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

This looks a bug fix. Is adding 'Fixes:' tag better?

On 9/15/25 03:35, Karol Wachowski wrote:
> Previously, aborting work could return early after engine reset or resume
> failure, skipping the necessary runtime_put cleanup leaving the device
> with incorrect reference count breaking runtime power management state.
>
> Replace early returns with goto statements to ensure runtime_put is always
> executed.
>
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_job.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index 521b7ac6e35e..044268d0fc87 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -1050,7 +1050,7 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
>   
>   	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW)
>   		if (ivpu_jsm_reset_engine(vdev, 0))
> -			return;
> +			goto runtime_put;
>   
>   	mutex_lock(&vdev->context_list_lock);
>   	xa_for_each(&vdev->context_xa, ctx_id, file_priv) {
> @@ -1074,7 +1074,7 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
>   		goto runtime_put;
>   
>   	if (ivpu_jsm_hws_resume_engine(vdev, 0))
> -		return;
> +		goto runtime_put;
>   	/*
>   	 * In hardware scheduling mode NPU already has stopped processing jobs
>   	 * and won't send us any further notifications, thus we have to free job related resources
