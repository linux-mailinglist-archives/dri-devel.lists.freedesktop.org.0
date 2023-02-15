Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F9F69869E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 21:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F4210E142;
	Wed, 15 Feb 2023 20:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2089.outbound.protection.outlook.com [40.107.96.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730C110E142;
 Wed, 15 Feb 2023 20:54:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHIShaJqberR8br4q6t78odJXZCjfND7UFZ0yyoHuTKTP7pK4/ADwJAGT3JV7g/R7Xzt8rfqBHkXS/ka8/x82mpr0eQtLP45kUEEVLeG4LyYrlZqr5vsfTMePuZJ4RynpHwTyBOfPLAnY0RgpWZ0PfC2r9M6RTbDX3mzBdCDZuZi5XvwelPHqpbsktHR/LOoJZCN3xXGSYmxdRNxVZ3RCCt0vaG1VhHCzYG6Dx1tfNGd0EtuiBEbl5GSpHdXltEyV0ur/ayuwsGR+rPVdKeI+figLsf732MG3LB+qih+9Ty6HC0EDJPiIlOAASAyokT9RL/OBgGHimRqHNAx1vOBsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0B8GwgB5FuJ6u3RnrSznYFykJPD0dVWUfoZ4I3Bm7Y=;
 b=Ih9rLpQog7FaVfwe/6sgCsuSYdBZkV7QpgZFv7Bv5cDpdcWStCb5XV4sgyuISRLD3k+SGRJCZpNYyXGUIG2ovjhIOvvF78Az/dOUFgk0itoaRD2gpgSXuKKjEXCP3YN+IWgfSRTRT43ztKWFkVGs9VNopo+qLo+ehbLmy8xYukNG2ala1UuOIAMHGjt7qXbuUqBF03VwB0VMnW9HL7Aj7Dfjg1XRk6T60KHBWKRoHacl7TcsGYqNdPKhGY32F6pFWX1SMcOyz7Z0aH/QCH/tXSxsyNZrbH7Lva9sqdFZWFu6Wo3U9vj07UNnRu9t1C5TkEkwcX+LzhU8PUK7P/J9yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0B8GwgB5FuJ6u3RnrSznYFykJPD0dVWUfoZ4I3Bm7Y=;
 b=N/KyoUYCR215b72rh4T4+aoq34Gk6fM1U0enlcolxwvH17PwfE7N4OKK/1k9N2nBCgfijbUE6YDgpGTCmG3SgtVoVgFGNoh1XGrTxKKCzaZ8eEb5PMsNdXY2UKhNJGDSc0QaCGM45mHFpiRK0yt3nyAfLInZ7CIpSYSHfXOVfGg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SN7PR12MB6888.namprd12.prod.outlook.com (2603:10b6:806:260::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Wed, 15 Feb
 2023 20:54:27 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a%9]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 20:54:27 +0000
Message-ID: <5288b9ef-ed1f-842f-4fa3-0cc00a1b1188@amd.com>
Date: Wed, 15 Feb 2023 15:54:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es> <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com> <Y90l+DY0rSaMvN1U@intel.com>
 <758e5cf6-53e0-567c-c760-5b773bc7a11c@amd.com> <Y90vrEa3/1RbaGOV@intel.com>
 <CA+hFU4wuM_xHniFyRT+jouQ3k_S3UJsRpAtd1Lgx9UVLtrqZrQ@mail.gmail.com>
 <98d1d22a-1c29-5271-1eaf-89c962eb9678@amd.com>
 <CAPj87rP0E17Z8beoDi_c+RdcpyZnCXTrxFkQSJUi0qN2GNoq+w@mail.gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CAPj87rP0E17Z8beoDi_c+RdcpyZnCXTrxFkQSJUi0qN2GNoq+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0240.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::14) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SN7PR12MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: cd7dca76-1806-4d32-85e1-08db0f96d35f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LNSLyImbt6T52ra+LHRJ4hxrshPBh1hGOmy78MKNXgdqS/6Iut2YtBlFIi7/AKuaG9R1HcukcM9I2pRW57/NQX1Gc3wI6PhGYQELhPGmYK730ecoiitl81v6GrnrWUdDfFbAZTutyFrp/PHZjv04sPDe8o/ViTJHSG6mE8oBI7NZ3AXzdnq9SCiymCicluguQepMzEc51V/IGH/pJy7ElXDCzuc9rmsLiqVGfiPpwB+bhejA1qZnlWzBcI7J4yioS+Dw0AUoSK0NCPhLTIlYx6nuJk+uMCm0u8RL4cUoLPZs54q8uahrltiTUqt5ZmsAjAC+ngOY5Npcpgh28TvIGJgGXsz9Dq6M3skMR1wD0OhkKYrGL0iBhkyuT3N7aHbUvc6WW22l3HLcGApzW3MJ9JADg/GT391G5mmYGYfU6j57BRN3icbOuZ12PNrPXFrSHYrAkW22Nak0oKULLFaDTHozECsFF4omFthZ9+rTpsnrmAjixsfnXizSl1+EgdmCOdBJm6gdfqtywCLYO4T5Pwr1QDbxzam3G21sA6UheJxvY9mxKX6AMIzjpOf6u4EuXR/uUn0eiDBMfkcMxsrskmX+tUtFwT54A6tdMgK4XnpvsXa6W2EkZRYrykcmWle3REverL/oYA1ktKposmyil7IYerPm0LngbxAV/qR9iFFT1QYzY8aE/s4zfFzp8L1VA4rgsgTzmCQGr1PZN4OxbZ76S8GrISBHUD2CFOfLLx8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199018)(36756003)(478600001)(86362001)(6486002)(44832011)(4326008)(41300700001)(6506007)(6666004)(316002)(54906003)(53546011)(5660300002)(2906002)(66946007)(6916009)(8936002)(66556008)(66476007)(38100700002)(6512007)(186003)(31696002)(26005)(2616005)(8676002)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aC9NNkRnZ2FhOEhaeWMwQXJnd1l1UktuM1RxOWc4ZktaVFRsQmFHVkt5NnBi?=
 =?utf-8?B?ZVFNMnlLY2JUbDlYeUw3L3BBY0ppTExLNUJjYU9EaUxMMEwzMU1HRm1LR0NR?=
 =?utf-8?B?UEhHYnhNei9aZnErcFF5UVBIRGRzc0doTUtGV2dyMHp4VTN3VG5jK1FtTDZZ?=
 =?utf-8?B?OCtNR1BOZmJwRUxRYnRJM1NxbjMzRXR1STg4WjN0QW5JbER1czU4LzZCVUUy?=
 =?utf-8?B?Q2tqaXoyeXBsUVJWSnEzYkhaalAyNUdEWVhYT3Ixbk5JNkZVZTZQN0tKSnZQ?=
 =?utf-8?B?anlzanlHQmRVSktvaVk4MGl3TGhab1UvYUhPamljRjVNVUdkaHg1RFBqWnJE?=
 =?utf-8?B?ckdkdXlpMGJNQTRpcVNjWVI1SWdKcTM5MVVDc20rcUFKMGVUQU5oMGR2TC9w?=
 =?utf-8?B?V0JLZHBQUVYrMUhPSzM4NGdoR1B1Z1BCSWoydnJRalRaUzJPdUNZd09NV0pV?=
 =?utf-8?B?ODUzVU80ajd0SndVL1QyUDJtMklYWnhRWjBid2x2emdBUHlYTUNZeXFvekxn?=
 =?utf-8?B?enF5d1Z1NEpYWWZIYXJwQUk0V2tkZkloMk5nL2Vld01qK3Z0K0NNWDBOSGE5?=
 =?utf-8?B?Nkswa2NCMnhrVytDSUtRa0NqekJHNU5jaTZLL2c5b0pPODBrU3BYQVpRSWo1?=
 =?utf-8?B?WkJTeWtwelpwcjByZi9Xa2NkWDZPTVpkRVk4bTB4YWlFcE5TdE9BNkRZZkhW?=
 =?utf-8?B?N3lMYmRldXE5N21iOTNIZStDNlA3KzFGTU9Td0xBbTA0eHlIT3VReGNaVGlQ?=
 =?utf-8?B?SjBIL0tNNVhaeDFtTlc2ODRxaXhyVHlud05sWWpwT2FScHljaEJ6OElFU1hZ?=
 =?utf-8?B?bkNEYUlUd2pKcjNGVytQTUNuOFNmeGNwTWlGa3lkOVVRaEVEWTBxSTRWYTJ6?=
 =?utf-8?B?R1RzLys0eHEwSmJtOXJTT2tDemRvNmh4eUFLWkpxNWF0UHNjNVRxMTFWNmZa?=
 =?utf-8?B?SE9SR0xjT2RsbzhLT3UxQnp3WEVJK2lWVHQ1ejhXamdoT0FWVEtyREFHMFlk?=
 =?utf-8?B?SWtiYi9CNTBxdVNRUk5NeXkrN0h1ak1yU3lXUTExNkhtNnVEa1I0K3ZHbktZ?=
 =?utf-8?B?Ny81cjNQcmMrZ3FFSXR3OGIwWGhybWlwa0xDYTFNTG96Q2dLcTU3V2RJQmRG?=
 =?utf-8?B?OUgvV2pCR1RyWm5UY3pKRS9iQ1lqaHYrTmJBTDE1ZERldVovZnZkb3dSUU9i?=
 =?utf-8?B?cG9DVm9SWERWNEJTbms2aDJCcktVWkVkRVR3Q1BPeFI4ajhISGUwWGdIbmJo?=
 =?utf-8?B?a05nWVhDdHFWbjhya3B0VzNhOTNxSG1xK0VBeGdRRW5kNmRhVlArOXdpTHdF?=
 =?utf-8?B?MUZMOGc0WThSY0xFeDJieFJWM1padW5PUFhkZ01rZGNSVmFSNnE0S0pFZHZH?=
 =?utf-8?B?UmlRUVNQRjFkVkl2Q25NeU1HR1IvNXRxWEdlRnpNRndEcTNwZkxHQVdWTkd3?=
 =?utf-8?B?ZzU0VXVwaXduTzVuQzFzOFN0cU9IczQwdmJYb3J1eVM2Z2ZmOUMyNG9xS0VU?=
 =?utf-8?B?NmJrdHBxS1dHNlh2cjRsYUwwTXQ2L2twRHlJUUxaclQ2bDVkaDdOb1Jrdmcv?=
 =?utf-8?B?VkRoWnNaK2pvWUpJdXFEWmU0UWh6RUxkWU01TktiM3RrTUFVcWttaGVET3Mv?=
 =?utf-8?B?TTR4d0cyMVZ5azNDaEgzemdJY0lob2t3aDNjcWluQVR5dnkwMk94My9XaHpG?=
 =?utf-8?B?VmhTN0p0Z0dSd2VsR0x4OExKcXMzYkxNT3FESnVodHY5VzIrTEZzaFNLZTRm?=
 =?utf-8?B?VEVVd1FPaTRwN2p5QVo1V0pKUzVpOThCaUtMR3Zwa090cnlQSmgvV0kwZkY3?=
 =?utf-8?B?UlF2eUJNaDhKTUdyVVFkNGVra1JFcHhmeVJsTDByVEJVVWFnc3k1RS94Z0R4?=
 =?utf-8?B?NWRkVnJwRlppNFlDbTZYQ04zREVkQVhhN0g4eUgvcEVKY0hOMTNMbGsyR3RP?=
 =?utf-8?B?MDR3U1RNbEVySXRaenNJVm5oSXFxNmU5WnBJT3pxdW5ZL2dNZUZjN0N1bHp1?=
 =?utf-8?B?eVUweUtiTStiNUkyVVVFdXk5NkJxU1d1ZnZjdGIvTUpkcXNsdlVvSFpIWjFE?=
 =?utf-8?B?UWRZWnEvNE5SdjVJVmk2dlhVYmVVdDlaMzZlaVhCKzJxN21PclZlNlYyWWU2?=
 =?utf-8?Q?H9OPYs50I/szoPC6V/pEwsQyi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd7dca76-1806-4d32-85e1-08db0f96d35f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 20:54:27.0830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7yH0luRs3/ZGEMKCFpcXLya8YfKWxWcqymknQ3iuYV+YlB5Su620ABKoR6JlhmzCvslVwiTRBjPg4RfSFESDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6888
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
 dri-devel@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/15/23 06:46, Daniel Stone wrote:
