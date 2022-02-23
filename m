Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DE14C0DA9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 08:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4DB10EAAD;
	Wed, 23 Feb 2022 07:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C23F10EAAD;
 Wed, 23 Feb 2022 07:54:53 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id y7so17351569oih.5;
 Tue, 22 Feb 2022 23:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dOf41jW+SbVxhrNgz/1309Tg2LU9yaMsGenvPEV/hds=;
 b=EUjrDNavl6Xdtl07S0e5hH3teF2X2AhpcVme19R0H3iVxCWiRydUjt/+G0zgRplcPd
 yFyubejfq8Jso17iqo51SDmkeg1VpdhyH4cUkBpDovOle+BiVmkolS7AW6xC7DxRmZ7+
 imZu0Z+Vt59zi3NaxL9ORm8Siw1J4ryXDHaDpmUq6Nd68SmatDw8kGdooSvQDbx/9fIH
 PuBM6emXs4NY+CSRCUEbflKrSDLYTHHxyN9xX4kGU3XPUuMB876ECuE0K7iKrbIT7kZN
 8N4u6tmRKqlhcMnrl0hethQCKcyOUpOPyPduFKsInWXA0M6alADLmuorUSg5XiGYn0YO
 0xQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dOf41jW+SbVxhrNgz/1309Tg2LU9yaMsGenvPEV/hds=;
 b=MJa+OSfectd8xLI2oQu93gw0z0ocsI8RhxzRlz71PUJhFBvj7xVmx9kA2Cj6xemq38
 g5zwVFaI3sU32LbS2d93GxtBVb7mvOIlAEHnnJuO2rPJ7aEQ0cENKJ44ULlxRZadbtxs
 OKIgGlHTpbY1Q2ieL36/FLdV0RYUypqGzlIjc0J9JoAsCU/YyTYr0OGdpG7oobF0FBng
 o+VazCNboEiMSVGHqPPPLNMhC7b3znyOQ0mSx8TeTT+YSZV+4KCGeidZQb0Ur/RUpfNj
 4p/uJbVRANq1KJciKM2F83R+amn9Hi4FCS66rpNxWFTih1sAuR9p+w3tvaXdiHjvGgCy
 mqeA==
X-Gm-Message-State: AOAM532IT9k0nRE7txr8yCokEDCTWJk0+dms5YWaDQjuYtmzXOeXKLOO
 tgkog8h+sTAZo1h5oCR+04SYmZzFc6OygU5D/78=
X-Google-Smtp-Source: ABdhPJxjbzdSoGPV5R73HMKFxIT7yvBlahcGc6kTONGd0JvJRrzuvp93wkkbbWYhrImD6EpMJj/Z78nMMfOr43GBdjo=
X-Received: by 2002:a05:6808:1710:b0:2d3:f699:b876 with SMTP id
 bc16-20020a056808171000b002d3f699b876mr3912306oib.281.1645602892805; Tue, 22
 Feb 2022 23:54:52 -0800 (PST)
MIME-Version: 1.0
References: <20220222024651.36675-1-qiang.yu@amd.com>
 <2998de6b-bff2-4ef5-135a-1269f948c486@molgen.mpg.de>
In-Reply-To: <2998de6b-bff2-4ef5-135a-1269f948c486@molgen.mpg.de>
From: Qiang Yu <yuq825@gmail.com>
Date: Wed, 23 Feb 2022 15:54:41 +0800
Message-ID: <CAKGbVbu7a_Q3wehsC+7p6N_rG06T508Q2T24tHZtnvu6AJmm0Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: check vm ready by amdgpu_vm->evicting flag
To: Paul Menzel <pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, Qiang Yu <qiang.yu@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 23, 2022 at 3:47 PM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Qiang,
>
>
> Am 22.02.22 um 03:46 schrieb Qiang Yu:
> > Workstation application ANSA/META v21.1.4 get this error dmesg when
> > running CI test suite provided by ANSA/META:
> > [drm:amdgpu_gem_va_ioctl [amdgpu]] *ERROR* Couldn't update BO_VA (-16)
> >
> > This is caused by:
> > 1. create a 256MB buffer in invisible VRAM
> > 2. CPU map the buffer and access it causes vm_fault and try to move
> >     it to visible VRAM
> > 3. force visible VRAM space and traverse all VRAM bos to check if
> >     evicting this bo is valuable
> > 4. when checking a VM bo (in invisible VRAM), amdgpu_vm_evictable()
> >     will set amdgpu_vm->evicting, but latter due to not in visible
> >     VRAM, won't really evict it so not add it to amdgpu_vm->evicted
> > 5. before next CS to clear the amdgpu_vm->evicting, user VM ops
> >     ioctl will pass amdgpu_vm_ready() (check amdgpu_vm->evicted)
> >     but fail in amdgpu_vm_bo_update_mapping() (check
> >     amdgpu_vm->evicting) and get this error log
> >
> > This error won't affect functionality as next CS will finish the
> > waiting VM ops. But we'd better clear the error log by checking
> > the amdgpu_vm->evicting flag in amdgpu_vm_ready() to stop calling
> > amdgpu_vm_bo_update_mapping() latter.
>
> later
> > Another reason is amdgpu_vm->evicted list holds all BOs (both
> > user buffer and page table), but only page table BOs' eviction
> > prevent VM ops. amdgpu_vm->evicting flag is set only for page
> > table BOs, so we should use evicting flag instead of evicted list
> > in amdgpu_vm_ready().
> >
> > The side effect of This change is: previously blocked VM op (user
>
> this
>
> > buffer in "evicted" list but no page table in it) gets done
> > immediately.
> >
> > v2: update commit comments.
> >
> > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Signed-off-by: Qiang Yu <qiang.yu@amd.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 9 +++++++--
> >   1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_vm.c
> > index 37acd8911168..2cd9f1a2e5fa 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > @@ -770,11 +770,16 @@ int amdgpu_vm_validate_pt_bos(struct amdgpu_devic=
e *adev, struct amdgpu_vm *vm,
> >    * Check if all VM PDs/PTs are ready for updates
> >    *
> >    * Returns:
> > - * True if eviction list is empty.
> > + * True if VM is not evicting.
> >    */
> >   bool amdgpu_vm_ready(struct amdgpu_vm *vm)
> >   {
> > -     return list_empty(&vm->evicted);
> > +     bool ret;
> > +
> > +     amdgpu_vm_eviction_lock(vm);
> > +     ret =3D !vm->evicting;
> > +     amdgpu_vm_eviction_unlock(vm);
> > +     return ret;
> >   }
> >
> >   /**
>
> Acked-by: Paul Menzel <pmenzel@molgen.mpg.de>
>
Thanks, will submit with the typo fixed.

Regards,
Qiang

>
> Kind regards,
>
> Paul
