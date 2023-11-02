Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C5E7DEABF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 03:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D737F10E115;
	Thu,  2 Nov 2023 02:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A1610E115;
 Thu,  2 Nov 2023 02:36:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmr4zdX//L/a+1H7te25JTtF73ImQgQJ2aDX7BMjgNryOxXk7yKIcsBzSOvbo39B9ryhyxCwHSgv5Zb3B+2PaPx3OGAlu4yGUbSaB9iPol8k+ej/jTdYCzUSzrny+30js+uBDc5BS63jO0ujejojzl0waoFmt8h8mtWfRElKSuttUJEf5lunUST38Sh/GeSzFmNaNVN7oJPWsx36WrHzhjSLiSnQoOasx+sNRi3ej+1SmHXdgDgiYaHTowhB6xOrnDFkh6tgTXjTXeiBRvDF8imNKbyFL3w0s/j2VWIlXNDGEp44Kv2IFHkCF8y7tVUJU7ostuEW3M4fuj1Dhz7uiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gd+OHFJM5FRJIpcEHIdnm9fZgVnyNiVQZP0622+5A64=;
 b=c1l6FhC84EmpEM6bkZ/yJRy0AwuhURYpkeskCalkP3wJSNVsvGiCM8pjIi2OaI7ULr2jcpiH2HY47Vrjv+U3ntfgFD/ojKbpZWsSVXDzmCYZ3PCVHDfJLSdgnbCbL0zyriYwbwFkZeLscY7p6ogNADDniH8JuKdkiJYQFfxE4bOjho37ctKhdDYf2tBglB2DoDeRNpXUGMSTvZ9C/XKCPDfjWR/6gRfyRvlqvXypvq+b5ciYsYMxXQRHxfSXHiVbi/RBPl2fDEqaqHUhIIYcyEGDmTKsZLqcXtsCvElHA0GvGaFxL4qGOx3qI3yMh78pRfNq2CnYXiE3nGWGM4Db9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gd+OHFJM5FRJIpcEHIdnm9fZgVnyNiVQZP0622+5A64=;
 b=sTqW8wnZ3F84Dtqw6urFJRSoS4Crq6z1ERYWfzEdSc+79RtguIRR6l756vEq8nbVMwqD69fAivvY5FDLAYSSKxUHQHE5YmGeXIag4pTpug9jTM8AHLRT7u2sTI6qiBoKkIANKEoNDKxzXrLsLUE15YIrKAVddDtUY3y+rzWM/Vo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8898.namprd12.prod.outlook.com (2603:10b6:303:246::8)
 by MN2PR12MB4304.namprd12.prod.outlook.com (2603:10b6:208:1d0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Thu, 2 Nov
 2023 02:36:34 +0000
Received: from MW6PR12MB8898.namprd12.prod.outlook.com
 ([fe80::bcd7:3d07:27f3:4770]) by MW6PR12MB8898.namprd12.prod.outlook.com
 ([fe80::bcd7:3d07:27f3:4770%3]) with mapi id 15.20.6933.029; Thu, 2 Nov 2023
 02:36:34 +0000
Date: Thu, 2 Nov 2023 10:36:26 +0800
From: Lang Yu <Lang.Yu@amd.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 3/6] drm/amdgpu: Flush VM updates for split bindings
 eagerly.
Message-ID: <ZUMLKh8xn0lDRRD5@lang-desktop>
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
 <20231031134059.171277-4-ishitatsuyuki@gmail.com>
 <30bcd9b7-903d-435e-9318-346777a3fd55@amd.com>
 <CAP+8YyFEKDGPCvA-puUBHNXcrEX4rXOJz=WkBpJyJrmqZ=rtMA@mail.gmail.com>
 <ffafa427-e755-4f86-8aab-8e69ef63325a@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffafa427-e755-4f86-8aab-8e69ef63325a@amd.com>
