Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5B537AB0D
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 17:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBFE6EA6E;
	Tue, 11 May 2021 15:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FB16EA6B;
 Tue, 11 May 2021 15:46:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRGgz0yUfUsjFYzDkg+TAg7XEi1M4UHlca2e47t9XFGJ1TvUJVhVAb1GkjLwEBZCnr6Gvi8TcYHX/nqFMrck2M+LurCTG9v7TwJtnBuCGYv41RwxFEmxGiCY9xQGdfomsAvKokuUruNWWg0LKsFERFavc0jiFWQeNzZXqiCd3g9VgJFMNsAcbsiw/67Cfh6sVkqp/jE42bQ86NpOj4SB2gFVpxu5CQZ+NOyBkmsTBVTvHNk9oBkqBP4EX30iEkYwcofq85YBuC+nqDcEoBwi47yKJhSopDSFLT9nNe+tSnLXMXlI28vx3s+mU7bZtftDHmeHEEkQILySC+oTTkYesA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTWVsDR2Ck+BTVHt3LO8UvAcnn1embFYblgwNhlcaBU=;
 b=Xpp0o8QC8NXLMGiSTSLCce/NfpX5M+7MNWtTWr62LnzaXwKS83KkF8FXbAzbs9rPy6g2qvqKz7uYIUc5KEKGxRVaLoZlSBUD2ZShkVOv7ApT9dob3FsKbkSCakEKHweZqtV6eRrsFAP13WyYDxZ/PPralN+cFa/sQTl8WgyUULWEEuPXhx0Z1g7QnHaUDht8vQ1DTUVJCr/eigcRIwVO6ochH9nCrZeNsthUOLFJyJ2rb14axQseynoG4XYeVleFbpA3jXADE4EWAD8llzaCjlyeplv4mTZwx6r0eVNNbR22dyu/uL8JzD2DmxyYV6phIyinAW0R2lwDyHzhwkM+6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTWVsDR2Ck+BTVHt3LO8UvAcnn1embFYblgwNhlcaBU=;
 b=GW2mqS234twob7/BvMl/FYzdam1kF0C1p1oCd/wajksOfxJbocQBkbge9LkwSZaMbH7M01RMeAKcanVAPYRsza3vUFI14eHyn6w/xxRBVKNB7toz623yhXigYMl+q0mQ32WSTOsetAxCXeupxPyJ0+gNNrjcDIzxCDjZNXulaGY=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4576.namprd12.prod.outlook.com (2603:10b6:806:93::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Tue, 11 May
 2021 15:46:21 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 15:46:21 +0000
Subject: Re: [PATCH v6 06/16] drm/amdgpu: Handle IOMMU enabled case.
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
 <20210510163625.407105-7-andrey.grodzovsky@amd.com>
 <2debf57e-e775-8e47-6862-489bada7701c@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <9906aea6-5f49-2651-2fbc-b3a1ca49c295@amd.com>
Date: Tue, 11 May 2021 11:46:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <2debf57e-e775-8e47-6862-489bada7701c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3]
X-ClientProxiedBy: YTXPR0101CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::31) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3]
 (2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3) by
 YTXPR0101CA0054.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Tue, 11 May 2021 15:46:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ef4d244-a27a-4886-1345-08d91493ec70
