Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 952AC60CD9C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 15:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7770A10E1DD;
	Tue, 25 Oct 2022 13:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C1010E1DD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 13:35:59 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id s206so769719oie.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 06:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J70jijssEagDP3Vhwq363Yf98xAsG6U4OeAwP38Jv4o=;
 b=GRM2bHAxIoDmgZAsAtSuq7CsCgHocptOR32YNFgMcPiMhssB2d1u14v86pZeQelbru
 p/o1WBr86IWnAzd2FGcVDB0ko8vewc6pzhNpL1PHDo4aM1qihFpIoolnmL5n8Lu3JYS9
 BuG5896I96BPIuCfJB7F8mn2iQOGEWgQYrknk+hKMM5fCFhx/f0IN2UfPWtD40qTCqVb
 FuGpuE6cuCYHckn2cW82YgU12vZRnUmY1V6bc5/fmUgBmsT5YTKacmnUhmk0Q1u1oboz
 H4anNk9inuu9P2iDap/jFU8scVl8qnBr48kKMye/QOqoFAzRBaAwsY1BuW4HGQ4Itom0
 +jdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J70jijssEagDP3Vhwq363Yf98xAsG6U4OeAwP38Jv4o=;
 b=3mTMzAuWF6WQYxpb2oHOSK6ti2XFLVCy2nNX9fF4jHXOsRz1guBEYJjUM3Fj4+Cvxb
 MiIkG+S4XSj0FWX/eZjwA3EzT8BG6DzCk6q58q79VHrOgMN8mtvicigbtvrGwBAE2AYI
 UYh/3Ax8IqSLqDbbdAiTol7Lta6f1qkO55VdaWvsPGx+YqFBNdq1Iy83DXUp64cR+8j3
 NrHhPS7fNfNBOPjcVkKrzLGhq3USDTgXhdnAC8L/UMbDEuzUhaCleARD3XTBYXUzRN19
 LGOlzP15O9YakeOIV8fzw4JJaV+BhZpfpMbDfMG6LQ7ZiUOQZhH+tIErU6yYv0mnVUFG
 eGZQ==
X-Gm-Message-State: ACrzQf2rKzG9U1tu5B3zs/EyKSsI86SG3zdoNpMT1EJ1jpvJLpz6V8PP
 g0XJ5qVOUgwVhB6iT2ktUQkB5vgWDu4ziFJlQXE=
X-Google-Smtp-Source: AMsMyM6Ga/lqz4/aonDFqi5BhAicY7+pmSj/4v47bJ54+lZaseAtPF6bP0fGOXyplhBA/+wKPSmFsSNxBrq0Jvd3lgI=
X-Received: by 2002:a05:6808:14d2:b0:354:c733:abd3 with SMTP id
 f18-20020a05680814d200b00354c733abd3mr19023263oiw.96.1666704959289; Tue, 25
 Oct 2022 06:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221025061846.447975-1-brolerliew@gmail.com>
In-Reply-To: <20221025061846.447975-1-brolerliew@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 Oct 2022 09:35:48 -0400
Message-ID: <CADnq5_NweAo-7snRLkidNkOizu7Ft+7GgXCS2Rnv1oxmRFb_RQ@mail.gmail.com>
Subject: Re: [PATCH] drm/scheduler: set current_entity to next when remove
 from rq
To: brolerliew <brolerliew@gmail.com>, "Tuikov, Luben" <Luben.Tuikov@amd.com>
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Luben

On Tue, Oct 25, 2022 at 2:55 AM brolerliew <brolerliew@gmail.com> wrote:
>
> When entity move from one rq to another, current_entity will be set to NULL
> if it is the moving entity. This make entities close to rq head got
> selected more frequently, especially when doing load balance between
> multiple drm_gpu_scheduler.
>
> Make current_entity to next when removing from rq.
>
> Signed-off-by: brolerliew <brolerliew@gmail.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 2fab218d7082..00b22cc50f08 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -168,10 +168,11 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>         spin_lock(&rq->lock);
>
>         atomic_dec(rq->sched->score);
> -       list_del_init(&entity->list);
>
>         if (rq->current_entity == entity)
> -               rq->current_entity = NULL;
> +               rq->current_entity = list_next_entry(entity, list);
> +
> +       list_del_init(&entity->list);
>
>         if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>                 drm_sched_rq_remove_fifo_locked(entity);
> --
> 2.34.1
>
