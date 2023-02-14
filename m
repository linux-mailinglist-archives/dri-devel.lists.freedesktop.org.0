Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AFC696E41
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 21:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD6910E04A;
	Tue, 14 Feb 2023 20:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B4110E02B;
 Tue, 14 Feb 2023 20:04:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4ySgRNkgFa4GENaoShKqEFt2xQjD1LV0IGO+2PMS2FzM+PgmWVyWlW+1yaHuvMuUAZbFdQscO4BoC3FjM8xFy1zysxKXW/kMOLY2M6uiVZMb1+EDu2ShhQ6I5+97HX7Zct2WnJpsH/szJ5hFnKm9T7a66NFD25/4Z1tumafAvYdT6fS5OkvQPWbupABgN1hSvfRWKjsMqHkT4Kuv7rubVNC9hic0JGwSQGjT9cQG1OXZftOr1rEi6GZHvXxYKUiUxXWBh0x1UK0r8J0RSdo3LmLg0sOw8zMYTDGHgfzpnNXNGgiynVpF0PeedlDXHnIKusg7NOFrS6l3/JI/RyEUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/57JiePyFE2m+HSh8EG3S8R23bviC0H/gt3W1jig88=;
 b=KfTB3OPb2tXk4k9k/q0196ofr5EyIfTAfzx03Qqu2wB91az4gXuEk6XtYzUCl4/WOh2lPDK/pgmTmL3YWgZiZp1YVBOOWXiq/cB/94c7x/UXMnCo8yCyZwWvX0QSjEb7aa+bNIGoaTHnBioKAevmygPhZObnBBVBwlQ+FqCT+wJoYxEOk2tpTlmfDiFPJYhXrqdC1oIo6NkEWO6a0nvjcOQgyXF2jGjKC1Md2waEmBYTAX8uqvdTwG7YIYECzpGP+o4GOgq5Sief1fZJlr/p08EiuZWq4Wys+UTZXotarh73NZX7PRvM6lUfrSHVkWPLcDi409mo6SLXZJli8KBxDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/57JiePyFE2m+HSh8EG3S8R23bviC0H/gt3W1jig88=;
 b=XVl5759cO0lE6dkFtYAasYCCi/iJfYY2QRA+4eurLTcPoNrS9mJQhekT6rtbZiRWYy/ZESnebxZ6On4qxy4tmgE7u8fFyEIPyt58L7t2xchBBm6Tu9w6nQPwHfHnpWTbYJfHDZqb2d/d3GQtm1/mmInj9ceN1/u8ao3qoOKU/a0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by IA1PR12MB8309.namprd12.prod.outlook.com (2603:10b6:208:3fe::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 20:04:56 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a%9]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 20:04:56 +0000
Message-ID: <549abc92-e862-8a6b-d4ad-8cd6cc854591@amd.com>
Date: Tue, 14 Feb 2023 15:04:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Content-Language: en-US
To: Sebastian Wick <sebastian.wick@redhat.com>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es> <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com> <Y90l+DY0rSaMvN1U@intel.com>
 <758e5cf6-53e0-567c-c760-5b773bc7a11c@amd.com> <Y90vrEa3/1RbaGOV@intel.com>
 <CA+hFU4wuM_xHniFyRT+jouQ3k_S3UJsRpAtd1Lgx9UVLtrqZrQ@mail.gmail.com>
 <98d1d22a-1c29-5271-1eaf-89c962eb9678@amd.com>
 <CA+hFU4y=N3bR-vXXeLP0xTe0-HJPgF_GTbKrb3A9St-z2LignQ@mail.gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CA+hFU4y=N3bR-vXXeLP0xTe0-HJPgF_GTbKrb3A9St-z2LignQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YTBP288CA0029.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::42) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|IA1PR12MB8309:EE_
