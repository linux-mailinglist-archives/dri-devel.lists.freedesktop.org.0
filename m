Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D0C54029B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 17:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BDA10E236;
	Tue,  7 Jun 2022 15:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317E910E25F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 15:39:55 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id h18so12560517qvj.11
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 08:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xr4dhCfuSdEr2WcWiYRbEtXrj+jlCFWCiFgRYjOI+Uc=;
 b=zR+xtsgJ7G+nQWsuYa6k/ouh729YUTTDJBzipWtz9ukuJpMGaeqMVf9/jok5oWpmvX
 YAzp0z9zSbazae95tjtxp+y4Vnlf4xBnLRh5rVDm/43851H+pwhEYwY7WURjBSmTJPm9
 tJfYt1Ehw/6luGRjwLQN98v46Py2YABHohs35P8/7A8ZFcKy9Q8pVwSXgcS6Aunbmo1H
 R5iXA6vqA9buEW5D/hpkUVfbZvayZUQV9s5dgyOEp+BtWcn/HJrrEZ0XEAD0c8y2RMdY
 F44d87V25qja1/4yPakraXZ/qTXDpvQFSNZzxxpxqPflN5Q9sCHh8m7oXvomgJQUb2vs
 45mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xr4dhCfuSdEr2WcWiYRbEtXrj+jlCFWCiFgRYjOI+Uc=;
 b=Z9y2683XHOex/QokO1CfnyXgkexWrgrrYFjtB7+MGZ9YlvBlAGPCFXsmeMWwDsv2rb
 sLYxXhmUn8pRXN9mU1d7CWcxTC0Jc6FOyPqc0TPYpGzq2sXLROYLevlcYWGEfhfnuyof
 GZ/nG9jphX5vO1qAAPDC71bgNL9F/3MTmazCK1DC6QpN6vufq/gK2k2mCHaqJHAh9aQV
 dNZq0hdpfRJo3GHJU6b4+Fs9ApEmgKpGxMqn4Sj/+hISW2eLAS4/1fCRN1z59N6EqjR0
 528WhfeAzoAUl+oWJ/wO+fP+/qXj0c73uRQIYdDI0bBsW+ezswQBVrGSlQmyYilXNk+s
 0tEg==
X-Gm-Message-State: AOAM533sw4e6F9oKlg93TKuF9HO23UrflBycDfD6PyVN/DiNRJDAEibP
 90bi/uaLO0K+pd1oAaWQ5Wld3wmqvqWCek4WQeb/Lg==
X-Google-Smtp-Source: ABdhPJy03x7T/95dDtPpCaHNjzfEcVjlYBBdheV4q9h21nNZHKPRkMbcYwtcf2LWNvzyM9zxVElpH3U8pvu3bg0PTMc=
X-Received: by 2002:a05:6214:5488:b0:46b:b272:f7d1 with SMTP id
 lg8-20020a056214548800b0046bb272f7d1mr4833597qvb.73.1654616394183; Tue, 07
 Jun 2022 08:39:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220607110841.53889-1-linmq006@gmail.com>
In-Reply-To: <20220607110841.53889-1-linmq006@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 Jun 2022 18:39:42 +0300
Message-ID: <CAA8EJpo0f_F8kuc617UK0ovmiWvUAN+KBkViV-TPQdbt001drg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp4: Fix refcount leak in mdp4_modeset_init_intf
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
Cc: Guo Zhengkui <guozhengkui@vivo.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Heidelberg <david@ixit.cz>,
 Stephen Boyd <swboyd@chromium.org>, Xu Wang <vulab@iscas.ac.cn>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 7 Jun 2022 at 14:08, Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_graph_get_remote_node() returns remote device node pointer with
> refcount incremented, we should use of_node_put() on it
> when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: 86418f90a4c1 ("drm: convert drivers to use of_graph_get_remote_node")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry
