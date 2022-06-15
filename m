Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 773FD54C24A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 09:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B0E10E696;
	Wed, 15 Jun 2022 07:00:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C6710E696
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 07:00:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4D/4rjxPGKe+IfoetR1C/6R47kYDBnNaj/IwIq/tx3FEmqp+MXs+R172wRkqrtUjG3U7QW4E9ofWpix6A7GsWqJ3Z3atsDVoEikbXMouGeNlMmDtrEQLYgQ8I/E7BwTCgOTQSD40ciWaQX1FUGOdnANPzgqOptdeSmN9Hdb2Oyo1/YzqfuGhQQHoI8x8SgjFLbCpJlER0+8mwfWsF/RJbPPaoKlGdfu88HdGmfW4LB7q0tGV/+r3gDoMYcITc1x5eaQwJLsMnmdaAK+SNqiiOyTnL6sqNJLLbEggAd49AVLDMdJmqd+iqK0ArWSugPpSGk9yagrHGZcyZEC7Ec5wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9IgKZEFYJ31f1yIu5ygG0XJmSh2/wR3sisa1Gi/LFc=;
 b=UgPeSJcgsuhEuubx8Dl/IZ27+pXwxZoxTmbxQqssK9EbkXxbtRyAafteQYZJN3nP4XTJbf/tAUumJNrT4aQq8MA3ASaSCyKTr1uxJFrpgNShJk7v0khhIeQch+M6NrjYxqFj2yUPjnpBIs1HhTTSUPL7MORwmkwg45EoDA29m5Sqvo6j0ninbqIoBMINGt8125YuvQucMoFIUr1mK/K0HmKXj6+Z7FKw3TiMrtEBjEb4r3/xsEp724RF3tw6Cac2SjaYBNzohlksZhfZQ7XyNnE0HrK6jV6rz8saq+iatz3CoNSIYRn8pBpNGuWNJblJ8G99sCyJWN6D38Xz90sQ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9IgKZEFYJ31f1yIu5ygG0XJmSh2/wR3sisa1Gi/LFc=;
 b=LDwE7FAB6yQ64xzig5IOWa5ia7SewM7pkxpKSUHum6n0kX48NbwBCctUNaJAWjojsxLTbfoPB8LwTlk60fXFR8zMIbg8tqk67kwcZr8UgQHYLTZULY61NVDzMwKmhLjIl89GI5yOr7bglhO1UUA1mt1VfSrw9hKs9IeY1lbv8dY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by DM4PR12MB6255.namprd12.prod.outlook.com (2603:10b6:8:a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Wed, 15 Jun
 2022 07:00:09 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a1ff:438f:aff8:ecd3]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a1ff:438f:aff8:ecd3%5]) with mapi id 15.20.5332.014; Wed, 15 Jun 2022
 07:00:09 +0000
Message-ID: <1e04e766-4a5b-6825-6991-3bd542f562b5@amd.com>
Date: Wed, 15 Jun 2022 09:00:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 3/5] drm/amdgpu: Allow explicit sync for VM ops.
Content-Language: en-US
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
 <ea49dfd3-3c20-c330-3412-5b48481331cd@amd.com>
 <CAP+8YyGgam6Hr40PS_Rc7Dg=S2dLJdce=87=wNt2B0yAyPEPOw@mail.gmail.com>
 <237f28b7-258e-8b6c-f7b3-93f0db9676d3@amd.com>
 <CAP+8YyHnR=eQZMkxn=RpdzYF69y-54ri2pFrTj8DJuRTtwrDaA@mail.gmail.com>
 <7cba4b1d-724a-3c32-2546-015fa069342d@amd.com>
 <CAP+8YyEMDNR_5=uGf8BEV5DCovr-Z_ZDWS2E7-7zqSFGG7bdKg@mail.gmail.com>
 <6c7e8167-fd72-ef7f-c390-8750c61bc411@amd.com>
 <CAP+8YyGRf2XRoaw9aZhwFBryxccYTRrpSLVh8X6WG02zO5ed0A@mail.gmail.com>
 <4d30fb54-be88-7913-74f5-fa998c28f033@amd.com>
 <CAP+8YyFKOM1qztPBNGk4nzsaX7Dq8-cwg0h_GUgz6sUxBZLhEw@mail.gmail.com>
 <98c1ea95-2b1e-36dd-6706-b3667f0f5f47@amd.com>
 <CAP+8YyEWE9KCmo2pGOHMyT3fSEXskTG-tfymwQmmy7d1c9CuRQ@mail.gmail.com>
 <3b6a7d56-6c65-046d-0a51-bbe167e04322@amd.com>
 <CAP+8YyGL_WEME-1_oB_K5_K600c5kcmO0GxXBQGVQEF7aP_D7w@mail.gmail.com>
 <91e843ca-928a-7ab1-12e4-89fbba085403@amd.com>
 <CAP+8YyHqcoxVeropBpeuSRX4kNtVezi1-s3FKSic_Z_OQ8BcAg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAP+8YyHqcoxVeropBpeuSRX4kNtVezi1-s3FKSic_Z_OQ8BcAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8P250CA0006.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::11) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e71f445-2573-4e72-b29b-08da4e9caf3d
