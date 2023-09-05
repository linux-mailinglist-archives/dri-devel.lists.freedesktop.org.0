Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC59792372
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 16:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699FE10E52E;
	Tue,  5 Sep 2023 14:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D91A10E52E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 14:24:15 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-99c136ee106so394111166b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 07:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693923852; x=1694528652;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iVp7mkHXr+2wOrv7T4nMYTKfiU2Rr3GKiul2WMppLoU=;
 b=oC6v3VYWDHiZlREmYxMnjD5P3a46FoROUw66MDURemjKwa22Bbv+rXyfCswNtReaFH
 dKmoQO+4WaW08otX1XOh8Sp01lm86VNQ9CHSakoW986iYnJKq4EkmXQ4HwZIy5MeJjoj
 nSC10BZ/MdbumyBfIVMjjYovXvaoEHkKwv4oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693923852; x=1694528652;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iVp7mkHXr+2wOrv7T4nMYTKfiU2Rr3GKiul2WMppLoU=;
 b=W/urIIrH1A7fnBrtWxQ0aM+OVvYQP4rkAoITkdS1acS0YfZDip7ZLS0QEI9WvxUfZ+
 G3l2QIcAOibhf0F8ElhN+u2XkUYdmcYsHvxdRp323hcbpaNOO+nvRziDslEC9SGSFCkK
 KDBG+j1F/JPGv05ULNNO6E/NKnDAAK2AOLN92brL2F9NxGjg5qmiJ+LDRW9K/Zn4ZZVm
 +F2s+RUkiAWtR0dnRhjzU1mcGBF86sYduv4V+fYG41xxtjZyGE1Iwd8X2dtlljOqHbw1
 MTuqGa3soKZTqUJlx+CC77pR7sew1KQiA3yckG3PGu8Sw1y+eppBkPM4+1CNqh68aVyf
 yFOg==
X-Gm-Message-State: AOJu0YzgBeSx+l0IWzybzZ/GhNgrH+3LBLqdyct7QaO1zC51kPiR9ka1
 JUSgmhfkIz6wNL5UJdL7AbWHReKBfbnw3wIuMVLLVw==
X-Google-Smtp-Source: AGHT+IHZ8Ij9tdxt/Xc6OuXs9NyevTrOm1cQECnBdZHmOdOCCLMgKaVZKCHq2qgeM0yH0ownQ9XkIA==
X-Received: by 2002:a17:906:2101:b0:9a6:8219:6e0b with SMTP id
 1-20020a170906210100b009a682196e0bmr339626ejt.35.1693923852626; 
 Tue, 05 Sep 2023 07:24:12 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 h26-20020a1709062dda00b009a1fef32ce6sm7717574eji.177.2023.09.05.07.24.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Sep 2023 07:24:11 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-402bec56ca6so195625e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 07:24:11 -0700 (PDT)
X-Received: by 2002:a05:600c:3d0c:b0:3f7:3e85:36a with SMTP id
 bh12-20020a05600c3d0c00b003f73e85036amr264789wmb.7.1693923851202; Tue, 05 Sep
 2023 07:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.1.I3d5598bd73a59b5ded71430736c93f67dc5dea61@changeid>
 <ZPSsBhbekKY7VyDg@shell.armlinux.org.uk>
In-Reply-To: <ZPSsBhbekKY7VyDg@shell.armlinux.org.uk>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Sep 2023 07:23:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WT4Hf1XVA641WtNFg4WRYFKarU1WOkLPEbr0eiVQuZPg@mail.gmail.com>
Message-ID: <CAD=FV=WT4Hf1XVA641WtNFg4WRYFKarU1WOkLPEbr0eiVQuZPg@mail.gmail.com>
Subject: Re: [RFT PATCH 01/15] drm/armada: Call drm_atomic_helper_shutdown()
 at shutdown time
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Sep 3, 2023 at 8:53=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Fri, Sep 01, 2023 at 04:41:12PM -0700, Douglas Anderson wrote:
> > Based on grepping through the source code this driver appears to be
> > missing a call to drm_atomic_helper_shutdown() at system shutdown
> > time. Among other things, this means that if a panel is in use that it
> > won't be cleanly powered off at system shutdown time.
> >
> > The fact that we should call drm_atomic_helper_shutdown() in the case
> > of OS shutdown/restart comes straight out of the kernel doc "driver
> > instance overview" in drm_drv.c.
> >
> > This driver was fairly easy to update. The drm_device is stored in the
> > drvdata so we just have to make sure the drvdata is NULL whenever the
> > device is not bound.
>
> ... and there I think you have a misunderstanding of the driver model.
> Please have a look at device_unbind_cleanup() which will be called if
> probe fails, or when the device is removed (in other words, when it is
> not bound to a driver.)

...and there I think you didn't read this patch closely enough and
perhaps that you have a misunderstanding of the component model.
Please have a look at the difference between armada_drm_unbind() and
armada_drm_remove() and also check which of those two functions is
being modified by my patch. Were this patch adding a call to
"dev_set_drvdata(dev, NULL)" in armada_drm_remove() then your NAK
would be justified. However, I am not aware of anything in the
component unbind path nor in the failure case of component bind that
would NULL the drvdata.

Kindly look at the patch a second time with this in mind.

-Doug
