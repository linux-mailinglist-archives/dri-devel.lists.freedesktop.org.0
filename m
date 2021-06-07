Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF4C39DF00
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 16:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470E06E8EA;
	Mon,  7 Jun 2021 14:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8676E8EA
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 14:43:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAVu+dS2mldvsUGhFMTGc9G0oNhxslWNQMrpIdwJTT+dWcMx4BZTve5mnkhc9wUH5ykE4c23VInJ77NQqMyx9mg9kL6zpyiad3xQiUw/HYUUS0X3G9Mme/02WmwqgYRMw12Co1ChBaMiaFPJ8feIul7YXAb7AlZP0R+jSZSG4Khqu3O+4JFdJOk021JbelBe+AyOR28gsCXJ+x03HhOUpA0Foqb+uXQ//v/+zzUHZRYX/Xu7NXtGcu2Bw7882S2gAr2jRxMwHx+4TyfQY/Ic7YLBODetsxjsNOZff2pzA8d6OGlM99sZiNscBJmniYIlp1U78rMuoU9m3AqeTbFeMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncgXow0zqE1tPUnkz0N6BJwbiFhT2k+Wb5IbPMfAKr0=;
 b=RyPBODqyEvW5LUW4DzAoNdO1OC4Sh5L6iS6h9cXoI59FHICU/fLNx2SDC7YH/OQPxHxK0n5fn+qOIpXbBgP6TCekzGgs3vhr9ONIaS2ZXAUFIpeUUKFbzBRY3ceas2b92LsZxvrxhwGOCiSqGkiPgncATw5FOxb/osHqCBG5coAPmNjGYrOVOV2/6huoWJa46j44vM2vkETRqAAGVYUUx852T2XrX0+FlcLQm3HMZRmY15aqZOe74DfLmARP2i+504nXIiOaVEsm4meI2RiYY+Ij55TJrB9bu83ciZWvwDr74hFW1Kv36Ti5i0CWENvE2+t6GAOzmbUsNNZ6I2Te2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncgXow0zqE1tPUnkz0N6BJwbiFhT2k+Wb5IbPMfAKr0=;
 b=KvCw6RclUhem76ZQGWB/nXvXQq1G888ML3CQ7JSk7Mfzg8btn/IaXYCjxN8kuyI8DIZNVAHqlaHKaczD+xeaLQx6XZt30Vl6DjjZnso3guRBu3piSRM5BoaghOth1IcXQWijUe6KhalUXAIIo26mlSbcqcPj8H2Ezx/44hlkx50=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM4PR12MB5069.namprd12.prod.outlook.com (2603:10b6:5:388::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Mon, 7 Jun
 2021 14:43:02 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa%6]) with mapi id 15.20.4173.037; Mon, 7 Jun 2021
 14:43:02 +0000
Subject: Re: [PATCH 1/4] drm/ttm: add TTM_PL_FLAG_TEMPORARY flag v3
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20210601122528.1643-1-christian.koenig@amd.com>
 <0051cab9-8d65-d28f-956e-3a60718bf000@gmail.com>
 <0fc2844d-b954-2386-17e3-e2c4232fc247@shipmail.org>
 <f067ec3f-ae6c-fb9d-d87b-e31311bf3cf3@gmail.com>
 <DM6PR12MB4250A90CF8058DD28AB1B04FFB389@DM6PR12MB4250.namprd12.prod.outlook.com>
 <1a18dab0-45ee-3406-05f6-fe3ae3b2d136@gmail.com>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
Message-ID: <73ffb605-3d7c-3493-38e3-a0dac7914ccd@amd.com>
Date: Mon, 7 Jun 2021 16:42:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <1a18dab0-45ee-3406-05f6-fe3ae3b2d136@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------FA69BAF9134480781940F146"
Content-Language: en-US
X-Originating-IP: [2003:c5:8f23:f000:35b7:4019:acfe:19dd]
X-ClientProxiedBy: PR3P189CA0063.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::8) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f23:f000:35b7:4019:acfe:19dd]
 (2003:c5:8f23:f000:35b7:4019:acfe:19dd) by
 PR3P189CA0063.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.20 via Frontend Transport; Mon, 7 Jun 2021 14:43:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fecc585c-5d76-4034-70a0-08d929c28d48
