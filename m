Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C72CA38C597
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 13:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB966F61D;
	Fri, 21 May 2021 11:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957416F617;
 Fri, 21 May 2021 11:22:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSQnzYISezkHY121qjjFUTWJ9sZX1mwsc48TXGWZI8kTe+EzRl3/Nmt4g9NzsjVodJ/s9veB1VW+1ffMVhu7E/rAtmxTTLgJz6koFQzBB6QSat0xovQgDFLpb9u2pkk3e+yjZHqJ3gLwfjNZAWQgYsnoirlpcUrTJvcfNrzE9/z0LOUBbcYEPMfMfqan07TkLRaBN6TIHNTyH8SOp9Za4wCDXLfppxdHA5fuc7brqYvB9haz7s49Kgn4Ojqg6G6uYg8238fxpcTAFCOLwoCnXB82aoEa2K3CpTxoPHIQYCZwhQgROHY12clENeJP7qQVpFCM8Lu9LvpHqNYG5SSCfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8Jy6J+wihDOLZ/IirmfVXKhN6a6gxADqLYuNkNIqus=;
 b=evMkjdGioh47zqVr1VhzJXBZicm0odVpOPIXO+w5fDyxof3geLE0aeXTivk80GG6/P1R/x7uQox9FReo/GBvk7n6vIOrT5MozHVFB7ZNcxUqEZfStqBc8dslcjDYo+/1nd6FenFwxEbbAuHre0wGovltgYr9ubFFmrFs4zRDfpSHWf2634ok/x0YxPQsjWB7CtWZMFLR/ILx5qeY+NO0/Lz0IaIQwM4LgLqIJtQkG0TtcD9bcmTDWhJdyU+ocGMPAu7G7LEoPW11Pl6o0KWxg3a705cowGgenslCXMdjJnnDWGG4dAT66yI7cjTh+2UMEllBL0F6wlnppxB3whQQ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8Jy6J+wihDOLZ/IirmfVXKhN6a6gxADqLYuNkNIqus=;
 b=Upk2SCK0HQI8LMVWtLMMIMbwmw9jCZG3OHIwSTBHJPRqPnZuPeUoA4NpoAScuU2A8iA008hVdw2uNFfBuwQV7+Xt881I97QWHwPejVdZ0tx69iedn9QLCMIcxmrAhLtR166OIiiDm4fEiHacQG5JVS0RktR1VwrXXEBwWDFg+3Y=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4639.namprd12.prod.outlook.com (2603:10b6:208:a4::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Fri, 21 May
 2021 11:22:40 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.023; Fri, 21 May 2021
 11:22:40 +0000
Subject: Re: [PATCH 01/11] drm/amdgpu: Comply with implicit fencing rules
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <70ca7b86-c5ac-79ad-89dd-03108e9936ed@amd.com>
Date: Fri, 21 May 2021 13:22:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d]
X-ClientProxiedBy: PR0P264CA0149.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d]
 (2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d) by
 PR0P264CA0149.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Fri, 21 May 2021 11:22:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eec01190-a22b-41fb-a35e-08d91c4abe20
