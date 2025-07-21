Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EDBB0C614
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 16:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AAE10E551;
	Mon, 21 Jul 2025 14:19:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SyypF1+s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F1210E54A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 14:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1753107547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I2e2g+RSdLVrXvuMyT6qHHm4bEHxvzYzZzIUO+TrG+M=;
 b=SyypF1+ssXJ8VxaSKJFR6xAIvMz+3MQ7JHFELADZWVv1bTsQqeS9iUbPPWz8PGprwGYr+g
 v5oBk+dbjtQ48J9y3zlJhSAmS9bdx8rRpgMhhySyeCdDCZosZANbuCPf1FiLku53SZVHZg
 1jmAGggo9rfcakUDyPK0A5woh7QHr1E=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-0s7-oAUkMnC-wg7irDhL8A-1; Mon, 21 Jul 2025 10:19:02 -0400
X-MC-Unique: 0s7-oAUkMnC-wg7irDhL8A-1
X-Mimecast-MFC-AGG-ID: 0s7-oAUkMnC-wg7irDhL8A_1753107541
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3132c8437ffso7591242a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 07:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753107541; x=1753712341;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I2e2g+RSdLVrXvuMyT6qHHm4bEHxvzYzZzIUO+TrG+M=;
 b=TY4RQVf9qCj4fCpDP1cPgBDh9LRT1w4LemvB3Rpd/bb64DzoOOb1oLDNgN2bfkyavL
 4UIEStbb2ArM/Vbm6d5BtoX2FjtprmUQhMINrU9B8LMpB3piJzCCBxgnzRVUh5V9IeJu
 BkJH1DTmGs0KalTcy+ozlTk+GIptJeDi4cxO50dm5rWrUtqrBvrcg8AX5Hekbm9+zQ+6
 D8tJu5DJDfotQzYDgfINbsgJqP9IP8HIr0OaJyoFocn2ZFVZ2JQW9LwlwpUoRqI72bAL
 kVLWb7YwmBxG02jcz79RSPATgvSTrd7DBi02HqdMrSdcIj2/a6K2bVeveMyTVBTv+fBa
 G6TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj+8sqDkjyGbAB5kODv4o5FUloiH40lnkGQgQXaVNUufxUyVNEtm2QdJO4vlwG93/lFntjkZeSEhs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywn82UZJ0nsv0k/WXKBVB1eZHBetrDI4J/ZQ37mpMjsjxccfjka
 aDyicppT8UZGkmCmRYr2T/IEPlkh3Tc/dVnEthHWxMeEDKfM4yAx/fn2HfbeM/n3elQg0GSuDiJ
 n3YXJIVuQqIJiXT20gmasWSGr0oWYREKSt4UihTgOsrHwZ/2zH+zpoe0/0rue8a1LispijdQk3W
 doiu0kbq63MGqzD0jEza+GbfODH6dV9CUeJUMLGB+GHlaU
X-Gm-Gg: ASbGncv9Lr8GEVG0dGEKaVEGPccyKTubVRBBB2VSIeC0jOX1BXxCnbxU+a3npMbi3tE
 SAuzT13B4RP4cDaWJ2yMvED/1XAARiZNRL7cgWetvUhYmfOCo2VgyF9BPYP4dFvzWM1vg3CspmY
 wpE6Dr0YEUYwVswBVJCuxTiQ==
X-Received: by 2002:a17:90b:2252:b0:312:1508:fb4e with SMTP id
 98e67ed59e1d1-31c9f45e1bamr34067981a91.17.1753107541241; 
 Mon, 21 Jul 2025 07:19:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJIdqihCeYBVzkOqoaHkVeRUSem0hiE8oGsu0T7UvW6Id9zyyr788yaoKXL+Z4xHCOtXdyTT7abtsFJKNwYFA=
