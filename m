Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D87B734A30
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 04:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5936910E164;
	Mon, 19 Jun 2023 02:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422FD10E156;
 Mon, 19 Jun 2023 02:27:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AuAkxLL97leGQ9XH3Y59+q8KMLU03vn+ZqsNiaXEr5xJLrYdiNVcAmLwU9hMcvsOEUr2Y+FFAbIdSgnZieljX0ofP6mSSIKVJhQNMpY4PHq0taSYJy4Guq8shOvGXfcHA0ufbwZYQtzJ/Rvd+Wk+o7qtAUklyjMohcx3uOHV7VaZIeWTLB0XV1OnUMsByK4U03Pv82YI0V6tO/CNT+BhZPhgkOfYll74CRvSBM5e2u9Sb8s+Ri2QTu4dWKy4ASdtsQ5qExSJodz1vo0qbw9Zev+4gvdYpo5haputvkc8eom3nmi+m6mkJVjU9MyzTqqLI+WrEsfr/kiNQ5cWPd8meA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1AI4sSTeSJbAQ7gL6txSYYN/LjtghXq/VKjjr+jcwwA=;
 b=ky9uDj1F6NSsKqTX0IeYYWtBoxBDhERTaFLLO6wltbCEAOSSZ3cdyUc/hzGQsjxJGk7NKS7p5wfsFR94BsuAqlGIvE4rjp8NJa8i5q5tQcaT9yMH/g2qs636OsEd/SQwkO+Fgz28e6EQyx4x8GxGaX2MHKZ8jX+IeCXaW4tgNuTi8/+s4QWJeGUMEa/26/JOV/2Rzq7zbbHa5T5xlgIo5iooh3k915Fq6KmW8CwfvK9qtxun+rmQ7+61DYndEx4NgXLlorzhpzG6VqE/ckOotJmkgauP5Gv3RsA4MWiQEejdpClfF54pV9o6Iw+jPWpBeNKfYJwB9DdYz24d1+G1kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1AI4sSTeSJbAQ7gL6txSYYN/LjtghXq/VKjjr+jcwwA=;
 b=p7FTgvFlcv+fqs18TGR/BD3NgYo5cWvaAqR6+Id2QBUvSZjKEgbhsLR40oY5QA3fofQHpluRwytx9zN8B8oe3i8xhfhvO6JhfrwE7k7+3ZD3eTxp0kmP1LTvAPEhc34OjtBPrvL25oCICTqsfpBP4vaID6OfCkiqDpJU8S+D6tg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA1PR12MB8860.namprd12.prod.outlook.com (2603:10b6:806:38b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Mon, 19 Jun
 2023 02:27:40 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 02:27:40 +0000
Message-ID: <2bf4e20b-b206-6337-dcee-d8a13804db50@amd.com>
Date: Sun, 18 Jun 2023 21:27:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH V3 7/7] drm/amd/pm: enable Wifi RFI mitigation feature
 support for SMU13.0.7
Content-Language: en-US
To: Evan Quan <evan.quan@amd.com>, rafael@kernel.org, lenb@kernel.org,
 Alexander.Deucher@amd.com, Christian.Koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, kvalo@kernel.org, nbd@nbd.name,
 lorenzo@kernel.org, ryder.lee@mediatek.com, shayne.chen@mediatek.com,
 sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, Lijo.Lazar@amd.com
References: <20230616065757.1054422-1-evan.quan@amd.com>
 <20230616065757.1054422-8-evan.quan@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20230616065757.1054422-8-evan.quan@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR16CA0068.namprd16.prod.outlook.com
 (2603:10b6:805:ca::45) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA1PR12MB8860:EE_
