Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2484A48A431
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 01:10:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292B410E49A;
	Tue, 11 Jan 2022 00:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E02110E491;
 Tue, 11 Jan 2022 00:10:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrV6VQhb7/+xKYHxghpMAcJ1e/yLOe2+zJ26pZ46GljY0QzaCf/EcXuuqtHj50YTWvM3mBu+qsrzQdSow3Mgu2m7/vZ061PXDQCokGvkvgzTbmuJVq/NbZYLMZOi/35MfmgA5UCRF6mSKeejISQt8uhTviTyrV6WsnDxWolEoygVMs/ly9I1wkwdTODEDbkib80a33RAPo9dPwETDbjQeW5YFE9cp9q+tZcb0a8BjpfuWV/Ub64lE0qVGwANM+sC/ruLWlIlwvxB+PX/yqnunOxiP+NY3R4eAPH1BPd9fauoMBPhLpbAFySNJlSs9lfpj391/c+opfISlqJUlDbbBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3L48paM8vf19dCR/Ofjcpoui6aByg7Je5YIkzb3L+qE=;
 b=EW0F8R+gEfHhSk7bIz+KxqiukkDwpTfqPLf7VuV2/T4VBEw5G9bayuy7wjbAeybD91CqmFw7DQXRWCSAhcSNEfh1/W9ZS6f6d+WGOE9Z7Z2RqOO4rkmwQbtzs2DMi8BuVP+Sag+knhqtDtHbgEs5c+t8z8uxQSEQd+M2Q91AQEK38uMsbtxw2mxVqjXB6nDKOn2eYbaihc6YuDnYuanYgh4mtUE0uF2EqCs9WHRZNv3M1UOB9+Z7Ija+eSWZxG7TY+1ksuTmSp/SMnmwbZlmYQ/FKQON4N5xXRVgJ27vrhj+QeHoNAOPUdh4eBrq0SyDE+sOTG847+wFZY4T1Z+lPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3L48paM8vf19dCR/Ofjcpoui6aByg7Je5YIkzb3L+qE=;
 b=Hv3dU74oY31Mt152ear4sief5njB8XKzBWsOpvJFC08doHqkBCoQEIC7Ss/2S4HHTP40UjyQ/SPQn3pox2Ibre/L9h2SaKTVdohT1VCCbc+qv81EI+c8j8WvhdFWg0UPaUCyTNCp8SonBiH2u8BOCCpLs1ybm+J6uZmCKTtSSFM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5307.namprd12.prod.outlook.com (2603:10b6:408:104::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Tue, 11 Jan
 2022 00:10:02 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 00:10:02 +0000
Subject: Re: [Patch v4 18/24] drm/amdkfd: CRIU checkpoint and restore xnack
 mode
To: philip yang <yangp@amd.com>, Rajneesh Bhardwaj
 <rajneesh.bhardwaj@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
 <20211223003711.13064-19-rajneesh.bhardwaj@amd.com>
 <6e5d64da-3081-a8f3-398c-6e12d18c8507@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <116c8cf4-57c2-f3a1-f4b9-5f0ef4526967@amd.com>
Date: Mon, 10 Jan 2022 19:10:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <6e5d64da-3081-a8f3-398c-6e12d18c8507@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: CH2PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:610:4c::27) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edfb2f44-db2d-46a1-a96f-08d9d496b6d1
X-MS-TrafficTypeDiagnostic: BN9PR12MB5307:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB530736800325A405A280BF2992519@BN9PR12MB5307.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LVQkQoVe+ke3ch+6WzgUsRq/CfTo+ak95KRXz0TjngqgSd+8dFqVJyFzYZawI3jj3mQLmc4In9PckmLL7Jln3WMoteOZ8nTQ8jMP/eVC58HHc77TQlQe+9+iVrHqw6BMDPp+IEgSjXY3/OCfbJe4x/c8EN//0X9/viWi2sr1E1tLdYj1gOhSG4jQElPHQM9FrdWvT5DJAdTSN4jcyDYMPNGCW89ABN2PXeQlR3jMdKitgvWOshlLHomm2r8g32+fHRBKSVeie7trw3yHGWL75kSAJCG3i+GPhyoOTdOuSFGNbfPlNG0TrhW/7dpip5283veffb1Zgj78D78qtsdm2Wcjm4fKxYH5iPa4bNHCg4nbFSpGWFIwPHuQl3yA5bF9NRBojuuywJB/HXu1HYeLxHUmiAX7eZ3Kd5ra+zmhsgQFqDHjcwNed883+9cCVmM7cfD3wEQGaCZlAIcJCph0ajA2rIZyqTwOLEcJDqFpP9EbBSDmqK4LvH2uII9W40lfUVFq5NXSMz8JBplYaZ+FY+xAZqeI+E+UpfPwHmvh8LtIKFq9tx7WRTBijqdGfpPI3bdwUzk1IOnZpv4SBmANVcpLE+BFA5xhagV48ovAsxReouasWHjtcBobtUDPiGD80nn84iZjcJ6IdCglr5Li91HvoP4c2BRXmYH691IyjzUSMFiToC8v5Dv15sRYIyxlfdt1eB9l4YsCrLOhtPqZgyuzIcuI3hEE9Fqr22vhJMr7vtjmgTrNHd+sedyhsrvy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(53546011)(66946007)(38100700002)(31686004)(36916002)(6506007)(4326008)(66556008)(83380400001)(86362001)(66476007)(508600001)(4001150100001)(26005)(186003)(8936002)(110136005)(31696002)(5660300002)(316002)(6486002)(36756003)(2616005)(8676002)(44832011)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWREOVQ3bkZHeG8va1JIbjh4NURPaFFHbytzeEd4MDZIQVFqMmJkUjZwRk1h?=
 =?utf-8?B?OG9iTHFOWm5aWXQwUE8ycWwvc2gvR1BiZ2xxTzdzU203TFFDa1lUdnZZS2J2?=
 =?utf-8?B?dmd1ZDhTeHc4M3JmMWp1dUsxanZONmQ2SWpkWU5nSzA4N1poVDRWZnhzRVJE?=
 =?utf-8?B?aDVJTnRIWFIwbHB3Ny9IQkZHcTJyb0F2eGJvczExbERJSHRYZitwbVNiR3lO?=
 =?utf-8?B?V2VqZEozL0lpeHkxTjk3N2xLK012SnllVkVrNEpBSjZJZERxdDJlYi9USHo1?=
 =?utf-8?B?YnBDc1pPMk9BNFZVekhRQUxaYUV4VUhTVTJEVnRDZnpEOE0zbVdQbk9xSUlU?=
 =?utf-8?B?WDFVZ0Vmbk44Ti84MnMyYmpOdFhGYmRDaE90SXUyd2pHUFo3bWNEU2lxWndi?=
 =?utf-8?B?WUt5S2VndUpKcVZ4QlE0cUdEVmRyTnFaTmFFY1YrU1RFT2p2OXVOa09SdUJt?=
 =?utf-8?B?Q3g2UWJMQXNrQlZ0dWx1UmhKT1AyUmJuTXRqVzFVYkRjN2E5UndVSWUyRHBX?=
 =?utf-8?B?MlcrRUhJc2Y3MFkrOUVmc3pXMTFtbngwd010NEVJNUYybXZCZm8vQzBtR2c2?=
 =?utf-8?B?RUdlejE1a3B1ZXRqOTE5Z2dMMGZyaDlySktiS0tHUVdmelBDVHdBV013RUFa?=
 =?utf-8?B?SjZ0cHhZOEtGU2RRYytuVHE4NHhKMEoyUDh4dXN1R1I1VHhHTTJFMGlyOVFT?=
 =?utf-8?B?SmRDZUl0cndGOHMyb1I1ZTNKdmJUanhySzJxb0dVSy9lSmJPdHdsR2llWVlv?=
 =?utf-8?B?dDNwQUJPRTQrdWZQVVhHZE5oeEFPYWpVK1A0RmloYUxaODNKbmZIZTVCTml1?=
 =?utf-8?B?cExBQ1FFdUU3RmJ0L0MyQ21SZVNQSTQvY3lnaUFwWUtONi9maWZxM3lnRWpo?=
 =?utf-8?B?ZWpkK2RJN0gyS3F0eEFxZjRqbnZOUzJmU05nenRUd2NhR0k0b3dGd20zeElH?=
 =?utf-8?B?WTZ0aGtnR3lTTzIrNkl4bVhzQlNpSDhiWk5MRkxoN3RQR2hGTWJWUDdnTzE0?=
 =?utf-8?B?Q28yTTEzeTRDdTYzelVOc3F6cGVRa2ZVd3oxV0RzUGNrZEhjSVpIeXJ6VEha?=
 =?utf-8?B?QXA2OU8xNCtScHNJSm9MMlVYOHVab2NPRWJ3MXNwS21tcHpjK0NuTGdIb25u?=
 =?utf-8?B?eHM0bkVTbTM2c01CSHBjVXFRK0Y5cTNTenVEeGZaRHBYRGtvZVA4V3NZaTJS?=
 =?utf-8?B?b2lHWWd5K1N0enMrb2JEKzVkS2wxN3VEU05tQlV3dUc0MEF1WmYwN25Ua3U3?=
 =?utf-8?B?MzJsSlhzeUZOZHNOZ3hoREQ4VVNkL1dVNisrdFROU2hONm54bk1SUGhxeDBF?=
 =?utf-8?B?ZEU4Z04vdmhyR0M4QXRMaktCYUlwYkU4WDF4bGlNcmZxTTNLTFpKU0JUQmZX?=
 =?utf-8?B?RTR2blA4bWJ4VU0vRVVSeGJEYld5dGJBRnlGcVBOUEV4Rm81UWp4WEZqYnNk?=
 =?utf-8?B?NUpWVnFTMjZmanlDMVpXUUVHV1p0RndFN1dYVmZpK2UydXdBY3J6ZkRxV0Zw?=
 =?utf-8?B?ZWVIenh2elUxeVJ3Q1lqeDhzcDNQNHp3QnVMdHdsazhCWER2SzVIREFXSGtp?=
 =?utf-8?B?M0ZBTkVVNmJFcjVHMHZGMXNncEpGb2ZVL3lrNlRueEE2TmNIRnRZVEN2Ny9L?=
 =?utf-8?B?OUY4czBUTzNNcTBOU3VNa090SU1oUUp2S0xDVzVmUU9jS04rM2ZUWi8vY3RL?=
 =?utf-8?B?NkgyTTUwQzB4RzhsaGUwS2x0bHhoQW5jODhkcHczaWNuVVUwREw4VzM0Rm5M?=
 =?utf-8?B?L053K0RGRzNpVVJQaWRWM3F6Q29xUzBRczZlL0JqMW51Skk4TjJSdlZDc2hn?=
 =?utf-8?B?cERHdnY1S2Z4YU81L2dPQWRMUG4xKzJLUnBNK2d6cEg5VWRUblhqWGJzeFBK?=
 =?utf-8?B?a2k2TjZVNUFTNSs4K0VIZWJRUjQxQ2VZMGxNZE92VUZ4S2lkblpPRGFSU2Q4?=
 =?utf-8?B?L2g5WWRJOXJYNlYzSk85ZHAvWGo3OUpOd0FlSmhRYTFGYkpOcVJYT3JhblBW?=
 =?utf-8?B?bkNvTGlsRU05azhKR241MXJnUzgvcTJ6L3hOTjhyS2FEclRjNmhPNlo4MmhK?=
 =?utf-8?B?WlR2bVlsdlluTHo0Q1E4MXFMcFlYR1JuQUdrKy9MSHBXWEdaM1dZUFMwdGhn?=
 =?utf-8?B?ekxqNFpJeFIyYnQ1Sm11MmtrcGR1enNmTDBHblg2ODFieUJCQXEzR3RpQnR4?=
 =?utf-8?Q?R3AERgvnDWRTH0jM/KDnoKc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edfb2f44-db2d-46a1-a96f-08d9d496b6d1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 00:10:02.8418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FDm7JQNuweaDTJH/G0vylVVtU18QpjL33ZIEMnzUBbkeaITyt4uJmfAluCeDsJFJDsEImW+jc2hJOOqhZpGbLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5307
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
Cc: alexander.deucher@amd.com, daniel.vetter@ffwll.ch, christian.koenig@amd.com,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-01-05 10:22 a.m., philip yang wrote:
>
>
> On 2021-12-22 7:37 p.m., Rajneesh Bhardwaj wrote:
>> Recoverable page faults are represented by the xnack mode setting inside
>> a kfd process and are used to represent the device page faults. For CR,
>> we don't consider negative values which are typically used for querying
>> the current xnack mode without modifying it.
>>
>> Signed-off-by: Rajneesh Bhardwaj<rajneesh.bhardwaj@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 15 +++++++++++++++
>>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  1 +
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> index 178b0ccfb286..446eb9310915 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> @@ -1845,6 +1845,11 @@ static int criu_checkpoint_process(struct kfd_process *p,
>>   	memset(&process_priv, 0, sizeof(process_priv));
>>   
>>   	process_priv.version = KFD_CRIU_PRIV_VERSION;
>> +	/* For CR, we don't consider negative xnack mode which is used for
>> +	 * querying without changing it, here 0 simply means disabled and 1
>> +	 * means enabled so retry for finding a valid PTE.
>> +	 */
> Negative value to query xnack mode is for kfd_ioctl_set_xnack_mode 
> user space ioctl interface, which is not used by CRIU, I think this 
> comment is misleading,
>> +	process_priv.xnack_mode = p->xnack_enabled ? 1 : 0;
> change to process_priv.xnack_enabled
>>   
>>   	ret = copy_to_user(user_priv_data + *priv_offset,
>>   				&process_priv, sizeof(process_priv));
>> @@ -2231,6 +2236,16 @@ static int criu_restore_process(struct kfd_process *p,
>>   		return -EINVAL;
>>   	}
>>   
>> +	pr_debug("Setting XNACK mode\n");
>> +	if (process_priv.xnack_mode && !kfd_process_xnack_mode(p, true)) {
>> +		pr_err("xnack mode cannot be set\n");
>> +		ret = -EPERM;
>> +		goto exit;
>> +	} else {
>
> On GFXv9 GPUs except Aldebaran, this means the process checkpointed is 
> xnack off, it can restore and resume on GPU with xnack on, then shader 
> will continue running successfully, but driver is not guaranteed to 
> map svm ranges on GPU all the time, if retry fault happens, the shader 
> will not recover. Maybe change to:
>
> If (KFD_GC_VERSION(dev) != IP_VERSION(9, 4, 2) {
>
The code here was correct. The xnack mode applies to the whole process, 
not just one GPU. The logic for checking the capabilities of all GPUs is 
already in kfd_process_xnack_mode. If XNACK cannot be supported by all 
GPUs, restoring a non-0 XNACK mode will fail.

Any GPU can run in XNACK-disabled mode. So we don't need any limitations 
for process_priv.xnack_enabled == 0.

Regards,
   Felix


>     if (process_priv.xnack_enabled != kfd_process_xnack_mode(p, true)) {
>
>              pr_err("xnack mode cannot be set\n");
>
>              ret = -EPERM;
>
>              goto exit;
>
>     }
>
> }
>
> pr_debug("set xnack mode: %d\n", process_priv.xnack_enabled);
>
> p->xnack_enabled = process_priv.xnack_enabled;
>
>
>> +		pr_debug("set xnack mode: %d\n", process_priv.xnack_mode);
>> +		p->xnack_enabled = process_priv.xnack_mode;
>> +	}
>> +
>>   exit:
>>   	return ret;
>>   }
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
>> index 855c162b85ea..d72dda84c18c 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
>> @@ -1057,6 +1057,7 @@ void kfd_process_set_trap_handler(struct qcm_process_device *qpd,
>>   
>>   struct kfd_criu_process_priv_data {
>>   	uint32_t version;
>> +	uint32_t xnack_mode;
>
> bool xnack_enabled;
>
> Regards,
>
> Philip
>
>>   };
>>   
>>   struct kfd_criu_device_priv_data {
