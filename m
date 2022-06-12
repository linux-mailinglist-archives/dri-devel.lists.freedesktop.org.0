Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CA9547872
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jun 2022 06:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8706A10E2B1;
	Sun, 12 Jun 2022 04:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8F710E2B1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 04:11:22 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id fu3so5115710ejc.7
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 21:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZSnySfFVFF1WlkzCsM8N2GrUnx5OLR53QsPe7K3hn/4=;
 b=fAFtXxKAtah80tBf6iqAqB5bsHRSCOqHvagsu0WUhkIfnkkLJ6E+fvFABl1dX0xmKY
 5R4R41LgzbxN32GIYKtRmquaRu9cZJYlpZ9wP16aRfYt2hHgYUkJzm6uq13FvH2Vi5Rh
 Ij8VIVS8uWX7CHjV5oQ9zqSql+oAdfKsZKlkC7ZgOu+wCph54lkwIrTdsitbrrtrhOaT
 y7hwXMaLkHT6TQ8gxK3TKnAsBmTvjfNd4DKeXSwcFV7FB7Ib+QReLTGvWWANz+bZVcL8
 FBk0bGF4f7lYEYsr8CHHLzQlfY9rdgOGxMQEHnHS2ACmAf3EiBrvJJhUzINJ6tWjdZZA
 IHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZSnySfFVFF1WlkzCsM8N2GrUnx5OLR53QsPe7K3hn/4=;
 b=SbygJr7lY4D67mM/X7NspAtW22CqnBr/Ssed0WitHcWFehOUCQZpHJpdxhPntLK4Bv
 PORWwojixRLPp7TDQR56RnOXuly1K2jwMwZtUMlLopdzNkA0ePzWmllmeV0P6t/1iTzm
 u+B+jkJ4lbbuu1kw1+ncf453tb/xesGRyvtnTG72jN2Pmi6woTa3UeCKB4GUahB30tpT
 Ysxe30d4lCn0fgZZVp+XqoOmqaA5Vw8n7NzWtDOrYCUC3i33wQ3ivv5+8WRpU7U5hFkd
 si7+XQ+hioojmNJ27yIMipxFngTTgAHczNkl/5zwqHSJbsTe+ngAOEVOub1QEmeKCBF/
 l4Kg==
X-Gm-Message-State: AOAM530IX4uenTFwP4kghpB6YdDNkXM0Mx8YfChpDceuts9Yesbgmkgv
 WxF3iYB7HHSrCVqD9cOQ4HJ/OqlJiEHowhRPxR0=
X-Google-Smtp-Source: ABdhPJzC1phMjHFmG6iCLs810bJS0tkmxtQPRW62lh5ZaTSCky8H7TCW5DuzbjLEndxFENtSnFsPBR+b3jkM58QMp0g=
X-Received: by 2002:a17:906:f51:b0:6fe:cf1c:cdbf with SMTP id
 h17-20020a1709060f5100b006fecf1ccdbfmr46593552ejj.695.1655007080806; Sat, 11
 Jun 2022 21:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220602104223.54527-1-linmq006@gmail.com>
In-Reply-To: <20220602104223.54527-1-linmq006@gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Sat, 11 Jun 2022 21:11:09 -0700
Message-ID: <CAPaKu7She7neKq8c7G1hH4+To=y26dvZ0kP4BfJ4FghFRf+KqA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/virtio: Fix NULL vs IS_ERR checking in
 virtio_gpu_object_shmem_init
To: Miaoqian Lin <linmq006@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
 NET AND BLOCK DRIVERS" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 2, 2022 at 3:42 AM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> Since drm_prime_pages_to_sg() function return error pointers.
> The drm_gem_shmem_get_sg_table() function returns error pointers too.
> Using IS_ERR() to check the return value to fix this.
>
> Fixes: 2f2aa13724d5 ("drm/virtio: move virtio_gpu_mem_entry initialization to new function")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
> changes in v2:
> - Update Fixes tag.
> - rebase the working tree.
> v1 Link: https://lore.kernel.org/all/20211222072649.18169-1-linmq006@gmail.com/
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
