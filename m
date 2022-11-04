Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB98619BFE
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 16:46:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2782410E8AD;
	Fri,  4 Nov 2022 15:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D76410E8AD
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 15:46:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IrL3p4IMQreDBDLIP0XmuMgVpp4yy4sNzunRKY5TN5EVgsHbmlPZFWhbmmdibQzCL60FLkXFpnQW5w4OzGMBlLGraL4ouWJLT2OlIQar+5o8qB4dh5+3ch9Y+2QqlFdHUCWiThNRS9gwnQbkohMyrhjszlbDwYI6ft3JExj5nIEtB+d6eRxwag9Ph0jHKINOujfWtz1oC+Q5lLgUuB3OxuoMMr768l6jPgvOc5xpFBHFAyFyb8E4q0/aw/wYRIOoKEYEaUPhdWUWVnRuXiL9VZl17qmYjMVm+renNouqUnUNRuu38AI+juD8Q22IyqRCxn3y3fVnY82uw7SBNwZvTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8l2x4TmN/7wzJNlvHvdt05vLRCcNu4rBcOxtpMAu2kc=;
 b=JH7H9s0DxQOt7+3e4r+tSiulbBnQIEI+eFih1A5ZCTSooY+QfEHeO0UeEHdmk3yfqrBqdeFrpOBxvBO/Xddqq/LwlHGo8CpC8EoS9qRkMD0Mb9aJ16pNRpWUjktx1rNMNOZ//eH6oGfe0pS265fyTIiae3YrW1bafBKqgjZXd8mIX+q5ODwIhdx3/Y5NyYCLBb7h6D8/XHMlcKprcBriII6O2LZk7XJU46+K1C08KX16j6s/aSsLZvsltGVkU0HfgKhc8IOOJQDRMT1mnsnjg3zcjwXzpymsab8ETDottoy/dRxDf8dI91HRyFwHAob33oXDqPOwDWPRPnjiV6B5kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8l2x4TmN/7wzJNlvHvdt05vLRCcNu4rBcOxtpMAu2kc=;
 b=Ew2+bgd+kdkn0shTk2Su1a2LhQhU1+1OnZ3EOpGjcAWz0c2DuhymnsN6F3OlyomYOnsQSWu05oAJ8XqiSzoaoqfIzDz9XPQX9xvcHUNPdedcnsxAynfIMl4sITjZiI30sqVwj2J0IFCs64aQsWav89b2kC2zeAxWrpCDCYYt01p+of6UkL7bmFfpdeecBx8vhOunMRIF6rbYtzGRFF+C3nUUtJck9HDcJn5Xn1W86/PEoBi8rnOzYV5MlOnuESEMzjb0Lkqwldxl7z2YlxZFw0e9tI1nO96GT6PVAG9QJN1tg1mgQAcDIVIAK9eHPZWMbCqF0t1yGccqCO2U9lc/Dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CY5PR12MB6552.namprd12.prod.outlook.com (2603:10b6:930:40::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.22; Fri, 4 Nov 2022 15:46:11 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1912:a3a8:1a8d:a960]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1912:a3a8:1a8d:a960%4]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 15:46:11 +0000
