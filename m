Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B7444B3E3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 21:22:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010126E1AA;
	Tue,  9 Nov 2021 20:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2044.outbound.protection.outlook.com [40.107.100.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CAC96E1AA;
 Tue,  9 Nov 2021 20:22:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbx6baj367tgtNFkkO+ado8CoOdqqxu2z8s44+deSRvNAa2hJiV7TtQKFjgguEs9hTZ0DIAm5Wbo9aPOlOXeAGr7/i2CWgv0YBucPIO+TVF9gNav2HYTrFrikYQuO+wMxLfD1EHZFpvQBQoDomu3jToWh3nDvBlDz5R2hcazbb8FJF4Mj3Lxbwz1hL78NOEIoxLcNQcjuuJfxReSeIv/G2NzWurnijcxDCj/wkUMvcK0hvv4oQJ+L9flpdsl6f9uap0SG54A63a2JmH93cKy3xh1IcdIQ14Oisof3rY+TpFdmpSzCz8Pcmcl89X3NAuJ+c0SecLkRLqmUTVpzJRHcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdldP0G4JFAJRz2/1wvttbK3pvReNVljbOMSb58w3lo=;
 b=CNlaLvpc/tz7f+Y/1Ia7tKlh0XNJYGioN79ctbYLI2dfhozs9STqHa6pxoYawnj12Vz3QCAMv2A7Ku6FF5VU1bg74eZW3C7x668V4mi9cx5sv0M0Gpxag5ND4b72fuLMobiIR7y22eGAaBIDzSikhWHnWxJLtJ0Jrzx87oqGECYz/A7XqvRJu3WayCSqgpXqEreJbVF+s53paI163mkePZN1h27Jp+JXeWPPwDpJH1kJTqhQPta+063RqdmhRCsPYKSsf7Xq7qUAv7yybcY/+nuGtPg3vPlbvI4P7IUBvvA1OWEFoFCz/KDdgE+fY0c6l6BmxCqur+/oOXH1XG6lig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdldP0G4JFAJRz2/1wvttbK3pvReNVljbOMSb58w3lo=;
 b=0UMIBeLqi2H5tsFynPG4Zw+yKNT80J9zBG87qKOvN8j60+T2NG9qtjD9PJrFyj4EAC75B4anI3h+sfyWh9UtydZXTuM0zwGx+U193qsilQwgIOwmloFZRlHh6KRdL6tjYcwLYL0q6Yo0doiL1tukPLQhX9++xZ9Ib+WPL5zXIJc=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5460.namprd12.prod.outlook.com (2603:10b6:5:357::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 9 Nov
 2021 20:22:25 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975%3]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 20:22:25 +0000
Message-ID: <f2aa29db-b5d2-6fbf-c997-b994b004d0a4@amd.com>
Date: Tue, 9 Nov 2021 15:22:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC v2 02/22] drm: Add Enhanced Gamma and color lut range
 attributes
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-3-uma.shankar@intel.com>
 <d67a9761-91b4-3432-dd55-f85bb0657b68@amd.com>
 <20211104103827.2cf48bb7@eldfell>
 <5780b3b6-5b12-df66-03be-5f1918d28989@amd.com> <YYUaWzxHZ7M2B7iY@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <YYUaWzxHZ7M2B7iY@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0138.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::38) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR01CA0138.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:1::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Tue, 9 Nov 2021 20:22:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a6bd706-4ccd-4f28-728f-08d9a3bea49d