X-MS-Office365-Filtering-Correlation-Id: a91b0ae7-ac74-4fa7-946a-08db0ec6be6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yM+P0sxJwkb/tDUK3zuIf3jkH+oLAMawVs5lRokdIZkDi///xJSWUXxWHZExSfsF69yrgDrLhmfbOsLty6XaL+9j5ku64YRXeigsPgWYnjWNgbcV0rpg8KXAGFf0lpIQQoOiW1ligInpOTjwhUB/+a/x6b/nP9v6R3bX+7L4vNKkNm5n2uBAYOiuyLUj8IBq00V/QPB+4vT0z/g8KtBcJhpfmLUr/sWW3Hu4hBBLlaE2jjiV0drsUjh3lPxnHHc7uz7jjY4zfW/SDfHOXIZoNE4PACrGKEHfUNoCol5fHKNsT7DiJ+mgs8ty9dRIDo5qdZuU1R6jlh/G6zgcCR5wI6UE2esydFqSKMnO2UHBapsvaTGNhOehk2wBiRJbvsH43ztADC+STfJkoxPwRdXVc9MP4xvYRTB9KKBDjFtOwvufNO1q+rvrsYSBCC05vzZI7zqD/BLDZLm+aAxjprUBFzJOjTC/d+zaG/3awTzYEzC3gqjxK5+5PXpIWIXPX3heEIZ5V+kV8hRrTWnNCkFqKiCDBNvnOvY86cujVGpUKATWV8yaD+7InGZ5gBNa8PCRwiMeR4+MHU80egc5jwYRi6N2Oa5c6pppBrERRoSi92bro+Jl7EeH8HsdUa8CE7eAOP70PNG3UnFSx2QQ9+GkBYNi3kdb86o6sOm3aTEi/VRoO8Md6zkJSD2ceU6mAigLqcahw2sWbSgALpI7YIukQvZpVMdnJTbLGHQ/xWyLNoc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199018)(31686004)(966005)(8936002)(6506007)(4326008)(41300700001)(5660300002)(6916009)(36756003)(86362001)(66476007)(66556008)(31696002)(66946007)(6486002)(478600001)(38100700002)(2616005)(66574015)(2906002)(8676002)(54906003)(6666004)(30864003)(316002)(26005)(83380400001)(6512007)(53546011)(186003)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFFUdEhNenMxV2cxblYrVC9iT0ZDb2NYL3NDZW42aWJCdThMSGZMeEVBNEwy?=
 =?utf-8?B?TnVTd2NNd2U1T2xqcUprWHhvdElPaDFFSVlsUFgyWEgwNnZrMHRQYkhHQXNG?=
 =?utf-8?B?L3ozbkpqZVpJU25yZG43dGI1MXZnV25GSGFQOExiNlVjN09XTU9lY2RVb1JC?=
 =?utf-8?B?ZVhVMldXamkwbEliWGZSZUg2QjlXZ0hBZlVqeXFaWE9jUTBlUDd5RjhaOFVj?=
 =?utf-8?B?RTFQenRBSXRIUjczT2o0Vkczb211by95Qmx5UlhWeFIrbUloOFVDcEM0Zi9l?=
 =?utf-8?B?U3J3K0FrdFl6N0k2b0JiOGxnSzdZWjM0enBZcXk0dEJCekpUOUp6dHVWSWVS?=
 =?utf-8?B?Y3hjOERhWUVkV205UUhpMnJIMHJWOXRDbjVPTkc5aEVjc0FhckppNTJ0eUdT?=
 =?utf-8?B?QVY0RlFXSVZSekc5c2tjWThZbzR6ay9WeTJaVFlxQzVOeDk0bllncmlQcnJK?=
 =?utf-8?B?dDZUT2NXS2lYOUwrYzZFbU1wTTkzUkZRUmloUWljQi9xVWFVcUgzVGtyeVdT?=
 =?utf-8?B?bStMM1hpTG9nMGc3WkxmbERxRzNuRXBDM0hvRC9SQVZFd2RtZlQzUkwyL1Vz?=
 =?utf-8?B?Nm1SUjBLbWxUbnBrZmdmaThqcEdvQ0E4WlkxTjNFak9NcGM0bWgrM0FXYlZ5?=
 =?utf-8?B?QXdCVFl3VTlEbDVNeTVOMmtIOGlwSXZlRXpwRElETVAvdnlhQ1RvZmtvYUhv?=
 =?utf-8?B?WEsyMmlGQVZ6TzN0TjNnL0ZIejZIb1pPSTc3Q0lySksza3ZOUTRvd3ZXZlRi?=
 =?utf-8?B?cHpld3ZXQzhKYVB4VDdKbWc3aXlmTmpEbzBYV3ZpQTNhTmdxUXlzemtIQTJM?=
 =?utf-8?B?cVJDMGtkeFRRWlZYUzVIbnNRV0NuajdVRGErQUlIVEErMkF3ZmVSMEVhNFVN?=
 =?utf-8?B?SVZyTE5zL05BVVJwaThkalZNSm5DeExGbS9DY0pUemttdXV3ZmprYkk4b3Fu?=
 =?utf-8?B?Mnd5WTJwUUNaU0JNYndhUW1Bekt5TzBIL2Y5WWNPbFFpQ1pMYUJMY3luU0VE?=
 =?utf-8?B?RCs5a0cxTWRUK2hrUkxDZ2JwTFNoWTBsWHV0R1cyWEQrakRmZ21DK215TmJv?=
 =?utf-8?B?Zkp1QmpmZGdRU1UxekFtSnpUeE5pMlZRQzIvdGdibFJBSmUvbEMxSEd6NENk?=
 =?utf-8?B?S2NwWEQ5emlHdTRNTzNYMmNrdU9PVFVac3NQSWhFZjFJaUxlSUVBZ2Z2MEFU?=
 =?utf-8?B?VEFXZkpHRHRjbVlZZzBKSmYrNlNRN1JoUE1BMWVNSFdTOCtGQXJJVWFzZHJI?=
 =?utf-8?B?VjNQVVdMckVBRHU5aVViSTBDMS94cHN2QjRGbEF5UC80dlBmU2hSTFN5ZFFK?=
 =?utf-8?B?c1hqeUVJa3BqbjZZUzJvd3h4M1J4NFpSSnZOVkx3ZTVxbkREdCtVR000eWRN?=
 =?utf-8?B?Sk5RdjhOWTEyMDJGVTNlaHRBS0MxOWVNN096M294cE45V2wrclpkMFk2V2FB?=
 =?utf-8?B?SU1LZVQ0Zk9vL2NVZDh2dDJ2SUtaN2h5RFNpUmw5Y2pQTkhXWlBZNzFaVGFO?=
 =?utf-8?B?RHhzYkFiemlzdVVFU2d1ZTNRblphUUorMnp2aTQza2w0VjZield2WDNnSFdM?=
 =?utf-8?B?MndDbFlnOEpoTWdXakNac200WGpWM3VNT0RSTHRjeEFySEFvditPWWxLZ0RK?=
 =?utf-8?B?SGtjcEVHelhHM3BpUHFxbjB5LytnT1BlRnM2SVdKZWVURzNxN052OGxvR1B5?=
 =?utf-8?B?R2U1NVhVVGx3d2FkMmg1aHB3Szg4ZXVnSHNiMXhndmg5UXFLQ09oKzltR0tj?=
 =?utf-8?B?b3h0YnJxekxWYVVwbmJCa0JFN2dBMTd4NlJVRHFjT2ZmNDR1cWpsNjJCUUZx?=
 =?utf-8?B?QmE4TjdxNW5VaDRGeUl5ayswWGNvNEE2K3pFcmhEeUFLTVVLV3pnOVlMS3d2?=
 =?utf-8?B?RlNUbDQ1cnJPNU0yWFZFdW1mU1dQTUQrWlZSWHUrMldlSW1nQ0xTVjFoZ1FH?=
 =?utf-8?B?cnVSUzh4TGFpMGZrYWJucTBQRVJ6NDArQmV3dXNPSjAwZDk0VjRKUkszZUFu?=
 =?utf-8?B?Q3Y1Vmg1VjdaVFRTaktPVlcxYmhwWHlRUW1GcTFrYWcvRG1NNjhhcFFKS2Jw?=
 =?utf-8?B?blRqcW9XYytvcnlBa3FjT2FNc0ZUZCt6ZFQ1d2FvcENObEdwMVpTWVNiQkFW?=
 =?utf-8?Q?ReKH8KFsS36fCPol+NYt5YMF3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a91b0ae7-ac74-4fa7-946a-08db0ec6be6d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 20:04:56.5941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gr/9LLnXIsEAbzFQCMgbE0ey4G1BwAOrtA8thBZvdTHFM06s4MJV4Q0y43QOK1rbQBKHIsMP8NvJ+kUVC2y1bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8309
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
Cc: dri-devel@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/14/23 14:45, Sebastian Wick wrote:
> On Tue, Feb 14, 2023 at 5:57 PM Harry Wentland <harry.wentland@amd.com> wrote:
>>
>>
>>
>> On 2/14/23 10:49, Sebastian Wick wrote:
>>> On Fri, Feb 3, 2023 at 5:00 PM Ville Syrjälä
>>> <ville.syrjala@linux.intel.com> wrote:
>>>>
>>>> On Fri, Feb 03, 2023 at 10:24:52AM -0500, Harry Wentland wrote:
>>>>>
>>>>>
>>>>> On 2/3/23 10:19, Ville Syrjälä wrote:
>>>>>> On Fri, Feb 03, 2023 at 09:39:42AM -0500, Harry Wentland wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 2/3/23 07:59, Sebastian Wick wrote:
>>>>>>>> On Fri, Feb 3, 2023 at 11:40 AM Ville Syrjälä
>>>>>>>> <ville.syrjala@linux.intel.com> wrote:
>>>>>>>>>
>>>>>>>>> On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote:
>>>>>>>>>> Userspace has no way of controlling or knowing the pixel encoding
>>>>>>>>>> currently, so there is no way for it to ever get the right values here.
>>>>>>>>>
>>>>>>>>> That applies to a lot of the other values as well (they are
>>>>>>>>> explicitly RGB or YCC). The idea was that this property sets the
>>>>>>>>> infoframe/MSA/SDP value exactly, and other properties should be
>>>>>>>>> added to for use userspace to control the pixel encoding/colorspace
>>>>>>>>> conversion(if desired, or userspace just makes sure to
>>>>>>>>> directly feed in correct kind of data).
>>>>>>>>
>>>>>>>> I'm all for getting userspace control over pixel encoding but even
>>>>>>>> then the kernel always knows which pixel encoding is selected and
>>>>>>>> which InfoFrame has to be sent. Is there a reason why userspace would
>>>>>>>> want to control the variant explicitly to the wrong value?
>>>>>>>>
>>>>>>>
>>>>>>> I've asked this before but haven't seen an answer: Is there an existing
>>>>>>> upstream userspace project that makes use of this property (other than
>>>>>>> what Joshua is working on in gamescope right now)? That would help us
>>>>>>> understand the intent better.
>>>>>>
>>>>>> The intent was to control the infoframe colorimetry bits,
>>>>>> nothing more. No idea what real userspace there was, if any.
>>>>>>
>>>>>>>
>>>>>>> I don't think giving userspace explicit control over the exact infoframe
>>>>>>> values is the right thing to do.
>>>>>>
>>>>>> Only userspace knows what kind of data it's stuffing into
>>>>>> the pixels (and/or how it configures the csc units/etc.) to
>>>>>> generate them.
>>>>>>
>>>>>
>>>>> Yes, but userspace doesn't control or know whether we drive
>>>>> RGB or YCbCr on the wire. In fact, in some cases our driver
>>>>> needs to fallback to YCbCr420 for bandwidth reasons. There
>>>>> is currently no way for userspace to know that and I don't
>>>>> think it makes sense.
>>>>
>>>> People want that control as well for whatever reason. We've
>>>> been asked to allow YCbCr 4:4:4 output many times.
>>>
>>> I don't really think it's a question of if we want it but rather how
>>> we get there. Harry is completely right that if we would make the
>>> subsampling controllable by user space instead of the kernel handling
>>> it magically, user space which does not adapt to the new control won't
>>> be able to light up some modes which worked before.
>>>
>>
>> Thanks for continuing this discussion and touching on the model of how
>> we get to where we want to go.
>>
>>> This is obviously a problem and not one we can easily fix. We would
>>> need a new cap for user space to signal "I know that I can control
>>> bpc, subsampling and compression to lower the bandwidth and light up
>>> modes which otherwise fail". That cap would also remove all the
>>> properties which require kernel magic to work (that's also what I
>>> proposed for my KMS color pipeline API).
>>>
>>> We all want to expose more of the scanout capability and give user
>>> space more control but I don't think an incremental approach works
>>> here and we would all do better if we accept that the current API
>>> requires kernel magic to work and has a few implicit assumptions baked
>>> in.
>>>
>>> With all that being said, I think the right decision here is to
>>>
>>> 1. Ignore subsampling for now
>>> 2. Let the kernel select YCC or RGB on the cable
>>> 3. Let the kernel figure out the conversion between RGB and YCC based
>>> on the color space selected
>>> 4. Let the kernel send the correct infoframe based on the selected
>>> color space and cable encoding
>>> 5. Only expose color spaces for which the kernel can do the conversion
>>> and send the infoframe
>>
>> I agree. We don't want to break or change existing behavior (that is
>> used by userspace) and this will get us far without breaking things.
>>
>>> 6. Work on the new API which is hidden behind a cap
>>>
>>
>> I assume you mean something like
>> https://gitlab.freedesktop.org/pq/color-and-hdr/-/issues/11
> 
> Something like that, yes. The main point being a cap which removes a
> lot of properties and sets new expectations between user space and
> kernel. The actual API is not that important.
> 
>> Above you say that you don't think an incremental approach works
>> here. Can you elaborate?
> 
> Backwards compatibility is really hard. If we add another property to
> control e.g. the color range infoframe which doesn't magically convert
> colors, we now have to define how it interacts with the existing
> property. We also have to figure out how a user space which doesn't
> know about the new property behaves when another client has set that
> property. If any property which currently might change the pixel
> values is used, we can't expose the entire color pipeline because the
> kernel might have to use some element in it to achieve its magic
> conversion. So essentially you already have this hard device between
> "old" and "new" and you can't use the new stuff incrementally.
> 

