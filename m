Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFD0397E6E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 04:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342616EB4D;
	Wed,  2 Jun 2021 02:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604176EB49;
 Wed,  2 Jun 2021 02:06:23 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so1160032otl.3; 
 Tue, 01 Jun 2021 19:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aCCJ1eFEGcaWx0tMGwZOzk/m+ZOCXhNzKCETdM0irhY=;
 b=P+CxivsSP2vTyBnLPSJf2UT7S3Vq3UDgbdZmYKTVt14drvzbGjdJeG/9pIdzwmMPV7
 J4v6+F13KjldLM5urdVgSSxpyJDvEL7iV4cS3KmurqhIR6Y6EOJPTSS6NFIYqCz7S6g2
 nC1Wy0ESwhQmb5uAu2anv8IhUfEeQoJuCETATK/PUf9gd4Ti8/sgsbwEvCezk0dvcPXU
 jTNEtJbLQwOmLEGTPDOFB0QEGtcWY5ZnebZwEIMYmB4Uesq1t3O/aDSVAW9lIbkNw7QH
 ZtvsrBEPqPH6HGeXFY1fRr9afwdBSeqCEIu00WQifkpbReliFlcejkEjNC4HnIAnxSxL
 nhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aCCJ1eFEGcaWx0tMGwZOzk/m+ZOCXhNzKCETdM0irhY=;
 b=FW/tUr/3pMpmqgar2sV9ecf+h5BhLYw5B8StY4qNTUrTkEbqR4sx8ce9rJTDMb8dQo
 3/uD9TIrhGK0fmbnpi0IoGNHPAdpG/DXxWuf0YIVEEamYWgVzYpFwF8Vr4azFlzd7Jvh
 JIZU+3wTTQtpA3MG2Pv211BHf+EI7o8T3MV67GMJe3TXQA3bChpneOXAAlKi/pVK9KU+
 2qekyqfADTl6j89iuFXcURlHQj88wZFS8V1GbNfFalwZ0ACTRSlSwF4Mp9vgheus2Gwh
 KHjrXvPMFVfoadI/FEAXCQn3Z7urZnLu3Ke7mjnkk3AtQIukdTtERc+//n9jPaiUahAK
 PpQQ==
X-Gm-Message-State: AOAM530XW41KpRXBE3rVsU/i7Gv2ZABNnkU8EByb/5d+onh4xNzAGCGP
 YAhRCV6ruNZ8XVhF/DHbZuEuQhsQm9XKfTV1kHhq3lnt
X-Google-Smtp-Source: ABdhPJz9MyOW+RXyLkak9SmZ4RILzHZIG7xsOaJMyO8H2AOdhEnucej98ktDPPWNnUOAAovWO4h+zDrg9kApmmuFeec=
X-Received: by 2002:a9d:57cd:: with SMTP id q13mr24131409oti.23.1622599582693; 
 Tue, 01 Jun 2021 19:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210528175354.790719-1-keescook@chromium.org>
In-Reply-To: <20210528175354.790719-1-keescook@chromium.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 1 Jun 2021 22:06:11 -0400
Message-ID: <CADnq5_PsvOqBW4-WDvR7BqaZgq3R8vYRPz2=c+87Dokk-zWz_A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Avoid HDCP over-read and corruption
To: Kees Cook <keescook@chromium.org>
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
Cc: Martin Tsai <martin.tsai@amd.com>, Leo Li <sunpeng.li@amd.com>,
 David Airlie <airlied@linux.ie>, Wenjing Liu <wenjing.liu@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Anson Jacob <Anson.Jacob@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Bindu Ramamurthy <bindu.r@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 28, 2021 at 1:54 PM Kees Cook <keescook@chromium.org> wrote:
>
> Instead of reading the desired 5 bytes of the actual target field,
> the code was reading 8. This could result in a corrupted value if the
> trailing 3 bytes were non-zero, so instead use an appropriately sized
> and zero-initialized bounce buffer, and read only 5 bytes before casting
> to u64.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Applied.  Thanks!

> ---
>  drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
> index 2cbd931363bd..6d26d9c63ab2 100644
> --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
> +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
> @@ -29,8 +29,10 @@ static inline enum mod_hdcp_status validate_bksv(struct mod_hdcp *hdcp)
>  {
>         uint64_t n = 0;
>         uint8_t count = 0;
> +       u8 bksv[sizeof(n)] = { };
>
> -       memcpy(&n, hdcp->auth.msg.hdcp1.bksv, sizeof(uint64_t));
> +       memcpy(bksv, hdcp->auth.msg.hdcp1.bksv, sizeof(hdcp->auth.msg.hdcp1.bksv));
> +       n = *(uint64_t *)bksv;
>
>         while (n) {
>                 count++;
> --
> 2.25.1
>
