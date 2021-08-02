Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FCD3DDF6E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 20:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE1E6E1B6;
	Mon,  2 Aug 2021 18:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE766E19C;
 Mon,  2 Aug 2021 18:40:59 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id u11so7605446vst.12;
 Mon, 02 Aug 2021 11:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/JDTciPhpsppEZzll6/Pi+0di+r/qXoRaAHXje8rJcU=;
 b=S3aODv0PgPYOT/8F/bbj3dquc+grd5ZpsnpETdDqus+QDd2kunXjqcW/H3wovrtZ7U
 +p/U+UlX4tS+va3Vh4kEG1jnTdJm/dSxz2OKt0fiETASvNNpHjkhhOtNzXlyK8DLN12v
 kS3rjNgLkrexKp6uqhITyyaNgkWIJlivez5QIAA98ltBCV/OXBpgtJOMZppFm5RyK7Jt
 7nRy1cd1pCvjH1FzxVDLnu4OLtlg+LuAbmUwgY9uWq6zgsay/t2dSTyJCw0No+lgsGBp
 zge03tBYC1O8JzoQev7AiQ9oBKwUCI8SQQ5TcoQRjvuqMJ8DWuwlUJnh8vyqHjkCog1v
 BPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/JDTciPhpsppEZzll6/Pi+0di+r/qXoRaAHXje8rJcU=;
 b=KVp8jf0X01T0FXYGs17ZGTzgUSjU20hoLGuIHEJTV/yUrgyuSy2s3ZxAVSMcOoEX6A
 C+0AW/ELvQeILPfT/7ToU5iImGMGZnGuIMMH0r8BU6tCx6hh1kXWeZBVOksU4KBYw/ca
 giaAWMhOEvbE//fTF2NaHisvZ4IW7r5aGDOfhlUo5pON88eTCXn4SubyUrqC+lYsAAwP
 Lsoff7ejZyHg1HljMJGlvJ1qVUOUmnYCsCkIKj2tBrbKEpRQKOgnMkv6wOWyzD4yE4lR
 X3dlyC5WKLbBpTbGL/2JQs8Y54NoKK0Tt+u2nND/ZbHxrGRz9ScQy1Rd3TEPtbYWXRSN
 AW7g==
X-Gm-Message-State: AOAM530tnSQpiOn5PPp6Z8rhVqpRg8ZqkPrbyN1AnYSKCLTx5SWILoQb
 9wvt36cwJo9kyPF+TI35PpzlkDwQINpd89oDwi0=
X-Google-Smtp-Source: ABdhPJzaPWXcRFrinBModzRbebP+orB2U9FIw0YukoKvhxHaw/U/+j7xcsCnnRbrJfcujheOgU/OYeK28C0hEWg237I=
X-Received: by 2002:a05:6102:2325:: with SMTP id
 b5mr7459900vsa.56.1627929658962; 
 Mon, 02 Aug 2021 11:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210731214211.657280-1-jim.cromie@gmail.com>
 <20210731214211.657280-4-jim.cromie@gmail.com>
 <CACvgo509FWgNcBP9SPyuZV0Wey9sApmgB2Xa_+LJ4r91Cgqhgg@mail.gmail.com>
In-Reply-To: <CACvgo509FWgNcBP9SPyuZV0Wey9sApmgB2Xa_+LJ4r91Cgqhgg@mail.gmail.com>
From: jim.cromie@gmail.com
Date: Mon, 2 Aug 2021 12:40:32 -0600
Message-ID: <CAJfuBxzbKKnjfw72GVy531TOQjd9znqkoxOq_UTRZyxOyxXPXg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v4 3/7] dyndbg: add dyndbg-bitmap definer and
 callbacks
To: Emil Velikov <emil.l.velikov@gmail.com>
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

On Mon, Aug 2, 2021 at 10:24 AM Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> Hi Jim,
>
> On Sat, 31 Jul 2021 at 22:42, Jim Cromie <jim.cromie@gmail.com> wrote:
>
> > +struct dyndbg_bitdesc {
> > +       /* bitpos is inferred from index in containing array */
> > +       char *prefix;
> > +       char *help;
> AFAICT these two should also be constant, right?
>
>
> > +int param_set_dyndbg(const char *instr, const struct kernel_param *kp)
> > +{
> > +       unsigned int val;
> > +       unsigned long changes, result;
> > +       int rc, chgct = 0, totct = 0, bitpos, bitsmax;
> > +       char query[OUR_QUERY_SIZE];
> > +       struct dyndbg_bitdesc *bitmap = (struct dyndbg_bitdesc *) kp->data;
> > +
> > +       // pr_info("set_dyndbg: instr: %s curr: %d\n", instr, *kp->arg);
> Left-over debug code, here and below?

yup, all fixed up locally, with a version that fully works.
thanks.

>
> -Emil