True. If we go toward a new color API that gives userspace explicit
control of the entire pipeline it is by definition incompatible with
a "legacy" API that touches the same HW.

>>  From what I've seen recently I am inclined to favor an incremental
>> approach more. The reason is that any API, or portion thereof, is
>> useless unless it's enabled full stack. When it isn't it becomes
>> dead code quickly, or never really works because we overlooked
>> one thing. The colorspace debacle shows how even something as
>> simple as extra enum values in KMS APIs shouldn't be added unless
>> someone in a canonical upstream project actually uses them. I
>> would argue that such a canonical upstream project actually has
>> to be a production environment and not something like Weston.
> 
> I agree that it's very easy to design something that doesn't work in
> the real world but weston is a real production environment. Even a new
> project can be a real production environment imo. The goals here are
> not entirely undefined: we have color transformations and we want to
> offload them.
> 
>> I could see us getting to a fully new color pipeline API but
>> the only way to do that is with a development model that supports
>> it. While upstream needs to be our ultimate goal, a good way
>> to bring in new APIs and ensure a full-stack implementation is
>> to develop them in a downstream production kernel, alongside
>> userspace that makes use of it. Once the implementation is
>> proven in the downstream repos it can then go upstream. This
>> brings new challenges, though, as things don't get wide
>> testing and get out of sync with upstream quickly. The
>> alternative is the incremental approach.
> 
> I also agree pretty much with everything here. My current idea is that
> we would add support for the new API in a downstream kernel for at
> least VKMS (one real driver probably makes sense as well) while in
> parallel developing a user space library for color conversions. That
> library might be a rewrite of libplacebo, which in its current form
> does all the color conversions we want to do but wasn't designed to
> allow for offloading. One of the developers expressed interest in
> rewriting the library in rust which would be a good opportunity to
> also take offloading into account.
> 

