Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3A61C12CC
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 15:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466FE6EC8D;
	Fri,  1 May 2020 13:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33646EC8D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 13:22:59 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id e10so3607935vsp.12
 for <dri-devel@lists.freedesktop.org>; Fri, 01 May 2020 06:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U7xeNDMpHG9rttpBfQjByhPTpX3h4BbkQQpHxvH2CZY=;
 b=QBgcezRdiTZ5O0AKGNPhFnqQwJKhLxPatFGx1VkjabRFvvPJ2z7kDBQt2wFLybzz/s
 O5nr7B9UQPW93TqKjDq5h6h3D4X6+ZDvmUC8jQut7TTJnyiL9YTcOStN/quJtXRlzYFv
 iVLrSUg0rEQBTXqa9e44vriQgentq+xkjn7YncAUQSNxWgtfvzTxY4+OewqInuW6lyZY
 Uew1mpqbkdhe3XIvc/cvglrefbid4dr99wbjXBv7hW1BkHH4qeK86oqHyvmdvGLigu2W
 7E7ShWBenmgqlw05U3q3B/x3WPdsAAJbvxCKkpCIAG/nUZr/1WvPpRBzHx2RzxXfI4Ve
 aomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U7xeNDMpHG9rttpBfQjByhPTpX3h4BbkQQpHxvH2CZY=;
 b=GRrrYKx0Fg40qHSF9zSruwzLIRgJDL4h5lS4bP/1RNsv3AAZwdqmS0jeKFES+YIkAf
 Sfm+8aD9vp3dvVAqJF+ifk1MN/GnnMSsH6mvmDYN4yLiRzZhbXRrrbqy/0xwQoCiwY5E
 fFeVHFjRtX+O6ZoLoro0t80hiJlH28qPAq1UEg7zFTp3AXth2mQYEKhMsgF9d7ndNcbF
 c7x2+PMMZRF6ci1keRRekboGozz/c13XE/GycwlbxDJe1QyEeOKrXYnJshCTydWj1Jli
 ZwnD/tP7vzS6un+oYfj+siSrhMblI1uYLCJS6C/haIHX7Eix4e8xxglYlB3r5KK8/YnS
 VQIA==
X-Gm-Message-State: AGi0PuakNH7Xui5s5TZSEw0+JXNfxicd+CkHfVW3QC4txjWTcSYqDLkK
 7E3g9Udt/H149yLLFO4RZGGhRX2dik52WgqsOIU=
X-Google-Smtp-Source: APiQypKB0BtXJ4i0ar2xkSBjNCYc8mbYtpFtlyqFHL2iNLNbpxtiE97/Xpm8hrfYyvE+tgBhrqSWJFnrxE/oPAaC3cU=
X-Received: by 2002:a67:c482:: with SMTP id d2mr3091868vsk.37.1588339379008;
 Fri, 01 May 2020 06:22:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200430091330.9824-1-tzimmermann@suse.de>
In-Reply-To: <20200430091330.9824-1-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 1 May 2020 14:20:40 +0100
Message-ID: <CACvgo50vfeN1-JUOYAu_8H2LJV5qXadZhM21Zw8yepyOyS7rWw@mail.gmail.com>
Subject: Re: [PATCH] drm/ast: Don't check new mode if CRTC is being disabled
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: cogarre@gmail.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Couple of fly-by ideas/suggestions.

On Thu, 30 Apr 2020 at 10:13, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Suspending failed because there's no mode if the CRTC is being
> disabled. Early-out in this case. This fixes runtime PM for ast.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/ast/ast_mode.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 7a9f20a2fd303..089b7d9a0cf3f 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -801,6 +801,9 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
>                 return -EINVAL;
Unrelated:
This feels quite dirty. If AST1180 does not support atomic modeset
simply remove the DRIVER_ATOMIC bit.
You can do that at runtime, via drm_device::driver_features in say,
ast_detect_chip()?

The drm_driver::driver_features is immutable, or it ought to be.

>         }
>
> +       if (!state->enable)
> +               return 0; /* no checks required if CRTC is being disabled */
> +
I cannot think of a reason why a driver would need to perform
crtc_atomic_check, if the crtc is being disabled.
Can you spot any? If not, this should be better served in core, which
calls this callback.
Correct?

HTH
-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
