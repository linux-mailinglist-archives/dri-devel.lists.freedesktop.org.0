Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFB68D0517
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 17:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4D610E1C0;
	Mon, 27 May 2024 15:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WhJYc4qP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29A110E1C0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 15:02:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwQAVeystXTIGjjNEOh7gvqy8eGgi6fZ0GCsCwN4w+qLY5U2stMjVjFsRoptQfD2fwZkm0trJJtvQG6m7aH8zGVEu4/kRo76DsPuLxZUNfESW6FqrRUisEjXRgrtnnPAeNwHi23gWODAn0JXw2pum77JrsIOeNfITEU+moIRd9CKa3X3zLt6uwQQWTxIXfXsP+2pDnGiLlMUwYobURHJk54i204DfJqMIk+LV4XoDEQ/25XeYOQuJOaBCDJce0XFPj6RxkaxINHGbh+VafHkQDrsO7abhdYCaewDBbYTV4RqczObnMie6VBPO68sWaFupnaqJkygLXcinf2wfCfykQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CyRaoxqiUniTBIFiNz3HqqTIRbeTDzUTLGl0hWAUVw=;
 b=l5+xeDHlFfjKb7Iva+5l8PPfaGtNU2ofKHQheTJY2ct1gj7SaSPMPCH3jJxHcmVeGuNZ4DpCBmQosUkNH/2MpWILvhyZeycBgugFz8A7waB9Cx+uC2z7ROt7660bPr2icux7ynMZZ47mtHjVJ13Mo7Hzu7eCRUGOxahN6CmNpTc30C+mX+TLCvCr4HGCXdW/VSDA72xwBmVON30UzvpBXCPwxdb8pzw9uQixV2iZpF8uoTNgPCnyS6/HQa392LMCLN2+SyRiyY9PG0qj/rRWswvrGOUuxdnCVL+f3BPiqgNuI3lHQ0gldnhjziwDlnd5e2R2OC/RXW+jE1Oxl/ZZPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CyRaoxqiUniTBIFiNz3HqqTIRbeTDzUTLGl0hWAUVw=;
 b=WhJYc4qPUbfC1GtOBSLvO71wjRegnXOlKat1+iaijMmSlFKzYkYKLYXjQBDynCjwPLx+IJVEB53SnaXpJDi3v9lJJ4Tzv0L0wIAYX/kHqWGynD+PvD1pzEWKIYRxTEk5yM54ZltsrcGaj6ScSr+CLcuHBuVl6pci3xAOWY5//sY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB6699.namprd12.prod.outlook.com (2603:10b6:510:1ce::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Mon, 27 May
 2024 15:01:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7611.025; Mon, 27 May 2024
 15:01:58 +0000
