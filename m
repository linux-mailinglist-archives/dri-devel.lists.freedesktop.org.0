Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6E976D0F4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 17:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8AE410E54E;
	Wed,  2 Aug 2023 15:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2088.outbound.protection.outlook.com [40.107.7.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846D610E54E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 15:04:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/iysbE5rD9H2WFia2ZDNVVueSDowzZ3GPxUNPEkrofxnyGXpuugtpZaYb0eqGqzCDQLSxz/difwqHRbf4dpMuAMBTVgHh34dLMj+yD3xNqees684GdU3G1iZk38LTmRSyxT6KWA3JchC5UbQT8lg7gLynsnVcuOmXnSkDRhBUrSq4dAo2DEkcSBpQdTpoIDRQe6a81CgZHWRSfZPOo9+UJKEzQqXBtXXF0VfwPSDLrADjcAw0Yt/zvZGDM1sCcIn/LbgWZCn8G5xx5W03+ivZp337Sae/LLsgS8NbH1LfNf4IPHinA4NEl8t/KtIiNLV/SW8PEmua0OL+E71b4x7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VACH8YlUJRSkqqo9p/EMtOCqwx368GPRpwQKjr934eU=;
 b=KZ2SGA81/XJn4fF+cK3rxIjLUG2KCEq6LopHGrx3zx5pmGY24oxNfjstMgGAfdE623TKZ0RcYEpSKkjg+i0JTO+vsCxKQ7DbYgEMdKmh93gseeSgx+m56Wy0KwqMFMoaS7+3Yn5AQMrEgfyzOK4pV5l1lsEr7X0nTdKfCTcLKV6szVdt1iaALAkddRIJ82+Gt2DC47rqmaDQmFX+Ed0RnDW7cS4BrNkMa12Jh48XoLy4AUFLAXwTLO6dAYsD0fWN0S+O42g5TKM2OrQhO8A208kRaIfobSPBgHuFTpfwLAqT6C1h5ks4UvtEOuQoD+7DSOfv3eWAKIzoahIuQAr/Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VACH8YlUJRSkqqo9p/EMtOCqwx368GPRpwQKjr934eU=;
 b=JADAhCY2XTkIFYlfMIyashLg0guL+VjQ7LbGbBW8Wnq6YMJwlHN1ZsP8YKMJunJkc79mvZzwAih0bEPoNXzOz90yBmhIq4EiaJCfXmfrSlq0CWO4/47by2NQyXJETTDOVXghRpTxzt3bkiQEGShoy+Y0fK9QRTw4b04OCpMnmG0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from GV2PR08MB9158.eurprd08.prod.outlook.com (2603:10a6:150:d2::10)
 by PAVPR08MB8918.eurprd08.prod.outlook.com (2603:10a6:102:323::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 15:04:03 +0000
Received: from GV2PR08MB9158.eurprd08.prod.outlook.com
 ([fe80::f9cc:2e21:d017:7f66]) by GV2PR08MB9158.eurprd08.prod.outlook.com
 ([fe80::f9cc:2e21:d017:7f66%5]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 15:04:03 +0000
Message-ID: <22f45713-84f5-4a94-bd47-99aceb2df84b@wolfvision.net>
Date: Wed, 2 Aug 2023 17:03:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/4] drm/panel: sitronix-st7789v: add support for partial
 mode
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
References: <20230718-feature-lcd-panel-v1-0-e9a85d5374fd@wolfvision.net>
 <20230718-feature-lcd-panel-v1-3-e9a85d5374fd@wolfvision.net>
 <tbdwgfr4rqgytttoxhidsil42mda77qj3qmhw2do3k5rmwsaeh@qronuzdubv6q>
 <097de164-6d62-6a1d-f7b5-cbd7d4408ab7@wolfvision.net>
 <jfmsb4tmgx5rej4ae4npzq4zjh2dnydukxuk34oejbqdpe4a42@a2bbo3bwa3yq>
From: Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <jfmsb4tmgx5rej4ae4npzq4zjh2dnydukxuk34oejbqdpe4a42@a2bbo3bwa3yq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR2P278CA0007.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::13) To GV2PR08MB9158.eurprd08.prod.outlook.com
 (2603:10a6:150:d2::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB9158:EE_|PAVPR08MB8918:EE_
X-MS-Office365-Filtering-Correlation-Id: b8e315db-d656-4c69-dd7f-08db9369b565
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CjDHYSIsPazKWvCki5QRJv1xJsfpKy/VSn8Xq1Q0PxnA5w03G6/O/+ckw+2r1Xwv1FWplWOZz1+fQoFuLi88G8/cKI6TvscI+iDBtw36jLykwqnRJfU49e0YLsDg2i9zzw+jAOpjfAmenUykgC+mCihfBOFPZS/9+bFvDJG18djhY17ebmnormo5WO7iaBGzJi8C/Gc1AVpQvqZLo3Lrr1CW1MJWdvXBIuywgSEVAzqIyW1NRrrXyX4NWQVgCQPUEgi6UbrTB+vDLFesSspCepfrlUdb50HrMqBvbSMV4V4G6IBQCcfW1OHR5GsgJ3wdY+PgOpfOxCvdNSnEvCxu3hRHURY+ldfWLn5WdqNUfBWJhx/nsIFUzNA1n7XrCv8NBAl+fSj7p+XE+dbPSX0ypdoKsVJEMWx2MG1ZxhcAMNM01WFSQZhwbjlk8rWZEq5PJBxCcJIvSNhoAO8zC4thp5kfl/EyIjUmbHOymLFI260IGKU0RZP6962uA4fHcsUslkf1VEcnBiAB5a2y0nl5TyDxXcnr8cqJiUaAH0yQ3Osc69O2UENe2bOKKVYvLgg6kFom7YP3KT7gEh3xTgLo/0KcRsVZlz62KIcPdSKckkU8VSTmJeqUFb7a0qMnINQY7hKE8C7yUP7BckCCJc+U2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV2PR08MB9158.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39840400004)(366004)(136003)(396003)(376002)(451199021)(7416002)(8676002)(5660300002)(83380400001)(2616005)(41300700001)(38100700002)(316002)(186003)(8936002)(53546011)(6506007)(31686004)(4326008)(6916009)(86362001)(66946007)(31696002)(66556008)(66476007)(6512007)(966005)(2906002)(6486002)(6666004)(36756003)(478600001)(54906003)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3dTakNhZXF5VmFWcUdkNTVld3NVOHNjd25KQ3RKSWxNR1I2TDJSTU8zR3Y0?=
 =?utf-8?B?ZnRzKzkyVG1iZmlJWUZHeWQ2S3U2UFJFSlNjNHBYbXlWTmJxbXdsdldCUnFZ?=
 =?utf-8?B?UlR2NXlKU1cwR1lEZGhJNG9oblpjMUR3OFkxRUFDUGRjeDdUT1QyT0NpbE9k?=
 =?utf-8?B?NE1DWnNwU3NIZ0d2YWp6TWV6eDV2dmtVcUU3L2FIbnN5YjNFK2tNYkI4aVV3?=
 =?utf-8?B?Y0tyMVQwSnQ5WXh1bWRkdUdjKzYraGtFcGdoVnoyQlY5YXU2YVpZdFg4WE5E?=
 =?utf-8?B?eDE0alI2T2p6TUozSi8ybTRORlQvbHp6dm16UTRyR1laRmdlZGcrelNIMWha?=
 =?utf-8?B?OGNNM0ZCUW9rdmsyaU5Wc0NucFEyaldPd2doQ3lTOG5wNFNwMmZsdGJmSEl5?=
 =?utf-8?B?NmtJUHRSNnl3U0ZOb3BER1dUQjlScG9wUlh2K0ZacXlUK0Y3clNBR05BK0du?=
 =?utf-8?B?VHRMaHE5cndaSzk4YVJWMkRCOU42YTVGeCtqbmI4VWhucnp0OFNXRjZMaS8w?=
 =?utf-8?B?aWh4MUs1NFlnbEpwcmNSNWx1L2RVUlcxVU1EQXJTdGtrWWtRSmFNYUZtUVQ4?=
 =?utf-8?B?citodmV3bU01VWhBeC9yVnZTa1JXUmR3Mzk0VWJCR296am92SVk1aFhFYXNa?=
 =?utf-8?B?QWV0czlGOTBqVnJ4THFOWVVSUnBxT1Rkdk1YYkQwSWF6bDRZU2pXMm1LeUhk?=
 =?utf-8?B?bmliK1ppVDBUTjZRelVoRnRja21OQ1hXWWdpcWxua1UxbG1TUWwyaiszWHVz?=
 =?utf-8?B?dGFvRlhqWmJsdnF5SUZyem5hZzRMMDBVdXBkbE91VmNaM05DTW5uajJHRDRi?=
 =?utf-8?B?V0p6QnlLeFJOSmpFWGxwTzFBS2NVRXVocFcwSDFDKzBOaHRxTTBSWFdwSTZZ?=
 =?utf-8?B?RXJwdk5zTGY5OVRhbTFHbWFqcFplcS96ZmhpUFlzUlU0YjlxVTl4cTB1MFhh?=
 =?utf-8?B?RFhqdlEwd2lqMWF5bmRnU1BzbFRRYjlZQ1F4eEEzYmovNnB6MkN3ak1yV2RO?=
 =?utf-8?B?NFNTRGRjV2x6WUJjYm1ua0J0NndtOEJxTEJYTGZ6RzdtK2ZtQlMxeEVEcHVy?=
 =?utf-8?B?blNUejRQakxXTDEzUWVmaEY2OW5CUmNHNHJWS2ZjOWt2WnZIYlR3RGNPdW82?=
 =?utf-8?B?QnpveCtYZFBZN0hVTVZEUjdOdGpQYWdGMEdzMHFhK0t1dDUvb2tUbUFPNDBD?=
 =?utf-8?B?OEdYdkRJNkRsSnpmZ2RwRFhuZjYxMGk0Q0ZlSmdnUW9RN01YcnZ3M3lvRFhS?=
 =?utf-8?B?Mkc1dlJ6OHg2djBjdjFnakxtV0hKVFN6MHlwU1BCbXZ1RC9jUWpTUytBVVJF?=
 =?utf-8?B?b1J0KzlWWUJucTg0dEs0dVFhMDhrRDFiUUFQZ0N0SGxBRFpucTc1MXBKclps?=
 =?utf-8?B?WjhZNHoxWUFkT1p2TS84QnBhQzZzWnByNzJrcERLcDNETjJHNkl1R005N3Ew?=
 =?utf-8?B?eitaNWU1TVg4QnFHMXdTcmMvUFRhenpoUU5lclJDYy9Wck1rWWtvd1dYcGNo?=
 =?utf-8?B?cjRlaVZkZUZtTTFFNGRCK3VvOUx0b3JJYUcyWmZLK2JTR2F0UzNPNVV5dllO?=
 =?utf-8?B?eFNnNTdvaXFYODFtNjZtd2NqdG56bzBqNGcrMVBoOXozZHFUK3NwMVdOVlNP?=
 =?utf-8?B?STdWK3FaQWpFVkdzWWhvTTI5UnB3OTI3TCtSZHFQT0N1M0Y0bHhJVDY5ekdi?=
 =?utf-8?B?emNaSG85bHMwR0VrTkU5ZnZMWmlmZUI3aTVFQXV6WmU3bVZ4L2tNKytvZ3VB?=
 =?utf-8?B?NW5GbDRKWDgreTlYc3pycnVBVFMrZE1lMFh4cUFwSWFCdyt2WVBUeVB5QWxP?=
 =?utf-8?B?N1EycEdFaHB0Q05yc1N2dFNuZzhod1FhMWp4TUN0dVdZNzBlWEhVMk1Id0Ir?=
 =?utf-8?B?azNFalVCelpTT010cTJnZ25HS01JckhRUndRS3d0c1ByNnlteHBUSFRhRnFH?=
 =?utf-8?B?emVoSndadTM5L3lhRXM0N3dFcmxURXZsMVBQT1BNNVBYMnlFRXJRRkJUSnpm?=
 =?utf-8?B?TE9GR1BCSzhpN3FDSFFKRDF5MDBZL2d6M1VHMVFDUWU0S0o2TURUM1h0dHVv?=
 =?utf-8?B?TERZajhEbW14VGJwTjdjTGNxWm9IanJITml3WW1LUlRhZlovYm0xUitTcloy?=
 =?utf-8?B?OGxCdE9ZVHVVMWlxdjdhRU81QkFTWkkvK1ZSS3Blby83Z0Y1TVRTRXI2SGN0?=
 =?utf-8?B?dHV6WGxDdmt3UXJaNFNPNFpTTkZnOWJqMzZROXNBSjh2WE1LMEorL1NnRDRn?=
 =?utf-8?B?TjdVUVdDV0pqMlFtNy81T0l3ZVlRPT0=?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e315db-d656-4c69-dd7f-08db9369b565
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB9158.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 15:04:02.9140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KLmzXdHofj9k0IGK/9UEn1hIBnkgE6LdC3LnIRieN1D8Jp4c2zZHawaNHI+eOi2MJ+5ksZYN/ALORPW9ZURUu2F+UlQul1L+5A9j4rEx3bg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8918
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

In order to avoid spamming the list, I sparked a discussion in
#dri-devel. FTR the log can be found here:
https://oftc.irclog.whitequark.org/dri-devel/2023-08-02#32360491;

On 8/2/23 14:47, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Aug 02, 2023 at 02:34:28PM +0200, Michael Riesch wrote:
>> On 7/19/23 08:39, Maxime Ripard wrote:
>>> On Tue, Jul 18, 2023 at 05:31:52PM +0200, Michael Riesch wrote:
>>>> The ST7789V controller features support for the partial mode. Here,
>>>> the area to be displayed can be restricted in one direction (by default,
>>>> in vertical direction). This is useful for panels that are partially
>>>> occluded by design. Add support for the partial mode.
>>>>
>>>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>>>
>>> We already had that discussion, but I think we shouldn't treat this any
>>> differently than overscan for other output.
>>
>> Indeed we had that discussion. For reference, it can be found here:
>> https://lore.kernel.org/dri-devel/20230329091636.mu6ml3gvw5mvkhm4@penduick/#t
>> The thing is that I am still clueless how the overscan approach could work.
>>
>> I found some DRM properties related to overscan/margins and I guess
>> userspace needs to set those. On my system weston is running. Is weston
>> in charge of configuring the corresponding output so that the correct
>> margins are applied? If so, how can this be achieved?
> 
> I don't really know Weston, but my guess would be based on some
> configuration or user feedback, depending on which case we're in.
> 
> We also set the default using some kernel command-line options.
> 
>> Will DRM handle the properties generically or does the driver need to do
>> some work as well?
> 
> What do you mean by generically?

I guess my question can be reduced to "What does the driver have to do
to support this overscan thingy?" If the overscan approach is the
preferred one, then I'd appreciate some pointers as to how this could work.

>> In any case it could make sense to write the partial mode registers and
>> enter the effective dimensions. At least I have seen this in other panel
>> drivers.
> 
> Sure, it makes sense. It shouldn't come from the DT and be fixed though.

However, as indicated in Daniel Vetter's summary of the IRC discussion,
the overscan properties may not be the preferred solution in this case.

Looking forward to further comments (alternatively, to seeing this patch
series getting applied :-))

Best regards,
Michael
