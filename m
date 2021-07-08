Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C6D3BF804
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 12:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6656E1E9;
	Thu,  8 Jul 2021 10:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD4D6E8B0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 10:09:18 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id q18so13731366lfc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 03:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aFq54d9QsTmv3rpdp/cy3tzjqHVefFyvdZXGzyRj2aA=;
 b=NK8bhf24SP2Scx6x0fpPgDcU6o9ccB6rm/GRBUBFfvhzt3iMiKtxiNlsHKmgop/Ssf
 ymZPwJh97NG7AetSXxYGFsFIr/e1epnbeI9qKVjep+vxph9tE46UJ5rksZP6Qv0BObwE
 0PteEM1heK5lEjTVhcSxOHfVWKa1BWdT2mxcbMMVpzKRqiOZKW7Wfhyi8ZgqqDQrRkXr
 UEmskaw7qH6oyyImdgPZpNjWqt4ysr1nHekFb/rQAPVERL7o+7uj+6cEnOlT+8u+wL+s
 kEunaZaNRMXJydH9sVUwnt5QIuau7bnIn4WPZy+gcNXtVxBwIQ5vB7jFEb6eg5OOtY9D
 rJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aFq54d9QsTmv3rpdp/cy3tzjqHVefFyvdZXGzyRj2aA=;
 b=lgkd+LR5Jo6Cteco3Ot/7QqDnysPXJLnwx6JFWYlW7XWlsLKyeURCk2VD+aw8g1fRU
 DA+/TcQceKEhk9VNQsS15MoGenOQKhcjUxCiBioTuEC3SWezI4U/ImaViFtoxM94JaB2
 1jVxUzUKG0nmc3qmZ9q2i8dEMB3QpzAd7YSeT3p0YhKg+z15whhtW5AHGQPeCNxSBJqs
 mEdancCa2TmrFrNGZ2BT2OH6KqlBOo5LP+uCRvsdBMek74RkGaeldDt28wLxBy/KUI1Z
 T7wbso+OoE7RxCwFLwe9z4Ubdwu4DjfCK3Ksa68ZWeKEa4UrVSB7odboAN1b9K5w0yiw
 jtQA==
X-Gm-Message-State: AOAM53121HTa9aFHv83ba5dMfHMtwzpagZHreeQ8hJePqZLlCKwL1sdr
 LqZSGj41xQsjIEuKNw+Y2Z0=
X-Google-Smtp-Source: ABdhPJxL1oW6mn1pIrhyg621tFB+MjLEJFrBCVWCPsMq8ZMu/jnhFoEhMI+ze7ZGg4FrZi1NtBW2ig==
X-Received: by 2002:a05:6512:2291:: with SMTP id
 f17mr23098736lfu.466.1625738956685; 
 Thu, 08 Jul 2021 03:09:16 -0700 (PDT)
Received: from localhost.localdomain ([94.103.225.155])
 by smtp.gmail.com with ESMTPSA id a24sm148372lfg.231.2021.07.08.03.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 03:09:16 -0700 (PDT)
Date: Thu, 8 Jul 2021 13:09:10 +0300
From: Pavel Skripkin <paskripkin@gmail.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 ray.huang@amd.com, airlied@linux.ie
Subject: Re: [PATCH] gpu: ttm: fix GPF in ttm_bo_release
Message-ID: <20210708130910.63a15c73@gmail.com>
In-Reply-To: <20210708113701.4cea7989@gmail.com>
References: <20210707185108.3798-1-paskripkin@gmail.com>
 <f4bb7b29-3abc-a056-fc24-4e91b5de8d74@amd.com>
 <20210708113701.4cea7989@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 8 Jul 2021 11:37:01 +0300
Pavel Skripkin <paskripkin@gmail.com> wrote:

> On Thu, 8 Jul 2021 08:49:48 +0200
> Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
>=20
> > Am 07.07.21 um 20:51 schrieb Pavel Skripkin:
> > > My local syzbot instance hit GPF in ttm_bo_release().
> > > Unfortunately, syzbot didn't produce a reproducer for this, but I
> > > found out possible scenario:
> > >
> > > drm_gem_vram_create()            <-- drm_gem_vram_object kzalloced
> > > 				     (bo embedded in this object)
> > >    ttm_bo_init()
> > >      ttm_bo_init_reserved()
> > >        ttm_resource_alloc()
> > >          man->func->alloc()       <-- allocation failure
> > >        ttm_bo_put()
> > > 	ttm_bo_release()
> > > 	  ttm_mem_io_free()      <-- bo->resource =3D=3D NULL passed
> > > 				     as second argument
> > > 	     *GPF*
> > >
> > > So, I've added check in ttm_bo_release() to avoid passing
> > > NULL as second argument to ttm_mem_io_free().
>=20
> Hi, Christian!
>=20
> Thank you for quick feedback :)
>=20
> >=20
> > There is another ocassion of this a bit down before we call=20
> > ttm_bo_move_to_lru_tail() apart from that good catch.
> >=20
>=20
> Did you mean, that ttm_bo_move_to_lru_tail() should have NULL check
> too? I checked it's realization, and, I think, NULL check is necessary
> there, since mem pointer is dereferenced w/o any checking
>=20
> > But I'm wondering if we should make the functions NULL save instead
> > of the external check.
> >=20
>=20
> I tried to find more possible scenarios of GPF in ttm_bo_release(),
> but I didn't find one. But, yes, moving NULL check inside
> ttm_mem_io_free() is more general approach and it will defend this
> function from GPFs in the future.
>=20
>=20
>=20
> With regards,
> Pavel Skripkin
>=20

I misclicked and sent this email to Christian privately :(

Added all thread participants back, sorry.



With regards,
Pavel Skripkin