X-MS-TrafficTypeDiagnostic: CO6PR12MB5460:
X-Microsoft-Antispam-PRVS: <CO6PR12MB54607D390F3119E341A552C78C929@CO6PR12MB5460.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4U6UUO1BxjxlXboMub1wdzK5KYwCkvz2j++BIELWY4wRIC4cwStutMOYSSiJjYGZyuYvyFJhubO5qu5i4Dcox7GO+oGp8f981dnVRs7uF+divF9Znf2fx/52vgHFMvx9jaT/KiDdVmTF1wHror689/apjcT5VA1qbHxncZ5LM9MRc/TUPmNHC6COPbsqdTVLIUePujP222VWF893cwIp9iCYBrFWqgKZZAj5+LSfP1122YAa5BzHVfjVS8Q8JaHWV8GG6rygu//m1mbcCgEw8LXGbVPy0iSX2l4wOD0kkLD0cMZssfUbmjUvvD2qy2+1ssgQvesK5ZhyLZXKX2wwQr+qZOw5JH0fZ5w3bvtgwUztE6jUQ7u+VAY6+ZILtJOpDjI11Hf7FRmP1fI0YmwbKXgdwg+UyhwY1qgKUjUVQFXiqJqxfmI8NXuDgQ8+5ZKWCJvJrPuLCuuotkdQOQcTlxmiaO+bKdnWGnQ6+jpwh4T4go38qbwMHikGQDDQC6hVCcgMhLGbmlWXP8EYaV+C+yHO4fawXHWbs4tkr317Sk/agWfUSGeHShRq46dUrlGGpz/ckjUGWoNpYnihNWSzsODxJPJz/UJLE6Z8G0wDnotmqbhozyOZjSJ2lP2QH6MgqLdVHbc2tf1RFk0KvetQ+G0poO9oWpgKt/ha5FSp9mNHls6x8MoTlAxuxzrm+gjXzsR4X7eIdS0s1B+SRWXB82mmw2I4+mkM9OzAup4CbkxHw/yfqjW5o0bPjOOeKfQRDcyDCrZ0YgidKiEIb3KDGGTWY9NnMvIWKKmlTPPR17CuA91RdME3DQXcITPb0vV4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(186003)(5660300002)(36756003)(16576012)(38100700002)(31696002)(66574015)(31686004)(8936002)(83380400001)(966005)(53546011)(6916009)(44832011)(4326008)(2906002)(8676002)(26005)(66476007)(86362001)(6486002)(316002)(66556008)(508600001)(2616005)(956004)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czBPdm54c0xYVEVTcWFvVHpadFJOcFdrZ1IyOVZmV2lnUFhBdENnazBjaFRO?=
 =?utf-8?B?TmpWSjYxZEVMcTBJWHp5Y0xnN2l0TlJ3Z0RWYk9HalJMYUhLdkhJMjJ1aUZv?=
 =?utf-8?B?RzlyRDQrZGxTVk9LWmlaa25IQmpDaFZTY1lPaUhackU2c0Ewa0dDQ0lVcWR4?=
 =?utf-8?B?T3dlQU1jakY0aVVVaFVSYU1CTFhrV0JBREZlRENNbnJDZE94dng0ZEpNdzJR?=
 =?utf-8?B?TEFJTzBVZlB5OFRaU0lHZlRCdjh5VUk5Y2daYjZ1SnM1VmhSRHZRV2xhWWlt?=
 =?utf-8?B?eWZxTWJaaUF2KzA5VWtYTE41cHMwTW95UkVpVFBIZnBIcUswR045QUNrMkR0?=
 =?utf-8?B?dHhPRVpsamFTMVZ4eEl0Z2tMVnhkNk9rWWhrdG9LOGJRUjJCbFoyY2tJWmxQ?=
 =?utf-8?B?L05wTVpsYnpxbExIeHl6eURxRHFHT0VLTURjQXVHbTlHc0hJY0FhNU1JbUFr?=
 =?utf-8?B?Mk8za1I1dncxMUFWZDlhYXdwaDFBbzhlU2xmUTN4TUhXMjJ5b0Z6c0pVTGUr?=
 =?utf-8?B?L2lvMURRSW9JQis2TUpQbS9uKzNFaGtGaFdzVTZhVS9VdHI5QUd3MkVaNHNU?=
 =?utf-8?B?WjNXbEp0N1NKY3dZcDNDM2dhR2xDREhWWEtwSGxOWkgvYnBEeTdpb2dFK1JR?=
 =?utf-8?B?Zy9GK29iVkVodmhndDdKa3pnOVZtZzdNNndWZmRWb1Z6Wkh4aFJMc2xtcVUy?=
 =?utf-8?B?bngrTE1jNEhEOWZNSFVTWi94OHNxZ1FtS3VVbkp3bDZOR1gvenppVWdMNHVZ?=
 =?utf-8?B?Mzl6ZldjcE9tWEh0T2ZqMzZLWnNDZWRjTCtXbW4zQTdyU21uNnJBYjJ1dDVO?=
 =?utf-8?B?amlCSVRBT3p6MlFaQUlVYTRicEtHVVhxM0NmMndrSmttMzBsQWRWaUVScEZ0?=
 =?utf-8?B?djNldWtrWTJ5bXRNUytRWGsyQmJIS2txYkhGVGVIYzdEU2xsRE5RTjNTZlZ6?=
 =?utf-8?B?N1VrcG9tWnVpY0RDUTUrM0JyS2VycVY3SVJtMmN1Wk5PMGhBTHM0MWkvNm5B?=
 =?utf-8?B?M2tZVlJ4dkhla1F3RFY0TVBKZkhPemQzZW9hS0g2ZHA1M1BjWUFsVzlJQnFn?=
 =?utf-8?B?a3Ftb01OYkoyK25KZ1Y0aUtnQkw2Z2hEWnoxcW5LZEVxR3AvQlo4QWQ4aEtn?=
 =?utf-8?B?NGx3ckZvUS93aXRnTXdXb2FSOUhQTFpubkpFcURoRHl4WlJ1eER0T1NDbHh5?=
 =?utf-8?B?VjNsTGRCcTNKQklhdzBoaGduS3puaWhCczc5dkVwalVDRTVPNVNvVUw2M21p?=
 =?utf-8?B?MHZvYWRvUjdYdWtQN2hDOE5UN0ZTUVRZKzBCOHBPL01ZTmlZT05WclFwVVNB?=
 =?utf-8?B?a0VFQm43Ky9wM3pXV0pPU1dnaWhPNkdhbDl2V2RzOGZGRHBvSkpkdUN3R00z?=
 =?utf-8?B?RmxtSEswUDJES0ZxcndxR0J2cTBZdjd6eGdhNWE5amhWK3hPcmVaVXlZTzNJ?=
 =?utf-8?B?UDlPa2xtTnFVUzgzMEdKSWh5RmJEL3UrWE0xZU42bWZacEkzaUpGeVd0OVJY?=
 =?utf-8?B?MDJIN3Uzc0kwUC9RTjlnR2RnL3h2Y3VEcWM0Ym1tYVFsQUlSWHpaUDQ0ZURV?=
 =?utf-8?B?TitwRmxqWDh6TnFQaXNxTzlPTHhqa3E0dzZobkJBR0FZQUFkbk96K0U5MlM3?=
 =?utf-8?B?NXRrOUR5eXhEaUcwL1FyRDR4SXBiMjZBdG5jR1NkNWp5Q1I0L05WTTZ2MFov?=
 =?utf-8?B?QVBIdHVCMDd3a0l1V05IQlk1a1l6Zm5GSXhvd0RVMHNJbTdkQTR0cSsveGp0?=
 =?utf-8?B?c2h5YVI1RHoxcSszMmJLNjdQdURMdUFBN0hGQWpld2pjV2V6NUlQUVJBL1l6?=
 =?utf-8?B?NGVveTkzUG9JejVlaEJLSnk4R0w0WUc2dGpwR0V2clVYZEd1Y3NrZjlzWVlm?=
 =?utf-8?B?eTlLNEdjcXd5UnZsaGF2bWhZenpiR1E1OUxSWDlUekpacjZRamJtdjRzOTNn?=
 =?utf-8?B?dUlibk1tU2lpN2RQMlRRM0pDbmF1M3NQQ1RPaWVPZWlBZW1jYUs2N2s2VXpZ?=
 =?utf-8?B?WkdaZEJqT3ByT05aN0dLOWtNYzNxQTRPS3h5YXRVNUp4ejU1NjhHdU95RGxR?=
 =?utf-8?B?ZGJRUEp5WHFLeHBRNGtQS0FLdkVFM3hma0VBVi9Qb3EySzhuMjZPNDl6VlF1?=
 =?utf-8?B?RExwUXl1SDRBcVRKdWdla1MyWmNuMmZOc3dnTFoyZHFJcXhUZXd0WFNpZ1pu?=
 =?utf-8?Q?Ab5qss3yQEqJhdlBbSa3uYM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6bd706-4ccd-4f28-728f-08d9a3bea49d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 20:22:25.3060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cVeLJUm4rfZOESy9nCYCBEc1B5RMJRW90Bg/iMsSiI0Svxi9t68Z1h3yX019NUIJLueJ2ib40UKUWZhugauFKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5460
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
Cc: Shashank.Sharma@amd.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, sebastian@sebastianwick.net,
 Uma Shankar <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-11-05 07:49, Ville Syrjälä wrote:
