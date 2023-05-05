Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B390E6F83D1
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 15:21:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAB810E5F5;
	Fri,  5 May 2023 13:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D870910E5F5
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 13:21:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nz1ACsU8KeZXtQX4UgDKldTBrMmHfuiNF+oeCweW5gHahz4S4V+vGuSuU39aR6+xgSucl3U/tvTe0fGckE4Fvi6JgrgRMxNkrLni2Vr2oXGiByydbflKfFyugre/2p5TnmNWe1MeslJ6kEWTepn5tVF9HSBHuZUjJcsGtrKVd6HBK+5Y07I9HlhUPcI7++ERvs3UKCiodMJ5G73xvO4ftZcKJj38P8/bpMGBKdae/xLCrAnnl8ztfhD4rp1SLz2BfsE9wl5lkQR9hCZ4xuD7M3jZxbfZ5+WMCF2IpyCqG/ICI1V2apYD9BdtsAV4n2HQL1mJMvAgJrlf99HWNVZGaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qzHN+hbAFd/o+5hlyMLOe4VPHEBzrL/cjJsqHHw+Zz4=;
 b=cqQTQogpfW3zeqeuDLwG/PcTmhB1TPiJZxoqw6SJ6IKfkXW8JUgW3thJ2ulu9IBq/jkDhBGn/RiVcfKJxBx7+IE8pltbVzIWsBO4mMtawVY0SSjHF4hdoCayAz7QFnez1cEb+Vxb9EDK1n50ccYwUYuNzAJ9URU+i5qAkvghpqXK5x0tDf9Js4uuYtIbP7aq0DyJ1QAhcVRySBkXDJrXFGd7/3EdPdcmW8HEcTjgZBWJAbk1SpDhxNVWJuDX5CZ4YxSr2D6KufRFerD0Y1RSinAQr1/3eK1RDHBm0bYZcWNDb018dqy/mOV3D+4ujAZs9b4DXnf9B9kxU1K/chpkNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzHN+hbAFd/o+5hlyMLOe4VPHEBzrL/cjJsqHHw+Zz4=;
 b=XOS3u20agnNmLADQR6hdcjK3hlptsu5Ppn6Y7oJPgPeHXWz62z+5rewPGvQNTb4/utwfflVEQr0zo7eTRlowhx2XzTDogc3ewpuXXx/30ca4kAXh4HhUQzEkprhJCShjqAd5UZvGiTdAFprB4p0K9c+Av3HrQ0Cg580YGB4l7Qk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH3PR12MB8512.namprd12.prod.outlook.com (2603:10b6:610:158::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 13:21:08 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd26:a6b5:1d41:ac27]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd26:a6b5:1d41:ac27%6]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 13:21:08 +0000
Message-ID: <da677863-3039-86e5-0ccc-10d1085fa962@amd.com>
Date: Fri, 5 May 2023 09:20:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] Documentation/gpu: Requirements for driver-specific KMS
 uAPIs
To: Daniel Vetter <daniel@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20230504212557.61049-1-harry.wentland@amd.com>
 <20230505114320.1eb77237.pekka.paalanen@collabora.com>
 <ZFTXl3qPn7E0pQWO@phenom.ffwll.local>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <ZFTXl3qPn7E0pQWO@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::48) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH3PR12MB8512:EE_
