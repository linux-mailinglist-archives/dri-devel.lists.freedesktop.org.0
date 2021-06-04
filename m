Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1197539BBB8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 17:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C256F619;
	Fri,  4 Jun 2021 15:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2078.outbound.protection.outlook.com [40.107.102.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747816F619;
 Fri,  4 Jun 2021 15:23:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYv+PzpOJf88PJRSdFpujrzUPNiI48tKgljq7ujYC6dPhSDWzsvZq4MFHucgtHGi/QRkux7PCir1YeAIFTWHkP8qjh0plExzih+SlYxmXrBr6gQgiNs6MSDfRKqlVjeOissXshgSi1+2QVsfFCwjP6/YK7tRCdToUnqAD4dPn13o28fLhm29JGNQ0fb2Q4eo4A0r1vSAFSN6lI1rWsh0eohCvSKgAQA8aaVMRmqPdDMUUTCdWbHmoBttI0snbmCPIvjcDyojD5d+mKnmz0Fu/iENymRpqhEEABMGLGzcaqCZfb8tlaFGg+hC74erlNpRL4lOYaPHvPoTDjiUqZN82w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYG70IFWrqA2H625DAMv1bFytZC4M7J9hBDGxTb5WB8=;
 b=QUsVw5VRg2QzWoBwFJFL4o+JP6tYjBzIGlip7J6/B9YUxwJIrZZlkk8h/DXBPOy3fQIG3+uZtIird1mKwd+bnykvtG/DIx/63GxKssHlCZ0LoqWDOfF9RiewxLmWal2qwr/ZQDtkvfO+IdxuXAFO50qt7YirElFgicN0VIubPLN4ydp9UQCbEOEApQ1obkZeEF60WuoBtcdwhrFS5NsD+dzVDIXPTb8ZCQb2lM5xfGZjcqwx1R/HhY9t7oHJDox5dA07gaZGdq8d8ewE4Yp/ortKR8pMZ1ty6nU/a8oQkeaYv+z1Ox+dywe068TnXdfQx7pPadRt4fNxTL0YCVReHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYG70IFWrqA2H625DAMv1bFytZC4M7J9hBDGxTb5WB8=;
 b=B64RoMXNzds5ZUyo/mR6++HgcAtB/xBrCu+nEjfm1TeCVcWfwrK+fRFsOGpFm3LnKWPRO+uUGo299CRgGcrQdAo0jLAPkVFLnrJRkJsLrmrMzkx1auNeUteYm0B9+nGegHSYZGLiI2kGLnMoGSPNL3fQ29P0xKhawoTOhSaMmrk=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5458.namprd12.prod.outlook.com (2603:10b6:5:35b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Fri, 4 Jun
 2021 15:23:17 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f455:b0b4:439:2753]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f455:b0b4:439:2753%3]) with mapi id 15.20.4195.025; Fri, 4 Jun 2021
 15:23:17 +0000
Subject: Re: [PATCH 01/21] drm: Add Enhanced Gamma and color lut range
 attributes
To: "Shankar, Uma" <uma.shankar@intel.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20210601105218.29185-1-uma.shankar@intel.com>
 <20210601105218.29185-2-uma.shankar@intel.com>
 <20210602123335.29045e06@eldfell>
 <2015b90626a04860808eb02fa5f8a117@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <f51cbf2d-69c7-bd7c-379a-a74724ad6d87@amd.com>
Date: Fri, 4 Jun 2021 11:23:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <2015b90626a04860808eb02fa5f8a117@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [198.200.67.154]
X-ClientProxiedBy: YQBPR01CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::25)
 To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.3] (198.200.67.154) by
 YQBPR01CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.27 via Frontend Transport; Fri, 4 Jun 2021 15:23:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a7fd46a-b00f-4832-5f93-08d9276cadad