> Hi,
> 
> On Tue, 14 Feb 2023 at 16:57, Harry Wentland <harry.wentland@amd.com> wrote:
>> On 2/14/23 10:49, Sebastian Wick wrote:
>> From what I've seen recently I am inclined to favor an incremental
>> approach more. The reason is that any API, or portion thereof, is
>> useless unless it's enabled full stack. When it isn't it becomes
>> dead code quickly, or never really works because we overlooked
>> one thing. The colorspace debacle shows how even something as
>> simple as extra enum values in KMS APIs shouldn't be added unless
>> someone in a canonical upstream project actually uses them. I
>> would argue that such a canonical upstream project actually has
>> to be a production environment and not something like Weston.
> 
> Just to chime in as well that it is a real production environment;
> it's probably actually shipped the most of any compositor by a long
> way. It doesn't have much place on the desktop, but it does live in
> planes, trains, automobiles, digital signage, kiosks, STBs/TVs, and
> about a billion other places you might not have expected.
> 

Understood.

Curious if there's a list of some concrete examples.

> Probably the main factor that joins all these together - apart from
> not having much desktop-style click-and-drag reconfigurable UI - is
> that we need to use the hardware pipeline as efficiently as possible,
> because either we don't have the memory bandwidth to burn like
> desktops, or we need to minimise it for power/thermal reasons.
> 

