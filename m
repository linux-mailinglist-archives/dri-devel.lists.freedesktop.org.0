Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E23AB0A940
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 19:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E09010EA1C;
	Fri, 18 Jul 2025 17:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="VTjgz7gx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB9510EA1C
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 17:17:52 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-236470b2dceso19633335ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 10:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1752859071; x=1753463871;
 darn=lists.freedesktop.org; 
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aQsUdI99uVdv1G5VrfovBfE2ouV4UkpQzyyZDykQuDw=;
 b=VTjgz7gxhrgTZA1bjPoeXzZmCChHcFgeSyTGF/eQ/LzIcoUVuh54fKgskhGx6qADzw
 yV/o8xUzeC/6tLd9NbwPGJ8px6lGbTQ2BY00fniDN8ZARZNVHGc/2dydhBdyH2ZZhu7g
 R4TJD+3qkAsjeXmRNPXp2TkYkfGVNc+L9Lw4PXZuRmqFZ1I4mV/W4MYHoiL2sYzFrJ7Y
 ki2oRc+c2KuEQho/3QkuN4Ufwnv9Aw/bRJKfUAK2XmL3xYuwrkRHX9VIstrxKWJ1H1A0
 06Ze3xOmJrzJTrWvxGXkn+vH22TWeG50wzHGLViH1jcAZ8tUOFRgoDVx4UHSwlbJQsoI
 ir0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752859071; x=1753463871;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aQsUdI99uVdv1G5VrfovBfE2ouV4UkpQzyyZDykQuDw=;
 b=pBQkIIt1axU4no6MSHKZ2zaBX9wnreSCWDCQdhDuASIxTEZZuLcyGVVc79235EQrdu
 aBX0ENeTG4hrwzjGZvtb57JvZy5qcJm7p0NTJrjI3ONVl3N1w5Z0ipWit53rwHeMqUHt
 ifNd30uObLeltJlubd6hLxibVBD/MHqSPibAHlkeaxogT+4qHUVgSVBHqwYvJQ91hvhq
 oXfWkcMLv+o13qly51QQLATe61a9ejycx+t1pv/MtfjJMjPyxttO1hc+wwz3QBTZ5RNP
 as8ujZo11BE3BxxZVVxWwPuYPAh+nLVv8sIHh20BZgOmIh5VV7e4NN24p/U/6edk03x4
 LdHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULhiNKn7Af8Uww0Pb8j5xefv1i511kx6qsz/XCrJm+5my38Yw45Lh3YjUqJVUMf1KUHrLYW/O5pFc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz99ii5Whxrgck58ru/mQKT9ki6wYEFT1vPNm2OnCO7S9yZTBs9
 ujYE/TNgVBlo+H92dauqzQRbcJ1eBMyE+VTkvBDAOOYRyg+IdUx013sWrNHdgGMCh1A=
X-Gm-Gg: ASbGncucQ4HJpcSOqq+CXrNEIaNWGQjT8gACVvVqe+g4DTRoxYpGjbE4WK4jsLYr2AT
 fxBptD18oDCB/3VDstopspDIlTqXxU1QgekIkQEt2WRpx+o56LLqJdi+PxL05zJarwRKUeFRvua
 JW3GFb0egyCLo9GTkxQTbFb+lqk/zc0OtzKtcED6VpJ6gqqcKR9GdI+WWmqRkNSKyiP4ZuBfM31
 aY+dxw7OQudWwov0z9dTRVQ3A+LwryoTCQ/l4t+xTfaH4jsT8aGyIy7Z9HHjabrhFY+Gd5vTTC3
 95D/3DJ+ZHVORay0YbxT/TzPwgEi5I4plEutz7ExzeuHRI4NciPO0cHBqfDM4WTHDRlaQwyV94e
 odBdyz6wJbEXQERpJAtc=
X-Google-Smtp-Source: AGHT+IEY9VDKHPJfWeHWvEU5wqF+TlZwRpsDoYx13B2warjVxgd6exSsfIi7OB5Q426MGYSgEP16xg==
X-Received: by 2002:a17:903:8c8:b0:236:94ac:cc11 with SMTP id
 d9443c01a7336-23e2566b0d9mr164068795ad.7.1752859071385; 
 Fri, 18 Jul 2025 10:17:51 -0700 (PDT)
Received: from localhost ([64.71.154.6]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6f2184sm15987755ad.224.2025.07.18.10.17.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 10:17:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Jul 2025 11:17:48 -0600
Message-Id: <DBFCOJFGI5HB.1RNJBDPNTEL2U@brighamcampbell.com>
Cc: <tejasvipin76@gmail.com>, <diogo.ivo@tecnico.ulisboa.pt>,
 <skhan@linuxfoundation.org>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Subject: Re: [PATCH v4 1/4] drm: Create mipi_dsi_dual macro
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Doug Anderson" <dianders@chromium.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250717164053.284969-1-me@brighamcampbell.com>
 <20250717164053.284969-2-me@brighamcampbell.com>
 <CAD=FV=WYBFrm-J55BTEJ7s=Jk4EFuMVAkahVZfdzW6V8mxE7Tg@mail.gmail.com>
In-Reply-To: <CAD=FV=WYBFrm-J55BTEJ7s=Jk4EFuMVAkahVZfdzW6V8mxE7Tg@mail.gmail.com>
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

On Fri Jul 18, 2025 at 10:10 AM MDT, Doug Anderson wrote:
>> +#define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...)           \
>> +       _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ##__VA_ARGS__)
>> +
>> +#define _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...) \
>> +       do {                                           \
>> +               (_ctx)->dsi =3D (_dsi1);                 \
>> +               _func((_ctx), ##__VA_ARGS__);          \
>
> nit: shouldn't func be in parenthesis for safety? It's unlikely to
> really matter, but just in case it's somehow a calculated value that
> would make it safe from an order-of-operations point of view.

My assumption is that wrapping _func in parenthesis would cause a
compilation error in the case of _func being a macro (more on that
later...). I'll test that later today.

>> +               (_ctx)->dsi =3D (_dsi2);                 \
>> +               _func((_ctx), ##__VA_ARGS__);          \
>> +       } while (0)
>
> Can you explain why you need the extra level of indirection here (in
> other words, why do you need to define _mipi_dsi_dual() and then use
> it in mipi_dsi_dual())? I don't see it buying anything, but maybe it's
> performing some magic trick I'm not aware of?

I mentioned this in v3 after the changelog and prompty forgot to include
that information in v4: The extra indirection between mipi_dsi_dual()
and _mipi_dsi_dual() is to allow for the expansion of _func in the case
that _func is also a macro (as is the case with
mipi_dsi_generic_write_seq_multi, i believe). Compilation fails after
removing the indirection.

There may very well be a better solution to this problem. I'd appreciate
your thoughts.

> Reading this with a fresh set of eyes, I also realize that this macro
> is probably vulnerable to issues where arguments have side effects
> since we have to repeat them. I don't think there's a way around this
> and I think the macro is still worthwhile, but something to go into
> with open eyes. Possibly worth noting in the macro description? We
> could probably at least eliminate the need to reference "_ctx" more
> than once by assigning it to a local variable. I think referencing
> "_func" and "__VA_ARGS__" more than once is unavoidable...

I'm using _func, _ctx, and __VA_ARGS__ more than once in this macro and
I don't expect the indirection to fix the potential issue of unintended
side effects. I believe we can use GNU extensions to eliminate side
effects to _ctx, but especially since _func can be a macro, I don't
think there's much to be done about it. Not sure about __VA_ARGS__.

I fear my inexperience is made sorely manifest here.

Happy Friday,
Brigham
