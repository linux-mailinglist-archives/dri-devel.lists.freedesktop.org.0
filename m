Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2584A7295DD
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 11:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2659B10E673;
	Fri,  9 Jun 2023 09:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::61b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6910110E673
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 09:51:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCr0WqKWp2nOCNYmX8H9pVtxZKBiG234lBOIlrGJA73ME+a0ppDOBruu/MqQegstZ/fhHgg9y1QrLCT4mOIURrKv0nDDVTNwYhc45NXtNi9TKRWApv3Hxiq/HMqlZCFyX/GorJaUnR3cUSPrCsI71sKYlmoSr1xCXERedcaasI6PSsMAJbFxDUPaOyMZJKPrY439VirOA/otfZq/2tGq+bYK44n0F4M7ZQ4uRH3SsJ8drL1Xi+0jCw7MSXtBv/ZWL+6nl/vkZqhUS6o6pJZrts7dmzs9WibNHtVWk6Ir+QI/TJWhWDaHLED3pp8c1GQNjQuoBH/qUrYOGdqRb5T7PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5ltTJtfti3wDmeQX/OnWM3mrD1hr7CCkNK9wv0yPPI=;
 b=Ab9xEyITShKblsuUWX5wHrt8yqXgVYRL/TlxvZggDrRmD33uXaLY8ji0sXxVezqnsClubmS0YzwQDTnx394QqXgekwvz90jXf6AwPL31zMPGijHmOrNW2dD1RbUu1W6guEQy7yPTaF7zboRKT0MVXYbUfIqGwnRtMYIsmzUPhvrthDDLTHUO69MhLVyFKN8vUvbxe7Av8ejB8fKcVEmH+nq1OPautbo0p4WbGRhkn+setZZ8hN8iesJUtUvbBT83K1ASjZIghiSvFk5ot5FcWGQbwTRlIf2g6ulBx8n6idvho/5P1dgGSbruqqX2fMD6Rw3wEmZGkJsZ9Eu9nEcmIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5ltTJtfti3wDmeQX/OnWM3mrD1hr7CCkNK9wv0yPPI=;
 b=GDmlgWuRCuOCwdbcuFX4taeBoqWvYVSsG3XuvdyZFCw59s0YlJJp/YB6nXFVd/cVNip5dJdUrnw3B9yGtd7Mrfi2lFG6kOgbFYvE4Sk/82km8YbxZza5FF9SKb3nx17/1jib5GVBt8tHFgJBxFmWZoArBQrBewEzOD7ZyFZmWLo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2445.namprd12.prod.outlook.com (2603:10b6:802:31::24)
 by CH3PR12MB8850.namprd12.prod.outlook.com (2603:10b6:610:167::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 09:51:00 +0000
Received: from SN1PR12MB2445.namprd12.prod.outlook.com
 ([fe80::8003:206f:4024:1bf]) by SN1PR12MB2445.namprd12.prod.outlook.com
 ([fe80::8003:206f:4024:1bf%3]) with mapi id 15.20.6455.020; Fri, 9 Jun 2023
 09:51:00 +0000
Message-ID: <13a25178-7511-236a-ca05-fde1eb8b5bac@amd.com>
Date: Fri, 9 Jun 2023 17:50:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: "Liu, HaoPing (Alan)" <HaoPing.liu@amd.com>
Subject: Re: [PATCH 0/7] Secure display with new CRTC properties
To: Jani Nikula <jani.nikula@linux.intel.com>, Simon Ser <contact@emersion.fr>
References: <20230516053931.1700117-1-HaoPing.Liu@amd.com>
 <sNSf9ou1krQ0UJcBpR8Lr5KKfdOBllnwV5x6jNoCT8h9T-zSA2x0ouGg_RMKDACyrgm_MXIvh-kgpCJ4taEa1V3OyfWYekbSDPMX3KswZGw=@emersion.fr>
 <87cz2okd5d.fsf@intel.com>
Content-Language: en-US
In-Reply-To: <87cz2okd5d.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:54::24) To SN1PR12MB2445.namprd12.prod.outlook.com
 (2603:10b6:802:31::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PR12MB2445:EE_|CH3PR12MB8850:EE_
X-MS-Office365-Filtering-Correlation-Id: e28da5db-122d-4831-c1f3-08db68cf07a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cD7g8HsOK/ZsgT/W0qYpbXJ5ZybglqflH0LX65715Z0GVKWASItTGx1wFzKFN3Pwm39s9oL1KC1L46ZRgrmdABKZu0+qlPEozLaibqxIzPeHMDia3apHyxq+YjDKI8jJ4tBeHR03Ug3lSOgLRBdachQ+FAuLY5jrRnBIJq8bR7sUYtqkH5VsePVF77kVP/MaUDr4xyqG4af8XeNXZeYZSPq8mwpMYKm7BmNu7VzJd6iebWU5l52GfenWu5gKwPMNTxqpABkf4QybucVP4kSAJgu2LB7sygFwxjuj7UsJUAp45dx9z2m3oEFqp3cOD8vsM1FYh3wwdrNpdsD2jmbmrpMc2UH14DgThW6oQrdM72uIul2ow+HXh4KpnNggD5FEbxo5kZkMY2DdYF+vCa3YMa693qLFIC7ruJIVXDf38Idyv0Rxgz1iEBHCHOD9aG3I1+LwHHODQPKw+f7+158pPUtYuj8zCaUmYk7t4aZnu+NWCdY5BTC/rrREwcS+tqFsOfJTETmhToLVyC0WrEv46lmZrpy/HZSsc8v3tu/r+EENhGnfjPFfh5LjpP9CJLL0IlhIdPSxhp0/ot0k/9UUCLblCdhHQJBD1tQ4FKDKVXLSdwcvno6liUh2lfPZRWaiG0LVRJYypNJkVXYADmPxDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2445.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(451199021)(66946007)(86362001)(36756003)(5660300002)(2906002)(31696002)(31686004)(6666004)(6486002)(186003)(6512007)(83380400001)(26005)(6506007)(478600001)(110136005)(41300700001)(316002)(66556008)(2616005)(38100700002)(66476007)(4326008)(8936002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXB2eVQ5bDc1Y3JVTm1McThHNDFpcTBaWWlJTktGdGpkbG9qQm50UVFOcks5?=
 =?utf-8?B?bnM4dzdHMiszNjdrQUY5bkhLMDNZSmtackk0VkloNmZCaGphTnE5UTM5S1Nh?=
 =?utf-8?B?cG5TWjd0NERwM2lIV1VJYkI3TkJ4OFlhTmptdFNxZ1VlSFVyVkM5OGNTMUMv?=
 =?utf-8?B?YmI5QlRKdHVxQXU3Tm9Ibk5oRThrdU9GYm5zRno0VGZ6SzRhOHBaeFFjZFZq?=
 =?utf-8?B?bG85UUVJUUxScU1WS0NMZDNCbnQyZ0Z1U2ZmMUUyN0VpRjI3ZDBVOE9CQndR?=
 =?utf-8?B?b0M2Z2J3SDZLeTc0cEZzQmVMTVF6YWFBM20vSXo5TEFxcUNURlJuVXBpNFox?=
 =?utf-8?B?L0pPdmNZazZrUFNvanlSZnFFUHhSOHRlRWdKdkx3TmlnTFpWUm55Qjl0R0ZS?=
 =?utf-8?B?aTBsTW1pWW9oNUwza3c1K2RhOVd3SFBZS1cvQm5KUVMraVdhM29zUmdLVlky?=
 =?utf-8?B?MGR3V1NqaDdXZzFWVzBqSmlHZWRPdGdhUkovWmJ0bEJCanJjekpmNFZsOWVm?=
 =?utf-8?B?dEsrQXdCTWxGMjluNlZGOVdNNTRDK1hySTJZbmF5bzVzWHRZcGo4ZVhxMm5Q?=
 =?utf-8?B?dUw2OVRsT3loNHdWQzZoZlMrdTdua3FaNGhmN1dQMDJvMW1sV2JiTWpQQ1lO?=
 =?utf-8?B?c2xXZFMrM1VzdXBLTTJvbGg1U2ZTREQ3YlNmT1Q0NUJBeGc2ZG5YWWhFZGp3?=
 =?utf-8?B?bVY4V1ZSRG9xSkdhWStROU9qbTN5ZjhNbER5ZUp1SnEyRTFnWXJaSUkzd1JR?=
 =?utf-8?B?ZEh1OHVlUmhUNzYvSWRzcEJURDNDQjRWbkVkK1Y3TWxiZlJ6dGtVVW1JNFJn?=
 =?utf-8?B?Yk9vcFpDQm1QckY3N2tqa3hUVmxKYm5acXdXRE90Nnhjc3ZaM1FGNzM3OHR6?=
 =?utf-8?B?VlFiZSs2dWpIMVpsRXZrNWs5NFAwZkQxcVROYUJDb3ZYTGdvUVo3bHFUQVln?=
 =?utf-8?B?Vjl3L0wwbGFrZm9JWXJvVGNEVmd2ZkwwazNsYzNCbWpFM2JtbzhPOEFqRzB6?=
 =?utf-8?B?cEFnK3dCS2lNMVFTTzMvTy9pcW5RSTVOdUhRQTdRRytrY1YwZDBjWjg2V1RF?=
 =?utf-8?B?c3pFRWFuVlhrK3A0YTlvTWhwZlVKQjkxdlo3YWJLdXAvaVNRd0hLQmtTRGJO?=
 =?utf-8?B?b2QyT3RyV1ZFV1YvUXhUVTQ0cHc0NGt5QW04MHF5czNoSmgwQ25IYTA0a2l6?=
 =?utf-8?B?RlhCeHk1WHFObjJnQmhyQ2MxaDZCS3FVWVF3aUpIN21VNlFqSk9zRUt1ZmxL?=
 =?utf-8?B?UDVVOTgrNk51TE5CZGNHTlBGaFlOb0VKa1NaSHVRblZ2a0VLMldMeUM0dEVi?=
 =?utf-8?B?VEJuaElPaDExZUc2SjBZMFBNakxEOXM2MERuTWgrRG9pd1J1bzlXcUZCTXMx?=
 =?utf-8?B?Q2o2Y1R0MUYzR2ZVcDZYRG5iVCtlTCtERWNOd0ZqVEp1RUlDYWRJNW82ekUw?=
 =?utf-8?B?WnNFUmRnMzJYRHhTZE1LY2ROQWRIY3FrSCt2czlMcHFZT0lGTWtkdVp6a3NX?=
 =?utf-8?B?Q2FIUWgySXpSVTk3NHcvN0E5YkJFRDI5TGhnMnpsS0QxUGdGK3VCRzRlUzBH?=
 =?utf-8?B?QXFqbnhSZTgzTmY1UTRud2FidVh0T1NVQTQxbmk1UGFvZENkRldhYW92MFFG?=
 =?utf-8?B?UEZpVnRteUY5MExMbGpMMDNuQWpUbGYvUDIzQWQvV0dVaGx0MGYyWVNLVUpi?=
 =?utf-8?B?a1pGWVVvb3VWQlpiaHBsV08wS3VNMlU1a2RFMlZoZ0F2NXBxOGdKTVZXZTZ5?=
 =?utf-8?B?dEJHS0QxWWRDekJBdlVNb0laYW5VRWtsY0RPVlRCcE9sVEMxeW85TFpnOUVs?=
 =?utf-8?B?aGxxdllmcWpLT3RFL0V6Nkd6bThoV1hHdkxPRm1YK2xQb29YN3FrYWpnN0lT?=
 =?utf-8?B?a2ZheXRnM3JPS2t4MUxNbW5TZUpMWE9ZY0p5cE5pMWNhaWRlS1hCb0ppQVE3?=
 =?utf-8?B?TzRaOHVaMEZZZGhmSGRaR2NZYy9qNmFGOGhZUElTQ1VObmpBcEcwMlVURzUx?=
 =?utf-8?B?bHJsRXg1SXB4WXZ0VW5yOXQxR1IxY2I3Rzhoei9UY00xNFNnclVEZGpENUFr?=
 =?utf-8?B?dGl3cFNJWjk5VDVndW1yUVlhRmFpNkFZSHJyTXdVL2NvU1FOWEFhQisrZlpm?=
 =?utf-8?Q?3JooXvEZSJbEwykqqyElSQvRk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e28da5db-122d-4831-c1f3-08db68cf07a6
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2445.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 09:51:00.2154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FqxdRSoNxl2pLK7rf2WtjNRLQaeeTNJ7IpcrzczTFwqZomADXSLQdNGA/1bpR33fP7ZCE1aDZkkAfmLg1RhCKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8850
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
Cc: wayne.lin@amd.com, dri-devel@lists.freedesktop.org, lili.gong@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023/5/25 下午 04:50, Jani Nikula wrote:
> On Wed, 24 May 2023, Simon Ser<contact@emersion.fr>  wrote:
>> On Tuesday, May 16th, 2023 at 07:39, Alan Liu<HaoPing.Liu@amd.com>  wrote:
>>
>>> To address this problem, since modern display control hardware is able to
>>> calculate the CRC checksum of the display content, we are thinking of a
>>> feature to let userspace specify a region of interest (ROI) on display, and
>>> we can utilize the hardware to calculate the CRC checksum as frames scanned
>>> out, and finally, provide the checksum for userspace for validation purpose.
>>> In this case, since the icons themselves are often fixed over static
>>> backgrounds, the CRC of the ROI pixels can be known in advance. So one of the
>>> usage of ROI and corresponding CRC result is that as users know the CRC
>>> checksum of the tell-tales in advance, at runtime they can retrieve the CRC
>>> value from kernel for validation as frames are scanned out.
>>>
>>> We implement this feature and call it secure display.
>> I's strongly advise *not* using the word "secure" here. "Secure" is over-loaded
>> with so many different meanings, as a result it's super-unclear what a KMS
>> property name "SECURE_FOO" would do. As an example, some people use "secure" to
>> refer to Digital Restrictions Management. Something like "CHECKSUM_REGION"
>> would much better describe the feature you want to implement IMHO.
> Agreed.

Thanks, we are fine with calling this feature "CHECKSUM_REGION".

> On naming, I also think "ROI" is confusing. Nobody's going to know what
> it means without looking it up. I think just "region" is much better,
> and "of interest" goes without saying. (Why would you specify a region
> unless it was "of interest"?)

"Region" seems to be too simple. We'd like to know if "Critical Region" 
or "Checksum Region" is ok. (Although we are going to use 
checksum_region as the feature name.)

>> Also, please note that IGT already extracts CRCs for testing purposes. Maybe
>> there's an opportunity to use the same uAPI here.
> It's debugfs, so probably not suitable for uAPI, but there's already a
> bunch of crtc infrastructure in drm level to make that happen. Would
> seem odd to add two different ways to gather CRCs with no common code.

Yeah, we need a proper uAPI other than debugfs for this feature in 
product stage. We'll take a look at the legacy code and it needs more 
reading.

> Just checking, we're talking about CRCs computed at some stage of the
> display pipeline in the source, not on the sink, right?

Yes, but in the future we may want to extend this feature to support CRC 
validation on the sink side.

> What's the algorithm for the CRCs? Vendor specific? Is the idea that the
> userspace is able to compute it and compare, or snapshot multiple CRCs
> from kernel and compare them against each other? If the former, then I
> assume the userspace is going to be vendor specific too.

The idea is not for userspace to compute CRC and compare, since after 
the pipe doing pixel processing, the image data is different from the 
one in the framebuffer. Even users compute CRC on their own by the same 
algorithm, the result will is different. Currently the idea is that 
before the car is sold to the customer, venders can compute the 
tell-tale icons' CRC by the display pipe and save it. At runtime these 
pre-saved CRC is used to compare with the CRC from the pipe to make sure 
the icon is displayed properly. As a result, userspace should not be 
worried about the CRC algorithm, and we'll update this part in the API 
documentation.

> What about limitations in the dimensions/location of the region? What

Userspace should not submit a region out of the displayable region, 
because there is nothing to display and needs protection. We'll update 
this in API documentation.

> about future compatibility, e.g. if you're interested in *a* region,
> surely you might be interested in multiple regions in the future...?
> (Not saying this should be implemented now, but would be nice to have
> some vague idea how to extend this.)

Yes, we are interested in more regions in the future. We can have 
current implementation and add a region_number property later, and for 
now the number is 1 by default.

> BR,
> Jani.

Thank you for all your comments. We'll update the naming and the API 
documentation as mentioned above. Also, we will move the new properties' 
create and attach API definition to DRM and send the new version of 
patch series.

Please let us know if any further comments.

Best Regards,

Alan

>
>
