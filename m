Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D53A7930D2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 23:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A1A10E525;
	Tue,  5 Sep 2023 21:14:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB0D10E525
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 21:14:26 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-99de884ad25so460233066b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 14:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693948465; x=1694553265;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TKF3gb3bcI5KLidfb/rm+VBeJ3AWNKTfuggzgnt4FSc=;
 b=Qbex3bcyWo9Im1iiKR/65n8Jd0wuBLfMsxJp0doRClCdXzUzJsXvc2g0w5Y623DCzR
 VHFXW4T+/cmPeKI7rL0czEWCFyWGMUg10BdVh3Pk3LaTASyt+OqvSUgjpdwmC3C9x9v8
 emB5MZtolqq7af9YEVGoJwkEWUBgebGACn4hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693948465; x=1694553265;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TKF3gb3bcI5KLidfb/rm+VBeJ3AWNKTfuggzgnt4FSc=;
 b=enZciDdXBzOju4/VcEOW3uvPUY/dU5hPysja41AV+CPPlunMtGIgkNXyQ3hENz9dPe
 32qLEJbMbrCrxOJpXnPgIF4LTb7Mtkwm8AgLtGwg1J87/IQtQ2N0eVyhULap87M+AHTj
 bRljBfXI2yNSOkVMTaOh/BCru60Kkpzlof4VkkJ06r/l6M9fcJdnxUyFp+vPsAoIWLQi
 ELli9KMYlGtGqbeWISBmxsydqWkzqhPh6lfe4Ghp7xIazCKi1tbUL/u0rTMY166x1mSb
 w8331HxRyR1dG26dxNgphfqAmkRdQiDOvyuZq9eUkpAxaNUlW0MILzd6gkGhbBHLFjqR
 OJaA==
X-Gm-Message-State: AOJu0YzHt/5QPSnzSxfuL2R5qVyh7qs+GBbB1T16vhU2NIPXHZo0vPx+
 qx2mRV2hl1Mdb6OJQZgOGvIFyyP6v254MTQagHx5vtct
X-Google-Smtp-Source: AGHT+IHcIXCIS/lJh7JUpJtMc1KTWS058Ftk7ebttHi3FWhklOUnxfqd2qoPj3FYKSZX41U/69IYjg==
X-Received: by 2002:a17:907:2c61:b0:99b:e5c3:2e45 with SMTP id
 ib1-20020a1709072c6100b0099be5c32e45mr667818ejc.28.1693948464814; 
 Tue, 05 Sep 2023 14:14:24 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 z17-20020a170906241100b009a1e0349c4csm8121854eja.23.2023.09.05.14.14.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Sep 2023 14:14:24 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-529fa243739so5034a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 14:14:24 -0700 (PDT)
X-Received: by 2002:a50:d002:0:b0:522:4741:d992 with SMTP id
 j2-20020a50d002000000b005224741d992mr49434edf.4.1693948463930; Tue, 05 Sep
 2023 14:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230901163944.RFT.1.I906acd535bece03b6671d97c2826c6f0444f4728@changeid>
 <4b3a93c9ab2432f8ae0e9282d9e00d2a.mripard@kernel.org>
In-Reply-To: <4b3a93c9ab2432f8ae0e9282d9e00d2a.mripard@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Sep 2023 14:14:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VO_AxBuJya_Rea2xHJ3NMR7RL2+YV3VTMUXAwsnTkJew@mail.gmail.com>
Message-ID: <CAD=FV=VO_AxBuJya_Rea2xHJ3NMR7RL2+YV3VTMUXAwsnTkJew@mail.gmail.com>
Subject: Re: [RFT PATCH 1/6] drm/atomic-helper:
 drm_atomic_helper_shutdown(NULL) should be a noop
To: Maxime Ripard <mripard@kernel.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Sep 4, 2023 at 12:55=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> On Fri, 1 Sep 2023 16:39:52 -0700, Douglas Anderson wrote:
> > As with other places in the Linux kernel--kfree(NULL) being the most
> > famous example--it's convenient to treat being passed a NULL argument
> > as a noop in cleanup functions. Let's make
> > drm_atomic_helper_shutdown() work like this.
> >
> >
> > [ ... ]
>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks! If there are no objections, I'd tend to land this patch
sometime early next week just to get it out of the queue, even if
other patches in the series are still being discussed / need spinning.
If anyone objects to that idea, please shout.

-Doug
