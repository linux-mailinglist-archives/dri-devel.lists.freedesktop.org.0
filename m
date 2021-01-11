Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D00B92F2219
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 22:46:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8F889B69;
	Mon, 11 Jan 2021 21:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D6689B66;
 Mon, 11 Jan 2021 21:46:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGbopEhN45yW4JhyrWsGR9UgOPjfM4GPx0HKWqxeOGtaQr/MUhHy9AijBvs+CIqDj7eb2Jq40dAq5fsKfLmB1Q8G5U4zDxHo/oLq03w1EYRdNC9y8uJVU5fWlB18QIxkhfkM/ask6ftkZyiJuhJJ/kYx0iUC3socReBPFfzVi4OkxibhzAo/iJddfC8kavDu9MfdQfeM7dEGtNFbdMrx9NMo55UbknYRHYPx5fDDmgSMTQpwEWl/m1129bRM0lI4szcl3QdB62ENU9Iza6JiQxGYYQZdozRsG3UL3J6cDC3YkfNEFDh9UQRngj3Y2VWQWFv/40920/Ef458qmSZDrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RPAmtMAeyO3Na/CJk+udE31pyXso/Qtjoq66ppQnhM=;
 b=FFlbmy0UactwUJQhAYcEvBmDbFAP9adcnj3/QVQrMmxlqOrI1thELXsWobH1xe7BkvVqjj1VLzk84WVS4/zuiFaJ4PtvYPhBrLC7do4/lSnNFImRO6UNETEQh1V/FjCSdeGnrAY0pWHs1IRMbvHT5UoGzbnzVU+QeQc0cP9ou3LKKsLnQngiMTW1POrq0u25fyFF67a+rXSdvvvLTxJFqvD329HaaBsp8l7DXT4GlynmbpBTjKINbHHpmMeFUfqsRXbTlCkc6HCnmJXVyfLRKlZn18Gg9Xk1ndkaCzX0Xtkmbh78lQWp6AGqLHufytPrja01TrcMuu1ddYprzzA+CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RPAmtMAeyO3Na/CJk+udE31pyXso/Qtjoq66ppQnhM=;
 b=HeN8wKCA9I1qm/VnIBkNd+u+EpRe7wnHbpHstXh60Z5/88WMwFaP9u4MuT68WMNULJxJx3Cx1iJuebj0Y7+3Bh5jUSBSdm7BXjSPFIN2KF1u1sF9IUgriF2obBpRMclMbY7lkkAVBsEVPkQ0LkbNyBP0CTlWa/1UbVK9mTXV7DY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB2578.namprd12.prod.outlook.com (2603:10b6:207:49::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 21:46:15 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 21:46:15 +0000
Subject: Re: [PATCH v2] drm/amdkfd: Fix out-of-bounds read in
 kdf_create_vcrat_image_cpu()
To: Jeremy Cline <jcline@redhat.com>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
References: <20210108163104.411442-1-jcline@redhat.com>
 <20210111210528.734483-1-jcline@redhat.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <48b5c6b7-3c48-2fb0-dfde-3aabd3c1ad0d@amd.com>
Date: Mon, 11 Jan 2021 16:46:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210111210528.734483-1-jcline@redhat.com>
Content-Language: en-US
X-Originating-IP: [142.117.121.176]
X-ClientProxiedBy: YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::16) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.121.176) by
 YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 21:46:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f7528171-8124-4704-1a11-08d8b67a524e
