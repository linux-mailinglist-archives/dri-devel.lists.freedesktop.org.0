Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B35268C465
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 18:16:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8103F10E190;
	Mon,  6 Feb 2023 17:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C705A10E190;
 Mon,  6 Feb 2023 17:16:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZiFlhe+GzM+iWcWEu8A5YbgIV0PvIPQ16WcVX8LyFx7q/FrneI6mtnakY9FnkPUdkeJttZqkfO0ozvlE1ArOAWDBUyPfS7dzkaWHuB82IRmEVNwZz6v2qp3Rt1auWBUeQ+Pf9Za6Jl4frEfWld2Dg3UVKKuiV9Pklyk7qEIv8jvk8Txyv7K2FuAREjp3xSSSuR4kxftP7eX86F8it5XF0wXEqSpRO5OZzIX6oGwKVuxELylXQQqpLIqyuHeU/PT4b1zCIWBk3yx9Aoa+lrdEg5eGXYiuSfxrD5E5CJ6N15L1TSTujRy9ybbzWm4vviCHfJ42sSZcIhCkPda+9/BWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wD10RV/GtEgQXlOF088mFP5otFHy0jig01D1qy+Vsk0=;
 b=ew67EJe2ChbCvwdJ2Gee/T6+vL7LrVy+Ii+owWhavp9PMjnhhT627cIS+LmZy/w0+5qJ3Nsgm4Fgq8xl5EanmdIhzbQHuMToXMgGwoqXbUZ1xxvBaeis/zeX2B0KCBqCW4v3sggY28Eu0lGEo6B+FK9Uic1/CJWwMLmPX7gU9Ih26kDRLzpBRcxZ8PpaS/3lMsiS/Rf4fLdvMJ+THJWTSNYTJ+1ciqw5wSRhYx/bRKZ92IocK7y9CCDDjw+yqtx9u2yUqhpP+YkofWSVoHxkQ16o6s4evRHRPp9ZQttQw43cQa1oU2BjhS3yoM1t3+zE6D4VJfL+q/RIh1QrQ56c1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wD10RV/GtEgQXlOF088mFP5otFHy0jig01D1qy+Vsk0=;
 b=1N+mq/wjvyvqenBvk+e+w88Y6YEH9aEmlyt9FrIbShGAijpjQI0L67+YEQUiiD0F36sYo0uWDmWqtd/dVax6WUglB9IDMQT4mK07TtJu5LkX/6HbtsREDfZ4VwZq/qliH6cLlID7mjYThlOPfoyfp/Mdufu3dflnMfWbpmhSAlk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH2PR12MB4087.namprd12.prod.outlook.com (2603:10b6:610:7f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 17:16:33 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a%9]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 17:16:33 +0000
