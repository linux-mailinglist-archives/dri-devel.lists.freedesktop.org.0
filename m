Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A1184A6A7
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 22:08:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88E110FC7F;
	Mon,  5 Feb 2024 21:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CaFmXfsV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5ED10FC7C;
 Mon,  5 Feb 2024 21:08:44 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a36126e7459so638872566b.2; 
 Mon, 05 Feb 2024 13:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707167323; x=1707772123; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VIEyVIehEOiYR0ONZAxa8qYDk04/wu+0HV74pehEYPU=;
 b=CaFmXfsVhckJNb0tz0CLlxi6jL6eXRceG79NKhGKOc0UGjjryA3otuxAvq37svlxVM
 ggsaEfV1Gq7gxK+5QcfVsz43kwiS0Vyo6qwp6j9KDWTny/sQkpSADr8jcAL8P/TW1y8O
 k3oaEzItVcRDLrNjQ/fn3V5Jhy0TAR5Ox+w7co4gUBY2absKXl2lKmKe4i9MoQ1QexSG
 qwI9Axxu7WgjHEIxm9L004yriNQZNf3qOH+cB1If+bC3RktVfSw62yYwlYxaLGVyLDDY
 x95FUBVVyk1WshKrm0clECxTT19glE3NEzAr1kReJo6DhxCYP2qWclrTm6V+sDBi+nUj
 65HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707167323; x=1707772123;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VIEyVIehEOiYR0ONZAxa8qYDk04/wu+0HV74pehEYPU=;
 b=WxbfRmb+6ESwakqHJqnDwIOioCX1Ewv2jRIh6p2hlBFj+G79PEKRhKD0g+XjXAN+PB
 feMCK0tZx/u1ZkMEqfUNdy57+2Q4SK0GuApmUQwk4ylR0FsqBscFFVQieS/3/S3NdDOl
 tBxYCaL5MxlFvKcS4JrpYzXvPeK/zslFIbaQwOFAuh17oqspPNdrfLDxEkUQKm00b2RX
 uHP8ppi8r9pDRa+Pdg+nK6kqV7hR5+dgFoN4tltllzsFnHxsAnfFTaPjqH1L7DqTbSdU
 QR5PdqX9KJQUQ86eD+0O+QTfv96BOQzVg3PBywfJxNIJ14EIcltviS7HLMa8CroEs67Y
 6fWw==
X-Gm-Message-State: AOJu0YyjOaR9/lGNQ3wvzpfCi/LznxlSVcUKsUQzptxtGcTPe9pHBgv4
 4NAnBX1AZcFeug+MwiqsmbVNmmCWafbSX0NjmbySWjelBu4s5EUKLi0EV4EQwEkzUV22fuSds9u
 /YsGoQTVOkugHc/lSn2CbfHjdLh3aKVNoecw=
X-Google-Smtp-Source: AGHT+IFNFuVI1tWRccNe5j/2RgjwdxYlj/JGbQP+3XQD21+BHkkQC3840RHTp/h3dcd65xq7xuQTvniYJJGkeU/JxBU=
X-Received: by 2002:a17:906:5a49:b0:a37:d5c7:406f with SMTP id
 my9-20020a1709065a4900b00a37d5c7406fmr109070ejc.75.1707167323054; Mon, 05 Feb
 2024 13:08:43 -0800 (PST)
MIME-Version: 1.0
References: <20240129015053.1687418-1-airlied@gmail.com>
 <133266ac-7239-4233-a19d-cdc7563d401c@redhat.com>
In-Reply-To: <133266ac-7239-4233-a19d-cdc7563d401c@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 6 Feb 2024 07:08:31 +1000
Message-ID: <CAPM=9tyc3zWRhm4xSnnHprU-v7prdZ2fkkLDEfjC_t_2wM-8Kg@mail.gmail.com>
Subject: Re: [PATCH] nouveau: offload fence uevents work to workqueue
To: Danilo Krummrich <dakr@redhat.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

On Tue, 6 Feb 2024 at 02:22, Danilo Krummrich <dakr@redhat.com> wrote:
>
> On 1/29/24 02:50, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > This should break the deadlock between the fctx lock and the irq lock.
> >
> > This offloads the processing off the work from the irq into a workqueue.
> >
> > Signed-off-by: Dave Airlie <airlied@redhat.com>
>
> Nouveau's scheduler uses a dedicated wq, hence from this perspective it's
> safe deferring fence signalling to the kernel global wq. However, I wonder
> if we could create deadlocks by building dependency chains into other
> drivers / kernel code that, by chance, makes use of the kernel global wq as
> well.
>
> Admittedly, even if, it's gonna be extremely unlikely given that
> WQ_MAX_ACTIVE == 512. But maybe it'd be safer to use a dedicated wq.
>
> Also, do we need to CC stable?

I pushed this to Linus at the end of last week, since the hangs in 6.7
take out the complete system and I wanted it in stable.

It might be safer to use a dedicated wq, is the concern someone is
waiting on a fence in a workqueue somewhere else so we will never
signal it?

Dave.
