Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF753DDD94
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 18:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DE16E489;
	Mon,  2 Aug 2021 16:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB056E1D7;
 Mon,  2 Aug 2021 16:24:30 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id t68so17111286qkf.8;
 Mon, 02 Aug 2021 09:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PABonhkfz0MvRGA6imtUnPyjypKDIpW3LfF+TjLeY4o=;
 b=abqfi6gzVw+ynFGoz0A5rBsxqK7BLlHO4rmdg6nFQDPOxt1wwq12n3BaH9if/ZXaOn
 fYBfeuWw6VKmuxNwo13braCXtqReoz3+AR/o0ROfzVlpmzUbY5rAjA98AezOF7T5biLR
 8Geu2xgl59mAwBEQQmdLzPWofp+8tv1cXKB8pbjhWgHG1USo3sD/vDSuS32yWER7r3Qj
 9TYb0uNWFAm7UoMPqBtQVDJi3hDWqI2Xa2T501rI8fR7sLTB42NjdldQPfhSV+wdln68
 XgY1O0AGD94GK3KC9V2pfdQqV0j2lptAmzeLblBEIfuwNOuVp+9skRad2c4iTGTQVbUY
 xSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PABonhkfz0MvRGA6imtUnPyjypKDIpW3LfF+TjLeY4o=;
 b=B5sCHLz+WGj93CufMMAAvnVyVHhWvQ1+n2sBJO8VSpoO10KqaVrAlj7BAtiZniPJlL
 6LxBYqNo41Q6LjOTC/KakMh8SEVvIeJwNSIsUgfyQXViHQMtG4eoCi9e+kSLqIMo5eDH
 +wK02ZubOYv0a6e0Ry4No9RCVuC3RNYNdtpl4GYOpJPVZfQOU9NVMsGdHcwQiwM/S6qP
 zltbeQIQwRE+WP5RIzBEnJssabbNkklrCVI5a9TxOrLFdFRXD0m1acrH5AOBiwSvLEID
 3jua/IuibgUs/vsTsCS8UUKHWP8tqJUqqQksy5MsbAqakH0VM6/5rwU5JYXXHb4cPfKA
 T+yg==
X-Gm-Message-State: AOAM530iL7q6LFrtFI3ZxQ4f+DxS00yxr2I/l3eFLJOyTAwq3BjDXIcO
 YqhX8NyOwKra7xgwTuneuzLG27BYSQWaSrxVWUM=
X-Google-Smtp-Source: ABdhPJxSICDT7QAUlLZoant5eoxfyRFLmIvUQ/yn35oDDIe5fQ6jBLfy0/FXQELa3F92AS84FaoFLpUf/W6p/DuJ2FI=
X-Received: by 2002:a37:64d:: with SMTP id 74mr16630354qkg.407.1627921470080; 
 Mon, 02 Aug 2021 09:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210731214211.657280-1-jim.cromie@gmail.com>
 <20210731214211.657280-4-jim.cromie@gmail.com>
In-Reply-To: <20210731214211.657280-4-jim.cromie@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 2 Aug 2021 17:24:18 +0100
Message-ID: <CACvgo509FWgNcBP9SPyuZV0Wey9sApmgB2Xa_+LJ4r91Cgqhgg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v4 3/7] dyndbg: add dyndbg-bitmap definer and
 callbacks
To: Jim Cromie <jim.cromie@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, 
 Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Jason Baron <jbaron@akamai.com>, Ashley Thomas <Ashley.Thomas2@amd.com>, 
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, 
 Wyatt Wood <Wyatt.Wood@amd.com>, Johan Hovold <johan@kernel.org>,
 Jessica Yu <jeyu@kernel.org>, 
 Joe Perches <joe@perches.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Nick Desaulniers <ndesaulniers@gooogle.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, 
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 intel-gvt-dev@lists.freedesktop.org, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi Jim,

On Sat, 31 Jul 2021 at 22:42, Jim Cromie <jim.cromie@gmail.com> wrote:

> +struct dyndbg_bitdesc {
> +       /* bitpos is inferred from index in containing array */
> +       char *prefix;
> +       char *help;
AFAICT these two should also be constant, right?


> +int param_set_dyndbg(const char *instr, const struct kernel_param *kp)
> +{
> +       unsigned int val;
> +       unsigned long changes, result;
> +       int rc, chgct = 0, totct = 0, bitpos, bitsmax;
> +       char query[OUR_QUERY_SIZE];
> +       struct dyndbg_bitdesc *bitmap = (struct dyndbg_bitdesc *) kp->data;
> +
> +       // pr_info("set_dyndbg: instr: %s curr: %d\n", instr, *kp->arg);
Left-over debug code, here and below?

-Emil
