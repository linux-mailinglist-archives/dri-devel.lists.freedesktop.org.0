Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 486FDCB7609
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 00:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D4810E309;
	Thu, 11 Dec 2025 23:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="4f2jPPmc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3592B10E309
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 23:25:33 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4779a4fb9bfso91675e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 15:25:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765495532; cv=none;
 d=google.com; s=arc-20240605;
 b=Vq4cz0MyKDSA5vLYKJXzwhKnDrZOuWL3qisDoFHaR/qikr9YA6i02p0jkW+oAfq0tw
 bW/izzJcOzIfJyhRYYvJP1/lNfjqP4YHlEDaQ+FS4v8zwl8JkcUPC3kx1d97cb4hb7UZ
 Wr2nlU/PefurN/Md7eTC2aHB7e6DaAyOSXgJMBYZrruiayvR5iTvImbOS3Jq4vzUEjnB
 KAWqXZw2690r8iaLQZHES45G21nnsCPqhGqqlunWlNVrHHETYV7rgVJX4e5lZkkbVi6a
 VsZehCJ7gorQOnQX+NsiFUdse6Eo1uqUN/JRnpJkbMC7fvr75Vhu32Xw+SvYruCBRS9V
 0+9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=NgAS2i+WuabPCqxlCGTGd0RyAlQOwBDUG294JndQ1+g=;
 fh=UEI6k29Bus18axwlBSoYTmS27DeZBiMDTLGkAq6pnfk=;
 b=SoRLImSdudH8g2i9Txnpm3cWeuKYdqVBUNGoaZM0U6e+SP3rF7mLoKsQjc31ytq9Z0
 iZK7puPNU4TuILIwAwXDFS6x/LU+/ygcLQvPTBYIJ6iGv62qqd01q+WVpQNfOpYqm1hT
 3aHA6MfBs8jCX+UGwoDzYtnoH/vnlw1oRogmrqrB7FlKb7StxG2Ed/MK/UahgC+/n+xo
 bur0nwvVLXXzludrGaZ3rbC/hi15cxNladugMaGRBi2GSoM926s8MXd9RHApSN8tq1dW
 p+VCxczv/yD1Wn8Qv/f8TJxsDe1ScV0iDMmhm9BufdHdu5zwSYFRhWlilge3vXdXzNr9
 pGWQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1765495532; x=1766100332;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NgAS2i+WuabPCqxlCGTGd0RyAlQOwBDUG294JndQ1+g=;
 b=4f2jPPmcCb3ZBPCvq+0DKfgi90IhCnN22dYPvQLhwWTB1ArymDxEVyGF9Jpc7NgaZW
 hU0NNXP/9PkaM4fpOEpI7UuFxOupjH+QzsV7CNPHU6S0hT2jhfrTKcAUijB17yYSHJHA
 OR1gV+diTVQ7Zk4q7MSyQBQxzufLt+0PLPvqCJhRF3SyIDz55LvXk9yNh+l1ganmnUmr
 P5dEvCe4DB3wSBRgHV7Gtes8/NplBM1PgQo7HXV2k40ou54wqpGHnO262EIT3hfA8jCt
 CkOWtuivgrtN7G6lu26Z7K1Y9rAe+1BlismLam57KcBk7vdAWlvrrpiRdDOXOh0079Nb
 vCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765495532; x=1766100332;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NgAS2i+WuabPCqxlCGTGd0RyAlQOwBDUG294JndQ1+g=;
 b=tV3fv0fgqI4H9O8kYRgpuGEEPq7z5ux79wWcviS8bnrHxfxobT8Ybxo9Gy4bdC8PhD
 EQqss8OCNFTVcmyGwB1c4aEchbsGjlkJlqMy2dUaitIfw01HEuONFSdBmj2bayjUOmpE
 b+vLfZWJBOzW0CiZ4ebINTqk/6gb/WDUY9e9iIKXxDmxv63RcUcADOsVTcnDSq8cvO/u
 xX7KEkJsLYpxkHIZvusRmPVn7EHlqgQHbFaRxi4lbxXtqMXCvjzXGwKmOG8JHK0IkVmk
 afd7ehQtRzAXjykZ0VAXOGGJXlzFdqYmjIsIKaY20bZ7hRk+zfenyglZ97ECdScgaf6o
 LFrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOHyQ0r/eGp/j8eA5nOnST84fz/qxuj7PUMgbpr4dyXU5hodsr3mGoTynqV7Vfjkps09cbENBSf/4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXQmhv0jfWXYmC8VnfFayYuTyl0t1StwtcbgOOCiYN2zctqFQV
 TH/eknlG+XT/NJl12Oid1y+9BqKg12+lSn1Uln/nGc0kOEiXuE1xfk7ESSFrA39aMwHlkZGHMqf
 ovRNzamFvq2I0fhYGhihyq0eztGqOqYJRfOCz3bZq
