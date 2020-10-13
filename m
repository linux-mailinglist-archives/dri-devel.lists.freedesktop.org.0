Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A9B28C914
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 09:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963B26E89B;
	Tue, 13 Oct 2020 07:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3837F6E047
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 02:09:12 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id z6so19547895qkz.4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 19:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JUaiZq94wnHDFKLOjrfv34l8lVrt5HtWQAYAaKuRdCQ=;
 b=c9XdWygFB28AWxQNyJJp21eGp3b4CZlMOk3j8zubam+5vzuvw9HS4bmGO2WYigpO3z
 F1/AFi0n9hGVN9JYv8fO2Bq9ng5zgkye57s9TbdW5L3mqeziraM3S+lisqGMnoI9UN2N
 l+5wlGcW9OSN/ixu+4NyzEe3H600CcPrJ5jPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JUaiZq94wnHDFKLOjrfv34l8lVrt5HtWQAYAaKuRdCQ=;
 b=NU5T4ViiXdryxssNZcJIUkr+kpRukuqGL6JhXMRfVOAcb7OOsy8bwoKsXkgfEoH8W9
 y26zlTmhPv2HnY147sU0Oy/NmSUuKdVSUZ4iJGl0X0MOV7FAfE4otHeh74NsdBneEXKy
 NbjLS4D1L9DSR4R0Vc2meCJq57oJ+BKbVB2aFrhZBrsMS7K45mGvIV16m7KqbAYo0Us8
 5uNR+lSwbWZGDla3pV8QQtFyNWUQ/JoWzq+v07NCNpx52eCAUEOjSDh3yzPB/zKhon7U
 KFOolcVEbmhmdKtmW28tynqC01i5TIg16cIcgx3TIOJkhijany2uYN5RLuD6vB9zujV6
 sL7A==
X-Gm-Message-State: AOAM531M/WlUJOlKKqtFmQyQD+o+aVPA6iDjDQ+qmUZ+Y1q1JqN2ajn1
 bCj72ruh9NZ8KhGUANroYIN3jO7UD3wcsE0blx9gGw==
X-Google-Smtp-Source: ABdhPJx4NaP+lP47L7QjXg3EhgVKzAirXzPA/xH9/7XolOdXD7VFPtHAAVwrcTnffcfk3i7/psHoH572kJSwrD73UPg=
X-Received: by 2002:a37:9d4c:: with SMTP id g73mr12575230qke.391.1602554951290; 
 Mon, 12 Oct 2020 19:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <20201012171826.76509-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201012171826.76509-1-andriy.shevchenko@linux.intel.com>
From: David Stevens <stevensd@chromium.org>
Date: Tue, 13 Oct 2020 11:08:57 +0900
Message-ID: <CAD=HUj5wxwW8X8JojqaiSUB68_b0AsoTG2WcrMJkH7Z-=6eLZg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/virtio: Use UUID API for importing the UUID
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailman-Approved-At: Tue, 13 Oct 2020 07:16:53 +0000
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: David Stevens <stevensd@chromium.org>

On Tue, Oct 13, 2020 at 2:18 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> There is import_uuid() function which imports u8 array to the uuid_t.
> Use it instead of open coding variant.
>
> This allows to hide the uuid_t internals.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_vq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index 07945ca238e2..8944cc0bf8eb 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -1129,7 +1129,7 @@ static void virtio_gpu_cmd_resource_uuid_cb(struct virtio_gpu_device *vgdev,
>
>         if (resp_type == VIRTIO_GPU_RESP_OK_RESOURCE_UUID &&
>             obj->uuid_state == UUID_INITIALIZING) {
> -               memcpy(&obj->uuid.b, resp->uuid, sizeof(obj->uuid.b));
> +               import_uuid(&obj->uuid, resp->uuid);
>                 obj->uuid_state = UUID_INITIALIZED;
>         } else {
>                 obj->uuid_state = UUID_INITIALIZATION_FAILED;
> --
> 2.28.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
