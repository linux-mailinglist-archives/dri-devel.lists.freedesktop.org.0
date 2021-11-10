Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4717744C470
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 16:32:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE3C6E5AB;
	Wed, 10 Nov 2021 15:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4D56E5AB
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 15:32:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ksxqqQZ5AxOovcoVRRtar1Qm/0QVjDf5gjbkClPmxtYeTJfyfV9G8ozj51pxI/eJaAh2DpDFk509ltlkJNt4TLowHCPiqQXZP4PZu5v5F2SoMOXthA9/eK/8dQYfgHLMOOyNAR9U117OAEIEDOTrVfxXetkJd9m1xJ+WiarRVNN/sCZ1RODAH1omEfMQK3Cb0aBCKljFnwCxBO50+eMUqEKHjphOL4wIeDsSBkxPlCQoUqtrW5/c1FetlC0J8JvyZE1cuz0+zNsYwcd/AgNlzMVJEAy4x3NRvCJ68mZMrVYkygycq4nbbl2ErNiE4p7R3bx7z944qTzbPeKTl9pqjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIuUDlmJWTGbTdkWaIGJOkjVDmUsWnLyDsl9NCyD2GQ=;
 b=e7w9N3MTBzK1mbz5ODCMhe/fhWj4qIXscM9ijy7S9hPOhXmKLckM0p/OfI5wwXTUgIdIVDPiKgmx+s9hwKOfeDwN659V2y/YGsHTuKRTxIxlQVP/9hORJWw308lQ5OPE/aB+1nlF4Mau9dbL4nSO9LgkbvDoUwrEGU2YFAmWR9L2LkSw7J1FQeIFh+geVfFH542LBkjOvb2qrnLMceF6wUAAv8kWGcXLmAuzjhziR3AKwkBSEBrw94K1kPijw6dcxNTIZZ5E6xelRSfSwV9VmT5mj+T8mAOA1Glhwb/E12R9glk7drjuEJwU/qIo/vpSb8tmgQbVkyiSsvgwTYb80w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIuUDlmJWTGbTdkWaIGJOkjVDmUsWnLyDsl9NCyD2GQ=;
 b=4vCU2w60z+M/YFIfITUauxi6H5MWQbJszhQFvGin9c/80rmum5DFQHBaI4tpLM3CnAHgIxIv5EGezqGFoLbjnSkpXuVHEvHgka5PFRiicy4+n3AxEe00ZjMiKkFIrCP86mCrsfpCzJjlsNU1vD0+4uTBdT7D2KkBJk1G6LhFPCI=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5457.namprd12.prod.outlook.com (2603:10b6:5:355::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 10 Nov
 2021 15:32:26 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975%3]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 15:32:26 +0000
Message-ID: <610c132c-841c-ed8f-835b-c4d4de03ef1d@amd.com>
Date: Wed, 10 Nov 2021 10:32:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] drm/dp: Fix aux->transfer NULL pointer dereference on
 drm_dp_dpcd_access
Content-Language: en-US
To: "Yuan, Perry" <Perry.Yuan@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20211101061053.38173-1-Perry.Yuan@amd.com>
 <87a6iodnz7.fsf@intel.com>
 <MWHPR12MB1631610D235FCC3B47064F6B9C8B9@MWHPR12MB1631.namprd12.prod.outlook.com>
 <87y267c5nc.fsf@intel.com>
 <MWHPR12MB163124867D43AD8E19EED1D39C8C9@MWHPR12MB1631.namprd12.prod.outlook.com>
 <87wnlpbhma.fsf@intel.com>
 <MWHPR12MB163123C11A51C8B82F80F3CC9C8E9@MWHPR12MB1631.namprd12.prod.outlook.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <MWHPR12MB163123C11A51C8B82F80F3CC9C8E9@MWHPR12MB1631.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::16)
 To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR01CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Wed, 10 Nov 2021 15:32:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 854d6c98-4660-40fd-65ff-08d9a45f4c1c
