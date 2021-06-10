Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF4D3A329D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 19:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9CF6E4D7;
	Thu, 10 Jun 2021 17:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2072.outbound.protection.outlook.com [40.107.95.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004A16E4D7;
 Thu, 10 Jun 2021 17:59:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDYJVLQ2y2okNzEv4ZaryzFn1iIRH0liMgMtwdnApq9xiU5iUriohJ+tLAIcj+iL0Ioe8hXnigdge683WPvvXjTTjOG1C8O/wZ2iZyLmxjw+NT3AJcb5Bub2+tnNj6t3QSp9CnuT1kHN3fMYzIMvqbkGJE3/YgaTZeCeVjqOcTgTHA62gHps6ei6xgwxdZV64yKOqtsCQovCMdb0IjevnbegTXE/Z8E9a212LDyRc9Q722dFg1rQBHHxx2HqcE/jovTBdYOVPHAHPaQfry1SOmwJBD+IqQuxRNeK1rzVa6FdHq4hbt8JqybKqoLnF0cjvS1/zs00apRD4ZxsiawHUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECIAi60eKo5OsiyHQF7gka0OfPcaD+vffYFVXSBSrNs=;
 b=cMY70qD001V1bZFJOOGtRLqMIIRFUQ7swhpk1m8JT4mAC9YOC9A++BzQGCXK2oa6iRyokkQxYoUhF+3kBMccAleJR4BmXDbV6+k84mD/fcD49XgaltwtKhEgmAKY+zHufxjsKkkFok7fDaXSXGav+oMiS/+eYLTqIMsp3rOJpP+PFRaQHGWhLkOJOTdFRsLjvfJwheEkqH5bZpoOuzQroJF/yycj5IekpYujz9vHuxmweo9Xlt8Esn0D64UZAxdF6mXReCpxphrzA0ex4V2Flm9zU4SMaVKEZQvriTzYDEaRDK0PYvoFn0wKiTfJga0jFd5f2OLcEgGBDCDXkH7rog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECIAi60eKo5OsiyHQF7gka0OfPcaD+vffYFVXSBSrNs=;
 b=F9hwcIMnGeTKTiM6665fV3QQoDmkwJFZvdMVZN28fqoc8CjwXAlaR34ivjAyy1Tk4zbgUeiEygmsiYlG6MkqicnIqG04WBIuwXa5UdOVNH+XT9mLzWxTw67kBVCRCJPn0EKZMYhfw3xzwAcMOfkdinmDy7Maj33c5A1d8rEDAIM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2580.namprd12.prod.outlook.com (2603:10b6:207:3e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 17:59:41 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 17:59:41 +0000
Subject: Re: nouveau broken on Riva TNT2 in 5.13.0-rc4: NULL pointer
 dereference in nouveau_bo_sync_for_device
To: Ondrej Zary <linux@zary.sk>
References: <202106052143.52488.linux@zary.sk>
 <202106092200.08088.linux@zary.sk>
 <081b7908-9a1c-fef1-2b82-4b794f612c9b@amd.com>
 <202106101950.28723.linux@zary.sk>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d4e5042c-3981-02b0-4b9e-fa2c8e373be4@amd.com>
Date: Thu, 10 Jun 2021 19:59:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <202106101950.28723.linux@zary.sk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:57c:8a70:f9b:430d]
X-ClientProxiedBy: AM8P191CA0030.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::35) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:57c:8a70:f9b:430d]
 (2a02:908:1252:fb60:57c:8a70:f9b:430d) by
 AM8P191CA0030.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Thu, 10 Jun 2021 17:59:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5cec751-1ac6-43eb-da8a-08d92c398553