> On Thu, Nov 04, 2021 at 12:27:56PM -0400, Harry Wentland wrote:
>>
>>
>> On 2021-11-04 04:38, Pekka Paalanen wrote:
>>> On Wed, 3 Nov 2021 11:08:13 -0400
>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>
>>>> On 2021-09-06 17:38, Uma Shankar wrote:
>>>>> Existing LUT precision structure is having only 16 bit
>>>>> precision. This is not enough for upcoming enhanced hardwares
>>>>> and advance usecases like HDR processing. Hence added a new
>>>>> structure with 32 bit precision values.
>>>>>
>>>>> This also defines a new structure to define color lut ranges,
>>>>> along with related macro definitions and enums. This will help
>>>>> describe multi segmented lut ranges in the hardware.
>>>>>
>>>>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>>>>> ---
>>>>>  include/uapi/drm/drm_mode.h | 58 +++++++++++++++++++++++++++++++++++++
>>>>>  1 file changed, 58 insertions(+)
>>>>>
>>>>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>>>>> index 90c55383f1ee..1079794c86c3 100644
>>>>> --- a/include/uapi/drm/drm_mode.h
>>>>> +++ b/include/uapi/drm/drm_mode.h
>>>>> @@ -903,6 +903,64 @@ struct hdr_output_metadata {
>>>>>  	};
>>>>>  };
>>>>>  
>>>>> +/*
>>>>> + * DRM_MODE_LUT_GAMMA|DRM_MODE_LUT_DEGAMMA is legal and means the LUT
>>>>> + * can be used for either purpose, but not simultaneously. To expose
>>>>> + * modes that support gamma and degamma simultaneously the gamma mode
>>>>> + * must declare distinct DRM_MODE_LUT_GAMMA and DRM_MODE_LUT_DEGAMMA
>>>>> + * ranges.
>>>>> + */
>>>>> +/* LUT is for gamma (after CTM) */
>>>>> +#define DRM_MODE_LUT_GAMMA BIT(0)
>>>>> +/* LUT is for degamma (before CTM) */
>>>>> +#define DRM_MODE_LUT_DEGAMMA BIT(1)
>>>>> +/* linearly interpolate between the points */
>>>>> +#define DRM_MODE_LUT_INTERPOLATE BIT(2)
>>>>> +/*
>>>>> + * the last value of the previous range is the
>>>>> + * first value of the current range.
>>>>> + */
>>>>> +#define DRM_MODE_LUT_REUSE_LAST BIT(3)
>>>>> +/* the curve must be non-decreasing */
>>>>> +#define DRM_MODE_LUT_NON_DECREASING BIT(4)
>>>>> +/* the curve is reflected across origin for negative inputs */
>>>>> +#define DRM_MODE_LUT_REFLECT_NEGATIVE BIT(5)
>>>>> +/* the same curve (red) is used for blue and green channels as well */
>>>>> +#define DRM_MODE_LUT_SINGLE_CHANNEL BIT(6)
>>>>> +
>>>>> +struct drm_color_lut_range {
>>>>> +	/* DRM_MODE_LUT_* */
>>>>> +	__u32 flags;
>>>>> +	/* number of points on the curve */
>>>>> +	__u16 count;
>>>>> +	/* input/output bits per component */
>>>>> +	__u8 input_bpc, output_bpc;
>>>>> +	/* input start/end values */
>>>>> +	__s32 start, end;
>>>>> +	/* output min/max values */
>>>>> +	__s32 min, max;
>>>>> +};
>>>>> +
>>>>> +enum lut_type {
>>>>> +	LUT_TYPE_DEGAMMA = 0,
>>>>> +	LUT_TYPE_GAMMA = 1,
>>>>> +};
>>>>> +
>>>>> +/*
>>>>> + * Creating 64 bit palette entries for better data
>>>>> + * precision. This will be required for HDR and
>>>>> + * similar color processing usecases.
>>>>> + */
>>>>> +struct drm_color_lut_ext {
>>>>> +	/*
>>>>> +	 * Data is U32.32 fixed point format.
>>>>> +	 */
>>>>> +	__u64 red;
>>>>> +	__u64 green;
>>>>> +	__u64 blue;
>>>>> +	__u64 reserved;
>>>>> +};  
>>>>
>>>> I've been drawing out examples of drm_color_lut_range defined PWLs
>>>> and understand a bit better what you and Ville are trying to accomplish
>>>> with it. It actually makes a lot of sense and would allow for a generic
>>>> way to populate different PWL definitions with a generic function.
>>>>
>>>> But I still have some key questions that either are not answered in these
>>>> patch sets or that I somehow overlooked.
>>>>
>>>> Can you explain how the U32.32 fixed point format relates to the input_bpc
>>>> and output_bpc in drm_color_lut_range, as we as to the pixel coming in from
>>>> the framebuffer.
>>>>
>>>> E.g. if we have ARGB2101010 what happens to a 0x3ff red value (assuming alpha
>>>> is non-multiplied)?
>>>>
>>>> If the drm_color_lut_range segments are defined with input_bpc of 24 bpc will
>>>> 0x3ff be zero-expanded to 24-bit? Is the 24 bpc an integer? I.e. would our 3xff
>>>> be interpreted as 0x3ff << (24-10)? 
>>>>
>>>> Assuming the output_bpc is 16 bpc and the programmed LUT makes this 1-to-1 would
>>>> the output value be 0x3ff << (16-10)?
>>>>
>>>> On AMD HW the pipe-internal format is a custom floating point format. We could
>>>> probably express that in terms of input/output_bpc and do the translation in our
>>>> driver between that and the internal floating point format, depending on the
>>>> framebuffer format, but there is the added complication of the magnitude of the
>>>> pixel data and correlating HDR with SDR planes.
>>>>
>>>> E.g. any SDR data would map from 0.0 to 1.0 floating point, while HDR content would
>>>> map from 0.0 to some value larger than 1.0. I don't (yet) have a clear picture how
>>>> to represent that with the drm_color_lut_range definition.
>>>
>>>
>>> Hi Harry,
>>>
>>> I think you just would not. Conceptually an SDR plane gets its very own
>>> LUT that converts the FB [0.0, 1.0] range to any appropriate [a >= 0.0,
>>> b <= 1.0] range in HDR. This is purely conceptual, in the terms of the
>>> abstract KMS color pipeline, where [0.0, 1.0] is always the full
>>> dynamic range at any point of the pipeline, meaning it is relative to
>>> its placement in the pipeline. If you want to use values >1.0 in hw,
>>> you can do so under the hood.
>>>
>>> At least that is how I would imagine things. With LUTs in general, I
>>> don't think I have ever seen LUT input domain being explicitly defined
>>> to something else than [0.0, 1.0] relative to the elements in the LUT
>>> where 0.0 maps exactly to the first element and 1.0 maps exactly to the
>>> last element.
>>>
>>> I'm of course open to other suggestions, but having values outside of
>>> [0.0, 1.0] range in the abstract pipeline will always raise the
>>> question: how do you feed those to the LUT next in the pipeline.
>>>
>>
>> AMD HW defines the LUT addressing in floating point space and allows
>> for addressing beyond 1.0. In fact on other OSes our driver uses
>> [0.0, 1.0] for SDR LUTs and [0.0, 128.0] for HDR LUTs.
>>
>> There are color spaces that extend beyond 1.0 and even into the negative
>> range: https://en.wikipedia.org/wiki/ScRGB>>>
>> I don't think we should define the LUT to be limited to [0.0, 1.0].
> 
> That is not the intention, or at least wasn't my intention when
> originally I proposed this gamma mode stuff. I specifically wanted
> support for extended values. So 0.0-1.0 is supposed to be just the
> range for the in gamut values.
> 

