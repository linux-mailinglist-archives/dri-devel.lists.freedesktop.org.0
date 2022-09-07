Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CDD5B008B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 11:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F8210E490;
	Wed,  7 Sep 2022 09:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45EC10E46D;
 Wed,  7 Sep 2022 09:33:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8EV7ncfSXYvXVxD9lJyTc0YzraBsQawu863jmksjI1PsbsWY/qmpCjITblRtVTikK3X5fBhX64Hjc1hocSXbh1zkZUzT1Oeu3z099M4etUW1cAs98sefDFAiwfFGMQkuoqLX5DLoIMh5kfyG0SYVnu8mxVi/KohbZWoapsB6OfNV0/VKZ5Wbr2VPmS4lAvLDVTLfDtTt6s7ggVC7rGfkklXB6yQrepkHogItMDopFv30oK25Smgokt83u4HgsNlSJ319lZp9n/QH8CdA/D5aaK0ZD48ZigcahYwtoyvZh1lVumfqY4bcaH8NKcstoiM3uMcHXKufNXtkj+2/IGBKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUSjiDmLZPimtb3h6oBOOiWhaaRBxo2AJB/k05dMs3k=;
 b=AlfPpER0K6bCR/Uu9Qw2d0Wymxe7ljdkn6eHC3Sug3m6ofAayx95L3AjJstuogzv/MVkR/b9rAWDvpm+JLytOWSQFPJ9gX88I0iRz5utKscdkvjKYb5NEi1XXRW+OSWsTPFEa6k/XjV4yD4h+VBF+asLd02/KNyQO4xQPeng9YvDdmTjmGPOPpWPTVPfhWhE7n+5nJVdxCE9RZD5dY8PmgbOkFvG2qol+G0H05Aw7qm9MG7EwWhlxpKJyTI41cS1z4imO1nwJO15DiJTmeCV99GVccPAkYRKk5LWzWKRvrSG3KLqVWNivmPJMq/+2ivnmXg4BRhdfp2Faswe8IVL9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUSjiDmLZPimtb3h6oBOOiWhaaRBxo2AJB/k05dMs3k=;
 b=aqigchWoGcEw4CQfXNh+Tsm6BNOdYnxRvz9/STfLXvnDTdW1YnM2s2dMbvwplNsLfq6OrF7eehAERitkclgXAeyAWc/6vhi6MgjDd1/+ZU/V0xmWvRVPiHx6x/MxD2QEeN0L9QMCdRNUwzwrvEMLYcO1NwWUf1kJo0uUVLq24gc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by PH0PR12MB5631.namprd12.prod.outlook.com (2603:10b6:510:144::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 09:33:55 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a997:c7f:aea0:764a]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a997:c7f:aea0:764a%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 09:33:55 +0000
Message-ID: <257f7896-13b3-299c-c847-998e6bf90968@amd.com>
Date: Wed, 7 Sep 2022 11:33:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] drm/ttm: update bulk move object of ghost BO
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20220906084619.2545456-1-zhenguo.yin@amd.com>
 <47d80b9c-8ef2-80da-2df8-4c7083907f66@amd.com>
 <CAM0jSHP1nEN_+iEMDm5gx0xNikDkPX5x0csCFdyPSws2CQ=95A@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAM0jSHP1nEN_+iEMDm5gx0xNikDkPX5x0csCFdyPSws2CQ=95A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::17) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e70291be-0529-4e8e-8c3a-08da90b4151b