Doesn't libplacebo hook into video players, i.e., above the Wayland
protocol layer? Is the idea to bring it into a Wayland compositor
and teach it how to talk to DRM/KMS?

I wonder if it makes sense to somehow combine it with libliftoff for HW
offloading, since that library is already tackling the problem of
deciding whether to offload to KMS.

> No doubt all of that will take a significant amount of effort and time
> but we can still get HDR working in the old model without offloading
> and just sRGB and PQ/Rec2020 code paths.
> 

I would like to get to some form of HDR including offloading by adding
new per-plane LUTs or enumerated transfer functions as "legacy" 
properties. This would likely be much more tailored to specific 
use-cases than what Weston needs but would allow us to enable multi-plane
HDR in a more reasonable timeframe on applicable HW. These new
properties can educate an all-encompassing new DRM color API.

>> We should look at this from a use-case angle, similar to what
>> the gamescope guys are doing. Small steps, like:
>> 1) Add HDR10 output (PQ, BT.2020) to the display
>> 2) Add ability to do sRGB linear blending
>> 3) Add ability to do sRGB and PQ linear blending
>> 4) Post-blending 3D LUT
>> 5) Pre-blending 3D LUT
> 
> Sure, having a target in sight is a good idea.
> 
>> At each stage the whole stack needs to work together in production.
>>
>> If we go to a new color pipeline programming model it might
>> make sense to enable this as an "experimental" API that is
>> under development. I don't know if we've ever done that in
>> DRM/KMS. One way to do this might be with a new CONFIG option
>> that only exposes the new color pipeline API when enabled and
>> defaults to off, alongside a client cap for clients that
>> are advertising a desire to use the (experimental) API.
> 
> Yeah, that's a bit tricky. I also don't know how upstream would like
> this approach. Not even sure who to talk to.
> 

