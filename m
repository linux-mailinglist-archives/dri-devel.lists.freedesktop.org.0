Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D728896B9B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 12:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7B010E133;
	Wed,  3 Apr 2024 10:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N/9GLZrh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2121.outbound.protection.outlook.com [40.107.95.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BCB10E133
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 10:07:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdlMyTmIjFv49cv95wiwMrc89R5h3WrAdT5RnUIIMSW9uzmASkuCYJM6p/dqfHwvOrF38zjheAzrksVwu2zufe/h0wGHxutBZebfZw7dcviGBz+BGUMTy5XNQVbfcJCmgmPlEZzXMCBEjWryPG+Z7m6iRK8eRQLLh0n//amSHcqpPEt7pH7hHPQ8Ebdhr30uNOxocWD0EMQB6EI+WlcNUmDD8BSoW71dMFWk5aaX+mwchNhdHMO0a7+alzqtjh4QrEtWDKfqDbCc2FqLHzIX7FnPsng5RFCg/7zz/fxmgvZNWuw90YXaknSUsvFAlOHgqxv3tQydC5SDmh4czt/4zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQGvuYEShNCaI9Q+EjCLIHaeJSW75i3v5qQJsS3aPTo=;
 b=hsKSIqGEspL6ggeGo3FU2JrqZJdDJwQvrMikNnRN2JQGS4ya16lggNirli0/KsaHDXl5gRrVelMMJ12B/OZ32bt1UYNLkP0EC8K4Y8XunIFerkEkE3Z2oJOHxB9EZtPZEphMt4BqTKu8zJ2R9Fh+NWPHk3R3LhxKrCOMkz8uHguaPz15erCxZ4Hr8C4+SD4zxlwk3PGPDXAmImBdmU2I6AlBjTicqcMR7F9/1xqK44uZvyg9JRFT45Y4bOEBFzi3jOlhLB5bb1bs2G8Q3w9nuB5q1QOGDQGZ0BpPNE5fMLsmPml447ZIaI+hPaHvqL50RjM4kN/ogyhbu4PqXKKYvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQGvuYEShNCaI9Q+EjCLIHaeJSW75i3v5qQJsS3aPTo=;
 b=N/9GLZrhytAuMzH2rtDtwZffxGEGDDJPpKh62rILysJpSNTsxkmlGuRMCMMkC4jm5lGKMXWvG2tKt7g8SBAa2ezq3ToH0m+3kVRqwk4OpdtRLyNQB54mnCJdOX6R1+uQxfh6mSj4NkhxjGnNIkoTlhOP0+/knoEB3YwcmdHaajNQrEUTpyeUvE5NUBdqDYPM7k+mGQGz5uSn9gbj4nMJphRdirZ7WN+Ey4rlP65G8qfMGVJCG65FE6YAi9L5haAUXxfRlDO2ouY3MFkBOQ5XbCH+0M0wE48kwnsjulEFfuMz38+1Qpi8UA3vbbTsSGrkMcJswkQJ1ERnUIh/zfoY/Q==
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 PH0PR12MB8125.namprd12.prod.outlook.com (2603:10b6:510:293::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.46; Wed, 3 Apr 2024 10:07:48 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5159:5fc3:7933:24c0]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5159:5fc3:7933:24c0%7]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 10:07:47 +0000
Message-ID: <73a71381-7c8c-4d0f-9fa4-3d9511c9bfbe@nvidia.com>
Date: Wed, 3 Apr 2024 11:07:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: host1x: Do not setup DMA for virtual devices
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20240314154943.2487549-1-thierry.reding@gmail.com>
 <4ffa428a-e6cf-4716-ad7b-02c126d66772@nvidia.com>