X-Gm-Gg: AY/fxX5qolzuyYsqJe3hy79jnVfAFezMdkBA8oExV6wrgpyoJ6IUB5IYpNWyqCE6Pcg
 tTcxIP1b9sS6POLV2ovK3z+TX4Ke6VTEy2e6lceQnLQHG2R1MfBcSqHnxz2mAtW8prKhf5/ztjO
 R1lbEi4JFXeg8NngxRS3X1xDUYXGkWZmg63Uya0a4X4+Hv3gf6tycT7iEyjtpNGiAOTVqan0wv6
 mpWTFzMwR4JdxnHWD/kVYKk6V7TdwM451IR3ahSD/NBZ2EVafuSTA0tvN5Apz9+Vg1GdfYx7Eee
 cUS3F5Gv4xSw4nZOrRivQCtcpAqO
X-Google-Smtp-Source: AGHT+IELsxBEvLr9lhxQI6U6yiPfylzFjjXDhgwGFlEHLwYN/fZlRQWWLcQMcMN3K4irAeygHhzmk1gxOJpHCOinQXk=
X-Received: by 2002:a05:600c:4f0e:b0:477:772e:9b76 with SMTP id
 5b1f17b1804b1-47a8980f35amr1528645e9.7.1765495531556; Thu, 11 Dec 2025
 15:25:31 -0800 (PST)
MIME-Version: 1.0
References: <20251211193106.755485-2-echanude@redhat.com>
In-Reply-To: <20251211193106.755485-2-echanude@redhat.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 12 Dec 2025 08:25:19 +0900
X-Gm-Features: AQt7F2pSTNWKDsucwV-uysbrv-q3tz8hqRtbVQ0Nrt24_BZVepbEChaAJPcQzz0
Message-ID: <CABdmKX2MPhw121ZG8V+f-XoOReUsCdmcug-cWDg=3WZcJ=NHHA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
To: Eric Chanudet <echanude@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, Christian Koenig <christian.koenig@amd.com>, 
 Maxime Ripard <mripard@redhat.com>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, 
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 12, 2025 at 4:31=E2=80=AFAM Eric Chanudet <echanude@redhat.com>=
 wrote:
>
> The system dma-buf heap lets userspace allocate buffers from the page
> allocator. However, these allocations are not accounted for in memcg,
> allowing processes to escape limits that may be configured.
>
> Pass the __GFP_ACCOUNT for our allocations to account them into memcg.

We had a discussion just last night in the MM track at LPC about how
shared memory accounted in memcg is pretty broken. Without a way to
identify (and possibly transfer) ownership of a shared buffer, this
makes the accounting of shared memory, and zombie memcg problems
worse. :\

>
> Userspace components using the system heap can be constrained with, e.g:
>   systemd-run --user --scope -p MemoryMax=3D10M ...
>
> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> ---
>  drivers/dma-buf/heaps/system_heap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/=
system_heap.c
> index 4c782fe33fd4..c91fcdff4b77 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -38,10 +38,10 @@ struct dma_heap_attachment {
>         bool mapped;
>  };
>
> -#define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO)
> +#define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO | __GFP_ACCOUNT)
>  #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
>                                 | __GFP_NORETRY) & ~__GFP_RECLAIM) \
> -                               | __GFP_COMP)
> +                               | __GFP_COMP | __GFP_ACCOUNT)
>  static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDE=
R_GFP};
>  /*
>   * The selection of the orders used for allocation (1MB, 64K, 4K) is des=
igned
> --
> 2.52.0
>
