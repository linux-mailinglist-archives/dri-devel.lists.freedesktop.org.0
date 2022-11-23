Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3836369C5
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 20:19:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2594B10E5FC;
	Wed, 23 Nov 2022 19:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D227610E5FC
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 19:19:35 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id x24so621864uaf.4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 11:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SwMzuEDw937D1BNWUA0+s7FH/Sv/GWnLAgn8jMy5G/0=;
 b=g/nn420R1OojaK+ZrP5yWqCPRWhqBR3yJ1bGeZnSy5rk1jJk4NsK6VjXpTG+jsegam
 dBm2h9744Pvni4Tx3Vg54pqwd9DZjb1z22H0MRPKB+9jQeP56FN28EFvVyFJz2E5LBJ9
 oImZsEE9BVhSfGNwgLNk2FshAC5d0BF1yGL9i7WxmEAZHKb39SwzeGlFMlYz+KbBSU/1
 OBcH6y45lXdKxud/yud4DKrczBhWp7gVspfwxvN5+bANrEhxzl32kMonJcRnomPu/vRA
 fHY4Ktf8hzgF8/QRtPHetAsVza0ZL9CslbOCwPxxHRp9lsOejr9Lr8cvglm0ml7YP14v
 LTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SwMzuEDw937D1BNWUA0+s7FH/Sv/GWnLAgn8jMy5G/0=;
 b=YzEQxCZhVKKfs9nqGVYHx4OpgVeTuzsRk2X33IcWbrIPDGZAl583m13FDKPX86XhRd
 j0H7UXJ+VnCz6lgHW3i90QKU1SW9rrlaNRPFHZH9atITwnX7W2VdaImi3xxB3deaFUhd
 9i5+U5n/35Uy1mgNl5o707bQ6WKHZlfcdmy4fojk0SyvsKavLGNPnZwno809+ZaHkgHd
 N89odurbY5GvBrwBWCT3YDS+ukQRsSzxJonFahv9bEHjb5S7G1h6cKPnfOsQ04N6Hjnz
 AL9UZwZD9g05K5Mzipg7QqqRv0iQoejuUZvYXNl2oH2RlOd+tToCMqmSXD9AF/DBOfnM
 hotQ==
X-Gm-Message-State: ANoB5pnz2U4b63srxntd/HefqaTzbez0wGSilXhld7QBEjCbEI4326vd
 BdhrY1QXYGm+pQujEJFTdpn+Z2ztxTp18JyoOe3n
X-Google-Smtp-Source: AA0mqf7ymL6DaildKXguHmgnNFyFiHrXAqeOVxwz1oN82oZWA+QVsylDv6FEwr3OYMAtZxhB6iEMFSrnXPfn7MTN3I8=
X-Received: by 2002:ab0:4986:0:b0:414:4bb5:3e54 with SMTP id
 e6-20020ab04986000000b004144bb53e54mr6742748uad.121.1669231174806; Wed, 23
 Nov 2022 11:19:34 -0800 (PST)
MIME-Version: 1.0
References: <TYCP286MB2323873BBDF88020781FB986CA3B9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
 <TYCP286MB2323894F9939C27291FD998CCA0A9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
 <56393e84-485b-42ba-5fce-d4a0d0017653@amd.com>
In-Reply-To: <56393e84-485b-42ba-5fce-d4a0d0017653@amd.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 23 Nov 2022 11:19:24 -0800
Message-ID: <CANDhNCrKaa580Hb-w5GcGxo-h5xr9_GSq86JUSfR+meVLqiY1g@mail.gmail.com>
Subject: Re: [PATCH v4] dma-buf: fix racing conflict of dma_heap_add()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: benjamin.gaignard@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, afd@ti.com, linaro-mm-sig@lists.linaro.org,
 sspatil@android.com, Dawei Li <set_pte_at@outlook.com>, labbott@redhat.com,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 21, 2022 at 10:24 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Hi Dawei,
>
> from the technical description, coding style etc.. it looks clean to me,
> but I'm the completely wrong person to ask for a background check.
>
> I have a high level understanding of how dma-heaps work, but not a
> single line of this code is from me.
>
> Feel free to add my Acked-by, but Laura, John and others do you have any
> opinion?

No objection from me.
Thanks Dawei for submitting this improvement!

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
