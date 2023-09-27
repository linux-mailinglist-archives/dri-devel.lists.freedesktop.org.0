Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6815D7B05C7
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 15:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6911310E533;
	Wed, 27 Sep 2023 13:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84F810E533;
 Wed, 27 Sep 2023 13:48:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gX4tA9PJ+8xv5XEfg1Njc5SlOMRRpbpdEFBVQIY7B7M74RCopgjlrXZ8zCc614HjwqKaPPfgl4PzNwIvx1eSniqyFEN7axGl5/8U5Oz0wrr5L05kZXQ8lYfvLWvAEF1mVERntVBK1p/vFgUTJfxh0/XULnao+aOWFjsvwhi8ZigeLEz6lHce4TkNVhepj/533zb8WgAIz19lMDRW16uOOpitLrjoP+9eFeg0q+8HcrElM+EGAJshR+A8OLlwYlEVd0WDD/R1m4dLwSi4nMw/SNfcSsLzJS+RpMli24Df91LK9+ECey0q3nbXKjVeerJ8VCN6eRsA+ZMLARhghtxT2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0IRd15iEoKSKJxg9P68Qc7aiYmerC3LOhpgvavZfjg=;
 b=N7Sw1Kv3ISsbBwek9lQdvgnmUBaUH7nRVuTgw5ILz5kwjYg5wUqpCYOc++vDuEYWP7+kBoo8arnTJ4zivaycUpIC/wjALHXd1z+dMBsrB1Lz9XvyjHLl2JZQ7TRlSqJivQTH1Vm2EsOprgVcR7YUenqFTZRuG/2dgwVBOE3R6nIf8nRJMdRi6loYIM52iW7TwLsVb+5if9dNgBcp320h+ORDfQzsePrgtcnEgZKimZzYHYH2raqqC9gCx7+srQ3XPIgKX1P1K25FbDIr0tmD8a9eDmb2rgqC2GoegZ8kWigV4X5pQPKb0Ao6Pr8zVY2xaWSAkBzsn9Cs/vw0MNHokA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0IRd15iEoKSKJxg9P68Qc7aiYmerC3LOhpgvavZfjg=;
 b=arR/KSZ1lqfe83EfDOZLI41Opg2LXGfAQ7XYiQVU0anDegQITFrN/WmuuzYgVMkarnc8Mr1Q1MdiyP4QZdo5ExAo7+lbOkQDymZMfWZlTT8eh7SArQC89/K/z8yAcjw+gPUiMLs0+G8GZfweg1JyK1tYnXAo9bBRnsRYFPLWazQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MN2PR12MB4423.namprd12.prod.outlook.com (2603:10b6:208:24f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.22; Wed, 27 Sep
 2023 13:48:39 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 13:48:39 +0000
Message-ID: <4a77076a-f76b-4fde-ad24-9b507bb7dc28@amd.com>
Date: Wed, 27 Sep 2023 19:18:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/15] platform/x86/amd/pmf: Add PMF-AMDSFH interface for
 ALS
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-16-Shyam-sundar.S-k@amd.com>
 <4f542b88-5c8d-4177-50d0-50b0daeaa3a4@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <4f542b88-5c8d-4177-50d0-50b0daeaa3a4@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::18) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MN2PR12MB4423:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d7bc5b5-6334-452e-05e5-08dbbf607490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +H+jy33VrqPqjSNdVAI36Sx9V3kolSwAr/i37lioMy9XVw7Efhbu40YpY7q6m9VtwJRYBSsKFVQlOwsSS6p0jtPjroH98pwhR5M8Heta4Q1igmKr/4cltBdaBSRLAFN6v1LW0p1CUJLcy26AuhfSL44slRytjt+oGIWP5Lx6+0xxxaUHF7+HAUq/q0dW6W1iDQPvFaYV99vqKiALz41IFDhU/yuurVzHq6llvWZ6uYX2yAvLfyd4fhQB+UKvG3XWK76cjS57zfcFsAOcs0lVFf9qhhdoOsqiSH/OF9+UGUf++9D65eUSbnjGwZzO5ZlMExlNcKuAGrHGNt5b/jjkso2TTDILyDZ8VYHMx4AAid/cgeYz5Hx1nPQhQTzuqIXFGB8r/aHypG4mOmHrAqDOTlO/IvL4NmYxj+SxKgV9Eog2pkvmkw3JUx7Uem6bPd3OYCEKMKGx8x+yR1Fu0BmODzaGO1/YAMqOSMZ7RVoJ8P66gLrxkWGCLt8l/ai8Q9R4qCyXvJy51MDvmMaXg3xRGQwVwQQ3sfsDiYPfVZtu44MhUYL00pHlccHHXY7aJVKFaPrtcVG17Dr7xpxEleSto4J5g9TiVPuNwBVpsVzt/dW0M7SrDGmJSTb+lOYCQMpDBT3QxbW0eQMExT/ZF7W84w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(39860400002)(366004)(396003)(376002)(230922051799003)(451199024)(1800799009)(186009)(31686004)(53546011)(478600001)(6506007)(6666004)(6486002)(38100700002)(86362001)(31696002)(7416002)(41300700001)(2906002)(26005)(83380400001)(66574015)(2616005)(6512007)(36756003)(6916009)(66556008)(5660300002)(66476007)(66946007)(316002)(8936002)(4326008)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3NkMEUvcXJLTHZ5RFYxa09iOHVuVzNia0Y3NjdOV0h0UXNQY2NXYU90cE83?=
 =?utf-8?B?UUZuWU1ld0VOd3JPeW9Vajlkd2xoZ2xsa1gyVCtQUUxGYWdGN0lRUTdXSUhP?=
 =?utf-8?B?c1ZHa09KcGpuRzJFd05ta1M0N2wydWhDVG5vRFc2WW50dHA0M0ZlRldjZWxn?=
 =?utf-8?B?Y09EaStaak1DeFR0dGRMemZjRGI0dkpNV0phcS82WTFKNFByK282M3pjOUdD?=
 =?utf-8?B?QjhRdHNzczVaSUcydE96TCtBdG1xNWRMMlY4b2ZWcm9sMk1oQ0FOVjMrM1Jv?=
 =?utf-8?B?VjQwT3pJRmtzZnF2UEpuMC9HTnJyZUkzQ0JxTzhiRjJocitZVkF3YklMWUd1?=
 =?utf-8?B?NnNEdUlJc1luZHlDdUhueFpuNDJNOEVpc25kWkF5c25MY1oyN3l2S09MS3Av?=
 =?utf-8?B?aUUva1JwblMzN04zcUdDK25Ba3dyb0lMQkFqcUtHOURlQ2VwM1g5T01MSm5q?=
 =?utf-8?B?dnRPZUkwMkZpbnprcTgvTjZobmREQVVUNXBiQWlGRGk1RzlrUkFRNVN4VkZr?=
 =?utf-8?B?YXZ1ZFdTOTZKRWRxT2ltM0V3cHNvUG1VMXAzZUhOM2dMQ1c4dUFuckwzY1N5?=
 =?utf-8?B?VzJxWFJxOXBSRUlOd2JYS3VOMGJ1RmF3UG9wOHFOY1Q5d0hGcW50VGJJalZW?=
 =?utf-8?B?NWJQUGIyL3ZBTURPQStRNUR5ak01RUFkeFprTkdPQWxiVlFnR0ZSUjRVZERE?=
 =?utf-8?B?NzFWUnIwU21UemVMakdrWVlESWp4S3k1RlZBMUxFRDZmWHFWVkdMa2c0UzFn?=
 =?utf-8?B?eVRqVStrb2dKRGEybThSRXRocXpmbW5Jdzl6R3gzN2lYZUErdTZGU2I4OUlw?=
 =?utf-8?B?K3ZKeTJZRjY2akZOMk1xdGdqUHBhbXdaZ3Fjejg2NDRhNGY4dXZwQXg0SFNr?=
 =?utf-8?B?aEh6cUJoWkFCUDFnWWRBaWVsR1g2dGlhOEJsRmlhdE1TK05WcG9hWFVWcHdu?=
 =?utf-8?B?UC9wallWaGdNRmpXeVVxcDIyN2NzUTdoQ2tuZTZkT1Fza0Fib0JhTGlrT0hJ?=
 =?utf-8?B?bTRaTWpYTGU0YTFPMDVhcFUyZlUya0U4SjgzdXN4TUJmUUFrcGlGU1lWRUhm?=
 =?utf-8?B?eVJ3bHBXU2NVMFhYZXdDQ3RNZCtlaHByc1YxU29BZVd1Wk9SdW9UVzNCeTUv?=
 =?utf-8?B?a0U4bDRoUEdHWmNWa1F5WnZDeWcveWRYTkRLeWF6bnkycXk1eXBlRUhQbEY0?=
 =?utf-8?B?YVIxdzlqR09jMm1VdDQwRFZtZGdudnRXMnpQRXA1ZmNPVDJjZjRrYnE3NVJT?=
 =?utf-8?B?WUZZTzZtMmwyTnN0ajI5WnpYVFVRNlhGVEhzOUc3bVNwOTUzaks0dU44WWNB?=
 =?utf-8?B?bWxidFJyM0hLMXpBZnV0RHFwRXI5ZFpYTEhmT1c2ZXlndktZSkhneERvY2g3?=
 =?utf-8?B?RUlGZ2FYTm9pT09lbVJTVTRONnAzNjloQmVKOXNwVnQ2L05GN2VMTzNWaU8z?=
 =?utf-8?B?eWZZN1NIQTNHSFZVbndIcjBJUVdPdDY3WmFZbXpZaE1zbTVxUlRnRmRtZTEy?=
 =?utf-8?B?SW83MjJ5NnBaNjluRmR1RS9RM1FyTXJyalhwQUo0QkdaVHNSRURRVkd4bkh0?=
 =?utf-8?B?TWpvNTFoVlNlTDhXaXB0R1ZhbkFXd3R3Vy80Skx3TEhPSXdwT0pYbS9mWEh4?=
 =?utf-8?B?WmtVTEErRjJrL2xNWnZTcWNZa25TSHh3am9yUnRPUk1mMjBOSXlOc2trREN1?=
 =?utf-8?B?d284VjBHeFZpRFVNVlhqNVpuT1BPUVBhOCs3dUFyc0o5Y0pzK2VYc1liTGZD?=
 =?utf-8?B?VUVmUW1KdGo1dUx0QXN1b0s0d1lqUm12VmhyQytpOGtVRjdjU3NBeUFuc0Q0?=
 =?utf-8?B?SUl5NnUzaVZGL1cveTd0RVJaNUNXaGh2UUtaeEZKL1F3UitHQ1ZNc1NyUFNz?=
 =?utf-8?B?blBTOC9TYUpRVmUwamw1Yi80WkVMN1BrUDk2djIrZzBOOXc5WUVzS0JEQk5v?=
 =?utf-8?B?V2ZJb3VDUkREeFZodVNiUnIvb2dKQWlLOEZDUUVCSjY4bUxHdzNyMEM0NXYx?=
 =?utf-8?B?MGg2cUdkVGNjaGZvOWxTSjVGVHdWZTgxZGdwZndCck5WOUUrQVgydTNCMy8v?=
 =?utf-8?B?S3NBUzVneERmdHNLa2ozb2lWRmJOcEZrQmF1OGt6a0o5U1ZKeGVLdFpJYjN6?=
 =?utf-8?Q?lbUo2Cdzr++YtmGZ3G81O3+Oj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7bc5b5-6334-452e-05e5-08dbbf607490
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 13:48:39.7630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YOCyHYhO+ekMuMrTJOfyD51w3RtTdAKS6nj8SI8EbWM9d23DlM57FNApvLGUpVR24FWNpMTzlvWKj/gSIlH90g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4423
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
Cc: Xinhui.Pan@amd.com, Patil.Reddy@amd.com,
 Basavaraj Natikar <basavaraj.natikar@amd.com>, dri-devel@lists.freedesktop.org,
 jikos@kernel.org, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, markgross@kernel.org, hdegoede@redhat.com,
 benjamin.tissoires@redhat.com, mario.limonciello@amd.com,
 linux-input@vger.kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ilpo,

