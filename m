Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96614380E25
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 18:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F2D6E214;
	Fri, 14 May 2021 16:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617776E213;
 Fri, 14 May 2021 16:26:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cy0US7BFO7gYRa5S+aHnj57Rvb80sZ8WazJ388CRjlz6aeIzmIz3h9p+nX4gzGsCQ6Cs6d8tEb/lF+MruM4rMRu8Sz5eNfmEdwVhPkzXdwKpGR8bUhkYX+aJ8jg5+023zZhK0tz9rR0sbLaHmrS8vo0HlKYY4ND0CDefoqc8Mwejr6jsv81hY8+ov+Hx7kgvI54NDjIMaEAZQWN9hEeKvqhMUpMRXgmiPGg8qGrCRaQfYjz5Ojv6/vcgn9PUO8JuQslVIPqWBndPayrdJmHED/M2XyzOhZCp2ArEF61EKHT/GKo08mt6MDg5S7v2BY/H0WdUn1zSQU2Mx56KitkgAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CgVQHUFNO8Bg4qNp3Ac/Lh6Rfy9GKpdipZYsuRQPQ8=;
 b=lqiTsoLRTMbj+7FBRLpkmzwzzu7NElRoax/UySGFUu48LQIvVch1rp/o/OmlaUDhx2WXHqXenaXQkIGwHPJISt8rlJnmXtCIii0a75/UwKoFKnL9r2/M2umvwMEb+Brs+PGFPuJhVYvqdm78z30oZRpTVsiXNfbizemoamMvVFR5z51MuipoFPTuog6esnvDHb3DIklusSPMclxwruc26n48Z7aR63yvNvPwxsO+pW6SWjxcBef6F3BdKxh0cJNykdjc+MgLwYmvQC5jN9MDgIA5clVcG9/VP9+0bmqrzPGrRQI7t2XSE8SYcpM8YnW1/5yY8JmkkTmN/s3T1huKqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CgVQHUFNO8Bg4qNp3Ac/Lh6Rfy9GKpdipZYsuRQPQ8=;
 b=csilHH5vUrfHy6iFY8yNLPaG19KI+iFrhTkdXVxoEZo/sohKRfYuyMP73Yo7GuMb6KdDeqg0sxU/O2XSDwyUxBxj4fLio0j6J7rYjab3MTXHEFNsIIlBzf/niozoEGv3UVJTLILpiTV14JApn2yu+vkWusAOwRo9pI8rXJ4LO/Y=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2752.namprd12.prod.outlook.com (2603:10b6:805:78::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 14 May
 2021 16:26:47 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.026; Fri, 14 May 2021
 16:26:47 +0000
Subject: Re: [PATCH v7 05/16] drm/amdgpu: Handle IOMMU enabled case.
To: Felix Kuehling <felix.kuehling@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org,
 ckoenig.leichtzumerken@gmail.com, daniel.vetter@ffwll.ch,
 Harry.Wentland@amd.com
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-6-andrey.grodzovsky@amd.com>
 <996a4ded-08da-7c27-5e79-6b408d8c43b0@amd.com>
 <32b61077-f760-8fe0-c00f-256a97d2977e@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <1a83263f-ad9e-308a-a87d-ee77024f0a1f@amd.com>
Date: Fri, 14 May 2021 12:26:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <32b61077-f760-8fe0-c00f-256a97d2977e@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:b032:ea3c:6be8:9a44]
X-ClientProxiedBy: YTOPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::25) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:b032:ea3c:6be8:9a44]
 (2607:fea8:3edf:49b0:b032:ea3c:6be8:9a44) by
 YTOPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Fri, 14 May 2021 16:26:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1128a61d-2893-4da1-0f6f-08d916f5120a