Agreed, I'm also not sure whether this would fly. airlied or danvet
might have an opinion.

This thought was inspired by "Blink Intents", which is a mechanism
how new full-stack features land in the Chromium browsers:
https://www.youtube.com/watch?v=9cvzZ5J_DTg

Harry

>> If we have that we could then look at porting all existing
>> use-cases over and verifying them (including IGT tests) before
>> moving on to HDR and wide-gamut use-cases. It's a large
>> undertaking and while I'm not opposed to it I don't know
>> if there are enough people willing to invest a large amount
>> of effort to make this happen.
>>
>> Harry
>>
>>>> The automagic 4:2:0 fallback I think is rather fundementally
>>>> incompatible with fancy color management. How would we even
>>>> know whether to use eg. BT.2020 vs. BT.709 matrix? In i915
>>>> that stuff is just always BT.709 limited range, no questions
>>>> asked.
>>>>
>>>> So I think if userspace wants real color management it's
>>>> going to have to set up the whole pipeline. And for that
>>>> we need at least one new property to control the RGB->YCbCr
>>>> conversion (or to explicitly avoid it).
>>>>
>>>> And given that the proposed patch just swept all the
>>>> non-BT.2020 issues under the rug makes me think no
>>>> one has actually come up with any kind of consistent
>>>> plan for anything else really.
>>>>
>>>>>
>>>>> Userspace needs full control of framebuffer pixel formats,
>>>>> as well as control over DEGAMMA, GAMMA, CTM color operations.
>>>>> It also needs to be able to select whether to drive the panel
>>>>> as sRGB or BT.2020/PQ but it doesn't make sense for it to
>>>>> control the pixel encoding on the wire (RGB vs YCbCr).
>>>>>
>>>>>> I really don't want a repeat of the disaster of the
>>>>>> 'Broadcast RGB' which has coupled together the infoframe
>>>>>> and automagic conversion stuff. And I think this one would
>>>>>> be about 100x worse given this property has something
>>>>>> to do with actual colorspaces as well.
>>>>>>
>>>>>
>>>>> I'm unaware of this disaster. Could you elaborate?
>>>>
>>>> The property now controls both the infoframe stuff (and
>>>> whatever super vague stuff DP has for it in MSA) and
>>>> full->limited range compression in the display pipeline.
>>>> And as a result  there is no way to eg. allow already
>>>> limited range input, which is what some people wanted.
>>>>
>>>> And naturally it's all made a lot more terrible by all
>>>> the displays that fail to implement the spec correctly,
>>>> but that's another topic.
>>>>
>>>> --
>>>> Ville Syrjälä
>>>> Intel
>>>>
>>>
>>
> 