Content-Language: en-US
In-Reply-To: <4ffa428a-e6cf-4716-ad7b-02c126d66772@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0046.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::15) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|PH0PR12MB8125:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YsGW7uwjBPIprGXBYHvdU+mn+rEvVuGi9L/mHOD1k3hp2Du8F6gaXrVd/zX0mxj0x9578EWHOAhAn/yczR2LfzTHXhWrRc2GcFuoSBtCUMf6cOZFurZWDZDNnruD3CQAGPqPptRWo9gGXnnvkDyv6Jjdh2oZNxKhSjSR7utOmNHtuBv5K/2eCkv4rjr+WMSp12hZ4vCgzM5bwet1se1ysk5MczmvxmU0flrye/qHHAVTYV0lBmB9mJn8Ah01U8kiZyP5pVKWMN5FutiTzgiDGJUdeCg704yZqj1CZiqwGjGjdAWn8ob1bTCiqAIs6tafTZ0ZE/NSPwah5F6XSFpfaFG8DL1B6mmmNPNCspdbWTLBHWwnr2466kNXyixrOluYkfWCtWhyIP/LrSOODGWATLdCYhn141bD0If4MDidTwwL7/Uy8YM/nuI9eSEs1SXoio4PlXOM/AAf3dVSVrDIsRtwI2ayZ7RFCG2lTaXgO1RthRTh1LCWoOWDFBSuldWV7KD66YudY+WymklHZjoGuLaucspx4eQ6naFRM/SGgpKSyclLqDvHce0rYGoDcLTgUY0Ovo6/cFHIv70ciIJyAVSuSDRg6blbwNhvf42/boxwIRkqAKeHuXmHVMBKFA0I3rcitZE3cE8X/lxLZ83a/y7Mf1NlmS3g7z7g/E9OSOY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3g2UXZva2QvaElzWjF2Q3c1NlhtVXlVcDlENUdjKzlydTlNYkc4V2ZKSFl4?=
 =?utf-8?B?N2dyOEpPb3lVa016NUMyNDREOWdnWUJWYnhCQnpKZTdMT0I5NVNnWlAwTkhG?=
 =?utf-8?B?SkVicnRPcm9YR2ZQdUxob09QaWpmYi9VdVYzcGJTaUhtaVNiYnprTXBnM0lP?=
 =?utf-8?B?WkJJV2RhNk1KVDI4bVZSdk5SSTdrVyt4cFRyNHpCck1aaTdqcXM0aG5rREI2?=
 =?utf-8?B?dXZWZVBmM09xRUdIU2JDV2hVYU1ORndMMGJ3M3Mybkx5N3c2Q1BLeTg1WGgr?=
 =?utf-8?B?T0NlNDJCbEl6azZpeGpad3llZGk4bzcxdzdkQllPSkI3TXN2VUNIWGtRb3Yx?=
 =?utf-8?B?M3ozaWVoeDNNUDdDWE5DUE1TL3lPVUhTRWlWLytEaWhWSktMMjhUV3RZWUdp?=
 =?utf-8?B?elBXMGhrdzdXSHdBajQwMFhpdGg5ZmpSc0tZUU5Yc0VhOE02bGJNWndtcGJx?=
 =?utf-8?B?Mi9iMFV0VExObGMxMmVCS29RYWMzcnhDT1lxaTJFRmlSWVM2UjFJaTJwN0JX?=
 =?utf-8?B?Y09YUjRnc1BJQWtsN2pyaHIzUXYyNDkxTmFDbE1CcFpqTlRDQzJDZkpKWWRu?=
 =?utf-8?B?R0d2T2lPRS9vblJGaUFwZ0xSZW15ZE0wakdjVUNsdkM5YlFyYVROWXkvNWxC?=
 =?utf-8?B?dUxtT3pzRFBNZmcwOHJ1R1R6TmFIeDZrVmxCZVVyR0VIbkFTVDFaNnJyeDl4?=
 =?utf-8?B?c0MwMm9pcUp3ckphM3o0ZW9KWjVMMUhSMDVtR0x4U0gwYkl3bDNsMmc5MDdr?=
 =?utf-8?B?UEtGdVA2N0VvZmI1MlYweTVqRDE4dTMzbXA4dCtlTGpVbTVUbVp0Y2RIWURL?=
 =?utf-8?B?NjNCaEtwMEUwa245ZkRqUHFLN2RmSFF0NjFwdUM1Nk5MNmJWdHp5NGNrZ1N4?=
 =?utf-8?B?ekJlL09Fd2pCZ3p0RnE0ajFOanFnMVRkYUJXMFdxelVuTG5zcVpzQ2NIVHdQ?=
 =?utf-8?B?cFZaWk5GS1psMDM1NTltTlR3V0lKVm1wMDdOTFpNNTg5VjRSM01SWTZDVDdt?=
 =?utf-8?B?T21pdE9nUGZyMnQ4WVBCNTNpK0JtOE5hTHdGQ1g5eEMrMUVQV1ZHU1pLY2ho?=
 =?utf-8?B?LzRSelBiaUhKa29oZnRwcXdSVmV1K0RQdzJLTjl4S2hUQ3VTektGay9rU0lP?=
 =?utf-8?B?N05FS1lveXBJVzNaR0tQZ0tCNE5FUW9ZaEZuWEVzeTFEMG1jRU1yM3lDbDlJ?=
 =?utf-8?B?UEFubnl5NEJzVEVVaXF3MDBlOFlnUDkwSVZRUkJrSkdyVUd3T204ZjYvNWpr?=
 =?utf-8?B?NXhQMU4rZGlrazFhczVtSUhPU3p2QlRDemFxQTBmRHZVU0I5L2UzL01oY0JT?=
 =?utf-8?B?VlV6eE1kUkgxU0Z1M3g3cEVlREN3RW81UEFpNmp5Z2kvbEhRMlc2dkovRnA2?=
 =?utf-8?B?L2Q3b2dHVzVzdzZhSnVZRkcxUkhSMXZ2eXNzcU10L2pqbFJvWXdiQ2RyN2t6?=
 =?utf-8?B?akhoY2FwQzhnNTdvU1FDcjk3V1ZBbUFIME5pcmo2bUJYRzY0RXJJWFphTk1R?=
 =?utf-8?B?ZHg5eU9OTmhNRUE0aXVZb2hlY3JITlpPU0ZtYjIrNktjT2tXZGZtbTNRZWho?=
 =?utf-8?B?SFYyOS9BS2toblpTS3NGeHh1aG1WNTJBeDRQV01LT0lWZ3MyOG9uUFN4R3N6?=
 =?utf-8?B?S01oMDdBK240RVRwRUxYbm5OYXZieDRaRVI0aDgrejkxUENBVjA1VzlBUHZx?=
 =?utf-8?B?NTlyL1FweXZxSFZEVzRrZjd6cUhjaXp3YTlsV2E5dDlXQ211R3pQcnc5VnNQ?=
 =?utf-8?B?L0l4OXFLbzJUdGRNYk1hZFFuOGdCTWZ5MkZteFFPY29Lc0hmZjQ2VFBXVTZo?=
 =?utf-8?B?TG5aN3dvZnRJb2VZaWIraUdWNHNIUktVV1M3aEd5YVFrTFlPTDBCKzlGRWdz?=
 =?utf-8?B?L09mSDNrNy9Ha2dIZmN1T01HQlBBTDVRWmp0eU40NlhtR0F4VlQvOUVPU3hk?=
 =?utf-8?B?RFBvS3dUcTZ5OFhZbk9PaUIwcHpWdTFzalc0aVZXT2l3a0t5WHUvTEkrWEJR?=
 =?utf-8?B?ay9Zd3UwUUFmL3B0ZUEzZXZoU0hVR0tQNWN1QTVvb0NmbEthaFF0MUR5WmE2?=
 =?utf-8?B?bjE3dXZKZ3IrUFFYVnh1MkowYnV2d2hZVXRONGcrdHJXdm1ZM0V1TEQ0SmdH?=
 =?utf-8?B?cmpiS2NNN3kvZ2pxOSszYjJsWEFvWGZXVkpPRUpuT0JFdWxwNVhDTmE1Z0xH?=
 =?utf-8?B?TFE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd542d7c-1f13-4f3c-df2d-08dc53c5e9e6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 10:07:47.8952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKmw/osWpQkEHiwMdWpR3oqjGx3H35GdKzkqCtcgEQWw5/o8rFV/F3TGcO69gJ90VhiAppqBvvNR2v7R0VlLMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8125
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