X-MS-TrafficTypeDiagnostic: SN6PR12MB2752:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB27524E719991BFFBD1F2E879EA509@SN6PR12MB2752.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aMTgFk9ePnsmZ75B0cPvubw8A1VFv3pQakzjPgT2GUIdMTnK0TtmV+iaYR81EMfzdope3P4/TpK4uhzPCQFzzq0GjItidnEzyRVhIygXUrYUf1TNhF7e9W04lRA/nu8p0bsv52tvFmiTaNtaCei6oEVOWIQiOBY35BlDz5RbNR7LH/LbCGwHsmYFKgzoHK5y5oFhQMOwvZSdFxtLPyht2edivyEk4SNdIJdbTC0hieV+INgDp3f+SMPMn7sDV9jqeF33b4YZRNncn8KNqMOMiwzzO+Df8w6CzJEhOj2EPMyavw0X0p/Nf42hAf0Pu2cF1yRKepiVSUhP6dlzR4V/1q/kCNhlhkp4kItqEG3aaBJz2sPIy2WzpdLtrgvroVHAvf9G0vCQQ0edHTIv0pN5fHD6kHEc32xUj9ApSZTlPoEBZMIX1gCTBC8Vp8iHGfYw1jy74tahXBNaAXlrdUbtL9t1MmW33fLRZIDmfxrtiu5zj0t4re4TYuJkX62qcoVSHPdkW9nsl4obLePjyMOlcykCFSX1kLtTYPZl3/4cmQljuCMsKlMNV+fwvH5FyAk9kTgL0autbcDejTf8bXwP7qqAAebm4Iuu6CP8RRuF6Gtgn/dpw9dXotv/MiDGWJhORZNhSiSQYORU+cWDHfNgSIg2eMmstRBmUkArX+dDy0p6l9DLERFg6o1tFFr60E/7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(8676002)(8936002)(4326008)(36756003)(2906002)(52116002)(66476007)(5660300002)(44832011)(2616005)(6636002)(30864003)(16526019)(186003)(316002)(6666004)(86362001)(31696002)(83380400001)(31686004)(53546011)(66556008)(66946007)(38100700002)(478600001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UlZkcTV5U3ZPOWsyZG5nYlJkaVBnYm5jN09NaGVUU0p6ditSQzk2ZHpTSmlx?=
 =?utf-8?B?Z3YrVldkb2kyOW5lcjRNQ2RKLzJhMmJYL0MxbW5JKzF5ZVhIelZCUkJuQldn?=
 =?utf-8?B?bDlubXpaZ3R6eStvLzYwL3Y2MVgvN01pVWMyV0o0WXRnRnRxd2xVZy9BYWFZ?=
 =?utf-8?B?N2s3b2ZCR01wT2NWbjdMdExaNy9uMi9CRHhvYmFFaTJsOUJvdWV6RVV1TWMv?=
 =?utf-8?B?NjQvaWlRaGltVkdnTEpzbllTcU5QaVBwV1p4MVJpelhqdDIxTTNhQXlDNUNO?=
 =?utf-8?B?VUZOTWNaRzlnRjVIWUhPZGZCUUtUOFZOblh1ZDZFbnM2eTlURDRsUytHTE5B?=
 =?utf-8?B?SGJuM3UwcUVGa0EwbUZZMGRoOUMrcE53RWxGVVJhN2wzaCt6SjkvTU9selpT?=
 =?utf-8?B?MXExNzBiZTNBR295MWFxRzhTbjN3elpqYXVQQkdnWXljWnBrVDFhWVhXbExI?=
 =?utf-8?B?Rk1yV0JOZDZETGltWTNBcTV4QjFGUUEreGRTalRsMlI5TDdWQUFUOFREQVAr?=
 =?utf-8?B?ckloZ1BLTnRxbkZUS3dPY24wNE5UakZMUk8vUTBFb1hmR3c2ZStVYzhGM05J?=
 =?utf-8?B?OHNjcW5QVisvSHpJTkJIQzRXamtvM2lHWWk2Qk5iTzlkSXNjR29mdFZHMFlG?=
 =?utf-8?B?QjJtMkNRQWxlZVh2Zmx3cmxGV1JvU2pNMWNoUjNtT0c4TWVXa29Sc0FnY0lv?=
 =?utf-8?B?SjNHOG9Jell3SEM3Zm0zdDRTTXRPNXBudmQ5OHE0eGRXK2ZOemtzUmRRVHMw?=
 =?utf-8?B?VWlSelpZWk03UVBYN2RzamRaQWJrQmtaU0lPL1d0bG1pRHEra0UzdTNoRHhz?=
 =?utf-8?B?RVIzclNNbm9panRMVHVsYm1NTFlwVnFxWEhlTXJ6bVF0UEdQRTVFQVZESXky?=
 =?utf-8?B?YkVQTzArV3MxZDRKNy9nRW5hUFRlc210TXF1RWVSaGJ4Z05hc1JybnZwNjB3?=
 =?utf-8?B?ZjZBc3ZMSlhVbHlKRkEyQ2EyNHJOZ2xCK3dlWFlkRFl5alNvRWZwcGdFM2Rv?=
 =?utf-8?B?VVp1bnU2T0N0NHhXQ3lzbUxHcmc2Y2pQWE9ZMyt2L3ZHcWtGOFBEUUMxcW1l?=
 =?utf-8?B?Sy9EK1NlWUJPbER2VHNsSzdIeHN5Z3VQWEJ6QXN1VktjMittNUhQdmtVMGVr?=
 =?utf-8?B?WWNHMktZK2F1TzRzUVJsUDVJdkJTcVhHbW0rM0xNSWtsWUNQSFZQZkRFdmht?=
 =?utf-8?B?K3hTSUpZSGFIRWdGNFVHTWhjZ0VibkNTYkF0OVllc3loL1ZlSkdEWHl3a3Ez?=
 =?utf-8?B?S3U4b0Y4Tkd3NTBPaU93T0ZDU21zSUgxNWllbkx3YnRoRFJ0aXRIZTJybnZ2?=
 =?utf-8?B?VUZhU0VDT254K281aklLOHJwZXpidXJncGpTNm5leENPL0xIKzN6WC9iR2FT?=
 =?utf-8?B?bjEyYVgzVi9BU2ExOUlyeEVwL3FoYjhHNWdQSXoxS2tXT09qVlkraHQ4NWk1?=
 =?utf-8?B?RFkrRi9rcjFKYnB1Y25lRCs2dk50TnBRTGZJNE5TeXJvY1dwczUxQ0h5S2V3?=
 =?utf-8?B?WDlaSjl5SStidytXWlptbVNHcEJMTGZsakUxQ2g3c2llbDF2YSs5SllVQ1E5?=
 =?utf-8?B?VTczc3hoZnN2bGJJTE1DblJneW5IWkZpZjFSMjdiTmhmRVJvai8wblBVYkJq?=
 =?utf-8?B?amNZKzJML0lWaFZaVFhsL2g2amZKNjBXck8rczR5QitEZENYVlMvenNQTTQr?=
 =?utf-8?B?TTRGYy9Ca2tETkV1T0tyNnpXS1pWK1VHejM1RmFXNGxzR0NVQ3c4cytrT2Fa?=
 =?utf-8?B?RzlyWVgvVW9udHVXSm9kMW1EajE1YjR5b1J1bnZjRUdFVkhvbTUraElKdytV?=
 =?utf-8?B?Y3dlazJXUDc2Wm9FbEx3eDR1aWJqeEZZa0FXTGdmWHM3c2sxeVJjNWJSa2NL?=
 =?utf-8?Q?huEYQuoP7gNAz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1128a61d-2893-4da1-0f6f-08d916f5120a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 16:26:47.6872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YCTgQOITymFZMfX/GmJJLLhiVcySWNO8b9V49SSrfPGIlcBCCo5sgNiVJ2lLTkpn5IH3XLomVIxsjer2+28+dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2752
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Makes sense - will update.

Andrey

On 2021-05-14 12:25 p.m., Felix Kuehling wrote:
> Maybe this patch needs a better explanation how the GART and IH changes
> relate to IOMMU or what's the problem this is meant to fix. Just looking
> at the patch I don't see the connection. Looks like just a bunch of
> refactoring to me.
> 
> Regards,
>    Felix
> 
> 
> Am 2021-05-14 um 10:41 a.m. schrieb Andrey Grodzovsky:
>> Ping
>>
>> Andrey
>>
>> On 2021-05-12 10:26 a.m., Andrey Grodzovsky wrote:
>>> Handle all DMA IOMMU gropup related dependencies before the
>>> group is removed.
>>>
>>> v5: Drop IOMMU notifier and switch to lockless call to ttm_tt_unpopulate
>>> v6: Drop the BO unamp list
>>> v7:
>>> Drop amdgpu_gart_fini
>>> In amdgpu_ih_ring_fini do uncinditional  check (!ih->ring)
>>> to avoid freeing uniniitalized rings.
>>> Call amdgpu_ih_ring_fini unconditionally.
>>>
>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  4 ++--
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c   | 14 +-------------
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h   |  2 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c     |  6 ++++--
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    |  5 +++++
>>>    drivers/gpu/drm/amd/amdgpu/cik_ih.c        |  1 -
>>>    drivers/gpu/drm/amd/amdgpu/cz_ih.c         |  1 -
>>>    drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c     |  1 -
>>>    drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c      |  1 -
>>>    drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c      |  1 -
>>>    drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c      |  1 -
>>>    drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c      |  1 -
>>>    drivers/gpu/drm/amd/amdgpu/iceland_ih.c    |  1 -
>>>    drivers/gpu/drm/amd/amdgpu/navi10_ih.c     |  4 ----
>>>    drivers/gpu/drm/amd/amdgpu/si_ih.c         |  1 -
>>>    drivers/gpu/drm/amd/amdgpu/tonga_ih.c      |  1 -
>>>    drivers/gpu/drm/amd/amdgpu/vega10_ih.c     |  4 ----
>>>    drivers/gpu/drm/amd/amdgpu/vega20_ih.c     |  4 ----
>>>    18 files changed, 13 insertions(+), 40 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index 18598eda18f6..a0bff4713672 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -3256,7 +3256,6 @@ static const struct attribute
>>> *amdgpu_dev_attributes[] = {
>>>        NULL
>>>    };
>>>    -
>>>    /**
>>>     * amdgpu_device_init - initialize the driver
>>>     *
>>> @@ -3698,12 +3697,13 @@ void amdgpu_device_fini_hw(struct
>>> amdgpu_device *adev)
>>>            amdgpu_ucode_sysfs_fini(adev);
>>>        sysfs_remove_files(&adev->dev->kobj, amdgpu_dev_attributes);
>>>    -
>>>        amdgpu_fbdev_fini(adev);
>>>          amdgpu_irq_fini_hw(adev);
>>>          amdgpu_device_ip_fini_early(adev);
>>> +
>>> +    amdgpu_gart_dummy_page_fini(adev);
>>>    }
>>>      void amdgpu_device_fini_sw(struct amdgpu_device *adev)
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
>>> index c5a9a4fb10d2..6460cf723f0a 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
>>> @@ -92,7 +92,7 @@ static int amdgpu_gart_dummy_page_init(struct
>>> amdgpu_device *adev)
>>>     *
>>>     * Frees the dummy page used by the driver (all asics).
>>>     */
>>> -static void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
>>> +void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
>>>    {
>>>        if (!adev->dummy_page_addr)
>>>            return;
>>> @@ -365,15 +365,3 @@ int amdgpu_gart_init(struct amdgpu_device *adev)
>>>          return 0;
>>>    }
>>> -
>>> -/**
>>> - * amdgpu_gart_fini - tear down the driver info for managing the gart
>>> - *
>>> - * @adev: amdgpu_device pointer
>>> - *
>>> - * Tear down the gart driver info and free the dummy page (all asics).
>>> - */
>>> -void amdgpu_gart_fini(struct amdgpu_device *adev)
>>> -{
>>> -    amdgpu_gart_dummy_page_fini(adev);
>>> -}
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
>>> index a25fe97b0196..030b9d4c736a 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
>>> @@ -57,7 +57,7 @@ void amdgpu_gart_table_vram_free(struct
>>> amdgpu_device *adev);
>>>    int amdgpu_gart_table_vram_pin(struct amdgpu_device *adev);
>>>    void amdgpu_gart_table_vram_unpin(struct amdgpu_device *adev);
>>>    int amdgpu_gart_init(struct amdgpu_device *adev);
>>> -void amdgpu_gart_fini(struct amdgpu_device *adev);
>>> +void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev);
>>>    int amdgpu_gart_unbind(struct amdgpu_device *adev, uint64_t offset,
>>>                   int pages);
>>>    int amdgpu_gart_map(struct amdgpu_device *adev, uint64_t offset,
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
>>> index faaa6aa2faaf..433469ace6f4 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
>>> @@ -115,9 +115,11 @@ int amdgpu_ih_ring_init(struct amdgpu_device
>>> *adev, struct amdgpu_ih_ring *ih,
>>>     */
>>>    void amdgpu_ih_ring_fini(struct amdgpu_device *adev, struct
>>> amdgpu_ih_ring *ih)
>>>    {
>>> +
>>> +    if (!ih->ring)
>>> +        return;
>>> +
>>>        if (ih->use_bus_addr) {
>>> -        if (!ih->ring)
>>> -            return;
>>>              /* add 8 bytes for the rptr/wptr shadows and
>>>             * add them to the end of the ring allocation.
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>>> index 233b64dab94b..32ce0e679dc7 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>>> @@ -361,6 +361,11 @@ void amdgpu_irq_fini_hw(struct amdgpu_device *adev)
>>>            if (!amdgpu_device_has_dc_support(adev))
>>>                flush_work(&adev->hotplug_work);
>>>        }
>>> +
>>> +    amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
>>> +    amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>> +    amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
>>> +    amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
>>>    }
>>>      /**
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
>>> b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
>>> index 183d44a6583c..df385ffc9768 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
>>> @@ -310,7 +310,6 @@ static int cik_ih_sw_fini(void *handle)
>>>        struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>>          amdgpu_irq_fini_sw(adev);
>>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>>        amdgpu_irq_remove_domain(adev);
>>>          return 0;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
>>> b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
>>> index d32743949003..b8c47e0cf37a 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
>>> @@ -302,7 +302,6 @@ static int cz_ih_sw_fini(void *handle)
>>>        struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>>          amdgpu_irq_fini_sw(adev);
>>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>>        amdgpu_irq_remove_domain(adev);
>>>          return 0;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>> index 2bfd620576f2..5e8bfcdd422e 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>> @@ -954,7 +954,6 @@ static int gmc_v10_0_sw_init(void *handle)
>>>    static void gmc_v10_0_gart_fini(struct amdgpu_device *adev)
>>>    {
>>>        amdgpu_gart_table_vram_free(adev);
>>> -    amdgpu_gart_fini(adev);
>>>    }
>>>      static int gmc_v10_0_sw_fini(void *handle)
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
>>> index 405d6ad09022..0e81e03e9b49 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
>>> @@ -898,7 +898,6 @@ static int gmc_v6_0_sw_fini(void *handle)
>>>        amdgpu_vm_manager_fini(adev);
>>>        amdgpu_gart_table_vram_free(adev);
>>>        amdgpu_bo_fini(adev);
>>> -    amdgpu_gart_fini(adev);
>>>        release_firmware(adev->gmc.fw);
>>>        adev->gmc.fw = NULL;
>>>    diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>> index 210ada2289ec..0795ea736573 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>> @@ -1085,7 +1085,6 @@ static int gmc_v7_0_sw_fini(void *handle)
>>>        kfree(adev->gmc.vm_fault_info);
>>>        amdgpu_gart_table_vram_free(adev);
>>>        amdgpu_bo_fini(adev);
>>> -    amdgpu_gart_fini(adev);
>>>        release_firmware(adev->gmc.fw);
>>>        adev->gmc.fw = NULL;
>>>    diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>> index c1bd190841f8..dbf2e5472069 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>> @@ -1194,7 +1194,6 @@ static int gmc_v8_0_sw_fini(void *handle)
>>>        kfree(adev->gmc.vm_fault_info);
>>>        amdgpu_gart_table_vram_free(adev);
>>>        amdgpu_bo_fini(adev);
>>> -    amdgpu_gart_fini(adev);
>>>        release_firmware(adev->gmc.fw);
>>>        adev->gmc.fw = NULL;
>>>    diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>> index c82d82da2c73..5ed0adae05cf 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>> @@ -1601,7 +1601,6 @@ static int gmc_v9_0_sw_fini(void *handle)
>>>        amdgpu_gart_table_vram_free(adev);
>>>        amdgpu_bo_unref(&adev->gmc.pdb0_bo);
>>>        amdgpu_bo_fini(adev);
>>> -    amdgpu_gart_fini(adev);
>>>          return 0;
>>>    }
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
>>> b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
>>> index da96c6013477..ddfe4eaeea05 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
>>> @@ -301,7 +301,6 @@ static int iceland_ih_sw_fini(void *handle)
>>>        struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>>          amdgpu_irq_fini_sw(adev);
>>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>>        amdgpu_irq_remove_domain(adev);
>>>          return 0;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
>>> b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
>>> index 5eea4550b856..941d464a2b47 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
>>> @@ -570,10 +570,6 @@ static int navi10_ih_sw_fini(void *handle)
>>>        struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>>          amdgpu_irq_fini_sw(adev);
>>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
>>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
>>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
>>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>>          return 0;
>>>    }
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c
>>> b/drivers/gpu/drm/amd/amdgpu/si_ih.c
>>> index 751307f3252c..9a24f17a5750 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
>>> @@ -176,7 +176,6 @@ static int si_ih_sw_fini(void *handle)
>>>        struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>>          amdgpu_irq_fini_sw(adev);
>>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>>          return 0;
>>>    }
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
>>> b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
>>> index 973d80ec7f6c..b08905d1c00f 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
>>> @@ -313,7 +313,6 @@ static int tonga_ih_sw_fini(void *handle)
>>>        struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>>          amdgpu_irq_fini_sw(adev);
>>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>>        amdgpu_irq_remove_domain(adev);
>>>          return 0;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
>>> b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
>>> index dead9c2fbd4c..32ec4b8e806a 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
>>> @@ -514,10 +514,6 @@ static int vega10_ih_sw_fini(void *handle)
>>>        struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>>          amdgpu_irq_fini_sw(adev);
>>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
>>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
>>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
>>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>>          return 0;
>>>    }
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
>>> b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
>>> index 58993ae1fe11..f51dfc38ac65 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
>>> @@ -566,10 +566,6 @@ static int vega20_ih_sw_fini(void *handle)
>>>        struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>>          amdgpu_irq_fini_sw(adev);
>>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
>>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
>>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
>>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>>          return 0;
>>>    }
>>>
