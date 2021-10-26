Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 685DB43B534
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 17:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3089989B9F;
	Tue, 26 Oct 2021 15:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B23A89B7D;
 Tue, 26 Oct 2021 15:11:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZrKO5rQ/S3t+alAqFBFSLymnNauWbUp/DOCW6agbOYuygnE2A68AoZmGZkQV08peq3oSxt859zeMHRhocjJcnPPQe5CguQwAWVrdW6EUl/YuUFLFIsQ8J1Z9s5BqH7hPp3nAfPI/yeErKolQonSHRKYjMAPoqDAtbuhkdl2QPXCROCwEqPieYw/yPNe13w3mtg9ZRqSSFK126nG1IF/yd9bkauEPPc6Ae/fLw76p1FcYFvT+h+zrOrZ8ODYMegQryPujUv5ZF5uNplh9kBG10Wg9xMOPVbsQB1PcOd8R9Dd85B0iFmvoih47zNG4I7Ad9c/GLovM+4sfYtcweHqqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVIY1XzuBT28gqfcdEGqVILrDYk/SqY2Wx+DVuRYv+E=;
 b=ccuXvoT7AJ5pAZroIGjUbDw9Agkvj8yA4ohzmh0cc0XGMTdwvIlin2AWIjTHBgco81r52GTUPvKBWceAE/jSSV1t+8vOS8IHBFFoU7qL8lddtzxhT3yLPQhL+GC70JDUPwBK+MV6sK5d62OkFyomiiWgm55y7kmzpd5b45HbhoIGfKFcwnTwKEExEOZpMn8gaZHQTLHa1IiRwOClePzF7dgMzjxTU0Fy9TL2By6IA2TUp8NxMF+B7A7vHQ3lefHojGlSEIkfiMGoLaOriC94Rm0rbTse2HxI5pYz3PbVEIziaoFfCWglSdQ3tw+8T1h5vysmqR2tLIrjHcsfnkkSeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVIY1XzuBT28gqfcdEGqVILrDYk/SqY2Wx+DVuRYv+E=;
 b=mXwqOcQ63+OlXHJZmlT9faAiFfadiHshXTzCI6/kDCGd1+O6QO06/0i0zJuWKNvtJWGluSeWxzSJs14I1RLb3Ewzl7oj2zeZFls5w1bBYb103/otNgiQiHKJxFHFjzjYezmNhvEqa56nRjG/xMf39mhvW4OM3pYs895FZzX9A0c=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5396.namprd12.prod.outlook.com (2603:10b6:303:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 15:11:57 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975%3]) with mapi id 15.20.4649.014; Tue, 26 Oct 2021
 15:11:57 +0000
Message-ID: <d4093c6f-29a5-e84e-7bc3-f0638e97f205@amd.com>
Date: Tue, 26 Oct 2021 11:11:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC v2 01/22] drm: RFC for Plane Color Hardware Pipeline
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>, "Shankar, Uma"
 <uma.shankar@intel.com>
Cc: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "brian.starkey@arm.com" <brian.starkey@arm.com>,
 "sebastian@sebastianwick.net" <sebastian@sebastianwick.net>,
 "Shashank.Sharma@amd.com" <Shashank.Sharma@amd.com>,
 "Cyr, Aric" <Aric.Cyr@amd.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-2-uma.shankar@intel.com>
 <20211006155559.606521de@eldfell>
 <92af78eb53c04d67ac66b77f8b098cc0@intel.com>
 <20211013113046.7ace2dbd@eldfell>
 <8c1d39bf5d034595aafd8937df259547@intel.com>
 <20211015104237.10e39a90@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20211015104237.10e39a90@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0232.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::13) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0232.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:66::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Tue, 26 Oct 2021 15:11:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e2bcbc7-031e-41ea-6542-08d99892f383