X-MS-Office365-Filtering-Correlation-Id: cd6117b6-4dba-4d5d-da7d-08db4d6b967e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CPTDQ63X89vgDNQbRwtubv3wVa377jlPz8gWfwMV2NuOCsFDupMtbr7JgqLpdCcdzmsWNoMpLyuBbxYEYj3CBfdiffc6NfVycLcvTiEDPGaMHsfJxYvf5IHT+T42CI2NJeWlB3rz+LsnPUrMTCYsPoloygHG4m4XDJSEZiFINpxKdQLuuMDHihgN00ooqlSGauFsQrDJdBmcBa+B7p5GmD+HKpG4COuLcxzphKDLHJTpMqrlnHv9JAVwCNm8SqFWm5eX4Bv0/GJjo0lpQFwWybue/WrNFmV9Mv7vG5hDrk+1RYrvd6VG9HueyzdGjFyrfrBpmotO3BAhb7EHj7bWayr1pwDDq5V9nzIHZMEd+0l9lyDljNlD1TPKiZD9lsuygzpFTpbxe6pUJ0utVAuJvQ1xUMULIjFeS72b1wEKRdjRTOSg38/a3JdaP9ytvmIBVBFaTRpssax1BJsDQFxE4+wN2590g2v7SqFsfUug4Ti3p4o4Gw0iMBIO3WMcn2u9TkMCA5tNhyvsiXdHLeUbHcg56UIctElpAcJsc8152WodOSewnqFBJWrEPk+hvCYSW8azFKQbTrNQBY23Sv25lfEzO1S+2FpYhucYsGxjjE8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199021)(31686004)(66899021)(8936002)(6512007)(6506007)(26005)(8676002)(7416002)(966005)(53546011)(2616005)(30864003)(2906002)(66574015)(83380400001)(44832011)(41300700001)(4326008)(6666004)(478600001)(6486002)(316002)(66946007)(186003)(5660300002)(66476007)(54906003)(110136005)(66556008)(36756003)(86362001)(31696002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1p1MDZVYzhvcHdVMklxaHlMUnVRczJrMHRiK1hGK241ci9FR1FkN2dybFNX?=
 =?utf-8?B?ZEhDMjVvOXoyWWdEZmMzVW5ab0luVGl0MDd1YlNTUVBYQnBQQkVaSFNPd3Jq?=
 =?utf-8?B?VTlYYjdBT2grQ3JSLzhzSU5hL0xtUHBwK2F5TVNsUG5MMWVEQ09iWXVJVXo0?=
 =?utf-8?B?bG9vdUdlUEVYSE4yM3M1VVl5NHZpeERBbVNQWXhNaUR0eTNSc3VSQUl0QXlG?=
 =?utf-8?B?YmIxRTJ2L09jT2U4OE1hVU82dXhjS2wxd1lqRWRmMTFaczFJbXpSa1h0ejdq?=
 =?utf-8?B?dVFYYUhLWEp1Sm5OWG45MGpuUVZuTnlRdHpkUFZYdzNibU9VNUFILytueGNG?=
 =?utf-8?B?VkswM0NYSHExVHRhMUh5Q3hnM0ppdWQwVVlncUkwcXpPb09WOGU5SE9KMm9F?=
 =?utf-8?B?QmpGbURXR0Y3TVRDR20vWHpudjRWcFIxR0l5QVRFK0JXdnJzdjBDeEIrajFl?=
 =?utf-8?B?bHdNdzlOTStPUXlKdjJlNXI1VWs4YklmeWp6ODcxWjh0ZzZ1NGZYcDNUa09t?=
 =?utf-8?B?Q1ZMaHVIZldYbFVDUHVrUEdDUnJ5WGh4UjRkMzdFU2V2VTdhZ1NQOUdiMFU5?=
 =?utf-8?B?RkdUcmVTWWdyTzI1RGNVNVdzbHkrUjBrdTNIb0VaeFc5Y0l6RUVPcDR4b093?=
 =?utf-8?B?cE5VNXNMa2MxWGFuOG5XYjZkaVhLbjZQcDNRNlNIM0drZ25yMER2TTlSY2d1?=
 =?utf-8?B?Yi9qQVRwR3l3Z3JJckRFR2xNRFQvaEkzSzNzRUN3SkYvZGhUQnVwN0tGNmFo?=
 =?utf-8?B?LzdCT0xEb3RXZm9aVHhSTXhnRlRHTEIxMEZzZ05QOGZ6VWE0bDNJQlRseGdx?=
 =?utf-8?B?dkxpOWxvbjJlM0VKekZ2RTZHc1graFozc3c1R1lzVGl6alU2NU9obUlKeGpa?=
 =?utf-8?B?a3hGRTJablFsdlhSUkNac2hiQXdyOWdNa0QxeE5wK0REanA2cXA3ME5ubEZo?=
 =?utf-8?B?MDZwZEt0aFhPWDRRRE1CUC9jTk10TlJNY2IwVy82Z2VhZjlSczQxRVptWktt?=
 =?utf-8?B?cE4xTVJpY0xycVhrMmpsbW1xWHZYbVZ3WEplWWlxRyt4alNzcjk1N1lKTlRI?=
 =?utf-8?B?UVplZGI5bE44bWE5QkZyTlZCTEM4UnAzeCs5UzhYRkx2YXZhaHdodXFyZTQ0?=
 =?utf-8?B?aUVKb3BCbnVYbXkrT2tGRjJiaEZPZ2hOZkRIbjRHaTBuY1lrMlRWcTA0QWFy?=
 =?utf-8?B?d3BIaHkrYmY4Z21WeVk5MW8vRm9mb2dzak84bHNEUTRYTDVJWHhXUEdPRGNl?=
 =?utf-8?B?NE8zZW1IazV5dG9SQ2NCalVUU0lNSndmMk82V1c5T2JSZFVZZVlMVUhEVWtP?=
 =?utf-8?B?VDJ2RkhJQ2tpaVF5MXdyWlhDVGFEcXR3TjdkY1RBSWJHYTY1VGxLOTZYYjVN?=
 =?utf-8?B?ZE5wZDQ4cnBRbWxZRFBhdkNSVlI4ZXhqZlZDUi9uRVhkSGFSK1dLdHVDNUFH?=
 =?utf-8?B?QzVzYktraCtlamFrMDhiY0JxTVpoc21UMTBWYmVTaWt0bFlsZGFXK0ZxWHdz?=
 =?utf-8?B?RXU2VGdabUcwWFJlajhTSFFJekVTNDV6OEhzcm0weDR4d251ZGxJOEJ2MW5j?=
 =?utf-8?B?UjA5TUZHVFp1K0wxbjc4YVlHN1NodS9xSUkyYWdhckppT01KQ0ZiRWIxSjBy?=
 =?utf-8?B?TDYxQ2VtSjJEbTZsVVJIK1NnbkJHUzBpUThqNnNIR05FN1MxcmozU2xwVDky?=
 =?utf-8?B?NGIzS0RUVE55ZkRjS2hIRXorQi9IOWNiQTVqTnNnUmJlK05OL3dBaWNIdkVY?=
 =?utf-8?B?Qnh1Z0ZrZTBYQlA0YmdBWmtya1BUdGFOcTFPL1JNMG80a3lIWnlZQkhacFla?=
 =?utf-8?B?TnlicG1WaSsvRkpob2xKZTl0UFA0aGRyVVB0YnVGeUhiZXhqREQrSXZKcVR2?=
 =?utf-8?B?SE9nN3lwVG1ZWGZJckxrNHZoN21oTWFRc0hnemlXSThMdVRKMkFmemQrMzhr?=
 =?utf-8?B?ZW16bi9NTzRSampTS0o0Tk92QkpkbTdhbHVBdXl1RDVCY0xhWGNHYjNsQ0Ey?=
 =?utf-8?B?elF5TS9vL3E2c1Rwb2JxVVFxNFd1WFZmL2hTV1VEN1lOLzJONFV2V2FQTEF3?=
 =?utf-8?B?Q3NLUTJOeE5oYXgzbVpFR3l6WDdDbHUvSGxOM21QTW9mRGlxTUtPK0JwWnBH?=
 =?utf-8?Q?5nTlBX8wnx6a3mqpC5CtB0G+1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd6117b6-4dba-4d5d-da7d-08db4d6b967e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 13:21:08.7129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LjZ0SOPKOETUg0czu5EmakFP6rYn8qxi6hKwdZ8Jq1HPQh+z5bN1lFcZ0MVoIm44AkJpmDgu2eSAnY8JGRbZ1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8512
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>,
 dri-devel@lists.freedesktop.org, Xaver Hugl <xaver.hugl@gmail.com>,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/5/23 06:16, Daniel Vetter wrote:
> On Fri, May 05, 2023 at 11:43:20AM +0300, Pekka Paalanen wrote:
>> On Thu, 4 May 2023 17:25:57 -0400
>> Harry Wentland <harry.wentland@amd.com> wrote:
>>
>>> We have steered away for a long time now from driver-specific KMS APIs
>>> for good reasons but never codified our stance. With the proposal of
>>> new, driver-specific color management uAPIs [1] it is important to
>>> outline the requirements for the rare times when driver-specific KMS
>>> uAPIs are desired in order to move complex topics along.
>>>
>>> [1] https://patchwork.freedesktop.org/series/116862/
>>>
>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>>> Cc: Simon Ser <contact@emersion.fr>
>>> Cc: Joshua Ashton <joshua@froggi.es>
>>> Cc: Michel Dänzer <mdaenzer@redhat.com>
>>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>>> Cc: Jonas Ådahl <jadahl@redhat.com>
>>> Cc: Alex Goins <agoins@nvidia.com>
>>> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
>>> Cc: Melissa Wen <mwen@igalia.com>
>>> Cc: Aleix Pol <aleixpol@kde.org>
>>> Cc: Xaver Hugl <xaver.hugl@gmail.com>
>>> Cc: Victoria Brekenfeld <victoria@system76.com>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: Dave Airlie <airlied@gmail.com>
>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>> Cc: Uma Shankar <uma.shankar@intel.com>
>>> To: dri-devel@lists.freedesktop.org
>>> ---
>>>  Documentation/gpu/drm-uapi.rst | 32 ++++++++++++++++++++++++++++++++
>>>  1 file changed, 32 insertions(+)
>>>
>>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>>> index ce47b4292481..eaefc3ed980c 100644
>>> --- a/Documentation/gpu/drm-uapi.rst
>>> +++ b/Documentation/gpu/drm-uapi.rst
>>> @@ -118,6 +118,38 @@ is already rather painful for the DRM subsystem, with multiple different uAPIs
>>>  for the same thing co-existing. If we add a few more complete mistakes into the
>>>  mix every year it would be entirely unmanageable.
>>>  
>>> +.. _driver_specific:
>>> +
>>> +Driver-Specific DRM/KMS uAPI
>>> +============================
>>> +
>>> +Driver-specific interfaces are strongly discouraged for DRM/KMS interfaces.
>>> +Kernel-modesetting (KMS) functionality does in principle apply to all drivers.
>>> +Driver-specific uAPIs tends to lead to unique implementations in userspace and
>>> +are often hard to maintain, especially when different drivers implement similar
>>> +but subtly different uAPIs.
>>> +
>>> +At times arriving at a consensus uAPI can be a difficult and lengthy process and
>>> +might benefit from experimentation. This experimentation might warrant
>>> +introducing driver specific APIs in order to move the eosystem forward. If a
>>> +driver decides to go down this path we ask for the following:
> 
> I don't like this for two fairly fundamental reasons, neither of which are
> that sometimes merging stuff that's not great is the right thing to do to
> move the community and ecosystem forward.
> 
>> Hi,
>>
>> should it be "require" instead of "ask"?
>>
>>> +
>>> +- An agreement within the community that introducing driver-specific uAPIs is
>>> +  warranted in this case;
>>> +
>>> +- The new uAPI is behind a CONFIG option that is clearly marked EXPERIMENTAL and
>>> +  is disabled by default;
>>> +
>>> +- The new uAPI is enabled when a module parameter for the driver is set, and
>>> +  defaults to 'off' otherwise;
>>> +
>>> +- The new uAPI follows all open-source userspace requirements outlined above;
>>> +
>>> +- The focus is maintained on development of a vendor-neutral uAPI and progress
>>> +  toward such an uAPI needs to be apparent on public forums. If no such progress
>>> +  is visible within a reasonable timeframe (1-2 years) anybody is within their
>>> +  right to send, review, and merge patches that remove the driver-specific uAPI.
>>> +
>>>  .. _drm_render_node:
>>>  
>>>  Render nodes
>>
>> Seems fine to me. I have another addition to suggest:
>>
>> When such UAPI is introduced, require that it comes with an expiration
>> date. This date should be unmissable, not just documented. The kernel
>> module parameter name to enable the UAPI could contain the expiry date,
>> for example.
>>
>> After all, the most important thing to get through to users is that
>> this *will* go away and not just theoretically.
> 
> There's no taking-backsies with uapi. If there is a regression report,
> we'll have to keep it around, for the usual approximation of "forever"
> 
> And this is the first reason I don't like this, from other write-ups and
> talking with people it seems like there's the assumption that if we just
> hide this behind enough knobs, we can remove the uapi again.
> 
> We can't.
> 

Yeah, that last bullet was least sure about. FWIW, I'm prepared to maintain
AMD driver-specific properties for this "forever."

> The times we've hidden uapi behind knobs was _not_ for uapi we
> fundamentally didn't want, at least for the long term. But for the cases
> where the overall scope was simply too big, and we needed some time
> in-tree to shake out all the bugs (across both kernel and userspace), and
> fill out any of the details. Some examples:
> 
> - intel hiding new hw enabling behind the alpha support is not about
>   hiding that uapi so we can change it. It's about the fact that not yet
>   all enabling has landed in upstream, and not yet all full stack
>   validation on production silicon has completed. It's about not shipping
>   buggy code to users that we can't support.
> 
> - atomic kms was simply too big, there was a lot of work in compositors
>   needed, testing corner cases, and details like adding the blob support
>   for the display mode so that modesets would work too with atomic. We
>   never landed a preliminary uabi version of atomic (there were plenty
>   floating around) that wasn't deemed ready as the long term solution, we
>   were simply not sure we got it right until all the pieces where in
>   place.
> 
>   And viz Xorg-modesetting, in at least one case we still got it wrong and
>   had to disable atomic for that userspace.
> 
> - nouveau pony years back tried this entire "oh the uapi is just
>   experimental" thing, and it resulted in the by far worst flameware
>   between Dave and Linus on dri-devel
> 
> So _if_ we do this we need to be clear that uapi is forever, and not have
> docs that suggest otherwise.
> 
>> If that date needs to be moved forward, it should be possible to do so
>> with a simple patch gathering enough acks. The main thing is to set the
>> date from the start, so there can be no confusion about when its going
>> to the chopping block.
>>
>> I do not suggest that the kernel would automatically runtime disable
>> the UAPI after that date.
>>
>> Does any of the big idea fly with upper maintainers and Linus?
> 
> The other reason, and maybe even more fundamental one, is that I think the
> uncertainty of not documenting how pragmatic we are is beneficial.
> 
> We should definitely document the gold standard aspirations, to make sure
> everyone knows where to aim for. And I'm definitely all for pragmatic

So if I read you correctly you'd prefer just a short paragraph along the
lines of: avoid driver-specific uAPIs and instead define vendor neutral
uAPIs in core DRM?

> merging where it makes sense, we've had tons of that, and happily carry
> the costs to this day for some of them:
> 
> - a lot of the early soc drivers are kinda meh, and will stay that way
>   forever since they're not maintained anymore
> 
> - we've had very much free-for-all vendor kms properties, and I expect the
>   hall of shame witht he big table of vendor props with barely any docs
>   will never go away
> 
> - we're taking all the compute runtimes despite that mesa on the 3d/gl/vk
>   side shows how much better collaboration would be (and I think soon will
>   show the same for media) because having a compute ecosystem that's
>   substantially weaker than the sum of all its parts is still better than
>   nothing. And the situation is still that collaboration even with a
>   company is often impossible, aiming for better is not very realistic :-/
> 
> But the goal is still to have solid code, cross-vendor infrastructure and
> collaboration and all that stuff, because that's why upstream is strong.
> And the uncertainty is helping us for a lot of reasons:
> 
> - it makes vendors vary of going with vendor solutions. Minimally they ask
>   in private, which gives Dave, me and all the others doing vendor
>   outreach or working as some ambassador rule at a vendor an opportunity
>   to steer things in a better direction. And often do the steering
>   _before_ code gets written.
> 
> - it allows Dave&me to more freely decide when to be pragmatic, without
>   being bound by rules. The point of pragmatic merging is to bend the
>   short term principles for a better long term outcome, splattering that
>   entire space full with rules makes rule-bending a lot harder when
>   needed.
> 
> - most of all I really don't want to be in a discussion with vendors where
>   they try to laywer-argue that we must merge their patches because they
>   strictly followed the wording of some pragmatic merge rules while
>   entirely tossing the spirit of what we aim for. I already have more than
>   enough of that, this will result in more.
> 
> In all the past examples of pragmatic merging we never documented the
> pragmatic approach, but instead if we documented something, we wrote down
> the ideal standards to aim for. That makes it easier for everyone to do
> the right thing, and harder (and more expensive due to the inherit
> uncertainty) to try to bend them towards the least amount of collaboration
> a vendor can get away with.
> 

That makes a lot of sense.

> That's why I really want to keep the undocumented and hence uncertain
> rules in this space.
> 
> For the actual case at hand of plane color handling, I think the pragmatic
> aproach is roughly:
> 
> 1. land the amdgpu code, but without uapi
> 

Would it be acceptable to guard uAPI bits behind #ifdef AMD_PLANE_COLOR
so anyone who wants it needs to do -DAMD_PLANE_COLOR or should we leave
those bits out completely so someone who wants a kernel with them needs
to apply a patch to add them?

> 2. use that (and any other driver code that's been floating around in this
> space) to build up the kernel-internal infrastructure - the proposed graph
> of color transformation blocks will need quite a few things
> 
> 3. land the uapi on top in it's hopeful final form, maybe hidden if it's
> not yet complete or ready for prime time as we sometimes do with bigger
> projects
> 

This would be the vendor neutral uAPI, so something like the RFC Simon
sent out, right?

Harry

> Obviously compositor work, igts, docs and all that too, and most of all
> this can happen in parallel too once we have a rough consensus on where to
> aim for.
> 
> Cheers, Daniel

