Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB28B0CECE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 02:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62F910E184;
	Tue, 22 Jul 2025 00:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="m2pKPwQ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD24310E184
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 00:43:48 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b3be5c0eb99so3669858a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 17:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1753145028; x=1753749828;
 darn=lists.freedesktop.org; 
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tWKESiOhzPub7HbCpVfb6VDAUw8MhO0B1PWXFEOdxNM=;
 b=m2pKPwQ+QxqQRw4tI5Wl1/cqag7TYTkEyIedl63OrS4VKc8mLvw0txXofPmXHogaLP
 sBqtsz5ossBZBYiiG6yB5OadYJlBM440692x0e6OpOyAHExuBHSNJHlen/I+TGOuFJ6w
 de15L9tV3K3wocy2cmaNVOTMdSfq11VkXUwZZPNHgZEpnU8eipYCgNLeljFFAKQrURYz
 qTxZc/4/JtF+B/J1+BpXfD82+OLtw/ryDOmEBU3ASnrv34bTqGX58qPL34xvVKqEPbzK
 1h+BqmUczWRG0U2ILHHAAEG0bRVUb1AQb+wtjZCvLUAH8ar2Rx/zXybxyIikwT0vLw5V
 yKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753145028; x=1753749828;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tWKESiOhzPub7HbCpVfb6VDAUw8MhO0B1PWXFEOdxNM=;
 b=Ee91ktrg0Wa/tGQzE/ZjFvnKwlFn9PDTn8ScxBfJPJgRatqiJQmefv4vBNuzw0E1VA
 DfIemOeeFJMtfpsTdEVuYW64oKIBAafprWhuOejyiAHOm/gYnDiDGVNLsT12au6sjzHd
 xMCclt19pcIFXEcDLwPI2M6a7rHYKfU97ktzOY5IhIXkkhY4zPy/RlQdRcK9yxUYClOs
 9OS6FHThM+qphZe+iZlRk2o1M0/kumFUGhG7/IBB33KCjk5gnPfT27jhMXKUGZw01O+X
 +A5DPTFeM3T5NROxcnNn5CkO/Mra/X10i6eFCxr6Emm3+BEc11vA0JAvWdHRlBcov7Ox
 /zLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUypREqCNxOpfzQGk3TCUfZi6djd39KwNW5FJNLZZyybNQggluPE85k9ntxvOEPK/NKUupREzS9m5U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOKFqSG4dYQhvYM3RRY52fmzxly9Eln857nRN5S8xhJf+Xb5UX
 +mHAEHyLRA6Fv/FkIpCfYPSD7ZHTq29oYyw98dp7MaNsBLHPox1sDBvIHJyu2pmUtAY=
X-Gm-Gg: ASbGncurz3I1Rx2QCn3ooe5jlOW90QTboC5766b3hdSm6qm9lVH/7evnCGTr/EGvP8Y
 WwKzIPAjeLRCCW8TPFTbefg9ssCsQPmvNrTfAW84Dw++kgl/7kpxQpS/5IqU36Ih14qBUQ3S6AP
 oSbzP345+hcsCwHHJ5av0kGsVgrhPYlCnyIs9oXYFKuE+CWmDo66o8Z0obPtfBwdtL3OTu8XGny
 TQCiMdgCg289sNhYTlZGrpS5H47jIxiScJsOk3PuguJ8K7nepOCFrPRvtrFaXq0b+MJKf2r8vnJ
 KQxV4wYa7g+vVXvVeMxXo4jaanGOC3DmSAwLAsvCsuCmQMK7cNBSFjp3CVaRqVHLVMUPVcElHGi
 f7zHbLqXcY5edfQ02ij4=
X-Google-Smtp-Source: AGHT+IH5Ggw8HxNgNkIhkji1CsHIN+X1UuZlwLFphz3TWfdvpPzaUl2/O/py3sSxVD4cx62zQnYvpA==
X-Received: by 2002:a17:903:138a:b0:235:ef79:2997 with SMTP id
 d9443c01a7336-23e3b88343bmr193293005ad.47.1753145028092; 
 Mon, 21 Jul 2025 17:43:48 -0700 (PDT)
