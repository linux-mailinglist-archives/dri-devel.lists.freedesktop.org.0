Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E11B4585B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 15:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89ED210E2DC;
	Fri,  5 Sep 2025 13:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="NYKBURdP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA5010E2DC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 13:01:31 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-45ddc7d5731so954245e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 06:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757077290; x=1757682090;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/pEb1MIacLJ9K4bgFxk/ct1GGbag7F0/HxbtYf4Ql4s=;
 b=NYKBURdPD5BAwTBxG5+BjnvQ5x7zRvUY+YrzDUwd7Fi28FTd2V4lehgElTEztVHeRq
 zWX7Y3cUiteEMcaDDSCOJOYcItyCimh+24POagNQ7c1pWs4ucu3+DIPM+1Jg9NjionsZ
 g6DCbWH/6Ij17Z3PxT6/JBD2FvpptIH7oh7repPTzUBJHi0zlSRbN1XZfOjKc52MWSQ5
 cmSuoXobj/fc9pm1TxGJFlvlWlWD3RLvvMhAYi7PFTxDe5QuFrtZhX9youaPjLzIPkX5
 Y8nYPzcL+iyfsv0IUx2HOZaSSwgvpVhCPKQY966J3X/90RkpYFIU7oc65RkyX+ggyyaM
 zjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757077290; x=1757682090;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/pEb1MIacLJ9K4bgFxk/ct1GGbag7F0/HxbtYf4Ql4s=;
 b=cK1WSZm597gS//+QlISmUVxiq2T3KOn204GBAB2WOmlu2vE2J4mMmUUC7KqCxsRK5+
 Dkk33oOsnob7sywmC6Guv0G99Ntvmi6FF2wkj6RiBPyfHlWSdh05X7fETqplHjVRfYS6
 mW3XQXrKLfIUnOfqM0kuyxSSSWeLI41ynoUxVUScPSkMRttjclz5njTozcD96xttgmVc
 ALwAvSNFXZXzAyqCnpbFLExHPrJy5JQpRE1zOhFm4AD0Nm/eTgkU4/rPaN4atJLaZCin
 RSEEvlbtMzohEaBxIlS2E4rgBcGs1qHLcwNGojiCw2esh2OvWc5f+Cv3eIhVvHsQh97h
 vyHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfUA17v39Yt1WLSz9zKNdMizZzrshypiZUxEevzT05tfZv3Sn5ah1I3RpgB6fbTrfczrwzXdzfS2A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxzn6g1F4+Rhdg9E6tY6wdeCuERSG5Ud2JUGMQr0cNu9XirrW1z
 6Y71HZ80a/b3TtUzjCDQMRSLLZyVRaeRboZebSis+VNTinSrRr5lanU0+dnPZziKoac92YnlmYw
 7Zd77ruuwu+9qDYk3i0g23tsCGy69KCCMpNDVpBwl
X-Gm-Gg: ASbGncuA9606tWQJKudSbR3BJ7ycBSMrATCEV/vbraCj7m3Pc5pmRQDgIQZapEwVEW5
 5/Wr40uUwvJKavsUMV5yP0oNp3sHk+lXTOeOp6apdJDxewIqMzaPCPTPGVfBE4V9obCbez3sUaM
 yHIF/qNS2Q5V7hqjdoDfstbEUdGCYi4X63oYkvdDcfSHYf0xIqhUKajHGAs06rso5DETHEHaaIE
 0wQBVkdirzdFyzNoOsOf0TnVyTtw+wHATBB2TYL00tRNwQDZ/BCIGQKjkCLI9bDGgOilpfNgu8O
 efwKEywOgJ0=
X-Google-Smtp-Source: AGHT+IGuBKOVmlGWYI52O3gyTlIpz+6ngmiBUxM8WdXYtlt1/HZAj7YF8yKbPp1zHFZTrYVi/0srsYJtSZRAIHRbw4E=
X-Received: by 2002:a05:6000:230d:b0:3d7:b12b:1312 with SMTP id
 ffacd0b85a97d-3d7b12b1a47mr10133768f8f.9.1757077288505; Fri, 05 Sep 2025
 06:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250905-vmbo-defer-v1-0-7ae1a382b674@google.com>
 <20250905-vmbo-defer-v1-2-7ae1a382b674@google.com>
 <20250905145257.33339817@fedora>
In-Reply-To: <20250905145257.33339817@fedora>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 5 Sep 2025 15:01:16 +0200
X-Gm-Features: Ac12FXwpaHEBjBqXVyvbrj3-VvsDe5Yyi-iQSA8ardGSchek0DbSaptDO3tJbhY
Message-ID: <CAH5fLgg3zKBG5FzLnVmQ1P-fZ=GDH2RN_jwFLEJ86tqwEXTvAA@mail.gmail.com>
Subject: Re: [PATCH 2/2] panthor: use drm_gpuva_unlink_defer()
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 5, 2025 at 2:53=E2=80=AFPM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Fri, 05 Sep 2025 12:11:29 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> >  static void panthor_vm_cleanup_op_ctx(struct panthor_vm_op_ctx *op_ctx=
,
> >                                     struct panthor_vm *vm)
> >  {
> > -     struct panthor_vma *vma, *tmp_vma;
> > -
> >       u32 remaining_pt_count =3D op_ctx->rsvd_page_tables.count -
> >                                op_ctx->rsvd_page_tables.ptr;
> >
> > @@ -1134,16 +1091,12 @@ static void panthor_vm_cleanup_op_ctx(struct pa=
nthor_vm_op_ctx *op_ctx,
> >       kfree(op_ctx->rsvd_page_tables.pages);
> >
> >       if (op_ctx->map.vm_bo)
> > -             panthor_vm_bo_put(op_ctx->map.vm_bo);
> > +             drm_gpuvm_bo_put_deferred(op_ctx->map.vm_bo);
> >
> >       for (u32 i =3D 0; i < ARRAY_SIZE(op_ctx->preallocated_vmas); i++)
> >               kfree(op_ctx->preallocated_vmas[i]);
> >
> > -     list_for_each_entry_safe(vma, tmp_vma, &op_ctx->returned_vmas, no=
de) {
> > -             list_del(&vma->node);
> > -             panthor_vm_bo_put(vma->base.vm_bo);
> > -             kfree(vma);
>
> Maybe I'm missing something, but I don't see the VMAs being freed in
> this new version.

Sorry you are right. We can kfree the vma right away after unlink(),
but I forgot to add that.

Alice