X-MS-TrafficTypeDiagnostic: DM4PR12MB5069:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB5069048305C80BA9895AF4F88B389@DM4PR12MB5069.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hOSLpUln/mx53ci3RzKuPYshEztRgAKAT7v28dprRHRIGxdC2idgcNXHTEA8q8LPVJdrnnfytIf+rCV2Xd5REBp6/463g+jB9FK8uirAD+FdImpuvqGc+CCvSFS3rMNiIeok9ZoECOM0/exI1IGocmZv2t7nwQvCn4PMWjRltb/by/6jsmf4rnw2xp2HkZ6C/KOSqnchuiZaJbpKgI2GeVNO8k1MFVEPXTaj/d6T8NRnlZ2+1UpiUnl+3RivyB9DPjFfPhxcyt7nGDo8VbyyNf6gEllKiUX11W+ZJWsbYA6Au2V6wsVQVmY69+F4Zazids5AE78pZrGfJGYZAh4uCYhQRKhcIRumSM3FBh3FEs2pdCbg6hlbwabO6pQCLLKovpUMHuovCogjdgN7P/vKGQeBv5s7tZ+V3o2uNOqN/U/gVry4yIE8tQWbaDLJhyxL86p82Dj9W6bNIKLIdkveXMs+K3nf4ebPf0OPFpOoEq3NyFeOaB9lWhqdCFBvatezUrgiMM4Agema5uQWk2M7/0tkxaLTwGzpL02/X1mP4VFPYTVJLpiwR3kCOIVDeP2PpRTo3QcIwIGCs+J2mSmMdgzke5BrJKPElkPXeXqKzSmV4i3hQkV99jiMX2nqrdIDem0KiKVpSsRGD73jjC0VuCKImKSiigVCdXgz8P7ZrbUaPm0Wjoj5rcWxW5p2kyI2PBF0da8BSa8mubV276GAVqmFmrJPkfsIYQESqqLyBdThnAaXD+Km72Ziuk3F4DBsqkvTGDljtqan3MctMb5Y1NMdrilkuif8ZC3gfKKCNbCNv6oTGYB9aGdQi1We4uPT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(31696002)(66556008)(66476007)(5660300002)(38100700002)(66574015)(8676002)(52116002)(53546011)(166002)(2616005)(36756003)(66946007)(8936002)(54906003)(186003)(16526019)(6916009)(86362001)(6666004)(316002)(478600001)(6486002)(4326008)(83380400001)(45080400002)(31686004)(33964004)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N0tLWEdsOHZhdTlyRmMwaWU0YlV3ZU9oZ3B6N0pVYjVQVUhyRHg4NEZONFNU?=
 =?utf-8?B?VlkvN2VKak1LNks0K01nb3pMcmo4ZDlvL0JoVk41TlVTZUp0Q1hFeFBYZGxi?=
 =?utf-8?B?RGt1aEZ3VCthQUFJOFhDVDVRcGliaXU1SXdYTVJubWJXbWRNR3NzWVU2UHo0?=
 =?utf-8?B?OHBrYldLZXB4T051ZVBYaElJMVdxSDhtUFQ5d1VnemlWR0syV1BaemcrY1ZB?=
 =?utf-8?B?aFc2cGp6dXhLc2dNdzYzRUlkTExRWXBvNGFkWGZqeG80VW5aTlllU2x5YWp2?=
 =?utf-8?B?MnlENzRxaTJxN0dXVTMyZmZOaVRhWGJmaHcrR0V2OWttMllLL1ZRMGpWcmdh?=
 =?utf-8?B?eUU3YUlrc0phVzZvY1A5TnlaZEJKMFo2V3RYOE00dFRJZXpiTEpJZ1VVejZy?=
 =?utf-8?B?ZG8rb1F2dGRkT1hmMGxpdGJTc3VsRE5LUUJNdkkwT0I3MFdXd1JkeGh3Yjhj?=
 =?utf-8?B?cG4ydmRFRy94RnBKT0RSOE5iaDZtQ3FVbEF5YlNTTytid0JMRXBuRzl2c1Fi?=
 =?utf-8?B?dXlrVWdRcTBWU1RzNEc5YnNBYnY2M1c5cnRYejRQYUZhdVdPM1YzTEt4SGpK?=
 =?utf-8?B?RG1wcy95bXhsdDNHRDhKelhlM1cxMDlYQTc4U2toQmhPeWs4NFA4VW5zNFN6?=
 =?utf-8?B?QnRPQmtsd1BEOUYycFNqa01YajJDbkMvTUVDVGFzM2k0dHpiSjd4R2hrT24w?=
 =?utf-8?B?VWNLQUdTTXRyTnY2Y1R3WmhFc1g1SjQybU04cVhaVjVnREExaGlkNWxQWldE?=
 =?utf-8?B?bzlxaUNBMTZ4WVVlTXhFd2dOVlJ4VTF0cTRvUk1Vb05CWXJjRXRKSGV5eDky?=
 =?utf-8?B?dUh3ZG5zRDg2eG1GQWNJR2xYZ0Vqd2tEWnltRlZOelEzU21rM21iZkttSHU5?=
 =?utf-8?B?RkgrR0c1aEltY0JlRDhMS3Jmb3RWMDFxUGloOEZoOVRldjVLNk50OThOeENS?=
 =?utf-8?B?T0FOUVpyeHlOaWF1ejB4YXM4bkpVVkwxcG5GcStJSldqa3ZDMW4zakd3WGtL?=
 =?utf-8?B?SXdNL1F0d2dvejBPSGgvNW85a2hyeVg0b0poU1FsVWtGeG9ubGQ2bUx5RHRm?=
 =?utf-8?B?SGVFT3Z0WEs1Njd2VlpxVnZHTktsYVZub0N3amE3OUJONVlJWTdvR3F6eld3?=
 =?utf-8?B?YjFEVUR6bjVVbEhJNmdoai9TdG4zaWFkL2lyaGlPUDNIODZybkZ6alZjMnRH?=
 =?utf-8?B?NFM1UGJKRGcrQzdyZzJkWjlVTUczUm96Y05vY2lDdFVQRUVTdHloOXI4ZmRE?=
 =?utf-8?B?K3h0aWwyMExtMHlra1lOZlowdVNJamc2WWxJMkVwdGRxZ3VGVWJNYm13YlFy?=
 =?utf-8?B?TFZxSnBhRk1ycGZwaFQ5cy8rYzZrcmJ2Z1FjSUVxUmhDZEo1OUFoZVpOSDZp?=
 =?utf-8?B?RjVLdHppc1B1R3B0a1BBLzkzUHAwZjZaa2J3NmRXaHFHUnkrcytEdHNKY3VG?=
 =?utf-8?B?MmJrRlFQNHJYM1FOLzMxaVhmUEtFcmhKcEdxejVrYk5IYzJWVDZaSlU3Qmpr?=
 =?utf-8?B?ZjBlYUNiTU1pUXJESHpjamxmVHB0K2VWWlNsbFIwcmZUUGtRdElmZzBxalcw?=
 =?utf-8?B?YjRSaFJwSXA0dk1YQ2pRNGpCMkdReUpadXA4TGpmNzAwZFpMamk1TW9BMmJw?=
 =?utf-8?B?VjRQZzV4QStYVnJKdEx0VXZZQzZQOWZ4Z2dXNVFlbmF0dmpwMnRkOU9QemtD?=
 =?utf-8?B?Uit5L3pNMWlUK0hvU296RHFpY2hZdVJDYzhmakNaK1FoMkJOamgwdi9UOS94?=
 =?utf-8?B?QkExSjR5QlNGaENjSlRHUXk4blU2OHQ1d2Z2UHhVa0dNR1JPUW5ZRXdvdi9B?=
 =?utf-8?B?aE84ckxJcndOSlhJUGtNa2VLcHJwdVZmbHNpMFZVTjA3LzdIMmR5STlOKzg5?=
 =?utf-8?Q?QGFJllXDSSz0s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fecc585c-5d76-4034-70a0-08d929c28d48
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 14:43:02.2714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: npXvJZPME8DAg1i2TgCP9AIR3sJMFXUp/KhjsXlj0vjM4WSFfVADI4hPOr3qqt5/ObA1H5MoNiq21BDj3Fzb2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5069
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
Cc: "Yu, Lang" <Lang.Yu@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------FA69BAF9134480781940F146
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/7/2021 3:01 PM, Christian König wrote:
> Hi Nirmoy,
>
> can you give that patch set a testing round and an review?


