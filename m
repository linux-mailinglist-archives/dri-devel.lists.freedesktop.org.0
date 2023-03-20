Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 461326C20CB
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 20:05:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181FD10E2F7;
	Mon, 20 Mar 2023 19:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568C910E2F7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 19:05:22 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id x3so50807248edb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 12:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1679339120;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MJqiI1qSkn8SxUWKJtl1QT8eZfoYnhV9G5VDrchaE0g=;
 b=BITsWnomSXhiBuQxoslShJFtHH1T6J8zurWQmFhj1J8MOQha4IM67M6uoEZx5bE1TR
 zsy0drq73pUy7WH9ia8tl/10sUUR4kWKK6BiFPUudMIkV5SPkT6HrcG/EFe8tpGnWP51
 u7w98VVYSLLmdQIfJgbJY2YM4NR2baImXnqN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679339120;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MJqiI1qSkn8SxUWKJtl1QT8eZfoYnhV9G5VDrchaE0g=;
 b=JFDR5df7OsWVXYv304SRxpRtfyxQw7KYq0ITahOriXypm7G6YBUdD6+IyxdPra4Ots
 6FhWvfgaDH2KEdLok8KOlr1SVXkJtp+HBd2LaExzpij+tewRXtnQlJhaA3/Jxgm4JunL
 MIVTwd7YSbtPiEMQISOG1WSgeQysA84BLunl+KpJzsBbtpljG9P99RqdCjlSkIdwbPmf
 wf375Mm82gpod46lCXhLmc6MWiNCu88nB+oDF119t4pnwpjPqfn3jTYgQkyjy4PUL//z
 Vlu+jWp8MRKsmcd1mwX2LOL1kcmguDfpTrh84X+X5J4fMk3GNqUD0Rob/W5lImHJUO3J
 G5hw==
X-Gm-Message-State: AO0yUKV0y/H5uh7Y/071ms5jBRNoQbSG04zw84eEQ8IqkZSoYq5XAtKs
 1QbBDlMnNfW8q9paw2N4d3mpss/PONEtBQOy6hVkNYEO
X-Google-Smtp-Source: AK7set+fsyTRuzjSt7Co4Rt2RbJjpt3A4YxhaDUdP/Ui15cvnNPb37m+DNhQ3X6kBYtE4ykfLX0efQ==
X-Received: by 2002:a17:906:7054:b0:932:4eea:17ce with SMTP id
 r20-20020a170906705400b009324eea17cemr113863ejj.39.1679339120415; 
 Mon, 20 Mar 2023 12:05:20 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46]) by smtp.gmail.com with ESMTPSA id
 z24-20020a1709060ad800b0092ffc83cc27sm4792877ejf.5.2023.03.20.12.05.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 12:05:19 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id b20so17921353edd.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 12:05:19 -0700 (PDT)
X-Received: by 2002:a50:cd0b:0:b0:4fb:4a9f:eb95 with SMTP id
 z11-20020a50cd0b000000b004fb4a9feb95mr345395edi.2.1679339119215; Mon, 20 Mar
 2023 12:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320180501.GA598084@dev-arch.thelio-3990X>
 <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
 <CAHk-=whXi1qgeDLHbaCyMpZ4XXYqS=fT2daYAmWntEK2rhG25g@mail.gmail.com>
 <20230320185602.GB615556@dev-arch.thelio-3990X>
In-Reply-To: <20230320185602.GB615556@dev-arch.thelio-3990X>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 20 Mar 2023 12:05:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjhKfp=tBHsNMnqFh7bSO1CiHXSv+hycOr0dueR_GQeZw@mail.gmail.com>
Message-ID: <CAHk-=wjhKfp=tBHsNMnqFh7bSO1CiHXSv+hycOr0dueR_GQeZw@mail.gmail.com>
Subject: Re: Linux 6.3-rc3
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 20, 2023 at 11:56=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> I did see a patch fly by to fix that:
>
> https://lore.kernel.org/20230316082035.567520-3-christian.koenig@amd.com/
>
> It seems like the DRM_TEGRA half of it is broken though:
>
> https://lore.kernel.org/202303170635.A2RsQ1Wu-lkp@intel.com/

Hmm. x86-64 has 'vmap()' too.

So I think that DRM_TEGRA breakage is likely just due to a missing
header file include that then (by luck and mistake) gets included on
arm.

You need <linux/vmalloc.h> for 'vmap()'.

There might be something else going on, I didn't look deeply at it.

                   Linus