On 9/27/2023 7:03 PM, Ilpo Järvinen wrote:
> On Fri, 22 Sep 2023, Shyam Sundar S K wrote:
> 
>> From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>>
>> AMDSFH has information about the Ambient light via the Ambient
>> Light Sensor (ALS) which is part of the AMD sensor fusion hub.
>> Add PMF and AMDSFH interface to get this information.
>>
>> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> ---
>>  drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  1 +
>>  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |  6 ++++++
>>  .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 20 +++++++++++++++++++
>>  drivers/platform/x86/amd/pmf/spc.c            |  5 +++++
>>  include/linux/amd-pmf-io.h                    |  2 ++
>>  5 files changed, 34 insertions(+)
>>
>> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
>> index cd57037bf217..a1950bc6e6ce 100644
>> --- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
>> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
>> @@ -39,6 +39,7 @@ struct amd_mp2_sensor_info {
>>  
>>  struct sfh_dev_status {
>>  	bool is_hpd_present;
>> +	bool is_als_present;
>>  };
>>  
>>  struct amd_mp2_dev {
>> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
>> index 9c623456ee12..d8dad39d68b5 100644
>> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
>> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
>> @@ -77,6 +77,9 @@ static int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
>>  		case HPD_IDX:
>>  			privdata->dev_en.is_hpd_present = false;
>>  			break;
>> +		case ALS_IDX:
>> +			privdata->dev_en.is_als_present = false;
>> +			break;
>>  		}
>>  
>>  		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
>> @@ -188,6 +191,9 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
>>  			case HPD_IDX:
>>  			privdata->dev_en.is_hpd_present = true;
>>  				break;
>> +			case ALS_IDX:
>> +			privdata->dev_en.is_als_present = true;
>> +				break;
>>  			}
>>  		}
>>  		dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
>> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
>> index 63a5bbca5a09..2f8200fc3062 100644
>> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
>> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
>> @@ -94,12 +94,32 @@ static int amd_sfh_hpd_info(u8 *user_present)
>>  	return  -ENODEV;
>>  }
>>  
>> +static int amd_sfh_als_info(u32 *ambient_light)
>> +{
>> +	if (emp2 && emp2->dev_en.is_als_present) {
>> +		struct sfh_als_data als_data;
>> +		void __iomem *sensoraddr;
>> +
>> +		sensoraddr = emp2->vsbase +
>> +			(ALS_IDX * SENSOR_DATA_MEM_SIZE_DEFAULT) +
>> +			OFFSET_SENSOR_DATA_DEFAULT;
>> +		memcpy_fromio(&als_data, sensoraddr, sizeof(struct sfh_als_data));
>> +		*ambient_light = float_to_int(als_data.lux);
>> +
>> +		return 0;
>> +	}
>> +
>> +	return -ENODEV;
>> +}
>> +
>>  int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op)
>>  {
>>  	if (sfh_info) {
>>  		switch (op) {
>>  		case MT_HPD:
>>  			return amd_sfh_hpd_info(&sfh_info->user_present);
>> +		case MT_ALS:
>> +			return amd_sfh_als_info(&sfh_info->ambient_light);
>>  		}
>>  	}
>>  	return -1;
>> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
>> index 97293ae25cf5..8e19b351e76f 100644
>> --- a/drivers/platform/x86/amd/pmf/spc.c
>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>> @@ -49,6 +49,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>>  			"Connected" : "disconnected/unknown");
>>  	dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state ? "Close" : "Open");
>>  	dev_dbg(dev->dev, "User Presence : %s\n", in->ev_info.user_present ? "Present" : "Away");
>> +	dev_dbg(dev->dev, "Ambient Light : %d\n", in->ev_info.ambient_light);
> 
> %d vs u32