X-MS-TrafficTypeDiagnostic: SA0PR12MB4576:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB45766C07B0B0AED86C1504FDEA539@SA0PR12MB4576.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c6g7SqDo+BreDv4J6UZdTYJGnqKvcbra2QlNGDrMmRE3NamHMJUKI3v/3Cdqi2vCZQvVLFvOc5dJoLGcCpz+lW3v0S6GuocamgdJEoP9KP5f3DHwXK1hMr7xqTMZE9m9UcvzZkKO5D7oadyRoM22mYdr6B1XvdiBpKsNlEAFoc3G9CSMPKyB74qbopXrNIumvHLqq08rUkvw86l/f42r8NqUb/dK96uxf+dXe/c2CCpCONlRnb+DIgplVUC/17E0LlZJ5My1nsDrgnXjdUVm4Udxjx+RbURK72Hbw1VudYQomGcHhzFWpQ5qzxAl6nmJlKXJ4NA++ovnNPGqFdxu1xs2fiaOz0CXlcjv11MEXSOrsAR6nR5NI9JZwZKr/yC/JLAhwvQHpnE0sunnG1jXZn4x9eU9sMUg+dS+SBti0HOYnUFc/4Eyw5H3mcdpf/gEWyf/8zL4AgYP8VebXO97JbQlh6U2Ys1REjQBDg1tE4I8PG28pJd0lVQ6USMqLTcPiTRTTcVDZK4Jkn/2msLsR1hQKIFB+nGeo6pp9cIMAnx+mzSGiwBjdViJhNe1nOE/bpvnn0CVtIrLrTHlCJRPP9aPsP4ZnYjf4PwT6Sm2xbbqrp4ldxF/o+7yMOytDql6OjcDQ7tc4hdDlXge72LbVC0amXD6n9COAwljFnQ0SWM1C86VCS59M3nAhcoDcUds
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(5660300002)(186003)(38100700002)(66574015)(86362001)(16526019)(83380400001)(8676002)(52116002)(36756003)(2616005)(66476007)(66946007)(2906002)(8936002)(66556008)(31696002)(498600001)(53546011)(44832011)(6636002)(6486002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L1FrZzVvZEU5bzk5SzBCWEFQejhJcFNKTDVkald1RVVZWHpleVMydE1UdVBH?=
 =?utf-8?B?SWprTUpGQjBMWlJpWFQxcmJ6YVdvV05MZm9veTRnVWt5MkFFTkt4cm9mTjYy?=
 =?utf-8?B?M0x4UW9rSUlZcWNiY2Y3NzB6MDlaYTlSRzRsNFIyRVVLYXEyWUEvNkdpQmVP?=
 =?utf-8?B?ZzhYTWZyVjVQeWFRdkdlOG1mTnEwbDJ1dVE5dXlBTGZJRndmSXFGMWNtOGhz?=
 =?utf-8?B?QVBhZ05JS1M0RTVxVkNNeC81VzE2NC9hOEYxNjY2NVRCR0VlcmdKS3R2RHFl?=
 =?utf-8?B?SkF3NUd1UmxvT1NPYndHYmEybUkybU52MFk4dkY0cmFPa3hXZmxBN242Sk5B?=
 =?utf-8?B?KzhkVDNnYW1lYjV3Y09lVWNRM0Z4dkI4aCtrcEU2TGFmTnpyODl0VVBxTUhn?=
 =?utf-8?B?dGNMTFBhTEZKZnNvb0NwOFRSLzBSNTVvZHlCWDBpTXdianNubFJNYjZDaHRr?=
 =?utf-8?B?bVFZK3k5M1FGMERHNEN4UFlaMU9GRlp6TC8rZWlKd2RrajVzT1lWWlpaV1BT?=
 =?utf-8?B?b3E3ZTlBV0NVdHMzUVZVZGtSTm1jRERBQ2ppaWlMdHVNZ1hwd001cWlLNy9w?=
 =?utf-8?B?SXh6OGlyWnpIdC9CTkYrUGtaamVOeHE5U3h6dGtSbDBmT3BsZjMwTzNQY3p5?=
 =?utf-8?B?VjJvMmk5YTBhNm4zdUt5S0Q0RGEyWktKQWFkcm5HcHpnVGYrWlBZMFdabWM1?=
 =?utf-8?B?RE11dHk2MjhIaUlxSWlzQ283cklicEZIRjF6RytvL2k1Zkk0RWV5ZVYyUEN6?=
 =?utf-8?B?MG1aV0pnbWZRbzg0cS9oZ3k0eXJrM3QvQnhmejNxcEFuVmhFZzJzK0NWWm5C?=
 =?utf-8?B?Zkd0Mkk1NW0wYkw3QlpLdWlvNHR4NE5oWWZlWmNtY203UGR3aEVLQ2dRYXpn?=
 =?utf-8?B?OXllemJXbytuZ1dRWWxRN3FCY012UWNhN2FkVlIwMFVXLzVjUzBsOGh2WlJs?=
 =?utf-8?B?MGJueXZRNWp5RnBZMGh6TnBVREVSUW1VK2ovTjNVVm9TVi9CVEJDRVVMWCtU?=
 =?utf-8?B?K0dwSTRRdGpmRTd2WWcvZ3hEZVFQb3VBemNZOWxhd0NTQ0h2Z2gvbElleC9s?=
 =?utf-8?B?OU1kWjI2SS9IOTZqbEJROE9LL3Q5TUl6aWpONzAzT1p3amRBUkRzOVBSNDlX?=
 =?utf-8?B?RkpicDJQeXhXOHZUVUtxRWJMYjIvVmcxK0p6RWZ0d01ESFN1dk9yeUdDZ2FN?=
 =?utf-8?B?WGhvK2Nldy9aOVA3N1k1THlBb1VQWVBoSWJLejdaVnRiQkpTaDNndVM2UndF?=
 =?utf-8?B?NmpDMnRLRC9xT0gzbHo2aGRJSUVWS0JzUTBPNUcvTGZZZUhsSzB6TFd3SzEx?=
 =?utf-8?B?TG1YSGFwOVNTcmR5NmJpQnJmZUVaVm1yTVZmS3JSaldrem5MZWQ1UVV2OTRU?=
 =?utf-8?B?bU8zRGZ6SGk4Mkl2b0hNRWZXdk1tSTZHNTgwZk8yZ3Y0djJCbXZWVERBUXk3?=
 =?utf-8?B?TyttTXlCNmQvYU5DSG5WcDBoZ1ZITkRwU0laclBRbEhEUVRBTkRLRkJCbXhC?=
 =?utf-8?B?VnU2UEJ3Vm1NRGl6blhKQy9iZTVmSHJFSE15V1pzU202aFJDaG5sQjh2MjVV?=
 =?utf-8?B?K2YvNjM1Wms4bFRMZGttNkxGbVhzVVF1SlAzL2JTYUh1UWliOEhOaGEzZUxO?=
 =?utf-8?B?cGU1cXd3Zk90ZlpVV0p0alU2dm5OOGs1dGtIcDFtR2l6ay9selRDSEVMVjRi?=
 =?utf-8?B?ZHNFdk51dlQ0MmpUWG05a0xEaGVvNldiMlF2dFhKa3dTcVROSmJGT09tdjVa?=
 =?utf-8?B?bFdWTnkvb1NvZm5jbmZZdTBVaUh2cGNraVk1T1NjRktQYmI0VERGVTVhOWl6?=
 =?utf-8?B?OGYyOTRWdXcxNTMvWlc2T2l4bmpSNUJmdmxBQnpyT1ZJWjd3dDhSRFJwdTYw?=
 =?utf-8?Q?OW9n4X3LFLRa0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef4d244-a27a-4886-1345-08d91493ec70
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 15:46:21.1090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQIvQjCSfWIz22nGGpzVglA1iPLin6DPcqNbbEmYrQSIqcnHBhWjYrAqu83r43dx9Th6CArTYd2Hu9WmgGoR1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4576
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-05-11 2:44 a.m., Christian König wrote:
> Am 10.05.21 um 18:36 schrieb Andrey Grodzovsky:
>> Handle all DMA IOMMU gropup related dependencies before the
>> group is removed.
>>
>> v5: Drop IOMMU notifier and switch to lockless call to ttm_tt_unpopulate
>> v6: Drop the BO unamp list
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c   | 3 +--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h   | 1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    | 9 +++++++++
>>   drivers/gpu/drm/amd/amdgpu/cik_ih.c        | 1 -
>>   drivers/gpu/drm/amd/amdgpu/cz_ih.c         | 1 -
>>   drivers/gpu/drm/amd/amdgpu/iceland_ih.c    | 1 -
>>   drivers/gpu/drm/amd/amdgpu/navi10_ih.c     | 3 ---
>>   drivers/gpu/drm/amd/amdgpu/si_ih.c         | 1 -
>>   drivers/gpu/drm/amd/amdgpu/tonga_ih.c      | 1 -
>>   drivers/gpu/drm/amd/amdgpu/vega10_ih.c     | 3 ---
>>   11 files changed, 13 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 18598eda18f6..a0bff4713672 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -3256,7 +3256,6 @@ static const struct attribute 
>> *amdgpu_dev_attributes[] = {
>>       NULL
>>   };
>> -
>>   /**
>>    * amdgpu_device_init - initialize the driver
>>    *
>> @@ -3698,12 +3697,13 @@ void amdgpu_device_fini_hw(struct 
>> amdgpu_device *adev)
>>           amdgpu_ucode_sysfs_fini(adev);
>>       sysfs_remove_files(&adev->dev->kobj, amdgpu_dev_attributes);
>> -
>>       amdgpu_fbdev_fini(adev);
>>       amdgpu_irq_fini_hw(adev);
>>       amdgpu_device_ip_fini_early(adev);
>> +
>> +    amdgpu_gart_dummy_page_fini(adev);
> 
> I think you should probably just call amdgpu_gart_fini() here.
> 
>>   }
>>   void amdgpu_device_fini_sw(struct amdgpu_device *adev)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
>> index c5a9a4fb10d2..354e68081b53 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
>> @@ -92,7 +92,7 @@ static int amdgpu_gart_dummy_page_init(struct 
>> amdgpu_device *adev)
>>    *
>>    * Frees the dummy page used by the driver (all asics).
>>    */
>> -static void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
>> +void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
>>   {
>>       if (!adev->dummy_page_addr)
>>           return;
>> @@ -375,5 +375,4 @@ int amdgpu_gart_init(struct amdgpu_device *adev)
>>    */
>>   void amdgpu_gart_fini(struct amdgpu_device *adev)
>>   {
>> -    amdgpu_gart_dummy_page_fini(adev);
>>   }
> 
> Well either you remove amdgpu_gart_fini() or just call 
> amdgpu_gart_fini() instead of amdgpu_gart_dummy_page_fini().
> 
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
>> index a25fe97b0196..78dc7a23da56 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
>> @@ -58,6 +58,7 @@ int amdgpu_gart_table_vram_pin(struct amdgpu_device 
>> *adev);
>>   void amdgpu_gart_table_vram_unpin(struct amdgpu_device *adev);
>>   int amdgpu_gart_init(struct amdgpu_device *adev);
>>   void amdgpu_gart_fini(struct amdgpu_device *adev);
>> +void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev);
>>   int amdgpu_gart_unbind(struct amdgpu_device *adev, uint64_t offset,
>>                  int pages);
>>   int amdgpu_gart_map(struct amdgpu_device *adev, uint64_t offset,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>> index 233b64dab94b..a14973a7a9c9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>> @@ -361,6 +361,15 @@ void amdgpu_irq_fini_hw(struct amdgpu_device *adev)
>>           if (!amdgpu_device_has_dc_support(adev))
>>               flush_work(&adev->hotplug_work);
>>       }
>> +
>> +    if (adev->irq.ih_soft.ring)
>> +        amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
>> +    if (adev->irq.ih.ring)
>> +        amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>> +    if (adev->irq.ih1.ring)
>> +        amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
>> +    if (adev->irq.ih2.ring)
>> +        amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
> 
> You should probably make the function NULL save instead of checking here.
> 
> Christian.

Agree, in fact it's already does this check inside amdgpu_ih_ring_fini
so I will just drop the checks.

Andrey

> 
>>   }
>>   /**
>> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c 
>> b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
>> index 183d44a6583c..df385ffc9768 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
>> @@ -310,7 +310,6 @@ static int cik_ih_sw_fini(void *handle)
>>       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>       amdgpu_irq_fini_sw(adev);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>       amdgpu_irq_remove_domain(adev);
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c 
>> b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
>> index d32743949003..b8c47e0cf37a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
>> @@ -302,7 +302,6 @@ static int cz_ih_sw_fini(void *handle)
>>       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>       amdgpu_irq_fini_sw(adev);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>       amdgpu_irq_remove_domain(adev);
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c 
>> b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
>> index da96c6013477..ddfe4eaeea05 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
>> @@ -301,7 +301,6 @@ static int iceland_ih_sw_fini(void *handle)
>>       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>       amdgpu_irq_fini_sw(adev);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>       amdgpu_irq_remove_domain(adev);
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c 
>> b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
>> index 5eea4550b856..e171a9e78544 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
>> @@ -571,9 +571,6 @@ static int navi10_ih_sw_fini(void *handle)
>>       amdgpu_irq_fini_sw(adev);
>>       amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>       return 0;
>>   }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c 
>> b/drivers/gpu/drm/amd/amdgpu/si_ih.c
>> index 751307f3252c..9a24f17a5750 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
>> @@ -176,7 +176,6 @@ static int si_ih_sw_fini(void *handle)
>>       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>       amdgpu_irq_fini_sw(adev);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>       return 0;
>>   }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c 
>> b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
>> index 973d80ec7f6c..b08905d1c00f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
>> @@ -313,7 +313,6 @@ static int tonga_ih_sw_fini(void *handle)
>>       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>       amdgpu_irq_fini_sw(adev);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>       amdgpu_irq_remove_domain(adev);
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c 
>> b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
>> index dead9c2fbd4c..d78b8abe993a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
>> @@ -515,9 +515,6 @@ static int vega10_ih_sw_fini(void *handle)
>>       amdgpu_irq_fini_sw(adev);
>>       amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>       return 0;
>>   }
> 