X-Received: by 2002:a17:90b:2252:b0:312:1508:fb4e with SMTP id
 98e67ed59e1d1-31c9f45e1bamr34067933a91.17.1753107540404; Mon, 21 Jul 2025
 07:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <197d1dc3bff.c01ddb9024897.1898328361232711826@zohomail.com>
 <cd3ca680ac5751368941713c1071e04d69544d47@intel.com>
 <197d710ac39.10e2c241536088.2706332519040181850@zohomail.com>
In-Reply-To: <197d710ac39.10e2c241536088.2706332519040181850@zohomail.com>
From: Pingfan Liu <piliu@redhat.com>
Date: Mon, 21 Jul 2025 22:18:48 +0800
X-Gm-Features: Ac12FXzDdHF_s7WVKonqNsgMwmdC6Q6zqqujKluH5OQTrSCN3xvRecpp-sj16FU
Message-ID: <CAF+s44SvWGxwty3FA6ZpR3GoXEbqXRDoT9H6KBj_jy0yM1jjLw@mail.gmail.com>
Subject: Re: Second kexec_file_load (but not kexec_load) fails on i915 if
 CONFIG_INTEL_IOMMU_DEFAULT_ON=n
To: Askar Safin <safinaskar@zohomail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 regressions <regressions@lists.linux.dev>, 
 intel-gfx <intel-gfx@lists.freedesktop.org>, kexec <kexec@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, iommu <iommu@lists.linux.dev>, 
 Ben Hutchings <benh@debian.org>,
 joonaslahtinen <joonas.lahtinen@linux.intel.com>, 
 josesouza <jose.souza@intel.com>, davehansen <dave.hansen@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mxET570h8aiYMkY4iTFEYm5MtVUPRt3XyIHsIs1SPwk_1753107541
X-Mimecast-Originator: redhat.com
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

On Sat, Jul 5, 2025 at 4:12=E2=80=AFAM Askar Safin <safinaskar@zohomail.com=
> wrote:
>
>  ---- On Fri, 04 Jul 2025 12:29:01 +0400  Jani Nikula <jani.nikula@linux.=
intel.com> wrote ---
>  > Thanks for the detailed debug info. I'm afraid all I can say at this
>  > point is, please file all of this in a bug report as described in
>  > [1]. Please add the drm.debug related options, and attach the dmesgs a=
nd
>  > configs in the bug instead of pointing at external sites.
>
> Okay, now let me speculate how to fix this bug. :) I think someone with m=
oderate kexec understanding
> and with Intel GPU should do this: reproduce the bug and then slowly modi=
fy kexec_file_load code until it
> becomes kexec_load code. (Or vice versa.) In the middle of this modificat=
ion the bug stops to reproduce,
> and so we will know what exactly causes it.
>
> kexec_file_load and kexec_load should behave the same. If they do not, th=
en we should
> understand, why. We should closely review their code.
>
> Also, in case of kexec_load kernel uncompressing and parsing performed by=
 "kexec" userspace
> tool, and in case of kexec_file_load by kernel. So we should closely revi=
ew this two uncompressing/parsing code fragments.
> I think that this bug is related to kexec, not to i915. And thus it shoul=
d be fixed by kexec people, not by i915 people. (But I may be wrong.)
>

I tend to agree with Baoquan on this scene when kexec rebooted with a
graphic card.
I heard that this was due to the missed initialization on the graphic
card by the firmware in the kexec reboot process. But it is not an
official explanation. If any experts could enlighten me on this, I'd
really appreciate it.

IMHO, you could try blacklisting the i915 module to see if
kexec_file_load works without issues - this would help narrow down the
culprit.

Thanks,

Pingfan

> But okay, I reported it to that bug tracker anyway: https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14598
>
> Maybe there is separate kexec bug tracker?
>
> Also, your bug tracker is cool. One can attach files in the middle of rep=
ort. Why not whole kernel uses it? :)
>
> --
> Askar Safin
> https://types.pl/@safinaskar
>
>

