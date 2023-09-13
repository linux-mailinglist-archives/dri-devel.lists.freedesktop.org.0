Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC3579F104
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 20:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB3B10E4D1;
	Wed, 13 Sep 2023 18:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7139B10E4D1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 18:20:01 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9ada609bb62so16722566b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 11:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694629199; x=1695233999;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/3JqoOh+25nY/g0sbcImIfYwmx6qLRTASwuSntRUYYo=;
 b=RqacHWntGVbLlays2iRyq/KrCGJSo9Ax9L7/ZpsIeu2vHqADvkksz8u6X7bg5uBjsS
 U1lnL0QNTCuU8fdQ3T30vR3Sc15KUONL4mSMtxdsrVuz5WhNcMQDne7Sc5O581Rx8aNu
 YxXb8DeZD6vrbTmxATkvNQ7YfNBeHGgsbVixk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694629199; x=1695233999;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/3JqoOh+25nY/g0sbcImIfYwmx6qLRTASwuSntRUYYo=;
 b=dsDEorr5bmDG1/xOTOkf1cDltT54RExpBHWtd9MFA8rUyVdUyvWjPymeUIHGPUY/Pv
 YMZpopxmoGxCngVuwJZHb7Tyi2xswBLWYgDjbEEGNuhCfy+/J6qju5XQUoCXCcx7BbNy
 fGjTR5gvVCRP8ETHwBKB/TCSPgWWi9U323pXirf/TaxGs9T0/uJUFB5sex/Zu/71Yfz9
 Kw3TEoedKCKWKjuo6qxvUPWwlSWFYQqxD4zrdsNPca9PwqDtr56hsAodY/UJA7HAh09I
 UbjwrNUeF5RliboMoTRubn0v5PYeUybrLDQGNRgXXofYF5l2VWtUm2jZxDcw/m5L4KiY
 tceA==
X-Gm-Message-State: AOJu0YzfLi9+ctSlSiPiQ/dYThjUMYUEOrepbcin+STvLftOKU+dAk3z
 AbT9Q6jXLfgTL6PTp20dB09FKs2kPjTE5juRnqtUW7u1
X-Google-Smtp-Source: AGHT+IFolaPtpVE46VTHFjRXATUbOnGcnVw6NoqTkvJAw9vU0xx64NZmeiMVw2FZWVeMgBnIsus54w==
X-Received: by 2002:a17:907:272a:b0:9a6:69bf:fa56 with SMTP id
 d10-20020a170907272a00b009a669bffa56mr2622833ejl.51.1694629199064; 
 Wed, 13 Sep 2023 11:19:59 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 hb19-20020a170906b89300b009a1fd22257fsm8726364ejb.207.2023.09.13.11.19.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 11:19:57 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-402c80b71ecso11305e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 11:19:57 -0700 (PDT)
X-Received: by 2002:a05:600c:1827:b0:3fe:f32f:c57f with SMTP id
 n39-20020a05600c182700b003fef32fc57fmr197827wmp.0.1694629196921; Wed, 13 Sep
 2023 11:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230901163944.RFT.1.I906acd535bece03b6671d97c2826c6f0444f4728@changeid>
 <4b3a93c9ab2432f8ae0e9282d9e00d2a.mripard@kernel.org>
 <CAD=FV=VO_AxBuJya_Rea2xHJ3NMR7RL2+YV3VTMUXAwsnTkJew@mail.gmail.com>
In-Reply-To: <CAD=FV=VO_AxBuJya_Rea2xHJ3NMR7RL2+YV3VTMUXAwsnTkJew@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 13 Sep 2023 11:19:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WwmQMmRnkMMEnQPpVCGtuO-7T_yGaQxuBys=g+sUyDLw@mail.gmail.com>
Message-ID: <CAD=FV=WwmQMmRnkMMEnQPpVCGtuO-7T_yGaQxuBys=g+sUyDLw@mail.gmail.com>
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

On Tue, Sep 5, 2023 at 2:14=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Mon, Sep 4, 2023 at 12:55=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> >
> > On Fri, 1 Sep 2023 16:39:52 -0700, Douglas Anderson wrote:
> > > As with other places in the Linux kernel--kfree(NULL) being the most
> > > famous example--it's convenient to treat being passed a NULL argument
> > > as a noop in cleanup functions. Let's make
> > > drm_atomic_helper_shutdown() work like this.
> > >
> > >
> > > [ ... ]
> >
> > Acked-by: Maxime Ripard <mripard@kernel.org>
>
> Thanks! If there are no objections, I'd tend to land this patch
> sometime early next week just to get it out of the queue, even if
> other patches in the series are still being discussed / need spinning.
> If anyone objects to that idea, please shout.

Landed to drm-misc-next.

2a073968289d drm/atomic-helper: drm_atomic_helper_shutdown(NULL)
should be a noop