X-MS-TrafficTypeDiagnostic: BL0PR12MB2580:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2580FA5BE992357B2DF24FF783359@BL0PR12MB2580.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lFMkp6fRnUNEz+PUdAferL2FHOWrQXNYU5fBv4plcUz11Sdqw5NCrCn8MkWgfcnYn0i7cy60A9/dckJ2Y6lTbTbne5idcftLbPwUjPihgPYDVidSLRSub6V9pdRv5jIk6/spaY29LJFGFA+gY6GjPNLX1jW7nu4aMVHj9yi/4Qvv4nICkX79oxtV4sualmlSH+pZ6dYsERvvfLk3P7eaOkA3+aCvbj/C4BPgNFv3rAoMoHVfm1nXF14xKBmiXOzWfclIjhmZF6DfeseEsApbGiYHxTPQvAN8ul3pR9vk6UHlztFidnXRAFEFGxUmMVK258gen+Hieo5RW+NyttIVUv4a7u7OLdqXOuA6fYollCUPNQgdX4CFQ5FHZpYeJ41457UPDxBEJlHXWJxI9zSvkeGYOrIqaBzaKveoL7wGA1pk7UauGkYwQiYIfTxYs4276XwpJMtbIFyc+opAQjvGx8xyTWEIx0l+9HIcnWH6qYNtwxNQv0rhHKwPQANdaP8x2VTYLEIKL9sFf9e0BAx09P4lu6T8E5IUtEc00r1aT9gnAE2oInyW+NGBYa3bygXTMfLWbp9Sv2LNTHkYPZyCHJcR5R0dGqN9yWlOLaX6ZfEXvOtIv2h7HUkRhBB6HyYzWlKk27sTbycNxUdFTelUrnJBnCUvw7pdXRj7axlAbOssPdfEJm5/WCp+dsjSL0JCgaEwD2BpY2hFi6FAKJAgwg5TmYSPSXB3DeeWIBiy09Jj9JstYypm7ZRykJSw6AMI/C1tEPGTdbaz/xDFdFBR3pspk6FYu38fEcp0dfhYBIk2gN9sgN1Hn9GupDX6s2w/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(366004)(136003)(346002)(66946007)(83380400001)(966005)(36756003)(478600001)(45080400002)(8676002)(8936002)(316002)(186003)(4326008)(6666004)(86362001)(66556008)(2906002)(6486002)(66574015)(16526019)(66476007)(31686004)(5660300002)(2616005)(31696002)(38100700002)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V00xc3kyOUhIdGkrZUNEcXhKbUFzUzc1NVBDL0NYVkUxcFhvV3paUk5saWV3?=
 =?utf-8?B?TTVSb21WS3hPanlrR0JVUDBpaitqbkpRWEh5YnN5T1A5cFhJNDE0ZGF1cWpz?=
 =?utf-8?B?QlFCZGE4dm1Jemk5UWpkU0dleENQMHVpekFyQ0hiRkYxelY2UmFxSFp4ckQ0?=
 =?utf-8?B?Mzhqek41Z1JMR3pBeGJ6dWlYSTZyb3IzOFVwZEtPbzdMSWRFcUhoOTlaUlFF?=
 =?utf-8?B?SUhWREM0QUllYjZkdEt1SWdKVFhDSVh2V2dJdVU5dGdRVjFlWlVVdEJGdVpn?=
 =?utf-8?B?RTI4aHRFNjN5VE5WSklVOUtKdEVDai9xSWtJa2c0THllcHE3RkU0dUpDY3V1?=
 =?utf-8?B?QWNFaTZWb3M1MHI0NnNBc1NRL1htZHRQUTZSZDRsY2tHaGVkS21DNGdDd2ND?=
 =?utf-8?B?SlZOallhRXVjOGR6dnFRL1R4VTN6R0lPeFkvK3c1R3pkVHFUN0dGaTVRdVRG?=
 =?utf-8?B?VDRSckRINTdnNzNkb2dHTmFsZTR1UEprSHJadkxXSUVud0FKdGFUVDY0bWVt?=
 =?utf-8?B?L1VldlBqMnZna2tFY20xREVuenpBNGRzWUtYYm8vR3I5TzUyU0ZsR2xSK25n?=
 =?utf-8?B?MkMvZjJGWDc1a1ZvN0IydnFNQisyM2JaUFI0U0xIRVR6RlUwWmVYMXM2ZFNJ?=
 =?utf-8?B?UlBYRmoxL0x4eHBGTE5mOEN4Ui9qVHJGa3lKaVZ4SlhGQ0JVZk1yYzZXT25j?=
 =?utf-8?B?SVJZQmVCVGo4MDZFUHl1d1dOMCtzL2wvUHh1L050aDNEUjhCOW5JY3pqRWtV?=
 =?utf-8?B?VEJ2N3I2NUx1dytnMkt3dkpIR0FYSnZLRGU1dHJ4WHYwMWY1Ly94eEMxaUQx?=
 =?utf-8?B?RVZUYkRoWW1BMHhHZm5yVlNvSFVKcWZZVi9XNTgwRU96UFVUNjcvYUE0WnU4?=
 =?utf-8?B?Tm9wTVVZbzF3OUQzUzdldFdUcmhWa2czamRrRVhDM3ZZOEc0ZjlTQXQ2bk9y?=
 =?utf-8?B?dDlNVSs4Tk1FZGVFNDVaNjRIdHhkMU80QnFFYU15VXUzZFFLdFk0U1BHVzhv?=
 =?utf-8?B?U2doamlaTmtldlhFaGNuOEdxZ25NNTkxV1MyQ0toT000OGI3a1g0bGhBNkoz?=
 =?utf-8?B?NkMyOGlnQU9TVlUvUmtPU3REY1RXL2RYb3hodzZHdlVqSFpsTVVqb0I3ZUNI?=
 =?utf-8?B?RjhwNW9wN2FUQTlQeUd6M0lxUEdtZk5PM0lZckE5MnlYVlQreFBFVS96Q3FG?=
 =?utf-8?B?eTF2aE1URVhHdHRXbTZYQnZ4Ynlxbzd3YVU1RDNlcXV5WFpQMDJSdnVsQ0VQ?=
 =?utf-8?B?V2dZNVZaei83SThVTVN6dld4U0ROMmxNL3ZrRm9LVXZSbjhCZmVnUmVTUlgv?=
 =?utf-8?B?bXFCcDk3M3NlOW5YQ1kvMVM1QmZPV0ZVdVJYZmd3NzhMcGhUN2d2di91Vll2?=
 =?utf-8?B?T0N6cWVySlhNb0tBRExrU3c5Q2dLdWJrZEkvZnZEOFZmQm40WHdDemVKRmZp?=
 =?utf-8?B?TFptOGd0cVhCNER1YXlDK0NjeHFiRWJxb2MvQ0djR2VFNXhHWm5rTElzV3N2?=
 =?utf-8?B?amZsWU0reGR5MGRZelFUSENJdUQwdXNFVmxZbHFMaHpsVlBveWJWYW94ak5v?=
 =?utf-8?B?N0QxaDVKYnZTWEtmbWpHejQ0UHMwNHdRTUVWU09sdlpFRzkyQnlyV1E3c0pD?=
 =?utf-8?B?TXc3S0VJSlpaZ3o1eFlKY1B2NE12NStBZmFXYndXbEhuemhDdyt1WVl4L2Jm?=
 =?utf-8?B?bnArdVBKWXhIdjd2Sm9JTFBJVXZUNkdlSUd6N0JuZlNwM0dtaWZsc1ZFQ3NM?=
 =?utf-8?B?UDhDdFg3a1J3ckcrbEh0cks1RVkrYjJoTE9UUTNKaC9pSit4YTdpSjNTWm1E?=
 =?utf-8?B?ZlR3ZjMzME5DSHVMamRUQTNTbjZublNMMWtyZ1l4ektUaUZYUTkzMWJVQzI3?=
 =?utf-8?Q?+S6HCC6dqfUSQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5cec751-1ac6-43eb-da8a-08d92c398553
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 17:59:41.3997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+j6+RntgeK5anriUT8Iqh2E5rp9sQMp3Wd6oTXMIdC+kZyui0JFIYaAII3lQmy7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2580
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.06.21 um 19:50 schrieb Ondrej Zary:
> On Thursday 10 June 2021 08:43:06 Christian König wrote:
>> Am 09.06.21 um 22:00 schrieb Ondrej Zary:
>>> On Wednesday 09 June 2021 11:21:05 Christian König wrote:
>>>> Am 09.06.21 um 09:10 schrieb Ondrej Zary:
>>>>> On Wednesday 09 June 2021, Christian König wrote:
>>>>>> Am 09.06.21 um 08:57 schrieb Ondrej Zary:
>>>>>>> [SNIP]
>>>>>>>> Thanks for the heads up. So the problem with my patch is already fixed,
>>>>>>>> isn't it?
>>>>>>> The NULL pointer dereference in nouveau_bo_wr16 introduced in
>>>>>>> 141b15e59175aa174ca1f7596188bd15a7ca17ba was fixed by
>>>>>>> aea656b0d05ec5b8ed5beb2f94c4dd42ea834e9d.
>>>>>>>
>>>>>>> That's the bug I hit when bisecting the original problem:
>>>>>>> NULL pointer dereference in nouveau_bo_sync_for_device
>>>>>>> It's caused by:
>>>>>>> # first bad commit: [e34b8feeaa4b65725b25f49c9b08a0f8707e8e86] drm/ttm: merge ttm_dma_tt back into ttm_tt
>>>>>> Good that I've asked :)
>>>>>>
>>>>>> Ok that's a bit strange. e34b8feeaa4b65725b25f49c9b08a0f8707e8e86 was
>>>>>> created mostly automated.
>>>>>>
>>>>>> Do you have the original backtrace of that NULL pointer deref once more?
>>>>> The original backtrace is here: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.org%2Flkml%2F2021%2F6%2F5%2F350&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C657222345e3242e7a6a608d92c383f66%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637589442963348551%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=ZkJs%2FR8MeQKUxwhJUC%2FG4Hi3T%2FMIftt%2FWRh%2B1%2BU5rUE%3D&amp;reserved=0
>>>> And the problem is that ttm_dma->dma_address is NULL, right? Mhm, I
>>>> don't see how that can happen since nouveau is using ttm_sg_tt_init().
>>>>
>>>> Apart from that what nouveau does here is rather questionable since you
>>>> need a coherent architecture for most things anyway, but that's not what
>>>> we are trying to fix here.
>>>>
>>>> Can you try to narrow down if ttm_sg_tt_init is called before calling
>>>> this function for the tt object in question?
>>> ttm_sg_tt_init is not called:
>>> [   12.150124] nouveau 0000:01:00.0: DRM: VRAM: 31 MiB
>>> [   12.150133] nouveau 0000:01:00.0: DRM: GART: 128 MiB
>>> [   12.150143] nouveau 0000:01:00.0: DRM: BMP version 5.6
>>> [   12.150151] nouveau 0000:01:00.0: DRM: No DCB data found in VBIOS
>>> [   12.151362] ttm_tt_init
>>> [   12.151370] ttm_tt_init_fields
>>> [   12.151374] ttm_tt_alloc_page_directory
>>> [   12.151615] BUG: kernel NULL pointer dereference, address: 00000000
>> Please add dump_stack(); to ttm_tt_init() and report back with the
>> backtrace.
>>
>> I can't see how this is called from the nouveau code, only possibility I
>> see is that it is maybe called through the AGP code somehow.
> Yes, you're right:
> [   13.192663] Call Trace:
> [   13.192678]  dump_stack+0x54/0x68
> [   13.192690]  ttm_tt_init+0x11/0x8a [ttm]
> [   13.192699]  ttm_agp_tt_create+0x39/0x51 [ttm]
> [   13.192840]  nouveau_ttm_tt_create+0x17/0x22 [nouveau]
> [   13.192856]  ttm_tt_create+0x78/0x8c [ttm]
> [   13.192864]  ttm_bo_handle_move_mem+0x7d/0xca [ttm]
> [   13.192873]  ttm_bo_validate+0x92/0xc8 [ttm]
> [   13.192883]  ttm_bo_init_reserved+0x216/0x243 [ttm]
> [   13.192892]  ttm_bo_init+0x45/0x65 [ttm]
> [   13.193018]  ? nouveau_bo_del_io_reserve_lru+0x48/0x48 [nouveau]
> [   13.193150]  nouveau_bo_init+0x8c/0x94 [nouveau]
> [   13.193273]  ? nouveau_bo_del_io_reserve_lru+0x48/0x48 [nouveau]
> [   13.193407]  nouveau_bo_new+0x44/0x57 [nouveau]
> [   13.193537]  nouveau_channel_prep+0xa3/0x269 [nouveau]
> [   13.193665]  nouveau_channel_new+0x3c/0x5f7 [nouveau]
> [   13.193679]  ? slab_free_freelist_hook+0x3b/0xa7
> [   13.193686]  ? kfree+0x9e/0x11a
> [   13.193781]  ? nvif_object_sclass_put+0xd/0x16 [nouveau]
> [   13.193908]  nouveau_drm_device_init+0x2e2/0x646 [nouveau]
> [   13.193924]  ? pci_enable_device_flags+0x1e/0xac
> [   13.194052]  nouveau_drm_probe+0xeb/0x188 [nouveau]
> [   13.194182]  ? nouveau_drm_device_init+0x646/0x646 [nouveau]
> [   13.194195]  pci_device_probe+0x89/0xe9
> [   13.194205]  really_probe+0x127/0x2a7
> [   13.194212]  driver_probe_device+0x5b/0x87
> [   13.194219]  device_driver_attach+0x2e/0x41
> [   13.194226]  __driver_attach+0x7c/0x83
> [   13.194232]  bus_for_each_dev+0x4c/0x66
> [   13.194238]  driver_attach+0x14/0x16
> [   13.194244]  ? device_driver_attach+0x41/0x41
> [   13.194251]  bus_add_driver+0xc5/0x16c
> [   13.194258]  driver_register+0x87/0xb9
> [   13.194265]  __pci_register_driver+0x38/0x3b
> [   13.194271]  ? 0xf0c0d000
> [   13.194362]  nouveau_drm_init+0x14c/0x1000 [nouveau]
>
> How is ttm_dma_tt->dma_address allocated?