X-MS-TrafficTypeDiagnostic: CO6PR12MB5396:
X-Microsoft-Antispam-PRVS: <CO6PR12MB5396A100345F2635E9D422C78C849@CO6PR12MB5396.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wSwYnUqpu897txwjajqHlFIfnNaitwIsCct6XUMAzsvsMVhyFhdFkqZijEEvhoUSx7tYkftlRSaazbh22iRiLL+1pibYDwvRhw8E2u0Mi1TIkMkTOxgCOihgyQWf52IrQIoeMAJBYJ1Gg2ORsQSheDOsyAGcAHFq9pNi+jYAghEuKJFZO7V82ca5nrohnQqcT7T0BRR0JirWV8UTosZKGfN8nwXXcJJsU+X4M1RlT3ruIki7UtJk+gxb4Ml4zVNWVv/Pdy/eyqi0C2lw0hfh3VieYvr97MHmHHMEulKMqgBa/vNP4NUMScRqNmizgnN3tzYZqKsH7xVf9YfnQeK8DaGo3CMNmVR+h2fvy0BCcjeovXYdm38I3Yp++6jK5hFJHAEugprPebtcGxchUasIfSGM14lh4oBOx9+oG+Na7pUnTRLaIZRjAEvNO0Bdz0APN13PRrEfpUmebJKTjpY69Kkc/bb0cwWKjzw6oRogvzZMAGO9fFyy+gc8n17W8L6puzao7cXJWMPwAECHoccsvxJ0nyNXzkW4uUdpdxggLRhJx/XwVQqZ1dArUmgdPw1XQ+LtkGcs7xo2wbW+D0RjqVkiIZH6dFIM6d7AjQgsXX1oAPi7uC+0M1MKXgGZjesx2CAG5ziepoeaxWb5UI+6rgftNxkf3xL5AQxo2sRWUIcD/VXLw8lhu0GqDb9TPE/uDmJ10qkgJlO8B2Fa3uB7nCSlPrXO+56kkOVYM8ZQvHT+DZhY9EGym3L6WI87dvdL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(83380400001)(36756003)(8676002)(53546011)(8936002)(31696002)(4326008)(316002)(66946007)(66574015)(956004)(16576012)(44832011)(186003)(38100700002)(31686004)(86362001)(6486002)(66556008)(4001150100001)(508600001)(54906003)(26005)(110136005)(5660300002)(2906002)(6666004)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEZzTXNpSWk0VndlL1piK3paRkVaTVVuRVVmaTBxZTZUemxlQ3dXMzErQUpi?=
 =?utf-8?B?QjZpOXlZWm5TQ1FITDBkdnNQTDFvWkViTiszNkZkY3dqd3BMY29MdTV4TWRo?=
 =?utf-8?B?SjdzaGNXQTh1TVJNcDlhOGYrYnl1UUlkUEpsbFZla2VoTFRqanJSN1I3RnVM?=
 =?utf-8?B?RVN1NWplWlZrZ3VwSFJ6Zlg1MkVBN1FJZkZqdlFWaklKYStMOTVOeml1OVJW?=
 =?utf-8?B?b0V0alVTeHlxSE1ycXEyVE5lRmVwSFE0MU0wK1RjOG9hMGVMQlo3Z0dhRy95?=
 =?utf-8?B?UXJIeFJKVlhpZUpTUHFPZTdwWEFpejdsUzFZRGl0OThXVEVPRm80TE4zejlC?=
 =?utf-8?B?dTh1ZDg5L1N2UzlCaEptSTlIMCtFck1taUNyWGR3WlpWYm5tQ3FWUnRMUEgx?=
 =?utf-8?B?UVZXUDZSRDc4V0ZmYW80cDZ0SzVONFVKS1ZjTDhGUmlBWlVuaC9pSllGT2FP?=
 =?utf-8?B?YWlmdy9FZ1RXQk85WFJmMktGRUh6aXl1a2Z6QlR5bUhYbnJwLzIwK293Z0Jo?=
 =?utf-8?B?UzdjMnBHcnkrdXJ5OVp0MUNMRWdtcHlvVDd1TGhGc3UxUHAyTHRPZEV6c2V1?=
 =?utf-8?B?R1JQd3p6V1h1a2dZeDJkR3ovYlJia280ZGtQM1NZaE5jcitRcnQ0ck4yeTh4?=
 =?utf-8?B?V1MyaWtsY09yOEVJenJQcHdhZjZ4YzZrZit0Q0lGa2U4YXNNRDByRU9SV1VD?=
 =?utf-8?B?MDlkaEpKd0I2bzhlVzd2R0ovRVRDVEJMMjdhNHArbTlHMENDNEhLblN6SXlp?=
 =?utf-8?B?UGMwdUUrRWxEb0wzSmI3ZDBTWXdzdU5wcUpscHFONWl4amlYTlgzOVN6RnVo?=
 =?utf-8?B?S3JhNHpRNjhrM0ZwU0ZNNHBYaElib1VWd0Q5Ly8yTGkwUlVrTHF2K1JPd1Zj?=
 =?utf-8?B?SDdKa2JPSjZQeXNFT0VXRzQ4c2U0VFMxL3dLKzkvQUdmdkE1R0hkYVB4eksz?=
 =?utf-8?B?QStYOUtGdlpvTTZpME5tdlZqMzVtUXhMSmN5M0VPak9xT09mRXlGU2hIenh5?=
 =?utf-8?B?cURXeWNITHZKRUxZVkxlaWZTbXd0YTV6SGdYRHpXaHhwWnQ4OEJ0WXBMWTdP?=
 =?utf-8?B?d3RhOXFNb2F5aUV1Ymo5SThVMEhVU0VtSmlvMzM0bVFjQXRnZ3NLU0xTOVp0?=
 =?utf-8?B?elI0UXowRWNScllPUGpwVlBNc1htc1hIMUEra2dVTGVyM1VBeHZyNGxmYjMz?=
 =?utf-8?B?TVRjcUt3QWN6VUVyaUFPU2JHL1NtRmhOUTlsZjdqSllXV2Q2RmxIaWlDd05s?=
 =?utf-8?B?dFFiUUNxMU4zdy84VzBYYmNiNFBkeDE5eDFvSUQvQ0xIUWJLaWJHcFRHRTFC?=
 =?utf-8?B?NXRueVdadlNsZWhycjhQOHZiUWV3bWxBZHh1YUZWK0ZYY25uMHZRY0xBYXBQ?=
 =?utf-8?B?VjBQOGNrZzNyd25Gb01Qc0J2RHdPaG51d0JrZE0vV3MzNG01ZTNZekxoVmZq?=
 =?utf-8?B?bzB4c1BBZkJZNW9nY05TNUgrNWhPL0RSMHFSK0RjK3VRMk1YU3V0RXZsSUZM?=
 =?utf-8?B?aXZDdTZsVDM4aUp5SW5EdDhpRDY1Z0lUVTdhTTgwdVhxU3F0bm1BRFpzNzM3?=
 =?utf-8?B?OVV6VmJGSkUweXBQOGVLdDMybkx1amRxUXNmY2R3R2VaVFFqU2E5MG9VTzBP?=
 =?utf-8?B?YkdlYmRVTU53Y2kzMFBrdndmclFNK3ppZjAvU3I0YjVTN0dwUHRkNWdpbUZq?=
 =?utf-8?B?Q0NhbU84dUM1S1BQbUl2RHlMUWt6UEZsNWJkUW43ZUcrak04MmlzdUtCSk9y?=
 =?utf-8?B?OG1ydlBBWFExQXBhSisyMXBCRVpzRlArWVVpZnVna0Z4WlgxSTNZbFM5V3Jt?=
 =?utf-8?B?aDk0NzJ5cng0R3pYdnozTGR0cFdJNUZMZVJtMlVmWnBLcFc3QWtRRlRYTXpL?=
 =?utf-8?B?blpIYTArMktMRVdoNkNuSVVKRUVYUDQrdGtmLzRXanhoSGpWY2VHbzFSUENO?=
 =?utf-8?B?anNzWkZKRzd4dDNISEZmRTlXZm5KSHRPd0dUajV3ZmVaSkJjdERSOVBEZ0RH?=
 =?utf-8?B?S05VZVhWaTFhSUNVOXRZZVcxQTFnNlFlZENDR21jQ2VVdEJMZDAweFY2UVpF?=
 =?utf-8?B?QVpPQ3JUNGxUT1dFRWpmQng3WmtPU1hVMWEvQzQrWjNYL0pIS0o4LzBIcnVn?=
 =?utf-8?B?V1VsTG5XYmF0OUZCanJsZEJBNXV4aVk2MU9SVU9NT2JRTWxJaUFVZnpHbjVY?=
 =?utf-8?Q?GffzeWbxrFCgBaHfE8ZEHVA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2bcbc7-031e-41ea-6542-08d99892f383
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 15:11:56.9828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sOhTxorexe3XEVFUpE20mok8rri+4QOaYesCOcJtbB8EBC+ZS+2D6ukmK/h0x00Vk8FPv3kD1h0TyaN4fJDJXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5396
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks, Uma, for the updated patches. I'm finally finding
time to go through them.

