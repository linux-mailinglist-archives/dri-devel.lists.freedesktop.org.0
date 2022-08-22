Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 452C559B96A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 08:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2DB99FCB;
	Mon, 22 Aug 2022 06:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A7D99FBF
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 06:27:00 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id n7so11897042wrv.4
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Aug 2022 23:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=x++bE1pjYzfYlU3odBkUpb/i1+xvSrF4NUNGNx5H0s4=;
 b=Xqz8UUA9zy0aen3SLJGCQ7G4PS4JqwiKH/WZzvzBSbV0cFdC5GqsWj1zt+d+mHnxif
 2IeWhBkpjLc4oj5pzB+GJL4jFOLp8y7IliJDTz5voqjQiRmiQvP2lthWXn5miJn0lA1x
 PZNIxMquFKkl3AxkPBXY9gctYO8bWxCMf946mjg+vdY1KWu+F5zKx9cITiIwcrpQqhZ5
 2cPrKqNCrce/loQvJCCKvQ7/F9YiWPYDHAGfDNOWpOY2z2KQaodl75OOWUzkmKhhq3vm
 bHyh67yLtOhISNzMZ5wytybU7qJe1pCuAyz2iEzYraGSjJltgeOKqxzUHyQQ2+x6xw2X
 TS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=x++bE1pjYzfYlU3odBkUpb/i1+xvSrF4NUNGNx5H0s4=;
 b=RNKRTNQ0U4VpfOts7OdLVNwAAI9emYZM/EfvWQq2XtRrA7WUOB24XDoZA/Ow5x91vq
 jzQlAFZdlTXytiUUV5fjSd+seuhB7JACVbkjhXt4xwM9jVzwkch0UuJh9y8EFWRNHADi
 NrlA0vActMa+9iNERGkrU63Y9FmXhZiG+xD9WukpxFLGTZSnAR9TPkrL3SZmqnzScSri
 /lMb9qL6Yrn1B08VqIwBrtsxX7CC++TnDvuRm85xp0kXDP69zrsbFNQLRDoRePIaQSaY
 SJ63a/WjyUKoU9MBfrmT1pBPXQvptrTDG7Y96uwjYQD9wENFY2pE4JoGTE+4y3GpIDN5
 FuKA==
X-Gm-Message-State: ACgBeo0LBVafYUwmUu502FTuC4hqGqLDQpM+37AAbxo1JCX+b7wb+Gpe
 VTkY2dh84xOK7E5QzHXIIlxb48gr1LX29ZHlKjQ=
X-Google-Smtp-Source: AA6agR5y71xmCw+wPUEI851zceKW7Bk8tgjOGwB/DVf8K4XqI6D7owJ+MZW8DmE0FdFlhE+Eu3h6oBrh9EmMZzjt2Pc=
X-Received: by 2002:adf:f7ca:0:b0:225:2df0:d23 with SMTP id
 a10-20020adff7ca000000b002252df00d23mr9945901wrq.255.1661149618888; Sun, 21
 Aug 2022 23:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220802033142.31655-1-mpenttil@redhat.com>
 <b5ba847f-1e3c-6f8a-1400-b0085bb0811b@redhat.com>
In-Reply-To: <b5ba847f-1e3c-6f8a-1400-b0085bb0811b@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 22 Aug 2022 16:26:46 +1000
Message-ID: <CAPM=9tzKTuSQ==V9tyTdnqKgRJN0vq6uk7sMFR0Qiwyze4fMqg@mail.gmail.com>
Subject: Re: [PATCH] Prevent CPU deadlock with fbdev based consoles while
 printing scheduler warnings
To: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just adding Thomas in case he missed it.

Dave.

On Mon, 22 Aug 2022 at 15:41, Mika Penttil=C3=A4 <mpenttil@redhat.com> wrot=
e:
>
> Gentle ping, any concerns or suggestions on this topic or solution in gen=
eral?
>
> Thanks,
> Mika
>
>
> On 2.8.2022 6.31, mpenttil@redhat.com wrote:
>
> From: Mika Penttil=C3=A4 <mpenttil@redhat.com>
>
> With some fbdev based consoles, using the deferred_io mechanism and drm_f=
b_helper,
> there can be a call chain like:
>
> Backtrack:
>
> try_to_wake_up  <-- rq_lock taken
> __queue_work
> queue_work_on
> soft_cursor
> hide_cursor
> vt_console_print
> console_unlock
> vprintk_emit
> printk
> __warn_printk
> (cfs_rq_is_decayed -> SCHED_WARN_ON)
> __update_blocked_fair
> update_blocked_averages   <-- rq_lock taken
>
> Example producer is with qemu bochs virtio device (qemu stdvga),
> and drm bochs support in the guest.
>
> This can fixed be used using schedule_delayed_work() to get out of schedu=
ler context,
> if needed, while queueing the damage_work.
>
> Signed-off-by: Mika Penttil=C3=A4 <mpenttil@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 8 ++++----
>  include/drm/drm_fb_helper.h     | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_hel=
per.c
> index 5ad2b6a2778c..6449e8dc97f6 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -429,7 +429,7 @@ static int drm_fb_helper_damage_blit(struct drm_fb_he=
lper *fb_helper,
>  static void drm_fb_helper_damage_work(struct work_struct *work)
>  {
>   struct drm_fb_helper *helper =3D container_of(work, struct drm_fb_helpe=
r,
> -    damage_work);
> +    damage_work.work);
>   struct drm_device *dev =3D helper->dev;
>   struct drm_clip_rect *clip =3D &helper->damage_clip;
>   struct drm_clip_rect clip_copy;
> @@ -488,7 +488,7 @@ void drm_fb_helper_prepare(struct drm_device *dev, st=
ruct drm_fb_helper *helper,
>   INIT_LIST_HEAD(&helper->kernel_fb_list);
>   spin_lock_init(&helper->damage_lock);
>   INIT_WORK(&helper->resume_work, drm_fb_helper_resume_worker);
> - INIT_WORK(&helper->damage_work, drm_fb_helper_damage_work);
> + INIT_DELAYED_WORK(&helper->damage_work, drm_fb_helper_damage_work);
>   helper->damage_clip.x1 =3D helper->damage_clip.y1 =3D ~0;
>   mutex_init(&helper->lock);
>   helper->funcs =3D funcs;
> @@ -625,7 +625,7 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_help=
er)
>   return;
>
>   cancel_work_sync(&fb_helper->resume_work);
> - cancel_work_sync(&fb_helper->damage_work);
> + cancel_delayed_work_sync(&fb_helper->damage_work);
>
>   info =3D fb_helper->fbdev;
>   if (info) {
> @@ -677,7 +677,7 @@ static void drm_fb_helper_damage(struct fb_info *info=
, u32 x, u32 y,
>   clip->y2 =3D max_t(u32, clip->y2, y + height);
>   spin_unlock_irqrestore(&helper->damage_lock, flags);
>
> - schedule_work(&helper->damage_work);
> + schedule_delayed_work(&helper->damage_work, in_atomic() ? 1 : 0);
>  }
>
>  /* Convert memory region into area of scanlines and pixels per scanline =
*/
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 329607ca65c0..65a26d57d517 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -132,7 +132,7 @@ struct drm_fb_helper {
>   u32 pseudo_palette[17];
>   struct drm_clip_rect damage_clip;
>   spinlock_t damage_lock;
> - struct work_struct damage_work;
> + struct delayed_work damage_work;
>   struct work_struct resume_work;
>
>   /**
>
>