X-MS-Office365-Filtering-Correlation-Id: c283942d-62f6-40d0-8f45-08db706cc160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gR9Vk5flu5Yq23Avo2P5uHi8g0ly1syFXs9t5bj4QC5GKWmIEbGVQDMas2cQn7LU7nGNeQsK+4CXB3SDPI2wv8e0OKlCbEevCKcFwaUHwxzj1X9oDzYzz4+HM/jjBS5RXCFn8hdIgu8h8PPr+RqERY9WiXd5XvLWQuK+Rn+CyqwF6pyNoZqGO0oJx+A+FLcumlUOzXY2NUkjDfaOTqF6eHRCNO2OxuODxzPmzE1l3de54J2xfqbqmsFLy56TAgayqfiJnOJdY7v1K5Z0khW9laua7ZgVYhaNOMV21A5INd9su/fZNCF4vDeAAjqVmxyTCZclvq/MSHOm1EmmB9q+phuHytP7BsY+pO4VLoukOL53tAN0wmYpjwH/2dLM/LBLECSXTTCys5/uHQN20yi8rlwKoSbRN7f3fiJT3ItJy3Ue5iUTYKBpL5V6iHJOqZjiTEYqkdPGliakECOC86JEw5xA4Ztn27HzJUlEVoWnVbqK3jtVGopBj3j69UCW/nfHGYwBj8o11aVWp8+tXH5FiyDbBWzTm7SnXa37D3etKfLPLEDNjfmvCljmOg3853Pn38/r6YrpmL8iRzgdW4/UXtMzOnziOu58RHMb4XLh+8MVppfqYEmc0FRg0lMxXl9GG6rZS6ZUzjeb8klnM1+lsi5rYa676uLLm7E7hg+mGLg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(451199021)(316002)(478600001)(44832011)(31696002)(86362001)(6486002)(6666004)(38100700002)(41300700001)(83380400001)(66946007)(66556008)(6636002)(4326008)(66476007)(8676002)(8936002)(31686004)(921005)(2906002)(5660300002)(6506007)(53546011)(186003)(6512007)(2616005)(36756003)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWdwaUoyM3BKRDRXUVh2Qk9JR2JyTmpFS1pUTExuZkZNNU5Pa0JXRU9BZmFn?=
 =?utf-8?B?RUlVTWlNbHNOQnVzWUVUUnVRdWt6M3ZIdmtHSUMvMTEyaTBReE1FUE9YVk1x?=
 =?utf-8?B?R2ZtRXoyRG40SHg3OEtoWkNQSWt6Sy9oR3BuL2xPMUZaaFdiM29BUmlyTk9N?=
 =?utf-8?B?Y2h3aDRObmR3NkpXYWh1VmNQejFkR0pta3dJbWVid3BwZVFXd1VIUlFDT0ps?=
 =?utf-8?B?MmpyMlNaL056akFOejBheU9UYTZXZ3R3S3Y4TDVzMnV4NmVxSkcvTmM4TEFJ?=
 =?utf-8?B?allPZXRlVEF5M0hSaytWMmRiWEU5MFBmWGpkK0IrdFNQN2VvelJVdW1Db3dU?=
 =?utf-8?B?d3B4QjlNblE3YjZvL2hLSDMyejlSWU40MFRtSHU5cnY4VndINzQyQ2dMdnpC?=
 =?utf-8?B?VTJuU2lvUWVXdG84R1ArSGNwM1lnOFBWMDJTUHZIaEhaWUxqdUUyZVhXV1o3?=
 =?utf-8?B?aWFZNERDT3ZRYnhJMVVZTHFnNHJheWxCajdGV2Vud1hIVC9RcjdFeTVRMVJq?=
 =?utf-8?B?Q3p2ZGErOE1iaDVLQ1RpL28wb3ZtamFTQlZQTllNci9Pd0gwWUd2UHJHSW9t?=
 =?utf-8?B?UEV5TStvYW5VSFBHK3NxWUYyQTlMWDJlcjdsdFVqV0F3KzkraVhHU1JYTnZL?=
 =?utf-8?B?d0RrbmZhTi9tbnJNc0JURFJuUGVjeVROU3UwQk9NcHpIU2ZMSU1LTkIrQnMy?=
 =?utf-8?B?YkJhRitwcEVyektrYTh6WDluN0tBSUt3T1RhbGJXR2pPV1hpZEpNaWtPR0FL?=
 =?utf-8?B?NDFLM0xPbDZaa1h5VGROM3A3bDJJWm1hK0Z2M3NnaDVKaDJLMS95ckxENmRQ?=
 =?utf-8?B?U0FsVk5iNlFERG5UZ2NpY1VEaXFPMmV0UmJBbmFraW4rVWp2TWpTVFRaMkNK?=
 =?utf-8?B?Tm5uWjJHOWlpNUtzK3BKU2J2S3c4bFZCcStVc0VDYVRFQSttK2N6K2NWQnVP?=
 =?utf-8?B?OC9aRUpnL2RUVE1ZaWpoc096NTJ2RHlQREJzYzU4YlhTWm1sVE9IWHMwcG9Z?=
 =?utf-8?B?TC8zTEhUVE1OTVp1clM5eUFGZ0prMkJDNWl6YnBSZ0xXUXZRT09ybDFXOVN6?=
 =?utf-8?B?N0pZRWJNS1E1WHRJSzdtN2t3WU1ubE5Fa2tFZUthTTV1S2ZnWnZIeXdkcEw5?=
 =?utf-8?B?YnNpb0ZlUmE4L0JaUGY3cTU2ZmQ2cHZnYkQzS3ZSeHFGWDZFUEpmM1JXNmFQ?=
 =?utf-8?B?ZER0Q3RwVThRbXQ3TVNocHBlQ0hoM3RXODY3cUJzWTBDT2ZDTkw5VmRIN1h0?=
 =?utf-8?B?bW1lYTAzTDEydFRQTzB6MDE0Qnd0TXVlbzBoSWNaclU4eXpBSktFOGt0UWEw?=
 =?utf-8?B?Z1Z4cW1JRys2UHZuUXBsZGxIejVCb2RlN3dBa01iam0remN0czhaNmFyYXNl?=
 =?utf-8?B?Tkw4UGxkcU9EdkxscEVlVi9kdGlGR0QzZTE4bjdqMWxHZEEzQnNwQS84VWZj?=
 =?utf-8?B?WkF0TUEzbDVCTmlwcUlMS3MxRjNZNnNCbVA5eDJmYXpGTTA4cmd4ZEorZ2ZQ?=
 =?utf-8?B?SVQwRmNISU1IZjExMnRrakZ5NVQ3U1RZWnNJQkJBYmdjR2dBTVNETkxHMHdK?=
 =?utf-8?B?b1VuVHFrbC9ld0VlM0RTeGxZWEFSSUw2RlQ3R2J4NXVDMFVMSlFRcFRHdmJH?=
 =?utf-8?B?RmV6TmIrMzFWZlJLcVF6b000WS91SjAzRDVIMkZjTjdWdUkxc0d5QnREdWhN?=
 =?utf-8?B?elF6Um1Ia1VwaUdLV1J6d1gxQzl2c1g2TkFGYndoZ1B0K3pFSHhubU03dTRZ?=
 =?utf-8?B?WDc5emFFeUtNV25McmwyVzdPWlRyVFloTkdwN2NDOFYzTnhpSURVRDZ6bTNF?=
 =?utf-8?B?L2xmOUZrblNUMXRtTlMwblJjSFp4M0x0YVYwOTlJckliTlNtSG40YWFySjly?=
 =?utf-8?B?TG9PQzB0SUZqMUxScHVyeUhNbllKN0d3UEpyM2dEOXdMRC9hc1AvNHVZUmVW?=
 =?utf-8?B?aVlSSmJRZjdJOTBZV0FMVExVdWtVRXlYU2lHbFBZMG9BZTlxd2ZKejBWSkZ6?=
 =?utf-8?B?MXYyWFhabHoyQTBlVkRmeHhnQktXbnJvMFNqTGRkVG9sM3ErU3FaS1IyNEd3?=
 =?utf-8?B?b2IyL3pxRkRYU21CU0FUMTkzaTdWYjN1Qml2eHVVTmNMcVNYeVE4aFdPcVVk?=
 =?utf-8?B?VE56U20wT3Nab0JNU250dDZkUE5Ma1A3TXFPZ2ZjUUZtdGxFSVZXR1RmQXZO?=
 =?utf-8?B?Nmc9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c283942d-62f6-40d0-8f45-08db706cc160
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 02:27:40.7307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vSNf8iuaSk3FuVfvaSIQE3tCSXDE7N7XV6OYOk2YHP6vu/EFwjAttayjl6Qj+nIiwnEjDHrMbjcXKgJDFLgq3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8860
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
Cc: linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/16/23 01:57, Evan Quan wrote:
> Fulfill the SMU13.0.7 support for Wifi RFI mitigation feature.
> 
> Signed-off-by: Evan Quan <evan.quan@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   .../drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c  | 59 +++++++++++++++++++
>   1 file changed, 59 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
> index 98a33f8ee209..16c1c04e2034 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
> @@ -125,6 +125,7 @@ static struct cmn2asic_msg_mapping smu_v13_0_7_message_map[SMU_MSG_MAX_COUNT] =
>   	MSG_MAP(ArmD3,				PPSMC_MSG_ArmD3,                       0),
>   	MSG_MAP(AllowGpo,			PPSMC_MSG_SetGpoAllow,           0),
>   	MSG_MAP(GetPptLimit,			PPSMC_MSG_GetPptLimit,                 0),
> +	MSG_MAP(EnableUCLKShadow,		PPSMC_MSG_EnableUCLKShadow,            0),
>   };
>   
>   static struct cmn2asic_mapping smu_v13_0_7_clk_map[SMU_CLK_COUNT] = {
> @@ -205,6 +206,7 @@ static struct cmn2asic_mapping smu_v13_0_7_table_map[SMU_TABLE_COUNT] = {
>   	TAB_MAP(DRIVER_SMU_CONFIG),
>   	TAB_MAP(ACTIVITY_MONITOR_COEFF),
>   	[SMU_TABLE_COMBO_PPTABLE] = {1, TABLE_COMBO_PPTABLE},
> +	TAB_MAP(WIFIBAND),
>   };
>   
>   static struct cmn2asic_mapping smu_v13_0_7_pwr_src_map[SMU_POWER_SOURCE_COUNT] = {
> @@ -487,6 +489,9 @@ static int smu_v13_0_7_tables_init(struct smu_context *smu)
>   	               AMDGPU_GEM_DOMAIN_VRAM);
>   	SMU_TABLE_INIT(tables, SMU_TABLE_COMBO_PPTABLE, MP0_MP1_DATA_REGION_SIZE_COMBOPPTABLE,
>   			PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
> +	SMU_TABLE_INIT(tables, SMU_TABLE_WIFIBAND,
> +		       sizeof(WifiBandEntryTable_t), PAGE_SIZE,
> +		       AMDGPU_GEM_DOMAIN_VRAM);
>   
>   	smu_table->metrics_table = kzalloc(sizeof(SmuMetricsExternal_t), GFP_KERNEL);
>   	if (!smu_table->metrics_table)
> @@ -1721,6 +1726,57 @@ static int smu_v13_0_7_set_df_cstate(struct smu_context *smu,
>   					       NULL);
>   }
>   
> +static bool smu_v13_0_7_wbrf_support_check(struct smu_context *smu)
> +{
> +	return smu->smc_fw_version > 0x00524600;
> +}
> +
> +static int smu_v13_0_7_set_wbrf_exclusion_ranges(struct smu_context *smu,
> +						 struct exclusion_range *exclusion_ranges)
> +{
> +	WifiBandEntryTable_t wifi_bands;
> +	int valid_entries = 0;
> +	int ret, i;
> +
> +	memset(&wifi_bands, 0, sizeof(wifi_bands));
> +	for (i = 0; i < ARRAY_SIZE(wifi_bands.WifiBandEntry); i++) {
> +		if (!exclusion_ranges[i].start &&
> +		    !exclusion_ranges[i].end)
> +			break;
> +
> +		/* PMFW expects the inputs to be in Mhz unit */
> +		wifi_bands.WifiBandEntry[valid_entries].LowFreq =
> +			DIV_ROUND_DOWN_ULL(exclusion_ranges[i].start, HZ_IN_MHZ);
> +		wifi_bands.WifiBandEntry[valid_entries++].HighFreq =
> +			DIV_ROUND_UP_ULL(exclusion_ranges[i].end, HZ_IN_MHZ);
> +	}
> +	wifi_bands.WifiBandEntryNum = valid_entries;
> +
> +	/*
> +	 * Per confirm with PMFW team, WifiBandEntryNum = 0 is a valid setting.
> +	 * Considering the scenarios below:
> +	 * - At first the wifi device adds an exclusion range e.g. (2400,2500) to
> +	 *   BIOS and our driver gets notified. We will set WifiBandEntryNum = 1
> +	 *   and pass the WifiBandEntry (2400, 2500) to PMFW.
> +	 *
> +	 * - Later the wifi device removes the wifiband list added above and
> +	 *   our driver gets notified again. At this time, driver will set
> +	 *   WifiBandEntryNum = 0 and pass an empty WifiBandEntry list to PMFW.
> +	 *   - PMFW may still need to do some uclk shadow update(e.g. switching
> +	 *     from shadow clock back to primary clock) on receiving this.
> +	 */
> +
> +	ret = smu_cmn_update_table(smu,
> +				   SMU_TABLE_WIFIBAND,
> +				   0,
> +				   (void *)(&wifi_bands),
> +				   true);
> +	if (ret)
> +		dev_err(smu->adev->dev, "Failed to set wifiband!");
> +
> +	return ret;
> +}
> +
>   static const struct pptable_funcs smu_v13_0_7_ppt_funcs = {
>   	.get_allowed_feature_mask = smu_v13_0_7_get_allowed_feature_mask,
>   	.set_default_dpm_table = smu_v13_0_7_set_default_dpm_table,
> @@ -1786,6 +1842,9 @@ static const struct pptable_funcs smu_v13_0_7_ppt_funcs = {
>   	.set_mp1_state = smu_v13_0_7_set_mp1_state,
>   	.set_df_cstate = smu_v13_0_7_set_df_cstate,
>   	.gpo_control = smu_v13_0_gpo_control,
> +	.is_asic_wbrf_supported = smu_v13_0_7_wbrf_support_check,
> +	.enable_uclk_shadow = smu_v13_0_enable_uclk_shadow,
> +	.set_wbrf_exclusion_ranges = smu_v13_0_7_set_wbrf_exclusion_ranges,
>   };
>   
>   void smu_v13_0_7_set_ppt_funcs(struct smu_context *smu)