Received: from localhost ([64.71.154.6]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6d85d2sm64086765ad.168.2025.07.21.17.43.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 17:43:47 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Jul 2025 18:43:45 -0600
Message-Id: <DBI61MARVMJA.1DDSNK4TZE5TG@brighamcampbell.com>
Cc: <tejasvipin76@gmail.com>, <diogo.ivo@tecnico.ulisboa.pt>,
 <skhan@linuxfoundation.org>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Subject: Re: [PATCH v5 1/4] drm: Create mipi_dsi_dual* macros
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Doug Anderson" <dianders@chromium.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250719082639.307545-1-me@brighamcampbell.com>
 <20250719082639.307545-2-me@brighamcampbell.com>
 <CAD=FV=Xzno3ReSyp9w+DC+nLoy1AXmcwd+j1=_XRxFi_k+bmng@mail.gmail.com>
In-Reply-To: <CAD=FV=Xzno3ReSyp9w+DC+nLoy1AXmcwd+j1=_XRxFi_k+bmng@mail.gmail.com>
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

On Mon Jul 21, 2025 at 10:30 AM MDT, Doug Anderson wrote:
>> +void mpi_dsi_dual_generic_write_multi(struct mipi_dsi_device *dsi1,
>
> BUG: above should be "mipi", not "mpi"
>
>> +                                     struct mipi_dsi_device *dsi2,
>> +                                     struct mipi_dsi_multi_context *ctx=
,
>> +                                     const void *payload, size_t size)
>> +{
>> +       ctx->dsi =3D dsi1;
>> +       mipi_dsi_generic_write_multi(ctx, data, len);
>
> BUG: "data" and "len" are not valid local variables...
>
>> + * mipi_dsi_dual - send the same MIPI DSI command to two interfaces
>
> It could be worth also pointing people to
> mipi_dsi_dual_generic_write_seq_multi() and
> mipi_dsi_dual_dcs_write_seq_multi() below?
>
>> + * @_func: MIPI DSI function or macro to pass context and arguments int=
o
>
> nit: remove "or macro".
>
>> +               struct mipi_dsi_multi_context *_ctxcpy =3D (_ctx); \
>> +               (_ctxcpy)->dsi =3D (_dsi1);                        \
>
> nit: now that "_ctxcpy" is a local variable you no longer need the
> extra parenthesis around it.
>
>> +               mipi_dsi_dual_generic_write_multi(_dsi1, _dsi2, _ctx, d,=
        \
>> +                                                        ARRAY_SIZE(d));=
        \
>
> nit: the indentation of ARRAY_SIZE() is slightly off.
>
>> +#define mipi_dsi_dual_dcs_write_seq_multi(_dsi1, _dsi2, _ctx, _cmd, _se=
q)   \
>
> BUG: doesn't "_seq" need to be "_seq..." ?
>
> BUG: You need to remove the definition of this macro from
> `panel-novatek-nt36523.c` or else it won't compile anymore since the
> name of your macro is the exact same as theirs and they include this
> header file. It would be OK w/ me if you squashed that into the same
> patch since otherwise rejiggering things would just be churn...

Sorry to have sent out such a poor quality patch, Doug! I always compile
changed files and test my changes when I can, but I think I must have
compiled just the lpm102a188a panel C source file itself by mistake when
I sent out this series revision. From now on, I'll simply enable the
relevant kernel config options and rebuild the entire kernel.

I'll address each of these items in v6.

> I guess we also chose different argument orders than they did (that's
> probably my fault, sorry!). They had the "ctx" still first and this
> patch consistently has "dsi1" and "dsi2" first. I don't think it
> really matters, but we should be consistent which means either
> adjusting your patch or theirs. It's probably worth confirming that
> the novatek driver at least compiles before you submit v6.

No, this was my fault. You had suggested the correct order. When I
implemented the change, I preferred to put `ctx` after `dsi1` and `dsi2`
because that's what I had done when I implemented the mipi_dsi_dual
macro. I'll swap up the order, remove the function definition from the
novatek driver, and compile both lpm102a188a and the novatek driver
before sending out v6.

By the way, we can discuss this further when I've sent out v6, but the
novatek driver appears to pass a mipi_dsi_context struct into the
write_seq_multi macro directly instead of a mipi_dsi_context struct
pointer. We opted to use a pointer in this patch series so that it can
be passed to a function in order to reduce the compiled size of drivers.
For now, I'll plan to solve this by changing calls to write_seq_multi in
the novatek driver to pass a pointer. I hope that the churn that this
will cause in the novatek driver isn't unacceptable.

Thanks for your patience,
Brigham