Message-ID: <b25747ca-c8a8-45de-a5e1-f8cf2caa2729@amd.com>
Date: Mon, 27 May 2024 17:01:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dma-buf: handle testing kthreads creation failure
To: "T.J. Mercier" <tjmercier@google.com>, Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, Alexey Khoroshilov <khoroshilov@ispras.ru>,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
References: <20240522181308.841686-1-pchelkin@ispras.ru>
 <CABdmKX2qdT0HvkX0B6kcxALwxZsLFOtgPsOP_rY0AXM1eAtAtA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABdmKX2qdT0HvkX0B6kcxALwxZsLFOtgPsOP_rY0AXM1eAtAtA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: c6f0c941-3819-4a2b-2e5f-08dc7e5df47c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|7416005|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUN5ZHNvdFpLSU00dkZlZ2dKajgzQ1BoR2lBQm5UUGtwZVFTL0kwVjNSOXAw?=
 =?utf-8?B?QWlXRTdXVzcza242Z2kyMXpFdG1KUEhXQ01ycmlxa21GRjF1ZVhOSXUwT3ZM?=
 =?utf-8?B?aUNnbVNydHpITTZpdTR0Yk5jeitxSFZJbndMTjJzazhpMmNVMnJ3aE4yWUt3?=
 =?utf-8?B?MEtveGxVZU1Xb21EZVFXUjllU3VicUZDaFZqbDNVV2g5eS9LOHNtZHlxdzll?=
 =?utf-8?B?Mk5SVCs0cUpZaS9qRXJ3TFROTzFud29BMkJUR2RSNXcyaVRkUjhEb2RFTUJM?=
 =?utf-8?B?dkphUDBwR1hDSzlZRVY3WFlNTWQrL1ExMHIvU0IyYWY3cUhweDYwSTFGeVRI?=
 =?utf-8?B?L0ZkL2srMXFrWFQ5RFR2enQ4WStMWVdpK24zR3pFNXlMN0I1d1JJRUJtOVJk?=
 =?utf-8?B?ZDJ0VURyK0FwUVF0QytkbktadHovWWlJTWx1Rng0bWtpak9NL0lwaitXY0po?=
 =?utf-8?B?cGp5TXhzQ0kwR2xaWmk2V1Uza1hoZ1p2NUNZckVSNEZpZjBseG9Vc2ovcElF?=
 =?utf-8?B?L1QvOEEvYzNndmhweHFIa3RSbnFSZjZkUDEwRS9hS2RrWVdrY2FpRlAzc3c4?=
 =?utf-8?B?ZU5PRjRvQm5zb0dwRnhjUmVRTUFEV3ovQWF1aStxMlRiSXF3NWNuVnd2M0tH?=
 =?utf-8?B?dEZiRW9ZUzl4SUdGSmJBb1d5OVNDRHp5bi9RU1dHek04TXkvVzdEUW03MGJ5?=
 =?utf-8?B?aU51d3BkTk14MTZQMkx5Q3RFalJpVGxMaU5nNU96emtMQzZqaURlNkVmLy9m?=
 =?utf-8?B?RUF5MkNzSzJRcUlhOFM2RG5IVTBnRG1nL1dpcDJ4SkNYK2NRQnJHWUYralkr?=
 =?utf-8?B?Q2pEbUlrdmlpSXNGV3JmOUdEdGI1WGExeWZPUG9mOVVJTWlVdGsyc0RzY25p?=
 =?utf-8?B?S2Zsd29OTHNBMzVDZ2ozZUtZOThGREpKRDdJbHltMk5xWFJpdCtIbkVuTmlJ?=
 =?utf-8?B?bnB5OFdzMEpXeEs4ZFJyYlVFNWVOS3owTS9DSWhqMlFYVTZsRG91ZWJUbkRI?=
 =?utf-8?B?RUVDRW90NXVYZ1VDYkFsOGpZWkZRK1VHbU1mK2tXVVduVTdKRzVLcFNXUVhU?=
 =?utf-8?B?amtndFFzalhpUTYvYlRWYUE3YXJjOTlNdmdVQWc4ZERGVUFWR2xVM1M2SnVW?=
 =?utf-8?B?cTVIemZFbXh3dURqekcwam0wUHZyY0RZNkFEMGl3aWZ3bjlOUTdtaC9mNkpy?=
 =?utf-8?B?bnliOFNlMDhRR3VUNk9icXh3YVFCK2lCMjEvQjluMTZBdEtMb1lzajVFVVpE?=
 =?utf-8?B?R0VkeHhKVzJLdmpOcnNJcHArN05TNGtWMWRvSWl2ckpIUFY1OVRaTUhMR2Qr?=
 =?utf-8?B?dW8xQS9EbVhUek9QQUhsUFlyZjNkMm9GRlNCa2hWbkR0ait4SmF0TzJEa3Vo?=
 =?utf-8?B?b1pleGdWUU94SDFzb1ZWNU9WVkNKYnB0Wmo5QkM5ajZwQWFlN2xvNzdTMW9N?=
 =?utf-8?B?MUNNNkE2L2YzZ01ycVl3OEdQTm94cG5hSUQzV1BYMU5XNWE1ei9zVmFqTy8y?=
 =?utf-8?B?blRCakxlZmg0QTJBV2YzWFA1d05KRkx4Si92SmttNFlIbmgrZ1pOaFd5U0o0?=
 =?utf-8?B?VHFEdjZWSW1iRjNIUEFaTDhYMWM4aEdZd2JsS1JrWnFVMFJSSyt5Zkg0MTZL?=
 =?utf-8?Q?TilkjKqkCNDIeX6P4rESxSdiG59u0Ut4lDRO0rkwp5js=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(7416005)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmNWZjZMVkRmbmc1YWNPeHBKeG1oREN1UHF5eFdGQ0V1TTN4dDQ0NXdoTFhs?=
 =?utf-8?B?Y2szZTFRdWhvTjR4dUk2QU9kZTBDeTcrcmp1UGlzdjN4alJrS0g5N3Zid2J4?=
 =?utf-8?B?S3AxVVg0Q0RsM1FUWkhtSFIrbmRSejMvcEFXK20rZFFqcEh0UFdkYnkzTHZK?=
 =?utf-8?B?MklFRkJ5WVB5SG9hTHJpeHU0T29XQzhTdUdXMU9md0lnUGlTTUJYNXRYa2My?=
 =?utf-8?B?SGlLc0RaYXBtZWlPOTIvSWRORWZsWUk0ZlFONTBlaFhHWWt3WjdRZURBRnhJ?=
 =?utf-8?B?SEsrbDg4Y3c4UUJzbDFlU0ZvWXBlMzFVWEpxOUN1bTRyMEtSTVdjeTUrZ2hW?=
 =?utf-8?B?dFJINHZNbDlaWWRSTk13bnl0Y25mbHNoZEx4M1RTc1J6eURNekZUMmtIbVNy?=
 =?utf-8?B?Sk5HZkE3YkhIM1M1K3cwTDFTSUVpMTd1Z0x2RkFMWGk3MFF1eTFLejRCazZD?=
 =?utf-8?B?U3JoRUpHeE8xdW1iczNNbzdjV0VrbmJlc3dqSnlzSzJCdWJiNXFRMFBldkps?=
 =?utf-8?B?WC9vdDY4YUFNbEp6cHptNGdtcjloQXF2bUdXd2RBbVU5dzhjYW1LUmF2NUV2?=
 =?utf-8?B?TUtRN3A4Njg3amNzV3VRL2paNTB6dlluUit3UVlZcHZQYTY5bzZidmVaYlBI?=
 =?utf-8?B?UlZvS2VkT2RYWm9uaUY5aUtBL21YRVMvTlJ2WldzQ1A2MFFLbXl6UnVONFc2?=
 =?utf-8?B?cDM5enVwcjNTaDJVUDZGTXFIbkc0Q0V6ZDQ1K2lKSDBVQUlHcTZwNGdzdE9G?=
 =?utf-8?B?WUtleTV3OVVQSE04K0xtbGpra290Q011L3F3OFkzUWlNdGJ1SkFKdWc5MStK?=
 =?utf-8?B?eFpON2hnbUorL0NwRW9PMTlMYkgvdkc0RFNndm5RV2ZFTVZsK0RQZm9zOTJl?=
 =?utf-8?B?UStnbFlCSWxrdER3ekdVTE1XMFZ6UmtwV2JKNzNmZDBlbFJVTDNTQyt5R2Z3?=
 =?utf-8?B?WHhPMC8zUGpEdzVwbmxmQjUrYUVUa0o5MVExL3NzWnNsT0FjbGtTZXdSRmdH?=
 =?utf-8?B?bTh0WjkwU0J0bmFtU3pscW05RVZ2Y2RuWnhZQm1rVTFXczhSc0JMQXQ5TjR1?=
 =?utf-8?B?S3dnMlpDKzhueHJObWp4R0xnaXRJYWZ1b1lvS09XWFJzRkRZaW1XbGh4VXRB?=
 =?utf-8?B?UnhuSTVlT2RUalRKMHNIenYzdE80SGxSdWhrOG9LU1pEK0EzMmM3RWRXa3hX?=
 =?utf-8?B?RWpaSzQ3NGljYy9MNlRYeXdQUDB0dDllNm5pR3pQbVJtbEZYc0ZuYU9DM3RP?=
 =?utf-8?B?VlR5SE1SYWdCNnJ3MU1wYTlGT2N2V0VUaG0waDZWREdnNkNHckNwSGlYemJ4?=
 =?utf-8?B?MjVaNUZnajZuNDgrNC9TOC9HVm84YVFZelpWa2tKQUFoNmR6M1NRRHdlZWpX?=
 =?utf-8?B?Y05zOUFkWkc2YWxHaXU1SFBtYWZUZUhBSG9jaWtqcEZOVmxpUjNHdVhoNVFL?=
 =?utf-8?B?OTNnRzdkekFrV0ZRQzJ5M2I0Z3QrZk8zd2RZN01Ka3N2U2I4ekQ1dEF6dklO?=
 =?utf-8?B?eStqeVBRV3JjTEkxNlp6eG5lUm5jN3Y4UzFxNVprTFE4cFBkNkdnYWV4dTlF?=
 =?utf-8?B?RVJKQ25BNkk1aS9wdUo0Zkc0anA0c2hjTnRtbndzK01FM09NMUdOKzJ6SFhO?=
 =?utf-8?B?VmhYYVlBUFo0RUkxNVo3UlQvOGhsNmN2QWJNNU9TWjFjYmxYZ1VMbUEyaG43?=
 =?utf-8?B?enRmTFJpWGNZRnpiR1dtT1FHZG1sZHFaRDhsbEVPZHFNdXNTaWhDRmIwQ3o3?=
 =?utf-8?B?bFViWG5EVXRZQnVWbEJZOWQ1TUtJUi95RWdRbVZjWDVSa3ZMdElRRStDV1Y4?=
 =?utf-8?B?dS9GNzdiZlJib3lqZ0p6NnRST05vL080bnBzb3RWVG5lNG1UZ3FPT3E0Z1Jp?=
 =?utf-8?B?cm0wLy9kMFUvalkzN1l1WThNNXd4dFQ1aVd1WlRpejRXY09NWVg4NENjUHlw?=
 =?utf-8?B?cVRiaTVjNHA2bFZKT3BOQWpvVWhMY3orUE12dlhHRDk2UzRwZGhLTHM0eTI0?=
 =?utf-8?B?MDRRMzRabGw0amowb240N0V3aUVpTXlSRVlOTE5ZZ2JWUWdrRkRSR0FhZmxt?=
 =?utf-8?B?aVlUeG9BeWhTODMrMmkwWU5UQjIxSFNKaDdENVpXNFdWK2R1ZitaV2ErNHJR?=
 =?utf-8?Q?+AwM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f0c941-3819-4a2b-2e5f-08dc7e5df47c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 15:01:58.1988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndf87bHWmbeoo8fms5x6zL+njUZvOS8UCgdFcagMOPDpMLuvtU5R+J6iY/lLe5ni
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6699
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.05.24 um 20:33 schrieb T.J. Mercier:
> On Wed, May 22, 2024 at 11:14 AM Fedor Pchelkin <pchelkin@ispras.ru> wrote:
>> kthread creation may possibly fail inside race_signal_callback(). In
>> such a case stop the already started threads, put the already taken
>> references to them and return with error code.
>>
>> Found by Linux Verification Center (linuxtesting.org).
>>
>> Fixes: 2989f6451084 ("dma-buf: Add selftests for dma-fence")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
> Reviewed-by: T.J. Mercier <tjmercier@google.com>

Just FYI: I've picked this one up and pushed it to drm-misc-fixes.

Regards,
Christian.

>> ---
>> v2: use kthread_stop_put() to actually put the last reference as
>>      T.J. Mercier noticed;
>>      link to v1: https://lore.kernel.org/lkml/20240522122326.696928-1-pchelkin@ispras.ru/
>>
>>   drivers/dma-buf/st-dma-fence.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
>> index b7c6f7ea9e0c..6a1bfcd0cc21 100644
>> --- a/drivers/dma-buf/st-dma-fence.c
>> +++ b/drivers/dma-buf/st-dma-fence.c
>> @@ -540,6 +540,12 @@ static int race_signal_callback(void *arg)
>>                          t[i].before = pass;
>>                          t[i].task = kthread_run(thread_signal_callback, &t[i],
>>                                                  "dma-fence:%d", i);
>> +                       if (IS_ERR(t[i].task)) {
>> +                               ret = PTR_ERR(t[i].task);
>> +                               while (--i >= 0)
>> +                                       kthread_stop_put(t[i].task);
>> +                               return ret;
>> +                       }
>>                          get_task_struct(t[i].task);
>>                  }
>>
>> --
>> 2.39.2
>>

