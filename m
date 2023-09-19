Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 713847A5740
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 04:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B157010E140;
	Tue, 19 Sep 2023 02:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A263A10E093;
 Tue, 19 Sep 2023 02:12:37 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9a9d82d73f9so641139266b.3; 
 Mon, 18 Sep 2023 19:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695089556; x=1695694356; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=40NqUZgTce6juBv+5wOCuwqouQ4QSlT9XQeJDB/bLPI=;
 b=HoClTTVbnJ4iCt7zmpkzks5W9BwlrAJ1LbRBo+BbPnMxBjLWS37Ah9n0ZJeO3gRdG9
 NtDGnKhQ0EaC+u2mMte7yDjCShtEXr9LDtDLaDft6FrKn33sfaPW7ro7yK80Q7Nq/3ee
 6uWMK4YnEbjUbDsWGOBq2Lm7uLZFl2Y4AiiPFnO5uYMiaO1S+lHp6BgRVX6rk9GPWwTT
 XouNlNR5cwxLZ9Mz4XKSvqx8Od77aeXr0eef/IwBkc/wui/ipKpu41jrfLTtW0pQkBDd
 w8U0rIYbUxSFy0MvhtI6eZ+x4OYitZNm+UzBSqDpN3mXI3DZgjulwW3pSUs98xzXc7qn
 7gxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695089556; x=1695694356;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=40NqUZgTce6juBv+5wOCuwqouQ4QSlT9XQeJDB/bLPI=;
 b=lGbT2LXnNnYw8D7t+Z68h2H1xCJsvW79URVDmNHNxdjJQ3U1mWftkV03q/iZdkf/TE
 WzhMxBkBMpyK2RP0SFQu+eDNXvQO0HGhhoucDGGhsh01+rNPKXKVXplez5R7bNZbCWl5
 5ln/9+X0Y+N4eFZDys6KjgRp+hwx91WaJRcArbaKVlh5nVH6shyKpoHaFXKWqDFaLXi6
 cvXDjXGp8RI003GTuzBKhjzEdhVc8a3WfeW1YCXsYykMRiz0pvxo5vPryPT5LATNkk6c
 loOQV+dnYzyjf/40IT0BeABzEeLneoc2vQqWQRSAWGw8QH9kEQRG/6/2cDABp7yqvVxs
 srRw==
X-Gm-Message-State: AOJu0Yxz6ib46HoEEEhPDNaQ97piDWSHwNa8O3JBgnKDw57gfBYHAtUO
 BVQqljEVwuwx6fuf7dz3FDuTVhnRmdiJrpumfNk=
X-Google-Smtp-Source: AGHT+IHovgGWywuQrz9JuMTR3KuK5p0DftEIeDiu9firG24pkZrQ0WJl9g3PB7XZfMhFeU3sC3YMZlcFc/EQN/oL6no=
X-Received: by 2002:a17:906:8a4c:b0:9a1:c3ae:b014 with SMTP id
 gx12-20020a1709068a4c00b009a1c3aeb014mr7720042ejc.20.1695089556002; Mon, 18
 Sep 2023 19:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230916011501.15813-1-dakr@redhat.com>
In-Reply-To: <20230916011501.15813-1-dakr@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 19 Sep 2023 12:12:24 +1000
Message-ID: <CAPM=9tx3y22Q8LTz25j_UOebaXtNG2RTwiTFXdWAJmVChO6yMA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: fence: fix type cast warning in
 nouveau_fence_emit()
To: Danilo Krummrich <dakr@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 16 Sept 2023 at 11:15, Danilo Krummrich <dakr@redhat.com> wrote:
>
> Fix the following warning.
>
>   drivers/gpu/drm/nouveau/nouveau_fence.c:210:45: sparse: sparse:
>   incorrect type in initializer (different address spaces)
>   @@     expected struct nouveau_channel *chan
>   @@     got struct nouveau_channel [noderef] __rcu *channel

Reviewed-by: Dave Airlie <airlied@redhat.com>
>
> We're just about to emit the fence, there is nothing to protect against
> yet, hence it is safe to just cast __rcu away.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202309140340.BwKXzaDx-lkp@intel.com/
> Fixes: 978474dc8278 ("drm/nouveau: fence: fix undefined fence state after emit")
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index 61d9e70da9fd..ca762ea55413 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -207,7 +207,7 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
>  int
>  nouveau_fence_emit(struct nouveau_fence *fence)
>  {
> -       struct nouveau_channel *chan = fence->channel;
> +       struct nouveau_channel *chan = unrcu_pointer(fence->channel);
>         struct nouveau_fence_chan *fctx = chan->fence;
>         struct nouveau_fence_priv *priv = (void*)chan->drm->fence;
>         int ret;
> --
> 2.41.0
>
