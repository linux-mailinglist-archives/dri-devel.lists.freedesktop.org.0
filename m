Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B989879EFCF
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 19:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A28910E0E8;
	Wed, 13 Sep 2023 17:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352B710E4BE
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 17:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694624694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wlBkryVN5rhiL8WAT3ByIZQA9frdvlEqEkS+xlVMCtM=;
 b=HWrYeo2+HhlQPdk4GHFhjPwHi76Wh+zB/bw3tLUnqirm1A5+kLKWkX8zWYlroTSJk5X9mw
 p1Fp933cfLjP+IzDPVjKe/DUTU0xJ154pNt9CqkQV6BAgicTB6QMrTUFsOVO+LJ8PaSTdH
 MwqTFO4Q9fP5Wo8nBaamThTv4oEjmyU=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-22_tVnh6PfWtU5sppsEHSA-1; Wed, 13 Sep 2023 13:04:52 -0400
X-MC-Unique: 22_tVnh6PfWtU5sppsEHSA-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-59b5d4a8242so627617b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 10:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694624692; x=1695229492;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wlBkryVN5rhiL8WAT3ByIZQA9frdvlEqEkS+xlVMCtM=;
 b=ENtmyo9hrTErnm7SRlJcw3VGMibpTm5K+iQ9PU/CkqgZydkcMmkPM8DR4EZILBBlZu
 WV9ox02526Ou0WXT1YFuEthdmKPfFPGBuRP85Q7sJSDSXI5S4TgCi23y+ZHzREpcUOF3
 pb5u8QtkMZXGTcnd396hJTmwaEHF0RhLUrvIYeU9+PJ9AKt0kS1UxrZnI4MBmLuEtKh5
 0KO5tRPHDnwOeIu6XhFrsxSHCU1pue8mPnXdjwHSmQUudSxBxOeNYOQDxvE9pcOKKoHf
 THWu+fN7ztL3SRhtjXRbCLjzctXZC+I5ZRxAGoBEHH0u6MBqfxhckNTJJScdOASnZhMH
 +fng==
X-Gm-Message-State: AOJu0Yyyvy2bXrRD3xi7JIVWJ8lyctBoEgsOw9wYOKwrdDKKlr9Pig9i
 zpzUB4t/0BV8czPFD8L7/Hnd13EUAJTe32siTwtgdktIOVPiuW/thZO5xHRT93ogjkMWT8UlQNh
 7oCD7wPDgssEE345YQEaj4cWx/RML6fJHPrN2dDVyjVIa
X-Received: by 2002:a81:9216:0:b0:56c:e706:2e04 with SMTP id
 j22-20020a819216000000b0056ce7062e04mr3327022ywg.0.1694624692325; 
 Wed, 13 Sep 2023 10:04:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfDrGChagCPCvOX8SHQTPvb2eWO5VPBBVjxJJp2+fNqeE+FvInV2CYjAO7+dDzC/Ut+qqa07ULTSeuSXjb6cc=
X-Received: by 2002:a81:9216:0:b0:56c:e706:2e04 with SMTP id
 j22-20020a819216000000b0056ce7062e04mr3327004ywg.0.1694624692136; Wed, 13 Sep
 2023 10:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230705093025.3689748-1-tvrtko.ursulin@linux.intel.com>
 <20230913080819.xnpM7Ybx@linutronix.de>
In-Reply-To: <20230913080819.xnpM7Ybx@linutronix.de>
From: Valentin Schneider <vschneid@redhat.com>
Date: Wed, 13 Sep 2023 19:04:40 +0200
Message-ID: <CAD235PRj3PzMwfwL6zaFko__XjQctKyMZAAXEmf_0==n_nCGpQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Do not disable preemption for resets
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
X-Mimecast-Spam-Score: 0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 Chris Wilson <chris.p.wilson@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Sept 2023 at 18:48, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2023-07-05 10:30:25 [+0100], Tvrtko Ursulin wrote:
> > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >
> > Commit ade8a0f59844 ("drm/i915: Make all GPU resets atomic") added a
> > preempt disable section over the hardware reset callback to prepare the
> > driver for being able to reset from atomic contexts.
> =E2=80=A6
>
> This missed the v6.6 merge window. Has this been dropped for some reason
> or just missed by chance? Can this be still applied, please?
>

Just an FYI, but I happened to be looking at an internal bug report
for exactly this
error site, so +1 here :)

>
> Sebastian
>