X-MS-TrafficTypeDiagnostic: DM4PR12MB6255:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB625582E884D4DA9D9408771D83AD9@DM4PR12MB6255.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RxCIW8qJEr5u1//Dilo5KCBP0KtGF3/vGdi1PHmHWGtPcJfSpcA+UikDMDe0wC+nVxNPsdbn8apxNaMAiLeVvrkY2YjZwQZs6b6rrkEet/WLYndctakWpZmlK2HKa0mvV7cpRCEmbB8pYlGRg4v68Oplag1LF49EHyQ/kFiWIOtGhF43XBDbKviHnx9Ou7QG5Of5wvy9LPMEJO4XrA6Dh5TuO4vcJ4c9eTNJ9njYlZntrNcanJffWTDnxLCntCiVGhq2IIKgcXkURWdj2NPZN6E7CnlSE+9i2OFqbZisk3QwLcZ7wcGI2CWA3qx1yY/PeNNxAWsRDRf0sO77Zik9WgOHaRYCUigunwcMEGdWyu/1J2O8lfuJU2WRwGmgrRifewp/Je5hTZB1GQqQiPg+exeg2nHvXVzI55stIEx+xyWhbIk/CS2f+TRvWO0KUBxfUyqYIQMOpV65wSyHlJI+X00j8SZMh1tGsawht0wjWCKcQROp2VGnQ3+sgS6AEV9TNest561ERcmaROCxZ4fskL391I5RT6RnHftS24ZILZNOeHeVnnt++3rc6iOEOh4HkT/bu22Q6EYAYASnEBiZ2yw09sKunMYdMbXhGavbFAVzXgCLTujoxikuBfKcJoZDk0sGLCtSZeg3aKcd4KlAmMbJIvVYP3gHK10mTsGv0bQc/jOAQibWThiTDJTkyP8kibAKKIAbr+TFNMHFbImcvBkIyK6Eji0QhCdTtKZsem5WnBFkbXeg0vwSsYKcB/5i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(31686004)(2906002)(508600001)(6512007)(316002)(8936002)(8676002)(6916009)(54906003)(4326008)(6666004)(6506007)(26005)(6486002)(966005)(53546011)(5660300002)(36756003)(45080400002)(31696002)(2616005)(66574015)(83380400001)(86362001)(66946007)(66556008)(66476007)(186003)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFY5VjFXVDRrb2NsSDV3dWxMaGlES3FVL0tOcDJGTk5Ibjd5VEFwbGhWWjBt?=
 =?utf-8?B?cWlkYWdVSlFyTUNYTlorQ0lvY3F4NHdSUllEYWR1bnZDcHZ1aS81ZDFvWGpC?=
 =?utf-8?B?c1JZbjN4RzlLanNEMjZDajJsMjFhSHIvdFhyR3VRVFg0b1lIT1JMaHFoY2Z3?=
 =?utf-8?B?MWVXMjMvdVhKWDQ0YkhaeVpHc0RVRjZxZEFBVGJqK3EvMEdBOXU0Vi90OExi?=
 =?utf-8?B?UEgzcG1Fekd6RmpDYlZLSVRrU0FhN3BwbTYzL3M1VHVJL2d6Y09uandIMlR3?=
 =?utf-8?B?eGl4NU5BWk5mR2wrTTNCb2VPT29DTDBWOGtNT3VTcXBXdnJqdkUvUm9ZRVNT?=
 =?utf-8?B?ajlLaEVaTkY5cmNLRStlWHJFMHhLYURqQzZMVkVxZlVzOEd4Nm5oUE14dSsx?=
 =?utf-8?B?NEFGaTEvOUs2dUJ0Zlh6dXh3UFBHZkVMMGpOa0x5dlZSeHVNM3ZzSHZqcEVP?=
 =?utf-8?B?M3B1Z0I2TzNTWlYwYmVDV1pRWkw4QjA2SWdNbG5zWUZZVXRxMDdVWWk0Z1dQ?=
 =?utf-8?B?ODFnZVZpZThOZ0tBSVFqM1B0MHc2bHBRN0wvdWFRRmVwNHJnZzVCeE9nL0Nj?=
 =?utf-8?B?T0hpaE1xL0xxeTZGWjNsK2ZaR2x3ZWVPUzlndlQzMVFhUm9UN0dLcUQvWnhP?=
 =?utf-8?B?Y09Cb3hpUjQvb0d0M3hyekpZMUF0dUJiV0NCQnVpQzJJcHd1eGNrNHFnUDgz?=
 =?utf-8?B?QkNOUEFPbmJZMk9YSTdGSGtQRDdYL2ZNZmRSbENlSmoycGhOUWlZdG5DMWM1?=
 =?utf-8?B?dXpPSjkyL3ZIQkxFZUc4MVlockFOVWg3L1l1VmpCdStqNjZrSDhQMjdaOTht?=
 =?utf-8?B?K2VZWXQrYllueVlicjgrYU5aSkhqemx1bXR0UkxTdnVBbFNBaGFFWU80NFhn?=
 =?utf-8?B?Z01iZHdKQm5yUUlsem1URmxNQWNGM2QrSG9tR0JST01DdXY5K0UrbjZ4LzRI?=
 =?utf-8?B?amxOaXYyODNkclJaaXlXNjZ6bysyK0lkNDZZQ3hkNGFOMFl1OXRsOHZla0RJ?=
 =?utf-8?B?Wm95SFYxZEZsS3pFRktTT1pQKzNHRUREdUhQRUJrOHJJVXBhVjMzbHp4T2Nm?=
 =?utf-8?B?ZWVJT3BERjNiMGlmMzZnMjhra0s1b2hqZ2NMMUdWOVhWd3k2dCtrbjRCREtq?=
 =?utf-8?B?aUlDTWlZdllscGFoZ0paRkJKUzZMaUZreWNPeFhydkdFY3drYmhqTDd6dno2?=
 =?utf-8?B?TVcxN3dJUXBGUmp3Zk5PSnFMN1FFMWFFdXBwd0gzczJ6YkhLelJ1N3M4ajhz?=
 =?utf-8?B?Yko5SEM4M0dZYmtIWkliRkdCV1o4RzlnWEtaRlRIOVRVVVN2ODRQYVU3aHlC?=
 =?utf-8?B?aVJqL3cvZjI3MEwwL3RXOERZaXpOWTlyeE5mS2dZMVQvMDlnczVvOUFFQ1p4?=
 =?utf-8?B?M2pnMDdzN2lSN2o2OWRlNDRWV3VLalhMUXNxWUkxMnNwREdNdWJaL21JVCtm?=
 =?utf-8?B?TDN2dG54by9CeU8rbmJxd2V6Mk03QTRiZEdVL3JwTkJUZ2hPWmxGcnI4dlB1?=
 =?utf-8?B?b2xKYkozMk9nTWdUWGlISUo4S3NETGJnRENrd1pVVzhORzV3UFVURGswcXh4?=
 =?utf-8?B?clIzY1JqUlJZQVlNb1NGbXVxSi9RSXdqUWZmM201emxGMXEzak01SVl5djFP?=
 =?utf-8?B?REd4c00wMzA2SXc2ekg0WXNncHlCN1JLanhibjhHdTF0Uk9TQ0lEOVhDakFD?=
 =?utf-8?B?VDlZQ2pwRTNPYSs1UWNpdVV3VmRUY1kwekxpcy9neVlRTzBvd3pyQ0RWV0hl?=
 =?utf-8?B?SFB2dkQweTFBeithN0llbTZMRjlUSVV5dGFlcmlxck4vVk9KbG5nYmtJVVhY?=
 =?utf-8?B?NXYrSUppU2FVRWIvRlFLemtVU2Y3LzJxSHV0UEw3N1kyaERFaWlQQit2WHo3?=
 =?utf-8?B?N25MSWVqVk04S0pCYWpCY0hrQVRqeGJtcnpoVmdEYlJZOTZ2eVUrM21pQ3p1?=
 =?utf-8?B?bS90UkIrbFl1eEtwNmladGpxSjZ3ZVZNc0VENTZONThUWFh3MGVPc2ZhMG0v?=
 =?utf-8?B?QVFPeTQrU3BxdHdyUVNTdlNDS21SbGNMMnlGaTNwQ1pFNTVHZkgvbGtyU0dG?=
 =?utf-8?B?UW5zZXVUakp5dFE2em92WXdmbEw4bnpkL1R3dlBMSDh3dXBDWm1QQVZOUE1o?=
 =?utf-8?B?V1Fud0ZlcXhzVjgyQXVxRWRFanh3VUVVbkRJWTdrM1lvV1FuQUNzN25la2Fp?=
 =?utf-8?B?TWI3b1lVSDgxcmRJWTdhcWVPUlVqREM3TGlzTmhZUnhMaGVHaGJKVWlEMWlK?=
 =?utf-8?B?TkV6WWNaNFhJK0lTR3hmdE1VOWJlb09UdWlhT1VmOFY4WGFGQlczbURMei9T?=
 =?utf-8?B?R0VtRWhqS1NFUmE1VllTQ1RsOFArM1pJKzFYeUZwajJmTnRyRjhtQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e71f445-2573-4e72-b29b-08da4e9caf3d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 07:00:09.1079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMBdsleAPz+3Wn86Zz5IzeejbjoeNTgG6abE6ERVbieitxYY4Hh5IZdgAhSp2u9G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6255
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.06.22 um 13:00 schrieb Bas Nieuwenhuizen:
> On Mon, Jun 6, 2022 at 12:35 PM Christian König
> <christian.koenig@amd.com> wrote:
>> [SNIP]
>> That part won't work at all and would cause additional synchronization
>> problems.
>>
>> First of all for implicit synced CS we should use READ, not BOOKKEEP.
>> Because BOOKKEEP would incorrectly be ignored by OpenGL importers. I've
>> fixed that this causes memory corruption, but it is still nice to avoid.
> Yes, what I'm saying is that on implicit sync CS submission should add
> READ fences to the dma resv and on explicit sync CS submission should
> add BOOKKEEP fences.

