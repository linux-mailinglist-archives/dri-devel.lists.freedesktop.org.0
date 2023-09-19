Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4B27A5745
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 04:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74ED10E394;
	Tue, 19 Sep 2023 02:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62CF10E1FC;
 Tue, 19 Sep 2023 02:13:52 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-523100882f2so6578304a12.2; 
 Mon, 18 Sep 2023 19:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695089631; x=1695694431; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8enow6g+/RJmfm+Tb3h+OWjZ+y5LOoFSVEtB17XBSXQ=;
 b=KoYqNB26NPDiWXhPeLqKAXhV0wKNjcohTxeQtzpSCcNqFiO4ELd00WPTuG4IzmJ9MX
 zNY1rA0r9QPMyNWgLkWkllhQqGNjhiS2Vt6ZBnVRXQkMLyMGrsz01B/u7oXTSEFZesW+
 odOzCaN9hSlPvw5vf38IStGC41muWFUj7IYtpOfbisAi3DNENUVOlNnEfrqWxbpr/+y0
 A2ECQCQAmbBkKWWHX/1/Y464I4tP4t12PfIpTyR+R3ce12bzavrm/TQZwyPfu5k1wzby
 /yfS3GlcQH01bGliN16GR5bUwdQnZVzLpPYYOlS5VBcT0wSlsYEZ9FcQivEQeoE6oOMA
 WhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695089631; x=1695694431;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8enow6g+/RJmfm+Tb3h+OWjZ+y5LOoFSVEtB17XBSXQ=;
 b=fRB2KUhyhcveEwNR9M5JzHntjuo4vbJ/VPLQ4CSivf+3Rhz32yPKVX8smadue+ruz/
 o16KUmzABw1h9imND+1eiXXTbhCuLdZK+AOlnYkJ7hSjRmSywGo9Pv1Sa+dR8voV9osJ
 fFhx0zW8TKZI0mFEdKV9DsVm4j1WlaZnX5lG6VUSKXfg/uPnLXVy/gMi8g5zmcKohD9z
 RvJ3oB7JQjBrXgH2qBd19tGLWcbNU+A7C6ixCjJtl647KxCdrkJEU32KtA3aLTcUJhYu
 Qkmx14tra3XBruQ1LBElH7JaZgeZz9x226fTHED1l3+dkzqvNlhgJ69WO+OUIWuutEF7
 QAhQ==
X-Gm-Message-State: AOJu0YxgS1+ocyYbIMEKbUPDu3ASNlqvJIvABMiKRHtSK+beDHuVVJwy
 n36EKYJ6vMDc4lDnqUPJ/BwReIbV+faKy7q5Mbf0a6X61BA=
X-Google-Smtp-Source: AGHT+IGje2NOLWZyBvTbOKFz2RQvOvf3tGEdMWOIivPGExiKqzKydUmMnill6Bh8Ml4MIQCJU1H6jPwjffcE6nLb3R4=
X-Received: by 2002:a17:906:101b:b0:9a1:f21e:cdff with SMTP id
 27-20020a170906101b00b009a1f21ecdffmr9585879ejm.23.1695089630839; Mon, 18 Sep
 2023 19:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230916162835.5719-1-dakr@redhat.com>
In-Reply-To: <20230916162835.5719-1-dakr@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 19 Sep 2023 12:13:39 +1000
Message-ID: <CAPM=9tz=-KE-CVJtDYtHQf8A_tXNZ4yoOj31reiDYob_MtaEXQ@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: sched: fix leaking memory of timedout job
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
Cc: nouveau@lists.freedesktop.org, kherbst@redhat.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 17 Sept 2023 at 02:28, Danilo Krummrich <dakr@redhat.com> wrote:
>
> Always stop and re-start the scheduler in order to let the scheduler
> free up the timedout job in case it got signaled. In case of exec jobs
> the job type specific callback will take care to signal all fences and
> tear down the channel.

Reviewed-by: Dave Airlie <airlied@redhat.com>
>
> Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_exec.c  |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c | 12 +++++++++---
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
> index 9c031d15fe0b..49d83ac9e036 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_exec.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
> @@ -185,7 +185,7 @@ nouveau_exec_job_timeout(struct nouveau_job *job)
>
>         nouveau_sched_entity_fini(job->entity);
>
> -       return DRM_GPU_SCHED_STAT_ENODEV;
> +       return DRM_GPU_SCHED_STAT_NOMINAL;
>  }
>
>  static struct nouveau_job_ops nouveau_exec_job_ops = {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index 88217185e0f3..3b7ea5221226 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -375,14 +375,20 @@ nouveau_sched_run_job(struct drm_sched_job *sched_job)
>  static enum drm_gpu_sched_stat
>  nouveau_sched_timedout_job(struct drm_sched_job *sched_job)
>  {
> +       struct drm_gpu_scheduler *sched = sched_job->sched;
>         struct nouveau_job *job = to_nouveau_job(sched_job);
> +       enum drm_gpu_sched_stat stat = DRM_GPU_SCHED_STAT_NOMINAL;
>
> -       NV_PRINTK(warn, job->cli, "Job timed out.\n");
> +       drm_sched_stop(sched, sched_job);
>
>         if (job->ops->timeout)
> -               return job->ops->timeout(job);
> +               stat = job->ops->timeout(job);
> +       else
> +               NV_PRINTK(warn, job->cli, "Generic job timeout.\n");
> +
> +       drm_sched_start(sched, true);
>
> -       return DRM_GPU_SCHED_STAT_ENODEV;
> +       return stat;
>  }
>
>  static void
> --
> 2.41.0
>
