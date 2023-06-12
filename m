Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2909472C9E6
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 17:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E52310E2A4;
	Mon, 12 Jun 2023 15:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F67310E2A4;
 Mon, 12 Jun 2023 15:25:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EE6VMxB3AqdsmsSF+IReo7xVyqhZJ1sKeT3spShfjhDPfCZSFiozYMrIKlecFDQ4KGFZKMWH7n8P3u4c/GyQCIkis6w8Xl35+tKS1nlMULcrfChv/Q9dtD0j/TnLp+yTccFvbBN7zTD4PXdijzLfMsuTqelkxCP66XRnDaazDKHIpbaub3djoviAqCg75GtZWl5IC3SPPzsnavM4QI5CYLSeQBiRjLq5chp8APXIK87WDpZ4SwYy7S+pDDzlsvmxKQ7gwS4wakIyLpSA9XNl/RiaLyxGI9MAZtT2jLylU7lWf6nKO87UiRAmr1BrGvMgRMIt9SjlsvsVbRUlto2W6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETnWu6WhKDYXFVtJI/sTBazn9LH79TpiDcs52asI7aI=;
 b=PPFIChXsAUahdGgULflCpnctmtazB0Yr2TRZIeD0phce4N18DPG3B6vWWIGhSH9Nvdkq7uPqfHXDjQ1lPJUPymmF93MucC4AF5goAZ0Ro31RsNaCBhp/GZxWQljrUkgeCwyjDKE9j6j/5oxuggt9JMApYy4wMVLRCkMptgic7GM144QIBGfa9oiAcWI1KXYDHz3udfxq8mfeCBfzzYcOx4zPkuZI2JF2kgXGf+ixnPAMIl5Vu1yRiPLi4RuAM7eERAVcePZnWZG8t6jWc3DUr/uV2+cLrmpZEGiiv70i0eRluLz3K7ZTF8+q+N0aPPrdvke3cQ/cTh964zmZ3foHZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETnWu6WhKDYXFVtJI/sTBazn9LH79TpiDcs52asI7aI=;
 b=YVr2kFCJvbjEz5Sk3e9y7n+U1biRNwi9QWKXe1DcdMeSEJPwE5bhajpAFF0bihv1aA9xBtzJwSdGvIbWMc+nXmPf+lCkBH2gn+Imf4fhsGJAr+ZFsG8rJXDAr/nxUEYiNEAKjcfP/bkUm4gcSlewmvZgyD7tA6sxiX7i7HErqdE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH7PR12MB6610.namprd12.prod.outlook.com (2603:10b6:510:212::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 12 Jun
 2023 15:25:23 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::2dc3:c1:e72d:55bc]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::2dc3:c1:e72d:55bc%7]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 15:25:23 +0000
Message-ID: <19a8be24-0b5c-4232-d3ba-dc7f269bafd3@amd.com>
Date: Mon, 12 Jun 2023 11:25:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] gpu: drm/amd: Remove the redundant null pointer check
 in list_for_each_entry() loops