Mhm, I need to double check how AGP is supposed to work.

Since barely anybody is using it these days it is something which breaks 
from time to time.

Thanks for the backtrace,
Christian.

>   I cannot find any assignment
> executed (in the working code):
>
> $ git grep dma_address\ = drivers/gpu/
> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:       sg->sgl->dma_address = addr;
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:                dma_address = &dma->dma_address[offset >> PAGE_SHIFT];
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:                dma_address = (mm_node->start << PAGE_SHIFT) + offset;
> drivers/gpu/drm/i915/gvt/scheduler.c:   sg->dma_address = addr;
> drivers/gpu/drm/i915/i915_gpu_error.c:  sg->dma_address = it;
> drivers/gpu/drm/ttm/ttm_tt.c:   ttm->dma_address = (void *) (ttm->ttm.pages + ttm->ttm.num_pages);
> drivers/gpu/drm/ttm/ttm_tt.c:   ttm->dma_address = kvmalloc_array(ttm->ttm.num_pages,
> drivers/gpu/drm/ttm/ttm_tt.c:   ttm_dma->dma_address = NULL;
> drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c:             viter->dma_address = &__vmw_piter_phys_addr;
> drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c:             viter->dma_address = &__vmw_piter_dma_addr;
> drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c:             viter->dma_address = &__vmw_piter_sg_addr;
>
> The 2 cases in ttm_tt.c are in ttm_dma_tt_alloc_page_directory() and
> ttm_sg_tt_alloc_page_directory().
> Confirmed by adding printk()s that they're NOT called.
>
>

