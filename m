Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EE2B370BA
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 18:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED38010E0C6;
	Tue, 26 Aug 2025 16:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lDr5rfvg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAA510E0C6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 16:50:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LfyVtmds40dBaLJdySXo3jrGh5SSNNLpWAq3BT6tuVrmMhr7C5KKnbjS7mYiG1srAe61kOya4/I3nteLcrgdEcXpEny6HUmDCMlwxiTWuGlzorpgQylfuVFeHGj0FFTrihv6GHjGS6hdrjM0yTguZIqkDV0An9n1aV489AfhrXobrVlcFBHZUxNn7wiCLq7NqfyqOtxkDa+uN1II9mRF4uwui0HPbYKHD7bQi4fktl1JtA125hIxViN9VkuMJtynbzscySl9GHMFP7Yq6kRY1++AkSz/PATlpuo2KSU3I+0zL8d4ul0fUCrp86eXAhDYlMB+PFs0A/+Egpc20bEbEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLOVqaztoi5oFIiC+TNj4gvG5I+tEWESJUV+F6PFghg=;
 b=P76ThzCPMkiA6Bc5Mtd0snCkMdT7mvX2tdeGPPYSdRFnG523k/mGVpAt5YPGH7Tk42QQmL7p9Awu3dB8FE6W7NycyZ6roDjUtm6mdBn96AT1NDSMOrqnr2v8a9MVJPnTaKIGi5YHFijEPrUbZ8Tuq6gWiMSEF9CytXjoNONwhZTOffRTBAhp+T3liK3RTRQrvFCQSAP4fMBIo/gL049vk06JsZGfH+mG7m6AWHZjYfRTtUNOTOqIZxv3pMAbTMj2FaLQV89lqeFBtTo3uBrBWUDRsy41gFC/rI0XE/akb5I7IqGXC40Fwh+SnGmugagR9N/EgVXPkRu8ekJB+y0hPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLOVqaztoi5oFIiC+TNj4gvG5I+tEWESJUV+F6PFghg=;
 b=lDr5rfvgzCgjDCdqYGGYQibZ8knasRszJ7TLsdjZrzxVr5w9xoz1lwibw+Vt1LA0k7QDCyzvUTIFk1iDs1fnXOzEmKZ1xmtWdL3QQLzUh0zx7TyE3K4hwfeaN1QNol7wAI7ymT1RIPrKkmcgh/hUcMyH8w6DgN2c1mZZaAPW6xI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by LV3PR12MB9437.namprd12.prod.outlook.com (2603:10b6:408:21d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 16:50:46 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9052.017; Tue, 26 Aug 2025
 16:50:45 +0000
Message-ID: <b2f4a70f-62ff-41c7-b0bd-ad8723f70ba0@amd.com>
Date: Tue, 26 Aug 2025 11:50:42 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/amdxdna: Fix incorrect type used for a local
 variable
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, jacek.lawrynowicz@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com,
 kernel test robot <lkp@intel.com>
References: <20250826160321.795866-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250826160321.795866-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::28) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|LV3PR12MB9437:EE_
X-MS-Office365-Filtering-Correlation-Id: 0edee726-3c83-4722-f839-08dde4c0b302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEtydUN2dHFTMUk1dFNzMGVTTTl6YU9hY0pEOHIyekc2aVo5ZFhzb2pJMWtF?=
 =?utf-8?B?VkZUeXpuRWRLRWlCU2xQVExlZmMvR2RaNXM3L3JINGJmS2pVWDhpOTQvY2pI?=
 =?utf-8?B?YjN0dEFleXd0d09zeTRWK2ZUSzFDSjNHRitJQmFYUi9tVVF4bnd3Vi9iZDNM?=
 =?utf-8?B?ZWlMQ3BOZDBqUFhvSkNja0s1NlladXZmRHpiY29NRE1WKzgrTzV2STBNb24r?=
 =?utf-8?B?eVlQV3p5REhTaCtQeXVmZXd1eWcyZGtBZHFhRFl2QnFJVFBaeDY5elFDWHJw?=
 =?utf-8?B?K05MWmZ4TG5WUzUzVW9XeFZvYmJTQzBZQmdwaHJhVEROdlZPcHM3clJQUHRz?=
 =?utf-8?B?L1BZb1BNU0c4VWVGcFoxUy9CV3Y2NUxaQTJrLzJhR0dNUjQzSzQxVnM5L0VX?=
 =?utf-8?B?OFZLbGk2TmluWkg5SnNZbE43anptd25qa1VmMHYwbkJEUW5salIwS0ZCc3NM?=
 =?utf-8?B?ZWw5bFV6OFUwdEJXWFV1a3VBMDAzWHhhY05wc29KK2l4MzI0RXBRTWErK1A0?=
 =?utf-8?B?NmdxU21tNk5yZzdBNlh6S3drY1grUFdwMjlnNGpJcThQVUk5MndGbG91WDJE?=
 =?utf-8?B?ak1pWGNab0hOaWZMWjVIL3g3cXdqSjRReU9MNWNJVU1XQllYMEhDMVJWUXZF?=
 =?utf-8?B?WGdvVWg0ZGlKWmtzc2k4c3FBbEQ2ZUJtRHE2MXBkMTJVYXpVbk1ndEN1bDBH?=
 =?utf-8?B?UmZhcENkVEJJQTc3bUJyTFN3UXFpU0pTMm0wemNyeStET3N0M3Y5UXVoeE9a?=
 =?utf-8?B?YW5KK1pTTkVXYmluNC9IYWVIcngyZUQ2RmdMUzEyU08yeHdnZUFvTUVHL2dz?=
 =?utf-8?B?cnZ2TUVXWEpyUzRLOXYyTzVFS3RHV01GaTBMeHh2N2tiTVhSU0Zpa2VBcDJW?=
 =?utf-8?B?OXAzb2RwQ0RWSWhBSEpOY3d3bWRSL3J1VTF0Nm9ocjV4RytmajBreE5FNm1j?=
 =?utf-8?B?b00wd3ZIaTdRWG0wQ0QxTnJ0aWljSHd6YXZPUStBQmdEWHNWbHdxNXc0NTl5?=
 =?utf-8?B?ZnRZbDM1ZUdIVWZSam9keG5hc2tWNjJMU1VJTi9EVENqenUyMVR0YnVZWFFI?=
 =?utf-8?B?NUtVMDcycjdvZnpHWThzSFlBd1lTaTk0N2VpSVA0cmtSY256NmZBVEhXNTNL?=
 =?utf-8?B?aFAvUXF5TGRRaWlwY2pvcFBUYTlBTHNhWTZBWDBkY20vS3Z5Zkd6UjA3OGh0?=
 =?utf-8?B?RGIzUkNNL2JQZkdrQjhqWTRwUVNhOWJpd3FjV2dYNmhlR3RYOGpqeWdyYXVC?=
 =?utf-8?B?ZklBSU11RGJLT3VRR0VGSW5MVXU1bzkyRU5FV1dnSEFHcnlBV0xRWFdualhZ?=
 =?utf-8?B?QzJwQjhRVHpkWGNZUDhuQVFxYjRydnNubERXK3lIZTBNWGFuSnpleVNkNVdu?=
 =?utf-8?B?MGwvemY4NXphZUo1bEZ1U1BWUC92QlVvMTRBQndqdFI1cGpQOGVjRFRaUWpZ?=
 =?utf-8?B?SFFTSytZRkJVZ0JBSzEzLzRMdFdZN0laQzdCSWYwSFBpVE11S2Jib3hHL0gw?=
 =?utf-8?B?STdUdDlwZkVEd25QSjZnVlg4ZExSbWdtQXlqY2lKNlRKWFpoR1J3K200Q1N5?=
 =?utf-8?B?TXA5WFhjMHk0UmhIZmtkVWdUYmVlQU5Md3AvbVpnWHppVGZGVTVYVGpLay9P?=
 =?utf-8?B?Rno0MXU4STlZZ2g0NjAwME5meTgxYnJPSTl4cGxLZjl2TnMvZWRTcWVOM3NT?=
 =?utf-8?B?TmRHQXFYWit0akVnZnUxVUYxMWc1RlJaUFNCZnRZVytxeHZ2NjREeTNhTVFj?=
 =?utf-8?B?K0gxRXNqeEhuZkc1V0t5MWY2WlJNUWkvSlJwcHl6V0h2WVIyaUh5RkZNS3Fy?=
 =?utf-8?B?QTE0VUpHYjJiWUd0THBWM0wrZ0d3ZmpGZ04wcmtPTmwwRERYd3Z4NnhtYWtS?=
 =?utf-8?B?S0Y5RmJiRm01a3BpU280S2poR0hYMExWTGx1c1lLOVFrc0FEZ0JNeUMzTEtM?=
 =?utf-8?Q?/0g5KLOuV4s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0RvZ1hxUHNqeWJLOW5ITU5rNC9MWGNjSzViOXB3SGxOZHF6U0lKY0tLeitX?=
 =?utf-8?B?dWlMK2hEdVNyME1FN0F3SlNuVGJodUh6Mlg3cFhiVTZFL3Y3OG01OTdDRUpS?=
 =?utf-8?B?SytYNHdSR1lpb1ZmYUFwQWczc1Vxa0dLOExWYlJ2VUdMaGdXdmxzQ2ZpSzVM?=
 =?utf-8?B?bHM3U3FwRmJoNlQxaVUzWHJGYWJtcXRzcHBrVlJJTFJXaExsVTBLSlRXb0hC?=
 =?utf-8?B?ZGpNZ1E1MXJNUkh4NjZEdHJHN2M3eERvbFpkNzVsb1oxYVpoVnQ4eVVOS1cr?=
 =?utf-8?B?NmtqT2J6K0sxKzdPWWE2WjM3MnVHc09TZmlxWGtLQU1yeDB1RW1hUU85NlMy?=
 =?utf-8?B?V2x2enlOd29xOTViMGo1YnRjeFRWZ1VWRVZlZVBsZnhQbmtLZmRDMEpNUmFk?=
 =?utf-8?B?ZitQYXJGbkJRUmxjOVlVdTErL0xMZGc5dlRrZWNJL3QzeUFEQUxkaW5KUjdj?=
 =?utf-8?B?eERBanp5QzlFWjBPSmpQUENsUTFjSks0K1g0eHFBRk80YUQzK1dOU0t0ZmNM?=
 =?utf-8?B?OWJNSEt4eGMwbG5ibTA2Ymo2WjdtbEpFNmc5N0dWZWJmK3pjK3VDRFZIVDV2?=
 =?utf-8?B?QzRQSzZmQlNkWWdHRlpaN0tsWHozeThnRHBNYXlacWpZdkJteDVlaEgrUEFs?=
 =?utf-8?B?dEQ4KzlYQW9pbmtQbm5ocFU3TjJsM0RLZFk5bGJxVlBaQUJyU0hzeGdQTUw5?=
 =?utf-8?B?Mnd0dEYvdnpuY1IvZFR4bWJ6TVo2dGVQaUJINXRaZ3ZYeGhSL09RekVHcWdn?=
 =?utf-8?B?TGxDN3FDVlVSMFZGemY2K3lZeWZyQlNnUDI1eE15c3Juc2JPQll4eVhmaDJo?=
 =?utf-8?B?QVducjBwOUV2cFRibmhHejQyU2doQmNjNUNPRnlRcVVBdTc3d05zK2F4WUpm?=
 =?utf-8?B?Q1dYY3hFVE9pWm55UDhSN090cUJadkJiRTU3TW1OdmV4Y1JkWmpPT1hsMTFu?=
 =?utf-8?B?Z0VyQ29oWStDd1ljTVV4aGpidHNuYXBudXRYSnlub2FmZVcrai9MWkVUWEE4?=
 =?utf-8?B?N1pxeHltbEFYdHNJL0FRMlI4a3F1M2JvVm9OdGZIcWM3dmp2UUFzMW5DcXZ2?=
 =?utf-8?B?NVFQY3lFVm5nYWxVYThjckVvZ2Y1ak5VajY3Z2tJMjFoRkxBamdaRzVBcVVn?=
 =?utf-8?B?VTVZYlg0c2lYSGJoRysweFV2enJEa0xGUHdlcWdVRzRWMWx4SUNZT2I3Sjh4?=
 =?utf-8?B?b1lJa00za0NFSlVvc1VqRnM4VlVRTWV2cVVOTnhDQ0dPWWpTdVZOL1YxdGtk?=
 =?utf-8?B?NVVsNC84NSs0VDNpNG5jbFd0SXZ4dWZheVFURnJKVGhCc01VUFJQNFZjejdF?=
 =?utf-8?B?WUdGeUwzTTVDYitvMmhyVUV4WlQ5WE9qdGROTkF5cmZlcnQwTmRoVnR1WEhi?=
 =?utf-8?B?SzBDVEV5b2JCSGFZeENRazRIbUpCempiUGZKTTdwYU9xdWpkYlZJL3FPcXps?=
 =?utf-8?B?UDBiN3pKcDlmRTlQdzlIYW1xdTYxN1llOUxzOWR0aERXdkE1TjlIRW1KRHM0?=
 =?utf-8?B?WHNkSXdEcHIwUmpnbGNLWWtaUFlPbllxYjBJbjdOSGJxZkVwcnlEbVY3Rmc4?=
 =?utf-8?B?Z3UvektaS0tMajBtUjN6ZkVCYklTZjhqMVUvR2Z3OUowNWRyWGxKTU5wakpM?=
 =?utf-8?B?UkZySlF6VDQvRVE1b3VtRk9LMkNFRjdnMGlCeUtuT2F0QVN2QlJaR0dwZUJh?=
 =?utf-8?B?YUkwZHNjQTI5QVRJQkRLSzIxRzJRNGJJTG9SNHpHRXM4Y3dzYndTK2xBTUdl?=
 =?utf-8?B?MWFnREdZQUhEVHMxUDkxclQxeStCbWdyS0ZyTUJMUnNvQ01QTnBNTENoQ2o4?=
 =?utf-8?B?ZDNwVktLVU1vS3VpaFNsNkxNdG05NmJyVzRvKzQ3UktWNXhaaUF4ZWp6SkV1?=
 =?utf-8?B?M0FGb0FWNlVvSWIvaXJBa1pWTXA3SHdsQ21EUnRmYVE1alVvYm5yT3hMVlpO?=
 =?utf-8?B?OFEwSnZRWnRIbzNENlZPQVVNVi85U3RvZ2VrWWVmb1VSTCtlYndjK3pzL3FQ?=
 =?utf-8?B?NWlobWlxQlZhTyttWW5nZFhqVkRRUnBDZlRUV0ozTlFLczF4U2VoZHREQzI2?=
 =?utf-8?B?cUl1L3dWbjUrbTZwVnpzenZIczE3V0dNRm9FWGNzeHFsK1ZCekl6d2NaamZO?=
 =?utf-8?Q?1Ah5z5JU0grCgWhU4fAbynDlD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0edee726-3c83-4722-f839-08dde4c0b302
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 16:50:45.0151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DawqY//rJvx3EdBYRGqBiHyO3KcXNYlLAqnyBUtgkR5r6r3Q1rv5xXWT6wCA4nxXmBbCk3AvovEkjU6Ed2cilw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9437
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

On 8/26/2025 11:03 AM, Lizhi Hou wrote:
> drivers/accel/amdxdna/aie2_pci.c:794:13: sparse: sparse: incorrect type in assignment (different address spaces)
> 
> Fixes: c8cea4371e5e ("accel/amdxdna: Add a function to walk hardware contexts")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508230855.0b9efFl6-lkp@intel.com/
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_pci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 16ac0cab4f44..2885a3c17e89 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -785,7 +785,7 @@ static int aie2_get_clock_metadata(struct amdxdna_client *client,
>   
>   static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
>   {
> -	struct amdxdna_drm_query_hwctx __user *buf, *tmp __free(kfree) = NULL;
> +	struct amdxdna_drm_query_hwctx *tmp __free(kfree) = NULL, __user *buf;

IMO it would be better to just split these into two separate 
declarations so that we don't have to worry about nuance of order of 
operations resolving the type.

>   	struct amdxdna_drm_get_info *get_info_args = arg;
>   
>   	if (get_info_args->buffer_size < sizeof(*tmp))

