Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8350B7D6D1D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 15:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D553F10E05F;
	Wed, 25 Oct 2023 13:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C049810E05F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 13:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698240579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RKM+gb1rWlbrsyGe0ru+asYHoehN8Amt0gEY38pCGlY=;
 b=RZqetmJSU56W7/mFx+QJUvE0pCUEZSI+tJvVoebP67/4H/ZRUiIZko5VAJAZUwmLYbQ4jp
 GmwiJWn2lxwrZ2dxyv79aK+VDtmn4RQ71sc2hGKUugVK+kecWDELScuVGMwP6J5C++gPF9
 N1jmGJQFReqnLcZNe3ozKRvmJvABEy8=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-ppii68msNMuYjInUEjzVUw-1; Wed, 25 Oct 2023 09:29:28 -0400
X-MC-Unique: ppii68msNMuYjInUEjzVUw-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2c50d4a1a33so43932311fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 06:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698240566; x=1698845366;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RKM+gb1rWlbrsyGe0ru+asYHoehN8Amt0gEY38pCGlY=;
 b=f9cMwVD4bsL1DzVUrAxUJKVBdtoDNiew0l8YWQ0T/GSK7qSHbYyhR/PCCw5XVd5qXJ
 0OZm0N61RxAnTJzDf7YIVR5dAK/pUz3qcwlmwQhrbzGupaddg9Eg5XT77VhxvzcUJYxn
 7dbL/tclQVJRcsbMtFxvJIoIgLfE/GhNCedkbJ9Ly3n331N9cMpcFXbJDwxAhZNsTUOX
 113Sahh0u5BZOlPOjspb8NyFaXEiBo1ab/icA/GD+Sl1QAue87V0QgOCFASrfmPsC3N5
 5/ODoW2FzYDFHCpwldLPfWlqFcv3RadHtkLqlAOlKBZVsEezmrEsI6x9iOBZkUSnfkRA
 FXNg==
X-Gm-Message-State: AOJu0YzIkLbvcrrXEnSTmK1onFgGtz4iVXyqw3OHyhJRnJ5WVnabOPry
 8LB0clj94Mir3/VBOGV+IZkZeZaOE6C12zo/USVhZ4418Q4r7X1/g46yZPqYnn9+33rdL6aMD73
 Znp8fa0LVeu9TsdtXqWO49BVf+VdR
X-Received: by 2002:a2e:a167:0:b0:2c5:2242:ba5f with SMTP id
 u7-20020a2ea167000000b002c52242ba5fmr10223988ljl.26.1698240566739; 
 Wed, 25 Oct 2023 06:29:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/bd1sv994kl11qxaY4JhVZknbw1CMFlecWdVOEe4wLnbmCw3X4wu/FtaHxVQeGg/8wymYQw==
X-Received: by 2002:a2e:a167:0:b0:2c5:2242:ba5f with SMTP id
 u7-20020a2ea167000000b002c52242ba5fmr10223969ljl.26.1698240566378; 
 Wed, 25 Oct 2023 06:29:26 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q12-20020a05600c2e4c00b0040648217f4fsm19250273wmf.39.2023.10.25.06.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 06:29:26 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Huacai Chen <chenhuacai@kernel.org>, Thorsten Leemhuis
 <regressions@leemhuis.info>
Subject: Re: Blank screen on boot of Linux 6.5 and later on Lenovo ThinkPad
 L570
In-Reply-To: <CAAhV-H5DH3Oj3ttSpa_k6jUdZ+0_pMwgoaqUTGGFr46j7DMXRw@mail.gmail.com>
References: <7c50e051-eba2-09fc-da9f-023d592de457@ristioja.ee>
 <31bdf7b1-0ed9-4217-b459-1d857e53120b@leemhuis.info>
 <CAAhV-H7fRpykesVUEyaTpVnFiGwpP+fPbtdrp6JwfgD=bDp06Q@mail.gmail.com>
 <CAAhV-H7XCmbgS=N4-SE8FnASAws8hnDRZsQJgXE+dwyARaqzNw@mail.gmail.com>
 <ZSO9uArAtsPMPeTP@debian.me>
 <CAAhV-H5GbidUx8YanUc7S9oGqBkDd53xeT=2O4aCuX7KpM-+8A@mail.gmail.com>
 <c9b79a69-bdc1-4457-900d-709a15d99568@leemhuis.info>
 <CAAhV-H4qQW_fOdkTxmT1xbvo4LOapzw_tOw7Kma47xmh0PvpPA@mail.gmail.com>
 <ZTWoDSPxGO-ApR4r@P70.localdomain>
 <82f1b533-3bd8-4418-843a-718d9a6b5786@leemhuis.info>
 <CAAhV-H5DH3Oj3ttSpa_k6jUdZ+0_pMwgoaqUTGGFr46j7DMXRw@mail.gmail.com>
Date: Wed, 25 Oct 2023 15:29:24 +0200
Message-ID: <87v8auhlu3.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Thomas Zimmermann <tzimmermann@suse.de>, Evan Preston <x.arch@epreston.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Jaak Ristioja <jaak@ristioja.ee>, Bagas Sanjaya <bagasdotme@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Huacai Chen <chenhuacai@kernel.org> writes:

Hello,

> On Wed, Oct 25, 2023 at 6:08=E2=80=AFPM Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:

[...]

>>
>> This additional report makes me wonder if we should revert the culprit
>> (60aebc9559492c ("drivers/firmware: Move sysfb_init() from
>> device_initcall to subsys_initcall_sync") [v6.5-rc1]). But I guess that
>> might lead to regressions for some users? But the patch description says
>> that this is not a common configuration, so can we maybe get away with t=
hat?
> From my point of view, this is not a regression, 60aebc9559492c
> doesn't cause a problem, but exposes a problem. So we need to fix the
> real problem (SIMPLEDRM has a blank screen on some conditions). This
> needs Jaak or Evan's help.
>

I agree with this.

> Huacai

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

