Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0A064F555
	for <lists+dri-devel@lfdr.de>; Sat, 17 Dec 2022 00:50:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7616310E651;
	Fri, 16 Dec 2022 23:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B2110E648
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 23:50:35 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id n20so9802358ejh.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 15:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TGYD/43itP5jhG3AMBWGsLpG3Fh9gkXSMBOyCxjkuIg=;
 b=DFWmzXhou89wjbd+iGzTLJwfYda3hHS9r24xTVxCKieeD+uu6DdkEXffcEd2ysdH4p
 RpK7h6R1mB8cGGCN1HwXC5CPxrBEnhPYsr06FXPNuYThCqSEPgqVIm6mg0B4k2k6dwtv
 ceqVVN4pcBmmckFqXYpgnIsS34O3w9bS1Lbr6wJLHuNkGfwP0vhKCB0IdgoxuqDerqrL
 KXk3stNKbyLGRtCQq9jtR+PsZxtDn/ONjzQDukYrfHLrxzfDkjHjAmYUZwXUIIlYuves
 Ao7JaoCw8cDZ1d0Qe8iFsKMHYXKZ282+mClr9EB/fCBLg11XL//2GRWtDsS+BdFyEUUR
 4+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TGYD/43itP5jhG3AMBWGsLpG3Fh9gkXSMBOyCxjkuIg=;
 b=MHvoPyWt9DN7tbtOi7PR3X9ea6MqxyeVKVBmq8gUn6Mu0EACJ7Uiug8A07tQfM/5qr
 0uh+Nyyo1PU3s/y04lNw+MAj9+WKi97XiJMuhcgypX7uCElSNSo1UYEwanjNGhZUGCv1
 fzmcnJu/IIJwchff8whXFxNq/HFLIdFf3YFJ0NFrmLu82YW7hwxtnrRHS3YnElLK33tb
 mA3H0ygAXdNj8UqYrNXfHzEQEH+V+MplV8Ql48oAdS1vO08ywUetk1x/33SbXhkYnb4W
 UP5YGDgxrSnqbXZ16amcAaD3/kR9S6MOp+0OjdMtNrFsB/sC6ZJ11+XVHray0SkM0jiY
 zgIQ==
X-Gm-Message-State: ANoB5pnZN7uhRs3jlDchmhnbDbipm4Yriay9crTtJuGFdkLUET5VVKZU
 EaDkN+TVTOhRkhwZbyuJ8MOQV+ZPiNPifp8aIHc=
X-Google-Smtp-Source: AA0mqf4iQerKq0SXayxMXO4sNZ6BbliwbFrIcsnISdHyxGatyx5ONcxi5wUKJH+zijrxaeowMgGhBYK9ymjQbiWn35c=
X-Received: by 2002:a17:906:1308:b0:7c1:55aa:2e83 with SMTP id
 w8-20020a170906130800b007c155aa2e83mr2775643ejb.361.1671234633422; Fri, 16
 Dec 2022 15:50:33 -0800 (PST)
MIME-Version: 1.0
References: <20221216233355.542197-1-robdclark@gmail.com>
 <20221216233355.542197-2-robdclark@gmail.com>
In-Reply-To: <20221216233355.542197-2-robdclark@gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 16 Dec 2022 15:50:22 -0800
Message-ID: <CAPaKu7Ti5sEzGVRaE8UFx1RRbBba3=am8rwZf3totX1z8bfJHQ@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Fix GEM handle creation UAF
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 16, 2022 at 3:33 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Userspace can guess the handle value and try to race GEM object creation
> with handle close, resulting in a use-after-free if we dereference the
> object after dropping the handle's reference.  For that reason, dropping
> the handle's reference must be done *after* we are done dereferencing
> the object.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
