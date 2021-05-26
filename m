Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11483391542
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 12:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA37C6EC6C;
	Wed, 26 May 2021 10:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BEA6EC6C;
 Wed, 26 May 2021 10:45:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gokDYCNGNceSgQerT39uzN/XNigSD2ugppqIW6k0Cght9kibjuAahE/h+fjG+iEcGhOqyhlFRW88NGDJvYICYjzb4jpzMLjP6XraIClRJ7st/1Ie7mOiBTnp1ZqobjNFSx5byMkK+Z9/dTa7+2Um9tlObPEW2Ep2/wLdh8YlkV4H26pW33qxo0UJJ1QKS0VZ49TCv9DhBXVSkWK/KANuprf5ZxqNOhOd4I2z21aLed982qpIZ4shukVTyBouz2eDbh0Io+cxJ80o/eFtdmItmFM3ID8QswrXqknuiWuUDiW0XB2j8ap58XuERpHjlJqYpmnPUl2isZBbi+TEOg2XDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxA8eucadgML6ynm0csz9A5KECPO/I8iNNLszpLwK4M=;
 b=hbUXSbSJGTWAFb/Y0J5E34xsqvuSs6sKoJJ8DTD6SRKwItcQjPPrvGhTGxsLSW8e8PI3fjP5KHwL5fGW1meY63YUp+FTGW3sw+TUNvXPz6frlY12dhzTC2ZXssKh0EbT6SH00OAb+jHghNBVL3ZiNXjDA10s3dGplnfQ8iB8yi1HPAoyTSsTy27LSEbCwYclVUpMDbJ/IXIn3qtZ+yaatTtf09EpSfU4T7zPhh5dymPre/Uli+Co2yO731g4IWwu8xjffK30Ooq1rwAJT4rW4VzM1w8lDEZdb0OrByJhDo7sIHoS3G2UNlhNT//pBC8jJiJMFXj9UbXGirU0wkpniQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxA8eucadgML6ynm0csz9A5KECPO/I8iNNLszpLwK4M=;
 b=xLznH9fRxxlih1Lq73C0Ti6xRZs9mdkk0rNZP8z6cblQAj6xkdf4Xhaw/HmWvzJ8DKhjBEsYRhn37MMRnladNWKA6WmIOnAi+679Z6ebQ57+vHpOH1engL19bcg2DlBOLqN1kDDauEwWESdphGHltccn3NBPn6eXh+XOKZmtMZY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4898.namprd12.prod.outlook.com (2603:10b6:208:1c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 26 May
 2021 10:45:42 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 10:45:42 +0000
Subject: Re: [Intel-gfx] [PATCH v3 06/12] drm/ttm: Add a generic TTM memcpy
 move for page-based iomem
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.william.auld@gmail.com>
References: <20210521153253.518037-1-thomas.hellstrom@linux.intel.com>
 <20210521153253.518037-7-thomas.hellstrom@linux.intel.com>
 <CAM0jSHM9SOPKkvbzUgFacqURXY_QbKcJ=3K_8Tdh4jjxm0nA3Q@mail.gmail.com>
 <2cc9a60c-4360-40b6-8712-1e50b7bbfd03@linux.intel.com>
 <CAM0jSHNYJd0LQhy3J3LbXezGQ-=eTh5qZJbZJRkw28eNAC9dsQ@mail.gmail.com>
 <e355705ead458e2f7385752a601befe5956eddd6.camel@linux.intel.com>
 <e6ae9ee8-401c-8ebb-33a0-0cd630e4d174@amd.com>
 <bd385b56-7342-ba5d-38cd-2758cbdb1cf3@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9f8fe3af-6d49-f652-70bc-36a27007d821@amd.com>
Date: Wed, 26 May 2021 12:45:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <bd385b56-7342-ba5d-38cd-2758cbdb1cf3@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:7216:94bf:3812:bd88]
X-ClientProxiedBy: AM0PR02CA0212.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::19) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:7216:94bf:3812:bd88]
 (2a02:908:1252:fb60:7216:94bf:3812:bd88) by
 AM0PR02CA0212.eurprd02.prod.outlook.com (2603:10a6:20b:28f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Wed, 26 May 2021 10:45:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b75f60d9-f994-4857-073f-08d9203368e5
X-MS-TrafficTypeDiagnostic: BL0PR12MB4898:
X-Microsoft-Antispam-PRVS: <BL0PR12MB489851B545862B2199AEB71583249@BL0PR12MB4898.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NYuVDp7qDd/S25J6/UJW57nEeMb5NGSrpuPi98qkuSuLWwoX4v1UhvXJsTd0YxFMvex+Xi80bQOg9wqdfNliAhpUSnmJukjtFqApSvvShM8ecMloXsvDC8QvWAjKyErUiM6yVrfKvU+vwrbIa1iRchuQPWiChjiGb6mRyPUwuimyKWI/el4nyjMyKT1ItDxKocTJfUJkQprKr+jktmyh/qVgqK5ItWENPMBUUZfC4gjuB5FIkKV09Kbl98YMZcMx5feTSYS8CpZk0cz21FSOHSgObVaKjK9lY+p963P1WmTlP/Ofqt4pki8PpMCbmlgX/qrfYuJzoTVw9+zzjI1oT4HicUBAJ+xkgjHluIgZH27pj1e+GSQbVbeE0ttoJdAdc8BR2i2nExeYt/4mN0ISxQUUpoYl2v5feotb5p1hmFsZcu4E9TD+dNHFKKSYAkG79Cv0NYZL4kPR2tkOIXia5v42AEutIyj055rvAlZKP/otLsmVkD+QhVWSmVqpUUMpi7bh5dW7EQ+W9X9mEZUXKd3bn3IPsODSL/ZtOTW78LiJlJJqMq7T9q0XrSWzOsrCK/0QOIPWaj2juq2dYN+QZjtCSflfb0S+BGUOwrJGiA4ef1Pn8WYNg4CFsye0545iCyJyouSXlinf/mZKJWPFveR8pF5kTnAGQhiOztYn7PHMLdrePe6/LNuyvUM29cIxuP/cgkW5+pKheJPcbZMcYdY1mQBbk0btldDe2trqk2wJUwnAcAJYkh6drlBljrNRyG6OxJFU7GhfvUFgAMzGlavdIaaaDz/T3vcjqmWgFth+GbbfLpQl5+GYXtxw8iB0K4hxUG2zx1Nl2WSSg1uUHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(52116002)(38100700002)(66946007)(2616005)(16526019)(186003)(4326008)(316002)(83380400001)(54906003)(110136005)(966005)(478600001)(66574015)(45080400002)(6486002)(8676002)(36756003)(5660300002)(6666004)(86362001)(66556008)(31686004)(2906002)(31696002)(66476007)(8936002)(41533002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z2c1UmxzWDNibjZhdDUycE10NlU4empTbForakc5bGRvS3Z5M284YUVaVjlS?=
 =?utf-8?B?L0NDNFRTUWRlbjRVejd1Uk9UL0Z3MnJUOERrUStoKzA3YzdJUkoyUkJJMys1?=
 =?utf-8?B?OTA0S21XWmJQRW9penZVTWlTL0xHMk9LTmtYUTJqM2luQU9jK1B1MGE3eUlq?=
 =?utf-8?B?TjF6MEVnTXc0QXpScWdJZ1B0TlFtbDBTSDRocUVOOExYc1NucVBCSlJjYnZL?=
 =?utf-8?B?K3c2V2R5MXdZMFdvOUxFL29uUHd6WGhIVVNYNlBlK0xJSmxvTHVnU2c0S0VK?=
 =?utf-8?B?Z1dZZXNXQVZjeks1QmFqektya1RCbmZrN2U4QTZWSWc1NTk2TUx5Q0E5U3NT?=
 =?utf-8?B?TGVYQ3dDNUUxUkpMcG44dVRFaXVkT1IvWmRjb3lPUjl6VXV3V0lmMnlPQmdh?=
 =?utf-8?B?WmxvaXpKcTNzTG5RcVdGYTZDbm95OUUzTUIwSWEydWZJdWVpa3luN2d2Zkcw?=
 =?utf-8?B?VFNXOVdyaDJMbmN4NEYzYlhPVXVDd1FSbDVLT1Q0ZHZvUzI3OHl6WVorR3FC?=
 =?utf-8?B?UGtpVU9wbzdPVlF3N01NeERPdlQrZFhkbWttVlpsNG5Ddmt5cExJbk9vYzNQ?=
 =?utf-8?B?bitJWjdXdWZtby90dUw3MTZ6WjlrcUYyWkpNM3dyTE52d1N3SDBEay91d0ND?=
 =?utf-8?B?SnVrNG8zdTZaVjMwenBSMSttdDIxb3pybXdpVjFVdHNaWFkyQ29RTHJqWEti?=
 =?utf-8?B?ODJIQnlkQUVUTzQ0elNodGtKRXhDaG1ZK0djMFNKMU5QOXlyK0VTcEthYzA1?=
 =?utf-8?B?d3ZhaHIyOWIrMlp0bHByNkNVQWY3RmF2UGJtUFF0VEtSNUNLRTk3RVZrRWRV?=
 =?utf-8?B?cFpjT0VqTm9wU1RKSVFoWXRkeDlqNFQ1Rlg3RjQ3VmE2bkpPMXkyVk0zNm02?=
 =?utf-8?B?UDlieFVrK0E0YXN2Qm4xTG1VcmVrc3p5S0hXNk5abGNSSjRtK2k5ekRxU2FI?=
 =?utf-8?B?WW9ySzl4SHFqT0FYak5aczdJV0lSbmZ5SVFoRG5GVUIrWDBmV3RQLzB0UHJi?=
 =?utf-8?B?S0JWZU5OZkNacTJRRHBLamxhMEVJaDZWR3o0OFoxSW0yZkZBMXJPci9UYkpv?=
 =?utf-8?B?Q1Vyalc4UzZrcVRhWVUvUTlySmRzVG9ZaEhzd3FGN2ZZNjIyUGFudkg1ZkZG?=
 =?utf-8?B?OU9LbWVIcUtyb1gzYURBMmZiWWFpRjdwUTBwWGtIY1JlNnNJNzZFM0dPckc5?=
 =?utf-8?B?R2J0dUhneHp6OWpBSkU5bHFHVVBBMnZ0aVBmbHhhOCszR3l5cnJZY2FnNWVi?=
 =?utf-8?B?OWhyWU40bmhscFFhVFJuMXFiU3VvYyswcStFSWNyVGpsbEk3b3NneEg0bDd5?=
 =?utf-8?B?WDFtY2d4ejlxYi8rWlZyWVFVaWZFK3JFYlBWYnJ0c3E1c3ByVHQzTTh6YVcz?=
 =?utf-8?B?UDIwSno0YWE3UmNYRUYxQlZwdFNUWWtMaHJrTlhmcXMvOGo5eWR0Z1lXeUZR?=
 =?utf-8?B?ZE5YY1dWN0xCOVlubU5UbHF3N3lQSXowT2dNV2diWUxZU21yaVJzb3pldnlH?=
 =?utf-8?B?OEJJTytTWHRsWFV1VVQyVE02cGFiS1BKUlEyMXY1dzc0YTNCL1dlazBueGtt?=
 =?utf-8?B?bENURFY5S0UxV3YzcDJWd2VYYlRCSXh4ZE1ZQXFHcVNPNUdUQmZNWjZuVFVq?=
 =?utf-8?B?M0d1MkxpRTlOenV2R01UeldBT25rL1VnY1hOU1NnaHZPcGY5NkVDaGgyM2Fj?=
 =?utf-8?B?OG1Nc3pBUFE3YkRRTmtwRnRubkJTMi9QRmJPUCtYVXNDUE9KSnQ4bGZtczh2?=
 =?utf-8?B?OVJtdlJXTHFxS0d3bVIwUkZuZzB4RjU4OEJhZ1Y4V0ZNS0grUHhXczNwSEpu?=
 =?utf-8?B?SHYwN2pHWHZTN3czTEQ2Mk9CQUlpM1hOV2NYWElnclZiRDh1blNBUUN1Znhl?=
 =?utf-8?Q?hYcAlG2gowdyd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b75f60d9-f994-4857-073f-08d9203368e5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 10:45:42.6445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q6QE8wltaZAWFSeDEccqmdwVAiIai4M0SRY/xdlc8HNdvmYg0d5tTz/Omt4oVXhD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4898
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.05.21 um 09:39 schrieb Thomas Hellström:
> [SNIP]
>>> I think the long term goal is to use memremap all over the place, to
>>> just not have to bother with the __iomem annotation. But to do that io-
>>> mapping.h needs to support memremap. But for now we need to be strict
>>> about __iomem unless we're in arch specific code. That's why that
>>> dma_buf_map thing was created, but TTM memcpy was never fully adapted.
>>
>> I don't think that this will work. __iomem annotation is there 
>> because we have architectures where you need to use special CPU 
>> instructions for iomem access.
>>
>> That won't go away just because we use memremap().
>
> That's true, but can we ever support those with TTM, given that we 
> allow user-space mmaping that transparently may change to an iomap? 
> Given that, and what's written here
>
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flwn.net%2FArticles%2F653585%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C1cdcfe9d20e740308c9e08d92019785b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637576116034492654%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=e2BFGQJcElwVxrvHcnALDWscHN7ernLekGvXHqWBcwY%3D&amp;reserved=0 
>
>
> To me it sounds like if an architecture can't support memremap, we 
> can't support it with TTM either.

That was also my argument, but this is unfortunately not true.

We already have architectures where the __iomem approach is mandatory 
for kernel mappings, but work fine for userspace (don't ask me how that 
works, idk).

That's the reason why we had to fix the UVD firmware upload in the kernel:

commit ba0b2275a6781b2f3919d931d63329b5548f6d5f
Author: Christian König <christian.koenig@amd.com>
Date:   Tue Aug 23 11:00:17 2016 +0200

     drm/amdgpu: use memcpy_to/fromio for UVD fw upload

>
> In any case for this particular patch, to avoid potential regressions, 
> OK if I just add an ioremap() in case the memremap fails?

Well because of the issues outlined above I would actually prefer if we 
can keep the __iomem annotation around.

Christian.

>
> /Thomas
>
>
>>
>> Christian.
>>
>>>
>>> As for limited arch support for memremap cached, It looks like we only
>>> need to or in "backup" mapping modes in the memremap flags, and we'd
>>> mimic the previous behaviour.
>>>
>>> /Thomas
>>>
>>>
>>>>> /Thomas
>>>>>
>>>>>
>>>
>>

