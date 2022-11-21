Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1919632136
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 12:49:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C2410E179;
	Mon, 21 Nov 2022 11:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CABD10E179
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 11:49:40 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id 8so7800320qka.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 03:49:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4lbzYkmJhxm5C+/5IVFkRr+sFHYjfyy9aJrVSznookE=;
 b=53HrN/1Rlgy/62DhpleHwNQ+6aRuy4pLQ47kDc8PVKuAvAIKva9mDE/vSOVuoT5SEQ
 dj8eT5iF8WJpo5h5naahnbeTNcF/0frMOvUv32+Y4HogmF1075BxcwTaDa2EfMqIN/xE
 pCyyPTARW/1ZVtakKGssqI0q0qtIiBwrXDDioIn4vbUAXsY5CSmdfQJKNhjZFG65c8y7
 k3A/T6SL07C/WTX94OrTWpafHY9U0p1Yj85IlwnEq37qrxa6xn7QLis2TQ+7zBvrB8PJ
 XUDEf5I00yAzLTLgbuXf25RwHBBLJzWR6E6algXg0m/xavXDaMgqIkTtraL19LGzD5P3
 lxyA==
X-Gm-Message-State: ANoB5pkPFbzWtUSWkRGLjF2neblGN1VoX0Cp0i64+2VYzQLnKwcwpyL5
 kG3KlAVuvCf0uYDKOlYdmPoaJcmFujivBlFmANM=
X-Google-Smtp-Source: AA0mqf46epIs+NcHJYD6sFzeJoDiCU0QUrd8rQyiq1r2eQjiNS7/0XOCN53oHWUTPo5MxqAfEsJksRoUxCgj+R4BG3Y=
X-Received: by 2002:a05:620a:4611:b0:6fa:af7e:927c with SMTP id
 br17-20020a05620a461100b006faaf7e927cmr15551057qkb.443.1669031379745; Mon, 21
 Nov 2022 03:49:39 -0800 (PST)
MIME-Version: 1.0
References: <20221121094649.1556002-1-gregkh@linuxfoundation.org>
 <20221121094649.1556002-3-gregkh@linuxfoundation.org>
In-Reply-To: <20221121094649.1556002-3-gregkh@linuxfoundation.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 21 Nov 2022 12:49:25 +0100
Message-ID: <CAJZ5v0j=HLEdKUhHjWGd8NTNLYW4n1q4OAKer-EZSufgX0ujeQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] kobject: kset_uevent_ops: make filter() callback take
 a const *
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 21, 2022 at 10:47 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> The filter() callback in struct kset_uevent_ops does not modify the
> kobject passed into it, so make the pointer const to enforce this
> restriction.  When doing so, fix up all existing filter() callbacks to
> have the correct signature to preserve the build.
>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Rafael J. Wysocki <rafael@kernel.org>

> ---
>  drivers/base/bus.c                    | 2 +-
>  drivers/base/core.c                   | 4 ++--
>  drivers/dma-buf/dma-buf-sysfs-stats.c | 2 +-
>  include/linux/kobject.h               | 2 +-
>  kernel/params.c                       | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/base/bus.c b/drivers/base/bus.c
> index 7ca47e5b3c1f..4ec6dbab73be 100644
> --- a/drivers/base/bus.c
> +++ b/drivers/base/bus.c
> @@ -163,7 +163,7 @@ static struct kobj_type bus_ktype =3D {
>         .release        =3D bus_release,
>  };
>
> -static int bus_uevent_filter(struct kobject *kobj)
> +static int bus_uevent_filter(const struct kobject *kobj)
>  {
>         const struct kobj_type *ktype =3D get_ktype(kobj);
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index a79b99ecf4d8..005a2b092f3e 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -2362,12 +2362,12 @@ static struct kobj_type device_ktype =3D {
>  };
>
>
> -static int dev_uevent_filter(struct kobject *kobj)
> +static int dev_uevent_filter(const struct kobject *kobj)
>  {
>         const struct kobj_type *ktype =3D get_ktype(kobj);
>
>         if (ktype =3D=3D &device_ktype) {
> -               struct device *dev =3D kobj_to_dev(kobj);
> +               const struct device *dev =3D kobj_to_dev(kobj);
>                 if (dev->bus)
>                         return 1;
>                 if (dev->class)
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-=
buf-sysfs-stats.c
> index 2bba0babcb62..f69d68122b9b 100644
> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> @@ -132,7 +132,7 @@ void dma_buf_stats_teardown(struct dma_buf *dmabuf)
>
>
>  /* Statistics files do not need to send uevents. */
> -static int dmabuf_sysfs_uevent_filter(struct kobject *kobj)
> +static int dmabuf_sysfs_uevent_filter(const struct kobject *kobj)
>  {
>         return 0;
>  }
> diff --git a/include/linux/kobject.h b/include/linux/kobject.h
> index 5a2d58e10bf5..640f59d4b3de 100644
> --- a/include/linux/kobject.h
> +++ b/include/linux/kobject.h
> @@ -135,7 +135,7 @@ struct kobj_uevent_env {
>  };
>
>  struct kset_uevent_ops {
> -       int (* const filter)(struct kobject *kobj);
> +       int (* const filter)(const struct kobject *kobj);
>         const char *(* const name)(struct kobject *kobj);
>         int (* const uevent)(struct kobject *kobj, struct kobj_uevent_env=
 *env);
>  };
> diff --git a/kernel/params.c b/kernel/params.c
> index 5b92310425c5..d2237209ceda 100644
> --- a/kernel/params.c
> +++ b/kernel/params.c
> @@ -926,7 +926,7 @@ static const struct sysfs_ops module_sysfs_ops =3D {
>         .store =3D module_attr_store,
>  };
>
> -static int uevent_filter(struct kobject *kobj)
> +static int uevent_filter(const struct kobject *kobj)
>  {
>         const struct kobj_type *ktype =3D get_ktype(kobj);
>
> --
> 2.38.1
>