Thank you very much for your feedback. I will respin a new version
soon addressing your review remarks.

Thanks,
Shyam

> 
>>  	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>>  }
>>  #else
>> @@ -161,6 +162,10 @@ static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact
>>  {
>>  	struct amd_sfh_info sfh_info;
>>  
>> +	/* get ALS data */
>> +	amd_get_sfh_info(&sfh_info, MT_ALS);
>> +	in->ev_info.ambient_light = sfh_info.ambient_light;
>> +
>>  	/* get HPD data */
>>  	amd_get_sfh_info(&sfh_info, MT_HPD);
>>  	switch (sfh_info.user_present) {
>> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
>> index 4f82973f6ad2..dac0af573a16 100644
>> --- a/include/linux/amd-pmf-io.h
>> +++ b/include/linux/amd-pmf-io.h
>> @@ -31,6 +31,7 @@ int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf);
>>  /* amd-sfh */
>>  enum sfh_message_type {
>>  	MT_HPD,
>> +	MT_ALS,
>>  };
>>  
>>  enum hpd_info {
>> @@ -40,6 +41,7 @@ enum hpd_info {
>>  };
>>  
>>  struct amd_sfh_info {
>> +	u32 ambient_light;
>>  	u8 user_present;
>>  	/* add future caps below */
>>  };
>>
> 