X-ClientProxiedBy: SG2PR01CA0132.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::36) To MW6PR12MB8898.namprd12.prod.outlook.com
 (2603:10b6:303:246::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8898:EE_|MN2PR12MB4304:EE_
X-MS-Office365-Filtering-Correlation-Id: aabf0b34-44bc-4e50-b080-08dbdb4c8774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Q8k1cdxfqpcBfbAp/pimxwOJ3MNHdLNUVdGxnhb3188S3TzM7sxnC8Ca6vxCOdwf1Vq0zZh5cH6faOWQnKOI1IiFRaovBvk3LsoN5U3JNpXlIRX26bC49O/IC50rF4MUL/p+++Ub/NSqMMYVrxyGozdyPLVs/GD5L+JVh3jP+dvuC9kuR26vxFtTcFTkfY6VN3oa0huGw3yQ02jTZ7kr/8NyPmqApxg26NOYWSYKQcjWiTs1iS3pzQa+rTJkb3DtQ8/LTpsJjZeU6D5VT+Av0T01S0dhFTMJVrErV1vqAHhHwD0D7VrcOv6wPR51GTZcamD1rFItBAMrz2WQLc2wdWHfYHueKxV9uMPsStSLhHM2XYjelbhVIsS2dWm8HRSVvaGlF7fOKSwbohHZAEQ2AeJjRr4VIK1SSq20iYHbgITvyn3OXaj314q6x4dlnKven827v+2BCXIk/v5hXQ9Vk8gz74ygbNKJHRbdHwjR8O4B+59SOTKhkI7XAWMhlIMQlvYvPjVWGh3oEKgw8nQa8ixdU5aTFjk3UzEpqg6V90=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8898.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(346002)(376002)(366004)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(26005)(9686003)(6512007)(38100700002)(86362001)(66574015)(30864003)(5660300002)(15650500001)(2906002)(6506007)(6666004)(53546011)(83380400001)(478600001)(8936002)(8676002)(54906003)(4326008)(6862004)(316002)(66946007)(66476007)(66556008)(6636002)(33716001)(6486002)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0VFc0NzdEh6OHhFZkZQVjJTS0RRL3lQMGRaYkgrT1lIZWlZMUFLdlh2MnJ4?=
 =?utf-8?B?QTZicklPeUpiN3VJZmxIemdpR09MY1dYVGdwSXJWZStUNGpibFVVemlQOTh0?=
 =?utf-8?B?QUJKSGh0VCthYXVXQjFLWHR4L3NJSHpCYTZoTnRlTU1yeExLMnZmNWROcXNU?=
 =?utf-8?B?Wm1rNlZqbkhuZEJ2cmpFdGc3NEdzUW5lR1Y4ZlF1WU92cHBnNHRWcmxDM1BP?=
 =?utf-8?B?K2lyZjZyZWlTSlB3V24wTnlIM29JQ3NCT2duM2lwZm4wUVBCUmh5SFNHenIy?=
 =?utf-8?B?OW5TUUNnMzU1eXJ0NHRmdi9aV0dYbnJBelV4eFl3bzd2b3phMmMybTBiNjla?=
 =?utf-8?B?ZnZBR2xJM050NCsvdHJINndtelRNVG5Ua0NUTHJMR0RpSFBGUmlMM3RPYjNZ?=
 =?utf-8?B?T3ZYaXhWc3l4NzVUM21pSUk5V3FxNCtDUnBsaVJuR0hXZkZ6ZG11SHZiZ1BR?=
 =?utf-8?B?UkxORzBmQlZvbzVTVDA5aW9sdVBQL2ViT1ZkVHM5S3B4K215SFdIbjl5cHdP?=
 =?utf-8?B?Vkt0Z2J1T29IQnpvVWZ6U2dCNTZjV3Y0OG9sRHZhUkJ2MGJxYi9YeFV4eWZk?=
 =?utf-8?B?UVRkU2VHS3hvQmRlamxsREkwaHJhWnpGNFpFUlkzOG1ENXBxRW5xR3lLc3py?=
 =?utf-8?B?bTkrNVExaFp6VHN3UU9EQk9HVVhFMWlxc0ZRSmxmdExDUmdMcENiSVZCc1ZP?=
 =?utf-8?B?OWRYYnRtYk9GQnoxWktHS0wxZU9Vcll2VlZLcmpVVnZlWkNQVTJhZmpZYU1v?=
 =?utf-8?B?dkd0WWJHTk9lMVBySWhTY0szRmI0eVcreExUWW50ZmlaQUx5K0NXM1UxT0xF?=
 =?utf-8?B?Tnk5bEx4VGtIczVQWGUzWVJBU3gxQ3hrN2s4Z29LYzg1R1RScGxYZzBCTTlv?=
 =?utf-8?B?d2M5bkZiN01pYU1aTHNXdTRIWVhvc01vd29hTHFIdExRa29yaVdGWUhJVGdM?=
 =?utf-8?B?TnZwWmlNb3BKRjdZRzAzQitBQW4xQ2F0L3pIeFVic3ZseHFOYTJBZmt5RkRk?=
 =?utf-8?B?SkZ0M2pHR1ZodkN0R0dJaUhUdWtoczJwbStTWmRrZ0lxWTZkNnVaTkpVdmc5?=
 =?utf-8?B?TVFOc2g2cTB5SkFiVnplNmZiNWpHTGZ6MHh4Tk5iMW4xR1hxV2p0emJWZ1FD?=
 =?utf-8?B?b2ZlU3lrcHUzUHpiQ0Y1ZitXVDdHRlN4WW5xd1pzYTFETnpQQjFqemIrSDdi?=
 =?utf-8?B?ZElSMDJjaFluR1E1SktMODlQSEZLU0F6UEZCczFwakROTlVUVUtCcjU3MDhk?=
 =?utf-8?B?K3FlYS81S2RhZGRsbVRmajRLSVFYN016alFTa3ZGcTE5S3JJekxtek9HajNL?=
 =?utf-8?B?N1NtY1ptNWUwL3p3UjR1NjFrVFpqc1NXT2tUZVdEamF5UklXRFpqRCtxQlZQ?=
 =?utf-8?B?YTBRa0E2QmFGRjZGQUY2YUtMTlh2STFKYzBtRWx0UmJWZU5uemMvVkFibWs1?=
 =?utf-8?B?MG1jdTYwTEx4UHFLVEdTblpKaDlWWVdobkw5MGlHU3lNUi8xVEVRZDROSStM?=
 =?utf-8?B?VHBpVHhjN3BMajJxa0xxa045dHhpdGtlM1VTbUdxMnl4YVJ6VHNHUlVmWVd4?=
 =?utf-8?B?eXZiTmJ5bmg2WnBoS25zbFJPSms0T242Y3dRVFFZMDJicnRsSWphNklDZUIv?=
 =?utf-8?B?SGNIY2o4d0dZZzh0Y2U0eFFKMCtaSDk0RzdXS0V0WWdybFR2Rm40Q1FlbXpu?=
 =?utf-8?B?Z3c2Q3hiWUp0VnJ5S3N1bzZaaktIS01IdzBwem1yREwxTlhTazR2YjA2TEFZ?=
 =?utf-8?B?UjJKMVJEdk5XdU9qK0gzRWNEcmZvL1FtcFZTVzlXYUg0cm5NSit4V2lvSHJS?=
 =?utf-8?B?YnlxejN1ZnIyS0h3dEkwL3NzRUo4T2Y0QlRSMkR1QytyVFNtQk5NVVVpb1ZD?=
 =?utf-8?B?ZFNYRDRFUzZ6Zk8vcTVNdTNsMnVZVHI1WC8wbXFGZDN5NEhWUjVsekRPaWo0?=
 =?utf-8?B?aXZ1dHdTL2U1and3M0E1T0VqUjlDZlBiZ1hDZDdHRWFXQTZ3Yk53cnp4WHBW?=
 =?utf-8?B?ZThuOVF2UzBGbm52cEQ1dHc1VzNFMWRjZmwvYWt0Yy9YeHZMNzVGTkpPLy9Y?=
 =?utf-8?B?WENpdE56ZndNRzk1Zk91T2s5R2hlTitUUHVvNWFEcnF3YlRDekdZUTBRaG43?=
 =?utf-8?Q?GeGdRjUN7fCz9nIQDnbCdsUjy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aabf0b34-44bc-4e50-b080-08dbdb4c8774
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8898.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 02:36:34.0802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JhAI6D4OIM0101DNwzicNZ+MGnGMhH40cQIwipbizulVJwHqGQxzMqyeXwXpldSUkYDS+G9KaXxZUgWvdjFasA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4304
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
Cc: dri-devel@lists.freedesktop.org, Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/31/ , Christian König wrote:
> Am 31.10.23 um 14:59 schrieb Bas Nieuwenhuizen:
> > 
> > 
> > On Tue, Oct 31, 2023 at 2:57 PM Christian König
> > <christian.koenig@amd.com> wrote:
> > 
> >     Am 31.10.23 um 14:40 schrieb Tatsuyuki Ishi:
> >     > The current amdgpu_gem_va_update_vm only tries to perform
> >     updates for the
> >     > BO specified in the GEM ioctl; however, when a binding is split, the
> >     > adjacent bindings also need to be updated. Such updates
> >     currently ends up
> >     > getting deferred until next submission which causes stalls.
> > 
> >     Yeah, that is a necessity. The hardware simply doesn't support
> >     what you
> >     try to do here in all cases.
> > 
> > 
> > What can the hardware not do here? Is this just needing to wait for TLB
> > flushes before we can free pagetables, can we just delay that?
> 
> On some hardware generations (especially Navi1x, but also everything older
> than Polaris) you can't invalidate the TLB while it is in use.

Hi Christian,

non-legacy invalidation can invalidate the TLB while it is in use.
Right? Thanks.

Regards,
Lang

> For Polaris and older it just means that you don't have a guarantee that the
> shader can't access the memory any more. So delaying the free operation
> helps here.
> 
> But for Navi1x it's a workaround for a hardware bug. If you try to
> invalidate the TLB while it is in use you can potentially triggering memory
> accesses to random addresses.
> 
> That's why we still delay TLB invalidation's to the next CS and use a new
> VMID for each submission instead of invalidating the old one.
> 
> I'm currently working on changing that for Navi2x and newer (maybe Vega as
> well), but this is something you can really only do on some hw generations
> after validating that it works.
> 
> Regards,
> Christian.
> 
> > 
> > 
> >     So this approach won't work in general.
> > 
> >     Regards,
> >     Christian.
> > 
> >     >
> >     > Introduce a new state "dirty", shared between per-VM BOs and
> >     traditional
> >     > BOs, containing all BOs that have pending updates in `invalids`.
> >     > amdgpu_gem_va_update_vm will now simply flush any pending
> >     updates for BOs
> >     > in the dirty state.
> >     >
> >     > Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
> >     > ---
> >     >   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 18 ++++---
> >     >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 66
> >     ++++++++++++++++++-------
> >     >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  3 ++
> >     >   3 files changed, 63 insertions(+), 24 deletions(-)
> >     >
> >     > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> >     b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> >     > index a1b15d0d6c48..01d3a97248b0 100644
> >     > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> >     > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> >     > @@ -604,10 +604,9 @@ int amdgpu_gem_metadata_ioctl(struct
> >     drm_device *dev, void *data,
> >     >    * vital here, so they are not reported back to userspace.
> >     >    */
> >     >   static void amdgpu_gem_va_update_vm(struct amdgpu_device *adev,
> >     > -                                 struct amdgpu_vm *vm,
> >     > -                                 struct amdgpu_bo_va *bo_va,
> >     > -                                 uint32_t operation)
> >     > +                                 struct amdgpu_vm *vm)
> >     >   {
> >     > +     struct amdgpu_bo_va *bo_va;
> >     >       int r;
> >     >
> >     >       if (!amdgpu_vm_ready(vm))
> >     > @@ -617,12 +616,18 @@ static void amdgpu_gem_va_update_vm(struct
> >     amdgpu_device *adev,
> >     >       if (r)
> >     >               goto error;
> >     >
> >     > -     if (operation == AMDGPU_VA_OP_MAP ||
> >     > -         operation == AMDGPU_VA_OP_REPLACE) {
> >     > +     spin_lock(&vm->status_lock);
> >     > +     while (!list_empty(&vm->dirty)) {
> >     > +             bo_va = list_first_entry(&vm->dirty, struct
> >     amdgpu_bo_va,
> >     > +                                      base.vm_status);
> >     > +             spin_unlock(&vm->status_lock);
> >     > +
> >     >               r = amdgpu_vm_bo_update(adev, bo_va, false);
> >     >               if (r)
> >     >                       goto error;
> >     > +             spin_lock(&vm->status_lock);
> >     >       }
> >     > +     spin_unlock(&vm->status_lock);
> >     >
> >     >       r = amdgpu_vm_update_pdes(adev, vm, false);
> >     >
> >     > @@ -792,8 +797,7 @@ int amdgpu_gem_va_ioctl(struct drm_device
> >     *dev, void *data,
> >     >               break;
> >     >       }
> >     >       if (!r && !(args->flags & AMDGPU_VM_DELAY_UPDATE) &&
> >     !amdgpu_vm_debug)
> >     > -             amdgpu_gem_va_update_vm(adev, &fpriv->vm, bo_va,
> >     > -  args->operation);
> >     > +             amdgpu_gem_va_update_vm(adev, &fpriv->vm);
> >     >
> >     >   error:
> >     >       drm_exec_fini(&exec);
> >     > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> >     b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> >     > index dd6f72e2a1d6..01d31891cd05 100644
> >     > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> >     > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> >     > @@ -191,6 +191,21 @@ static void amdgpu_vm_bo_set_evicted(struct
> >     amdgpu_vm_bo_base *vm_bo, bool evict
> >     >       spin_unlock(&vm_bo->vm->status_lock);
> >     >   }
> >     >
> >     > +/**
> >     > + * amdgpu_vm_bo_dirty - vm_bo is dirty
> >     > + *
> >     > + * @vm_bo: vm_bo which is dirty
> >     > + *
> >     > + * State for normal and per VM BOs that are not moved, but have
> >     new entries in
> >     > + * bo_va->invalids.
> >     > + */
> >     > +static void amdgpu_vm_bo_dirty(struct amdgpu_vm_bo_base *vm_bo)
> >     > +{
> >     > +     spin_lock(&vm_bo->vm->status_lock);
> >     > +     list_move(&vm_bo->vm_status, &vm_bo->vm->dirty);
> >     > +     spin_unlock(&vm_bo->vm->status_lock);
> >     > +}
> >     > +
> >     >   /**
> >     >    * amdgpu_vm_bo_moved - vm_bo is moved
> >     >    *
> >     > @@ -1042,6 +1057,9 @@ void amdgpu_vm_get_memory(struct amdgpu_vm
> >     *vm,
> >     >       list_for_each_entry_safe(bo_va, tmp, &vm->evicted,
> >     base.eviction_status)
> >     >               amdgpu_vm_bo_get_memory(bo_va, stats);
> >     >
> >     > +     list_for_each_entry_safe(bo_va, tmp, &vm->dirty,
> >     base.vm_status)
> >     > +             amdgpu_vm_bo_get_memory(bo_va, stats);
> >     > +
> >     >       list_for_each_entry_safe(bo_va, tmp, &vm->relocated,
> >     base.vm_status)
> >     >               amdgpu_vm_bo_get_memory(bo_va, stats);
> >     >
> >     > @@ -1411,6 +1429,17 @@ int amdgpu_vm_handle_moved(struct
> >     amdgpu_device *adev,
> >     >                       dma_resv_unlock(resv);
> >     >               spin_lock(&vm->status_lock);
> >     >       }
> >     > +
> >     > +     while (!list_empty(&vm->dirty)) {
> >     > +             bo_va = list_first_entry(&vm->dirty, struct
> >     amdgpu_bo_va,
> >     > +                                      base.vm_status);
> >     > +             spin_unlock(&vm->status_lock);
> >     > +
> >     > +             r = amdgpu_vm_bo_update(adev, bo_va, false);
> >     > +             if (r)
> >     > +                     return r;
> >     > +             spin_lock(&vm->status_lock);
> >     > +     }
> >     >       spin_unlock(&vm->status_lock);
> >     >
> >     >       return 0;
> >     > @@ -1476,19 +1505,16 @@ static void
> >     amdgpu_vm_bo_insert_map(struct amdgpu_device *adev,
> >     >                                   struct amdgpu_bo_va_mapping
> >     *mapping)
> >     >   {
> >     >       struct amdgpu_vm *vm = bo_va->base.vm;
> >     > -     struct amdgpu_bo *bo = bo_va->base.bo <http://base.bo>;
> >     >
> >     >       mapping->bo_va = bo_va;
> >     >       list_add(&mapping->list, &bo_va->invalids);
> >     >       amdgpu_vm_it_insert(mapping, &vm->va);
> >     > +     if (!bo_va->base.moved)
> >     > +             amdgpu_vm_bo_dirty(&bo_va->base);
> >     >
> >     >       if (mapping->flags & AMDGPU_PTE_PRT)
> >     >               amdgpu_vm_prt_get(adev);
> >     >
> >     > -     if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv &&
> >     > -         !bo_va->base.moved) {
> >     > -             amdgpu_vm_bo_moved(&bo_va->base);
> >     > -     }
> >     >       trace_amdgpu_vm_bo_map(bo_va, mapping);
> >     >   }
> >     >
> >     > @@ -1725,6 +1751,8 @@ int amdgpu_vm_bo_clear_mappings(struct
> >     amdgpu_device *adev,
> >     >                       before->flags = tmp->flags;
> >     >                       before->bo_va = tmp->bo_va;
> >     >                       list_add(&before->list,
> >     &tmp->bo_va->invalids);
> >     > +                     if (!tmp->bo_va->base.moved)
> >     > +  amdgpu_vm_bo_dirty(&tmp->bo_va->base);
> >     >               }
> >     >
> >     >               /* Remember mapping split at the end */
> >     > @@ -1736,6 +1764,8 @@ int amdgpu_vm_bo_clear_mappings(struct
> >     amdgpu_device *adev,
> >     >                       after->flags = tmp->flags;
> >     >                       after->bo_va = tmp->bo_va;
> >     >                       list_add(&after->list, &tmp->bo_va->invalids);
> >     > +                     if (!tmp->bo_va->base.moved)
> >     > +  amdgpu_vm_bo_dirty(&tmp->bo_va->base);
> >     >               }
> >     >
> >     >               list_del(&tmp->list);
> >     > @@ -1761,30 +1791,18 @@ int amdgpu_vm_bo_clear_mappings(struct
> >     amdgpu_device *adev,
> >     >
> >     >       /* Insert partial mapping before the range */
> >     >       if (!list_empty(&before->list)) {
> >     > -             struct amdgpu_bo *bo = before->bo_va->base.bo
> >     <http://base.bo>;
> >     > -
> >     >               amdgpu_vm_it_insert(before, &vm->va);
> >     >               if (before->flags & AMDGPU_PTE_PRT)
> >     >                       amdgpu_vm_prt_get(adev);
> >     > -
> >     > -             if (bo && bo->tbo.base.resv ==
> >     vm->root.bo->tbo.base.resv &&
> >     > -                 !before->bo_va->base.moved)
> >     > -  amdgpu_vm_bo_moved(&before->bo_va->base);
> >     >       } else {
> >     >               kfree(before);
> >     >       }
> >     >
> >     >       /* Insert partial mapping after the range */
> >     >       if (!list_empty(&after->list)) {
> >     > -             struct amdgpu_bo *bo = after->bo_va->base.bo
> >     <http://base.bo>;
> >     > -
> >     >               amdgpu_vm_it_insert(after, &vm->va);
> >     >               if (after->flags & AMDGPU_PTE_PRT)
> >     >                       amdgpu_vm_prt_get(adev);
> >     > -
> >     > -             if (bo && bo->tbo.base.resv ==
> >     vm->root.bo->tbo.base.resv &&
> >     > -                 !after->bo_va->base.moved)
> >     > -  amdgpu_vm_bo_moved(&after->bo_va->base);
> >     >       } else {
> >     >               kfree(after);
> >     >       }
> >     > @@ -2136,6 +2154,7 @@ int amdgpu_vm_init(struct amdgpu_device
> >     *adev, struct amdgpu_vm *vm, int32_t xcp
> >     >       INIT_LIST_HEAD(&vm->evicted);
> >     >       INIT_LIST_HEAD(&vm->relocated);
> >     >       INIT_LIST_HEAD(&vm->moved);
> >     > +     INIT_LIST_HEAD(&vm->dirty);
> >     >       INIT_LIST_HEAD(&vm->idle);
> >     >       INIT_LIST_HEAD(&vm->invalidated);
> >     >       spin_lock_init(&vm->status_lock);
> >     > @@ -2648,11 +2667,13 @@ void amdgpu_debugfs_vm_bo_info(struct
> >     amdgpu_vm *vm, struct seq_file *m)
> >     >   {
> >     >       struct amdgpu_bo_va *bo_va, *tmp;
> >     >       u64 total_idle = 0;
> >     > +     u64 total_dirty = 0;
> >     >       u64 total_relocated = 0;
> >     >       u64 total_moved = 0;
> >     >       u64 total_invalidated = 0;
> >     >       u64 total_done = 0;
> >     >       unsigned int total_idle_objs = 0;
> >     > +     unsigned int total_dirty_objs = 0;
> >     >       unsigned int total_relocated_objs = 0;
> >     >       unsigned int total_moved_objs = 0;
> >     >       unsigned int total_invalidated_objs = 0;
> >     > @@ -2669,6 +2690,15 @@ void amdgpu_debugfs_vm_bo_info(struct
> >     amdgpu_vm *vm, struct seq_file *m)
> >     >       total_idle_objs = id;
> >     >       id = 0;
> >     >
> >     > +     seq_puts(m, "\tDirty BOs:\n");
> >     > +     list_for_each_entry_safe(bo_va, tmp, &vm->dirty,
> >     base.vm_status) {
> >     > +             if (!bo_va->base.bo <http://base.bo>)
> >     > +                     continue;
> >     > +             total_dirty += amdgpu_bo_print_info(id++,
> >     bo_va->base.bo <http://base.bo>, m);
> >     > +     }
> >     > +     total_dirty_objs = id;
> >     > +     id = 0;
> >     > +
> >     >       seq_puts(m, "\tRelocated BOs:\n");
> >     >       list_for_each_entry_safe(bo_va, tmp, &vm->relocated,
> >     base.vm_status) {
> >     >               if (!bo_va->base.bo <http://base.bo>)
> >     > @@ -2707,6 +2737,8 @@ void amdgpu_debugfs_vm_bo_info(struct
> >     amdgpu_vm *vm, struct seq_file *m)
> >     >
> >     >       seq_printf(m, "\tTotal idle size: %12lld\tobjs:\t%d\n",
> >     total_idle,
> >     >                  total_idle_objs);
> >     > +     seq_printf(m, "\tTotal dirty size:  %12lld\tobjs:\t%d\n",
> >     total_dirty,
> >     > +                total_dirty_objs);
> >     >       seq_printf(m, "\tTotal relocated size:
> >      %12lld\tobjs:\t%d\n", total_relocated,
> >     >                  total_relocated_objs);
> >     >       seq_printf(m, "\tTotal moved size:  %12lld\tobjs:\t%d\n",
> >     total_moved,
> >     > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> >     b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> >     > index d9ab97eabda9..f91d4fcf80b8 100644
> >     > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> >     > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> >     > @@ -276,6 +276,9 @@ struct amdgpu_vm {
> >     >       /* per VM BOs moved, but not yet updated in the PT */
> >     >       struct list_head        moved;
> >     >
> >     > +     /* normal and per VM BOs that are not moved, but have new
> >     PT entries */
> >     > +     struct list_head        dirty;
> >     > +
> >     >       /* All BOs of this VM not currently in the state machine */
> >     >       struct list_head        idle;
> >     >
> > 
