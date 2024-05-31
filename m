Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCD98D6828
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 19:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EA610E054;
	Fri, 31 May 2024 17:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="OUKL7ryA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748CB10E054
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 17:29:54 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-3c9b74043b1so756815b6e.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 10:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717176591; x=1717781391;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dm7zqDMgip+WJ2XM2t5p8Qmnl2zluKwd7L3ZaHXLQCo=;
 b=OUKL7ryAjmAupgVkQoW3m0+XvpzdprF39IrTWO7BiSxkJ/1pgfe7Lhi26XnjyeUWPW
 QtGIKiQsVMzq6+2BaKw4XY0Aq8JyDcwaiuDzebKPjUyarwyEDPultgcA+sdrqGVJawqt
 kKRWOTkKGpmH5af2x8Urew1sjEpyWxRyPVBgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717176591; x=1717781391;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dm7zqDMgip+WJ2XM2t5p8Qmnl2zluKwd7L3ZaHXLQCo=;
 b=nNpnK5tUTrdfTXcj368YIov0EZeBvCZEpTq4abyXcuzEhk1+XaACscqw2t2VpJxcWr
 +OQtgdT4aRII26Z73+j6op0tlc+QuWBC4G7qi6FrimgukjelrpBNamIABm4nvanof098
 Its/MILtHmEh0rN9l4hI5yvuOo69TUp5rscGAOL0n+C7l63o5rI4Rk5JSVYMwWlnjceJ
 7jw1cM51hF2pS8WuzxOiFhhrtTXPEHQudVrrlm2qtAXPRRnkIK7Bw6YQlT1GlfTrz4w1
 uQe9ncs5oeJVlLl+YBqvdKuJxAAjIqTqBEpx+7uu88QMGukgIInM/tpejAxf2mJiLqLf
 Ogxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo8GCOEbot3IdaU9HFGxOTqEzEcr0Mx9CkDDJGfaDGrdFVy4WHNruvo8u/1HYh7SMi7lrEx4BlE281vpRPl/PSOyPh2d4vlQko1+V8VGH2
X-Gm-Message-State: AOJu0Yz6YNE2X8Aa6R70xCErz5KPUMfXOn1QmQYnBO8Vh6v3He09iYrU
 EsCnQ1CoIzU8xct6fYv/4L76cbCYa4ciDnH7OXDK/5AIq8sxy52iudcjHY9J6hOVytCC0bwufGh
 biPK7
X-Google-Smtp-Source: AGHT+IHzfFHSl3u8N436k926caB3Qy1QBGKeI67ICsSzQshkzu96dNQjxqYrvc5Jzs5sLbvTzolVCw==
X-Received: by 2002:a05:6808:1506:b0:3c9:686f:8d8b with SMTP id
 5614622812f47-3d1e349cb6cmr3332197b6e.24.1717176591415; 
 Fri, 31 May 2024 10:29:51 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ae4b417a49sm8164846d6.121.2024.05.31.10.29.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 10:29:50 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-43dfe020675so20921cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 10:29:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWQpfW5vgbd+fWVfGSCxHOJ+9xQC64C6/VkHC4VlT30k42K76PFoXHxy9w0vj1MZ4WpoHnmIh9se8LI6M6u9sGz1gdTWovUwUq8PxzraJHp
X-Received: by 2002:a05:622a:4ac9:b0:43e:33f7:600c with SMTP id
 d75a77b69052e-43ff4f8dc64mr3254021cf.19.1717176589297; Fri, 31 May 2024
 10:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org>
 <7428a2f7-befc-6db8-76f4-3ca8dc12d31c@quicinc.com>
 <CAD=FV=Xcq-p5OxSnDJVF-Wp88ZfXOaOKJmh941ymy-f0wkhdhw@mail.gmail.com>
 <197777e0-e6e1-7004-be27-edb98f8a235e@quicinc.com>
In-Reply-To: <197777e0-e6e1-7004-be27-edb98f8a235e@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 31 May 2024 10:29:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UUmnKuBCwLLjrg69kCi7MTjMDYAVtdWEb3yqeZc=-5iQ@mail.gmail.com>
Message-ID: <CAD=FV=UUmnKuBCwLLjrg69kCi7MTjMDYAVtdWEb3yqeZc=-5iQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm/panel-edp: remove several legacy compatibles
 used by the driver
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
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

Hi,

On Fri, May 31, 2024 at 9:51=E2=80=AFAM Jeffrey Hugo <quic_jhugo@quicinc.co=
m> wrote:
>
> On 5/31/2024 10:20 AM, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, May 31, 2024 at 9:18=E2=80=AFAM Jeffrey Hugo <quic_jhugo@quicin=
c.com> wrote:
> >>
> >> On 5/30/2024 5:12 PM, Dmitry Baryshkov wrote:
> >>> There are two ways to describe an eDP panel in device tree. The
> >>> recommended way is to add a device on the AUX bus, ideally using the
> >>> edp-panel compatible. The legacy way is to define a top-level platfor=
m
> >>> device for the panel.
> >>>
> >>> Document that adding support for eDP panels in a legacy way is strong=
ly
> >>> discouraged (if not forbidden at all).
> >>>
> >>> While we are at it, also drop legacy compatible strings and bindings =
for
> >>> five panels. These compatible strings were never used by a DT file
> >>> present in Linux kernel and most likely were never used with the
> >>> upstream Linux kernel.
> >>>
> >>> The following compatibles were never used by the devices supported by
> >>> the upstream kernel and are a subject to possible removal:
> >>>
> >>> - lg,lp097qx1-spa1
> >>> - samsung,lsn122dl01-c01
> >>> - sharp,ld-d5116z01b
> >>
> >> Ok to drop the sharp one I added.  It should be able to be handled by
> >> the (newish) edp-panel, but I think the TI bridge driver needs some wo=
rk
> >> for the specific platform (no I2C connection) to verify.
> >
> > Is the platform supported upstream? If so, which platform is it? Is
> > the TI bridge chip the ti-sn65dsi86? If so, I'm confused how you could
> > use that bridge chip without an i2c connection, but perhaps I'm
> > misunderstanding. :-P
>
> Yes, the platform is upstream.  The 8998 laptops (clamshell).  It is the
> ti-sn65si86.  I suspect the I2C connection was not populated for cost
> reasons, then determined its much more convenient to have it as every
> generation after that I've seen has the I2C.
>
> If you check the datasheet closely, the I2C connection is optional.  You
> can also configure the bridge inband using DSI commands.  This is what
> the FW and Windows does.
>
> So, the DT binding needs to make the I2C property optional (this should
> be backwards compatible).  The driver needs to detect that the I2C
> connection is not provided, and fall back to DSI commands.  Regmap would
> be nice for this, but I got pushback on the proposal.  Then I got
> sidetracked looking at other issues.

Crazy! I'm sure I've skimmed over that part of the ti-sn65dsi86
datasheet before but I don't think I internalized it. I guess if you
did it this way then you'd instantiate it as a platform device instead
of an i2c device and that would be how you'd detect the difference. I
could imagine this being a bit of a challenge to get working in the
driver.
