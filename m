Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD404BC761
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 11:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4AF10F692;
	Sat, 19 Feb 2022 10:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3AC10EB36
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 15:38:43 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id y6so13856359ybc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 07:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4hk+t9STd/ohkaxKw6p1lqAArc9u/s8Q8z69HF6aLfE=;
 b=dBmphIBTKJBbLyOdiwSe3VTvN12HETj4nWMgwdynneUZO8D6nWfrB0f/GBiBA+3Bxp
 KF+/tApD9j+7MjLO3Ima8cJs2VlPrUd+bMIOWVDaUKtszaSMlEIYrw48DABbvIYL682H
 LD3Re5r4ZXG6jQyafj0JwoDngXYlOewmr0UptZZQLVEVKpRXF4dO5Q3Fr9x91aj6oUXd
 96t9ShajgD7echn30nWeEsEzrNMv7O0d1/NniWqwsF6bsxZCyVn/SdWtu7ldYpWcF8mJ
 knB2bt7Gwyyutk12bI8gZwTL++yweig6tJrG/t4tq1ZgywAGwg/HukZsUJV77AyM7/eP
 Sv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4hk+t9STd/ohkaxKw6p1lqAArc9u/s8Q8z69HF6aLfE=;
 b=H5skUvOEJsd2WmsnzBCxprtZQAKdBh+n3ZIbOLjh6CQGtsSnubMORQ9m2I5qG3KuBy
 jxAgabQpYwXj2HRgATwy8nSSFYt/kBETdZUW3xKZhjIrdwlraqlo8BZW0Xs+Arm/GqKx
 /V8ngS9kc7Fj/uj6wLEfYsEi/ZD16P7t15M9w0OVedPwQ9Y+ZoPGbSeOY7vgmmgnTwX0
 CSsDDLZwRP7vIveO0x+rXqj8ViYBGN5JCMCRhyh43cfl9d+CdlplMaN0BEXF/eGPAlwv
 yqmD5D5iV/O7Vq9ajyjFje3t4tsnlWi9TQKb1WzrCKycezNaMrE7Cl5Y/hg6xFfHas/I
 SpOg==
X-Gm-Message-State: AOAM531OD2OtdaQzJoSaobhaCAdNyNyQ8gKXbJIckD0W3iYY4yuvUk2K
 MBRlVxA3/gE6yxUzaTojE7ePa65GIV7LotMoPAixmA==
X-Google-Smtp-Source: ABdhPJxO+ysMqjMYL+p/uFIKcRWnnodcM/TI1tWk7b39KPn14CMGckpJP4fv4wEzgLTuLSCx3ej7mggJkgIO+uDduuk=
X-Received: by 2002:a25:a28d:0:b0:623:fa1b:3eb7 with SMTP id
 c13-20020a25a28d000000b00623fa1b3eb7mr2918043ybi.387.1645112322577; Thu, 17
 Feb 2022 07:38:42 -0800 (PST)
MIME-Version: 1.0
References: <20220217140441.1218045-1-andrzej.hajda@intel.com>
 <20220217140441.1218045-4-andrzej.hajda@intel.com>
In-Reply-To: <20220217140441.1218045-4-andrzej.hajda@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 17 Feb 2022 07:38:31 -0800
Message-ID: <CANn89iJ3W3ioVUaBJikCpFdCa9o_APpqyb0FmK9AmYPtgOeC7w@mail.gmail.com>
Subject: Re: [PATCH 3/9] lib/ref_tracker: __ref_tracker_dir_print improve
 printing