No, exactly that is wrong.

Implicit CS submissions should add WRITE fences.

Explicit CS submissions should add READ fences.

Only VM updates should add BOOKKEEP fences.

>> BOOKKEEP can only be used by VM updates themselves. So that they don't
>> interfere with CS.
> That is the point why we would go BOOKKEEP for explicit sync CS
> submissions, no? Explicit submission shouldn't interfere with any
> other CS submissions. That includes being totally ignored by GL
> importers (if we want to have synchronization there between an
> explicit submission and GL, userspace is expected to use Jason's
> dmabuf fence import/export IOCTLs)

No, that would break existing DMA-buf rules.

Explicit CS submissions are still a dependency for implicit submissions.

>
> Then the second problem is that the VM IOCTL has absolutely no idea what
> the CS IOCTL would be doing. That's why we have added the EXPLICIT sync
> flag on the BO.
> It doesn't need to? We just use a different sync_mode for BOOKKEEP
> fences vs others:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F487887%2F%3Fseries%3D104578%26rev%3D2&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C81db0fea1c854076fc4408da47abafaa%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637901099957139870%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=F72Boaesx83MD2pjGuucA1buawi205XLSsQHg5EH39A%3D&amp;reserved=0

No, exactly that's completely broken.

Regards,
Christian.