I think we're very much aligned here.

> Given that, we don't really want to paint ourselves into a corner with
> incremental solutions that mean we can't do fully efficient things
> later. We're also somewhat undermanned, and we've been using our
> effort to try to make sure that the full solution - including full
> colour-managed pathways for things like movie and TV post-prod
> composition, design, etc - is possible at some point through the full
> Wayland ecosystem at some point. The X11 experience was so horribly
> botched that it wasn't really possible without a complete professional
> setup, and that's something I personally don't want to see. However
> ...

Agreed.

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
>>
>> We should look at this from a use-case angle, similar to what
>> the gamescope guys are doing. Small steps, like:
>> 1) Add HDR10 output (PQ, BT.2020) to the display
>> 2) Add ability to do sRGB linear blending
>> 3) Add ability to do sRGB and PQ linear blending
>> 4) Post-blending 3D LUT
>> 5) Pre-blending 3D LUT
>>
>> At each stage the whole stack needs to work together in production.
> 
> Personally, I do think at this stage we probably have enough of an
> understanding to be able to work with an intermediate solution. We
> just need to think hard about what that intermediate solution is -
> making sure that we don't end up in the same tangle of impossible
> semantics like the old 'broadcast RGB' / colorspace / HDR properties
> which were never thought through - so that it is something we can
> build on rather than something we have to work around. But it would be
> really good to make HDR10/HDR10+ media and HDR games work on HDR
> displays, yeah.
> 

I have a feeling we'll make some progress here this year. I definitely
think the whole HDR/Colour work is on the right track in Weston and
Wayland which will hopefully give us a good base to work with over
many years.

Harry

> Cheers,
> Daniel