On 2021-10-15 03:42, Pekka Paalanen wrote:
> On Thu, 14 Oct 2021 19:44:25 +0000
> "Shankar, Uma" <uma.shankar@intel.com> wrote:
> 
>>> -----Original Message-----
>>> From: Pekka Paalanen <ppaalanen@gmail.com>
>>> Sent: Wednesday, October 13, 2021 2:01 PM
>>> To: Shankar, Uma <uma.shankar@intel.com>
>>> Cc: harry.wentland@amd.com; ville.syrjala@linux.intel.com; intel- 
>>> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; 
>>> brian.starkey@arm.com; sebastian@sebastianwick.net; 
>>> Shashank.Sharma@amd.com
>>> Subject: Re: [RFC v2 01/22] drm: RFC for Plane Color Hardware Pipeline
>>>
>>> On Tue, 12 Oct 2021 20:58:27 +0000
>>> "Shankar, Uma" <uma.shankar@intel.com> wrote:
>>>   
>>>>> -----Original Message-----
>>>>> From: Pekka Paalanen <ppaalanen@gmail.com>
>>>>> Sent: Tuesday, October 12, 2021 4:01 PM
>>>>> To: Shankar, Uma <uma.shankar@intel.com>
>>>>> Cc: intel-gfx@lists.freedesktop.org; 
>>>>> dri-devel@lists.freedesktop.org; harry.wentland@amd.com; 
>>>>> ville.syrjala@linux.intel.com; brian.starkey@arm.com; 
>>>>> sebastian@sebastianwick.net; Shashank.Sharma@amd.com
>>>>> Subject: Re: [RFC v2 01/22] drm: RFC for Plane Color Hardware 
>>>>> Pipeline
>>>>>
>>>>> On Tue,  7 Sep 2021 03:08:43 +0530 Uma Shankar 
>>>>> <uma.shankar@intel.com> wrote:
>>>>>  
>>>>>> This is a RFC proposal for plane color hardware blocks.
>>>>>> It exposes the property interface to userspace and calls out the 
>>>>>> details or interfaces created and the intended purpose.
>>>>>>
>>>>>> Credits: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>>>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>>>>>> ---
>>>>>>  Documentation/gpu/rfc/drm_color_pipeline.rst | 167
>>>>>> +++++++++++++++++++
>>>>>>  1 file changed, 167 insertions(+)  create mode 100644 
>>>>>> Documentation/gpu/rfc/drm_color_pipeline.rst
>>>>>>
>>>>>> diff --git a/Documentation/gpu/rfc/drm_color_pipeline.rst
>>>>>> b/Documentation/gpu/rfc/drm_color_pipeline.rst
>>>>>> new file mode 100644
>>>>>> index 000000000000..0d1ca858783b
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/gpu/rfc/drm_color_pipeline.rst
>>>>>> @@ -0,0 +1,167 @@
>>>>>> +==================================================
>>>>>> +Display Color Pipeline: Proposed DRM Properties  
> 
> ...
> 
>>> cf. BT.2100 Annex 1, "The relationship between the OETF, the EOTF and 
>>> the OOTF", although I find those diagrams somewhat confusing still. It 
>>> does not seem to clearly account for transmission non-linear encoding being different from the display EOTF.
>>>
>>> Different documents use OOTF to refer to different things. Then there 
>>> is also the fundamental difference between PQ and HLG systems, where 
>>> OOTF is by definition in different places of the camera-transmission-display pipeline.  
>>
>> Agree this is a bit confusing, I admit I was much more confused than what you were for sure.
>> Will do some research to get my understanding in place. Thanks for all the inputs.
> 
> I'm sure I was at least equally confused or even more at the start. I
> have just had a year of casual reading, discussions, and a W3C workshop
> attendance to improve my understanding. :-)
> 
> Now I know enough to be dangerous.
> 
> ...
> 
>>>>>> +
>>>>>> +UAPI Name: PLANE_DEGAMMA_MODE
>>>>>> +Description: Enum property with values as blob_id's which 
>>>>>> +advertizes
>>>>>> the  
>>>>>
>>>>> Is enum with blob id values even a thing?  
>>>>
>>>> Yeah we could have. This is a dynamic enum created with blobs. Each 
>>>> entry contains the data structure to extract the full color 
>>>> capabilities of the hardware. It’s a very interesting play with 
>>>> blobs (@ville.syrjala@linux.intel.com brainchild)  
>>>
>>> Yes, I think I can imagine how that works. The blobs are created 
>>> immutable, unable to change once the plane has been advertised to 
>>> userspace, because their IDs are used as enum values. But that is ok, 
>>> because the blob describes capabilities that cannot change during the 
>>> device's lifetime... or can they? What if you would want to extend the 
>>> blob format, do you need a KMS client cap to change the format which 
>>> would be impossible because you can't change an enum definition after it has been installed so you cannot swap the blob to a new one?
>>>
>>> This also relies on enums being identified by their string names, 
>>> because the numerical value is not a constant but a blob ID and gets 
>>> determined when the immutable blob is created.
>>>
>>> Did I understand correctly?  
>>
>> Yes that’s right. We are not expecting these structures to change as
>> they represent the platforms capabilities.
> 
> Until there comes a new platform whose capabilities you cannot quite
> describe with the existing structure. What's the plan to deal with that?
> A new enum value, like LUT2 instead of LUT? I suppose that works.
> 

