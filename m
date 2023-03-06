Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1886ACD0A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 19:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E32010E1D4;
	Mon,  6 Mar 2023 18:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D8510E1D4;
 Mon,  6 Mar 2023 18:50:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3091261120;
 Mon,  6 Mar 2023 18:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9290AC433D2;
 Mon,  6 Mar 2023 18:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678128609;
 bh=cw4MV8nhP9uMJq9CJ23NV3cgqudora4kWu/txjBsI3k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cEkmOOnvXhLbLazXfIZ00/n4XYJnPZnWq1w2GHKk1uIpn+Mwc9PPSKJbd+m2IJ60c
 O0+G7jl0UwS98d2baFNreCyo9aasoZL6qKchMJrWErwuvw9HBjiZDBwZ1RALz/aAnw
 4BU1s7YxLnf5OJwvBbiMXeuuuW0Iucf0IO2DU49niWv/a+nkiwa1pAzOu+n53m9kyK
 9om1eppN8gMxzZRDv2U9pG5zk7LgjpvG47wteJjoobixg8NwGoKHS5Ar1wtuO5Y2Gw
 LOoCJeFCNitd8ougwLHSBXX2InwFOHmts663hcple2ggafGFU8nH7Rt0z4sh1ac/40
 Dy7nCunhc+j/Q==
Received: by mail-ed1-f41.google.com with SMTP id o12so42723142edb.9;
 Mon, 06 Mar 2023 10:50:09 -0800 (PST)
X-Gm-Message-State: AO0yUKUcH4C7KG/Qg9fhQh2/lb9LIt5708xXBzDDHqeK6QL8ejf+fhTl
 fA5S4OJEhb454RDaDDzH3J5IlgawdM8LH6D/3d8=
X-Google-Smtp-Source: AK7set+UaPbEynbBrh3UGSmnCiCaBv5SW96OSLxKRVIp5XxUSeUCjpli5uTzFJE3TrT+rpVXfDhirUviv4fr07TrXDs=
X-Received: by 2002:a50:d581:0:b0:4bf:7914:98c5 with SMTP id
 v1-20020a50d581000000b004bf791498c5mr6451214edi.4.1678128607845; Mon, 06 Mar
 2023 10:50:07 -0800 (PST)
MIME-Version: 1.0
References: <20220904214134.408619-1-jim.cromie@gmail.com>
 <20220904214134.408619-33-jim.cromie@gmail.com>
In-Reply-To: <20220904214134.408619-33-jim.cromie@gmail.com>
From: Timur Tabi <timur@kernel.org>
Date: Mon, 6 Mar 2023 12:49:30 -0600
X-Gmail-Original-Message-ID: <CAOZdJXXHGW1iceWgB47wSUhG_hYA48JWtOPRrVRnL-EvRCxhBA@mail.gmail.com>
Message-ID: <CAOZdJXXHGW1iceWgB47wSUhG_hYA48JWtOPRrVRnL-EvRCxhBA@mail.gmail.com>
Subject: Re: [PATCH v6 32/57] nouveau: adapt NV_DEBUG,
 NV_ATOMIC to use DRM.debug
To: Jim Cromie <jim.cromie@gmail.com>
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
Cc: gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 linux@rasmusvillemoes.dk, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, jbaron@akamai.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch, joe@perches.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 4, 2022 at 4:48 PM Jim Cromie <jim.cromie@gmail.com> wrote:
>
> These 2 macros used drm_debug_enabled() on DRM_UT_{DRIVER,ATOMIC}
> respectively, replace those with drm_dbg_##cat invocations.
>
> this results in new class'd prdbg callsites:
>
> :#> grep nouveau /proc/dynamic_debug/control | grep class | wc
>     116    1130   15584
> :#> grep nouveau /proc/dynamic_debug/control | grep class | grep DRIVER | wc
>      74     704    9709
> :#> grep nouveau /proc/dynamic_debug/control | grep class | grep ATOMIC | wc
>      31     307    4237
> :#> grep nouveau /proc/dynamic_debug/control | grep class | grep KMS | wc
>      11     119    1638
>
> the KMS entries are due to existing uses of drm_dbg_kms().
>
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

Has this patch set been forgotten?  It was posted six months ago and
there's no sign that it was picked up.

The changes to drm_debug_enabled have impacted NV_DEBUG and NV_ATOMIC
and something needs to be fixed.  I posted a simpler patch a few weeks
ago, but maybe Jim's is better.
