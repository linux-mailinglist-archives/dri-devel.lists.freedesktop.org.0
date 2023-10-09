Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB147BD2AD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 06:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF1B910E084;
	Mon,  9 Oct 2023 04:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0010810E04D;
 Mon,  9 Oct 2023 04:58:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfXwyT1/o7np+8wTayZ/97u9bzhrN/HbJUYyuN/lkTT+PGSLj1pdRNFaYTVuvLCSx/2CBCp3QdylWDFGy3Br5fbyl7iUX2z1QaeDmdCQyGLCuEH7maPEi1hcyV6WY+N7VwhrgsAR1gfuPTdS6HD8AdyMifUCoFv4cnt9rYtBfNaw6EyAGunYkEuZR4Ma5k9ZJfgju+44viycBoiOh1tNcMedTNcGxl220hCd5EEsAA1pFtLvI7QX016oO1p8ltfRUScde2qVJWsiOlbepsRB+P72IxWzoAplY70SCBh6SOInG2kW12GSd3nrzAsISXd1ePVts5iOYOivkGqLzalEjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOGeVEtvtdpuFsQ/tTfQeE7E0+jAxHpxRNgZNCrCk8s=;
 b=JiqiqfVXacNArAFGUvuPN6gl4aa9zFN3hGis6BBj/165zqvP7WNW5aaOoRe72yjQqSUokQ7YF4kqX2pWZbgnifTieVa3PvMm+9erMq8D/zxWUrkTxQ2g/jtv5ny1Iv4zbRPdar/WBXlsRARWrHvmsGoOZbY10PbAkOkd1yPaFbdP4q4vFd5nxP9R2VnMmOeULA8zGQLIczAmuBOLIqOqW9m6LWmObTLjcTJD8P347zRTCJXFbMaNQb/Y1kyJXhZT/hL8/FbI2ij/vW1Ha2jtI6fXuZy+S+WNZPO0vhKa8b7j9x8yPjlAuDa/Flw/HiRsTOCuM8BQNt6Yi/zYjUeoQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOGeVEtvtdpuFsQ/tTfQeE7E0+jAxHpxRNgZNCrCk8s=;
 b=K3Ad8IMhRnpeVhix5StyxclqfHs0vvc9YBr1fhbklNqEDjZZ2eqosv8FQ/tThF6F8xvaT1c690dFmMD6cZEiTmKmdQnKPxriUeRW0iafPMUgkCWeHd/LIAFF2ZhvTlOY3n6TkRhrlK5MfiUidlvuLoccBb2ImdmaGrnfCw5fqDM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DM4PR12MB5962.namprd12.prod.outlook.com (2603:10b6:8:69::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.41; Mon, 9 Oct 2023 04:58:30 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 04:58:30 +0000
Message-ID: <01eef1b0-8695-4284-8a4a-973826f2c3cc@amd.com>
Date: Mon, 9 Oct 2023 10:28:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] platform/x86/amd/pmf: Add PMF TEE interface
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
 <20230930083715.2050863-2-Shyam-sundar.S-k@amd.com>
 <584aebd-5c89-d085-275-bb79f93429f@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <584aebd-5c89-d085-275-bb79f93429f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0202.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::10) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DM4PR12MB5962:EE_