Sure! I will get back asap.

>
> The memory stress test with low VRAM on APUs should be sufficient and 
> you should have that setup still around.
>
> Thanks in advance,
> Christian.
>
> Am 07.06.21 um 14:58 schrieb Yu, Lang:
>>
>> [AMD Official Use Only]
>>
>>
>> Thanks，please let Nirmoy do it.
>>
>> Regards，
>> Lang
>>
>> 获取 Outlook for iOS 
>> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Faka.ms%2Fo0ukef&data=04%7C01%7Cnirmoy.das%40amd.com%7Ca1e4256424cb46841b6b08d929b45120%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637586676695741160%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=m6t3vxIQ%2BgRQJvI27G9gHtR2XN7Hoyg6WXkG6uDRTbc%3D&reserved=0>
>> ------------------------------------------------------------------------
>> *发件人:* Christian König <ckoenig.leichtzumerken@gmail.com>
>> *发送时间:* Monday, June 7, 2021 8:41:49 PM
>> *收件人:* Thomas Hellström (Intel) <thomas_os@shipmail.org>; Yu, Lang 
>> <Lang.Yu@amd.com>
>> *抄送:* dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
>> *主题:* Re: [PATCH 1/4] drm/ttm: add TTM_PL_FLAG_TEMPORARY flag v3
>> Thanks!
>>
>> Lang can anybody from your team give as an reviewed-by/test-by on the
>> amdgpu patches? I just want another pair of eyes looking over it.
>>
>> If nobody else has time I will ask Nirmoy for a quick testing round.
>>
>> Thanks,
>> Christian.
>>
>> Am 07.06.21 um 14:38 schrieb Thomas Hellström (Intel):
>> > Sure. LGTM,
>> >
>> > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> >
>> >
>> > On 6/7/21 2:36 PM, Christian König wrote:
>> >> Thomas any comments on this?
>> >>
>> >> Is the purpose of this now clear enough?
>> >>
>> >> Thanks,
>> >> Christian.
>> >>
>> >> Am 01.06.21 um 14:25 schrieb Christian König:
>> >>> From: Lang Yu <Lang.Yu@amd.com>
>> >>>
>> >>> Sometimes drivers need to use bounce buffers to evict BOs. While
>> >>> those reside
>> >>> in some domain they are not necessarily suitable for CS.
>> >>>
>> >>> Add a flag so that drivers can note that a bounce buffers needs to be
>> >>> reallocated during validation.
>> >>>
>> >>> v2: add detailed comments
>> >>> v3 (chk): merge commits and rework commit message
>> >>>
>> >>> Suggested-by: Christian König <christian.koenig@amd.com>
>> >>> Signed-off-by: Lang Yu <Lang.Yu@amd.com>
>> >>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> >>> ---
>> >>>   drivers/gpu/drm/ttm/ttm_bo.c    | 3 +++
>> >>>   include/drm/ttm/ttm_placement.h | 7 +++++--
>> >>>   2 files changed, 8 insertions(+), 2 deletions(-)
>> >>>
>> >>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>> >>> b/drivers/gpu/drm/ttm/ttm_bo.c
>> >>> index 51a94fd63bd7..6b393502198e 100644
>> >>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> >>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> >>> @@ -929,6 +929,9 @@ static bool ttm_bo_places_compat(const struct
>> >>> ttm_place *places,
>> >>>   {
>> >>>       unsigned i;
>> >>>   +    if (mem->placement & TTM_PL_FLAG_TEMPORARY)
>> >>> +        return false;
>> >>> +
>> >>>       for (i = 0; i < num_placement; i++) {
>> >>>           const struct ttm_place *heap = &places[i];
>> >>>   diff --git a/include/drm/ttm/ttm_placement.h
>> >>> b/include/drm/ttm/ttm_placement.h
>> >>> index aa6ba4d0cf78..8995c9e4ec1b 100644
>> >>> --- a/include/drm/ttm/ttm_placement.h
>> >>> +++ b/include/drm/ttm/ttm_placement.h
>> >>> @@ -47,8 +47,11 @@
>> >>>    * top of the memory area, instead of the bottom.
>> >>>    */
>> >>>   -#define TTM_PL_FLAG_CONTIGUOUS  (1 << 19)
>> >>> -#define TTM_PL_FLAG_TOPDOWN     (1 << 22)
>> >>> +#define TTM_PL_FLAG_CONTIGUOUS  (1 << 0)
>> >>> +#define TTM_PL_FLAG_TOPDOWN     (1 << 1)
>> >>> +
>> >>> +/* For multihop handling */
>> >>> +#define TTM_PL_FLAG_TEMPORARY   (1 << 2)
>> >>>     /**
>> >>>    * struct ttm_place
>>
>

--------------FA69BAF9134480781940F146
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/7/2021 3:01 PM, Christian König
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1a18dab0-45ee-3406-05f6-fe3ae3b2d136@gmail.com">
      
      Hi Nirmoy,<br>
      <br>
      can you give that patch set a testing round and an review?<br>
    </blockquote>
    <p><br>
    </p>
    <p>Sure! I will get back asap.<br>
    </p>
    <blockquote type="cite" cite="mid:1a18dab0-45ee-3406-05f6-fe3ae3b2d136@gmail.com"> <br>
      The memory stress test with low VRAM on APUs should be sufficient
      and you should have that setup still around.<br>
      <br>
      Thanks in advance,<br>
      Christian.<br>
      <br>
      <div class="moz-cite-prefix">Am 07.06.21 um 14:58 schrieb Yu,
        Lang:<br>
      </div>
      <blockquote type="cite" cite="mid:DM6PR12MB4250A90CF8058DD28AB1B04FFB389@DM6PR12MB4250.namprd12.prod.outlook.com">
        <p style="font-family:Arial;font-size:10pt;color:#0000FF;margin:15pt;" align="Left"> [AMD Official Use Only]<br>
        </p>
        <br>
        <div>
          <div>
            <div>
              <div dir="ltr" data-ogsc="" style="">
                <div dir="ltr" data-ogsc="" style="">Thanks，please let
                  Nirmoy do it.</div>
                <div dir="ltr" data-ogsc="" style=""><br>
                </div>
                <div dir="ltr" data-ogsc="" style="">Regards，</div>
                <div dir="ltr" data-ogsc="" style="">Lang</div>
              </div>
            </div>
            <div><br>
            </div>
            <div class="ms-outlook-ios-signature">获取 <a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Faka.ms%2Fo0ukef&amp;data=04%7C01%7Cnirmoy.das%40amd.com%7Ca1e4256424cb46841b6b08d929b45120%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637586676695741160%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=m6t3vxIQ%2BgRQJvI27G9gHtR2XN7Hoyg6WXkG6uDRTbc%3D&amp;reserved=0" originalsrc="https://aka.ms/o0ukef" shash="NtQScSwIWajamqc7I6IHWphrs5M2aIiLUExk3aZwUyoxz6cn3GwfxryjZIBzzEeEOqs2zSeEGa5GGW3+pRMlgEszsGnIo6ZUFxREORjRek556hywVyP2s0LZxeSNvtwYyNxPqqa71R5pA43iDs+3xyQKbGOV6F3MpCLwN//EjSs=" moz-do-not-send="true">Outlook for iOS</a></div>
          </div>
          <hr style="display:inline-block;width:98%" tabindex="-1">
          <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri, sans-serif" color="#000000"><b>发件人:</b>
              Christian König <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com" moz-do-not-send="true">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a><br>
              <b>发送时间:</b> Monday, June 7, 2021 8:41:49 PM<br>
              <b>收件人:</b> Thomas Hellström (Intel) <a class="moz-txt-link-rfc2396E" href="mailto:thomas_os@shipmail.org" moz-do-not-send="true">&lt;thomas_os@shipmail.org&gt;</a>;
              Yu, Lang <a class="moz-txt-link-rfc2396E" href="mailto:Lang.Yu@amd.com" moz-do-not-send="true">&lt;Lang.Yu@amd.com&gt;</a><br>
              <b>抄送:</b> <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org" moz-do-not-send="true">dri-devel@lists.freedesktop.org</a>
              <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org" moz-do-not-send="true">&lt;dri-devel@lists.freedesktop.org&gt;</a><br>
              <b>主题:</b> Re: [PATCH 1/4] drm/ttm: add
              TTM_PL_FLAG_TEMPORARY flag v3</font>
            <div>&nbsp;</div>
          </div>
          <div class="BodyFragment"><font size="2"><span style="font-size:11pt;">
                <div class="PlainText">Thanks!<br>
                  <br>
                  Lang can anybody from your team give as an
                  reviewed-by/test-by on the <br>
                  amdgpu patches? I just want another pair of eyes
                  looking over it.<br>
                  <br>
                  If nobody else has time I will ask Nirmoy for a quick
                  testing round.<br>
                  <br>
                  Thanks,<br>
                  Christian.<br>
                  <br>
                  Am 07.06.21 um 14:38 schrieb Thomas Hellström (Intel):<br>
                  &gt; Sure. LGTM,<br>
                  &gt;<br>
                  &gt; Reviewed-by: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com" moz-do-not-send="true">&lt;thomas.hellstrom@linux.intel.com&gt;</a><br>
                  &gt;<br>
                  &gt;<br>
                  &gt; On 6/7/21 2:36 PM, Christian König wrote:<br>
                  &gt;&gt; Thomas any comments on this?<br>
                  &gt;&gt;<br>
                  &gt;&gt; Is the purpose of this now clear enough?<br>
                  &gt;&gt;<br>
                  &gt;&gt; Thanks,<br>
                  &gt;&gt; Christian.<br>
                  &gt;&gt;<br>
                  &gt;&gt; Am 01.06.21 um 14:25 schrieb Christian König:<br>
                  &gt;&gt;&gt; From: Lang Yu <a class="moz-txt-link-rfc2396E" href="mailto:Lang.Yu@amd.com" moz-do-not-send="true">&lt;Lang.Yu@amd.com&gt;</a><br>
                  &gt;&gt;&gt;<br>
                  &gt;&gt;&gt; Sometimes drivers need to use bounce
                  buffers to evict BOs. While <br>
                  &gt;&gt;&gt; those reside<br>
                  &gt;&gt;&gt; in some domain they are not necessarily
                  suitable for CS.<br>
                  &gt;&gt;&gt;<br>
                  &gt;&gt;&gt; Add a flag so that drivers can note that
                  a bounce buffers needs to be<br>
                  &gt;&gt;&gt; reallocated during validation.<br>
                  &gt;&gt;&gt;<br>
                  &gt;&gt;&gt; v2: add detailed comments<br>
                  &gt;&gt;&gt; v3 (chk): merge commits and rework commit
                  message<br>
                  &gt;&gt;&gt;<br>
                  &gt;&gt;&gt; Suggested-by: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com" moz-do-not-send="true">&lt;christian.koenig@amd.com&gt;</a><br>
                  &gt;&gt;&gt; Signed-off-by: Lang Yu <a class="moz-txt-link-rfc2396E" href="mailto:Lang.Yu@amd.com" moz-do-not-send="true">&lt;Lang.Yu@amd.com&gt;</a><br>
                  &gt;&gt;&gt; Signed-off-by: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com" moz-do-not-send="true">&lt;christian.koenig@amd.com&gt;</a><br>
                  &gt;&gt;&gt; ---<br>
                  &gt;&gt;&gt; &nbsp; drivers/gpu/drm/ttm/ttm_bo.c&nbsp;&nbsp;&nbsp; | 3 +++<br>
                  &gt;&gt;&gt; &nbsp; include/drm/ttm/ttm_placement.h | 7
                  +++++--<br>
                  &gt;&gt;&gt; &nbsp; 2 files changed, 8 insertions(+), 2
                  deletions(-)<br>
                  &gt;&gt;&gt;<br>
                  &gt;&gt;&gt; diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
                  <br>
                  &gt;&gt;&gt; b/drivers/gpu/drm/ttm/ttm_bo.c<br>
                  &gt;&gt;&gt; index 51a94fd63bd7..6b393502198e 100644<br>
                  &gt;&gt;&gt; --- a/drivers/gpu/drm/ttm/ttm_bo.c<br>
                  &gt;&gt;&gt; +++ b/drivers/gpu/drm/ttm/ttm_bo.c<br>
                  &gt;&gt;&gt; @@ -929,6 +929,9 @@ static bool
                  ttm_bo_places_compat(const struct <br>
                  &gt;&gt;&gt; ttm_place *places,<br>
                  &gt;&gt;&gt; &nbsp; {<br>
                  &gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned i;<br>
                  &gt;&gt;&gt; &nbsp; +&nbsp;&nbsp;&nbsp; if (mem-&gt;placement &amp;
                  TTM_PL_FLAG_TEMPORARY)<br>
                  &gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
                  &gt;&gt;&gt; +<br>
                  &gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; num_placement;
                  i++) {<br>
                  &gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct ttm_place *heap =
                  &amp;places[i];<br>
                  &gt;&gt;&gt; &nbsp; diff --git
                  a/include/drm/ttm/ttm_placement.h <br>
                  &gt;&gt;&gt; b/include/drm/ttm/ttm_placement.h<br>
                  &gt;&gt;&gt; index aa6ba4d0cf78..8995c9e4ec1b 100644<br>
                  &gt;&gt;&gt; --- a/include/drm/ttm/ttm_placement.h<br>
                  &gt;&gt;&gt; +++ b/include/drm/ttm/ttm_placement.h<br>
                  &gt;&gt;&gt; @@ -47,8 +47,11 @@<br>
                  &gt;&gt;&gt; &nbsp;&nbsp; * top of the memory area, instead of
                  the bottom.<br>
                  &gt;&gt;&gt; &nbsp;&nbsp; */<br>
                  &gt;&gt;&gt; &nbsp; -#define TTM_PL_FLAG_CONTIGUOUS&nbsp; (1
                  &lt;&lt; 19)<br>
                  &gt;&gt;&gt; -#define TTM_PL_FLAG_TOPDOWN&nbsp;&nbsp;&nbsp;&nbsp; (1
                  &lt;&lt; 22)<br>
                  &gt;&gt;&gt; +#define TTM_PL_FLAG_CONTIGUOUS&nbsp; (1
                  &lt;&lt; 0)<br>
                  &gt;&gt;&gt; +#define TTM_PL_FLAG_TOPDOWN&nbsp;&nbsp;&nbsp;&nbsp; (1
                  &lt;&lt; 1)<br>
                  &gt;&gt;&gt; +<br>
                  &gt;&gt;&gt; +/* For multihop handling */<br>
                  &gt;&gt;&gt; +#define TTM_PL_FLAG_TEMPORARY&nbsp;&nbsp; (1
                  &lt;&lt; 2)<br>
                  &gt;&gt;&gt; &nbsp; &nbsp; /**<br>
                  &gt;&gt;&gt; &nbsp;&nbsp; * struct ttm_place<br>
                  <br>
                </div>
              </span></font></div>
        </div>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------FA69BAF9134480781940F146--
