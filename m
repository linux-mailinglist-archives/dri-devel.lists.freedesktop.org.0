Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D58A5592B5D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 12:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CB395C77;
	Mon, 15 Aug 2022 10:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3898B876
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 10:12:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpLg0rsFmKM7VFh23UmJBWRKIh5xY08pqwfpHN23eQ7+EDZtk0Y+74HXPcfc0OXYGKYZlD5qIuNrxwvWaigOHzY5o3dIcOVJMEMrWudVQD4WAIoQNmaumi/lqwk+iK1sjOaDQLu4MSY2l7zDMjGunXNNaEzVpWdzXS/WS58ZfWP/5ofT05BXy6vVmHD+m/5YPQ9HZIiBx0dypIgdLEVoRDh5zXSELHOw/z2xeXBz4mnYljW/l63zwwPHCgcUxsfFRmoOIx8sYKiv7HtdWD29zIEvTpiK2s4qr5e/nZznE/E/UERhsjstwtke4wWcu0q6SRmlmlAIDrklKMR3zolcTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=inBftJlKOMmZecCK/n1gTNUguOSc1CLw7dOvEg19/Pg=;
 b=NcoTxid62cmoD266XwIYPFBLF8tILBiBIaIJm1vky1tTUgJFKGgy30We1ImudjmwagLv+EDUdcE+EZ/lUQoNyfCfqKqcIPPOxL4jL1GorXHOi9yBshnHCFNfJf9rrA/LiyLmPOakk0JZgbudcxJOGmNJKXQip8gHn6TaE1rbcY/3VJe4MejYHbe/NAFvne6AEIw6/YOmCqlm4VysL3Q0fUxBfaWp5rnQM6Levk7TfpU/pRfKZdxv0CXmbhwZ0f/sg2M5CyVearA6EV14Lbc3Qieew977NOrwzLrk9hqvguhHNjf+NlfjXVwRQG0RCDqQhq61g9ReXcsEX74AaN5wBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=inBftJlKOMmZecCK/n1gTNUguOSc1CLw7dOvEg19/Pg=;
 b=3zw4PBaMbwgJ3G/LLZ1RRtJiNsEB0tzlMhit4ylwMnjoEri/eJ+Njo+IK4jY9+HYQ4iQ1He4Jo4frdvOfjl+1QXImOqGCW4fGua5Q3bZi7FkamA6SErbVBxUNu4I3lGX/MLa1XWlMXck1hbgx6ZPIZ71soTK/aU/Bpta9Dn0xcM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4251.namprd12.prod.outlook.com (2603:10b6:5:21e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 10:11:58 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Mon, 15 Aug 2022
 10:11:58 +0000
Message-ID: <8caf3008-dcf3-985a-631e-e019b277c6f0@amd.com>
Date: Mon, 15 Aug 2022 12:11:52 +0200
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <134bce02-58d6-8553-bb73-42dfda18a595@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR1001CA0059.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::36) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2408e371-ee95-4125-1e74-08da7ea69670
X-MS-TrafficTypeDiagnostic: DM6PR12MB4251:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KJd+JUXroGqBlZeIjxVJPR0fYPhp+jCxlNu5ZuzHzCPQqWHm+thcrc9fLoJJB6LAY3mcck7S8tEm/5GBm0x7edn9Wld8BQa7lT7m3A534By3T/d/D8sXApqgU29FMQu84XHNSeaF+6T5DmLEvQl2cd/dchuMRpJLUsgDtWd1QvAmqQa13AHN9Riw4cu5VdEwgKYhl+f44hwIO86/qtz42J5hU2WjWX3xjqxeJ3GFry2Fxq5AXInDMa7S/boNcSs5c5pmFxzYGfrbNxABOxbzfk330O7C0ZAAvgevaVaN98yg32S07ZKTAZTorNXamJlCYzSVKz+0h6tdRBdDhS977HOvQYLm3CcZyGGGVfoEMdBMVAg1d3nvc8io+MhhA91MOFiIPg+tsTAYTbmnmZdHJ54z6pR5JfMgSHcUQKk1L4R/TtglIXTliuMYNFwUwyHrenn8XCUYQXaV3BJBjtM02R9atwQ6pjY/tHNiJNOCnQz+Y/1id++1pEFW2Cb8e7aGHfEBdaFDaOAVHr/3bEB+ia0Vi6e0N2LqPNyYHuXs+gmq0LxAWA4t3mZsKSZLkRIHpxhAAxXyVbNkwy5skyYjkAUUuivl3YwA4xE5uVPDDxTUsvBYa5cQoLbkmhhyCgHRoVXaK/OgA3+4qQ31tRTONL+kTwmj1VrTW5jr9JrCuFIqNCMzht9izWhSjWf7EyXobuMrDmk0Fs7tyWHaiBy8lGKPnSXz/bwH/ivS8QqMMKtci5Sr9Jb+OcrV/MFbInfmp7siuSjxs0h8TM4eFxss4nIUYjOcLP9oGCMfCKXeMbDwnmqSMEFX84zEcrC4sKHIc+lyTMhBjfRxUkS+M6wGLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(7416002)(8936002)(5660300002)(31696002)(2906002)(86362001)(41300700001)(66476007)(66574015)(186003)(6666004)(2616005)(6506007)(6512007)(83380400001)(478600001)(53546011)(38100700002)(66556008)(4326008)(8676002)(316002)(110136005)(6486002)(36756003)(66946007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnNzaThMU0owZUY1bGFHVjdzbEpvNGVQUDlrYytJS2x0dDNiSmQ5dlUxODMz?=
 =?utf-8?B?UU5kTWtaZ2Z5OUllRlRwVStCZXJkcE5kOHo2ajNsayt2ZTE3amd0ZUZ1elJs?=
 =?utf-8?B?eEttVy9EWTNlTWpPM3JBSEhKcU5IaDVpdHkyLzlOZEdwMDFweEtZbUFsR2F6?=
 =?utf-8?B?eWlqaVM0UXNabngxTnVMV3lQc05ZalRvWTZZbTJYVVBwbW5pQXM1YnJaaTZU?=
 =?utf-8?B?TFdmVSsvT1dwSVNYMG1DbVlubUNtdnU2dGhObFVSSTJkcXh6RkZJTGZQOFl2?=
 =?utf-8?B?Zi9mSWcxS2R2MUswbldONFNlcnlVcERmM1RZa3FMSjFZdThRZVA2VkN3TFpK?=
 =?utf-8?B?UGIrenBMU3dpbis4VFV3djRXaGhNSnovSEJlSVFzR1lMT2VscHhIbTU3RGNL?=
 =?utf-8?B?SW1iU1FVQkswTytHZHdtdEZ1TFhySmdmTy8wUjdHQ29pRmh6aEs4TzJyNEc0?=
 =?utf-8?B?UDFEREx2c1FDUW1KZ2EzdXlIS0U4ZTA3MEEwOFFqMmhkZU1vN2VoK1dDR0Uv?=
 =?utf-8?B?cEJWYWd2M0xxRGdSSUtoMi96TUxFS3RuRVYyWHBiZndTOFV5K3NDU24zZTls?=
 =?utf-8?B?YWpqRDVsT1puZDNBS1ZKTFFWVWZ6L1pTMU9OQlVhQ1BXeENzTCsxaXRYZUhy?=
 =?utf-8?B?YURtL2FWd2NYbTBvSy94QTA5ZlhwZ3NMKzRXVFJFL2NkbUJKOExpd1FUSkhs?=
 =?utf-8?B?dFRBZXFEYWxuV2x2bXRuRU52eGE1RExRdG00bWVRYnFOQWRsb0U4OUlqR0Zq?=
 =?utf-8?B?M0NTOGVqU09kTlBEeTBJNXowOFBQN2Z5cnRvb1d3R2xaWjl5MG5XZ2JZcDYy?=
 =?utf-8?B?ZTlZeThlZFh3YXFTSGVGTmo3VTRCK2RnYVlvMS9mdkgrcHhzMStVSmVXeVJT?=
 =?utf-8?B?WFZDMUw2RUhPYk9ZQThIOStUbzdRYXRsUmZiZnRaRG83c01yQjRpYUtjQ1lF?=
 =?utf-8?B?YlF3OGVtSDkvNkFPcUlSS3Rzekk4MVkvSlRQTHg2MUZBRWw2VG50TGdMUmdD?=
 =?utf-8?B?WWgrZ3JrYzE4dnJKVXVqU01rQ2lmTFpmTlFVSGNYUEw5Mk5oRnZtTHhIMnVN?=
 =?utf-8?B?dmwvQmVMTHNjTXMxQUwwUENDY2dNK3FRNC9VZld3dC9DaG84SHYvTFh6Q2Nm?=
 =?utf-8?B?MWptSWN4akMzT2dNdll5WlIxYlFHcDhlVmd4WnNFRmg3WmRGS09ieW4vUFho?=
 =?utf-8?B?dnhyRldWZUtDSXd4VE1xK3pOY2tQanl6bFZ4enpGU1FMZXlRYlJGTnd6blVn?=
 =?utf-8?B?Vk92bzJ3NmlOM2JzUTdCWWlZSnhsYzRTWHRBRURaU3VnbmVrcnpyWElVZkZs?=
 =?utf-8?B?UTRrdHQ5d0tNYldmdWdWSkxCaEI4SXZrQkxQMHg4c1JXYUNyNUZGZi96WTQ2?=
 =?utf-8?B?R0dJSC9XUXhYU1ROT01IcnJodXFjb21mQUttdXdiay9LenlSeUczdFJhajN1?=
 =?utf-8?B?YkRUR2U3WTgwODRTclVsdkpNZmNIVzBPU25DSGNjVW5yT2FER3Zyd0Noby9z?=
 =?utf-8?B?emFDMlVoWGpJS0FndnRqazBYOGRublhaYy9aQjBoWVlRelhnZGJYbTBsNWdy?=
 =?utf-8?B?b2JMNHpld01vdDc0dzljaWlIRjVZc2dPaGhYUnVlZmRmR2lMZEVKelRVbmE0?=
 =?utf-8?B?bUZITUdlMGM0UVhGbE0vcFRvQkVUMEluZi9oNXpiWk05N011T3NNRTVPcHVH?=
 =?utf-8?B?YktDRmNybDMrM2pwYktPNjIyMUVyamZ1MEg3T2Y2NGoybkpOM3dVcnJmcCtM?=
 =?utf-8?B?WnhUSEVaaXk1T0dDdWljemJ3Z1lrekpDbE1leHVpNFozM2FnUDNIOUMvNC9I?=
 =?utf-8?B?ME9QN2F2cGhESS9udXZUdUkxRDFKYk1Ba1M3RXFTOUdFakt4bFZ6Qlo5TlRD?=
 =?utf-8?B?WUQyYkVSbFFPY3pYQ1l0VWJqcXJ1V1VXM0xxekwrWnB0Tk85YzNmUGZGSGEy?=
 =?utf-8?B?aFk1Rm81ZE5SaCtFMEMwVHdVeDArcVZiQVpzYkJGcUxZOTA5WVBSQ1Noc2Y3?=
 =?utf-8?B?ZjNhU0RycExCdzIwSlFYd29OWXJJeXBHTC9qSW50cW5jRGZSOEFzZWJmSWNn?=
 =?utf-8?B?R3JLa0hMQit2Z2JnN1Fsc09PREJDZmJ3SU1jZSt1S2VCVXpIckNBQlZiSFln?=
 =?utf-8?B?dldyMXMzQi9GV3hLcXRiVXZ2ekxzY3ZUaXNYcWFJTnpYY3hDV3R6SE9rZkdv?=
 =?utf-8?Q?+69ZLcuRlrUWufC9ip5W/7DUSuVdid0ByDckCEpyuLbH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2408e371-ee95-4125-1e74-08da7ea69670
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 10:11:58.3228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6amPt3rAAIocRnt1ujLPZAoo+tajaLJ5xsc78Onfu748jqehN/nS3KPOnH3F7i6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4251
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

Am 15.08.22 um 12:09 schrieb Dmitry Osipenko:
> On 8/15/22 13:05, Christian König wrote:
>> Am 15.08.22 um 11:54 schrieb Dmitry Osipenko:
>>> Higher order pages allocated using alloc_pages() aren't refcounted and
>>> they
>>> need to be refcounted, otherwise it's impossible to map them by KVM. This
>>> patch sets the refcount of the tail pages and fixes the KVM memory
>>> mapping
>>> faults.
>>>
>>> Without this change guest virgl driver can't map host buffers into guest
>>> and can't provide OpenGL 4.5 profile support to the guest. The host
>>> mappings are also needed for enabling the Venus driver using host GPU
>>> drivers that are utilizing TTM.
>>>
>>> Based on a patch proposed by Trigger Huang.
>> Well I can't count how often I have repeated this: This is an absolutely
>> clear NAK!
>>
>> TTM pages are not reference counted in the first place and because of
>> this giving them to virgl is illegal.
> A? The first page is refcounted when allocated, the tail pages are not.

No they aren't. The first page is just by coincident initialized with a 
refcount of 1. This refcount is completely ignored and not used at all.

Incrementing the reference count and by this mapping the page into some 
other address space is illegal and corrupts the internal state tracking 
of TTM.

>> Please immediately stop this completely broken approach. We have
>> discussed this multiple times now.
> Could you please give me a link to these discussions?

Not of hand, please search the dri-devel list for similar patches. This 
was brought up multiple times now.

Regards,
Christian.
