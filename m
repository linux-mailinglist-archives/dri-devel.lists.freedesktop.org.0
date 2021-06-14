Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E7D3A630F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 13:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5732789E05;
	Mon, 14 Jun 2021 11:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2057.outbound.protection.outlook.com [40.107.236.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B6289DFB;
 Mon, 14 Jun 2021 11:07:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYhIGJIQJsDgGqCqYSC6yNO07JpqF5nGoOn/wE6TiUB+zz9L3MEcOCAkLjpwKuoZHCXscM6Ec81msoaRDsg+JrOoagskv3XhyYIC+SjQsQVS1cy0IPYAyvwUZ4yQbKSvj6kO2k/irbAzCbQQWdkvZ4y9ReeKNjVszhnYqpbK0sPlkEf2+sgbFfxA8m79hZmad0K/yeoLHVV2A551HivA/f7ObPAdz32uc988IVez/8O/LueIPGCfYn9zMcHXtu+kizM40KMGqrPBPUnmL3SKbs5Yxy6J7hREzj76hqwWnJ73p6ZHil4LYHVrz+Cx+1LDctJCKP/IaPcFRi7AlcinDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arNNjHokjt9B8wtc1+DQra3S1hc9rA7VbdNBObU537E=;
 b=kVvHuWxmbxl4P4KdNmgfT9yj2edaN4qWML9BW1/osfmEu+4AvdCeYH5AGicSQsQ/oZbnSzCuKq4APgNWIUvHvLXr6LPDRBvUIvNKCA+jH0ESH7E3XnKtFHW533JA0xrafCwuY0dZnPi9urGtRzrU5pHlE8dJWH36ww0YjiOs93F9WLS5OYy/a6zaHbSUpzGVF10az2L4AThLrw3SWISBzlhU+qaK0R40iC9Uhmuh5YWzsnSqpQLE7sDtq6CIGw6KGyR+Dw5iTkAKOswwbbG/ftE6lYwzW2FRfyq9+6C9hLBtgd6s7Z6fSMjG69SHuZZoZiZNzqn19igzmQjrDDZcYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arNNjHokjt9B8wtc1+DQra3S1hc9rA7VbdNBObU537E=;
 b=OzVt/q6jOEtFZiy1tyAl82ZQ7qZChp4G77AoOV24ljQVYkmuQBaUnA3YNe6VLIIgKJSgXnnEFA2NcEhv+dU4MQV+Nop9YMikQlOuOJu8C/PK3GaZkErM2RRtrhhiayJtA69bqOLcQnJUBF/jgZY/yP5kQJClWiZ6aGhkrnMnL0w=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3950.namprd12.prod.outlook.com (2603:10b6:208:16d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Mon, 14 Jun
 2021 11:07:24 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 11:07:23 +0000
Subject: Re: nouveau broken on Riva TNT2 in 5.13.0-rc4: NULL pointer
 dereference in nouveau_bo_sync_for_device
To: Ondrej Zary <linux@zary.sk>
References: <202106052143.52488.linux@zary.sk>
 <d4e5042c-3981-02b0-4b9e-fa2c8e373be4@amd.com>
 <4b4248d8-b708-3832-7fe3-2a9fd2c2311e@amd.com>
 <202106112023.11270.linux@zary.sk>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f5b5ecc6-c0d5-5dac-314a-00799980068d@amd.com>
Date: Mon, 14 Jun 2021 13:07:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <202106112023.11270.linux@zary.sk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:e8cf:b51d:4c59:9c81]
X-ClientProxiedBy: AM4PR05CA0013.eurprd05.prod.outlook.com (2603:10a6:205::26)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:e8cf:b51d:4c59:9c81]
 (2a02:908:1252:fb60:e8cf:b51d:4c59:9c81) by
 AM4PR05CA0013.eurprd05.prod.outlook.com (2603:10a6:205::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Mon, 14 Jun 2021 11:07:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a1e0373-1e40-4df3-2b86-08d92f249627
X-MS-TrafficTypeDiagnostic: MN2PR12MB3950:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3950B52EF328C6E5924DA8A483319@MN2PR12MB3950.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QP3w90tGuUMphL22XoSMbTZUoShOFyIjdA11jMXV8MIUFPXdanjTKY736kIm3xQvyRJap8ZDX/6IS0rhcEKuScMSd6k/FqLS5Lgmmki9Ihv1FMlGw7fFJ5MjlLIYkP5PhIZZDaKc4B1SEry7iZ3rdmzLfHkhxTfiQetXSd7Ld8pYXgJexOtGOakv5oi/PooKLUwojMKI7+x2+oNMdu0V76p9+9oNsWbD+EhvnPZasvlmXHRWSmO3ZIIF7ZVY2q7Fq4twuAbSzuDs36dbZBJp8ZFTRVYhw5KCk8E1UsRp+Cbk4jsaLGK05xwz53K1y6YT3wQ1bUxYL4O6TZuidy6su6d6tpoRn9ABRxBOnbrGZCfnXZO/kRihjzxAhW/MjrpxhOuRLbPDY+IQKo5vYIiZM02cKhdnTWRMsDu0ewcYfg6zCGc5pN0fP2qOaoowWnFBkc3s/hZJ3XsrRNpe/9TzEIu1mEFukQ6dWiYCGDn25TOkDLZUwF/0zULmZ9Jk3neldFple1Bbarblo4QbNbj7SHlRl5iV0pazevSmwqmPuhVl0cdr5rGN2SkKqvg1Pb/9DWj4DKLVhcuWLwFep8mepDFCNFs9jESDuVjXKrp8RS6shpJbulccSgumEH/FC9fL/9LKLf9qph5/2JagZg9EnXKDvV/b6akf6Kl73ZaWcHwiuH1nMSySmU1skDK/Cftu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(316002)(16526019)(186003)(4326008)(6666004)(38100700002)(8676002)(2616005)(31686004)(2906002)(8936002)(6916009)(83380400001)(478600001)(66946007)(31696002)(5660300002)(86362001)(6486002)(66556008)(66476007)(36756003)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVdCd2xKNnZldkRLZi9waFp3bGNZd1JOM1JrOHlGeFlHa2k1bUUvTVlDYUNp?=
 =?utf-8?B?dTJod0UzL2s1NHR0Q1ZrTjZIcndkQ0J0by9aN0d4SjNteDBjay9JWGxCdjVl?=
 =?utf-8?B?LzdVdjE1Q3h3WXp1dGhxVjRHYndsMUg0bDQyRDZmOEtUQ1o2L2N1TmswUi9v?=
 =?utf-8?B?YjFHcXdNR1RYRjFmSXU4c2NLM0pvWHZLRVRHQUVWTGhBM1dUWVFRSGlTRlo1?=
 =?utf-8?B?YVpKRkNJK016dHZJeUFtUWlzb3d4VitqbzQxbnhtL0VHWGlJcTdPY2Z2MEYv?=
 =?utf-8?B?SlFUVFJFbXlEaXN3dUVKamZKQllhMjlCaTNqd0FYZ1BoUHUzUWxyTzRWUjBN?=
 =?utf-8?B?RDA5ZW1qZ3lzNDN6MjN3NG05WlBza0FvejRMeWp6bEVRZGdNNUFUbWZaejBN?=
 =?utf-8?B?M1lKYXIxSWVrZG5ISXU0cGJ2NVhUOWFTS3FWbE5yazRDZWdwejJST1hNU1Zt?=
 =?utf-8?B?bUVnaWhHZTZwR1B4V2x6SzRCN3YxcjZoSnBGL293QlBsNEU4UGJHMXI0eXVG?=
 =?utf-8?B?ZGttVmVTQlVVY1RwQW55SThOdzF4cGZKcUNRdy8yZEc4Q0lLa3p5NXR1cVVT?=
 =?utf-8?B?SEppWFhSWnVoVU9uNGJJMEtXem1HNzR5SFVPa0E1Q244WisyS2NoWFhqTjR1?=
 =?utf-8?B?V1RJM0liOXMxWnFzaGZYRHB5TlhXdTJPMm9SM0M4a3A0MllUbjVhVXdLeVI4?=
 =?utf-8?B?TldjRlVKbnVqVStlYWdERHFmQmlFamxya0lYdE95OFF5NU10T1MrRVdxeFAv?=
 =?utf-8?B?T0hLd1NkdjJNQ3p0anhQcVViVGp3enRadGVGWnRCSVE2QUJyYjArSm5LVWtS?=
 =?utf-8?B?QmpxbVZmR3JlSThpVHFNWlBRanNBeTcvYzZqUUUvY3hnckV3YW15ais1MEdB?=
 =?utf-8?B?KzQxNWRESTNEUkRFVmR4U0dZZENkZkdWblg2dlVaM1g1OFFueHdIZy9kY1ZU?=
 =?utf-8?B?Y0RnampPdWVEbnNoRDN2RWVRWWc2NzJINHlKSEk4RW5zVklhRkFzN2RndExh?=
 =?utf-8?B?bTBlN1ZMNzhGSzlLYUpGZEEzeG5rSnlpMVdRRmFzL3dMVlI5dTRKYnYwNnlk?=
 =?utf-8?B?d2pDVDZ0N1I1dDFHL2ROSUd6QUM1ZnZ6bjRqSm5ESm9oZUhLZkpSV0ZJZjBr?=
 =?utf-8?B?NEFiKzF5bGI2c09CTlo0WGlKY05YK0RGMC8yUmc3QjlXVkFXVzFNWHhSMFNT?=
 =?utf-8?B?djVnRmR0ZnNsWmdqdWkyQ1puc0M4ajRFMkpERGU3TkxlMnkrWU1EQ3A3WUhU?=
 =?utf-8?B?U0VGVmVybFdhMnoyUVF2Z05PR0xuVlF0aEh3YXdBMWR1eHVvbTR5SHFpVWRM?=
 =?utf-8?B?OUNSZUhhNkFQcE0yR1ExYnRqa2FHZlVHOEtVdmQvTk9WdTBRTFN4VGYvdmxJ?=
 =?utf-8?B?VzQvSmVXTGg5TjFaaWFGTDNCcmN0WDc2dnVWN1lzanFEOVlIN29YcmVXdktL?=
 =?utf-8?B?allUVlZNTEdFODhUdVlvbHJoM29TN1F5THBwL0JsYjVkMVp3eW82RFc5Z05q?=
 =?utf-8?B?cDhqTnY5eU9Ibm1jSGdhTVhva25pbjZ6UVpnbGRnYmpDdGF4UlpERzFkZTl3?=
 =?utf-8?B?QllaVFIzV3p6RyswL1Q1UXpUOG5oVWhRaW9PQXdYTjVqS0R3czlDajBVOERs?=
 =?utf-8?B?U1ZlUG9XWmdoYTlBTGtFc1F2Ulorb0tVcHBGQm12Rk5BVGJZOEU1Y0pDdGNl?=
 =?utf-8?B?Q3lsZHhlbkdXcy92cUlNanhiR21wMVBhaFRsam9UYmRDQmVibk43V1JBNUta?=
 =?utf-8?B?MmxsaWZ0YlFPcERrL0F1TlNnbkVNTUZBT2p3a3NRcDRtK1Fha2xkS1BvTDEr?=
 =?utf-8?B?NjdYOGtwLzhqV0RYdDltMityeTFtdUY3MlVHaFdpQk9Gd2ljNEdLOGZiR0VO?=
 =?utf-8?Q?RskwbNwfjI5gx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1e0373-1e40-4df3-2b86-08d92f249627
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 11:07:23.6592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 016to/55FhadIajV53wQSFhCEPFPRrlhpn4+HfbtyBAAxO1A1o8dYO4vIzQiSoW4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3950
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



Am 11.06.21 um 20:23 schrieb Ondrej Zary:
> On Friday 11 June 2021 14:38:18 Christian König wrote:
>> Am 10.06.21 um 19:59 schrieb Christian König:
>>> Am 10.06.21 um 19:50 schrieb Ondrej Zary:
>>>> [SNIP]
>>>>> I can't see how this is called from the nouveau code, only
>>>>> possibility I
>>>>> see is that it is maybe called through the AGP code somehow.
>>>> Yes, you're right:
>>>> [   13.192663] Call Trace:
>>>> [   13.192678]  dump_stack+0x54/0x68
>>>> [   13.192690]  ttm_tt_init+0x11/0x8a [ttm]
>>>> [   13.192699]  ttm_agp_tt_create+0x39/0x51 [ttm]
>>>> [   13.192840]  nouveau_ttm_tt_create+0x17/0x22 [nouveau]
>>>> [   13.192856]  ttm_tt_create+0x78/0x8c [ttm]
>>>> [   13.192864]  ttm_bo_handle_move_mem+0x7d/0xca [ttm]
>>>> [   13.192873]  ttm_bo_validate+0x92/0xc8 [ttm]
>>>> [   13.192883]  ttm_bo_init_reserved+0x216/0x243 [ttm]
>>>> [   13.192892]  ttm_bo_init+0x45/0x65 [ttm]
>>>> [   13.193018]  ? nouveau_bo_del_io_reserve_lru+0x48/0x48 [nouveau]
>>>> [   13.193150]  nouveau_bo_init+0x8c/0x94 [nouveau]
>>>> [   13.193273]  ? nouveau_bo_del_io_reserve_lru+0x48/0x48 [nouveau]
>>>> [   13.193407]  nouveau_bo_new+0x44/0x57 [nouveau]
>>>> [   13.193537]  nouveau_channel_prep+0xa3/0x269 [nouveau]
>>>> [   13.193665]  nouveau_channel_new+0x3c/0x5f7 [nouveau]
>>>> [   13.193679]  ? slab_free_freelist_hook+0x3b/0xa7
>>>> [   13.193686]  ? kfree+0x9e/0x11a
>>>> [   13.193781]  ? nvif_object_sclass_put+0xd/0x16 [nouveau]
>>>> [   13.193908]  nouveau_drm_device_init+0x2e2/0x646 [nouveau]
>>>> [   13.193924]  ? pci_enable_device_flags+0x1e/0xac
>>>> [   13.194052]  nouveau_drm_probe+0xeb/0x188 [nouveau]
>>>> [   13.194182]  ? nouveau_drm_device_init+0x646/0x646 [nouveau]
>>>> [   13.194195]  pci_device_probe+0x89/0xe9
>>>> [   13.194205]  really_probe+0x127/0x2a7
>>>> [   13.194212]  driver_probe_device+0x5b/0x87
>>>> [   13.194219]  device_driver_attach+0x2e/0x41
>>>> [   13.194226]  __driver_attach+0x7c/0x83
>>>> [   13.194232]  bus_for_each_dev+0x4c/0x66
>>>> [   13.194238]  driver_attach+0x14/0x16
>>>> [   13.194244]  ? device_driver_attach+0x41/0x41
>>>> [   13.194251]  bus_add_driver+0xc5/0x16c
>>>> [   13.194258]  driver_register+0x87/0xb9
>>>> [   13.194265]  __pci_register_driver+0x38/0x3b
>>>> [   13.194271]  ? 0xf0c0d000
>>>> [   13.194362]  nouveau_drm_init+0x14c/0x1000 [nouveau]
>>>>
>>>> How is ttm_dma_tt->dma_address allocated?
>>> Mhm, I need to double check how AGP is supposed to work.
>>>
>>> Since barely anybody is using it these days it is something which
>>> breaks from time to time.
>> I have no idea how that ever worked in the first place since AGP isn't
>> supposed to sync between CPU/GPU. Everything is coherent for that case.
>>
>> Anyway here is a patch which adds a check to those functions if the
>> dma_address array is allocated in the first place. Please test it.
> Thanks, the patch fixes the problem and nouveau now works!
> Should be applied to 5.12-stable too (5.11 is affected too but EOL).

I will just add a CC stable tag before pushing.

>
> It's weird that it worked before.
> Looks like dma_address was used uninitialized - it contained some random
> crap:
> [   12.293304] nouveau_bo_sync_for_device: ttm_dma->dma_address=3e055971 ttm_dma->ttm.num_pages=18
> [   12.293321] ttm_dma->dma_address[0]=0x0
> [   12.293341] ttm_dma->dma_address[1]=0x0
> [   12.293360] ttm_dma->dma_address[2]=0xee728980
> [   12.293379] ttm_dma->dma_address[3]=0xed1cb120
> [   12.293397] ttm_dma->dma_address[4]=0x12
> [   12.293416] ttm_dma->dma_address[5]=0x0
> [   12.293434] ttm_dma->dma_address[6]=0x1
> [   12.293453] ttm_dma->dma_address[7]=0x0
> [   12.293471] ttm_dma->dma_address[8]=0x10000
> [   12.293490] ttm_dma->dma_address[9]=0x0
> [   12.293510] ttm_dma->dma_address[10]=0x101
> [   12.293528] ttm_dma->dma_address[11]=0xee7289ec
> [   12.293546] ttm_dma->dma_address[12]=0xee7289ec
> [   12.293564] ttm_dma->dma_address[13]=0x0
> [   12.293581] ttm_dma->dma_address[14]=0x0
> [   12.293599] ttm_dma->dma_address[15]=0x0
> [   12.293616] ttm_dma->dma_address[16]=0x0
> [   12.293634] ttm_dma->dma_address[17]=0x0
> But it did not matter as dma_sync_single_for_device is a no-op here.
> When dma_address is properly initialized to NULL, it crashes...

Ok that explains things, but essentially means that this only worked by 
coincident.

Just send out the patch to Ben, the list and you once more. Please reply 
with a rb, ak-by and/or tested-by so that I can push it ASAP.

Thanks,
Christian.

>
>> Thanks,
>> Christian.
>>
>>> Thanks for the backtrace,
>>> Christian.
>>>
>>>>    I cannot find any assignment
>>>> executed (in the working code):
>>>>
>>>> $ git grep dma_address\ = drivers/gpu/
>>>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:
>>>> sg->sgl->dma_address = addr;
>>>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: dma_address =
>>>> &dma->dma_address[offset >> PAGE_SHIFT];
>>>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: dma_address =
>>>> (mm_node->start << PAGE_SHIFT) + offset;
>>>> drivers/gpu/drm/i915/gvt/scheduler.c:   sg->dma_address = addr;
>>>> drivers/gpu/drm/i915/i915_gpu_error.c:  sg->dma_address = it;
>>>> drivers/gpu/drm/ttm/ttm_tt.c:   ttm->dma_address = (void *)
>>>> (ttm->ttm.pages + ttm->ttm.num_pages);
>>>> drivers/gpu/drm/ttm/ttm_tt.c:   ttm->dma_address =
>>>> kvmalloc_array(ttm->ttm.num_pages,
>>>> drivers/gpu/drm/ttm/ttm_tt.c:   ttm_dma->dma_address = NULL;
>>>> drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c: viter->dma_address =
>>>> &__vmw_piter_phys_addr;
>>>> drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c: viter->dma_address =
>>>> &__vmw_piter_dma_addr;
>>>> drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c: viter->dma_address =
>>>> &__vmw_piter_sg_addr;
>>>>
>>>> The 2 cases in ttm_tt.c are in ttm_dma_tt_alloc_page_directory() and
>>>> ttm_sg_tt_alloc_page_directory().
>>>> Confirmed by adding printk()s that they're NOT called.
>>>>
>>>>
>>
>