>
> (the nice thing about doing it this way is that it is independent of
> the IOCTL, i.e. also works for the delayed mapping changes we trigger
> on CS submit)
>
>> Regards,
>> Christian.
>>
>>>> That should be doable, but then you don't need any of the other changes.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>> #1 Is rather easy to fix, you just need to copy all dma_fences from the
>>>>>> page table dma_resv object over to the BOs dma_resv object in the gem
>>>>>> close handler. E.g. exactly what you suggested with the dma_resv_copy
>>>>>> function.
>>>>>>
>>>>>> #2 is a nightmare.
>>>>>>
>>>>>> We can't move the TLB flush at the end of the unmap operation because on
>>>>>> async TLB flushes are either a bit complicated (double flushes etc..) or
>>>>>> don't even work at all because of hw bugs. So to have a reliable TLB
>>>>>> flush we must make sure that nothing else is ongoing and that means
>>>>>> CS->VM->CS barrier.
>>>>>>
>>>>>> We try very hard to circumvent that already on maps by (for example)
>>>>>> using a completely new VMID for CS after the VM map operation.
>>>>>>
>>>>>> But for the unmap operation we would need some kind special dma_fence
>>>>>> implementation which would not only wait for all existing dma_fence but
>>>>>> also for the one added until the unmap operation is completed. Cause
>>>>>> otherwise our operation we do at #1 would simply not catch all
>>>>>> dma_fences which have access to the memory.
>>>>>>
>>>>>> That's certainly doable, but I think just using the drm_exec stuff I
>>>>>> already came up with is easier.
>>>>>>
>>>>>> When we can grab locks for all the BOs involved amdgpu_vm_clear_freed()
>>>>>> goes away and we can keep track of the unmap operations in the bo_va
>>>>>> structure.
>>>>>>
>>>>>> With that done you can make the explicit sync you noted in the bo_va
>>>>>> structure and implicit sync when the bo_va structure goes away.
>>>>>>
>>>>>> Then the only reason I can see why we would need a CS->VM dependency is
>>>>>> implicit synchronization, and that's what we are trying to avoid here in
>>>>>> the first place.
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>>> To get rid of this barrier you must first fix the part where CS
>>>>>>>> submissions wait for the VM operation to complete, e.g. the necessity of
>>>>>>>> the barrier.
>>>>>>>>
>>>>>>>> I'm working on this for a couple of years now and I'm really running out
>>>>>>>> of idea how to explain this restriction.
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Christian.
>>>>>>>>

