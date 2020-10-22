Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F4729645D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 20:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D89E6F530;
	Thu, 22 Oct 2020 18:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD396F530
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 18:04:56 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id n18so1406474vsl.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 11:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F2WaCG/dYdFJ11nkOsm0t4JOBwXNWT6cncqbDXaSdgI=;
 b=WyjnS6wtHQLvvwWf5He9VL7I30FI6EAvHaqnfRNSZgQ76mTHUsLYonySZ6KB991J2O
 WZRXKcOkIsCVh4Ug8RkZTY2d2MidooPSYvbcuc0I107eB/9Z0/fK6MQqO8oCuLV+2qIp
 NurXapoUuqVmkIR4wZrY4zG0BPx9yNgBSJW8VZHY2VN2ikWznC7XhDfrnIX61FTfGKUs
 rCQYfRpJLruQRC+LsDirgJwxIz+HSjWCq79uSgJZ7fhX8TC5WdwKJazdnQKn5IjBD8se
 3qXteTnI6OXqjcsS1lDKXq50uli4vjtq3VHRxsZ1gLLnWxvtv0zFC+W5bxN+cTXpLKiW
 59Og==
X-Gm-Message-State: AOAM5301hrQ4wOWlG5PR4FJRY62BdA7+f3eEdAxij5zaVa0B84sROgYc
 FGisoZvMnUx0X587wl40RGmOnxEyeq3Um4JtQHw=
X-Google-Smtp-Source: ABdhPJz/FfN9kqeD9Yru3eUPJX0l1B8dOWo9/182fA56Mbh5zE4f9yy6Wa4Th9GlE+1q8+8c9jkPhsldcPjshjYo1kI=
X-Received: by 2002:a67:f3c3:: with SMTP id j3mr2962798vsn.52.1603389896042;
 Thu, 22 Oct 2020 11:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20201022165450.682571-1-lyude@redhat.com>
In-Reply-To: <20201022165450.682571-1-lyude@redhat.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 22 Oct 2020 14:04:45 -0400
Message-ID: <CAKb7UvhfWA6ijoQnq2Mvrx8jfn57EC-P5KBkYR3HmrBUrntJhg@mail.gmail.com>
Subject: Re: [PATCH] drm/edid: Fix uninitialized variable in drm_cvt_modes()
To: Lyude Paul <lyude@redhat.com>
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
Cc: Kees Cook <keescook@chromium.org>, Leon Romanovsky <leon@kernel.org>,
 David Airlie <airlied@linux.ie>, Chao Yu <chao@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 "# 3.9+" <stable@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 22, 2020 at 12:55 PM Lyude Paul <lyude@redhat.com> wrote:
>
> Noticed this when trying to compile with -Wall on a kernel fork. We potentially
> don't set width here, which causes the compiler to complain about width
> potentially being uninitialized in drm_cvt_modes(). So, let's fix that.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>
> Cc: <stable@vger.kernel.org> # v5.9+
> Fixes: 3f649ab728cd ("treewide: Remove uninitialized_var() usage")
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 631125b46e04..2da158ffed8e 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3094,6 +3094,7 @@ static int drm_cvt_modes(struct drm_connector *connector,
>
>         for (i = 0; i < 4; i++) {
>                 int width, height;
> +               u8 cvt_aspect_ratio;
>
>                 cvt = &(timing->data.other_data.data.cvt[i]);
>
> @@ -3101,7 +3102,8 @@ static int drm_cvt_modes(struct drm_connector *connector,
>                         continue;
>
>                 height = (cvt->code[0] + ((cvt->code[1] & 0xf0) << 4) + 1) * 2;
> -               switch (cvt->code[1] & 0x0c) {
> +               cvt_aspect_ratio = cvt->code[1] & 0x0c;
> +               switch (cvt_aspect_ratio) {
>                 case 0x00:
>                         width = height * 4 / 3;
>                         break;
> @@ -3114,6 +3116,10 @@ static int drm_cvt_modes(struct drm_connector *connector,
>                 case 0x0c:
>                         width = height * 15 / 9;
>                         break;
> +               default:

What value would cvt->code[1] have such that this gets hit?

Or is this a "compiler is broken, so let's add more code" situation?
If so, perhaps the code added could just be enough to silence the
compiler (unreachable, etc)?

  -ilia
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
