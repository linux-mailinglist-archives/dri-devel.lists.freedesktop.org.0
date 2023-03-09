Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEF76B2478
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 13:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8127310E805;
	Thu,  9 Mar 2023 12:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E8B10E176;
 Thu,  9 Mar 2023 12:45:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8shdw2dVO+RVNfKHhPQC9r+KFxEjBDptd8oCrknHkuG0cdUQu1nolfKdqvYNBEDojpjayUjcw3IbHrE3axrpxuhrdrdEcPtmD8ogth3A3HOFK8f/eRsEIBzPovAYu1Z5uTxv3hrWhHlz0zr35A12m6S18wLmum74BtmyUZ6tVkL1WoWTe68wUupAmwtTQiekSZaN4IllcLXRBzBgYt/nDr+dkF0+WUxeiJstUsBcPQY0QdJoACfFVD1xygg7UMhY40Mmp0r1KEy1bdxa8iuH81ykv4wJ4Me8u9JAUjIJrpz1GsFf80cHzoKgLVGpLNhMxXJDyN+YJFq5m5Sizmfhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0q9CPB3kwxZW104r42pi3tVa+xNFLZrDsM94t0nSi8=;
 b=gjbwEj8e76GL8UM70gEumtcz/sOiT3sVMBUDzDxQSgMWLamfScFH5iYN+usRtfqPcmM1bsDPjx6rprn3bk4mpucg2ROdlCIc6OgdaKU5s1F2rT/fuuIZ6jzQmV1touYxVX665/daUOJ69juhAzTbmn9wL/Go87QuvLKVMddnZuW7x6nYMmGkd8xp/D0sRMXhOqn+wjzy6NeBCMsffTZaFYjEujrdmBfatWElgIN9FbuYy3jLG1eW37j7yT35Fg8MD0ZetzAIO7tQ+gGue68tvLH30T6VJZ+8Fr5cyNap0zsYZP5sOSv0zvXuZpQFMk2BjRR4FZPWm1quopuaOSXILw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0q9CPB3kwxZW104r42pi3tVa+xNFLZrDsM94t0nSi8=;
 b=4Ff7dfdPDYAPZQHiUqSPmh0Gxgo8iv5GL0C7nQgkwdp5MRQ+2DWbFZaxZ8+TYWadFMAdJtBTOkD1ySpxI0OF8IDYGoB+bfsofj7BH9Kq2803eHw0W6heYiV5pXcDbhOAP714Ytpsq90WEuZUsTlYnb9qnWdjn8o8eRgCerBXfjc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB5861.namprd12.prod.outlook.com (2603:10b6:8:78::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Thu, 9 Mar
 2023 12:45:56 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 12:45:55 +0000
Message-ID: <d844e8f4-dbfe-15a6-32db-4ab928fad77d@amd.com>
Date: Thu, 9 Mar 2023 13:45:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/ttm: let struct ttm_device_funcs be placed in rodata
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <20230309123700.528641-1-jani.nikula@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230309123700.528641-1-jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS7PR12MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: d064a600-2f21-4046-014e-08db209c39af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XgOUew+uyOuMHw/qjvrsqYS/o2noGjPBC+Ip2t/xAMfXId4/1Meqtt2K/4qkp4MSWO8yuBCfy+YkCen3VX3zVu1rLrZz/cNGbzKFgeUhMxh57BHWvfHIDfWL5L6VOYPZfrwDmHhvWGg0sNMTwxN/qvQqeMBSDALOMM3YbEeu6tveeXNakXsEEc/V6uSBnDcRQ1faW7FJSGt0sSGYFKlMA1l4K203YNklm3Ffaxj5lGGf4ILCSx5qqxXty+TjyCsjHX3PAstIB/+AVIWqezkPvPyzNDXRjIUSxeo/tZ3Ax4gE93yeumCcOfLU85jh5+eeXgMppDqtPlKofOoH2Ti4ZjD71SO80t1JN5plPFsoC4xP4w9w9hf9Fa+nlUSNroEFWqGNn56RdHKVGGb6/9gURTV+XIIPrmVtkoz9S8uvnytSSk5vatiTglK/HixxFzWakaK7NAC1xRpmjr88Or+z9ewP34uNWE6/oYCQuP5DtlW37xmQl9hF8XrUAoiLSYHajmzE6Z6A/n04b0xLOmJg21ZlxexFbiJtSqVzrn5p8zDnSTaxvorVnnzR8NWkpSrYnWRXbBH0D6aZxcKWvpWvr4bq4zLnatsjbloh/zPYdxyPuzoQEUT7fJ2A4gccXKaRuBdNxXhjJ3T1gCh7svqhn4LVj7MDJs2HcR74cq5e0r68lZlVMTezDIY4pz/kr7JBxqvcxFhcaXSRiNFBBFzJUuAdeaZsICaBVyGTrh7mMr8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199018)(6512007)(6506007)(6486002)(6666004)(66574015)(36756003)(38100700002)(186003)(86362001)(2616005)(83380400001)(26005)(41300700001)(31696002)(66946007)(66556008)(66476007)(4326008)(8676002)(2906002)(31686004)(5660300002)(8936002)(478600001)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L28rdG41Uk5ENnNaS3FDT2hYUlRnRjZyMnJMTVdTNUNLd0kyTGRGRUxKamps?=
 =?utf-8?B?WTFSckltMmVkVi9PS1FXVmkrNHRnaEo2cWJmb1kzcHRxN01OK0QrQjlNdElz?=
 =?utf-8?B?aGpVNUVyS2U5dnExNUd2VmVnemp1MzMrQk9FTDZ1TGsyeWRVOC96bkpuM3FJ?=
 =?utf-8?B?K3dYWDBzVlZBbU5HTVU2QmpxdUp5RlJCT1lMdy85a1Y0d0w3bnpHeDgwNGZH?=
 =?utf-8?B?QlpIeXJudjFOUVY3Sk9oTlVjMTh1QWkyaXlTbHVaLzRLNUxpd0lhTUFESHZ3?=
 =?utf-8?B?TUxHYWp2c2lWeFBtRzNNS2p2d05nRTFFUDBiMFJHTHdjVXl3L1ZKcFVsR0dy?=
 =?utf-8?B?eUNsRnUrczBvSUc2Ym5kM3o2NWF0NzB5eUtBemJuTTVpOVpvZnBCNEtYY29K?=
 =?utf-8?B?TWJ4N2p5Z2luSkppbUdWdkZCKzNsdWFHZnRiNjJIeVRyNE5IOVBNRUxacGVK?=
 =?utf-8?B?Wm1DKy85ckRDeVQzZjNtbXAzaXJURHlpZFM2WWorMUhxVnF2YzMybThKNnEw?=
 =?utf-8?B?aHd5SjdTbmc3TmJyY3lSVzhwRlhnWTZmU1A3VXBmamF0MlVOTVhFWHcwQnk3?=
 =?utf-8?B?eEhLcG9oKzJHNm1RTVgwV1dBMDZHaWtqS0gxMWZPRHR6R24zQU9mY1VkTkpZ?=
 =?utf-8?B?Z1luMTVsMjFhdW1QdURZRjNSQzV2OVliamF6RWlpTmZyc080dzlCd2h6cWFo?=
 =?utf-8?B?UGcxQVBQaGJaY2NITjU1SE1IRkJnbUZrQ2x2OUhWTHpZQmlueFdRWFU4a3ZE?=
 =?utf-8?B?bjZHNE9SYllXd0N3NGQ3MFg2My90bXVPVFc4UG5wYmJpMVl2cTUvZ21Eblh2?=
 =?utf-8?B?NWdLRlNxa2FrVklpODNNMEp3cjJwU1F6dE55K25sOGFxbnVmaXczSEVjREpS?=
 =?utf-8?B?VEhkZW1wMGtnUjg4Ynl5SWM0RmNKNXRnU0RyVXhzcVhMTWdRZ0JiWEptRmxU?=
 =?utf-8?B?Y1J4STdDOExxdmQza01OeFNhYTFpcUluS3B4RFhDZGx4QzByUGdZVUxRaGJM?=
 =?utf-8?B?eUNtZHJuWWN1ZVZwU1ZIbXhvQUs2aXRmOTZDYVk4dmxkOW03SGl6aUpVU2NR?=
 =?utf-8?B?SVZOc01mZFBCZHp5WFNOVVBBK1kyVGozYzhhNkJWR21ndWJRYWxaZTlSRkhF?=
 =?utf-8?B?bjBGNkZGa0VxZ0JYWU8zN1pYUmJ3VTdUQjkrbC9VTUI2UDlGU2gxdU4ybXJ6?=
 =?utf-8?B?VUlsMC9GZGdmRmZtc0ZwQVNnMUcxNGNjQndITmV6VVRPZzJpV1hzOUpFY1JC?=
 =?utf-8?B?QmVFZkpwaVlnRG4yNlFML1BXeDkxb3N2TjhsRGVTWDcwUEovSm9CR0RIWmhm?=
 =?utf-8?B?dm4xWENnaUpMVmRObldsd3NRSDA2eGRsUmNzc1diT3E5NGtMWnZGSEIxUlNH?=
 =?utf-8?B?NVdCWnp2WS9nMUNzc3IyZ1ZYK1ExNERUT0NLREFPNXpDNGUxVHpUMDQvTXBT?=
 =?utf-8?B?Y2lEaFE2ajNaMm9OVFYzMDZmMUI2eFMxbTFBd0pZSVFHUTBEMGJpZ2cxcW4y?=
 =?utf-8?B?YlRoUGw4bTNCZkhPcmlWZ0wrSFlka2V5RjQ2dW9ObkJHMVZIbkc0TkRJQUFE?=
 =?utf-8?B?ZXNvYi82L2tuRlFWK0VKQTE1bnFzcDVGQWxWVUFwK0xHSmFIUnIwNGFOV1Js?=
 =?utf-8?B?cXNlNmpRcHd6TFhhNURuUWJFNFpWUUQwRENrbGVRM2VpL1JmUjc5TWF0VGRE?=
 =?utf-8?B?MFBxVkwvU0UrZkp4aFBwTnRvTnhabjVvZXMrS0szaWxqVklwUEdEd0JmT0w1?=
 =?utf-8?B?ZzdydjA3ODNtNStzWmtZRklKZE81cDdXMk1UeDlxeHFaalVyVytwUW5GQndn?=
 =?utf-8?B?L1ZmRStYbXY2Vk5YTUFvVWVQZ1pSdFd0cnphQUppWnJYVnZ6WVZFVGZVbDQ5?=
 =?utf-8?B?RDJpeC9JTkRMYzZMazN5TTZ2c25QWGV1ek9QY1NKY0tVQWlLbHdEaGs2b3pj?=
 =?utf-8?B?OFNHeEN3WWpZcGkzaVRwbk1hZ3pZUDIzdGI1SVQ0YytKTGNRcGRIZHZDWnkx?=
 =?utf-8?B?RG03UUZNZkU0Q1lFNTN2VFUxdE1VbFFQcUFyaGdxSjlsakJlU0lVSjNDeTJM?=
 =?utf-8?B?a0FSVkFhOE1xU0lOdFR4MFJpOU5XT1Zpc0thYVRRa04zZEY4UXFaelVTVWsy?=
 =?utf-8?Q?2NiVofvudGRH2ANicYMaU3nFA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d064a600-2f21-4046-014e-08db209c39af
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 12:45:55.8908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E0pi4zF8QExq5nFSKdkiKeSK62xAh3TyfcyC6LpHkp8+3yOFQFar0Z8dsJZignJZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5861
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
Cc: intel-gfx@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.03.23 um 13:37 schrieb Jani Nikula:
> Make the struct ttm_device_funcs pointers const so the data can be placed in rodata.
>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Good idea, Reviewed-by: Christian König <christian.koenig@amd.com>