X-MS-TrafficTypeDiagnostic: CO6PR12MB5457:
X-Microsoft-Antispam-PRVS: <CO6PR12MB545788A79D839446EA93A85D8C939@CO6PR12MB5457.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h7ZaihYBtyTHIlIMd/K7L0JLUiEX0jdAsPsuNM6isOfqbRiv/HM/5QVRMCD/hdnZwtInLo9c4JIiGnJJDiitzIX0AkU8ule9YcndEmvEs+caIQnxnV8COFshdStAP95pUBcaVMPrviP7ge5JbhsXVzq32J/mZPQRFppFs/NTMk5ZJbwWmchVL7giz5IJP/fq+bkPnQuxcl5PreKTe19BddsySUjVg7N3MCUPUGxteo2LzgGdYRN87a89SCXdO9sSUgyKva1kQLYexoRJnkAiVwB+bD88yd/rb4YvPN3j2M2dNwoLnVIis48QwzZ2mvhwlFt/ADkO8qdutsm9ztTpKXuTkp+fbTM/ICKobuc4eai9a+IUD+tdz9yZ0N2vgPAG/+dYS2GgLxK0aZlBLzeVUTJ05MTMuDc9Dg2yDM7Y7951cfA78tQmxUMtJIpmeWzFBACuWHTiWJWOYG1UWGX8GN8WqbzBbVg1qc9Cvbn7VaT3re9M33+FebWUCwXXgyGPip9ssigaNVObCN5RnxnYa0byZBRH0lZM+x/Ueek264yjsF5KEyxHTg1mJZY/oe84l2nMuUzP8aIRNtB45bwas5/kPeP7sMpbpFCGaFpFuqB6vfzppvVrKXMLYu6/yZeWO5txBVcarrzh2moVzNrkHdGh3KSB+8furN7UQTQTZJLp1p7Wk8xHeHQXwWsuDU5S7gR26EztVv5ivyAsxMDxjBg4Adp5BLaxilkN86Ie6KHtQEy7f7OzjCRmol/sdeIa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(8936002)(2906002)(2616005)(956004)(44832011)(966005)(508600001)(66946007)(86362001)(4326008)(16576012)(316002)(54906003)(5660300002)(66476007)(66556008)(8676002)(26005)(31686004)(110136005)(53546011)(186003)(31696002)(83380400001)(6486002)(36756003)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVJlTWVCSlpMRHJoeGhHaFE0VGhKRCtkcEpIYnZ5a3NZdkM5UVRRZ0NrWjVy?=
 =?utf-8?B?enlMSlhYM3R2Y2cxTDNhYy9zWkc4VXQvYTBiWkxFa2hQLzVId2VQRlYza29l?=
 =?utf-8?B?VXBsK0xVRmFvazJOZTlDQWphS2s2SmE1MXpuR1VIS1dPdkZiWDUyRW8rN1Vt?=
 =?utf-8?B?SkdxUndMTUtBd3A4K0xya0RGU1V5TEFQYVFGS2lBbHZVc0RObStoVkxMaXd0?=
 =?utf-8?B?d0tJdkVoOGhBNkYza1QvQVI4WmgxL3MvU2pHTi9yWjFEZlIrZU9iZDVRMldu?=
 =?utf-8?B?bWppaWVTTG90Q04wME5IbGk0endHdWlRMDcxbkhqK2xsOGozVVNvOWpFYVJO?=
 =?utf-8?B?M2dBQ1IvTlduclZiZTlwSm0zOEJrNHZuQSsrVWNjaGtDa0sxaWZkdlBpb0dB?=
 =?utf-8?B?K25hbUdRYVBUcWNQVjVMQk5sd2x6VEYyMDllR0NuRGREa25yckR0Nk1FeXEr?=
 =?utf-8?B?dFVsQlhWbTFDNVlQVDdFc2ZBb3lBWHhidm9xbUFUS21pUW94eTVJZDFNZlR0?=
 =?utf-8?B?TTREd1ZFUFExb1RVaGRQQ01lSlNDcVh0aHhkTVJxYW80M2w0ZjAveTJRSzY1?=
 =?utf-8?B?NmZ1RU5wMmhQZGF5dnA5N0dTZEZEdHpvMG5OVEFpVW9Ma21EcGJZbWpoZmJz?=
 =?utf-8?B?cnhzNXU0bEkxMGZSZFpaL1diMXRxWW5qL0FGNkIySjF0VVdFYnJIWVhDY1hZ?=
 =?utf-8?B?ZW1Cd253OEJoYXUveE85L0llUUtHNVVvd2l6dWFHR3k4dzFWUlJrOGV0SVE0?=
 =?utf-8?B?eHpPUERKRXFFcGs4b2d0OVNOcjdGdFBYSk5lZU13TlhmQ3V1UXVnSFUvZzlr?=
 =?utf-8?B?anFSTDVpd2hxQTJKenVaNVRsbFQwMHZqZUJJY1ZQZnVqbWF4N1Q1SHZwbjI5?=
 =?utf-8?B?YjlGNU02eGJDR1hscjEvWjlYZmVYQmZjeEo3aGlpYmVrSndHMndXN1Q0Q0RD?=
 =?utf-8?B?YkdpSU45YVh5UERLWjNrZ1NTMVZ1MDZmNmNmeFA0bURiRFFrR0NUM3ByZ2NN?=
 =?utf-8?B?Z0ZRdFpFZEFJY3h0bk1VUDhJWk9yTkVKakZNOWdJUmRNUC85cVpIcm5iOGNJ?=
 =?utf-8?B?dHQraHo5ZkRYNEJ4RnUvYUZ2VlNnNVFhYXFRcWVMY2Z5T2VRVXg0T296NlNY?=
 =?utf-8?B?ZUN0YTg2djV0YWhHMFJYNGpaOVZUMlhwc3lndjcvR0RHeHVRVXJtYndWVDdZ?=
 =?utf-8?B?ZC81c1lneXRaQ1hHOTc3SW1lb3RqUy84blBGdXlWOWVjOE1xT1VGUTFDQkpQ?=
 =?utf-8?B?NURBYlBncjhsL1ZJR3ZtK2RjUHZkZ1preUV6UllsNlZxa3VWRk9XVzdoYVVB?=
 =?utf-8?B?MFBJWnc1VjV1amdKQm9WT2hpVndGLzFkOVhYbGYvVGRpSUFEeWlXN3V2OEtJ?=
 =?utf-8?B?YnpscE8yK1hrNmM5ZEpGYWc2QnBudUNyRFBXa1lLYk0weGVacEtKa0p2NDAr?=
 =?utf-8?B?T2pydlRaa2s4d0w5bk5kSkVJcU9EWm05UDg4MmNZZkprcmpPM3NDOG9pKzEv?=
 =?utf-8?B?MEpyQ21RMVJ6RTEveTQ4ZFk5QUJQcno2VDY5VGp5OFM1L0c5YngrY1d6V1k4?=
 =?utf-8?B?dC9STGdiMGlHMlJOUCsvS2lVK2tONFdOcXpPTm1nUVd4TjBpK3JwTFArRU5x?=
 =?utf-8?B?aEoyRTVmR1puaXN2OXNEZVRmeWFHNVI1dEp6N3AxRWFXeXdkMGNMTi9CU0RX?=
 =?utf-8?B?TkJOYmlBeEpuNXpMTlBaUHltbVRPWXJOYStjblJvdWs0aSs1aStseERsRTRv?=
 =?utf-8?B?MFJvRUdYWDdNNlR6UTdmNHNCc3MweHZjbUZweHZ1amlXRHpMUUFqZG40M1dE?=
 =?utf-8?B?NExTZ1FJb25LVnVPc0x2Z3VXVVFLdmpiSTQzS29tcVk2cTFJaEVuVGVQNXNy?=
 =?utf-8?B?WFg0VlVPRTJrNWNhU3BvdEx3K1hCRjV4Mnp5RG1pK1p2TGo1YTRnODBCdjJs?=
 =?utf-8?B?YjBIVXpPWVBBNnFJVE1Ma2JHYmZjNU1CbS9aL0tzaGM0bzI0TThzblJGUWFN?=
 =?utf-8?B?SW50QTJkYStOWUpDWkJhVXdSVmtZU0tIeTl4L3BDYWFrd3hEL3dpQ043S3Vs?=
 =?utf-8?B?TlY5QXlqb3BLNlE5ODM5OXFhek94emptYWVGdk44Y0tXa0czbHdHc3JEY2VU?=
 =?utf-8?B?VElqenZsZGIrKzNRRHdMSExwRFhwNG1PcGRNaDJTbVliZFhaL0hDRU81bDFQ?=
 =?utf-8?Q?BHWQYiNpWkDl4v5Q8UFLTDk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 854d6c98-4660-40fd-65ff-08d9a45f4c1c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 15:32:25.9575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwd9fxOE5JXNLCyPX9nS6eI5+Dt/gpVg6OPmpm5vf9hSRoRZkcyQ0PSQ9Q0r3WnJ0s3+e0oqRJrOYm1nd+0ECQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5457
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
Cc: "Huang, Shimmer" <Xinmei.Huang@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-11-05 03:35, Yuan, Perry wrote:
> [AMD Official Use Only]
> 
> Hi Jani:
> 
> 
>> -----Original Message-----
>> From: Jani Nikula <jani.nikula@linux.intel.com>
>> Sent: Wednesday, November 3, 2021 7:31 PM
>> To: Yuan, Perry <Perry.Yuan@amd.com>; Maarten Lankhorst
>> <maarten.lankhorst@linux.intel.com>; Maxime Ripard
>> <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>;
>> David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>
>> Cc: dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Huang,
>> Shimmer <Xinmei.Huang@amd.com>; Huang, Ray <Ray.Huang@amd.com>
>> Subject: RE: [PATCH v2] drm/dp: Fix aux->transfer NULL pointer dereference
>> on drm_dp_dpcd_access
>>
>> [CAUTION: External Email]
>>
>> On Wed, 03 Nov 2021, "Yuan, Perry" <Perry.Yuan@amd.com> wrote:
>>> [AMD Official Use Only]
>>>
>>> Hi Jani:
>>>
>>>> -----Original Message-----
>>>> From: Jani Nikula <jani.nikula@linux.intel.com>
>>>> Sent: Tuesday, November 2, 2021 4:40 PM
>>>> To: Yuan, Perry <Perry.Yuan@amd.com>; Maarten Lankhorst
>>>> <maarten.lankhorst@linux.intel.com>; Maxime Ripard
>>>> <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>;
>> David
>>>> Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>
>>>> Cc: dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org;
>>>> Huang, Shimmer <Xinmei.Huang@amd.com>; Huang, Ray
>> <Ray.Huang@amd.com>
>>>> Subject: RE: [PATCH v2] drm/dp: Fix aux->transfer NULL pointer
>>>> dereference on drm_dp_dpcd_access
>>>>
>>>> [CAUTION: External Email]
>>>>
>>>> On Tue, 02 Nov 2021, "Yuan, Perry" <Perry.Yuan@amd.com> wrote:
>>>>> [AMD Official Use Only]
>>>>>
>>>>> Hi Jani:
>>>>> Thanks for your comments.
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Jani Nikula <jani.nikula@linux.intel.com>
>>>>>> Sent: Monday, November 1, 2021 9:07 PM
>>>>>> To: Yuan, Perry <Perry.Yuan@amd.com>; Maarten Lankhorst
>>>>>> <maarten.lankhorst@linux.intel.com>; Maxime Ripard
>>>>>> <mripard@kernel.org>; Thomas Zimmermann
>> <tzimmermann@suse.de>;
>>>> David
>>>>>> Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>
>>>>>> Cc: Yuan, Perry <Perry.Yuan@amd.com>;
>>>>>> dri-devel@lists.freedesktop.org; linux- kernel@vger.kernel.org;
>>>>>> Huang, Shimmer <Xinmei.Huang@amd.com>; Huang, Ray
>>>> <Ray.Huang@amd.com>
>>>>>> Subject: Re: [PATCH v2] drm/dp: Fix aux->transfer NULL pointer
>>>>>> dereference on drm_dp_dpcd_access
>>>>>>
>>>>>> [CAUTION: External Email]
>>>>>>
>>>>>> On Mon, 01 Nov 2021, Perry Yuan <Perry.Yuan@amd.com> wrote:
>>>>>>> Fix below crash by adding a check in the drm_dp_dpcd_access
>>>>>>> which ensures that aux->transfer was actually initialized earlier.
>>>>>>
>>>>>> Gut feeling says this is papering over a real usage issue
>>>>>> somewhere else. Why is the aux being used for transfers before
>>>>>> ->transfer has been set? Why should the dp helper be defensive
>>>>>> against all kinds of
>>>> misprogramming?
>>>>>>
>>>>>>
>>>>>> BR,
>>>>>> Jani.
>>>>>>
>>>>>
>>>>> The issue was found by Intel IGT test suite, graphic by pass test case.
>>>>>
>> https://g
 itl