X-MS-TrafficTypeDiagnostic: MN2PR12MB4639:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB463954A072F37E63D05F37DA83299@MN2PR12MB4639.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EU0Mvd8gcC1hqlS9Ic8mTR/ebdNpUUCmc/ceR4EU1sl9HNQhBvC28tI3JX9HOqnDoKIQrC0QJ0h6oXPikLkxjbeimwciCY4Z5u7c7BAMCLQ0SzVklZDJ/cL+ZebPotok2efOLq2OaA32qpUP92yYqg022QjFu205CmUCr7Fkcdi7O3v7zF9xQBawAylHXCBSPWznOmqFyPY8p3aOi6x0wP/ybeCLLPXIp53yzk3/JuWf/MLrro6Mkjdmfsi3LOroctgtBLQ7dhjT/Bokuq0NzKA+dIxn2TOzvZ61XFhQVIvn0ha08sy7U8yIzDkU0TaQB7d/uqd4alpOWy2pTPsCwnxMPikuKgNdEJ50MbLlTRtneji99ruVX4oL5sEn18mItFdex5piCunoDJ6r+duvQe1a2PE+X7GDd+EOYHIGD4ioDHI5XvD4j3ySNRaUcHbiYikMT/eYYYE7ffL5ZpzdAh9kXAxQclL1jt3UUx7VgF3vVX53cD0vyiPZX0myi/qOmiC0+KAoLmxOuSfbhhznpL2Q+50EsTE9FLHc/riiR1Z8EWFE65Hh4lktXAwLGvDu+7K315IY6NDq7/fb6mga43++Xtk2uV9YU0nbBnUH1lG5UZ9Gie+udnUvBmS9DwOSeFUhztJv+1A2swaNVZNWRPdAurgazCSwUSZ4x5Mgw6UlwoB8tgP9aG7AVzyQxxuMapmiUk9G2KXbyeqSZa0rmRLWIVkIZcMgjGOFSMIsHF0w0NZI7SOc9BjAO37gZvLvt9ISlyfKdUCqwl3l2Wo0ebluN3CyutLBmstt/xm3wlkygaJj+fY4vnF+xHyzbn8k/aaZ11htNIjH67y77gDRkaD1pUjWjNqcFNIvc/JKY0k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(36756003)(966005)(66574015)(31696002)(478600001)(83380400001)(8676002)(6486002)(186003)(54906003)(31686004)(316002)(6666004)(45080400002)(110136005)(16526019)(4326008)(2616005)(2906002)(86362001)(66556008)(66476007)(66946007)(5660300002)(7416002)(38100700002)(52116002)(30864003)(8936002)(21314003)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YU42cEFMVERBeHJxN3RNTXc5ejJlZ3R5eWNkV2xWL2xwK1krdHJBcGxPRmI2?=
 =?utf-8?B?VjBvdnlMdGtGQzYrNmFPQ0tkNkpKd25tYUloQVdueFc4R0x6ekd1Vnp3VzM5?=
 =?utf-8?B?TmtMdExjUGVHTG1TekhlSm0wSU80OCtsSUN3L08xcWQ2TytYc21DNTJtWFlj?=
 =?utf-8?B?RVc2L1JBdmxKSGNPN01oSEtkTmhHRUhrY29IN25KeUJSSHVZcGExMFFsT0Zv?=
 =?utf-8?B?cFlxdGxKUVU5U3ZoRTB0QVNrSDRidjJLQ0RvOWtTSmE2RzhKUjNqajRvd0tT?=
 =?utf-8?B?TXhsL2s2bjY2bXoyWkcxcE02b3EzeTZHRXNVNnAvRW8wL2wyVndLaHJGR1dO?=
 =?utf-8?B?RG1iWUVOMzdQclNBb3BJL2cwcG9KUlhJOGJVd1AwS1p0VVNkMzR0VWw1R0F4?=
 =?utf-8?B?K05jbWdURmlxUktVNitZVGhOQUZmT3RuRG1xVGEza3ZDWHhnMDlUbFdIc01o?=
 =?utf-8?B?dFM2SUxlamQ0cWRZcU40TmM4cnRNOHpQUS9MVVhxM0VXcjdHZXlVOGFpOWZw?=
 =?utf-8?B?Q3BNcXdHWFpzR3U4VlY4cjVWTUs4WkZwSzk4eERJaFgwL0RrL1VMbVQzd2I2?=
 =?utf-8?B?L0ZmMkhhM1p3VjRpWTlyR2ZwMHF5SDFyaUJxa0cxM0lYdXNEUVdaMHV4cTl5?=
 =?utf-8?B?aEI0NzN2OWYwYWZCVnhQalN0Mk9wcHNKMjIwUnVsMzhPTjFGZEk1R01hVmRs?=
 =?utf-8?B?Qy9vNng0ckRUNTJIdythbERZQm56eDc1UUpsZEJnTXBGR3lzbE9Da1dDaHNL?=
 =?utf-8?B?TUJEVlBwVVNNMm9QQUVNcXY0RWRYYnlYYTVFRHpGY3pQeURGYVErOWZ6WHRm?=
 =?utf-8?B?R0NlN296SDU4VzdCcWp1dVQ3K0w0aWFNaFFrT2ZSVGVwUGxuNXpteEJHMW9z?=
 =?utf-8?B?M3FoQ01YTnhYODkrYzNVZlNvbUx2Y0Z5TlFTUVVqK0ljRUFKUnRWcThOVlQ1?=
 =?utf-8?B?TG02MXFESzlwaEU2cUdNek9LQWpNQzVMRGt2Z2pKeWszbTdYaEJ0YXN1UnR2?=
 =?utf-8?B?WlZFbEZmVlg2T1NYdFZ5dHRmd2psc3djYTVScDFPRi9KU1hQeUp4REtzWGxK?=
 =?utf-8?B?ZUtxNnpiYTdTQ2U5dXE1VkY0dlRkUGpqcFc5UjZTUG55UVM3Mjh1eURLbmh6?=
 =?utf-8?B?bmJNdStQNUZUUzRkUkljVEU3d3lSYXp4OU5hdzU0dU5TMEtqTk1hd1o5OTRP?=
 =?utf-8?B?VzNpcVlFNm1MN0M0a2hWY3VBZEc3Z1NSN2c1cDBQaHV6QUJTbTVEeXl6WDVW?=
 =?utf-8?B?RjZ4WXRYL3UzajhpU0NMZy9pbnlSN3NrUlFzSTF1YmZzMnQ5aWIvTENicnVw?=
 =?utf-8?B?SE1kc0NaSmdER3pORVE2UTJ4VzVWWDhWNmlOTmYzbXptK3pJWG43WFY4eXRq?=
 =?utf-8?B?OVN3eGlZZW1ZSUpWek93bW9ucHpIUmUxVEVwcWpiVVZkL3MxaHo4cnRRdnRu?=
 =?utf-8?B?MTl4b0dUQm1WRktFaGVFbGZrYndrVUt0enJJM3Roc3JXL3JrZVRQdUVybVJD?=
 =?utf-8?B?NDZhdWJWZngyWVdMNlJmanJqTkNvaTg3WWdIMHpyMWZ0dFJ0OWdKR3BCOENk?=
 =?utf-8?B?ZzhMQVRBdUNGd0ZhREFFanVwSmc2WTdKUW53MndDbVVCOWJhSjBLbTFHb2Y1?=
 =?utf-8?B?NktCRmVEdDhFRE04WkFodkw2ZWNsQlVRenVidEs4eDFrUnhEaUVpY2orOVpi?=
 =?utf-8?B?dFZWR0QvNlJrNXJBdlRjOS80ZHVUR2RNOWt5djVwQWVSQWhFajBONEI3dnRk?=
 =?utf-8?B?ZEIwTzhiaGpjZnIwckNUOG8wQ3ROVjNKaG56UXl2bzJYZno0KythMUdtaGZO?=
 =?utf-8?B?UkpLMmQvQ3doWDkraU8zY1NBbVBFV0J3U0w0cTV4WVovQXpYeW8yRjc5VXdZ?=
 =?utf-8?Q?tR6kLPkqZDfPQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eec01190-a22b-41fb-a35e-08d91c4abe20
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 11:22:40.1168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ILnqkm3IMF1Nsku2/R2uR9pGzf/aFdethhEz+3p5uPVq3wCdPbkcGjmM82LeYl5w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4639
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>, linaro-mm-sig@lists.linaro.org,
 Luben Tuikov <luben.tuikov@amd.com>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Chen Li <chenli@uniontech.com>, Alex Deucher <alexander.deucher@amd.com>,
 mesa-dev@lists.freedesktop.org,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Dennis Li <Dennis.Li@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.05.21 um 11:09 schrieb Daniel Vetter:
