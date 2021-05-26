Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 512E53918B8
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 15:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D54B6E18E;
	Wed, 26 May 2021 13:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2084.outbound.protection.outlook.com [40.107.212.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9286E18E;
 Wed, 26 May 2021 13:23:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmiuFpYFwLOuLEA1c2DEPnIklE6G1nek7AF1xzcAKFNQKNTJJKJqNNdJZAq07eG9cHLhfzc4OMiqNv1iOZV9u20BazBO2UJZ/0XtX300Y6/JZgySVAcdX8Gp5X8mpaVPaOA+LwY8D2BmkeRiUgN//sc9VLB5+FMDH0ihc5Zo2uIciA6XwckvGskey1zCoXLA0gMV303RmDTdNx2AgJ182RU9ViHhXo2MDG6kwEz2vOlwDG/u1DDiXwrmUyhMJ/hgxgiz5GvHWoCfu2bkK17cAuiTNm3C2IMtaLEJalVpd6tLK/A5n8sF0ckuCrXr6qfwbRzNnCHQiey3hbIE4dk8Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AItQq4iivEZBYhHKUO5I97zYjOCFQBDPhU9xOtHkJ2Y=;
 b=GwT4JRntBgek5WP8jlRLe0yQSG+J4tKQkX6jMzVaaHf9JBC5Ty2Ae7tCGdgOs5QkZl+Mg2l6fCjvbMc9hE2LLlmpXo5ok8N24Sb9WgjcRGXDRIsZfxPEsy3Ko6Ig32G37Zu+FhdWMsQ47jm74l8m5MNrjKLfMbU/rlyv+KmETY9IQbNwOok1jfU8UT13qYJcHjIqC57A26BIorUxFczGMGQ1194bDBSGmTcAl1bhaxIGHTSIHINcN8gkX01E/3tHKJwMi6+BDamqjU9aM6uQxNFeh+Ypn4lSkLmMV8ybJ+uF5Afe55dEfGav/fJN+3qkixtmSuui+WUvEntI33IHBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AItQq4iivEZBYhHKUO5I97zYjOCFQBDPhU9xOtHkJ2Y=;
 b=B6MSNgyafNjFiCGOOgMfoHVXbjWxLmJt5tNNPftJZTJAHL5teBwDqwmw0wrEYU8CsQkbOSstFCIiZB5VIx3Dir3zKi8pj/mVrza6BzPW78b3b45jTaQFvJwGKr4GxQ0Nz3OFd6QDX0usaY8y3QZmxeWPUiFL/KH6z/icIh8hX8Q=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4552.namprd12.prod.outlook.com (2603:10b6:208:24f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Wed, 26 May
 2021 13:23:08 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 13:23:08 +0000
Subject: Re: [Intel-gfx] [PATCH 5/7] dma-buf: Add an API for exporting sync
 files (v11)
To: Daniel Stone <daniel@fooishbar.org>
References: <20210525211753.1086069-1-jason@jlekstrand.net>
 <20210525211753.1086069-6-jason@jlekstrand.net>
 <acc1737c-261d-9da5-7ea7-759063136c56@amd.com>
 <CAPj87rN_7vmmWcL1vqhvM=etaTjwts_L0vYbsgvYF0_qZw83gw@mail.gmail.com>
 <770eb698-1dde-9e46-da83-44911d96abec@amd.com>
 <CAPj87rPdMthO2Wv7QxMGnO__BiZVauMa9HaRk+35Sgvm69QSjw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a9de44fc-aa7c-60d7-d7ed-2229d41fb306@amd.com>
Date: Wed, 26 May 2021 15:23:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAPj87rPdMthO2Wv7QxMGnO__BiZVauMa9HaRk+35Sgvm69QSjw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:1950:35e:cae9:5bed]
X-ClientProxiedBy: AM0PR03CA0004.eurprd03.prod.outlook.com
 (2603:10a6:208:14::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:1950:35e:cae9:5bed]
 (2a02:908:1252:fb60:1950:35e:cae9:5bed) by
 AM0PR03CA0004.eurprd03.prod.outlook.com (2603:10a6:208:14::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Wed, 26 May 2021 13:23:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0aa0a0a2-a0b0-46d4-f285-08d92049666f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4552:
X-Microsoft-Antispam-PRVS: <MN2PR12MB455236749A1945A470933EA283249@MN2PR12MB4552.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uKlppsuHZ2m2FLv51EUzn9bFMiPGVt3rXeiItcwwV+Rs1QFrgiIMLJY4QlaW96u/t38uoTd9AdkMmPBCmSzzmTosHvlh7chT2wwKkjSynmgpkuycD/WHnGFgTwxva4ch0woDvJyGi+iZLQWb3ilTXOwHcnZdebwIQZmplhkdWeJzrE6weUrd4eFScD9BaPrKTDpQ8MEfnVUTKabpjozfDHwjGHK5J1c7o8zgoa+X0tkbz5bpbh6e214WZVEGdEbz8sBJRhKB6kX8eXZrw+zJwim7DChCKbkbRmT7lkb1PuvT4o5hMxUU3B2+blPdQtadJsRiOrJDEX3fzh5zBnp+nwPrTjNePGSp5HLf2Fx1sND+OJoH7FWe7nhOs9POQ/ThxTiGDzTYPlC6kuHSZFHFIYd6CGPOj4nToeS7HcV3clChqfhiUCIaqUZ46384XU/TGqww1GSVuQgCP/BDUj5Ekh6maYFwLw5iONLl/0lGkOh8m/5KruMyuaiye+8Mv67tf1fc8WQid6Qftw25hTEM+HlvEQ60bGAV+1WW8doU5z8CP6JqQlxXVqbIAgumCMziYdHT8ToI03Lma3S8QLElO9XeHtigd/Ll7BZDHvEZklv3bXFf4k0/QY6lhoqBxSg4gNrfKziMjVli0NHMUfO2PSHTpfkd3rYSD9J8Z9F3aUhVyStSCjxNJXgizMPPoLL8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(2906002)(8676002)(6916009)(8936002)(478600001)(83380400001)(6666004)(31686004)(52116002)(66574015)(38100700002)(5660300002)(54906003)(6486002)(66556008)(4326008)(66946007)(316002)(36756003)(16526019)(186003)(31696002)(86362001)(2616005)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OWwybXdWN1ozbEJNN1dHL00xNDlsRExGNGxTL1ZTdG96YWpRTS9ZSGl3SEZZ?=
 =?utf-8?B?ZXdEcW15azhlL0NsRFhhc3c1Vmdia2VPTk9nQlZvV295UzA0RU0zNitmcTVv?=
 =?utf-8?B?ZVRZaS9vRnlKNXI5WnNPaGJyQlRvNGVEdzQ0czM0OEtRZGM4QW1FK3N6c2JT?=
 =?utf-8?B?eHM5QVM5Y2E0dCsyM1hucEpZYk9laC9jc2pDYVE0aS9ac2YxbDFxelBrQ1Fk?=
 =?utf-8?B?Y2FqZzBpVDUxR3VCVUxUcHRGb01tU1RRM2EzY0NSSXgxZFMwK2ZTM0VZWFQr?=
 =?utf-8?B?N09qbm5qd3lRb2duOU5GMWFENUVEWlQyTkYwdkRLZ3Zpa1FaMEFiUDBoeXBI?=
 =?utf-8?B?YU0zSHAzYTNEUE4wb2V2ckg2QndmcHlHaTNweHg1Wm41UzY3TXdSTjhwZmFk?=
 =?utf-8?B?cjBLT1g2S3ZxeFFLTUY2TmM3elg2ZHhCdTFZZFVWZkptQ0NvSVAxR2V0WTZ4?=
 =?utf-8?B?d1pyM051VktHSjF1YUpJOElpZ1FCVGpLRVJIb09yamFFVVhDdHUrTnJkYmQw?=
 =?utf-8?B?Mzl3Tk5iVCtQdG5kMnF3SEFSc3VOVHE2eG5Rb2VBdFVaOWJRZk9wb0xmNjhX?=
 =?utf-8?B?N3BDTWxhak5iUkNCK2QzVlZuYVduSnJLZ0JDc2dRK0Z1L1FmcGxROGRyVGJV?=
 =?utf-8?B?UUxxb21ULzhlS1dZcHplT2VEUERMVWxMcGFqUHpWKys5aTNJQUpvdkxFUUk5?=
 =?utf-8?B?alpOZ3ZROEJ1MUJiWmpDT1dnd2JYV2c1V1AyeFdQcUtub2UxdmVXdllqU09V?=
 =?utf-8?B?a2owRWJTTE9LcmZTbWJMK2E3U2M3UE1HYU8xb3FjblFqZWRXUnNRQ21ndDAy?=
 =?utf-8?B?V3NDdm9SbmNEVTQrSVV6YXZCQ1MxOHdMLzY0Ky9jUTdIOW93a3lGN2JSUFNu?=
 =?utf-8?B?ZkNXdk5WOCtjMFgxNUZtYVliQ0FoY2hkR3ZsL2hFQTJsRUdKeE5LVkZaZWZY?=
 =?utf-8?B?SVlMazhRNmdlRDhCZ0VNY0hOb0ZVU2RhKzVUaklVSjlQdjBmTGhiT25FbGtw?=
 =?utf-8?B?WUdXLytnODNKOStyYlpmWEc5RFZVRStBWUpzR04wcnpnME5YRmtZSkdpQy83?=
 =?utf-8?B?cVpHT1dFSHVNU0JCOHR1T1dkQjRqUmhQemFZNzFrLzBjVFpBUlNINlJyN0Jh?=
 =?utf-8?B?bkRFRXhpU1FJY3J1dXlsaDBoMmlGUDN6ZE1BNTU3ZHNKTHB5WFRna2tuUzBm?=
 =?utf-8?B?VUtTZXQwNS8wVk44V2RpZkZndStkK0g4RW5UUHhpRHJjcmxveFpTdHp2cnAy?=
 =?utf-8?B?WU9WTEhNSUwrd01YWGtUSEpjMUZua1pPMXRpdDFUT2djY2kxUU5oZzJLN0dM?=
 =?utf-8?B?QUFvLzNwUzBlSzdTV1NlOHdzQlNJSFJ1aTdYUGFOU0hlWkJncDFoRUJnZDk2?=
 =?utf-8?B?ckphMDZueXlmbGNWeEsrNDQ0NC9oUGltbm01Q0pUaHc4L3JCMTMrMVdGRDZT?=
 =?utf-8?B?S2JiZmNFem92NDhFWFd6dU1jZC9yZlRPQU5ZSjNWYkR3amRtckorbk5tRk5x?=
 =?utf-8?B?eWJhQnI2Z21aandwYUtEbUJBNXVDYzJHRkIzZnlNWENNOVNTT01rMzRCbUdJ?=
 =?utf-8?B?SXBEQjdtU1IxSjk1bHkxRjExb01lSzJVVGJ0OXREWjVWOHR0OFhLYWM2Vk1F?=
 =?utf-8?B?ZndGbVp5a0VLb0QyNFQyY01ja25IRVM3K0duYUNFSXB5eGtPTXc4eXhuTmZE?=
 =?utf-8?B?WFNHdXNaK0J0NVd1dzdZMmF0cTFQcUthYzJLLzhUeDZPclJISklRbVZtcE0v?=
 =?utf-8?B?d1RwM1NxL3AyMWh3d0hhd0o2QlBQMSt2MXg0ZHQ2enR6MnpQZ1N0Q1VtdVQr?=
 =?utf-8?B?aEFMOVJ2M00wWk0zWlJuMnhyN1VPTHRPMGVJUEErQlI4ZmM5K0UycDdweTZR?=
 =?utf-8?Q?ZE5NNhcBNVdy9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa0a0a2-a0b0-46d4-f285-08d92049666f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 13:23:08.3164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gYuzF1P2hcLxCCx0iFhibDm6tEM7yZ6dwUJ6DWlDKIMJfDMu88m0laGv56RsCNY0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4552
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 26.05.21 um 15:12 schrieb Daniel Stone:
> Hi,
>
> On Wed, 26 May 2021 at 13:46, Christian König <christian.koenig@amd.com> wrote:
>> Am 26.05.21 um 13:31 schrieb Daniel Stone:
>>> How would we insert a syncobj+val into a resv though? Like, if we pass
>>> an unmaterialised syncobj+val here to insert into the resv, then an
>>> implicit-only media user (or KMS) goes to sync against the resv, what
>>> happens?
>> Well this is for exporting, not importing. So we don't need to worry
>> about that.
>>
>> It's just my thinking because the drm_syncobj is the backing object on
>> VkSemaphore implementations these days, isn't it?
> Yeah, I can see that to an extent. But then binary vs. timeline
> syncobjs are very different in use (which is unfortunate tbh), and
> then we have an asymmetry between syncobj export & sync_file import.
>
> You're right that we do want a syncobj though. This is probably not
> practical due to smashing uAPI to bits, but if we could wind the clock
> back a couple of years, I suspect the interface we want is that export
> can either export a sync_file or a binary syncobj, and further that
> binary syncobjs could transparently act as timeline semaphores by
> mapping any value (either wait or signal) to the binary signal. In
> hindsight, we should probably just never have had binary syncobj. Oh
> well.

Well the later is the case IIRC. Don't ask me for the detail semantics, 
but in general the drm_syncobj in timeline mode is compatible to the 
binary mode.

The sync_file is also import/exportable to a certain drm_syncobj 
timeline point (or as binary signal). So no big deal, we are all 
compatible here :)

I just thought that it might be more appropriate to return a drm_syncobj 
directly instead of a sync_file.

Regards,
Christian.

>
> Cheers,
> Daniel

