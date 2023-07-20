Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 636CD75B5CA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 19:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372F610E5F7;
	Thu, 20 Jul 2023 17:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBD810E5F7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 17:40:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OaKAta6FU30nr8N6OmW8CL2sn0yAL/SidkWBfGDE/mJO3h8e0fSE53qjK86mJdDVTp6897NP20kXtV+6P5AcNWbrOvYV6mHkD+/ivuNKYak+XkD/tXxBduBBMz6ND7931yo52I1yr8KD6WiEynZEH6vPl4gwVVUIe2PhWaLuR+zwnAoR8g1B6ohLjB5ZOrYLpvrXLEHkyj28C5JTnarQn8brqjakoQwgRzefZGOCkOGNmPx+GXZq6s2PFkfiz7Iqtr7+2PaSSZanvbwWcXydmDv3C6Uz4vqgrXHBKd6fnJ9mcmjqAeZoceYV+Mfqa/+vexEPwd+QL3BjoU1i4d5/1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4quri3gI/KSbofWMIyhfYvjsEKiVwVwDeUJPcH9Zhl8=;
 b=NuTt2rNjnLbii6piCINF2EMSDzGj4BnkFU1llIGGb3uY2be6fkdfYpAIi5wDHC6G/iJmtF0n2l8+TH/zmhOKw0SPIPOVne8U3x0hvGWH5DPAuCARTeUANKXRPimnWpPHbN2lyPjk0bV7qjAuarPXqa2JKNChOsKlVZ+9eSKt9kCCNwpgIHzqECn80xP664vll/dwHX85MethGN8DRLc7JptRoMlrCYPhebkAZ03XbgljcZmrpg4ZrU3K8XS2v0KDT9Yc4oWEW8Jr3WzhXZiMOs0X8cChl7D7CzTQ03ruwZ2vCu5+MeuH6ExvIyUn/P1I4jCcZ7twR43WCNPHpxeT0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4quri3gI/KSbofWMIyhfYvjsEKiVwVwDeUJPcH9Zhl8=;
 b=ov1BbQGRgJ43F9+NMF9tlCm8zAw/LApB8awrgj9HRME99QCqTumaAgovPI3BTqO5Nxvc9bpfTXepxuHf6j7t7yJdgIJDBE3eQbdVpSwV38b+gsD3LwMyD94A1XEbKA2IfoO550SbTZ0RCCoFSoJKYoI4oPpDtSBATudsRT2G81vsgFzN0Wzg9gZIISNe1aVMYQJlSZnmq2vfpW9bbQnJkNwqBnp/eVviFOTa0whKLJDY7gWVN0FjQM2degeoVfPe27IaA68HTbErfrfxnawdLRVvZBpRzMlHLSptcXnMipPK9YCHLj+GQeJJ0nyjjqk6hayUEOf4BOk0PZijj3ME6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5122.namprd12.prod.outlook.com (2603:10b6:610:bd::12)
 by BL1PR12MB5285.namprd12.prod.outlook.com (2603:10b6:208:31f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 17:40:15 +0000
Received: from CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::c858:af19:997:b12a]) by CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::c858:af19:997:b12a%3]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 17:40:15 +0000
Message-ID: <8f72d32a-7a75-d744-408c-9c7eca0d9864@nvidia.com>
Date: Thu, 20 Jul 2023 10:40:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/syncobj: add DRM_IOCTL_SYNCOBJ_IMPORT/EXPORT_SYNC_FILE
To: Simon Ser <contact@emersion.fr>
References: <d01ca12e-f914-12c4-de1b-8918a6dd0df0@nvidia.com>
 <vVFDBgHpdcB0vOwnl02QPOFmAZPEbIV56E_wQ8B012K2GZ-fAGyG0JMbSrMu3-IcKYVf0JpJyrf71e6KFHfeMoSPJlYRACxlxy91eW9c6Fc=@emersion.fr>
