Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BB6534F9D
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 14:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AFD10F3CE;
	Thu, 26 May 2022 12:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AC510F3CE
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 12:52:34 +0000 (UTC)
Date: Thu, 26 May 2022 12:52:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1653569552; x=1653828752;
 bh=aLxei+rQODoesTLOhu8EJZjs3o+SuVeofRXzJoH7g7k=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=DWBIccEnCp11mv38Mg1Q9uaPuKPJXZplsOMvrTkit+u7+Wi4YtVbRAkncONy8aqjz
 qUYUFZkSgjFFwODQrhjuQ5XHl+zLI5aFMZSjh4XkK8IUwIXBi/qxHH6lNaZ4aooW+z
 JUAol/W4XJZOCPT+woydA/tQTQNrv8fpInTx/lvWr2nEaYweTG9dPe+J4t4UqJRAnA
 z9BYgvBZNozkgbnu5aRygjL5FBOBs6zspZjT+dODPA1XxAiPDIomUgvaaT3pu1rD5f
 EAAPjNboaRGwiyMS26/ksIKf74S0DmnG66HeCShzG5wsW0CuZoe/0sp+d9yAHNX+3P
 Oo5WqgijMrlrw==
To: Jason Ekstrand <jason@jlekstrand.net>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 2/2] dma-buf: Add an API for importing sync files (v9)
Message-ID: <MovCjKvG5dfm5jjaEksmJI1HYjcrw9fBBR-KbQCjfe1P_CIG4rk1gCAmh5eZF6cWOn_yEbfs4URn1W4Ui1kSZHJAkQI11MzBseX140wv9rk=@emersion.fr>
In-Reply-To: <20220506180216.2095060-3-jason@jlekstrand.net>
References: <20220506180216.2095060-1-jason@jlekstrand.net>
 <20220506180216.2095060-3-jason@jlekstrand.net>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Jason Ekstrand <jason.ekstrand@collabora.com>,
 dri-devel@lists.freedesktop.org,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason.ekstrand@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, May 6th, 2022 at 20:02, Jason Ekstrand <jason@jlekstrand.net> wr=
ote:

> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index 46f1e3e98b02..70e213a0d7d9 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -96,6 +96,24 @@ struct dma_buf_sync {
>   * dma-buf for waiting later instead of waiting immediately.  This is
>   * useful for modern graphics APIs such as Vulkan which assume an explic=
it
>   * synchronization model but still need to inter-operate with dma-buf.
> + *
> + * The intended usage pattern is the following:
> + *
> + *  1. Export a sync_file with flags corresponding to the expected GPU u=
sage
> + *     via DMA_BUF_IOCTL_EXPORT_SYNC_FILE.
> + *
> + *  2. Submit rendering work which uses the dma-buf.  The work should wa=
it on
> + *     the exported sync file before rendering and produce another sync_=
file
> + *     when complete.
> + *
> + *  3. Import the rendering-complete sync_file into the dma-buf with fla=
gs
> + *     corresponding to the GPU usage via DMA_BUF_IOCTL_EXPORT_SYNC_FILE=
.

This should read DMA_BUF_IOCTL_IMPORT_SYNC_FILE I think?

> + * Unlike doing implicit synchronization via a GPU kernel driver's exec =
ioctl,
> + * the above is not a single atomic operation.  If userspace wants to en=
sure
> + * ordering via these fences, it is the respnosibility of userspace to u=
se
> + * locks or other mechanisms to ensure that no other context adds fences=
 or
> + * submits work between steps 1 and 3 above.
>   */
>  struct dma_buf_export_sync_file {
>  =09/**