To: Andrzej Hajda <andrzej.hajda@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 19 Feb 2022 10:01:55 +0000
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
Cc: Chris Wilson <chris.p.wilson@intel.com>, netdev <netdev@vger.kernel.org>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Jakub Kicinski <kuba@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 6:05 AM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
>
> To improve readibility of ref_tracker printing following changes
> have been performed:
> - added display name for ref_tracker_dir,
> - stack trace is printed indented, in the same printk call,
> - total number of references is printed every time,
> - print info about dropped references.
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Chris Wilson <chris.p.wilson@intel.com>
> ---
>  include/linux/ref_tracker.h | 15 ++++++++++++---
>  lib/ref_tracker.c           | 28 ++++++++++++++++++++++------
>  2 files changed, 34 insertions(+), 9 deletions(-)
>
> diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
> index b9c968a716483..090230e5b485d 100644
> --- a/include/linux/ref_tracker.h
> +++ b/include/linux/ref_tracker.h
> @@ -15,18 +15,26 @@ struct ref_tracker_dir {
>         refcount_t              untracked;
>         struct list_head        list; /* List of active trackers */
>         struct list_head        quarantine; /* List of dead trackers */
> +       char                    name[32];
>  #endif
>  };
>
>  #ifdef CONFIG_REF_TRACKER
> -static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
> -                                       unsigned int quarantine_count)
> +
> +// Temporary allow two and three arguments, until consumers are converted
> +#define ref_tracker_dir_init(_d, _q, args...) _ref_tracker_dir_init(_d, _q, ##args, #_d)
> +#define _ref_tracker_dir_init(_d, _q, _n, ...) __ref_tracker_dir_init(_d, _q, _n)
> +
> +static inline void __ref_tracker_dir_init(struct ref_tracker_dir *dir,
> +                                       unsigned int quarantine_count,
> +                                       const char *name)
>  {
>         INIT_LIST_HEAD(&dir->list);
>         INIT_LIST_HEAD(&dir->quarantine);
>         spin_lock_init(&dir->lock);
>         dir->quarantine_avail = quarantine_count;
>         refcount_set(&dir->untracked, 1);
> +       strlcpy(dir->name, name, sizeof(dir->name));
>         stack_depot_init();
>  }
>
> @@ -47,7 +55,8 @@ int ref_tracker_free(struct ref_tracker_dir *dir,
>  #else /* CONFIG_REF_TRACKER */
>
>  static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
> -                                       unsigned int quarantine_count)
> +                                       unsigned int quarantine_count,
> +                                       ...)
>  {
>  }
>
> diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
> index 0e9c7d2828ccb..943cff08110e3 100644
> --- a/lib/ref_tracker.c
> +++ b/lib/ref_tracker.c
> @@ -1,4 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#define pr_fmt(fmt) "ref_tracker: " fmt
> +
>  #include <linux/export.h>
>  #include <linux/list_sort.h>
>  #include <linux/ref_tracker.h>
> @@ -7,6 +10,7 @@
>  #include <linux/stackdepot.h>
>
>  #define REF_TRACKER_STACK_ENTRIES 16
> +#define STACK_BUF_SIZE 1024


>
>  struct ref_tracker {
>         struct list_head        head;   /* anchor into dir->list or dir->quarantine */
> @@ -26,31 +30,43 @@ static int ref_tracker_cmp(void *priv, const struct list_head *a, const struct l
>  void __ref_tracker_dir_print(struct ref_tracker_dir *dir,
>                            unsigned int display_limit)
>  {
> -       unsigned int i = 0, count = 0;
> +       unsigned int i = 0, count = 0, total = 0;
>         struct ref_tracker *tracker;
>         depot_stack_handle_t stack;
> +       char *sbuf;
>
>         lockdep_assert_held(&dir->lock);
>
>         if (list_empty(&dir->list))
>                 return;
>
> +       sbuf = kmalloc(STACK_BUF_SIZE, GFP_NOWAIT);
> +
> +       list_for_each_entry(tracker, &dir->list, head)
> +               ++total;

Another iteration over a potential long list.

You can count the @skipped number in the following iteration just fine.

int skipped = 0;

> +
>         list_sort(NULL, &dir->list, ref_tracker_cmp);
>
>         list_for_each_entry(tracker, &dir->list, head) {
> -               if (i++ >= display_limit)
> -                       break;
>                 if (!count++)
>                         stack = tracker->alloc_stack_handle;
>                 if (stack == tracker->alloc_stack_handle &&
>                     !list_is_last(&tracker->head, &dir->list))
>                         continue;
> +               if (i++ >= display_limit)

                            skipped++;
> +                       continue;
>
> -               pr_err("leaked %d references.\n", count);
> -               if (stack)
> -                       stack_depot_print(stack);
> +               if (sbuf && !stack_depot_snprint(stack, sbuf, STACK_BUF_SIZE, 4))
> +                       sbuf[0] = 0;
> +               pr_err("%s@%pK has %d/%d users at\n%s\n",
> +                      dir->name, dir, count, total, sbuf);
>                 count = 0;
>         }
> +       if (i > display_limit)
> +               pr_err("%s@%pK skipped %d/%d reports with %d unique stacks.\n",
> +                      dir->name, dir, count, total, i - display_limit);
> +
> +       kfree(sbuf);
>  }
>  EXPORT_SYMBOL(__ref_tracker_dir_print);
>
> --
> 2.25.1
>