Message-ID: <37a98a8f-3c06-8a83-013a-aec5390146a3@amd.com>
Date: Mon, 6 Feb 2023 12:16:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Joshua Ashton <joshua@froggi.es>
References: <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com> <Y90l+DY0rSaMvN1U@intel.com>
 <758e5cf6-53e0-567c-c760-5b773bc7a11c@amd.com> <Y90vrEa3/1RbaGOV@intel.com>
 <f9633729-2db0-3bf1-311d-f03bd04d47a6@amd.com> <Y91Y98jyOimabC3O@intel.com>
 <Y91fsmgAx65koWI5@intel.com> <Y91hyNAplv4nuW5Y@intel.com>
 <a3d46b3a-ebd5-e02c-3db4-783f2a34b36c@froggi.es> <Y+DMwPu6IMVHsmpD@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <Y+DMwPu6IMVHsmpD@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::29)
 To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH2PR12MB4087:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c821fbf-c1b3-4e8c-c2e2-08db0865e532
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lLIcXe/l1Cuukkb5eXN71F9paWtVdJQ8fcJb8EMF81Q66rXkjTsA/X/a0qE4iojJ/+kagCm126HcsAErd/AUHu3mRHf2HO4YWt0qKKy8cC/2LxNNZxu/gDHAFt+Oi4ZepuvujW6dfp/PW6gu4gA/wk+RP42fIm/DNbtrymRoIOWFsR5w+HJ50lq8xwuA5wlx3qQK2/2t5pN7OdIuick0aeTsXxJB6buuoZfFUJcepZ+MU6PT5epc/wTwyv4Kbx50Rrr1RlxW+tJ/V4324P4CzQAD7WSuSLMusg2S6I60d4Z01HtSQDihzqa7mcUGZhSD6uR+Zmw95DCAs3H/UWjD/5tTUBJ72m0Sehm/FObK8iSLkd0B5p//7SDZ48KXxd7XVYayNRP/O6/eXF0vIauel1qntSJJ/kvIXna6EuBK8E8KH5e/yZFPk3tBuEcgqs/mVd+uFKrnXBsepRB6f2RN+QBKzFXmOD8+75wVqq+mrkiuCk9GcS1ZE/0yP7KH9bObm1dQwn5BwejvDUkwENK0DOnPYnSEPXofM1o2z7KRWuJ1xOw1gt82Ouvu5gzWxRm4/Kmft42i2G5yU/wCFYaIWjmgghToaH940jlYanSOftddBX/4sqkpdObkZD61In8NnHtkKeTRTi6KsxRnMDiHQVd02CYsWtkT2GUKPQ5lH9a+q8uotYrbY2eiMl5CNkJryx93kt1pewjWwuWuMYspy25bTEzpZ3vFJZrr/aGcN1K/sAOR0PgilizA5LqiR7tyfMSpk2Pna6LjV00pX14nEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(451199018)(31686004)(54906003)(966005)(110136005)(6486002)(36756003)(478600001)(86362001)(31696002)(2906002)(38100700002)(2616005)(53546011)(66899018)(83380400001)(4326008)(44832011)(6666004)(66946007)(6512007)(8676002)(66476007)(6506007)(41300700001)(8936002)(66556008)(316002)(186003)(5660300002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3VtamxQV0h4UU56d0JIVTR2bzh6WU4wcUJLaXFyTnFVYUtMc1BiWW1DRmt0?=
 =?utf-8?B?NFNEK0VRTUhaR25UOTQwWHRGSndwQVNOWTJvUHB3cDYydzViNDJ0eU1VRks3?=
 =?utf-8?B?V1hPd21acXpMQ3NacWV3ZG11bUk0UFZJaHJ0eGpwanhIM3lPN1FYTzBCVHpM?=
 =?utf-8?B?dTV2eWxIdmZJMk1PTXQ1NTNNK1BtS0lHQVpwTWdocno4MThWY3hycWRFWXZF?=
 =?utf-8?B?M0pLTGdzRnJUNGhIV3FZTWpKbXJhUHhnRm5oc0c1ak8vNk1GUGY0UkUzbmJu?=
 =?utf-8?B?cTBxY3krRDJRMFRIZWhpenFGMjdXOW1ITE9pSGVGejR1TXFXeUVaZEF6VG9p?=
 =?utf-8?B?aXdmY0h4TnZqVTFWTVpvNE42ZnpuVDFWc0VKMkh1ajJ2L0NNbEp2MXc5NDNZ?=
 =?utf-8?B?SzErUmE5eURObENORkhHUjZ3VEtYcU92cUhvZjAwdGtlalJGanEvZ3NVdVo2?=
 =?utf-8?B?Z3pGYUUvWDA4dGlKUHY0MWM0NFRKZ3liVDFyZWtNb1BNNHlvQUFwNTZTb2Jo?=
 =?utf-8?B?N1ovcVdzczVVT3FFK1lBODQ1YUV0WSthV3ZFNTYrd0VwaXdKK2FYSDRzNGhX?=
 =?utf-8?B?aDAxbTRwNmhJMUpPdkFIVkNsaVFvWUduWDJoSms1MUs4cEdpVFRQU2dFN29S?=
 =?utf-8?B?dENmVXN0aGxtTE9NZTViejM0R1YxSTFtdnVNUWlLK3Fxbk9pWmpzQWlZNEl6?=
 =?utf-8?B?WXhQeHZ1Z2wzYlBPbzR1YWcxMFlBOGhOUkJxd0QxYlN1cDI2blprNjhVOGJT?=
 =?utf-8?B?R1lIeHBaRmZhKzRZOGNRUjU1YmZWc0N1b3hIWHRuTXF1Qlpta3g3OE54MFVG?=
 =?utf-8?B?QmI2UEtBcW1oVzV0bk5VZWplZVFRY2hoOC82aEUxdm1iL0x0RWNuN1VrSkVX?=
 =?utf-8?B?YWxiVWh2RTlKaHpkeG9nakVtVWM5eG0yM3Z0NXBXK2pScWtod05JT3g3Tndh?=
 =?utf-8?B?R2VoYUNKTWtJZ3Bia1VjTnpzNUd4cks5N3ZnMW1yczg0ZGozMEprQ092N2JT?=
 =?utf-8?B?RnUwV3Q3dEVvcExZRVZwalNGTVZDOE5MVkVXOUNUSTFNeXduUGtkTzFTMkI2?=
 =?utf-8?B?c1VlS2Vja1Y0Q0NtT2tQdFRIWmk3WFZwVUNyMDZxU1Y2YldpeERDU0NZbWVB?=
 =?utf-8?B?d1R4dURkdkVkWDBDb0Q3RStNSFpqaDl1YmlBSVdxOFREZFR5eGh6bVpLSG1Y?=
 =?utf-8?B?V3NtaWhuYkxWUHpTdGpCc3gzdzROdW1oTUgrOENYTFd5RDRZaFdBM0F5dnNz?=
 =?utf-8?B?dG5DV05ENnlIbFRHekFtbmVENzE0TnFCeS9yTzVnNFZtUlBmOVZzajVRM1NL?=
 =?utf-8?B?OUhyRXJCWVRibFR1VmZwaVZpT0JQQkVaYTczUjI0VDIxUHNycGZzaE9PZkw4?=
 =?utf-8?B?YUFtS0NCNzNnWDhYVFFCQ1JMUnlIQThrZ3NROCtIU0RnY0crbFg0aStRY2VD?=
 =?utf-8?B?T1VLMmE2b3FpWWRxd1QraE9UaUQ3cmRjbTh6UXZ6VXlCSjQ5RHkzb2ZLQlRN?=
 =?utf-8?B?ZGJFbEgvY1NOTlNXN1VaYXJJaDF0MWdFcWJwNlluK0xRUDFHL0l5NnhhaUFr?=
 =?utf-8?B?SHJhS0pVMHc2c2tJQ3ZmVzI0bEFBYU9tcHdRUWt0dkRNVEdYVU1pclJSSGpw?=
 =?utf-8?B?eTVWc0xZMlhJQVpvOUJTN080MzJnR0duY245WVRCTjEySXIzdHhXNk9jNEVu?=
 =?utf-8?B?ZXM2NTBrdDU5SldDL3NINjljOFF3aWtNbmlUYllZMU5yMlRGYXB0d1hWU1FP?=
 =?utf-8?B?T01XV1ZaWVFEdnNsQlg2dkRjYVBudzFGT2NmaWNYNmdWZ01WbWJKeHhVTjNy?=
 =?utf-8?B?NjFzTjNSSENQdVNMVzg0K3BBTW1FdFpEVzZBMXJKREJ1aDJWNEdZT2lDU2Ry?=
 =?utf-8?B?Ym93NW1UVkRkSXdPSVBtS1hNcEplakhoOGIxbk5LeURWRkowMk1xdDRHN3pX?=
 =?utf-8?B?ZUZzd0k1T2g4UXFxV2p3bk9IK0FNeWdyTnF1M3NCOWUzb3pidmgvT2Z5dTQv?=
 =?utf-8?B?Ykx1MXkwdTlJTzlsL0VpWjhHOFlNenNBL2V1YTUwMmhHM2psRloyVnQ1dVhZ?=
 =?utf-8?B?Q1NOa1p4dEFCNEMwMEI4U3hYeG5ZS3JuUmIvWkNkSHloaWNqMGRuL0NmL3VU?=
 =?utf-8?Q?Yetp4LlsTZgJyCciE6cFErWan?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c821fbf-c1b3-4e8c-c2e2-08db0865e532
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 17:16:33.5272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fSdQK3C459ThPOUb2EO2m7cbKwGnmM5sofcXhuh8A47z3sA/8NGut3r+cMl7745wvkkGwBTCm9cs/gP1RZmHDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4087
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 dri-devel@lists.freedesktop.org, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/6/23 04:47, Ville Syrjälä wrote:
> On Sat, Feb 04, 2023 at 06:09:45AM +0000, Joshua Ashton wrote:
>>
>>
>> On 2/3/23 19:34, Ville Syrjälä wrote:
>>> On Fri, Feb 03, 2023 at 09:25:38PM +0200, Ville Syrjälä wrote:
>>>> On Fri, Feb 03, 2023 at 08:56:55PM +0200, Ville Syrjälä wrote:
>>>>> On Fri, Feb 03, 2023 at 01:28:20PM -0500, Harry Wentland wrote:
>>>>>>
>>>>>>
>>>>>> On 2/3/23 11:00, Ville Syrjälä wrote:
>>>>>>> On Fri, Feb 03, 2023 at 10:24:52AM -0500, Harry Wentland wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 2/3/23 10:19, Ville Syrjälä wrote:
>>>>>>>>> On Fri, Feb 03, 2023 at 09:39:42AM -0500, Harry Wentland wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 2/3/23 07:59, Sebastian Wick wrote:
>>>>>>>>>>> On Fri, Feb 3, 2023 at 11:40 AM Ville Syrjälä
>>>>>>>>>>> <ville.syrjala@linux.intel.com> wrote:
>>>>>>>>>>>>
>>>>>>>>>>>> On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote:
>>>>>>>>>>>>> Userspace has no way of controlling or knowing the pixel encoding
>>>>>>>>>>>>> currently, so there is no way for it to ever get the right values here.
>>>>>>>>>>>>
>>>>>>>>>>>> That applies to a lot of the other values as well (they are
>>>>>>>>>>>> explicitly RGB or YCC). The idea was that this property sets the
>>>>>>>>>>>> infoframe/MSA/SDP value exactly, and other properties should be
>>>>>>>>>>>> added to for use userspace to control the pixel encoding/colorspace
>>>>>>>>>>>> conversion(if desired, or userspace just makes sure to
>>>>>>>>>>>> directly feed in correct kind of data).
>>>>>>>>>>>
>>>>>>>>>>> I'm all for getting userspace control over pixel encoding but even
>>>>>>>>>>> then the kernel always knows which pixel encoding is selected and
>>>>>>>>>>> which InfoFrame has to be sent. Is there a reason why userspace would
>>>>>>>>>>> want to control the variant explicitly to the wrong value?
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> I've asked this before but haven't seen an answer: Is there an existing
>>>>>>>>>> upstream userspace project that makes use of this property (other than
>>>>>>>>>> what Joshua is working on in gamescope right now)? That would help us
>>>>>>>>>> understand the intent better.
>>>>>>>>>
>>>>>>>>> The intent was to control the infoframe colorimetry bits,
>>>>>>>>> nothing more. No idea what real userspace there was, if any.
>>
>> Controlling the infoframe alone isn't useful at all unless you can 
>> guarantee the wire encoding, which we cannot do.
>>
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> I don't think giving userspace explicit control over the exact infoframe
>>>>>>>>>> values is the right thing to do.
>>
>> +1
>>
>>>>>>>>>
>>>>>>>>> Only userspace knows what kind of data it's stuffing into
>>>>>>>>> the pixels (and/or how it configures the csc units/etc.) to
>>>>>>>>> generate them.
>>>>>>>>>
>>>>>>>>
>>>>>>>> Yes, but userspace doesn't control or know whether we drive
>>>>>>>> RGB or YCbCr on the wire. In fact, in some cases our driver
>>>>>>>> needs to fallback to YCbCr420 for bandwidth reasons. There
>>>>>>>> is currently no way for userspace to know that and I don't
>>>>>>>> think it makes sense.
>>>>>>>
>>>>>>> People want that control as well for whatever reason. We've
>>>>>>> been asked to allow YCbCr 4:4:4 output many times.
>>>>>>>
>>>>>>> The automagic 4:2:0 fallback I think is rather fundementally
>>>>>>> incompatible with fancy color management. How would we even
>>>>>>> know whether to use eg. BT.2020 vs. BT.709 matrix? In i915
>>>>>>> that stuff is just always BT.709 limited range, no questions
>>>>>>> asked.
>>
>> That's what the Colorspace property *should* be determining here.
>> That's what we have it set up to do in SteamOS/my tree right now.
>>
>>>>>>>
>>>>>>
>>>>>> We use what we're telling the display, i.e., the value in the
>>>>>> colorspace property. That way we know whether to use a BT.2020
>>>>>> or BT.709 matrix.
>>>>>
>>>>> And given how these things have gone in the past I think
>>>>> that is likey to bite someone at in the future. Also not
>>>>> what this property was meant to do nor does on any other
>>>>> driver AFAIK.
>>>>>
>>>>>> I don't see how it's fundamentally incompatible with fancy
>>>>>> color management stuff.
>>>>>>
>>>>>> If we start forbidding drivers from falling back to YCbCr
>>>>>> (whether 4:4:4 or 4:2:0) we will break existing behavior on
>>>>>> amdgpu and will see bug reports.
>>>>>
>>>>> The compositors could deal with that if/when they start doing
>>>>> the full color management stuff. The current stuff only really
>>>>> works when the kernel is allowed to do whatever it wants.
>>>>>
>>>>>>
>>>>>>> So I think if userspace wants real color management it's
>>>>>>> going to have to set up the whole pipeline. And for that
>>>>>>> we need at least one new property to control the RGB->YCbCr
>>>>>>> conversion (or to explicitly avoid it).
>>
>> I mentioned this in my commit description, we absolutely should offer 
>> fine control here eventually.
>>
>> I don't think we need to solve that problem here though.
>>
>>>>>>>
>>>>>>> And given that the proposed patch just swept all the
>>>>>>> non-BT.2020 issues under the rug makes me think no
>>>>>>> one has actually come up with any kind of consistent
>>>>>>> plan for anything else really.
>>>>>>>
>>>>>>
>>>>>> Does anyone actually use the non-BT.2020 colorspace stuff?
>>>>>
>>>>> No idea if anyone is using any of it. It's a bit hard to do
>>>>> right now outside the full passthrough case since we have no
>>>>> properties to control how the hardware will convert stuff.
>>
>> No, every userspace knows that encoding of the output buffer before 
>> going to the wire format is RGB.
>>
>> It's the only way you can have planes alpha-blend, or mix and match RGB 
>> and NV12, etc.
>>
>>>>>
>>>>> Anyways, sounds like what you're basically proposing is
>>>>> getting rid of this property and starting from scratch.
>>>>
>>>> Hmm. I guess one option would be to add that property to
>>>> control the output encoding, but include a few extra
>>>> "automagic" values to it which would retain the kernel's
>>>> freedom to select whether to do the RGB->YCbCr conversion
>>>> or not.
>>>>
>>>> enum output_encoding {
>>>> 	auto rgb=default/nodata,ycbcr=bt601
>>>> 	auto rgb=default/nodata,ycbcr=bt709
>>>> 	auto rgb=bt2020,ycbcr=bt2020
>>>> 	passthrough,
>>>> 	rgb->ycbcr bt601,
>>>> 	rgb->ycbcr bt709,
>>>> 	rgb->ycbcr bt2020,
>>>> }
>>>
>>> In fact there should perhaps be a lot more of the explicit
>>> options to get all subsamlings and quantizations ranges
>>> coverted. That might actually be really nice for an igt
>>> to get more full test coverage.
>>>
>> The choice of encoding of the pixel on the wire should be unrelated to 
>> the overall output colorspace from the userspace side -- but how the 
>> display engine converts the output to that wire format *is* dependent on 
>> the colorspace.
>> eg. picking a rec.709 ctc vs a rec.2020 ctc matrix.
>>
>> I see you are proposing a "passthrough" but that wouldn't work at all as 
>> you still need to at know if you are RGB or YCbCr for the infoframe and 
>> to perform chroma subsampling in the display engine.
> 
> The passthrough (and other knobs after it) were meant for 
> explicit control, which means they wouldn't affect infoframes.
> 
> But probably we should have seprate properties for explicit
> control of each knob vs. some kind of easier to use property.
> And I suppose we can still leave the explicit control stuff
> for later (apart from the one property we already have).
> 
>>
>> I perused the initial patches that added this property, and it seems 
>> there were no IGT tests or userspace implementation, so I am not 
>> entirely sure why it was committed in the first place.
> 
> I presume at least the kodi HDR stuff uses ths. There may
> have also been some chromeos stuff going on. Can't recall
> anymore.

