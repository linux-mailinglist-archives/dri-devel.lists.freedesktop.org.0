Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5AD65CC70
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 05:53:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BB210E02E;
	Wed,  4 Jan 2023 04:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F2810E02E;
 Wed,  4 Jan 2023 04:53:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaXHf69KAY1qbRMnJj2h/ZZ2AXQVp2Mc5yTquKCca2g2em0YeKePkU9vo8iEhEpp6/ELu3W/78aSxfTurBXDIwDIY6I10EtWg8TzSvQ+Tbzz3A+wmrVxtKnpbl0jJUaA3oYtLlqxG5V32AexXPUxV7OkxwJq+GrqckB8IdriUM+ntpYYyJ4Uqhk37xFh9VLQGgpsrAD7N+axUM+LqFP+mtNeEPhg6/sspHvdmxbCAQagV5sW+1i+74LVKkCeDIsYaBc5jO4z1YjCPqaEbOMjay6IqhelIKRY65EfqGvEtnnprYad9pf1z693nOLAJMbBBXyl3bjku0QgjPMmDFn60g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGEVJjlGiOE+wsU4Rq/uR/QWWjnqWzciFg+s6FNBfYw=;
 b=VCffgmd+XnBl3W+rki/KhSS6XLhOc5boAwZn/sTTEoBi0cVHZm4XxORwI7+ye2azfyRYvvb5o+BVkfHqJRvkogCjynvPjOZITj9wfRWwzKZLwOo7oGG6/xvu/lltv76k8BzsUuNjrAH9liWp6nKadMgbj2tSQAzIQRBxt1V7bK3GobmM+WXqax8nVk0ymT6M6jk0dM3SwSDC2Yhm/CZeC2tmZ+OULfHvDUhOcl+8k7o8nuV065KR/W5ekcef+8j3Ikk++zuh3PgM9/flLIlpS1JurYUcl508K8HIS/mndDiNDsvWGYHSZ9KQq1Nfw9knRQPow8AE72P9zL4ByQ21UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGEVJjlGiOE+wsU4Rq/uR/QWWjnqWzciFg+s6FNBfYw=;
 b=b6VJHowKOH90k4lR9jrn0atG3txkFznNkRpg4nubwlLbzap3SILHzydWynCje6SKkbIr4LdiJ8Tfz6CeI/3csdG89KYWz82NjDVQmIOZpsXhKnwPfT1O7k5azkdxStTJnO6tTgyYnmqCakdEbvuduhGBTxR4o7kW+6fE7Q7/oNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by MN0PR12MB5858.namprd12.prod.outlook.com (2603:10b6:208:379::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 04:53:23 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::457b:5c58:8ad2:40fa]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::457b:5c58:8ad2:40fa%6]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 04:53:23 +0000
