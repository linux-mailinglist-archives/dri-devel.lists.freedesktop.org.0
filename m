Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EF04DEA57
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 20:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD8A10ECDA;
	Sat, 19 Mar 2022 19:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E2910E92D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 09:03:36 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id
 mm4-20020a17090b358400b001c68e836fa6so3387428pjb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 02:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=odQm7JC7x6Af6z1xpDrwW1/gihmZD1Kc4UPnG+M8gbk=;
 b=Eadxx9IjG5BtCfRNZOsVfpiUvgX+GSL8Aib5ZyUV9lgIHPkzS++xIEPd8SQvD7dr4O
 lRMCKC3+HcqKnSO+owRwtnjwu+Szmu/11TRJ3PrQzIq5zE1TNLmIreTHFWMS5JFJw8+O
 paZrWzVmW1F4FOVuOGfDieu2E/8E8KMDToCKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=odQm7JC7x6Af6z1xpDrwW1/gihmZD1Kc4UPnG+M8gbk=;
 b=tdEdsLYodjEfDNL1h38IDh9UliC4/fWsg95A8YCMl5jdGt2zoGWeqRg0Ug09QJYMBP
 b5j6bZPeRSDuJbCmVdN2bhl21R/VbZZCwbGHjoBKrcgsTV89xiTovTlLJpmChvEsDTIE
 gNyiB5IcM9qNPl2K0QLo815w4QVPxhSR8fFLI2ETz7dllD+e1Tt8+Sr4oJ71+vJi4obz
 +ksnlwLe4GPabznVplYRSyqlLotAtP+gf3e/8Xe72iWQmHDSRAEeJCE9EGHEwbwLC76E
 t8pS+pBhoNZJ5P9imoRyc02Uo1WpCek490s/2ihQLFBHhMuCidjg85eYAhaGatGYovnT
 or6g==
X-Gm-Message-State: AOAM533CARD9QPz0MKSUJL058cMRwxKGKXi7/tWy1Ht4D0lceZxKsCdG
 AuvTp6oTBCdNAzuJ2iR3oMoS2oxhBNOoiLcT27FjnQ==
X-Google-Smtp-Source: ABdhPJypgGRBlo6a3uR28YkQzfvVWixDNkdtCp94bBE7F/dwhU59fOqpvNDP+GJghMH+n/vIuAJsfN6r7kejo1jOdfM=
X-Received: by 2002:a17:90b:4c08:b0:1c6:40e4:776c with SMTP id
 na8-20020a17090b4c0800b001c640e4776cmr9989598pjb.237.1647594215955; Fri, 18
 Mar 2022 02:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-18-granquet@baylibre.com>
In-Reply-To: <20220218145437.18563-18-granquet@baylibre.com>
From: Wei-Shun Chang <weishunc@chromium.org>
Date: Fri, 18 Mar 2022 17:03:24 +0800
Message-ID: <CAPrDo5ht246dgPJmJBx7Xc6e1kqdw54C1eDDqMA347ZwRtAO7w@mail.gmail.com>
Subject: Re: [PATCH v8 17/19] drm/mediatek: add hpd debounce
To: Guillaume Ranquet <granquet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 19 Mar 2022 19:14:45 +0000
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
Cc: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, deller@gmx.de,
 kishon@ti.com, chunkuang.hu@kernel.org, jitao.shi@mediatek.com,
 tzimmermann@suse.de, chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 18, 2022 at 4:49 PM Guillaume Ranquet <granquet@baylibre.com> wrote:
>
> From: Jitao Shi <jitao.shi@mediatek.com>
>
> Implement the DP HDP debounce described in DP 1.4a 3.3.
>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

Agree with Rex. The code is fine but I suggest including Rex's info in
the commit message for clarity.