Message-ID: <3a783b8d-4970-663f-816a-15aad5a66a48@nvidia.com>
Date: Fri, 4 Nov 2022 15:46:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 1/8] memory: tegra: Add API for retrieving carveout
 bounds
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen
 <cyndis@kapsi.fi>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220920081203.3237744-1-cyndis@kapsi.fi>
 <20220920081203.3237744-2-cyndis@kapsi.fi> <Y1aP7kDi8cJUTcGN@orome>
 <ee3073ba-d621-8b02-c986-3cf44cfbba96@nvidia.com>
 <b9b20abc-d37f-f74a-a416-2e210bf944c4@linaro.org>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <b9b20abc-d37f-f74a-a416-2e210bf944c4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0340.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::16) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|CY5PR12MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bd8fdae-7ae6-4a5f-1e6f-08dabe7bb25d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aFhlDgav19oTVKiIOvp4Dor4FgL63h0xY3J4pjbKGfZyj+l2cIpobBR0dV+O8rvkPghM7QC0GJ130NF1WF+h4Vta5IFnQ1FuJ0ZfBeMP2j5h+qwOGoZcSrCnHDgzu8/M78GVOVyCxR1xgfAZ7/5wutDkkgyNarSvf1YNjgWkjIz8GuKSCgz7uSTsa3W5O0GvjvINX5BABoMvnCFL2RQR76sqS8B664n8QZxbr+MxWFRDyyJHyOdGwB/n45wBnQGLC93vhSmMNxlg9NitCAceKfgrixEO4A8gUfLxIZ/TWfUSwBKCZ/fS/9cd4Mk1a2IP++XzJnCFhGbf4MSHpn+7cVlRDMS+izH4fkvO9e4UoTVHmR0ti78qFnNJdBW2K29k4mW+2/QCEifGYxJJMi4UZ+7jXLUZudsNG9Q8h9gw2XS+N8M7R8IN/R3P+SbHJK7dqdV2+8wql0FGI7D2fzEf7Xn0wa7gHzT6CFZoB3LiYPNVdmoBLO7xyJJtvdWj8SR7FVsqjcgWsB6R2t/gRDIG0K7JOju5PWGy9opxMk3KKOYxFh/QbQ2wZJbuweh49B8D8pz7zsUZp1WA6/m+2bMuvfTtyQgxja2j+W9m0AmVud4YfiREekjAUMgGJz0SPsOY95UnStFT2nNO/pm1DCzY+4naLDj1I1mKFZ1Sw+ghH0/TDfPrbSLMMfxKqZqOx+3yNNtdkLIKXHfv6JnqM9vIfb6a5Q+MMlONxY5BzeirYfxvjnhy3MKKdKmDuT7ozEPcdZsUieGOiGW/SUEWE8ynAqic0sx5ThGcoWCYkxZ6yvU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199015)(8676002)(54906003)(8936002)(4326008)(41300700001)(86362001)(36756003)(110136005)(31696002)(7416002)(316002)(6506007)(5660300002)(6512007)(38100700002)(83380400001)(2616005)(53546011)(186003)(478600001)(6486002)(66946007)(6666004)(31686004)(66476007)(66556008)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0JNOEtuK3JHTlRNS08vUG1SSC9ZVW1BS2xHZTJWYmhLU0NPOTg2dmVwRkxY?=
 =?utf-8?B?VlMvRUFQdUErYW01Q1ZKUWRWMzNuS1lTb3FzeHc2YmsrakVmSXFKVzREeWdL?=
 =?utf-8?B?ZVdya21nRmRZdG1iNXhxM1V0YmRkSFlGUmlqY0lsNDR2NmZBWVhuODJjZVV4?=
 =?utf-8?B?MUQySHRkdklCSVdKMFlVR0JOVkc1Z29kVmo0ZjdPQzNXQVBLZ1UxTG9tbVl2?=
 =?utf-8?B?MHAxeERMdFBOOHJ4c29zb2djRXo1S2ZJRjRPRERxbWVTTEtmNXFWZFNCR001?=
 =?utf-8?B?aTBzSXVGdm01djgyMXBzUEVKenVXRDRhT0d6WC9qemlHeDM1c3BCUGlscGg1?=
 =?utf-8?B?a3YvWFZlaVdJdnlmaCtpTlY2aU5zMytSbEkycXVWc2JlOSt0Ynd6RXVvY1NP?=
 =?utf-8?B?dFVMZGpWaU1uenFtYzN6YTFNK2t1cms5T05KSFpiL0VSekpqelExa3RmTWxv?=
 =?utf-8?B?cGN1YXV5WFVRMStHNWRQRFZJZTh6TWJBL0RqSmRld3NFWEdIYnM3aDFFVkZH?=
 =?utf-8?B?VlpNVmNFSWljZWpwYzlIUlRyV3RtUHllQ0M3Uis5VkpCWFBVYUtBcmhyZEtW?=
 =?utf-8?B?c2tuVnhORTc3OHNOREtUeSs3eHNsc3E4aGFxTlluOEJPcm5majNQaGZuWFhq?=
 =?utf-8?B?YzlINkVZYjg3dHNKNlUzWFE4a056WjFiMElwUnhlZEdjazl4YXdSUVh3SlEy?=
 =?utf-8?B?azU2RDRRSzIwTmNqNE1NU0xZTzRPbnlxUnNIQ1JpZy8rT0JCTC84UkEvNXpH?=
 =?utf-8?B?czRxcVA1Qm5QNnNZYkJMZGtmdkp2dkhmTFhROWdwbnJ6azNGL3NIdTk4M3pm?=
 =?utf-8?B?ZGdOK0RaeStISzFwT0hWdEVQVDhSM2xKakYyTWtLZEdIWXdoL1hrak1TT2M3?=
 =?utf-8?B?MkRZSEYvZloydmpjd0hDZmhVbHFFNlZLa0Z2TzF5M3ZVV2NpQmhRSmdXVCtO?=
 =?utf-8?B?ZUp3ZUkrRWlROHBOa2g5UXp1d2hoR0JCZUFaREhvNk0wbVRCR3N5OGlGZlhV?=
 =?utf-8?B?NUpiWjZyeE1KZmNPTElaK21jVkxSNmxLelF4ZkZUSHRBYkFIZGxrNEJmcjAr?=
 =?utf-8?B?RUs1NC9MREhEWnQ3VVQ0ZUk4ZmF2a2dPbzRDOXk4ckt1UVdwaDdPRU5wMzRE?=
 =?utf-8?B?S2s0ZnB5SkZqcmg2bjRBUDJseFBrV2tRc3JnVVJtOGx2eVZZWnNtQ2V0dVc5?=
 =?utf-8?B?M2IxNDRqWU1jRmhTWXV4Qys1QTFsNEkvQnpyOGFnSmV6TFVYTEpXb3lqUVFO?=
 =?utf-8?B?VFRnZUxmNmFER0hOa3JHV05UblVBVFdjdDB3Q096ZTdZZnhzMWdqYi9Md3Iz?=
 =?utf-8?B?eVFzVU5BbUVRVTZZWHFGV1NPdURBTDJlU2RZblJYQ1hBNkxnSnZZcDh1N3Bv?=
 =?utf-8?B?ZFQzdUUyaWlOR2ZGVVFiQmRMbCtPdU1Dbm04Z01xWGh0b2hRSGkxenQwNXhP?=
 =?utf-8?B?VWhmdXU2b2hncDJiWG5JWnRRN3FLUmRaaWZGVEdiUlV4K2JWSXk3L1hhd1p5?=
 =?utf-8?B?M2YzNW50Z0NBTFFIbkQwekVLOHg5VUw3SElvMFN0R1RlSTZaSkozT3FwcDZK?=
 =?utf-8?B?RVNXaW8yclRtZ25XamZYUXRkZk5tQXdDRWhhbXRYV3I3UGkrV3pBZk55WUc1?=
 =?utf-8?B?UVJ5TkxieGhmdXUvQndyWTF1emNiWnpFa1NiZnFjWDRtNjB4SkRCUmloNHdV?=
 =?utf-8?B?anhVdnVsZnprRzdUWTVxcUJIb1hvNGNCOVVCVWhIVjhsZG0xWFI5dmNnUFpn?=
 =?utf-8?B?Ly9RR3EzT2o3dWF5UDBJNnJJbHU1MU1xbmlYemN0WWc4WEQzaTdSekRyS1Vr?=
 =?utf-8?B?bzAwTkVlV0d4ZDV3MGxTdlRUMVF3MUJ6dlNSUmhWdkhBa2ZvTUFFSmgydSt2?=
 =?utf-8?B?dmlPS25PbUVFeCt2eXZtSXNHY09vckxkaUZWdmEvUCt6cXpaRkFrMjZ6TGln?=
 =?utf-8?B?V1FUVTkrV3Q4VTFOT1BrT1BFWUhaa0pSZkt1MVhiMXkxSGptcmc0UUdTUXhU?=
 =?utf-8?B?Sjh6M2cwUFRLZStXM3hkWGRWTkxMMUZoSjJoaVpULzBGM3dZVVhyRWNvVGVo?=
 =?utf-8?B?K255OTB5OC9JWW4xMUtOcHMxS0dkUUlBVHhCZGhTVG84c0p2Q3ZmR1NhWTUr?=
 =?utf-8?B?N0MzRm5td2FHbHNubzFpTnNwOXZDKzk2UGxhYnpjVUhaNVJNcUV2TWREQW45?=
 =?utf-8?B?a0d1dXMxM2FBcGx5NlJVeURVendPV2I3dWEyb2NiUldMVms2cEVVSkdUcDha?=
 =?utf-8?B?VmhpV2pCQVdDYzlPZzRtQ05NdUdRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd8fdae-7ae6-4a5f-1e6f-08dabe7bb25d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 15:46:11.1860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Uj3tZt6cYzGb+GMtosy5p9XFTVJ1V/0cFiINE6Wg8ZDDyq3U1XNagxq1Jt9naSkHxT/DGQDl/8Mxp22Y8f27w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6552
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Ashish Mhetre <amhetre@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 04/11/2022 15:35, Krzysztof Kozlowski wrote:
> On 04/11/2022 11:33, Jon Hunter wrote:
>> Hi Thierry, Krzysztof,
>>
>> On 24/10/2022 14:15, Thierry Reding wrote:
>>> On Tue, Sep 20, 2022 at 11:11:56AM +0300, Mikko Perttunen wrote:
>>>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>>>
>>>> On Tegra234 NVDEC firmware is loaded from a secure carveout, where it
>>>> has been loaded by a bootloader. When booting NVDEC, we need to tell it
>>>> the address of this firmware, which we can determine by checking the
>>>> starting address of the carveout. As such, add an MC API to query the
>>>> bounds of carveouts, and add related information on Tegra234.
>>>>
>>>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>>>> ---
>>>> v2:
>>>> - Add check for 64-bit phys_addr_t. In practice phys_addr_t
>>>>     is always 64 bits where this runs, but it avoids warnings in
>>>>     compile test.
>>>> ---
>>>>    drivers/memory/tegra/mc.c       | 25 +++++++++++++++++++++++++
>>>>    drivers/memory/tegra/tegra234.c |  5 +++++
>>>>    include/soc/tegra/mc.h          | 11 +++++++++++
>>>>    3 files changed, 41 insertions(+)
>>>
>>> Krzysztof,
>>>
>>> I've applied this to the same tree as the patch that uses it for now.
>>> Let me know if you want me to put this on a separate stable branch for
>>> you to pull in.
>>
>> Any update on this?
> 
> What kind of update do you expect?

Ha! I guess I should be more explicit :-)

Well, I would like to see this change in -next and so I was hoping that 
you would respond to the above to indicate how you would like to pull 
this in.

Cheers!
Jon

-- 
nvpublic