Should I push it to drm-misc-next or do you need it on some other branch?

Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 2 +-
>   include/drm/ttm/ttm_device.h     | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index ae2f19dc9f81..a71bb1362de4 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -190,7 +190,7 @@ EXPORT_SYMBOL(ttm_device_swapout);
>    * Returns:
>    * !0: Failure.
>    */
> -int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
> +int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *funcs,
>   		    struct device *dev, struct address_space *mapping,
>   		    struct drm_vma_offset_manager *vma_manager,
>   		    bool use_dma_alloc, bool use_dma32)
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index 56e82ba2d046..c22f30535c84 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -223,7 +223,7 @@ struct ttm_device {
>   	 * @funcs: Function table for the device.
>   	 * Constant after bo device init
>   	 */
> -	struct ttm_device_funcs *funcs;
> +	const struct ttm_device_funcs *funcs;
>   
>   	/**
>   	 * @sysman: Resource manager for the system domain.
> @@ -287,7 +287,7 @@ static inline void ttm_set_driver_manager(struct ttm_device *bdev, int type,
>   	bdev->man_drv[type] = manager;
>   }
>   
> -int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
> +int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *funcs,
>   		    struct device *dev, struct address_space *mapping,
>   		    struct drm_vma_offset_manager *vma_manager,
>   		    bool use_dma_alloc, bool use_dma32);