X-MS-TrafficTypeDiagnostic: CO6PR12MB5458:
X-Microsoft-Antispam-PRVS: <CO6PR12MB5458180F645BF9D35DC719A28C3B9@CO6PR12MB5458.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x4sUqU1nQJ3GjVq2lWPSWkB/IxWTw+3FyQRro+xEtbldYetjOBcObR9YirNy26th49No/Uy0yCrUtumL77fJ5rXJvWOtdtWzu14aQZCxjLvZEa71LdfxhGgUY5foSr1TB4XA80eSPlmUqF6Bp9rJOgKNu5/mh72/vG0/OIUvRZe3JHQM9zzxSOx9cGtKFfWVAYkkOipZmC7Z2blJZffT/kBWUN1cLqCNdjgdOE1KZLo60gI8E5aIwbHoWPBPIPP6+tfI0tkzrtv3Ma7okOsdeYA8XBeSU502gCOgaoPFgUUT162c/9sPENtvcYWdhbpUCpdpy14gE+TqtllvolDkvPabps91JZT3gkhNa/ZPNvLNsTgEZ50L4TU0O04TBEIdwVb3Q5LhzosF4MsUqBKhgu3n0BNqJbFd+yszN/mi4XWQqDJk8k7PDgcG4SSqFBxwJ0xRqQyliaSiPuNKUC93TrGBuaQy/3tFWCzzz7km0XAytrygm9/QR2yJU56IaH9H2BEeZgZ5wlxLhKdGNqC+exHN950l52lwsghAKpS3rA8fWo91ZG0MOWJGLmjQxhJ8+zIIGzwfnfAEfJd+SVYWEBr78tj2iCyW0VPXT0ePuT0yXtChw7eBYWtvU5A55lgcvrRXJ4Jalm4feXbxOLqqV2QQi9E9AgmIdOxUQCcz0XqCzED50PPqGzmii0WAZ+Ru
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(39850400004)(366004)(346002)(4326008)(6486002)(38100700002)(478600001)(2906002)(8936002)(83380400001)(8676002)(31696002)(31686004)(66556008)(36756003)(956004)(5660300002)(26005)(186003)(16526019)(66946007)(66476007)(53546011)(44832011)(2616005)(86362001)(110136005)(54906003)(316002)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UWVvL1hlM3JsQUxZbEVzNjUwVmkxSkg3aTF5dUhXMThZM0xpSXpOYU4ydW5C?=
 =?utf-8?B?QlRUa0NnLzJLOGg0M05ETThPbmdhaDBkT0FPK3pzZGNZNGMxSGEzcDFKSTFk?=
 =?utf-8?B?ZVZYRFlrUlJEV08ySm1NeElJNENBZ1dWenYrWWY2a29PK29SLzhlL3g1QUUw?=
 =?utf-8?B?eW92dEVYSlhrVUpyN2txcHY4UkdBRERoZVIyTlBCUmhid2lmMHNTbWRsLzVS?=
 =?utf-8?B?Y2xMK01lRjYxclNhOGJ4ZGljOVJGbGh5VzhhZzg4Z24xT3dPZXQwSHJPMUUx?=
 =?utf-8?B?aVJlRGZ2MXhQM2ZpbUFXZ0NZT3VDR3lCaU5jd1ZVUGcwbGFGWHVoVU16WlE3?=
 =?utf-8?B?aW4wRXZlWW5ObE03T2V1NTl4SnowTXZNMm9qVkRTaGlwU2xjN2FBVzF5RXJS?=
 =?utf-8?B?NnUza3BGSE1nUGNQT0VzekNxSHlzeTBnWUxsTWhESUJ4TTZGbWNQU2hoTXJ0?=
 =?utf-8?B?YVUyUzEzOUVsOWZ0aGwzd1VmZWZ5eTVKdVExVkUxK29qc0dXczFnMnN2Y2Fi?=
 =?utf-8?B?UHlDaHV6WlZQNWo0N2FUMDU5Z0w3bDZQdHVQYVA0aGJmRTdDRnFJbVpSQWkx?=
 =?utf-8?B?aStEcWlWQkg3QStFTUpJRE9oNFQ5RVp0TGFMUkkyUTJ6TUVvMUVKWFFkdE9v?=
 =?utf-8?B?TGE5VTI2VnlLcWRaTTRIcWU4R01TbEMrWkZQM0JhcTNnSDFjQjZvaldzbG9J?=
 =?utf-8?B?NVoxZytyYXkvTkNVb09EYUc3YUNvRjl6aGVjOFN0NWdhMGZaeVlTUWtsZDQy?=
 =?utf-8?B?TStQZEtrTzV6akNNRWRRM05jRUlLQTN5c0tWR0VrcVAraWo3VFFrbnRBRnA1?=
 =?utf-8?B?U2hDQWVOUVk1cjFtSW9GWHliVUJqdEpUakdQc0RuTEZESEw3VWNRQ0hJblBl?=
 =?utf-8?B?S1RxaTJzOFdITDF5Tk53cGdDN1Q3dGNJRlRZRjA0eG93MmdWT29iSXFmRWxU?=
 =?utf-8?B?ckxENUNhVG5YTFpZejE3YjQzVlAwbXZzMWhlYU5memlwU0x5M0gyN3cvUVA2?=
 =?utf-8?B?U25vdTlLUHpwTzlESWg1R0JyMFZpZTlScXFrdWpBODRKNEV2ZE5uOEhRQW1q?=
 =?utf-8?B?V3Bvc1EwNEhBakVWZ1dYVVJJVmFkYWVVR1hZWkgrb0lSblBGNGlXYWdTYVZw?=
 =?utf-8?B?Tm1ZWGdLR3kxKzdIeDBzR0M1QWF0M3NBYUJzV1ZRTmFQZW11V1dvalMrTFQ4?=
 =?utf-8?B?TWttdEY3d3VRMGU1QnUyNlBTV284ajREOWFHN29TUU5DeFVJVkx0RFFzTlQ1?=
 =?utf-8?B?MXhEcnZ0MDRpU2wraTUxK002MnYyWDVQQ2ZaelZhUDU1SHRJSjVRMXJEU1Ir?=
 =?utf-8?B?ZExHM2ZzSlViT1Y2elNuNjAyelZIcVhCRUVyOHF3ekxDSGIvWkZubThCOHNp?=
 =?utf-8?B?Q0xBZGxZTUNtdW5PMmJYYW9aSFNabExTZENMamVMTmd2N3E0V2hUaUR3MFpa?=
 =?utf-8?B?aXZ5aXR4R1gxaEdSN05aTUVVWDNKQWI4WkJxNFYwUlRZbkE0eklKUEtHUUR6?=
 =?utf-8?B?bXpVMnQ2K2tkWXlVRitLbDRxNzUvYm5Gd1VVWDcwMFJjbVJKRUIyWHBzUG5p?=
 =?utf-8?B?OHdiZk5UZlZCSDR0M040eDhGYTV1LzdYSkdvUnBhNStVWWlBMVVFQmlJYWJD?=
 =?utf-8?B?dVlUYXY3a0pzS2JBUlpxeWk1NFRUR012UEt4WStFV1FWSGluOVM3RUE4QU9R?=
 =?utf-8?B?OE5ReG51N2M5OTJXdnp4bEZRSGFEVjkzSG9ab284dUsxeGJTa1l1WHNaSDd3?=
 =?utf-8?Q?k6YnPKR7E9Kr2mepua1/AKjkMpLIwaUjYE7aD1Z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a7fd46a-b00f-4832-5f93-08d9276cadad
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 15:23:17.5846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kxfK2LCe/X2Cr8t8sG/34TwM8AQCV68rM4KqW4NMm09W8eu0fKF1yaFcGT6HYzsBkoCI+UaVlOrUYrM1oHOcvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5458
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Modem,
 Bhanuprakash" <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-02 4:26 p.m., Shankar, Uma wrote:
> 
> 
>> -----Original Message-----
>> From: Pekka Paalanen <ppaalanen@gmail.com>
>> Sent: Wednesday, June 2, 2021 3:04 PM
>> To: Shankar, Uma <uma.shankar@intel.com>
>> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Modem,
>> Bhanuprakash <bhanuprakash.modem@intel.com>
>> Subject: Re: [PATCH 01/21] drm: Add Enhanced Gamma and color lut range
>> attributes
>>
>> On Tue,  1 Jun 2021 16:21:58 +0530
>> Uma Shankar <uma.shankar@intel.com> wrote:
>>
>>> Existing LUT precision structure is having only 16 bit precision. This
>>> is not enough for upcoming enhanced hardwares and advance usecases
>>> like HDR processing. Hence added a new structure with 32 bit precision
>>> values.
>>>
>>> This also defines a new structure to define color lut ranges, along
>>> with related macro definitions and enums. This will help describe
>>> multi segmented lut ranges in the hardware.
>>>
>>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>>> ---
>>>  include/uapi/drm/drm_mode.h | 58
>>> +++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 58 insertions(+)
>>>
>>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>>> index 9b6722d45f36..d0ce48d2e732 100644
>>> --- a/include/uapi/drm/drm_mode.h
>>> +++ b/include/uapi/drm/drm_mode.h
>>> @@ -819,6 +819,64 @@ struct hdr_output_metadata {
>>>  	};
>>>  };
>>>
>>> +/*
>>> + * DRM_MODE_LUT_GAMMA|DRM_MODE_LUT_DEGAMMA is legal and means
>> the LUT
>>> + * can be used for either purpose, but not simultaneously. To expose
>>> + * modes that support gamma and degamma simultaneously the gamma mode
>>> + * must declare distinct DRM_MODE_LUT_GAMMA and
>> DRM_MODE_LUT_DEGAMMA
>>> + * ranges.
>>> + */
>>> +/* LUT is for gamma (after CTM) */
>>> +#define DRM_MODE_LUT_GAMMA BIT(0)
>>> +/* LUT is for degamma (before CTM) */ #define DRM_MODE_LUT_DEGAMMA
>>> +BIT(1)
>>> +/* linearly interpolate between the points */ #define
>>> +DRM_MODE_LUT_INTERPOLATE BIT(2)
>>> +/*
>>> + * the last value of the previous range is the
>>> + * first value of the current range.
>>> + */
>>> +#define DRM_MODE_LUT_REUSE_LAST BIT(3)
>>> +/* the curve must be non-decreasing */ #define
>>> +DRM_MODE_LUT_NON_DECREASING BIT(4)
>>> +/* the curve is reflected across origin for negative inputs */
>>> +#define DRM_MODE_LUT_REFLECT_NEGATIVE BIT(5)
>>> +/* the same curve (red) is used for blue and green channels as well
>>> +*/ #define DRM_MODE_LUT_SINGLE_CHANNEL BIT(6)
>>> +
>>> +struct drm_color_lut_range {
>>> +	/* DRM_MODE_LUT_* */
>>> +	__u32 flags;
>>> +	/* number of points on the curve */
>>> +	__u16 count;
>>> +	/* input/output bits per component */
>>> +	__u8 input_bpc, output_bpc;
>>> +	/* input start/end values */
>>> +	__s32 start, end;
>>> +	/* output min/max values */
>>> +	__s32 min, max;
>>> +};
>>> +
>>> +enum lut_type {
>>
>> Unprefixed type name in UAPI headers is probably not a good idea.
> 
> Ok, will rename these.
> 
>>> +	LUT_TYPE_DEGAMMA = 0,
>>> +	LUT_TYPE_GAMMA = 1,
>>> +};
>>
>> All the above stuff seems to be the same in your other patch series'
>> patch "[PATCH 1/9] drm: Add gamma mode property". Is this series replacing the
>> series "[PATCH 0/9] Enhance pipe color support for multi segmented luts" or what
>> does this mean?
> 
> The concept and idea is similar and the range definition is also common. But this series
> focuses on plane color management while the other one is for pipe/crtc color features.
> Hence separated and floated them as unique series for review.
> 

Might be better in this case to combine both patchsets. It wasn't entirely clear to
me whether I could base one patchset on top of the other (doesn't look like it) and
what base to apply them on. I had success applying the plane stuff on drm-next and
the crtc stuff on drm-intel.

Harry

> Regards,
> Uma Shankar
>>
>> Thanks,
>> pq
>>
>>> +
>>> +/*
>>> + * Creating 64 bit palette entries for better data
>>> + * precision. This will be required for HDR and
>>> + * similar color processing usecases.
>>> + */
>>> +struct drm_color_lut_ext {
>>> +	/*
>>> +	 * Data is U32.32 fixed point format.
>>> +	 */
>>> +	__u64 red;
>>> +	__u64 green;
>>> +	__u64 blue;
>>> +	__u64 reserved;
>>> +};
>>> +
>>>  #define DRM_MODE_PAGE_FLIP_EVENT 0x01  #define
>>> DRM_MODE_PAGE_FLIP_ASYNC 0x02  #define
>>> DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4
> 