I can't find mention of "colorspace" in kodi. Its SetHDR() [1]
function only sets HDR_OUTPUT_METADATA.

[1] https://github.com/xbmc/xbmc/blob/122916890a2b82ad8defaf2fd1934076387df84d/xbmc/windowing/gbm/WinSystemGbm.cpp#L316

> 
> As for IGT, there's nothing we can really test since we 
> have no way to get the inforframes/etc. back from the sink.
> Hence nothing beyond the normal kms_property sanity checks
> really makes sense.
> 

True, though a generic infoframe readback through debugfs might
be a nice-to-have for testing things that are expected to modify
the infoframe.

>>
>> Nobody can safely use Colorspace because of this problem right now.
>>
>> If nobody is using this property, perhaps we could just get a fresh 
>> start, and either re-purpose it with new enum values, or obsolete it and 
>> make a new property.
>> If we do this, let's start with the absolute bare minimum, such as:
>> "Default/Rec.709 (sRGB), BT.2020"
>> and then grow as we need, making sure we have the full circle from 
>> userspace->output complete and working for each new value we add.
> 

I agree. This leaves room for API that can be extensible but let's
not define things unless they're actually used in a full-stack
implementation.

> Yeah, I think a fresh property is what we want.
> 

Agreed. And if this new property is also updating the infoframe it needs
to be clear it's mutually exclusive with the existing property.

Harry

>>
>> Please don't take this as me saying we shouldn't add all these other 
>> options like opRGB, etc, I just want us to progress to a solid base for 
>> expanding further here, which we really don't have right now.
>>
>> - Joshie 🐸✨
> 