To: Lu Hongfei <luhongfei@vivo.com>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:AMD KFD" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "Kim, Jonathan" <Jonathan.Kim@amd.com>
References: <20230612115848.8739-1-luhongfei@vivo.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230612115848.8739-1-luhongfei@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT2PR01CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::20) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH7PR12MB6610:EE_
X-MS-Office365-Filtering-Correlation-Id: 71fde0ed-e6b3-491c-e87d-08db6b593db5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c2jxGpbmLow+JIE7+jofckhLzo9g5JCSjRJJmHWBlzeEJF7Sxw2O6g4Dgg+7Fzj3mnM8E1cRvHoEyQ2NDfKYMmUXGC6+S62ZBXOfojBB7u9gPqEdijeBDKq5VQP0YNZ5A26zt7X3+0RbnCIeedEI5qSOwU7tPFqPQQz9vlIasE6qVlNUvFQSVnEhoDbkSXoYhl8Im0UpafaSNGQLzLjrUDsBImPSwT001uFw0GhrIqHt4U9iVygIxhtQjpGX0eOGzIhyrBQncoyS31HFBOeIBfYtDno383vEHQEckq/LziVhPcpRay3LH4b3cmcV82MqiKoniJABMQqJrIhEyzaYPdq1/dGXczVKIkYDTItwSrFazvYthZouf4QViwk4wn0fF6Litjr4Pez1e2+EnhJ99aZAAFlXqCDXL+4s+yaMCzPcINTsMCnzAuEJW+MyAt52z0Ofm/6IB8i4HpR98jG6QaMKBriR85OWLnrxIVZbs372KS/yA1nEXbR+5M8k4CuJubO6PyI/NRtb1gj8deUufQzX40yKTNYeyBxn701CrQNIn0WKlUAfYDpMJjbFIm9O8YEZ01tvJEyLU6H41fFP6/wgYKxo6M8oNdkZMkG1wNtEU16illuyUBQseqwycGU35lbEA0kVB4jZ2H2TsjrzSIhs52odxvelsR0pPJxVEkk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(451199021)(6486002)(26005)(31696002)(6512007)(83380400001)(6506007)(186003)(86362001)(36756003)(2616005)(38100700002)(921005)(41300700001)(110136005)(5660300002)(44832011)(316002)(8676002)(66476007)(66556008)(8936002)(478600001)(4326008)(66946007)(31686004)(6636002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGQ4cWlzdnpHcEtuUkpJMU43ZXZuLyt0RHpoZGk2cFlYaG0yS3NCRFFadHdi?=
 =?utf-8?B?ZVFhVjBHR0NLUi9BWmN5ZXpkL0krRzlYdXZ2WTlwU1JzSzlrZ2N5R2FXdmxY?=
 =?utf-8?B?b1c5TjdUQVBiNWtIRmF6TEt6RWE1dDlKckJsUldkUTJoYnVlN2ltYzlXZHR6?=
 =?utf-8?B?YzMrcEQzbFVENVhPOXBxR1BSQjVhTVdaZEpHN2YvZENJd3p4Z1RIWDlUVDl0?=
 =?utf-8?B?Tmd0RHJjYVFLYVNTQTZLZURtRTYzRlBabFBEd3RYc1pJbXBDWnZSOFc2NHhi?=
 =?utf-8?B?NHMzZEF3dklpNnJKOXE2Z0Y0aU5CSVVEbllGNnVZa0Y0Z2QyaGY2eTFEV1Mz?=
 =?utf-8?B?UXJPbG53T3VXWFRYSDBacHdVdDRTckpwYnJ3ZCtuUkpFdWQxSlMxV1BUNGlM?=
 =?utf-8?B?UnExbUk2TGJGbjJWcmdaR0kyR0ZpSlRNTUxhTml6WHdmQzJJMmpEQzcwTXh5?=
 =?utf-8?B?M2pRV3FubzJIV3dtdkJORVdtamMzRld4cmpWWHEvWnRIMldDa29vMy83SkFr?=
 =?utf-8?B?ejBZTjFDNjQ3VnRRRjAxcGZPKytkT2JPU0NGYTRGcmlJSjhyK0Q1YWJmOVRi?=
 =?utf-8?B?MnZ5SzVPdHMyaUJ4M0FmS1VkWHJHZWtDMFRuK0FFS0dSOWVrYmIyMW1XUDE2?=
 =?utf-8?B?ZjFxTGZlSGQ3RXRMN3BNTFRjdkhGSHpxa2RXc1BtQnJoOVgvQlI5dHNaNGlv?=
 =?utf-8?B?S3d0alRGZFdkclZnQk1ibW5sUlluaEppV0Q3bE1XK3RqMktqNHhvUE5TSkpF?=
 =?utf-8?B?UFF1UG5ZN0dUZWMrVHJXWXV0TUZLS29zeHM1KzJCSmhYZTFYRGJCWmlzTlpZ?=
 =?utf-8?B?UklhMmhvQktnNk1MZHMyZjVQUUt0NW15QmRicThQSTFYV280M2cvS09ndU1L?=
 =?utf-8?B?ai9yQ3lZQ1h0dWVvb1JOemJnUnNxV3Jxa1ZiSmtyMnh1R1JaQkZQZzRoU0pT?=
 =?utf-8?B?TmNkUHhGUzhNREVmdjlXTzVMOE1Vd3NJZTBJUkpUMHREMDBQOVVIbGl3N0VC?=
 =?utf-8?B?TWNYU21rMzFqclBPcnJteTRuTlVNZHBXemwxMVh2UFRLVlNIaHI5aFNUWWpI?=
 =?utf-8?B?NEpGb2NiYmFoTmFQSlFVUzdzQ3o0cGhZZ3BKUU96eTlNemNSMWIzUWF6ZDl3?=
 =?utf-8?B?ZndjWUhFZy9ZclhjdDU0aXpPMWRtTkxoSE1lUjdSODAwSHhleVlGSEl5OUV6?=
 =?utf-8?B?Nnllc2IwMnhYQVlTc3NObnZvTmU5YTMycTdVQng5UkJRbHZDT3VLRUpkbU8y?=
 =?utf-8?B?UktqM1F4RlFHN3FmbFhiQzBuZ3UvSjV1YmFHc1VvNmJFVGZ4Lzg1RTlRZ21t?=
 =?utf-8?B?bHNPMmRUeitENG1vcE1rVUY0L3VLQWYzSS9ENXprTjU5bTM2cmdaTlJOLy9y?=
 =?utf-8?B?Y2RJQ3MvdFFXS1d5U0dzYkd6VWU2bWYwU2lpcDJJRnBaNkgvZkYyNkNLZmtJ?=
 =?utf-8?B?a1B1RlJvd1QySE9rVlNpRlMzTVZncU5QWmVCaUpRdGx0NDBhcWFYUDh5c0Fm?=
 =?utf-8?B?K1MvYnA2U3JMY2cxa0YwUWliUFM2bDFzVTQzT3NVM1hWZTNDVU93TStodnZt?=
 =?utf-8?B?enFJN3FkZmxBemdwQjg3enpHTVRvcjRvRzRNcVp6NVpZTnFOUmpxRHo3UHJ1?=
 =?utf-8?B?MzdFV09obzl4MXk3SHYrNm14NHRCT3lJK0J0NXQ3S0tFaElWdUxzQmNOTUg5?=
 =?utf-8?B?OFR0R2c3ckltc1lGekZkaVRjYzhwQUI5T3Frc3dXeFh2dlpZWlBVUldObTlm?=
 =?utf-8?B?aS9rVkJISG14WUY2d2Rta2tNL0V6WlRPY3dGeTdpTDJyNmtvcDlvN1Baa1dX?=
 =?utf-8?B?cENkTlNCRElRS1h6ZmFJU3pmUDcxN3ZOaFJ1WWFQSXRaZTcrcm5UU2NRWXNJ?=
 =?utf-8?B?V0VTOTBFSVA4NXk2aEtGZzV0NXpXNjloTTl5SGFUZFJGa0VCZ0d0M1BORXpX?=
 =?utf-8?B?S0VPNjEwcGRCTWFncWhTZGEwQ1lUZ09sUS9nY2RmUFd6NlIzK24xZC8xYkdH?=
 =?utf-8?B?c0ljQnZYaDFVZVNlVG1XaDN5WXlaeVh3MVd4SHFVSHNibUYvNG44WkFBT1FR?=
 =?utf-8?B?d1liNWhmeHdnWVBFMEYxSDMxWkIzTWFER1ZJUWNEQW81THAxMzYrUmRPVFVk?=
 =?utf-8?Q?rfqlH1+PrQa5bNHaqXjjMJobH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71fde0ed-e6b3-491c-e87d-08db6b593db5
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 15:25:23.5966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EUUZPUlO/86XpuxvZh6ZrrJuxL4yrtmaQ38dfNI+y1tYd89CKCNlVdNx7QpLWmMz5nJ2WXVHGpA4qn1jLFu6ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6610
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
Cc: opensource.kernel@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[+Jon]

Am 2023-06-12 um 07:58 schrieb Lu Hongfei:
> pqn bound in list_for_each_entry loop will not be null, so there is
> no need to check whether pqn is NULL or not.
> Thus remove a redundant null pointer check.
>
> Signed-off-by: Lu Hongfei <luhongfei@vivo.com>
> ---
> The filename of the previous version was:
> 0001-gpu-drm-amd-Fix-the-bug-in-list_for_each_entry-loops.patch
>
> The modifications made compared to the previous version are as follows:
> 1. Modified the patch title
> 2. "Thus remove a redundant null pointer check." is used instead of
>     "We could remove this check."
>
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> index cd34e7aaead4..10d0cef844f0 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> @@ -1097,9 +1097,6 @@ void kfd_dbg_set_enabled_debug_exception_mask(struct kfd_process *target,
>   
>   	pqm = &target->pqm;
>   	list_for_each_entry(pqn, &pqm->queues, process_queue_list) {
> -		if (!pqn)

Right, this check doesn't make a lot of sense. Jon, was this meant to 
check pqn->q?

Regards,
   Felix


> -			continue;
> -
>   		found_mask |= pqn->q->properties.exception_status;
>   	}
>   