X-MS-TrafficTypeDiagnostic: PH0PR12MB5631:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BfR1iSu3xsGW/i8pHWFM1IiG6TiT12TDbjfnvRvTVXaE51V0EFYxj+5A4xQY5u678/Bqjpw5duLSPIL6vElzgmNgxxUlZy9JVnWl/V2UTjcYUdQvFhmEgxKwy79eP1LVFYwjFRGuumMKDT6vv4saxlZHaX1RvC455+3cfgDe2QWNGg41jM2421Dt089vFFZU8PbuGCzx4mCL0Nqa7u6RhLE15bB3W2mgN+sbxTXCTnHXmuQxQZ904v4ZcA1qJb5K5udU6YeAv/EtJfaWm9mywqnpX6lO4HWevzBt4QFtnd1qsRrlFH2oZC3yD5/8hB+vmUle/deRnxdN6/S0/smpPS83GfC0YcVStOWJ7nmj08pvK09UXKXiwr1AgPZtwLR2H5VlizJWzwKxccH4Gzk8PzZ+tOmgtPhKO82etMIWHdXSPL6M+gxdPlOxFQ0RpzVEfHNx6A25hgjEymB3FSquwKxPYWIRqJPuJXW2WTfU0g4evOiBEIUl7l6UV7TDwI6E91WJJ1OS2d0ZwbjtGtVDEiVgnHVeOdSnOh5fT0/sOls+v/x11T8lt8GBiYNbqXfB4oecUg2FoEJis58u+HIBc6AVGJAzh5FlHM+4UjizGCUdnSYf3UID5SIyh/gwOaD9507QtTl/8Po2VesolNa+ZG2+L2WIMe9GRPWAhqaqg1pgJQEzDr2jMoDGUqmyoECcEOCXI5FHHoARv44M11EXeYSVQwPvNFWZGbU0Lw/YXYIoognrZdY2D0JVa/loo0zy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(36756003)(6916009)(54906003)(31686004)(316002)(2906002)(38100700002)(26005)(83380400001)(45080400002)(6512007)(31696002)(66946007)(66556008)(66476007)(8676002)(4326008)(186003)(478600001)(6506007)(66574015)(86362001)(966005)(6486002)(6666004)(5660300002)(8936002)(2616005)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUh5a1lYY1M3d3JKRTBBRXA5RkVLQjNxRkorM0RPTnJwNXNORkN2c21TSkFN?=
 =?utf-8?B?UW1oWXZ4ZWIvempXaStyNHZiTWUxWG9DZ1d4cDU4VlA0Vzh6N3o2MjJFdXhj?=
 =?utf-8?B?V3VIZnVFZWZzUlgxVzF5VzBPeU1XZHJWMmhhalBDQWhKMkl5WjZCQ1BhQ1VQ?=
 =?utf-8?B?cDNaTlNrOXlzSEhYTlB6c25pZFV0Q3BDY0pYMjJEZXpZdkFUWk9hUEpLOUhv?=
 =?utf-8?B?dnNvSllBUERveWcyeTZvUC9TZXBmU0Rkd3U5bGhxMDdwTzJhNkh6b085QVdH?=
 =?utf-8?B?blh6cTU2WndVZGxMWitlYktoZnllamFrOUdLcTNrSG5hRU53NEJucVdCK0lv?=
 =?utf-8?B?bGw2NDVGbWx5VHBSYTRtUTh3VjB5ODVsSXdmMU9NTGdpb0lZakppV0ZuT0pE?=
 =?utf-8?B?ZFY0aVZaQ29zSHNBUElMcEZ1YVV6WmR2clVwdG1BYU1QQ2xnblhhUXRwNnFH?=
 =?utf-8?B?d2JZQ3ZSMjRkUE05NXd5MzFDVVNRRXJ2cjE4cHpEd3NOSy9uQ0wyQzVxRGxx?=
 =?utf-8?B?Qms2NnVBaVJ0a3ZjTmtzVXViZzdmNjlsZHNxMTY5UFoxcjhMckF3SWM1OHln?=
 =?utf-8?B?STJ0aXh1SVBJdUkzS3RZdnRCK000L2tDNEh6cG8zOEx6WXVZV0xOaHpjZS92?=
 =?utf-8?B?d3NyK094ZStYZU9LNnBBeWFjRndVNUVoL0RQOGI4OWJ6dUF2MW5TZFhWMUpn?=
 =?utf-8?B?dmNkWEs2OVJjaG9iR05KSXBncURkN053VU9ML2hiZEdTNS9xUHdnYUUyY29R?=
 =?utf-8?B?a1lVWGRTV3BzOExuMHN1M2l2TE1VeGh4R01QR0tLVW44bkF1ZlYySGlJNlBx?=
 =?utf-8?B?STg4ZzBCSUJRU0htU3A4SXpEY2huSVQzOTlSRktTLzZBaEtUS3BlNkNHRTZp?=
 =?utf-8?B?OHJmZmdzMktNSVZVYVRBU0JDaVRGenZqeHAxK1NsMUdmUW1MSG1oZHRNeVVl?=
 =?utf-8?B?U2l3UktqOHl5djhxb0VaUmNHOFVqZEt0enJIZUdkeGkrbFYvWWJyYzNyd3FY?=
 =?utf-8?B?cVRodkF0TG5jMmp5eDNFWHl1V3lBSG1NVENSWUlCZEw2WGxZNGFnK3A5VUZw?=
 =?utf-8?B?dVhhc0xTNTdlWjYySWgxMDZqbTVsVjBqMzBUMUY2Q0RiWEplZURzSmExOFAv?=
 =?utf-8?B?NG1WaVV3MmJnTVAvcUxOVmNhVDgvZmxuQTYrN3BlOWVUUjV6RlVRMmNvUlBF?=
 =?utf-8?B?Tko1TnZFSUtXcTkxYnZUMm1QUDl0TitOa0RPMTgxd3FjQXlaaHFHazE5a2V0?=
 =?utf-8?B?c3V4V2pSNlhZRUR6bTNadmdmczljN2hYSUVFNVFqQ0pLSmpxZERmN2lsRjdF?=
 =?utf-8?B?cjAxZitQcVhNWjFodEw2MENzcElDRmp4eG1qc2Zzekx3YjQwcmwrZ2xTRGs3?=
 =?utf-8?B?eHpyakZScnFmUmNCaHplRFk0UG9MeW1zc2orUURLT0svQXpCdjNWTG84MWFa?=
 =?utf-8?B?WnY3N0diZEt4K01hR3RRTG91Q1lVbkRCenZHaWthbDAxUk9hSXEybEhkNWNs?=
 =?utf-8?B?YTdxYkpPcDQ0RFQ3YnJleXB3K1NsNDRXRkRiZEY1SmdSSzA3dHQrcno2Ymo3?=
 =?utf-8?B?U0VSS3o2WGV4cy9pWUVFL0QzM0RETXRsRk9XK25oVzFRNlIwMHM1ZTdUM3Qz?=
 =?utf-8?B?czBtY0o3dEt2bzd2djlVb0ZOK3VGSWJYNGhJN0F0b1MzK0p5bmZpeFg2UHBt?=
 =?utf-8?B?bkhSckpydytQdE9UWGlXR3ZvZ21qbXhVdzZNMzJLQlpiZzVIbUtmVFJsR0lq?=
 =?utf-8?B?V3dPQ01xb2hIaEFjN2U4bmZOaTlnK0lPaU04U1JFQTUzb1B2NW9lVFFVNklp?=
 =?utf-8?B?bGhOQk9heE42ZWIxN043QnBiNGREam53eUNmbHdsYWM0WkdjcVdhOXdRUkRQ?=
 =?utf-8?B?MnBiN3hpZjI0UDBQdlM1NnZQbEdodGxGV1dncGp1OGU4SVZ4aFZ1QkVwbmJK?=
 =?utf-8?B?a2R4d3k1VWtWK0s4aGc5ek4xOU93NVZDbTVSaFBmV1g2NjQrcExoKzZoZ0t6?=
 =?utf-8?B?dy85dWFTc1EzSGttRklHVFI5RE00OW9JalozZ3MyaVJpQXhEcVlPb0s5Wk1W?=
 =?utf-8?B?YlpwMEZhdXJDb1ZEWjNrZ0ZMR3JTbUpUYzRnSzdRL1E1VzNHQ1h0Y0VRci9S?=
 =?utf-8?Q?eqG7yRE9hWlj3JR6Ph8rp8Uo7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e70291be-0529-4e8e-8c3a-08da90b4151b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 09:33:55.1954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NYhO4qh4NvrzngMH4DOyK87X1v3S9umrD2IIT4zSXEBxJ/rHgm84Wr3nwLo/A2Al
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5631
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
Cc: ZhenGuo Yin <zhenguo.yin@amd.com>, jingwen.chen2@amd.com,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.09.22 um 11:21 schrieb Matthew Auld:
> On Tue, 6 Sept 2022 at 09:54, Christian König <christian.koenig@amd.com> wrote:
>> Am 06.09.22 um 10:46 schrieb ZhenGuo Yin:
>>> [Why]
>>> Ghost BO is released with non-empty bulk move object. There is a
>>> warning trace:
>>> WARNING: CPU: 19 PID: 1582 at ttm/ttm_bo.c:366 ttm_bo_release+0x2e1/0x2f0 [amdttm]
>>> Call Trace:
>>>     amddma_resv_reserve_fences+0x10d/0x1f0 [amdkcl]
>>>     amdttm_bo_put+0x28/0x30 [amdttm]
>>>     amdttm_bo_move_accel_cleanup+0x126/0x200 [amdttm]
>>>     amdgpu_bo_move+0x1a8/0x770 [amdgpu]
>>>     ttm_bo_handle_move_mem+0xb0/0x140 [amdttm]
>>>     amdttm_bo_validate+0xbf/0x100 [amdttm]
>>>
>>> [How]
>>> The resource of ghost BO should be moved to LRU directly, instead of
>>> using bulk move. The bulk move object of ghost BO should set to NULL
>>> before function ttm_bo_move_to_lru_tail_unlocked.
>>>
>>> v2: set bulk move to NULL manually if no resource associated with ghost BO
>>>
>>> Fixed: 5b951e487fd6bf5f ("drm/ttm: fix bulk move handling v2")
>>> Signed-off-by: ZhenGuo Yin <zhenguo.yin@amd.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Going to push that to drm-misc-fixes in a minute.
>>
>> Thanks,
>> Christian.
>>
>>> ---
>>>    drivers/gpu/drm/ttm/ttm_bo_util.c | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> index 1cbfb00c1d65..57a27847206f 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> @@ -239,6 +239,9 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
>>>        if (fbo->base.resource) {
>>>                ttm_resource_set_bo(fbo->base.resource, &fbo->base);
>>>                bo->resource = NULL;
>>> +             ttm_bo_set_bulk_move(&fbo->base, NULL);
> This appears to blow up quite badly in i915. See here for an example trace:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Fintel%2F-%2Fissues%2F6744&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C2020e04c603d4641d05308da90b25e1a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637981393013966600%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=iY%2FNdAihQFpOhgP0gcLCpYtStUd1XS%2BPP46DFVPQhSk%3D&amp;reserved=0
>
> Do you know if amdgpu is also hitting this, or is this somehow i915 specific?

At least a quick test on amdgpu worked fine, but that was without 
lockdep enabled.

I think I see the problem. The move of the resource and removal of the 
bulk_move must come after the dma_resv_trylock() or otherwise the 
dma_resv object isn't locked.

Going to provide a patch.

Christian.

>
>>> +     } else {
>>> +             fbo->base.bulk_move = NULL;
>>>        }
>>>
>>>        dma_resv_init(&fbo->base.base._resv);

