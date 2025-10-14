Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D040EBDB907
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 00:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B14910E22D;
	Tue, 14 Oct 2025 22:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wzOzI4PD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012023.outbound.protection.outlook.com [52.101.48.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C45D10E22D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 22:05:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBMgjOFuvw8M6BimUIxhHWGoITZbO1+wPN2t8qfQLp1HaFSd5OvVhMkQFbZ/V/lJoXrbI5XOBtWOEUElNtbbdN4biAkBcvCQxX02JFIASYu6C3IAk06HbWknUHGO8R81RvGbUmpEyaRR4sm64A7z3Y7vW5P+XKPDy8gBlmH0qCS0DIDjqG4ZVBGrdeY8fhrIT4xVT6s4bBZkvgeGVObt53EcKH4jE0euUIa8IFe9WOaga0wT4qy/BYBtmmuQwqz99Ul0f0KHCytbj+qtDFUmAxPNIO+RVxYJt3uviLgDULlERv0Yc1T+GcZvxgu2iqLelsxpPDpZ8IsD8cnTQ/fOQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpcY2/E188RltPNdFy2NSKxhjAzWEdALBhQwzuQ4Dw8=;
 b=u+xg756uuQw6AinJtIeKb8ydQfqCX8iY+GViijSpt2rA9CAmaBNjoNLKgBvIGzPfB9YHPTCD4l6EQrQD0KdBCJv3e6Ih6q5nN/w+EuATAZedKvY/BBmSGzD3EFXUDosebdV1UepzteLktCUq7PKGxsR9+Y5NrxGLluxO3ikb6jdbcTWjoeZoA/NEvMeN9xvCRam0FcgkuSV0kvq4mIKiMBOZVugNUj8gWwVzoofpUlu58LZZmRQJ6ZOZwecxJFA1ERU59oMyB04AJnxB2HCkkrTZ4tVMjcrVJvsoFjkMYscXSbn7P5x0vblcPxYhnneg1qMvI4i9n2Pgfh/7GSemqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpcY2/E188RltPNdFy2NSKxhjAzWEdALBhQwzuQ4Dw8=;
 b=wzOzI4PDVLHQHJSzl4iZH5/u0ejDOst/T8/hM1vvF8shlp1+PUyjflDTXCWriwNs6vrAzrn4kDUtbvm7O0IvJaeX4AyqyPR9h6qCOiqfm/Tf0lfMJT6WI5RK8EDc5hCAObuUW3/P301zce+W3iCo0A8yEU/c+Gxq/XM/rCHMKzQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB5937.namprd12.prod.outlook.com (2603:10b6:8:68::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 22:05:51 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 22:05:51 +0000
Message-ID: <2d8cbb22-db99-4af0-bb36-940772880229@amd.com>
Date: Tue, 14 Oct 2025 17:05:48 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Support getting last hardware error
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251014170130.601390-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251014170130.601390-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0177.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::25) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: 11f467a3-081e-43fe-00c9-08de0b6dd684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGtZWmdEcEZvWkQ4d05TUytnM2NESDRoUjlVcU9yT29BekpFMjFuRGZ2Z0FU?=
 =?utf-8?B?NkRsT2FYT1dwZjRsYmlXL3NkeU5CVkpzVDVuQ2hTQml0am9idlltcVVzTldo?=
 =?utf-8?B?OHVDalMrNnh3QUd0L1hYN3pqbG1CQTFHMVdjcTJDS2V6QjlRTFlTVzR2N1l4?=
 =?utf-8?B?L3Vkd2dmd2tRbGdYMkJiVW1yc09zdFlveG9aZmZaMDlKbzFvRjFXNzJJT0Ro?=
 =?utf-8?B?eVNVTXZpL3l5MW5yZUNPbEJNWDRwV3BsMzNXcHpZUElIYW9zMnhTckh3c1ZV?=
 =?utf-8?B?MFBmbG9NaVh1cmRBK21rdmgwM2h5bUs0SzZuQzZzNCttbmtqcjVlOXl2N01p?=
 =?utf-8?B?VkdKWXpHUnliNU9Rdkl3VHZZY0xJOVVlb2pKaER0U3JJeFdZQjA1N3A3WWZG?=
 =?utf-8?B?RzFhLzVzQ3ZTNktrK3RMdG0wQ3NvNUdHaGNMQVZmWTNyZFRQOUhJYnM3MHc4?=
 =?utf-8?B?L2xNSkpHTS85LzJ0ZENHVjJJellrOTJISDRVeG5CVC92KzFZd0JEYlpKRGpV?=
 =?utf-8?B?Wisrc1JGckZsTGJZT29yVFIrOGtBbUlLQWtmYkN4a0c4WW94Z1lPUTc3dDNR?=
 =?utf-8?B?NnZqL0R4MnVoUHFHc0Q5S2JqS3R0ckRrcDJHV3hZbm5pYUFQV0Y1VEJ5bi9a?=
 =?utf-8?B?Q2Y2c3hRaHhxVFdqQXU1S3RsbC90RW5NcldRdDN4WDNKZ1dzUVBCcnhMalV1?=
 =?utf-8?B?aThXTURnODFmS2tGQTU5QlJxc1RlT05uaGRjQ3FTaGxWZzZWUkJzZGRUSXhC?=
 =?utf-8?B?RWRkckJJL3NCWEYxdmhEN2lhNDdZdGJNRnRLUFl4WVFBeGFKb3o5bERxVllj?=
 =?utf-8?B?MjVxd1VYeVJOSEpDaTlreVZTaDZVYTd0eURHdlp1SjAvU0h6T1FMUG8xMjY0?=
 =?utf-8?B?bXFYNFI1YjdScXpMYnFyNXlxZFAybjhDdTdGTHh1OVBhNGxGVDhRN2psbkVm?=
 =?utf-8?B?dVNtcGtEMHJ1NVFyeHpQNzR0WUFQSzhZYytyRkxaU044a0UxTEFFdzlOOEVl?=
 =?utf-8?B?bHNUbTluajVvQ2tXSkdFRStSZlFHanQwT1F2VDdTRDZ3a1NueHVac041R0Vl?=
 =?utf-8?B?cGsyZld0VS8wb0FYZ2xGWHUyTEVBWFpGZ2txTTByS1ROMWNNZkJ1MjlRejNU?=
 =?utf-8?B?NzViNTh4NFRZemNrbWlnZmtDN3U5MVhpejdWS3lQMHJZNTJ0THBwMHBQamxJ?=
 =?utf-8?B?bVpxOHQ5YlRUODNuWXZlejdDV3MxMjU5ZURMc3FPMFFSaFdsa3BlL3pUbDlB?=
 =?utf-8?B?N0l0bjAvMWNNbXRWNmtJdmVOLzNwb3VWNVdKelIrcTViTjZvOXBUVjRzZ01E?=
 =?utf-8?B?czA5a2pIRFZSR0NLanY3a2FPUER6eCtiekVXWFNPdkx4VmFZQVQ2VEwwZ0Qx?=
 =?utf-8?B?ejBXS2NvdUtVS3ZSVFRWMmRZR0tjcTNPdFhvb2xyVkoyaTVRWTFNcFNKdG5G?=
 =?utf-8?B?MjVCUDU4S2ZRd1ZKRE9rR1NoeENqVkNha2RLdGxFbTVRekFpdlpLRjM3UlZR?=
 =?utf-8?B?VWNVOUtxMFlYWHlFYVRLOU1waGtibk5qbTlhdnRqcVNOTnQyM3diRE1iWkpv?=
 =?utf-8?B?aThGanVyV2w3d3FxeXVTVmJibDFkbHpuZkF3SUJMclNnS2xzVHBvc0dyQm9y?=
 =?utf-8?B?Y044cS9QQXlVdU5VS2F6dDVrL0dJSDc3V2hJMkMwSzIzWTdYOFZoZVAzSDZD?=
 =?utf-8?B?L044Y0pHZjVNdTdtNG5odlBhL1o1RGdURkxseVpoNmVRaWhSVjZtajJseUoy?=
 =?utf-8?B?dDJRM0pLSkp1MlFUdUFEZ3ZpL2RhSTdteXdvUUhGSEVtR3h5c1BIcXl4UWVm?=
 =?utf-8?B?TzVNbFFRZVF5c2xCZ0RDRGtmRHBiaCtaL0VwdVJjK1ZJcFgyZ3F6TDhrbENU?=
 =?utf-8?B?d3lkeUxUZVZHb0szQk5oU1FmM00vOEpVQmsyaEZJOUppb3ZKSVY4dlk2TTBJ?=
 =?utf-8?Q?1N3X6bZiqZC4lBw5XYmh0McnKmXidWhF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjNWVVIwb2gyNnA5cjhDVUl1eExRY0tRcHJvb2lDaFNzL3JnOHp0d2dmWHA2?=
 =?utf-8?B?YWhzTTB0QVNWcTFYQ0l3UFgwdG9jK0ZIczl1R2tHaDB0ckdSeWZqeDl2NkxE?=
 =?utf-8?B?d1F5WnRtNjVjTXk5bXdSdFhxYm1GY2lUc0hCYm1QRG5rekdxOHFQL3h4aW9r?=
 =?utf-8?B?Tk1HSEp6M0MzKzBlVWV1M3pnKzhKajAzK1BHbUdDaTJqREY2bDF2WGdJaUZJ?=
 =?utf-8?B?NVAvbzNhMitwZ1FDcHNTZGVHcDYxL25NeStDWlV4S1E4SVA2N3loRGhBaDBU?=
 =?utf-8?B?UU5mODNURzM2TzIrMjB5SnlNd1hSS21CS20rQjF1T0JTOERJdWh3emhTbCtS?=
 =?utf-8?B?L0xRUjhPR1R6T1djbVFIT3BOTkpWWGVTWUxVOGRPbEpXMUxnT1ZtVE5LWmdy?=
 =?utf-8?B?RWJVVmZjL0NWVU1WcUJDRkZaUU1tV0NUT2FhczIrcmpRVVBNc1VMbE1zcXFa?=
 =?utf-8?B?VmRzbEdlNzJLckp0SENURzhTUEN0RHNqOERIY0lLVzVma0xFY0p1R3hMMHYy?=
 =?utf-8?B?LzN2S1ZtSXpaYlJuWHY4aGdwWEM0cXk2L2EyUU03N1MxcjR1NC9yT1BXL1JL?=
 =?utf-8?B?K2VsYW45M1I2YXloWGtFME1Qa2txVFRzSUFxMmhnWndQR0pFQ0pSWGhiZnlX?=
 =?utf-8?B?dlpCZWk2ZDY1UTBZbDk1eUVYZlBqOHhTL250cmxGZ0pWSmd2cTJjcGRieWg3?=
 =?utf-8?B?d29ZOG5VblRRUllIWEVQb1czWm5ZRkF3VTlHOVN0NUp1NE1FZ0xMd3ZXcXNS?=
 =?utf-8?B?bHRvUy9zdTF2aXZGNkZMMSsvRUtBbEFKQVdpR21DM01CRStWdCt1SzhOVVpX?=
 =?utf-8?B?cDBSRk8vNVBteTJKa0ZiUFVDclo2QVdhZ3F5REsvaEVCVG9NN3Z3NmlwbzVN?=
 =?utf-8?B?U0s3YWdtNEFic2g3cHA0bmhQaEdKTllQWjBBRTNHTFhCQnpkNkZEWHozSGpm?=
 =?utf-8?B?a0hCUnA0b3c2QndnUFV0TlZzUDE5RHQ0NkVlYkk3QllSTzMyN09saWpTSnh4?=
 =?utf-8?B?MjJZblJEcEkvdzFrT0xmd1Qza3NUNUpObXo4WDJUczF1bkhjRytKTjZwTUhY?=
 =?utf-8?B?SkxhQ2NzdHlmZUtMVmdPRHVKTVJZaEkrdXZ4eGN0cUN5WDcxbkowT25TMVpS?=
 =?utf-8?B?eVUzNmQ4M0x2c2hJU1ZnYm5lTmprRWQzZEl1cS8xR2xFR3A0Y003cnZKc21M?=
 =?utf-8?B?NHBLTU5KVmFFN1RTYkhBcFEyaXdncVN3N1QybVNXdmJMS2JCblRFRXZqdWtH?=
 =?utf-8?B?RWlPeDk3cG0yRW55UjZFS1hiZElPMVY4bkthbGxHTi8vZ3VSM2R2V1A4R3dn?=
 =?utf-8?B?UzlDZDFTQ1BCVDNoUllEYUlmdXRSY2JtVHJ4Q1BNRk1JZ0VBT1ppdFFST0NR?=
 =?utf-8?B?bnpVODBSR3B1ZHBTNVNKNW12Y1NldHFnNkplM2VkUCtkamZ2QXFFVE51NWZF?=
 =?utf-8?B?c29rQk95Vk5LemJidGtzOTdBd0RWWFl5YWZxZHBVWTJsWXJkV1ZyKy9JNzUr?=
 =?utf-8?B?c0VJTUZOQmVsYVFWeEN4ZXE5cVA3VWFzQ2VkNUVxZ1NkVlpNNTlsV2Y0Mkps?=
 =?utf-8?B?bGJLTUN0TEtUWnBDVzRJU2JSQnNxRThCTW9IQ0VlUTBqRXk3aDFqMXZQR3Nl?=
 =?utf-8?B?NU5NN1BqdjFHLzBwQ0JGWHBUVWlOeXB3MFpLTUNOeXlZMlluTkpZdTkzc1FB?=
 =?utf-8?B?OUlpUHJKNzl1SnJEOFBEMm9naHZvbnZscGd5UDhNQXkySHFOR0JrUVIwUGVT?=
 =?utf-8?B?MDdRNWtqb3FBMVBSZm9BdXFmeVQ3MUY1YklyNlYvbW8zRkcreVJlSUcwVWR0?=
 =?utf-8?B?TGQxR3pwTW9sSEN4RmZ5Q3h0eTRtWTNpbzBESk1tL1ZKUHJaT1BSWlBwSkVD?=
 =?utf-8?B?Zks2S05lM3VJRk93WWNtUUZZd0FsaUJvdlo4ZTZIcXA0V3loakJJZkN3bUpp?=
 =?utf-8?B?WVB5RmV0cnZRSzF1MHU5VUMxS2V2aGxTNWhVOC9VSncwSHYwOENXTlhsTkxT?=
 =?utf-8?B?aDhnTjN5SzZ3eDZUKzhqRHhJZmVUWDJDNndtTzNValp1Sk1FYWg4L1hHcUNE?=
 =?utf-8?B?YUtiam9CNHdtUXljenl4b3NBR0hhVnBrOU80bFpoamtsTTY3OTBFVVJhTXI2?=
 =?utf-8?Q?dP8R90SjRGzJMos1G9t4OOrNR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11f467a3-081e-43fe-00c9-08de0b6dd684
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 22:05:51.3382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cghO3CHObfFmbIwu7yWpQE4bVpGZPhwTB+AKoqZb8xzS0YdP2dsFCL6fd1LrNmq7EvByuQoxi/L6FQLs9ySS1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5937
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



On 10/14/2025 12:01 PM, Lizhi Hou wrote:
> Add new parameter DRM_AMDXDNA_HW_LAST_ASYNC_ERR to get array IOCTL. When
> hardware reports an error, the driver save the error information and
> timestamp. This new get array parameter retrieves the last error.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_error.c      | 91 ++++++++++++++++++++-----
>   drivers/accel/amdxdna/aie2_pci.c        |  3 +
>   drivers/accel/amdxdna/aie2_pci.h        |  5 +-
>   drivers/accel/amdxdna/amdxdna_error.h   | 59 ++++++++++++++++
>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 +-
>   include/uapi/drm/amdxdna_accel.h        | 13 ++++
>   6 files changed, 155 insertions(+), 19 deletions(-)
>   create mode 100644 drivers/accel/amdxdna/amdxdna_error.h
> 
> diff --git a/drivers/accel/amdxdna/aie2_error.c b/drivers/accel/amdxdna/aie2_error.c
> index 5ee905632a39..976f5f0ea308 100644
> --- a/drivers/accel/amdxdna/aie2_error.c
> +++ b/drivers/accel/amdxdna/aie2_error.c
> @@ -13,6 +13,7 @@
>   
>   #include "aie2_msg_priv.h"
>   #include "aie2_pci.h"
> +#include "amdxdna_error.h"
>   #include "amdxdna_mailbox.h"
>   #include "amdxdna_pci_drv.h"
>   
> @@ -46,6 +47,7 @@ enum aie_module_type {
>   	AIE_MEM_MOD = 0,
>   	AIE_CORE_MOD,
>   	AIE_PL_MOD,
> +	AIE_UNKNOWN_MOD,
>   };
>   
>   enum aie_error_category {
> @@ -143,6 +145,27 @@ static const struct aie_event_category aie_ml_shim_tile_event_cat[] = {
>   	EVENT_CATEGORY(74U, AIE_ERROR_LOCK),
>   };
>   
> +static const enum amdxdna_error_num aie_cat_err_num_map[] = {
> +	[AIE_ERROR_SATURATION] = AMDXDNA_ERROR_NUM_AIE_SATURATION,
> +	[AIE_ERROR_FP] = AMDXDNA_ERROR_NUM_AIE_FP,
> +	[AIE_ERROR_STREAM] = AMDXDNA_ERROR_NUM_AIE_STREAM,
> +	[AIE_ERROR_ACCESS] = AMDXDNA_ERROR_NUM_AIE_ACCESS,
> +	[AIE_ERROR_BUS] = AMDXDNA_ERROR_NUM_AIE_BUS,
> +	[AIE_ERROR_INSTRUCTION] = AMDXDNA_ERROR_NUM_AIE_INSTRUCTION,
> +	[AIE_ERROR_ECC] = AMDXDNA_ERROR_NUM_AIE_ECC,
> +	[AIE_ERROR_LOCK] = AMDXDNA_ERROR_NUM_AIE_LOCK,
> +	[AIE_ERROR_DMA] = AMDXDNA_ERROR_NUM_AIE_DMA,
> +	[AIE_ERROR_MEM_PARITY] = AMDXDNA_ERROR_NUM_AIE_MEM_PARITY,
> +	[AIE_ERROR_UNKNOWN] = AMDXDNA_ERROR_NUM_UNKNOWN,
> +};

I think it would be good to add:

static_assert(ARRAY_SIZE(aie_cat_err_num_map) == AIE_ERROR_UNKNOWN);

> +
> +static const enum amdxdna_error_module aie_err_mod_map[] = {
> +	[AIE_MEM_MOD] = AMDXDNA_ERROR_MODULE_AIE_MEMORY,
> +	[AIE_CORE_MOD] = AMDXDNA_ERROR_MODULE_AIE_CORE,
> +	[AIE_PL_MOD] = AMDXDNA_ERROR_MODULE_AIE_PL,
> +	[AIE_UNKNOWN_MOD] = AMDXDNA_ERROR_MODULE_UNKNOWN,
> +};

Same thing here for a static assert.

> +
>   static enum aie_error_category
>   aie_get_error_category(u8 row, u8 event_id, enum aie_module_type mod_type)
>   {
> @@ -176,12 +199,40 @@ aie_get_error_category(u8 row, u8 event_id, enum aie_module_type mod_type)
>   		if (event_id != lut[i].event_id)
>   			continue;
>   
> +		if (lut[i].category > AIE_ERROR_UNKNOWN)
> +			return AIE_ERROR_UNKNOWN;
> +
>   		return lut[i].category;
>   	}
>   
>   	return AIE_ERROR_UNKNOWN;
>   }
>   
> +static void aie2_update_last_async_error(struct amdxdna_dev_hdl *ndev, void *err_info, u32 num_err)
> +{
> +	struct aie_error *errs = err_info;
> +	enum amdxdna_error_module err_mod;
> +	enum aie_error_category aie_err;
> +	enum amdxdna_error_num err_num;
> +	struct aie_error *last_err;
> +
> +	last_err = &errs[num_err - 1];
> +	if (last_err->mod_type >= AIE_UNKNOWN_MOD) {
> +		err_num = aie_cat_err_num_map[AIE_ERROR_UNKNOWN];
> +		err_mod = aie_err_mod_map[AIE_UNKNOWN_MOD];
> +	} else {
> +		aie_err = aie_get_error_category(last_err->row,
> +						 last_err->event_id,
> +						 last_err->mod_type);
> +		err_num = aie_cat_err_num_map[aie_err];
> +		err_mod = aie_err_mod_map[last_err->mod_type];
> +	}
> +
> +	ndev->last_async_err.err_code = AMDXDNA_ERROR_ENCODE(err_num, err_mod);
> +	ndev->last_async_err.ts_us = ktime_to_us(ktime_get_real());
> +	ndev->last_async_err.ex_err_code = AMDXDNA_EXTRA_ERR_ENCODE(last_err->row, last_err->col);
> +}
> +
>   static u32 aie2_error_backtrack(struct amdxdna_dev_hdl *ndev, void *err_info, u32 num_err)
>   {
>   	struct aie_error *errs = err_info;
> @@ -264,29 +315,14 @@ static void aie2_error_worker(struct work_struct *err_work)
>   	}
>   
>   	mutex_lock(&xdna->dev_lock);
> +	aie2_update_last_async_error(e->ndev, info->payload, info->err_cnt);
> +
>   	/* Re-sent this event to firmware */
>   	if (aie2_error_event_send(e))
>   		XDNA_WARN(xdna, "Unable to register async event");
>   	mutex_unlock(&xdna->dev_lock);
>   }
>   
> -int aie2_error_async_events_send(struct amdxdna_dev_hdl *ndev)
> -{
> -	struct amdxdna_dev *xdna = ndev->xdna;
> -	struct async_event *e;
> -	int i, ret;
> -
> -	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
> -	for (i = 0; i < ndev->async_events->event_cnt; i++) {
> -		e = &ndev->async_events->event[i];
> -		ret = aie2_error_event_send(e);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	return 0;
> -}
> -
>   void aie2_error_async_events_free(struct amdxdna_dev_hdl *ndev)
>   {
>   	struct amdxdna_dev *xdna = ndev->xdna;
> @@ -341,6 +377,10 @@ int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev)
>   		e->size = ASYNC_BUF_SIZE;
>   		e->resp.status = MAX_AIE2_STATUS_CODE;
>   		INIT_WORK(&e->work, aie2_error_worker);
> +
> +		ret = aie2_error_event_send(e);
> +		if (ret)
> +			goto free_wq;
>   	}
>   
>   	ndev->async_events = events;
> @@ -349,6 +389,8 @@ int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev)
>   		 events->event_cnt, events->size);
>   	return 0;
>   
> +free_wq:
> +	destroy_workqueue(events->wq);
>   free_buf:
>   	dma_free_noncoherent(xdna->ddev.dev, events->size, events->buf,
>   			     events->addr, DMA_FROM_DEVICE);
> @@ -356,3 +398,18 @@ int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev)
>   	kfree(events);
>   	return ret;
>   }
> +
> +int aie2_get_array_async_error(struct amdxdna_dev_hdl *ndev, struct amdxdna_drm_get_array *args)
> +{
> +	struct amdxdna_dev *xdna = ndev->xdna;
> +
> +	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
> +
> +	args->num_element = 1;
> +	args->element_size = sizeof(ndev->last_async_err);
> +	if (copy_to_user(u64_to_user_ptr(args->buffer),
> +			 &ndev->last_async_err, args->element_size))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 8a66f276100e..cfca4e456b61 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -924,6 +924,9 @@ static int aie2_get_array(struct amdxdna_client *client,
>   	case DRM_AMDXDNA_HW_CONTEXT_ALL:
>   		ret = aie2_query_ctx_status_array(client, args);
>   		break;
> +	case DRM_AMDXDNA_HW_LAST_ASYNC_ERR:
> +		ret = aie2_get_array_async_error(xdna->dev_handle, args);
> +		break;
>   	default:
>   		XDNA_ERR(xdna, "Not supported request parameter %u", args->param);
>   		ret = -EOPNOTSUPP;
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index 289a23ecd5f1..34bc35479f42 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -190,6 +190,8 @@ struct amdxdna_dev_hdl {
>   
>   	enum aie2_dev_status		dev_status;
>   	u32				hwctx_num;
> +
> +	struct amdxdna_async_error	last_async_err;
>   };
>   
>   #define DEFINE_BAR_OFFSET(reg_name, bar, reg_addr) \
> @@ -253,8 +255,9 @@ void aie2_psp_stop(struct psp_device *psp);
>   /* aie2_error.c */
>   int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev);
>   void aie2_error_async_events_free(struct amdxdna_dev_hdl *ndev);
> -int aie2_error_async_events_send(struct amdxdna_dev_hdl *ndev);
>   int aie2_error_async_msg_thread(void *data);
> +int aie2_get_array_async_error(struct amdxdna_dev_hdl *ndev,
> +			       struct amdxdna_drm_get_array *args);
>   
>   /* aie2_message.c */
>   int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev);
> diff --git a/drivers/accel/amdxdna/amdxdna_error.h b/drivers/accel/amdxdna/amdxdna_error.h
> new file mode 100644
> index 000000000000..c51de86ec12b
> --- /dev/null
> +++ b/drivers/accel/amdxdna/amdxdna_error.h
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2025, Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _AMDXDNA_ERROR_H_
> +#define _AMDXDNA_ERROR_H_
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +
> +#define AMDXDNA_ERR_DRV_AIE		4
> +#define AMDXDNA_ERR_SEV_CRITICAL	3
> +#define AMDXDNA_ERR_CLASS_AIE		2
> +
> +#define AMDXDNA_ERR_NUM_MASK		GENMASK_U64(15, 0)
> +#define AMDXDNA_ERR_DRV_MASK		GENMASK_U64(23, 16)
> +#define AMDXDNA_ERR_SEV_MASK		GENMASK_U64(31, 24)
> +#define AMDXDNA_ERR_MOD_MASK		GENMASK_U64(39, 32)
> +#define AMDXDNA_ERR_CLASS_MASK		GENMASK_U64(47, 40)
> +
> +enum amdxdna_error_num {
> +	AMDXDNA_ERROR_NUM_AIE_SATURATION = 3,
> +	AMDXDNA_ERROR_NUM_AIE_FP,
> +	AMDXDNA_ERROR_NUM_AIE_STREAM,
> +	AMDXDNA_ERROR_NUM_AIE_ACCESS,
> +	AMDXDNA_ERROR_NUM_AIE_BUS,
> +	AMDXDNA_ERROR_NUM_AIE_INSTRUCTION,
> +	AMDXDNA_ERROR_NUM_AIE_ECC,
> +	AMDXDNA_ERROR_NUM_AIE_LOCK,
> +	AMDXDNA_ERROR_NUM_AIE_DMA,
> +	AMDXDNA_ERROR_NUM_AIE_MEM_PARITY,
> +	AMDXDNA_ERROR_NUM_UNKNOWN = 15,
> +};
> +
> +enum amdxdna_error_module {
> +	AMDXDNA_ERROR_MODULE_AIE_CORE = 3,
> +	AMDXDNA_ERROR_MODULE_AIE_MEMORY,
> +	AMDXDNA_ERROR_MODULE_AIE_SHIM,
> +	AMDXDNA_ERROR_MODULE_AIE_NOC,
> +	AMDXDNA_ERROR_MODULE_AIE_PL,
> +	AMDXDNA_ERROR_MODULE_UNKNOWN = 8,
> +};
> +
> +#define AMDXDNA_ERROR_ENCODE(err_num, err_mod)				\
> +	(FIELD_PREP(AMDXDNA_ERR_NUM_MASK, err_num) |			\
> +	 FIELD_PREP_CONST(AMDXDNA_ERR_DRV_MASK, AMDXDNA_ERR_DRV_AIE) |	\
> +	 FIELD_PREP_CONST(AMDXDNA_ERR_SEV_MASK, AMDXDNA_ERR_SEV_CRITICAL) | \
> +	 FIELD_PREP(AMDXDNA_ERR_MOD_MASK, err_mod) |			\
> +	 FIELD_PREP_CONST(AMDXDNA_ERR_CLASS_MASK, AMDXDNA_ERR_CLASS_AIE))
> +
> +#define AMDXDNA_EXTRA_ERR_COL_MASK	GENMASK_U64(7, 0)
> +#define AMDXDNA_EXTRA_ERR_ROW_MASK	GENMASK_U64(15, 8)
> +
> +#define AMDXDNA_EXTRA_ERR_ENCODE(row, col)				\
> +	(FIELD_PREP(AMDXDNA_EXTRA_ERR_COL_MASK, col) |			\
> +	 FIELD_PREP(AMDXDNA_EXTRA_ERR_ROW_MASK, row))
> +
> +#endif /* _AMDXDNA_ERROR_H_ */
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index aa04452310e5..696fdac8ad3c 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -27,9 +27,10 @@ MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
>   /*
>    * 0.0: Initial version
>    * 0.1: Support getting all hardware contexts by DRM_IOCTL_AMDXDNA_GET_ARRAY
> + * 0.2: Support getting last error hardware error
>    */
>   #define AMDXDNA_DRIVER_MAJOR		0
> -#define AMDXDNA_DRIVER_MINOR		1
> +#define AMDXDNA_DRIVER_MINOR		2
>   
>   /*
>    * Bind the driver base on (vendor_id, device_id) pair and later use the
> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
> index a1fb9785db77..c7eec9ceb2ae 100644
> --- a/include/uapi/drm/amdxdna_accel.h
> +++ b/include/uapi/drm/amdxdna_accel.h
> @@ -523,7 +523,20 @@ struct amdxdna_drm_hwctx_entry {
>   	__u32 pad;
>   };
>   
> +/**
> + * struct amdxdna_async_error - XDNA async error structure
> + */
> +struct amdxdna_async_error {
> +	/** @err_code: Error code. */
> +	__u64 err_code;
> +	/** @ts_us: Timestamp. */
> +	__u64 ts_us;
> +	/** @ex_err_code: Extra error code */
> +	__u64 ex_err_code;
> +};
> +
>   #define DRM_AMDXDNA_HW_CONTEXT_ALL	0
> +#define DRM_AMDXDNA_HW_LAST_ASYNC_ERR	2
>   
>   /**
>    * struct amdxdna_drm_get_array - Get information array.

