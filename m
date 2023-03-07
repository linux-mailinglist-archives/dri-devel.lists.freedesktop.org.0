Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC896AD4FF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 03:48:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA2110E043;
	Tue,  7 Mar 2023 02:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435D210E043
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 02:48:50 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-536c02c9dfbso220565297b3.11
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Mar 2023 18:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678157329;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lgt5jS4yhQSzCPdn/ZYUqLkl8CzdntpQ4aotvK0s7Ps=;
 b=bC6kQALSLNuqRTQaZ9igs0e7tU+DTMVX5l5fByB2rDw3UpbJvuu4T4oK5oVM5Rk5Ll
 8tNu6u+ARj5BDUkLjlpb/lWKave+lwglVLoJW+jFM8RpDgJA9W+2vfXnvqiMxMoXdefi
 iO34NjNBfN1UcOL7SAPpSeMHim7rP8rzFEMbuNPyEV1Giw+C9U5DhMRNvd0bryLVE8XZ
 Wun1sSNfTcMaxK5PpcAjejMKFzAwJ3WFKA63gcj+m7bPbfebZ+imgMZQgeLBHFjyZeip
 Lb+g+O93DLWbhXJLzekN1UG4Qe6St9jVVW7AMlNiDNko/G5KKb3jh3T6GLWsUSX+d2Qr
 YrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678157329;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lgt5jS4yhQSzCPdn/ZYUqLkl8CzdntpQ4aotvK0s7Ps=;
 b=GnnHmzQ+OSjUSJEw1mytoOfjxRnY0WGAJ6GdwIIfuAFj875gW2mta0OWaAiBgl//cy
 nEociblFFWg1DnEo+NTV8aPwgbwthk6AtPoUV8mH2Ec81Azlz4IkDifM32JHu2PRbyqT
 btXbfLroZ6o182e2wb9l0Z5Zp/ajuf0CTubzi810kCMUiNvLY5khkVmFFhTQFgQQaDye
 DaJ9hVNhxrx9XI+Mns02kbTPGfAEWQbOkUPeLDtm87UFBbTS5Ioh1guT1U/4fKpSOgLQ
 GOS5mFmhGNRToLfpN3P0SESFXDOvYZUPxNOqqX6ilXMVCNwnWk2P875L1fxPsjp4gH/x
 tC3Q==
X-Gm-Message-State: AO0yUKVZprzcJqIkxjQKmj4b8h96YpLNMvJMbgEWLWiNzIh3R9rL8TOZ
 xltY3qRDR8PX/X0Prgfmc8kGD/VNxuYj7HaHSiIN
X-Google-Smtp-Source: AK7set+7qSth69cARYvLTy3vreAuG4eBzkkkrdpMtT+rT9KG8bg3ULr3mNo/gsLruekyoNHGRNGr/PNwa95c+Mbf36Q=
X-Received: by 2002:a81:b604:0:b0:52f:2695:5d05 with SMTP id
 u4-20020a81b604000000b0052f26955d05mr6829568ywh.3.1678157329171; Mon, 06 Mar
 2023 18:48:49 -0800 (PST)
MIME-Version: 1.0
References: <20230306165143.1671-1-afd@ti.com>
In-Reply-To: <20230306165143.1671-1-afd@ti.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 6 Mar 2023 18:48:38 -0800
Message-ID: <CANDhNCrzi+9BszTj+9v9t6cHOcxv=4C1yQZnZZ-_7FWoxwAd5A@mail.gmail.com>
Subject: Re: [PATCH v3] dma-buf: cma_heap: Check for device max segment size
 when attaching
To: Andrew Davis <afd@ti.com>
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
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 6, 2023 at 8:52=E2=80=AFAM Andrew Davis <afd@ti.com> wrote:
>
> Although there is usually not such a limitation (and when there is it is
> often only because the driver forgot to change the super small default),
> it is still correct here to break scatterlist element into chunks of
> dma_max_mapping_size().

Hey Andrew!
  Thanks for sending this out!

So *why* is it "correct here to break scatterlist element into chunks
of  dma_max_mapping_size()." ?

> This might cause some issues for users with misbehaving drivers. If
> bisecting has landed you on this commit, make sure your drivers both set
> dma_set_max_seg_size() and are checking for contiguousness correctly.

Why is this change worth the risk? (If this is really likely to break
folks, should we maybe provide warnings initially instead? Maybe
falling back to the old code if we can catch the failure?)

I don't really object to the change, just want to make sure the commit
message is more clear on why we should make this change, what the
benefit will be along with the potential downsides.

thanks
-john