Message-ID: <151bb1ab-8b2b-afaf-2976-5f60b756c4ca@amd.com>
Date: Wed, 4 Jan 2023 10:23:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v4 05/27] drm/amd: Add a new helper for loading/validating
 microcode
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org
References: <20230103221852.22813-1-mario.limonciello@amd.com>
 <20230103221852.22813-6-mario.limonciello@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20230103221852.22813-6-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0194.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::21) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|MN0PR12MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: bedb6ea3-cf88-4216-fead-08daee0f9bb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 598XJqx7VKYLCHhq140ASaqbeTSMZvDb/78uG7o4u1GJLgaZF5WWnpgPLs3hIAPDGOKxMxnrUQFxA7xg/fo5yXSqd7W/7Y2qSlhVdU34Maz16z090Tc+EJpEOScuAjv6W9F6XvMC9BZJJZXL16d3/0jeE328q2x1zIYrC5o0cOVLjCxWETfbKS2O0SdXMlimaAMkcXmR0dBSwAQb84pdtU0OJstLqHTsnuZQeZIVy4reAgRYEUK3lkFkVByAziOYukrUXd9e9+1NuO4XOjakdoGVbbcQj4X0bEcMDWaPa5sh+a0SCY8ASpZ3gxXkzt3YVOSygTg1orrbdOs1/NX2FNN80ID+ZbGx9gJV884N4uijK6csLwa02gz+h5YFnIyYESZWYO6B12r2p+GB5dx+B1uzRZyCaTJ5dh/2qa+3zuNtcEGJrMUOq7+p7PPo2PQ+iXgpdH6ifa+GMdnr1qEGKQXogyVkFFMycfbfA2Qk03dPmiaPWRFxc0PFIH8xCb/5oj7dTZ1K+TiDEOkgvs26NwzEd4GpCWpvOa4QWBgDfmkMM2cmv1iWmYj2oaLS8Sm1LTRsemEGSLOMSwGqhIWtYEAgZ+e3YvkA2NM1qNDHdMjTkoI9CvZNg2H1aVJ5ZZa5Zj4OIJg/2ekrGCGM5JsbRbkKAPlOMV5a9C0BVj4HdhNAZpjPw/8EkDgKYIPD7y0o8ePGSCemR9Jiwp7LsGPOnRcs1wllib8XhxRqTdiez4c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199015)(83380400001)(2616005)(31696002)(86362001)(36756003)(38100700002)(66556008)(8676002)(8936002)(66476007)(4326008)(5660300002)(110136005)(2906002)(316002)(54906003)(66946007)(6506007)(186003)(53546011)(31686004)(6512007)(6666004)(41300700001)(26005)(478600001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFBJQTlYWnZibkUrNFE1MFgzOG1BaStkQjNkbjAyOUZESXZZKzFPdWZQRnVX?=
 =?utf-8?B?YTVLVmdjMzluSzdlcVQwUmdJRUlRcFFqcVhRaHE2WG54cHc1dHFUTkNWQ3Br?=
 =?utf-8?B?QXRkTHBOaFgxMFJwU2NRRDY4RHR1NGdNWFduQStMMUk4b1pnSmxkcTlmY2JS?=
 =?utf-8?B?QmZPRThLYWJMekZmUFZtVHVRTXVqZGNVT1FkY2c5ZTBzM1dscWpTbWpWTSty?=
 =?utf-8?B?VnBuWTg5a1ovOGg4bEhKSGVxSjJTYWxZV0I3Z0d4OXdHNHcya1ZzSFhwdE9W?=
 =?utf-8?B?R2R6dGd5amljSW5yUjZyVnBQdGpac3FDNlRaL2NzTk1DZExxR21NZ2FSVUpl?=
 =?utf-8?B?WlRNczQyYWxHSFJYTG04dEJFTGR6Vi9CTzlBd2wrVGlmbjRmU2hpTW9yWVZo?=
 =?utf-8?B?V1dEclhMS2N4SHAzS2piYW1uUEE0T3lxTDNWSlh4S3VkQnpYVWh2Nk1BTlI0?=
 =?utf-8?B?RUhTUkZqMzkvZDB5ZFo0Q3ZUN3RYR3E5cWdGMTlvU1FId2FObXVTK2g5bDJY?=
 =?utf-8?B?YkhWZTNIWjRScllzSXQ1YkJNaFNEUm5paXJTanNvd0h5OXZRclVHeVZHOHB3?=
 =?utf-8?B?K0cyT3YxUFpVNENJZzlFNEU4cEROUzZIbnArL2p0RnpyWVFuT1ZyeVlnOXRX?=
 =?utf-8?B?WXRMOHJoZkNIRDN6dnJzdnlQTlN5bUxTK01QUkhUeWhNKzlGdWlkbjIwSXBX?=
 =?utf-8?B?aTlzMzNJdXVCcURodytpWURyNEhIOVU4bE1rVTNKY1pxNkljWHFmU2hDRXlo?=
 =?utf-8?B?aStCNVgzcytPMk12ZTErMHVGTGZSdXlIRHhqU2hxWW1PMy9JNWw2cS82L3Zu?=
 =?utf-8?B?OENBczNpVFB5OVVycFc5V0FDTjZ1WDA3Y2VhNEsyZnIyNnBzaU5UZko0OHF5?=
 =?utf-8?B?dElqL0dXS09zcjBkamJtbS9kRjVZSDY3TXRLSnRMZWEzZkRNbS9nNHNyZTht?=
 =?utf-8?B?Uy9CM09lYWpOb0JqTWM1RW5xR3g0bTVWS0RJQUY1MS9YOWs0bFBsSGJ6eGtt?=
 =?utf-8?B?KzI0cE1yRmk1Yzg0ZER2YklYU2ZzMm5oSFUyZDZrTmx5VjAyc3FTbVRvclVt?=
 =?utf-8?B?aTZYOHVKSUhvb2ptYXFmc3dNZ2hJM0ROYmdvNEQ1ck9JbENCOXV5cXFLT2FW?=
 =?utf-8?B?N2dhbTNRdXFuK3BZR0tlSUtwUStIQ05aRHdlT1dSR0RYdFVCaFlmSkY5dENi?=
 =?utf-8?B?MElGYThtVGxHWE56cDJwNFRHZUhGbXMvOGlyY0VUSk9oRHhmcGptRzBSNVRq?=
 =?utf-8?B?LzBVQ2QwQ2JXRWIzZHYxdTl5alFRM0l5YXlsaHo0VmFDb1N0RTV2V0dGb2xB?=
 =?utf-8?B?TkswUjhTenBUVFBCSHBzVVdzZzNnSmpzM2Ftci93K3hSRFRsMXk4QUlhSk9r?=
 =?utf-8?B?SURBU2VGZlhzTVNUaTRBMmhmMXJMdDhyTHlPMkFkQTBadG9UbW5HR2E4K3lH?=
 =?utf-8?B?NitQRGtwa2xDdURkL0I4UTJsU3l2MUNZSkwxRDhBT2luZGZLYVZXVnpOUjd6?=
 =?utf-8?B?WFE0TjRYZzJYQ0RIRjBUSTR0bjJuNzNWekdTdWlSQm5xOVBDWUpXMzZEaGxo?=
 =?utf-8?B?NlhQTXJZNlp5dzlDNlZVUVRtS01RWXExK2s5TkRCWlJVa3JrMURTdDViNlNk?=
 =?utf-8?B?UnlyQWNwME1mbVVZZ0pmcEhXT2ZqeTVtVCt6K0tDcmlyeFNNaXhPbkd4WmZD?=
 =?utf-8?B?Mk5nUmc5aEltdHF6TDRNekoxVzgzRHNLWjFUajVVTWIrZmhxZlRRdEpqN3dB?=
 =?utf-8?B?bi96RGxNOGVodVlOYjZkdFFTemZKY1NzZ2xjSnhWd0NxL090aSttZ2RBOXdk?=
 =?utf-8?B?b0lpN3FQVStTb25sVElYdTJBN3NEMFVWWVg0U0dSeit4NjFtY1Y0bmp2M2Fa?=
 =?utf-8?B?SkZXekdrMnYwa1VqaTNIZXVha1dYNFRZRU9pOFNyRWJjVFE5WDU1R2VTaWJp?=
 =?utf-8?B?Q1JuZzY5SzY2Wnk0YnJSTDhzaWdEb1grTG9hNmpCS0RnRW11ZG51VFpUR0pI?=
 =?utf-8?B?VmZURzhGckY0Nm9qSTQ4RGxGTUdkNkppeG9QRFB3K29teEY0cXkycjZMZTlF?=
 =?utf-8?B?cVJnQUN5UWI3UWp2bVdzVzRjakdmSUg1djVkS3dYWkZUODlJcENqTk55MXQ5?=
 =?utf-8?Q?ALhvJOL8zMtqGPPThfIE381gx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bedb6ea3-cf88-4216-fead-08daee0f9bb0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 04:53:23.4240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpNx/EgK6ffaVZoLsnII5vy1D3LLqjh+8krtobOnP0M2SPqlE3uZUVuaUudTgTin
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5858
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/4/2023 3:48 AM, Mario Limonciello wrote:
> All microcode runs a basic validation after it's been loaded. Each
> IP block as part of init will run both.
> 
> Introduce a wrapper for request_firmware and amdgpu_ucode_validate.
> This wrapper will also remap any error codes from request_firmware
> to -ENODEV.  This is so that early_init will fail if firmware couldn't
> be loaded instead of the IP block being disabled.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v3-v4:
>   * New patch
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 24 +++++++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h |  1 +
>   2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> index eafcddce58d3..8c4a7b09e344 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> @@ -1312,3 +1312,27 @@ void amdgpu_ucode_ip_version_decode(struct amdgpu_device *adev, int block_type,
>   
>   	snprintf(ucode_prefix, len, "%s_%d_%d_%d", ip_name, maj, min, rev);
>   }
> +
> +/*
> + * amdgpu_ucode_load - Load and validate amdgpu microcode
> + *
> + * @adev: amdgpu device
> + * @fw: pointer to load firmware to
> + * @fw_name: firmware to load
> + *
> + * This is a helper that will use request_firmware and amdgpu_ucode_validate
> + * to load and run basic validation on firmware. If the load fails, remap
> + * the error code to -ENODEV, so that early_init functions will fail to load.
> + */
> +int amdgpu_ucode_load(struct amdgpu_device *adev, const struct firmware **fw, char *fw_name)

'load' also takes a different meaning of loading firmware to ASIC. Maybe 
keep it as 'get' and keep another corresponding common 'put' for 
release_firmware?

Thanks,
Lijo

> +{
> +	int err = request_firmware(fw, fw_name, adev->dev);
> +
> +	if (err)
> +		return -ENODEV;
> +	err = amdgpu_ucode_validate(*fw);
> +	if (err)
> +		dev_dbg(adev->dev, "\"%s\" failed to validate\n", fw_name);
> +
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
> index 552e06929229..b9139fb44506 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
> @@ -544,6 +544,7 @@ void amdgpu_ucode_print_sdma_hdr(const struct common_firmware_header *hdr);
>   void amdgpu_ucode_print_psp_hdr(const struct common_firmware_header *hdr);
>   void amdgpu_ucode_print_gpu_info_hdr(const struct common_firmware_header *hdr);
>   int amdgpu_ucode_validate(const struct firmware *fw);
> +int amdgpu_ucode_load(struct amdgpu_device *adev, const struct firmware **fw, char *fw_name);
>   bool amdgpu_ucode_hdr_version(union amdgpu_firmware_header *hdr,
>   				uint16_t hdr_major, uint16_t hdr_minor);
>   