>>>>> ab.freedesktop.org%2Fdrm%2Figt-gpu-
>>>> tools&amp;data=04%7C01%7CPerry.Yuan
>>>>> %40amd.com%7C83d011acfe65437c0fa808d99ddc65b0%7C3dd8961fe4
>> 884e6
>>>> 08e11a8
>>>>>
>>>>
>> 2d994e183d%7C0%7C0%7C637714392203200313%7CUnknown%7CTWFpbG
>> Zsb
>>>> 3d8eyJWIj
>>>>>
>>>>
>> oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1
>> 00
>>>> 0&am
>>>>>
>>>>
>> p;sdata=snPpRYLGeJtTpNGle1YHZAvevcABbgLkgOsffiNzQPw%3D&amp;reser
>> ved
>>>> =0
>>>>> normally use case will not see the issue.
>>>>> To avoid this issue happy again when we run the test case , it will
>>>>> be nice to
>>>> add a check before the transfer is called.
>>>>> And we can see that it really needs to have a check here to make
>>>>> ITG &kernel
>>>> happy.
>>>>
>>>> You're missing my point. What is the root cause? Why do you have the
>>>> aux device or connector registered before ->transfer function is
>>>> initialized. I don't think you should do that.
>>>>
>>>> BR,
>>>> Jani.
>>>>
>>>
>>> One potential IGT fix patch to resolve the test case failure is:
>>>
>>> tests/amdgpu/amd_bypass.c
>>>       data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe_id,
>>>                                        - AMDGPU_PIPE_CRC_SOURCE_DPRX);
>>>                                        + INTEL_PIPE_CRC_SOURCE_AUTO);
>>> The kernel panic error gone after change  "dprx" to "auto" in the IGT test.
>>>
>>> In my view ,the IGT amdgpu bypass test will do some common setup work
>> including crc piple, source.
>>> When the IGT sets up a new CRC pipe capture source for amdgpu bypass
>> test,  the SOURCE was set as "dprx" instead of "auto"
>>> It makes "amdgpu_dm_crtc_set_crc_source()"  failed to set correct  AUX
>> and it's  transfer function invalid .
>>> The system I tested use HDMI port connected to monitor .
>>>
>>> amdgpu_dm_crtc_set_crc_source->    (aux = (aconn->port) ? &aconn-
>>> port->aux : &aconn->dm_dp_aux.aux;)
>>>        drm_dp_start_crc ->
>>>               drm_dp_dpcd_readb->   aux->transfer is NULL, issue here.
>>> The fix will  use the "auto" keyword, which will let the driver select a
>> default source of frame CRCs for this CRTC.
>>>
>>> Correct me if have some wrong points.
>>
>> Apparently I'm completely failing to communicate my POV to you.
>>
>> If you have a kernel oops, the fix needs to be in the kernel, not IGT.
>>
>> The question is, why is it possible for IGT (or any userspace) to trigger AUX
>> communication when the ->transfer function is not set? In my opinion, the
>> kernel driver should not have exposed the interface at all if the ->transfer
>> function is not set. The interface is useless without the ->transfer function.
>> IMO, that's the bug.
>>
> 
> Yes , you are correct , the transfer shouldn't be called before it is ready !
> 
> Let me explain more details in my view .
> Maybe the root cause is not why the aux->transfer is not called before it is registered in this case.
> I suppose the issue was triggered by wrong CRC pipe source .
> 
> Actually the aux->transfer has been registered when amdgpu DM registered at kernel boot.
> IGT test was run when system login to Gnome desktop.
> 
> amdgpu_dm_initialize_dp_connector->
> aconnector->dm_dp_aux.aux.transfer = dm_dp_aux_transfer;
> 
> The test case failed when the IGT  set an  "DPRX"  CRC pipe source while the HDMI connected to monitor only.
> At this time, the aux->transfer is NULL,  and dp helper did not check the transfer pointer NULL or not.
> It calls the transfers to DPCD read, then you see the kernel panic log.
>  
> amdgpu_dm_crtc_funcs->  amdgpu_dm_crtc_set_crc_source-> drm_dp_start_crc 
> 
> * And if the DP cable connected only, the issue will not happen.  Test will pass.
> * If I change the CRC source to "auto", kernel will not see the panic as well.
> Maybe the failed test case need to run on the DP  instead of HDMI, I am not sure at now.
> 

