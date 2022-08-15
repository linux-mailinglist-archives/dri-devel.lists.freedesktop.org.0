Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7227C592F63
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 15:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12A0C5638;
	Mon, 15 Aug 2022 13:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2067.outbound.protection.outlook.com [40.107.101.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0524C54F8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 13:06:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRyFump/HJwcrTT0wAnC1PHSKhLUYhuPrpDYZBIcDUta3GY0zI+jKpjyUQPOD+Qi9+KSzwKM47xRgUasqnIpGG3e9fANb5D/dn33czxFzNVmFVLvr/8jS2cnaq/us4cTqhtZ+eeBd0NMd1hNo+CpW0gmzGn7yFhgBV4ndLDVS+fZX2N3C7oI0ZToR/KyDojHEcVqZvGGFzc7eOrqxfaRRbiHRMpn7LQkOOlX4pX6G1DqN3LNKvlj/7GblrREwATM+kxGPo7tMkhFNr3USSZgMD24+yWJJywdTIL2eiMzYFQP+GoF3qH5pcfUellkU86VznHfAm9topycJpcecLxq9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AISMtFVGSFYyr/edr+ThSU7JSWxx2PIyvZRi9+Yu270=;
 b=D+m+XTEhVgL7xbkOA3PqdVX0+ZWNOaUwjswxsUurewfMhyiHX4exfHBCJmDbgtbnD+VOphtY6wJqrhliJKAF6wACKmVc4KSx7a2xinzUpeDVHZxL/S9XJtPxqRgRUxE8L0qkyHOgxhQZU2A8kTsAEgtEgKo83sHKibAHUkckgW/DeQR6CRfjGept4FWJ4tkAFsrSqDnIuyzu9TYr2/+c4aHNOu5aXmDiA6K2uFNB3+tlhCPd6/aNEsVZDLAUQqt3ODC3CTJRKX6m1OuZBzDAQQTZH1p3/+HMWgikiviiGQ77LPMBdosEGvbMstCrYvgvEuun+ZfqjL2HWkad+iIOeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AISMtFVGSFYyr/edr+ThSU7JSWxx2PIyvZRi9+Yu270=;
 b=Wru8UaKhD6XxVqXdYzz4H9i/q/f7O/dbhIRJKqLzHQ/PTZ2I9AzUrA5lHuXdLUTaboPJ1Ym/+IUiZuUMBtaa0n0rj3kER1ldQGYWgvq0Yrq7ZLL1rIlMZsO6uB8vE+7qkvJ/tG6d+cQ1k0tRjsjp+qRT12u4jAmIwPAJ2o3xrrM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB5070.namprd12.prod.outlook.com (2603:10b6:5:389::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 15 Aug
 2022 13:06:28 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Mon, 15 Aug 2022
 13:06:28 +0000
Message-ID: <594f1013-b925-3c75-be61-2d649f5ca54e@amd.com>
Date: Mon, 15 Aug 2022 15:06:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1] drm/ttm: Refcount allocated tail pages
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Trigger Huang <Trigger.Huang@gmail.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>
References: <20220815095423.11131-1-dmitry.osipenko@collabora.com>
 <8230a356-be38-f228-4a8e-95124e8e8db6@amd.com>
 <134bce02-58d6-8553-bb73-42dfda18a595@collabora.com>
 <8caf3008-dcf3-985a-631e-e019b277c6f0@amd.com>
 <4fcc4739-2da9-1b89-209c-876129604d7d@amd.com>
 <14be3b22-1d60-732b-c695-ddacc6b21055@collabora.com>
 <2df57a30-2afb-23dc-c7f5-f61c113dd5b4@collabora.com>
 <57562db8-bacf-e82d-8417-ab6343c1d2fa@amd.com>
 <86a87de8-24a9-3c53-3ac7-612ca97e41df@collabora.com>
 <8f749cd0-9a04-7c72-6a4f-a42d501e1489@amd.com>
 <5340d876-62b8-8a64-aa6d-7736c2c8710f@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <5340d876-62b8-8a64-aa6d-7736c2c8710f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0129.eurprd04.prod.outlook.com
 (2603:10a6:20b:531::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7984a87b-a0af-4998-ee1a-08da7ebef6ea
X-MS-TrafficTypeDiagnostic: DM4PR12MB5070:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d0ryZpHj+3nlO13CTkDb86kWXLFNdZN3dd3MEC4RW7SZ3At31Ox84XsCFIbaSp20/vr2p5encYmP/jEAauJY5jQxw6EtJ9ImhEbnhDUmRAkzSSO/sHsKTB+NnOPpok+PT5BcQCNxJHCkYlT7lyYrNb9mnXxh9IhB3it9nkbY+GveMriVKR8zAxrDAMXCGvOv1NF0i9hqWXpdBgPE82gyx2Ic+XjK7GRdmNprc2XANlh9H1oX1GpxSuDf/JOQ8ScZgsUjdrzEv7jMZrK3AWt+u+sQMNQppCFcjt+08Umq1h8cH7gUmm5Emd9pYupeXMVP8AkwfbSD7VdokHHuqXgyvpIICkeSEU4UlkRbIhEyqqjx6RUaPSe6roirgAFkHFwKhh64LpeOxV3FOMkmsy1trxdTt/PHbun266QrHJvGZvJvv1VPEMYdCXShPeYQg3OPZbVvDTfTorl4JjF9IRwtblO+d9ArD5w6iIYyLgZFFZ4YpGIXG+jRTlcPMKUGzaN9r/SdBDZL67HzIerxgjFZ1RW1kkCFPnOnssU8B+FuoVdW+oexGueNPgzGIdadkp5Q8MepZViFXXQSL6yf3efIp7LzEQF8sp2srozVIC1w//pDgwuLNxFht7E8yAAFOm1zZB3NNwx/Td8fmOwvy6QiUJ1MfJqdr8ncaqCZ5zcCCkFLOi1QeQWYAmP01pxOIrDcrDAgGD51byENZpMsEOTqKsUcv9G6hPHNAs+nXAoV+43YJkymtuhvbGASO6GwW9dcjlxODrD9C1vqPl2geFvBggodqJnp6rhJ0OyyzR08Yr2YuhEf7bqDpMUjII1HoOQBCI/+z9ewEIqbLxgtD2gwfKoSVG1qMkpORhldpZyqd7xPgIWBtQ40ZALKxKlE/aja
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(86362001)(31696002)(38100700002)(4326008)(66556008)(66946007)(316002)(8676002)(66476007)(83380400001)(110136005)(2906002)(8936002)(2616005)(7416002)(5660300002)(6666004)(6506007)(66574015)(53546011)(6512007)(41300700001)(186003)(45080400002)(478600001)(36756003)(31686004)(966005)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2swYTNIQXJSblNETnJSMlFIdGlUYUV5MFZXMEllR28xNENxdG9KU2tHOTFG?=
 =?utf-8?B?K3E5MXgvS2xFYkE2RHVsYTVZVE02V3pNMkJDMVhmYTR2SHJTd3hZZmpFYWg0?=
 =?utf-8?B?UmhpVXN0TVVFWXp2N1BjbjQ1RmRLNDYrUmJNelYzVk90UWhnNlpLcldoa0lS?=
 =?utf-8?B?eFBwMDZyRU81VzhWNXJ3WEkzRFZLL25VTTEyQVhuODhDdWdsUWloS1paSHd6?=
 =?utf-8?B?OXNRYyszZXV5VkdLMjMxcWFpRUlEVGJvU0hwTXUwKzBkN3BQWnByWlBsKzZj?=
 =?utf-8?B?YVRPV3UxY0VXcU1ad0owRjR2VWg5UFJUMzc2MjhQVTZlNzJGd21GL1kwMkVm?=
 =?utf-8?B?eFcveDN6bURZSE5nT1RPNUdiQXBIV2dXL0VHSmNYMjM2OG5GSzNUUEkyWTQv?=
 =?utf-8?B?LzNRUC82akdLRllMVlNab3RFMXpLdXFDT0d6RWI1aDAveHdLYm5uMHRYRDIz?=
 =?utf-8?B?YnhOSG9LK256UlNCdGhrVDdCZk1hWVFUN2tNNEptOW1oYy80ZlB1V2tvL1do?=
 =?utf-8?B?SFB6WXZ1M1hlR3E2RXFtekcwS0ljWjIvb2ZIQ0pxb0w0N1hqOTcvSnRSOFA4?=
 =?utf-8?B?WW5VZG5LaVAxTEdrK0orMTB2Y1J1ZE5CcG1EWFZjclJIWUdyMkZRdmxKRXAv?=
 =?utf-8?B?SFJlMms0bVJld0ZFQ0hUa2Nkd0JsY0N2VFFmVDFTclQ0N2Q4eTR0RjN3M0ZB?=
 =?utf-8?B?emxJNEJFR0R5T2t2V3FNZkE0RnhzTlB4dVhmcHRad2x0TTNyTUFTbFh6d2hk?=
 =?utf-8?B?c1BRWE9XOEFlenVCVk52YTRUdkM5Z1oyeEoyVUdZYWt1QWpZQ281dHFMeCs2?=
 =?utf-8?B?ckdzS0JpZnlUbkNvYXN4NU12SHFDQzZkU3RWcDlvc2t1YnFNODJjMllMNUNH?=
 =?utf-8?B?cFBCZGRQamJZSVdaTjBlNEl3RzlZNUFobnZ5ekNWckhka1VqTTFQTWoyT01C?=
 =?utf-8?B?YmRidS8yQldtUThNTGNzSkJkNEpOUU1jOUVyd2NVTlpsQlRuNWRXYmdUTkZU?=
 =?utf-8?B?YTdCQVMzZHVZMEVRblpDNUV3L0pqZDNmVUxORkRnLzVHYkRQZHBiSk53YTNW?=
 =?utf-8?B?R3VzazI0TXkxZmZjRXRkM212UUtkNWpzVnJGajhJWGNOdVZ1amdCZ0ozUmdP?=
 =?utf-8?B?ZVRmL0d6MWhXQTdCS2RzSmFVaDZYT1ZWaHd5QWxVeE1oSm16RmhnVzFaYm5E?=
 =?utf-8?B?V3U4ZmZGVjZnUTk3aDVHV0FIeEF4eDlraXdXSy9Ya1JCZGkwQVVBR1ZmemJP?=
 =?utf-8?B?NkovOUNFelgyQ1V2bmxvWW5LUitXOFdrdm02UU1JU1k0eXVKamUyNlZvTVRk?=
 =?utf-8?B?SUtRTzJDOVlOOTdKRzkyTTB5YlpTSHA5ZzNrdVpyYmg1Z2pBUExtVGxKZXFs?=
 =?utf-8?B?YUhYR3loMDc3NE5yOGQ5TVpGWWQ4SFFJOE9ncE1OdldaN0lQSVBoOER5ampl?=
 =?utf-8?B?SUZQSDk0NE0zWFRLNWNMN0o1SS9mdHNBSDhwNWNGZGpRVEN1Vk5QYXhlaEZn?=
 =?utf-8?B?UDB6UFlwMVVvVEN3cFNlbi9PTnBXQXZwcEs0QThiZHBCcGVnUlkxdU1FWkds?=
 =?utf-8?B?VktrVDNidW9PZEdva0R3OVJjaW0zUDVkQ09jSEErNnZ2YkFTN1hidUZ3dFBi?=
 =?utf-8?B?SzVuRlA1a3FQcWU0N2YvaUY4SWxRbExnQWlUN0VsbVhJdW1weXlUWmdUZG1w?=
 =?utf-8?B?WnMvVE5BZS9PbzVVU0Y1emFDdXJFY0hRUkltbkExdVF2SlJ2NDdBaEtLdkt0?=
 =?utf-8?B?citBdi9janc1Z1FkcDBnMjRuOUVnRFZFdzY4QnhhM3Q0Z1BLdG5iRlRMZUF2?=
 =?utf-8?B?RGh2aWZOVVNRZitrb2R4cG1veEQzM2phdEgwelR5di85MWVRMUNpU055TTBu?=
 =?utf-8?B?SDlvaDlTV2Uzd1M5L2xaWWh3eFF4ZC9NMDZLOEl5ZTVoMi9nN24xTTE0ajVO?=
 =?utf-8?B?SWZyQU93bGRaenRBVi9QVC8rV3k1V2IrcmJGVjd2YktBZlFyd0M2T0hsRmZG?=
 =?utf-8?B?MkxwQ0g3YkhzYXY2YzBLeitpelFRalVGQmFMSDNRSnFua3E2SmQzUlo5bmdR?=
 =?utf-8?B?WUtDcUptdWtETk9tTWc3V1h0OWJYSnNWd1BlQnFmS1d6KzE2Y2FnU3JmRmlV?=
 =?utf-8?B?YS9TNVdQYkxQNlkya3UrZ2k4RTRoN0k0VFFmSitNek9LZ0pMMGwxVTAyOTND?=
 =?utf-8?Q?kCPbFAflYwMI76lhRUtn8mGZb43iGnUYe5kx/hu9DSkc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7984a87b-a0af-4998-ee1a-08da7ebef6ea
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 13:06:28.0323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mswQRxQ96Rs0EA6QHO2IYBmvTxJX3cT0/rBDyNzoQXqOhgG6CYPCuuw56b67QAw1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5070
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.08.22 um 13:50 schrieb Dmitry Osipenko:
> On 8/15/22 14:28, Christian König wrote:
>>>>> Maybe it was discussed privately? In this case I will be happy to get
>>>>> more info from you about the root of the problem so I could start to
>>>>> look at how to fix it properly. It's not apparent where the problem is
>>>>> to a TTM newbie like me.
>>>>>
>>>> Well this is completely unfixable. See the whole purpose of TTM is to
>>>> allow tracing where what is mapped of a buffer object.
>>>>
>>>> If you circumvent that and increase the page reference yourself than
>>>> that whole functionality can't work correctly any more.
>>> Are you suggesting that the problem is that TTM doesn't see the KVM page
>>> faults/mappings?
>> Yes, and no. It's one of the issues, but there is more behind that (e.g.
>> what happens when TTM switches from pages to local memory for backing a
>> BO).
> If KVM page fault could reach TTM, then it should be able to relocate
> BO. I see now where is the problem, thanks. Although, I'm wondering
> whether it already works somehow.. I'll try to play with the the AMDGPU
> shrinker and see what will happen on guest mapping of a relocated BO.

Well the page fault already somehow reaches TTM, otherwise the pfn 
couldn't be filled in in the first place.

The issues is more that KVM should never ever grab a page reference to 
pages mapped with VM_IO or VM_PFNMAP.

Essentially we need to apply the same restriction as with 
get_user_pages() here.

>> Another question is why is KVM accessing the page structure in the first
>> place? The VMA is mapped with VM_PFNMAP and VM_IO, KVM should never ever
>> touch any of those pages.
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.19%2Fsource%2Fvirt%2Fkvm%2Fkvm_main.c%23L2549&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C2f38c27f20f842fc582a08da7eb4580d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637961610314049167%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=Pu5F1EF9UvDPdOQ7sjJ1WDRt5XpFZmAMXdkexnDpEmU%3D&amp;reserved=0

Well that comment sounds like KVM is doing the right thing, so I'm 
wondering what exactly is going on here.

Regards,
Christian.

>