Make sense and good to hear.

>>
>> If the framebuffer is not in FP16 the question then becomes how
>> the integer pixel values relate to LUT addressing.
> 
> The idea again is that 0.0-1.0 is the range for the in gamut
> values. IIRC our hw does have the possibility of scaling all
> the fp16 input values by some programmable constant factor,
> but exposing that would require yet another uapi addition.
> 
>>
>> As well, LUT entries are defined to be U32.32 fixed point, also
>> allowing for entries much greater than 1.0. If those are programmed
>> as entries in the input (degamma) LUT how will they be used to address
>> entries in the output (gamma) LUT?
> 
> The u32.32 is a mistake I think. IMO we should be going for signed
> values everywhere. Though our hw does not actually let us directly
> program negative values for the LUT, rather the hw just reflects
> the whole curve across the origin so the lookup is basically just
> something like:
> output = input < 0 ? -lut[abs(input)] : lut[input];
> 
> That is why there is that proposed DRM_MODE_LUT_REFLECT_NEGATIVE flag.
> 

That's pretty much how I expect AMD HW to operate as well.

Harry

> I think nouveau had something funny in its lut programming that
> made me think that it might actually have straight up programmable
> LUT entries for negative inputs as well. But I'm not sure if anyone
> has actually tested that.
> 
>>
>> Maybe we want to say the actual input values are being used to
>> address the LUT entries? But if we look at segment 1 of Uma's
>> d13_degamma_hdr definition we see that the range of 0 to
>> (1 << 24) -1 is covered by 128 (1 << 7) entries, so the range
>> of 0 to 256 (for RGB with 8 bpc) would only be covered by 2
>> LUT entries. So this interpretation doesn't make sense.
>>
>> You can see, I'm still confused by these definitions. An IGT
>> test would help explain the API intentions a bit better, though
>> I would like to see more precise documentation.
>>
>> Despite my confusion I think the segmented PWL definitions are
>> a neat way to concisely describe the HW capabilities to
>> userspace and a concise way for userspace to provide the LUT
>> more precisely than with a uniformly spaced LUT.
>>
>> Harry
>>
>>> Yeah, I have no idea what it should mean if an FB has a format that
>>> allows values beyond [0.0, 1.0].
>>>
>>>
>>> Thanks,
>>> pq
>>>
>>>
>>>> If some of these questions should be obvious I apologize for being a bit dense,
>>>> though it helps to make this accessible to the lowest common denominator
>>>> to ensure not only the smartest devs can work with this.
>>>>
>>>> Harry
>>>>
>>>>> +
>>>>>  #define DRM_MODE_PAGE_FLIP_EVENT 0x01
>>>>>  #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
>>>>>  #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4
>>>>>   
>>>>
>>>
> 