Hi Thierry,

On 15/03/2024 11:25, Jon Hunter wrote:
> 
> On 14/03/2024 15:49, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> The host1x devices are virtual compound devices and do not perform DMA
>> accesses themselves, so they do not need to be set up for DMA.
>>
>> Ideally we would also not need to set up DMA masks for the virtual
>> devices, but we currently still need those for legacy support on old
>> hardware.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>>   drivers/gpu/host1x/bus.c | 8 --------
>>   1 file changed, 8 deletions(-)
>>
>> diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
>> index 783975d1384f..7c52757a89db 100644
>> --- a/drivers/gpu/host1x/bus.c
>> +++ b/drivers/gpu/host1x/bus.c
>> @@ -351,11 +351,6 @@ static int host1x_device_uevent(const struct 
>> device *dev,
>>       return 0;
>>   }
>> -static int host1x_dma_configure(struct device *dev)
>> -{
>> -    return of_dma_configure(dev, dev->of_node, true);
>> -}
>> -
>>   static const struct dev_pm_ops host1x_device_pm_ops = {
>>       .suspend = pm_generic_suspend,
>>       .resume = pm_generic_resume,
>> @@ -369,7 +364,6 @@ const struct bus_type host1x_bus_type = {
>>       .name = "host1x",
>>       .match = host1x_device_match,
>>       .uevent = host1x_device_uevent,
>> -    .dma_configure = host1x_dma_configure,
>>       .pm = &host1x_device_pm_ops,
>>   };
>> @@ -458,8 +452,6 @@ static int host1x_device_add(struct host1x *host1x,
>>       device->dev.bus = &host1x_bus_type;
>>       device->dev.parent = host1x->dev;
>> -    of_dma_configure(&device->dev, host1x->dev->of_node, true);
>> -
>>       device->dev.dma_parms = &device->dma_parms;
>>       dma_set_max_seg_size(&device->dev, UINT_MAX);
> 
> 
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Acked-by: Jon Hunter <jonathanh@nvidia.com>


I don't see this in -next yet?

Ideally, if we don't see any issues with this we should pull this into 
v6.8.y stable branch because I am now seeing the warning there. Should 
we apply a fixes tag to this?

Thanks
Jon

-- 
nvpublic