See my comment on the coverletter. It would be great if we could come
up with a PWL definition that's generic enough to work on all HW
that uses PWL and not require compositors to learn a new LUT2
type in the future.

>>
>>> As a userspace developer, I can totally work with that.
>>>   
>>>>>> +	    possible degamma modes and lut ranges supported by the platform.
>>>>>> +	    This  allows userspace to query and get the plane degamma color
>>>>>> +	    caps and choose the appropriate degamma mode and create lut values
>>>>>> +	    accordingly.  
>>>>>
>>>>> I agree that some sort of "mode" switch is necessary, and 
>>>>> advertisement of capabilities as well.
>>>>>  
>>>>
>>>> This enum with blob id's is an interesting way to advertise segmented lut tables.
>>>>  
>>>>>> +
>>>>>> +UAPI Name: PLANE_DEGAMMA_LUT
>>>>>> +Description: Blob property which allows a userspace to provide LUT values
>>>>>> +	     to apply degamma curve using the h/w plane degamma processing
>>>>>> +	     engine, thereby making the content as linear for further color
>>>>>> +	     processing. Userspace gets the size of LUT and precision etc
>>>>>> +	     from PLANE_DEGAMA_MODE_PROPERTY  
>>>>>
>>>>> So all degamma modes will always be some kind of LUT? That may be 
>>>>> a bit restrictive, as I understand AMD may have predefined or 
>>>>> parameterised curves that are not LUTs. So there should be room 
>>>>> for an arbitrary structure of parameters, which can be passed in 
>>>>> as a blob id, and the contents defined by the degamma mode.  
>>>>
>>>> For Intel's hardware these are luts but yeah AMD hardware seems to 
>>>> have these as fixed function units. We should think of a way to have 
>>>> this option as well in the UAPI. We could extend the DEGAMMA_MODE 
>>>> property to have all the info, and DEGAMMA_LUT_PROPERTY may not be 
>>>> needed based on some of the attributes passed via DEGAMMA_MODE. This 
>>>> can be  
>>> one way to have room for both.  
>>>> @harry.wentland@amd.com thoughts ?  
>>>
>>> Yeah, though I don't think you can use DEGAMMA_MODE property to pass 
>>> parameters to fixed-function curves. The parameters need another 
>>> property. Would be natural to use the other property for LUT data when mode it set to LUT.
>>>
>>> A trivial and made-up example of a parameterised fixed-function curve 
>>> is pow(x, gamma), where gamma is the parameter.  
>>

It's a bit HW dependent. Some of AMD HW has some pre-defined EOTF
ROMs who allowing us to program a RAM LUT in the same block. Other
HW split those into two independent, consecutive blocks, a pre-defined
EOTF ROM first, followed by a Gamma Correction RAM LUT.

These can probably both be supported the the proposed PLANE_DEGAMMA_LUT
with enum values for the predefined (sRGB, BT2020, etc.) EOTFs, as
well as an option for a programmable LUT.

Harry

>> We can maybe have a parallel property as well with proper
>> documentation if this helps with flexibility for varying hardware
>> vendors. UAPI document will list what to use and when. May be
>> platform will not even list the other one which may make things less
>> complicated to userspace.
> 
> I'm not sure I got what you're thinking. My idea is that the
> interpretation of the blob contents depends on the value of the mode
> enum. Obviously the two will always need to be set together by
> userspace to ensure they match, otherwise DRM needs to reject the
> commit.
> 
> 
> The rest of your comments I agree with.
> 
> 
> Thanks,
> pq
> 