X-MS-TrafficTypeDiagnostic: BL0PR12MB2578:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB25787247DF7CAD0AE35B3F8A92AB0@BL0PR12MB2578.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pvbw6rt1TOwWIbfH/m9bii7VoQL/pgo8cHnF8GNM34UT6fK/nlnadc/nUafC3F7yIkwBHrxHAHfHAN84uST0mamRSZ7dtiZlym+uFN2reCrutQ+/ntH38sokA0GTRxmW1g7DctMJledmbpo6DHvpGCt2FDIudlsFw//NRXNh/pnYdoTS8M70rj+2O88rE0Bsru3GtrTT5Q0JNtX2ZNDGYkuNiCD/61V18eIIJtnIUCjF7nf9I8IY7CbOTE69NPeVMy0Zpb2vc16Vi0tDn9FNpSUi8wMNQ3QEhEp+CxVk4E2X/07TWovJFo7MSPAdkRDojKafBd/agQDOQAHOFzuAsKANCHbHS9g+y48yWl3j5Jn1bcH0PU9NBSS4nceqDTJWfvMChmx5go/isvJOLG/oKZmXOF4cSMaVbDUZmSEs2/rs1lhfqSTFwrr1pQS1eIVRbrMkuWUK5H6yNA6+/LtVwAjDM74Ss1IxZmlwDTfoWq0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(86362001)(956004)(6636002)(2616005)(4326008)(31696002)(16576012)(8676002)(66556008)(66476007)(66946007)(316002)(478600001)(2906002)(26005)(44832011)(16526019)(5660300002)(83380400001)(52116002)(36756003)(186003)(54906003)(8936002)(6486002)(110136005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZWtsN29rVkZUcm5uVXJsM09JRUkxUnRjR1dVcVU0Mm1ibHA5bHBuRWdoTm1L?=
 =?utf-8?B?ak5LSElhOW5ucEJOdXc1dVIyMTlzUTN0OU91L0luK3E2MFlDQU9TWlFuNG1T?=
 =?utf-8?B?YlB2U2E5RmVnUytHeHRuUnB4dWM1TEpmN0JRKzVUenYreWdpZW1LaTM3RUNL?=
 =?utf-8?B?NGFnTklJL3N3dFhnSGx1TXhQL2VWQXd6TXRkK3NQemJHSW1IU2Zxby9xd0pQ?=
 =?utf-8?B?dGdZRklqYmVqS2llK1pBbWY0dko3YlNXcGRzTjBOSWNYZVpJQkRCRDJkR2g1?=
 =?utf-8?B?VGx1azhORmdvbkVwWVU3RTFwUjNic0ptNzJjMWdSaWF2TGdxaDQ2S1dDbXVW?=
 =?utf-8?B?cHEzOHZRbmNNTEdQdnh2V0xmRlZyWEFqTkVxVXFsWG9TSS8raHBZSHg3SnlO?=
 =?utf-8?B?N1R4eEVSWEszUXNpT25Iei91YTRUYVBORlVZczZqbnFLT29GZlhyVUlLU016?=
 =?utf-8?B?eVBzY0ZMMjBtdEpCamt0NzhteGIxRkk3NElWUG5VM05ZbTRXUjNzU1BNdC95?=
 =?utf-8?B?RGF4UzRuKy9kUzlYUWVNOXgrQ0hiNWNHa2dKMUtNckRHbUZGL2cwcHVpekE0?=
 =?utf-8?B?eTVPV0xSbkd5eDg1QWtJWXJuS2J3VmN6N003UlVuVWE2UTZXOVB2U1kvWTFx?=
 =?utf-8?B?d3dQUElwbWlBUWt1ZUl3MUplS2lXRjNCK2cvaDdJV0pxYmZlb0I0MmNmc0ph?=
 =?utf-8?B?eE9ORlpoTUhHU2lCNFNvSE5YekF6Mms1ZHk2N2EyZjdWM2h4bllab0hKWkg4?=
 =?utf-8?B?bE5rdkxzTFA5bHJxSVBkRC9rR210eHdha3hmeXYrTTdySWxpUEQ3c01jbmI0?=
 =?utf-8?B?My95U25wekhvYkZlKzRaZk84RzY2UkVkQmQyNVhJdmlCZlFndStIa1lGSk5i?=
 =?utf-8?B?WWxta1NneTRaRjFDMkh1OG8rNFpQNmZaaDVUOXltTmEwNmxRc1RXR3o2d3A4?=
 =?utf-8?B?dkMrbVZPM2FrT3NHUmUramtmRmlmS1NsVEZTcnVaMVZTUDRSTlpuRmJ2Zm9L?=
 =?utf-8?B?L2t2c21kSmhlUmdHdU1kZ2R2cmgrUnVRWVlvMmNaRit1RlZsYnhDMEtYNUIw?=
 =?utf-8?B?RlduVDhDdEV6Snh3WTQ3Uit1Sm9ONlJzeHBaYkVkdk5ObG5XRjEyYVFYUG9S?=
 =?utf-8?B?d25sNktwOUxPazhFdVVtWGh0U1lCY05ZaStZL0srdEZLL0wrbE45RGs5ZG1B?=
 =?utf-8?B?NmJRL0Q1cFowM1V3UnhtSzRUeUZnbGZJODM4emp1WEt1ZmV5Vm5LY0ZycHdB?=
 =?utf-8?B?cXR2ZTZRVzhmQUwrQVhtekt6ZzdnTUZscHAzd0Y4blI5M3VaMTJRUnNFbXY3?=
 =?utf-8?Q?TcycXFutJMspouGWiBx+t1ZLZqAyV8gYgj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 21:46:15.5134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: f7528171-8124-4704-1a11-08d8b67a524e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kEySMFvqtuoo3DCoM1CFJTN8JkS/L9ZoSVFIWps4FL6sXIjN+6AEPqGmC49P6DwQi6Zj1udQn4MRxwNDcVUXng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2578
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Kent Russell <kent.russell@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2021-01-11 um 4:05 p.m. schrieb Jeremy Cline:
> KASAN reported a slab-out-of-bounds read of size 1 in
> kdf_create_vcrat_image_cpu().
>
> This occurs when, for example, when on an x86_64 with a single NUMA node
> because kfd_fill_iolink_info_for_cpu() is a no-op, but afterwards the
> sub_type_hdr->length, which is out-of-bounds, is read and multiplied by
> entries. Fortunately, entries is 0 in this case so the overall
> crat_table->length is still correct.
>
> Check if there were any entries before de-referencing sub_type_hdr which
> may be pointing to out-of-bounds memory.
>
> Fixes: b7b6c38529c9 ("drm/amdkfd: Calculate CPU VCRAT size dynamically (v2)")
> Suggested-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Signed-off-by: Jeremy Cline <jcline@redhat.com>

Thanks. I'll apply this patch.

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_crat.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
> index 8cac497c2c45..a5640a6138cf 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
> @@ -1040,11 +1040,14 @@ static int kfd_create_vcrat_image_cpu(void *pcrat_image, size_t *size)
>  				(struct crat_subtype_iolink *)sub_type_hdr);
>  		if (ret < 0)
>  			return ret;
> -		crat_table->length += (sub_type_hdr->length * entries);
> -		crat_table->total_entries += entries;
>  
> -		sub_type_hdr = (typeof(sub_type_hdr))((char *)sub_type_hdr +
> -				sub_type_hdr->length * entries);
> +		if (entries) {
> +			crat_table->length += (sub_type_hdr->length * entries);
> +			crat_table->total_entries += entries;
> +
> +			sub_type_hdr = (typeof(sub_type_hdr))((char *)sub_type_hdr +
> +					sub_type_hdr->length * entries);
> +		}
>  #else
>  		pr_info("IO link not available for non x86 platforms\n");
>  #endif
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