> Docs for struct dma_resv are fairly clear:
>
> "A reservation object can have attached one exclusive fence (normally
> associated with write operations) or N shared fences (read
> operations)."
>
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdri.freedesktop.org%2Fdocs%2Fdrm%2Fdriver-api%2Fdma-buf.html%23reservation-objects&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C2cdb7d8e82de40fd452e08d91c383a13%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637571850083203679%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Y5zO4aMKMuQwTCKVk6DrjTIbbRBLrcklrZgNCzNGXGs%3D&amp;reserved=0
>
> Furthermore a review across all of upstream.
>
> First of render drivers and how they set implicit fences:
>
> - nouveau follows this contract, see in validate_fini_no_ticket()
>
> 			nouveau_bo_fence(nvbo, fence, !!b->write_domains);
>
>    and that last boolean controls whether the exclusive or shared fence
>    slot is used.
>
> - radeon follows this contract by setting
>
> 		p->relocs[i].tv.num_shared = !r->write_domain;
>
>    in radeon_cs_parser_relocs(), which ensures that the call to
>    ttm_eu_fence_buffer_objects() in radeon_cs_parser_fini() will do the
>    right thing.
>
> - vmwgfx seems to follow this contract with the shotgun approach of
>    always setting ttm_val_buf->num_shared = 0, which means
>    ttm_eu_fence_buffer_objects() will only use the exclusive slot.
>
> - etnaviv follows this contract, as can be trivially seen by looking
>    at submit_attach_object_fences()
>
> - i915 is a bit a convoluted maze with multiple paths leading to
>    i915_vma_move_to_active(). Which sets the exclusive flag if
>    EXEC_OBJECT_WRITE is set. This can either come as a buffer flag for
>    softpin mode, or through the write_domain when using relocations. It
>    follows this contract.
>
> - lima follows this contract, see lima_gem_submit() which sets the
>    exclusive fence when the LIMA_SUBMIT_BO_WRITE flag is set for that
>    bo
>
> - msm follows this contract, see msm_gpu_submit() which sets the
>    exclusive flag when the MSM_SUBMIT_BO_WRITE is set for that buffer
>
> - panfrost follows this contract with the shotgun approach of just
>    always setting the exclusive fence, see
>    panfrost_attach_object_fences(). Benefits of a single engine I guess
>
> - v3d follows this contract with the same shotgun approach in
>    v3d_attach_fences_and_unlock_reservation(), but it has at least an
>    XXX comment that maybe this should be improved
>
> - v4c uses the same shotgun approach of always setting an exclusive
>    fence, see vc4_update_bo_seqnos()
>
> - vgem also follows this contract, see vgem_fence_attach_ioctl() and
>    the VGEM_FENCE_WRITE. This is used in some igts to validate prime
>    sharing with i915.ko without the need of a 2nd gpu
>
> - vritio follows this contract again with the shotgun approach of
>    always setting an exclusive fence, see virtio_gpu_array_add_fence()
>
> This covers the setting of the exclusive fences when writing.
>
> Synchronizing against the exclusive fence is a lot more tricky, and I
> only spot checked a few:
>
> - i915 does it, with the optional EXEC_OBJECT_ASYNC to skip all
>    implicit dependencies (which is used by vulkan)
>
> - etnaviv does this. Implicit dependencies are collected in
>    submit_fence_sync(), again with an opt-out flag
>    ETNA_SUBMIT_NO_IMPLICIT. These are then picked up in
>    etnaviv_sched_dependency which is the
>    drm_sched_backend_ops->dependency callback.
>
> - v4c seems to not do much here, maybe gets away with it by not having
>    a scheduler and only a single engine. Since all newer broadcom chips than
>    the OG vc4 use v3d for rendering, which follows this contract, the
>    impact of this issue is fairly small.
>
> - v3d does this using the drm_gem_fence_array_add_implicit() helper,
>    which then it's drm_sched_backend_ops->dependency callback
>    v3d_job_dependency() picks up.
>
> - panfrost is nice here and tracks the implicit fences in
>    panfrost_job->implicit_fences, which again the
>    drm_sched_backend_ops->dependency callback panfrost_job_dependency()
>    picks up. It is mildly questionable though since it only picks up
>    exclusive fences in panfrost_acquire_object_fences(), but not buggy
>    in practice because it also always sets the exclusive fence. It
>    should pick up both sets of fences, just in case there's ever going
>    to be a 2nd gpu in a SoC with a mali gpu. Or maybe a mali SoC with a
>    pcie port and a real gpu, which might actually happen eventually. A
>    bug, but easy to fix. Should probably use the
>    drm_gem_fence_array_add_implicit() helper.
>
> - lima is nice an easy, uses drm_gem_fence_array_add_implicit() and
>    the same schema as v3d.
>
> - msm is mildly entertaining. It also supports MSM_SUBMIT_NO_IMPLICIT,
>    but because it doesn't use the drm/scheduler it handles fences from
>    the wrong context with a synchronous dma_fence_wait. See
>    submit_fence_sync() leading to msm_gem_sync_object(). Investing into
>    a scheduler might be a good idea.
>
> - all the remaining drivers are ttm based, where I hope they do
>    appropriately obey implicit fences already. I didn't do the full
>    audit there because a) not follow the contract would confuse ttm
>    quite well and b) reading non-standard scheduler and submit code
>    which isn't based on drm/scheduler is a pain.
>
> Onwards to the display side.
>
> - Any driver using the drm_gem_plane_helper_prepare_fb() helper will
>    correctly. Overwhelmingly most drivers get this right, except a few
>    totally dont. I'll follow up with a patch to make this the default
>    and avoid a bunch of bugs.
>
> - I didn't audit the ttm drivers, but given that dma_resv started
>    there I hope they get this right.
>
> In conclusion this IS the contract, both as documented and
> overwhelmingly implemented, specically as implemented by all render
> drivers except amdgpu.
>
> Amdgpu tried to fix this already in
>
> commit 049aca4363d8af87cab8d53de5401602db3b9999
> Author: Christian König <christian.koenig@amd.com>
> Date:   Wed Sep 19 16:54:35 2018 +0200
>
>      drm/amdgpu: fix using shared fence for exported BOs v2
>
> but this fix falls short on a number of areas:
>
> - It's racy, by the time the buffer is shared it might be too late. To
>    make sure there's definitely never a problem we need to set the
>    fences correctly for any buffer that's potentially exportable.
>
> - It's breaking uapi, dma-buf fds support poll() and differentitiate
>    between, which was introduced in
>
> 	commit 9b495a5887994a6d74d5c261d012083a92b94738
> 	Author: Maarten Lankhorst <maarten.lankhorst@canonical.com>
> 	Date:   Tue Jul 1 12:57:43 2014 +0200
>
> 	    dma-buf: add poll support, v3
>
> - Christian König wants to nack new uapi building further on this
>    dma_resv contract because it breaks amdgpu, quoting
>
>    "Yeah, and that is exactly the reason why I will NAK this uAPI change.
>
>    "This doesn't works for amdgpu at all for the reasons outlined above."
>
>    https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2Ff2eb6751-2f82-9b23-f57e-548de5b729de%40gmail.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C2cdb7d8e82de40fd452e08d91c383a13%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637571850083203679%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=WkQz%2Bdd61XuEw93JOcKx17SQFpNcyMDvvSBgRA9N0U4%3D&amp;reserved=0
>
>    Rejecting new development because your own driver is broken and
>    violates established cross driver contracts and uapi is really not
>    how upstream works.
>
> Now this patch will have a severe performance impact on anything that
> runs on multiple engines. So we can't just merge it outright, but need
> a bit a plan:
>
> - amdgpu needs a proper uapi for handling implicit fencing. The funny
>    thing is that to do it correctly, implicit fencing must be treated
>    as a very strange IPC mechanism for transporting fences, where both
>    setting the fence and dependency intercepts must be handled
>    explicitly. Current best practices is a per-bo flag to indicate
>    writes, and a per-bo flag to to skip implicit fencing in the CS
>    ioctl as a new chunk.
>
> - Since amdgpu has been shipping with broken behaviour we need an
>    opt-out flag from the butchered implicit fencing model to enable the
>    proper explicit implicit fencing model.
>
> - for kernel memory fences due to bo moves at least the i915 idea is
>    to use ttm_bo->moving. amdgpu probably needs the same.
>
> - since the current p2p dma-buf interface assumes the kernel memory
>    fence is in the exclusive dma_resv fence slot we need to add a new
>    fence slot for kernel fences, which must never be ignored. Since
>    currently only amdgpu supports this there's no real problem here
>    yet, until amdgpu gains a NO_IMPLICIT CS flag.
>
> - New userspace needs to ship in enough desktop distros so that users
>    wont notice the perf impact. I think we can ignore LTS distros who
>    upgrade their kernels but not their mesa3d snapshot.
>
> - Then when this is all in place we can merge this patch here.
>
> What is not a solution to this problem here is trying to make the
> dma_resv rules in the kernel more clever. The fundamental issue here
> is that the amdgpu CS uapi is the least expressive one across all
> drivers (only equalled by panfrost, which has an actual excuse) by not
> allowing any userspace control over how implicit sync is conducted.
>
> Until this is fixed it's completely pointless to make the kernel more
> clever to improve amdgpu, because all we're doing is papering over
> this uapi design issue. amdgpu needs to attain the status quo
> established by other drivers first, once that's achieved we can tackle
> the remaining issues in a consistent way across drivers.
>
> Cc: mesa-dev@lists.freedesktop.org
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Kristian H. Kristensen <hoegsberg@google.com>
> Cc: Michel Dänzer <michel@daenzer.net>
> Cc: Daniel Stone <daniels@collabora.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Deepak R Varma <mh12gx2825@gmail.com>
> Cc: Chen Li <chenli@uniontech.com>
> Cc: Kevin Wang <kevin1.wang@amd.com>
> Cc: Dennis Li <Dennis.Li@amd.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

And as explained before this is a general NAK.

I'm not discussing this further until we have fixed the dma_resv rules 
for implicit synchronization since this will just result in every 
command submission serializing all accesses to BOs which is certainly 
not what we want.

Regards,
Christian.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 88a24a0b5691..cc8426e1e8a8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -617,8 +617,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>   	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>   		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
>   
> -		/* Make sure we use the exclusive slot for shared BOs */
> -		if (bo->prime_shared_count)
> +		/* Make sure we use the exclusive slot for all potentially shared BOs */
> +		if (!(bo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID))
>   			e->tv.num_shared = 0;
>   		e->bo_va = amdgpu_vm_bo_find(vm, bo);
>   	}