Two things need to happen:
1) IGT should skip tests requiring DPRX CRC source if not on a
   DP connector.
2) Driver should return EINVAL (or another appropriate error) if
   DPRX CRC source is requested when the CRTC is not connected to
   a DP display. Alternatively we could make sure that DPRX is
   not advertised as a CRC source in this case but I'm not sure
   how difficult that would be.

Like Jani said, I don't think the current patch is the correct one
as it doesn't get to the root cause. The root cause fix should be
in the CRC debugfs handling code.

Harry

> 
> Hopping this info can help. 
> 
> Perry.
>  
> 
>>
>> BR,
>> Jani.
>>
>>>
>>> Thank you!
>>> Perry.
>>>
>>>>
>>>>>
>>>>> Perry.
>>>>>
>>>>>>
>>>>>>>
>>>>>>> BUG: kernel NULL pointer dereference, address: 0000000000000000
>>>>>>> PGD
>>>>>>> 0 P4D 0
>>>>>>> Oops: 0010 [#1] SMP NOPTI
>>>>>>> RIP: 0010:0x0
>>>>>>> Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
>>>>>>> RSP: 0018:ffffa8d64225bab8 EFLAGS: 00010246
>>>>>>> RAX: 0000000000000000 RBX: 0000000000000020 RCX:
>>>>>>> ffffa8d64225bb5e
>>>>>>> RDX: ffff93151d921880 RSI: ffffa8d64225bac8 RDI:
>>>>>>> ffff931511a1a9d8
>>>>>>> RBP: ffffa8d64225bb10 R08: 0000000000000001 R09:
>>>>>>> ffffa8d64225ba60
>>>>>>> R10: 0000000000000002 R11: 000000000000000d R12:
>>>>>>> 0000000000000001
>>>>>>> R13: 0000000000000000 R14: ffffa8d64225bb5e R15:
>>>>>>> ffff931511a1a9d8
>>>>>>> FS: 00007ff8ea7fa9c0(0000) GS:ffff9317fe6c0000(0000)
>>>>>>> knlGS:0000000000000000
>>>>>>> CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>>>> CR2: ffffffffffffffd6 CR3: 000000010d5a4000 CR4:
>>>>>>> 0000000000750ee0
>>>>>>> PKRU: 55555554
>>>>>>> Call Trace:
>>>>>>> drm_dp_dpcd_access+0x72/0x110 [drm_kms_helper]
>>>>>>> drm_dp_dpcd_read+0xb7/0xf0 [drm_kms_helper]
>>>>>>> drm_dp_start_crc+0x38/0xb0 [drm_kms_helper]
>>>>>>> amdgpu_dm_crtc_set_crc_source+0x1ae/0x3e0 [amdgpu]
>>>>>>> crtc_crc_open+0x174/0x220 [drm]
>>>>>>> full_proxy_open+0x168/0x1f0
>>>>>>> ? open_proxy_open+0x100/0x100
>>>>>>> do_dentry_open+0x156/0x370
>>>>>>> vfs_open+0x2d/0x30
>>>>>>>
>>>>>>> v2: fix some typo
>>>>>>>
>>>>>>> Signed-off-by: Perry Yuan <Perry.Yuan@amd.com>
>>>>>>> ---
>>>>>>>  drivers/gpu/drm/drm_dp_helper.c | 4 ++++
>>>>>>>  1 file changed, 4 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/drm_dp_helper.c
>>>>>>> b/drivers/gpu/drm/drm_dp_helper.c index
>>>>>>> 6d0f2c447f3b..76b28396001a
>>>>>>> 100644
>>>>>>> --- a/drivers/gpu/drm/drm_dp_helper.c
>>>>>>> +++ b/drivers/gpu/drm/drm_dp_helper.c
>>>>>>> @@ -260,6 +260,10 @@ static int drm_dp_dpcd_access(struct
>>>>>>> drm_dp_aux
>>>>>> *aux, u8 request,
>>>>>>>       msg.buffer = buffer;
>>>>>>>       msg.size = size;
>>>>>>>
>>>>>>> +     /* No transfer function is set, so not an available DP connector */
>>>>>>> +     if (!aux->transfer)
>>>>>>> +             return -EINVAL;
>>>>>>> +
>>>>>>>       mutex_lock(&aux->hw_mutex);
>>>>>>>
>>>>>>>       /*
>>>>>>
>>>>>> --
>>>>>> Jani Nikula, Intel Open Source Graphics Center
>>>>
>>>> --
>>>> Jani Nikula, Intel Open Source Graphics Center
>>
>> --
>> Jani Nikula, Intel Open Source Graphics Center