Content-Language: en-US
From: Erik Kurzinger <ekurzinger@nvidia.com>
In-Reply-To: <vVFDBgHpdcB0vOwnl02QPOFmAZPEbIV56E_wQ8B012K2GZ-fAGyG0JMbSrMu3-IcKYVf0JpJyrf71e6KFHfeMoSPJlYRACxlxy91eW9c6Fc=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0103.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::44) To CH0PR12MB5122.namprd12.prod.outlook.com
 (2603:10b6:610:bd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5122:EE_|BL1PR12MB5285:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e54bebb-2346-47dc-2e49-08db8948607a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O7+uKr2XhQXcbKpaCDYV0U3BFWBKEi7ir9EcoQ3aJm5+ufmQ0ihndVFk7CISsaIVbCIBzay155k1LK8PNERj+32+DtBJnRi7KUxxTRGRNNpKut7ajSpxCSXaHp3iI8lMPVbjMq1iZvWvOWG1lGXaxoJJk7szhY0K/GCUbPE7F+ko9rSn3n+iWqjoJJ8p4UyIBhigodBR3ukrUZY2U7TcCDpvEoezsEXa1U1QN+uhBjPDHo9sHN5SIcQ+KCNIsJjb9J2zePiAulBhg3oKfl5yN470hQ0X+ctVN1qqXgeDBNFPdJ5Jfb+4X3zKPNoZPy2Amq+E80oPWGSRvW/lfwc7XGMmwJq8Sd/8iUrcH0NGk1I4DgvF2o7ui77fAOlimj7F+/zV3XeD7noDcR2y6NhY8v9cT5kNnCWUWcKM8HfzeW3fbxeHNFLka5T681yPqumkAhYs+v8F920tAF4DgmCZyWJZNiLs4ttPGllTwtAOn4T/vQmy2XM005/xf1ddSVFSwRAs2kopqCAtwHLtaO3r2qIo+JPtFtYIQc9ATY/CgG14MZE8M1hlVJ+IFYm020HMqSwiQwW2RVt9IAPKkhLnlSJzaqbkXDKFc/fcDoFy3vvQxGZcigDwLyPCJmmlCVN5sSsZESKRH3hxa2JQtQ+76utMJpWmrJBY1xA+2noXL2er5bTfe6/7iNOSeCUjvZ9U
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5122.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(396003)(346002)(136003)(39860400002)(451199021)(53546011)(36756003)(107886003)(54906003)(478600001)(6666004)(6512007)(966005)(6486002)(186003)(6506007)(26005)(86362001)(31696002)(4326008)(6916009)(66946007)(66556008)(66476007)(31686004)(316002)(8936002)(38100700002)(8676002)(5660300002)(2616005)(2906002)(41300700001)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mk92OERwUDJkOXBuNVJPcWJvYVRPQnBKa1ZxQlI0UHpPSm1yaGc2NVRlazBN?=
 =?utf-8?B?a1FjRDh1L051L1Z1dDZqSDUwQWdZSEVMZHNDanBXM2pSVVdOMW5NOHE4NGRs?=
 =?utf-8?B?TWI0NldkV2pEMVBGbnpTR0VqUkdqdFV4MUNoNnpycDcrbHorNWROWVJkekYr?=
 =?utf-8?B?ZElhZkR2VU50bmg4K1I0OUJha3dNdjdnQUJwVnAxc0ZGT3BLRm05Qm55elFw?=
 =?utf-8?B?YVE5TjZXSzljSG95aXkzTWdDdWtlci9neVVhYmdyK2tyMnZjNHZOZ2J1N2U1?=
 =?utf-8?B?Y0thenpReGRJSVBvSC8yc24rdDV1TE1YUlVNUmZiRmNIV3c3U1NURlorNGVH?=
 =?utf-8?B?aEZhcktUK0RtTkswNzBCQXNhZkVWSVUvUjcydjd2OUpIcjBqMzYzZkJZOVFq?=
 =?utf-8?B?Sy94WVViNUdHLzYraFVONWNwL0F5dzhVSWRQMnNyaXd4VVB1RHY5cWZWY25L?=
 =?utf-8?B?UzBOZ0dBWlpzV2hsd3VsRXp2anRESWNwSVRITFB5VEhraE42L2xFSDZKaGJn?=
 =?utf-8?B?NXFWOUI1VjdjY1hObjZZWGxBWGM5WTFqejRnRGdGNERGUkNxZGw2V3lxWG1R?=
 =?utf-8?B?enM4T2J2SkwvYm9PVDlSc2lOTkplMVlkMzk5MGFPZ1RURTJXcmZ3TFVDUjBn?=
 =?utf-8?B?anpLK2dUc09HNjdTbGFYZVhsRXAwaU9VUGpINmk0T0tQS1V5bndFTmVnaTJU?=
 =?utf-8?B?V3ExbWd2elFSNEdvK0xnSHNKby81QmxwR1VuaytMdHdCeEFmZUhxTERwYStT?=
 =?utf-8?B?b0hqejRlZ3Vtb1Bhbjh2VXNIYktQNkFwSDc5SGZQUHAybUZKbDNEemZURlNx?=
 =?utf-8?B?dnJKRnBIOEp4VlBBRlBzamNlcmpWQkk3cCtlZmw4ZGFFVENxOEJRcVpWVldO?=
 =?utf-8?B?enVENGFKZ3Y4RWlEUWFqdFJOQklqWlh0c1Mzd0VuTUp5Njg4WVZCa3BBM1pJ?=
 =?utf-8?B?ZXJHNGNoOE5mc1FnZGg2MVcra0w3UEpObFhXdSt4bEUrVFpROUxsRDlVOWdQ?=
 =?utf-8?B?NlFOL3pkajNyK2RHcTNXU1BkcURza0prRkc0MG9Wa1hjdmxRQndJMVZKZUJN?=
 =?utf-8?B?c3dpOWlPZzN1UVBNL0dTem43SVBhK2lQUUdaQ0xQNjR2NnduZ1JVTjVjSysw?=
 =?utf-8?B?ZGtZdzlzblFUYWoybUpKU2M5REZIL1NtTGh5bmZscGJ0T0xvNEVLeHVacFgz?=
 =?utf-8?B?TTBBZWVSejRFTXcxRjNhRS9YVWkrNS83T1U5b3lJRG1udHFJV2Npb1NGSEQ1?=
 =?utf-8?B?TTBOcXVkd3lqRGNhcXNFWE5Gc01BMFdTZkdraDY2SG9INUVTcVptTzYwcGxw?=
 =?utf-8?B?d0dIZUhJRlZkMndyd2JDUVU0MHU4b1dmR0I1NkJ6RXZnditnSGdZcjUxL04y?=
 =?utf-8?B?MWNDK2RnUTYvcml1bUdrTzFRVzVmWktJVExwY29XajFuZm8vWUNTMEJldEhX?=
 =?utf-8?B?S0JaS1NlQ1dsMGREVm5yR0JLM29nbXpXSWFyUHJ3VHB4ZDBWWWRaaXQ2dzIv?=
 =?utf-8?B?Zm5BOUJTazY5b3RITWhLTmpXVlBNSlBaM2VYUmpZbHd2THJ2bnFEaGNTL2lu?=
 =?utf-8?B?RlFRUHltUWNuVXZYVFRzU0w1UnJzbjJaVmFWeGY0ZlM3Zk5OdlhOSUZrOGlH?=
 =?utf-8?B?c1huNjQreWUzd0VQTnFkQm5SV0pxbkVTejc2NHFEckpUSEh6akwvVXd1akhm?=
 =?utf-8?B?NmJCVDdWSlVEM2lkYU5IWmtIZUJPVnlRNHNDdGt4ZWhXQ2pNV0tBZlZqYjlw?=
 =?utf-8?B?dU56cWdBbkFXRmpYWTFSZFVJeG00N2JiR0J5OUw5MEI1T0Y1TE5yeWRKb2FE?=
 =?utf-8?B?R0RMVVJOZXZqSDlvbFZhbm9TeFhLYU5kK2s1M29BMDdDRjhubllKVVhkQXRO?=
 =?utf-8?B?UCtTQVpNcjJiR1NHTVlTZzRvcVMyczRuMVV2Zlhpd2NmeGlSWW9MUkdWa1BM?=
 =?utf-8?B?RXQ1dGIxZkVDQnZZREFwS0hqZlA0aE5qaUR2b20renR0NVUrVGV2QlhlcWEr?=
 =?utf-8?B?OWRyb2ViVS9XdzFyN29KZVdxb1BsSm5HVTV3dG1FWitlUXBKa0lzdzRQeWVr?=
 =?utf-8?B?a2JpVTNWdXVxNEpsNGpyVG5MalUxYkEzMFpEQnhVd0N4Q0dubW8zQWdwdlpF?=
 =?utf-8?B?L0VGRmx3K29tNUtLMFlFSmc1YktmelB5NGhYb1ByamJULzF5WWNLd0IrYWQ5?=
 =?utf-8?B?NFE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e54bebb-2346-47dc-2e49-08db8948607a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5122.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 17:40:15.4028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6IXMJx36SIQF47GHTLiEF1egXPyIMSj/5fnoUZiNzgUTOvjLRgHIhRB0vXpFaSIAVoDyzcZUadUSBCp1YLqCrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5285
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
Cc: James Jones <jajones@nvidia.com>, Austin Shafer <ashafer@nvidia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/20/23 02:43, Simon Ser wrote:
> On Wednesday, July 19th, 2023 at 19:05, Erik Kurzinger <ekurzinger@nvidia.com> wrote:
> 
>> These new ioctls perform a task similar to
>> DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD/FD_TO_HANDLE with the
>> IMPORT/EXPORT_SYNC_FILE flag set, except that they allow specifying the
>> timeline point to import or export the fence to or from on a timeline
>> syncobj.
>>
>> This eliminates the need to use a temporary binary syncobj along with
>> DRM_IOCTL_SYNCOBJ_TRANSFER to achieve such a thing, which is the
>> technique userspace has had to employ up to this point. While that does
>> work, it is rather awkward from the programmer's perspective.  Since DRM
>> syncobjs have been proposed as the basis for display server explicit
>> synchronization protocols, e.g. [1] and [2], providing a more
>> streamlined interface now seems worthwhile.
> 
> This looks like a good idea to me! The patch looks good as well, apart
> from one tricky issue, see below...
> 
>> [1] https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/90
>> [2] https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/967
>>
>> Accompanying userspace patches...
>> IGT: https://gitlab.freedesktop.org/ekurzinger/igt-gpu-tools/-/commit/241e7f379aeaa9b22a32277e77ad4011c8717a57
>> libdrm: https://gitlab.freedesktop.org/ekurzinger/drm/-/commit/b3961a592fc6f8b05f7e3a12413fb58eca2dbfa2
> 
> (Unfortunately this isn't enough when it comes to user-space patches: the
> kernel rules require a "real" user of the new IOCTL, not just a libdr IOCTL
> wrapper. I will post a patch to make use of this from wlroots if that helps.)
> 

Thanks for taking a look, Simon. If that's the case I could also update my Xwayland MR to use the new functions.

>> Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
>> ---
>>  drivers/gpu/drm/drm_internal.h |  4 +++
>>  drivers/gpu/drm/drm_ioctl.c    |  4 +++
>>  drivers/gpu/drm/drm_syncobj.c  | 60 ++++++++++++++++++++++++++++++----
>>  include/uapi/drm/drm.h         |  9 +++++
>>  4 files changed, 71 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
>> index d7e023bbb0d5..64a28ed26a16 100644
>> --- a/drivers/gpu/drm/drm_internal.h
>> +++ b/drivers/gpu/drm/drm_internal.h
>> @@ -253,6 +253,10 @@ int drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>>  				      struct drm_file *file_private);
>>  int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>>  			    struct drm_file *file_private);
>> +int drm_syncobj_import_sync_file_ioctl(struct drm_device *dev, void *data,
>> +				       struct drm_file *file_private);
>> +int drm_syncobj_export_sync_file_ioctl(struct drm_device *dev, void *data,
>> +				       struct drm_file *file_private);
>>
>>  /* drm_framebuffer.c */
>>  void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
>> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
>> index 7c9d66ee917d..0344e8e447bc 100644
>> --- a/drivers/gpu/drm/drm_ioctl.c
>> +++ b/drivers/gpu/drm/drm_ioctl.c
>> @@ -710,6 +710,10 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>>  		      DRM_RENDER_ALLOW),
>>  	DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_QUERY, drm_syncobj_query_ioctl,
>>  		      DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_IMPORT_SYNC_FILE, drm_syncobj_import_sync_file_ioctl,
>> +		      DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_EXPORT_SYNC_FILE, drm_syncobj_export_sync_file_ioctl,
>> +		      DRM_RENDER_ALLOW),
>>  	DRM_IOCTL_DEF(DRM_IOCTL_CRTC_GET_SEQUENCE, drm_crtc_get_sequence_ioctl, 0),
>>  	DRM_IOCTL_DEF(DRM_IOCTL_CRTC_QUEUE_SEQUENCE, drm_crtc_queue_sequence_ioctl, 0),
>>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_LEASE, drm_mode_create_lease_ioctl, DRM_MASTER),
>> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
>> index 0c2be8360525..bf0c1eae353a 100644
>> --- a/drivers/gpu/drm/drm_syncobj.c
>> +++ b/drivers/gpu/drm/drm_syncobj.c
>> @@ -181,6 +181,13 @@
>>   * Note that if you want to transfer a struct &dma_fence_chain from a given
>>   * point on a timeline syncobj from/into a binary syncobj, you can use the
>>   * point 0 to mean take/replace the fence in the syncobj.
>> + *
>> + * &DRM_IOCTL_SYNCOBJ_IMPORT_SYNC_FILE and &DRM_IOCTL_SYNCOBJ_EXPORT_SYNC_FILE
>> + * let the client import or export the struct &dma_fence_chain of a syncobj
>> + * at a particular timeline point from or to a sync file.
>> + * These behave similarly to &DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE
>> + * and &DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE described above, except
>> + * that they accommodate timeline syncobjs in addition to binary syncobjs.
>>   */
>>
>>  #include <linux/anon_inodes.h>
>> @@ -682,10 +689,11 @@ static int drm_syncobj_fd_to_handle(struct drm_file *file_private,
>>  }
>>
>>  static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
>> -					      int fd, int handle)
>> +					      int fd, u64 point, int handle)
> 
> Nit: can we specify the point after the handle, for consistency with
> drm_syncobj_export_sync_file()? It's pretty easy to mix up these two arguments.
> 
>>  {
>>  	struct dma_fence *fence = sync_file_get_fence(fd);
>>  	struct drm_syncobj *syncobj;
>> +	int ret = 0;
>>
>>  	if (!fence)
>>  		return -EINVAL;
>> @@ -696,14 +704,23 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
>>  		return -ENOENT;
>>  	}
>>
>> -	drm_syncobj_replace_fence(syncobj, fence);
>> +	if (point == 0) {
>> +		drm_syncobj_replace_fence(syncobj, fence);
>> +	} else {
>> +		struct dma_fence_chain *chain = dma_fence_chain_alloc();
>> +		if (chain) {
>> +			drm_syncobj_add_point(syncobj, chain, fence, point);
>> +		} else {
>> +			ret = -ENOMEM;
>> +		}
>> +	}
>>  	dma_fence_put(fence);
>>  	drm_syncobj_put(syncobj);
>> -	return 0;
>> +	return ret;
>>  }
>>
>>  static int drm_syncobj_export_sync_file(struct drm_file *file_private,
>> -					int handle, int *p_fd)
>> +					int handle, u64 point, int *p_fd)
>>  {
>>  	int ret;
>>  	struct dma_fence *fence;
>> @@ -713,7 +730,7 @@ static int drm_syncobj_export_sync_file(struct drm_file *file_private,
>>  	if (fd < 0)
>>  		return fd;
>>
>> -	ret = drm_syncobj_find_fence(file_private, handle, 0, 0, &fence);
>> +	ret = drm_syncobj_find_fence(file_private, handle, point, 0, &fence);
>>  	if (ret)
>>  		goto err_put_fd;
>>
>> @@ -823,7 +840,7 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>>
>>  	if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
>>  		return drm_syncobj_export_sync_file(file_private, args->handle,
>> -						    &args->fd);
>> +						    0 /* binary */, &args->fd);
>>
>>  	return drm_syncobj_handle_to_fd(file_private, args->handle,
>>  					&args->fd);
>> @@ -848,6 +865,7 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>>  	if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE)
>>  		return drm_syncobj_import_sync_file_fence(file_private,
>>  							  args->fd,
>> +							  0 /* binary */,
>>  							  args->handle);
>>
>>  	return drm_syncobj_fd_to_handle(file_private, args->fd,
>> @@ -1515,3 +1533,33 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>>
>>  	return ret;
>>  }
>> +
>> +int drm_syncobj_import_sync_file_ioctl(struct drm_device *dev, void *data,
>> +				       struct drm_file *file_private)
>> +{
>> +	struct drm_syncobj_sync_file *args = data;
>> +
>> +	if (!drm_core_check_feature(dev, args->point == 0 ?
>> +				    DRIVER_SYNCOBJ :
>> +				    DRIVER_SYNCOBJ_TIMELINE))
>> +		return -EOPNOTSUPP;
>> +
>> +	return drm_syncobj_import_sync_file_fence(file_private,
>> +						  args->fd,
>> +						  args->point,
>> +						  args->handle);
>> +}
>> +
>> +int drm_syncobj_export_sync_file_ioctl(struct drm_device *dev, void *data,
>> +				       struct drm_file *file_private)
>> +{
>> +	struct drm_syncobj_sync_file *args = data;
>> +
>> +	if (!drm_core_check_feature(dev, args->point == 0 ?
>> +				    DRIVER_SYNCOBJ :
>> +				    DRIVER_SYNCOBJ_TIMELINE))
>> +		return -EOPNOTSUPP;
>> +
>> +	return drm_syncobj_export_sync_file(file_private, args->handle,
>> +					    args->point, &args->fd);
>> +}
>> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
>> index a87bbbbca2d4..e1f045011c22 100644
>> --- a/include/uapi/drm/drm.h
>> +++ b/include/uapi/drm/drm.h
>> @@ -884,6 +884,12 @@ struct drm_syncobj_transfer {
>>  	__u32 pad;
>>  };
>>
>> +struct drm_syncobj_sync_file {
>> +	__u32 handle;
>> +	__u32 fd;
>> +	__u64 point;
>> +};
>> +
>>  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL (1 << 0)
>>  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT (1 << 1)
>>  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE (1 << 2) /* wait for time point to become available */
>> @@ -1139,6 +1145,9 @@ extern "C" {
>>  #define DRM_IOCTL_SYNCOBJ_TRANSFER	DRM_IOWR(0xCC, struct drm_syncobj_transfer)
>>  #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL	DRM_IOWR(0xCD, struct drm_syncobj_timeline_array)
>>
>> +#define DRM_IOCTL_SYNCOBJ_IMPORT_SYNC_FILE	DRM_IOWR(0xCE, struct drm_syncobj_sync_file)
>> +#define DRM_IOCTL_SYNCOBJ_EXPORT_SYNC_FILE	DRM_IOWR(0xCF, struct drm_syncobj_sync_file)
> 
> So, there is a footgun here, one that I hit myself with before: 0xCE is already
> used by DRM_IOCTL_MODE_GETFB2. And there is no check whatsoever about
> conflicting IOCTL numbers. The only reason I noticed is that I got some pretty
> weird behavior when trying to detect for the IOCTL availability in IGT, and
> someone from AMD noticed some GETFB2 IGT test breakage when trying my patches.
> 
>>  /**
>>   * DRM_IOCTL_MODE_GETFB2 - Get framebuffer metadata.
>>   *
>> --
>> 2.41.0