X-MS-Office365-Filtering-Correlation-Id: a759797a-2f18-4d4a-2b29-08dbc8846122
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9jlfldgE53epjKJ5TjPYrYGyjYKbTBPM0IbcHajoSoKuqGTy+1dxbngHn+H9DOeA0j22SeT/kg9nvFeuspOXkLvMtkvY4iZeqqNbR2HWQ6FyV4qevjGgl6acXftDvbhbzUTPBMVMCKsV4Qp9md/5sW2PRyCq0nWpJHQvWIc3TgRsuYAkZY5eiMSUflU9DX+31lKGG1N6/e8GyHoRo8HZvaB10YH5+Pw+pYyVAIYAmuq3AYjujJ1s4//TQF9KkfO5K11L3S5rwdMi70CQz3Eb4koRCUosPBiTp2Yh+fRPWMIFdig2Y4UqwoRbB0ZouQ2c5c13EQ1Cz4XhDz+oGiJ04iaF0FQZMefxaYPqKyNYNHxRfElr0Rr/tWYMpwYrZxQLa9lJnc9NUlBPF6K0dhQWR99E0er3i0WNJxj3vfZ2h8X+U0oA+hBo9ZY0UaPNie3bWjSSIOkw+wBE6+fHsSUDk0/vzmXaXd6JWPi5P7IAPf4WANWNBLfh4meIfKm6j8S+nEpqoSvAg8c5UOm4DhZ000GoSCAit78AGfBo4vZLs66AYMPmD7DUgzmSrXj4IruyTd7C7f+OckdrTwXu7r3fqNp7XXNapSye8dwRUqklY9p7lTs8+P4UO/cblFKpRbp0Dm+Pq/U4/a7lDRsP9/8mpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(366004)(396003)(346002)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6512007)(53546011)(2616005)(478600001)(6506007)(6486002)(6666004)(26005)(2906002)(83380400001)(7416002)(66574015)(5660300002)(66946007)(66556008)(66476007)(4326008)(8676002)(41300700001)(316002)(8936002)(6916009)(36756003)(31696002)(86362001)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3BrVWlIYVRlSUZ2MGhleFNScGtIWHUzUDhLdzF5a2ZZUFhDU0NQRytBdG4z?=
 =?utf-8?B?SkVrbWtaWis3Z1dBeHRnakVxQzhlYTZWdHJESisrV2Z1RjdLaG9xRVFOSk5r?=
 =?utf-8?B?bVgwOVRIdldnYkxWMWxHdkhEaUhlN1NTYVo1WFpqV3lIUS96WUtnNlROM3FW?=
 =?utf-8?B?OGNlVitPMmRJQWFyUXpoSFN5MmFzbWUxSjBmUnNxRlpud2FkUWxlUHBKYmJL?=
 =?utf-8?B?UmllSWdKa2M4U0c3ZmozQTh3aFk0MG93bm9xRWZ0TkcyNFZ4dHN5YnFraFdQ?=
 =?utf-8?B?REZhUnpHdEdhY2hnTUMwdjZ6b1ZHWDJTUC9FcnpsTURPUUpCM0c4bTIraDZ0?=
 =?utf-8?B?M0tEVFdkaGx0VU11SnRuR0pYazE2a0R5aTg0S0VVbDlDdXQvMDF6ZWhVS2lq?=
 =?utf-8?B?VG13b1c3V2NLQlJrakpFRXlUNm5VeDBodVVpaGFVSUJFRUQ0ZlNiTmJjUDVi?=
 =?utf-8?B?U0dZVUpXSERLR3FlMjRhcVhGMDhKVUoyYmRtQUVvdTloRFBJeGdtbytncUZT?=
 =?utf-8?B?QXE3ZVoyOUFZdi9WaTBpTjYxcDhXc1k1eGZxQy9lVHpZSkhIUC9IeGlleHFB?=
 =?utf-8?B?aUpjTlFQajJQbEpvdEZLQmoxSS9KU01mTlp1OW5kQ2Y1SGpkQjZpYVp0Z2ZO?=
 =?utf-8?B?aVB5Z2JsS3I5VU8zM1ZncFRmWCs5QUZ5SngzTG5VWHY1ZnVQZ2dGR24zNjh2?=
 =?utf-8?B?UzhNbzFlZytOYkdDanMxYTNVR0hsVDJkVGcwUndSeGxraFlIVm1qTXhrZ1FP?=
 =?utf-8?B?V3RvRmJBdnBjdVpYYVgwdkN4YzBsanIzeENxOXA5UlVyb2x3QTBaaGNGNmZJ?=
 =?utf-8?B?RG5aSXFVazdWMXRIVWhtc3Fha055ZERhZ1lkOFpseWM0dVg4WlA5eFlIT2JB?=
 =?utf-8?B?amZjQURvdjRmWC9yeW0yZDdnTzVMQlYyVU5pbllYSzB3eGtFU1ZGYVNwU0x1?=
 =?utf-8?B?RTlhYWZvYjcxZUo0bUN4cktiZXg5V0U5cW9QU2o2UTlVWi91N3FLRUhMRTA4?=
 =?utf-8?B?SWN6V251cHFoK1Zxd1J2QXR5RUR0VmFJVjFIZlFpZGdyYVlUazlES0dPeHBw?=
 =?utf-8?B?Zkd2eWNQallFOW5aQnUzaVU2ajNhTlVmZzh3WlRKWFFocW5ZWkhQTW9TTGph?=
 =?utf-8?B?ZDBVa2YyL2pKWnpqL3QvanVYRkdpRHlTZElsNjY0by9FTGFqVGJpMlBocVpt?=
 =?utf-8?B?RWlyOVhFOXlWNXh1MVUxSDExM3BNWDVvb1g0Sjc3eVpUSUVFcHIzQTI2R2ky?=
 =?utf-8?B?VzJFbVA5VS9nOENpUHJub3NtTXlGUHBDbXBCVnB2UEJYL01uenRTdUROVkFm?=
 =?utf-8?B?a0t4cVoxRzRpbHZieWltbkFVL2trd1d4YklJV2duazJCczBValVlRmZaOGR5?=
 =?utf-8?B?SFdvRHJiZHFmY01waGJoTVFBa1NKeUJlT3owTFJTY0VOaEIyVlpSNUFGWXF1?=
 =?utf-8?B?ZExmNlFYeC9OLzZLZ3pJWjhLZUFuOWdoWkhhMWxveXExcDFVaWd4ZS9Hb3o5?=
 =?utf-8?B?cGFXQWxtUlB0UlRMQXlhczNLb3VkWXZEenZaelo0V0hKR2EwYlJzY01TRTNS?=
 =?utf-8?B?ZUhHbWxUZlhHN05XazhxV2hnT3lkcFZTcDhMYkVva1Z3bFBHN1dVOVE5R3Q1?=
 =?utf-8?B?ZTJMMS80RUxYb0pPY05aUmt3dVpvSm92eElMMVJvd2QxM1paNVh1bTllYUxM?=
 =?utf-8?B?YWtvbCtDTjdlZ2l4MU04eTZqK0N0UGZZOStpb1VlZWhoTnQ1elFtNnhTUW9E?=
 =?utf-8?B?Q0dzSkh6WkNOMlhsUnB4L1J3dDJXWnFyM2NmTDdhQlRLbFlUVWRPMWxYQXVQ?=
 =?utf-8?B?c2lpNk5Fb0MzclBkS29MaVpVNVZGOVB1V3hlbXh5YjJhUUFtY0pmcWxRRU1r?=
 =?utf-8?B?OFVKVENGUGM3c3hDMkd1NkJheVdYdzhyZUQ5RmZ1VG5JL2xsSm9jeHJlTkhY?=
 =?utf-8?B?SDJWdnZXWC9YTFhRZVFnU0lrVEhNY3hoY1pRSjZ2VER6YkorYytneUQxRWdT?=
 =?utf-8?B?Z1BYUi9CRE9TY0gyY1hUaEpHM2VFYmNqZHhIYTBSdFo3aWgvSUJqQ1ZqMm8x?=
 =?utf-8?B?YUhRNkdNY2VUbmZTaGpjNEN5L2V6WGllY2JEUVRWMEg4Sy94ZlR0QW5TUndj?=
 =?utf-8?Q?zlkUKsTKe85PuaK5HO4pGBGcS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a759797a-2f18-4d4a-2b29-08dbc8846122
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 04:58:29.7369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ii0UvTA6RtPzdwpK1FJXTbfvv5avD1jGTMbl06enedJ1zW+f5L+tCvu9xVcAiM60UaAiuqR1auYLApSpPo9NOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5962
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
Cc: Xinhui.Pan@amd.com, Patil.Reddy@amd.com, basavaraj.natikar@amd.com,
 dri-devel@lists.freedesktop.org, jikos@kernel.org,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 markgross@kernel.org, Hans de Goede <hdegoede@redhat.com>,
 benjamin.tissoires@redhat.com, mario.limonciello@amd.com,
 linux-input@vger.kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/4/2023 4:20 PM, Ilpo Järvinen wrote:
> On Sat, 30 Sep 2023, Shyam Sundar S K wrote:
> 
>> AMD PMF driver loads the PMF TA (Trusted Application) into the AMD
>> ASP's (AMD Security Processor) TEE (Trusted Execution Environment).
>>
>> PMF Trusted Application is a secured firmware placed under
>> /lib/firmware/amdtee gets loaded only when the TEE environment is
>> initialized. Add the initial code path to build these pipes.
>>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/Makefile |   3 +-
>>  drivers/platform/x86/amd/pmf/core.c   |  11 ++-
>>  drivers/platform/x86/amd/pmf/pmf.h    |  16 ++++
>>  drivers/platform/x86/amd/pmf/tee-if.c | 112 ++++++++++++++++++++++++++
>>  4 files changed, 138 insertions(+), 4 deletions(-)
>>  create mode 100644 drivers/platform/x86/amd/pmf/tee-if.c
>>
>> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
>> index fdededf54392..d2746ee7369f 100644
>> --- a/drivers/platform/x86/amd/pmf/Makefile
>> +++ b/drivers/platform/x86/amd/pmf/Makefile
>> @@ -6,4 +6,5 @@
>>  
>>  obj-$(CONFIG_AMD_PMF) += amd-pmf.o
>>  amd-pmf-objs := core.o acpi.o sps.o \
>> -		auto-mode.o cnqf.o
>> +		auto-mode.o cnqf.o \
>> +		tee-if.o
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index 78ed3ee22555..68f1389dda3e 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -309,8 +309,11 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>>  		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
>>  	}
>>  
>> -	/* Enable Auto Mode */
>> -	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>> +	if (amd_pmf_init_smart_pc(dev)) {
>> +		/* Enable Smart PC Solution builder */
>> +		dev_dbg(dev->dev, "Smart PC Solution Enabled\n");
>> +	} else if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>> +		/* Enable Auto Mode */
> 
> I'm pretty certain neither of these two comments add any information to 
> what's readily visible from the code itself so they can be dropped.
> 
>>  		amd_pmf_init_auto_mode(dev);
>>  		dev_dbg(dev->dev, "Auto Mode Init done\n");
>>  	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
>> @@ -330,7 +333,9 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
>>  		amd_pmf_deinit_sps(dev);
>>  	}
>>  
>> -	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>> +	if (dev->smart_pc_enabled) {
>> +		amd_pmf_deinit_smart_pc(dev);
>> +	} else if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>>  		amd_pmf_deinit_auto_mode(dev);
>>  	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
>>  			  is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC)) {
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index deba88e6e4c8..02460c2a31ea 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -179,6 +179,12 @@ struct amd_pmf_dev {
>>  	bool cnqf_enabled;
>>  	bool cnqf_supported;
>>  	struct notifier_block pwr_src_notifier;
>> +	/* Smart PC solution builder */
>> +	struct tee_context *tee_ctx;
>> +	struct tee_shm *fw_shm_pool;
>> +	u32 session_id;
>> +	void *shbuf;
>> +	bool smart_pc_enabled;
>>  };
>>  
>>  struct apmf_sps_prop_granular {
>> @@ -389,6 +395,13 @@ struct apmf_dyn_slider_output {
>>  	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
>>  } __packed;
>>  
>> +struct ta_pmf_shared_memory {
>> +	int command_id;
>> +	int resp_id;
>> +	u32 pmf_result;
>> +	u32 if_version;
>> +};
>> +
>>  /* Core Layer */
>>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
>>  void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
>> @@ -433,4 +446,7 @@ void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev);
>>  int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
>>  extern const struct attribute_group cnqf_feature_attribute_group;
>>  
>> +/* Smart PC builder Layer*/
> 
> Missing space.
> 
>> +int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
>> +void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
>>  #endif /* PMF_H */
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>> new file mode 100644
>> index 000000000000..4db80ca59a11
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -0,0 +1,112 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * AMD Platform Management Framework Driver - TEE Interface
>> + *
>> + * Copyright (c) 2023, Advanced Micro Devices, Inc.
>> + * All Rights Reserved.
>> + *
>> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> + */
>> +
>> +#include <linux/tee_drv.h>
>> +#include <linux/uuid.h>
>> +#include "pmf.h"
>> +
>> +#define MAX_TEE_PARAM	4
>> +static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
>> +						0xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43);
>> +
>> +static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const void *data)
>> +{
>> +	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
>> +}
>> +
>> +static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id)
>> +{
>> +	struct tee_ioctl_open_session_arg sess_arg = {};
>> +	int rc;
>> +
>> +	export_uuid(sess_arg.uuid, &amd_pmf_ta_uuid);
>> +	sess_arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
>> +	sess_arg.num_params = 0;
>> +
>> +	rc = tee_client_open_session(ctx, &sess_arg, NULL);
>> +	if (rc < 0 || sess_arg.ret != 0) {
>> +		pr_err("Failed to open TEE session err:%#x, ret:%#x\n", sess_arg.ret, rc);
> 
> Print normal -Exx error codes as %d, not %x (rc). I don't know what would 
> be best to do with sess_arg.ret, TEEC_ERROR_* look like errnos (negative 
> values) manually converted into u32.

in drivers/tee/amdtee/amdtee_private.h, all the TEEC_* are hex. So
sess_arg.ret can remain %x? rc I have changed to %d.

Rest all I will address in v3.

Thanks,
Shyam
> 
>> +		rc = -EINVAL;
> 
> If rc < 0, I think you should just pass the error code on.
> 
>> +	} else {
>> +		*id = sess_arg.session;
>> +	}
>> +
>> +	return rc;
>> +}
>> +
>> +static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
>> +{
>> +	int ret;
>> +	u32 size;
>> +
>> +	/* Open context with TEE driver */
> 
> Too obvious comment to stay, it's what the code already says on the next 
> line so there's little point to repeat something this obvious in the 
> comments.
> 
>> +	dev->tee_ctx = tee_client_open_context(NULL, amd_pmf_amdtee_ta_match, NULL, NULL);
>> +	if (IS_ERR(dev->tee_ctx)) {
>> +		dev_err(dev->dev, "Failed to open TEE context\n");
>> +		return PTR_ERR(dev->tee_ctx);
>> +	}
>> +
>> +	/* Open session with PMF Trusted App */
> 
> Remove this one too.
> 
>> +	ret = amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id);
>> +	if (ret) {
>> +		dev_err(dev->dev, "Failed to open TA session (%d)\n", ret);
>> +		ret = -EINVAL;
>> +		goto out_ctx;
>> +	}
>> +
>> +	size = sizeof(struct ta_pmf_shared_memory);
>> +	dev->fw_shm_pool = tee_shm_alloc_kernel_buf(dev->tee_ctx, size);
>> +	if (IS_ERR(dev->fw_shm_pool)) {
>> +		dev_err(dev->dev, "Failed to alloc TEE shared memory\n");
>> +		ret = PTR_ERR(dev->fw_shm_pool);
>> +		goto out_sess;
>> +	}
>> +
>> +	dev->shbuf = tee_shm_get_va(dev->fw_shm_pool, 0);
>> +	if (IS_ERR(dev->shbuf)) {
>> +		dev_err(dev->dev, "Failed to get TEE virtual address\n");
>> +		ret = PTR_ERR(dev->shbuf);
>> +		goto out_shm;
>> +	}
>> +	dev_dbg(dev->dev, "TEE init done\n");
>> +
>> +	return 0;
>> +
>> +out_shm:
>> +	tee_shm_free(dev->fw_shm_pool);
>> +out_sess:
>> +	tee_client_close_session(dev->tee_ctx, dev->session_id);
>> +out_ctx:
>> +	tee_client_close_context(dev->tee_ctx);
>> +
>> +	return ret;
>> +}
>> +
>> +static void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
>> +{
>> +	/* Free the shared memory pool */
>> +	tee_shm_free(dev->fw_shm_pool);
>> +
>> +	/* close the existing session with PMF TA*/
> 
> Missing space.
> 
>> +	tee_client_close_session(dev->tee_ctx, dev->session_id);
>> +
>> +	/* close the context with TEE driver */
>> +	tee_client_close_context(dev->tee_ctx);
>> +}
>> +
>> +int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>> +{
>> +	return amd_pmf_tee_init(dev);
>> +}
>> +
>> +void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
>> +{
>> +	amd_pmf_tee_deinit(dev);
>> +}
>>
> 
