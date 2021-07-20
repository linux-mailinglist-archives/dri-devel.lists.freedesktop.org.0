Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1746A3CF540
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 09:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C824F89804;
	Tue, 20 Jul 2021 07:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6A889FAD
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 06:45:39 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 s2-20020a0568301e02b02904ce2c1a843eso10147633otr.13
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 23:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YnlclGx2H59akXwZYD6azkaNZJHqKAqqdcjQ+BfTMl0=;
 b=EOriryfrZ2broDhPz9Rod56TA0R/dMqA1FgkTHBiSvm/zwHcoHuQnQbSTPUplzgMqE
 6NGE1tuTNxY5k5rSiaH03Vq6oPn716sjjDEWQL64kuDx968CDuL3h+tCZ9a0DJtiFxKf
 gmzCRr7/+UJCvCnKebfcy0owVygXkPGaBVGMxLE+Z60JpF14wVmZsa3BQ7JRqhimPRRh
 ab3atrUiJdBnOd9yJKckKZyyCsJ4rdcNyyZZzMLSaItwbwYPA/UBsbN0vV9GDuFeUFsw
 qwNgyU8Vl/n6OHt+jnOcLNplJRenDHUEpK0gNQaUK91RX00WVaTo1YOnpLTXSQhgq3j8
 zNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YnlclGx2H59akXwZYD6azkaNZJHqKAqqdcjQ+BfTMl0=;
 b=EMaY52Vh2b2OZYaRqx/UMj7HD4c7E8OxeFfWXuenwg4G4eyz4U0d3Daq3pLpy8TdCy
 PBSGU9j/OcVG47RQdDSj5DK3VXKKQWy2tJPNHwCgt+zHEXX6RMmy1Bjoy4X3+JvfE7Ip
 u3FwfdyilavGd2gNwdjTvHcM9hv62abvlpqpRCoiCC/L0WRrv0sRHY5WL05LDWk0J+bN
 anjQcqTKwGtDMXIkrOljxZvAi+4zdwzZ8aFfFcKCrJTlF8eh3U06YXBWNwfLBZhDzPL7
 4KCPMOW6hbkaN68PT8embWGLRCsF7XOvJ3CukV6ReY94U4/PCaanvRWTXn8ahcDlmOU+
 2y7Q==
X-Gm-Message-State: AOAM5316Eef6YscBOC8jhwNJ0H/c3q2smXDrMOXkZ+r2NmYgIH75S24i
 X4mdiQQ2KM6XUETMrkrkJsFKlolNlTywcQhgdw==
X-Google-Smtp-Source: ABdhPJy4rXeOXr3aSDOKhPbHWEJWZV7pqAFvI/x6R1yMP1VISKGJ65cl5P0jd+oum/KevJu9IRS+OvfbNiRipMNR3lY=
X-Received: by 2002:a05:6830:1dfc:: with SMTP id
 b28mr21199807otj.282.1626763538753; 
 Mon, 19 Jul 2021 23:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <1626235762-2590-1-git-send-email-zheyuma97@gmail.com>
 <YPXJW9N66U2gm2CD@ravnborg.org>
In-Reply-To: <YPXJW9N66U2gm2CD@ravnborg.org>
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Tue, 20 Jul 2021 14:45:27 +0800
Message-ID: <CAMhUBjmjncenfiaH55NYRNVZOaWQXNjyaBBnudLfpz+GnGP6Nw@mail.gmail.com>
Subject: Re: [PATCH v2] video: fbdev: kyro: fix a DoS bug by restricting user
 input
To: Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 20 Jul 2021 07:23:37 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 20, 2021 at 2:50 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Zheyu,
> On Wed, Jul 14, 2021 at 04:09:22AM +0000, Zheyu Ma wrote:
> > The user can pass in any value to the driver through the 'ioctl'
> > interface. The driver dost not check, which may cause DoS bugs.
> >
> > The following log reveals it:
> >
> > divide error: 0000 [#1] PREEMPT SMP KASAN PTI
> > RIP: 0010:SetOverlayViewPort+0x133/0x5f0 drivers/video/fbdev/kyro/STG4000OverlayDevice.c:476
> > Call Trace:
> >  kyro_dev_overlay_viewport_set drivers/video/fbdev/kyro/fbdev.c:378 [inline]
> >  kyrofb_ioctl+0x2eb/0x330 drivers/video/fbdev/kyro/fbdev.c:603
> >  do_fb_ioctl+0x1f3/0x700 drivers/video/fbdev/core/fbmem.c:1171
> >  fb_ioctl+0xeb/0x130 drivers/video/fbdev/core/fbmem.c:1185
> >  vfs_ioctl fs/ioctl.c:48 [inline]
> >  __do_sys_ioctl fs/ioctl.c:753 [inline]
> >  __se_sys_ioctl fs/ioctl.c:739 [inline]
> >  __x64_sys_ioctl+0x19b/0x220 fs/ioctl.c:739
> >  do_syscall_64+0x32/0x80 arch/x86/entry/common.c:46
> >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> >
> > Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> > ---
> > Changes in v2:
> >     - Validate the inputs on a higher level
>
> Much better, thanks.
> When a line is continued like here the statement shall aling with the
> opening brace. I fixed it up when applying the patch to drm-misc-next so
> no need to do anything this time.

Thanks for your kind reminder, I will pay attention next time.

Regards,
Zheyu Ma
