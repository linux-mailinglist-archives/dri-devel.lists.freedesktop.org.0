Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE488402C8
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 11:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB69910F6C8;
	Mon, 29 Jan 2024 10:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 759CC112816
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 10:30:20 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id
 a1e0cc1a2514c-7d2e21181c1so829827241.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 02:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1706524159; x=1707128959;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=laogtMYkJGnbaIV+yWhqpoDmIUOyQqWLND7z4g4S1Zg=;
 b=f7sR9jBddj+Pq1JkjMS+R5/9sBdj0BQcYlKCU4ILk/CLa99CO3hPQk1IH58BWKQxLs
 QREO/uhlMTbwpR/uFiDNn6QFnKkJGVfpuwx8iUDCEHi0Rx8y1Ll7rASIRjWlriay0uFY
 Wau7+iGn0fTPIhGGd4j3r/jgmPSUNO5qcMTQVF7PuF2EKU9wXAMnQzY7vhCh17PRSixW
 N4KIQTfWrVlpyCxcrjb3pyBCi3r6gEIsUA1peWZEpwwxZN7d64bF6JTgZqSADL6zyoMA
 IF1M/jWxruoiIW6OsQmhF7NYW6bxAmgtmhRXj21u1/gT+q5F+DKF1GV8Gd96hVIohWG4
 kMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706524159; x=1707128959;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=laogtMYkJGnbaIV+yWhqpoDmIUOyQqWLND7z4g4S1Zg=;
 b=q81Hi41Csaz3YSnl87fiHi1FaaVu0l7AeV62OCgttMJSanVRrrutf3wwUoApWALJTw
 nwsWcewXkEL1PQzpzZB7epF1N3fDavd59+rX9TS5ytIkpqAE78/AhUSxXPCVGJAABKYB
 J4RTMxQDFh+ne2yMtQn6tqPBTEhd7GVUnzH+R4tGk+xqaPj8eprw3DTSoDMXOvzOO644
 D6fqVACy+O8OCANFZC/jhX4tbWeoFhQeXgASBMX+mAuFruhM2nYUAgoXRsTjQyZ+udEH
 hQm8uo96ARduaPJ8/0Mew3dwEDfC/8ideHGcd0w/leCxStVVAx/6TmwV+dXMLIyRSsox
 cIfA==
X-Gm-Message-State: AOJu0YyHCE3OPMi/jukHy7Pgo/JDFAeNBvbJHK3xeAZPYa1jE2tdfFIM
 d0NU83L2rjJgp+ancCFFlTsn753y0dRVni5zLROaAUYbaEQ37Flma8jdZiVsG5bhWhwiCd0pCzU
 VhRXsOVElM/VfSfXi6mVymkIFDmrwZ2pB/1rCQw==
X-Google-Smtp-Source: AGHT+IG02k1D855wHGJvL/3W5YxqpMq481SOQ1eyc1YgFIpQdWBD+1lTmFmPT5LySDdWcKuUKgpUqLEQNRuRtxR4O1g=
X-Received: by 2002:a05:6122:2019:b0:4bd:6109:ab9a with SMTP id
 l25-20020a056122201900b004bd6109ab9amr1513382vkd.8.1706524159615; Mon, 29 Jan
 2024 02:29:19 -0800 (PST)
MIME-Version: 1.0
References: <20240126165856.1199387-1-l.stach@pengutronix.de>
In-Reply-To: <20240126165856.1199387-1-l.stach@pengutronix.de>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 29 Jan 2024 10:29:08 +0000
Message-ID: <CAPj87rNOMYS7g_bU8Xjmh9xEJhuzG+BViXakC7wzgiDaG+9yCg@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: fix DMA direction handling for cached
 read/write buffers
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, Christian Gmeiner <christian.gmeiner@gmail.com>,
 kernel@pengutronix.de, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

On Fri, 26 Jan 2024 at 17:00, Lucas Stach <l.stach@pengutronix.de> wrote:
> The dma sync operation needs to be done with DMA_BIDIRECTIONAL when
> the BO is prepared for both read and write operations. With the
> current inverted if ladder it would only be synced for DMA_FROM_DEVICE.
>
> [...]
>
>  static inline enum dma_data_direction etnaviv_op_to_dma_dir(u32 op)
>  {
> -       if (op & ETNA_PREP_READ)
> +       if (op & (ETNA_PREP_READ | ETNA_PREP_WRITE))
> +               return DMA_BIDIRECTIONAL;

This test will always be true for _either_ read or write.

Cheers,
Daniel
