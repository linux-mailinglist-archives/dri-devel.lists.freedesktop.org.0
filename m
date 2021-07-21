Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B33D3D0AF7
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 11:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7853A8982F;
	Wed, 21 Jul 2021 09:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2056.outbound.protection.outlook.com [40.107.96.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DE088D3D;
 Wed, 21 Jul 2021 09:08:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a88/J0GCMYYRFOmFuDKm4CTSAe1fBW6jMoawF9L3UxOFXp7leQSTR5bIZRQDF/MffcyB7KiLkkjvKIxhUPwDaTQmMb9670R237gLl1sq2lJa677+aJeC9Pn+cHISNFcv20pl4j/U8ms46FrDEW7FpgWkplj9aLF+kC3WDJuUg5bYcKuZyUlFP7XGVGS5F5B4rW3HxHHmpE0k2sHaOb1KsPM3ENocHZLoR0hRsJiLxFio6C62tHePNzaRtda6OX38gibw/B/lI3atOirKbi/tRIiP4HKVAhP9DSd8nS5uu7saWddUsmFDH7JxLIp3/WwiB0uTn+3anM0x5t7dZNzyNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+nSU/iLgP2kIXiJmfYukiZcWDN/K7OuPqHVbJOWCHU=;
 b=jol2+0cYwMo/DhH5S6MD1iofnJeAUzdeuNFOiPUSmsouJeQLVcWYB2oXoihFY8BZba6jZDd2S1601RBD1SIcx4x0mndnXGeMJZxgewQg5swjN3HjoUOXQfDpIymopq4bj13s3SfcKZKi4VVteDogcpZLlYENPfJeHFCJN6A6zYsrBVSRYDCZdU8GLmyHSYDEzDuCosj4urEkAUfcDNuqxfjRuWiC3swYmOcTWm270Ufufrx36RD7FViWb/fllurDAIha3tRnXh8X/RauMadPQviOX5VPqtS0wPGusTkb0uNQhL0N5UhWO+OP0fi2BtDpb4XzFoTCndrxPVhFTwXqmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+nSU/iLgP2kIXiJmfYukiZcWDN/K7OuPqHVbJOWCHU=;
 b=xWE4+O8Ykyj3c4PhFKqiJW1XzHAUUMW+ORl7nghZ04khq5Hf4GVOZYKCo8MNr9dvy4TMRXi3IaFb/Bfz+EbhRHtR13ZR+eowa3s4w1fwOUNPgtF2LO7u0lsleBdhPT+snvF8O0duYVGLWitQWJ0VEMshvJA6sTaN0KTQ9C18Rj8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4608.namprd12.prod.outlook.com (2603:10b6:208:fd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Wed, 21 Jul
 2021 09:08:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 09:08:33 +0000
Subject: Re: [Intel-gfx] [PATCH 4/6] drm/ttm: Force re-init if
 ttm_global_init() fails
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210720181357.2760720-1-jason@jlekstrand.net>
 <20210720181357.2760720-5-jason@jlekstrand.net>
 <8c6a14f1-5b42-bca2-ee59-7274667e794c@amd.com>
 <CAKMK7uGjaHes1U+h7-8GTx1rPVBGBJz5dJw7=Nhh5WEUJG1Yqw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <acfefe81-1eae-af52-c045-1d2c1dcb162a@amd.com>
Date: Wed, 21 Jul 2021 11:08:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAKMK7uGjaHes1U+h7-8GTx1rPVBGBJz5dJw7=Nhh5WEUJG1Yqw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR2P264CA0034.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:9bcf:837a:d18c:dc66]
 (2a02:908:1252:fb60:9bcf:837a:d18c:dc66) by
 PR2P264CA0034.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Wed, 21 Jul 2021 09:08:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 816ab24a-1dcd-46ee-9c1a-08d94c271d94
X-MS-TrafficTypeDiagnostic: MN2PR12MB4608:
X-Microsoft-Antispam-PRVS: <MN2PR12MB460860CDD0AF613AF608F94083E39@MN2PR12MB4608.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sNIsOMAQD4X/c3IbpJMvuhzqwV/pxJqhtYhP7G6RZXXFXfb1z6njjIKGRaVZ8jf8FV4qYhatqCtRCRDI82PU8TMDrepS9+tOPCPBgD5/GqbmTlN9IDTPqMhQr28aooFySPYzZjB43KH3tCYE6OZhBUYZN8SFB0aGXPc21RacqR6q5aRGjH1J5U5SMNLlpEhuQXvTHUlzilJlEzgaAnNKvST4M/yMfdSKSVGpOYPPIStsEfU0QWdPEMxMbUz8NQliKhFHb0PbFhXAPL6DefpJctadaoaGWQMOpE3JOhwnrv/tQi2scGkhdmDltapFAWSmkObEykpAsqPV2XrocJ2hBsMbPelzippgH0Ag/IhiyCtblNcXyQHqHShW2aIhyvaVpF0+4cEKqDeCWdbn2h4RREXXVMRbUs0pLUeTR933hjZzCwKVsUjB8FcsxTG96RzqlDviAlpiFYub3XTDQrCQl7F8lGpFPlQ5j7DWg95u844wgkqUhm/N5hSW+phUDpKsUZ96foGJvCQLs6c+CX+1stePOCpr4abd/vuKXKlQV58lf6w2JN5yosIId7QwwWrcabkrN7zgSPOKUrgMpKxLvZEg2efi064vyg2EBZFTQ97qdAlzs4OPUhLWvt6nizKk7sdN2YIbE5a5tQNP3K37vHVJbsKpFCRmWCrWuLVe6+L8exBEcZpfvAQtejEGQR5O8ZIJwihnH0BKBr5DTyh/QxB3ulpzaYjKwuUwOjQRLxLoy/wTV2JRHmuCQvkVhJug
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(186003)(66946007)(8936002)(6916009)(6666004)(66476007)(5660300002)(6486002)(2906002)(8676002)(508600001)(66574015)(86362001)(53546011)(36756003)(31696002)(66556008)(54906003)(966005)(45080400002)(2616005)(38100700002)(31686004)(83380400001)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUdHOTI5ajdiNGwvMTRKY1pVQk50Q3MvZDRvTm5KWTB5b3BHN1AxbVZiWmcx?=
 =?utf-8?B?Z1pFWXVuOUtBZlVMQ0pUMUNLVnloSFFNbHhjUk5GditTQ0FaTUxqaFZkM3VS?=
 =?utf-8?B?WGNrUWFVM3J3ci9ub0JUOW51NlpCRDRPYjRpMGZxekpoQ1kxNjJkT1hvdW8w?=
 =?utf-8?B?Y09HNzlvQ0Jzb3NoNmdVc1ZKcnhnMlk1TGVtdDd5S0VURUlsNndrdTQ5amli?=
 =?utf-8?B?VEZSSlBFQjMrS1JpWkZVVWk0Vk1xaEdrV3RjNWQ2MjZFRWRPTmovVlM0eUp2?=
 =?utf-8?B?NUc1QWpoeGVHSHVWNlFGN09zd29GT0NYbHQyQWN5UUFiaTBFWFNiRjFFbXg3?=
 =?utf-8?B?REg3T1cySjZ2WjRzejkvNTBnZERFTjBHS2Z3UE11czR4Y2FRUmFSV1JQdVpy?=
 =?utf-8?B?b2NPS0tSQU0vTHpzMk96eWV2eW50QWlKS084Nk5uT0Y2eU9GYktMcFhrUnFx?=
 =?utf-8?B?WEt1VDZzZmZEMW9POTgxSFNibWdrWWExelR2dGxaY2xCQmZSSmZEd053Q01a?=
 =?utf-8?B?V2o4Vjc2dXhSME5PbFJjMDYwZ1Q3UHU2L0RvSzRUcFpYcjVjQ2VFcVZ3bWVh?=
 =?utf-8?B?bjYyeFVRUWhUNXQ1Y3Jya3ZZQi9EV3FXcFBlbkxtc0JUQjRpOUI3bCtKT1ZK?=
 =?utf-8?B?aFR4aVFMS2F6VmlVQkxSMVVDM1h4UllONU81NmVtdUh6R0hlaXo3ZHRTajN6?=
 =?utf-8?B?bVRVdUNhU041SDYvdnhZSS9Fb0UvU3NxTlBjRW90RXVHNkhQdTdGTXN0dDBN?=
 =?utf-8?B?eXZHMDdmdEFxd0ZCRHBvbHozVTNtb2NhNFNMQ0Jaem9uMDhIT0tpbTRmTWFu?=
 =?utf-8?B?TktWQkRXV0pGU2RBanVZY1huV2VLclBOQjRQMDhRcHpaWUp1d29sZFFxTXJ3?=
 =?utf-8?B?WjB3ZFFLZXc1QmRBV29PUzJFOEl2ekJsYm0wRkY2Nk1FcWFHTUZTckZIeW9X?=
 =?utf-8?B?L1A1aXdqL2NKYXhaSXBjSkhTbkdwMjJTZnJNVTRRd1k2VTFzSml0T0tvamlJ?=
 =?utf-8?B?dmhvNHE5ZEZEcmJsV3Y3QW80TUt1cEgxVUJuUjhPeUFvM3oyVVR0Z21TQmNw?=
 =?utf-8?B?b0t5c1d1RDZuZE9QUHBScXFzTHhuYkJsem1Gd2dJQU9PR1VmckZielBOL1pV?=
 =?utf-8?B?MERLQVRWa3ZrVjJqWmJJMUhyUGNqOVVFTUtzeDZsNCt1NURSM0h1MXFaUmVP?=
 =?utf-8?B?V052aC82TGplUloyZ3hxajVQaFdlbnAxZDNhSFNOQ1NyenpVL1dKcWJ2aFNK?=
 =?utf-8?B?aW1JUE03ckZGQW8yMnR6MERSTFlpZzJqanV0YXZZK2xkb1dyTzk1V1Y2R01C?=
 =?utf-8?B?WGZkK3cwalhFRUJ4ZnEwY2Nuakl1K3MzSU5tL25yVU90MUUyWlFnNWtiUVV1?=
 =?utf-8?B?cHFTSEI1ZEZyemtkUis3TGJaa2tBbVhETzFPSjBVcDB3cnhEdkNBVzlreDdS?=
 =?utf-8?B?RUQ2ZzY3eWVkZ2RsbFd0WlNldHRzUjVKSndDU2FkSkc1VEtjWFk4UnRDNEs1?=
 =?utf-8?B?RU1PMnVWZkl5dldnc3d6b2pZL1l4SDRiUnY0SlgxODQ5cHVMdFo4NmxJOG1v?=
 =?utf-8?B?QWNYNDZWb1RqdjFQb29XTWx1cGhpbzlIN3FwdnBpZDlXd0kveFdveWJkNFlp?=
 =?utf-8?B?WlJ2YlJKZzBLNm5OUU14b1FwN2s4Rmxya1JYSVpPb3puMURPdUZudVlDcElj?=
 =?utf-8?B?Znc2STQ1U2ZFeTBjSDZIU3dNLzVDU2RRYkp5em4zU0FEMnhhSkRpTWlzNXJ6?=
 =?utf-8?B?M0F6aEREV0hQWUJyVmR0MjF5Q0hHcUNaM0c2eGpHOEpjN2lZWU45T0dMcUxW?=
 =?utf-8?B?MTZVOTRmZGplbkZWai9PaVJLR2NBOEFRRVBRRVFKSHIvRnR0VUUrcXIrM1pI?=
 =?utf-8?Q?plsfEKRLVOQTv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 816ab24a-1dcd-46ee-9c1a-08d94c271d94
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 09:08:33.4919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xY7zTvIIG3o4s/wKdxAxEcq51CglxBDGoRfY8dA36U7JSl6dhx018U70rtIoTQyJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4608
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.07.21 um 11:06 schrieb Daniel Vetter:
> On Wed, Jul 21, 2021 at 8:36 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 20.07.21 um 20:13 schrieb Jason Ekstrand:
>>> If we have a failure, decrement the reference count so that the next
>>> call to ttm_global_init() will actually do something instead of assume
>>> everything is all set up.
>>>
>>> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
>>> Fixes: 62b53b37e4b1 ("drm/ttm: use a static ttm_bo_global instance")
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>> I've just pushed this to drm-misc-fixes.
> Did you see patch 5/6 here which is also touching ttm?

Nope, neither with my AMD nor with my GMail account.

Looks like something is wrong with the distribution of mails over the 
mailing list for a few days now.

Going to double check patchwork.

Christian.

> -Daniel
>
>> Thanks,
>> Christian.
>>
>>> ---
>>>    drivers/gpu/drm/ttm/ttm_device.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
>>> index 5f31acec3ad76..519deea8e39b7 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>>> @@ -100,6 +100,8 @@ static int ttm_global_init(void)
>>>        debugfs_create_atomic_t("buffer_objects", 0444, ttm_debugfs_root,
>>>                                &glob->bo_count);
>>>    out:
>>> +     if (ret)
>>> +             --ttm_glob_use_count;
>>>        mutex_unlock(&ttm_global_mutex);
>>>        return ret;
>>>    }
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fintel-gfx&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C05ff233273a54b987b6b08d94c26d0ac%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637624551867495341%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=70RYQ49Q58VED5jMpJ%2FW9Vy5imUndghFS0tQWIeD7dk%3D&amp;reserved=0
>
>

