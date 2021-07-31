Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8DF3DC6D2
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 18:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E296E6E165;
	Sat, 31 Jul 2021 16:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C6E6E165
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 16:07:19 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so25248038pjb.3
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 09:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LG7zSyfSn36hr9Y31v8KfdvOMGtGx7avDWUzJUf+ldk=;
 b=lc3SluDT+VZvarfeA7YUQ+oIQyL3uD2Z7hSTADjmM2kuDJ5T/bSknB1khTprf/Zj/I
 YvlsAuu9r/jHXiXqyD3z8zhKwH4ooNWa4LIIdQvmGuLPJueYeZeOw5yfOtR6w3Orfayu
 X7UGIW0SSl68z771c65kEZubBaVOTEMEImtIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LG7zSyfSn36hr9Y31v8KfdvOMGtGx7avDWUzJUf+ldk=;
 b=dS8GUAliTBJ4CO+7ihMgT3w1I7G4so+du2wq+0xzrvTXy0PcjRvzHu8wTpmUlCKmOQ
 QcEjZlhCVNof9ESCJJvS+I4b62cpt3+wsNwdr2oKcc5TYXX/4d4YyArZBXpnLS/WbzB6
 KKFR4/2pJnACC1EzC7cDiQn9QGznG7P5VX1KbeBaCkTVQ0ZJ2Gu+WGwgqbebYHv2QV/P
 EtlM0jlVUKUx3LzN5px+PXoPQsc+8mFDJ+OzFAit5G9hLeYMOrlc1PWi+ciMm/cvavz5
 PnmaARzOXERzwHBPK8VZNImkU0oLofKuXsU3M1Amijwh1QE+ehsP5/2tUosjOPB0HF9P
 50ZA==
X-Gm-Message-State: AOAM533w7qka30QpjmDG7bDkDBSN51xa/q0UpUf5wEwbyu1ccP1f8R3M
 eG48YjL2vNpPF6LdHPN8GK8EPg==
X-Google-Smtp-Source: ABdhPJzpVI9jyF73pL9aDmEauVhp5KKsoZrePmncq7sudEDatHwHMUSxgLnUds0Mz6ecfWmvyvBGPw==
X-Received: by 2002:a63:f145:: with SMTP id o5mr1713333pgk.273.1627747639422; 
 Sat, 31 Jul 2021 09:07:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id x19sm6346863pfa.104.2021.07.31.09.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 09:07:18 -0700 (PDT)
Date: Sat, 31 Jul 2021 09:07:17 -0700
From: Kees Cook <keescook@chromium.org>
To: Ariel Elior <aelior@marvell.com>, GR-everest-linux-l2@marvell.com
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Keith Packard <keithpac@amazon.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
 linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH 42/64] net: qede: Use memset_after() for counters
Message-ID: <202107310901.CB470B8C9D@keescook>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-43-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727205855.411487-43-keescook@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 27, 2021 at 01:58:33PM -0700, Kees Cook wrote:
> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memset(), avoid intentionally writing across
> neighboring fields.
> 
> Use memset_after() so memset() doesn't get confused about writing
> beyond the destination member that is intended to be the starting point
> of zeroing through the end of the struct.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> The old code seems to be doing the wrong thing: starting from not the
> first member, but sized for the whole struct. Which is correct?

Quick ping on this question.

The old code seems to be doing the wrong thing: it starts from the second
member and writes beyond int_info, clobbering qede_lock:

struct qede_dev {
        ...
        struct qed_int_info             int_info;

        /* Smaller private variant of the RTNL lock */
        struct mutex                    qede_lock;
        ...


struct qed_int_info {
        struct msix_entry       *msix;
        u8                      msix_cnt;

        /* This should be updated by the protocol driver */
        u8                      used_cnt;
};

Should this also clear the "msix" member, or should this not write
beyond int_info? This patch does the latter.

-Kees

> ---
>  drivers/net/ethernet/qlogic/qede/qede_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/qlogic/qede/qede_main.c b/drivers/net/ethernet/qlogic/qede/qede_main.c
> index 01ac1e93d27a..309dfe8c94fb 100644
> --- a/drivers/net/ethernet/qlogic/qede/qede_main.c
> +++ b/drivers/net/ethernet/qlogic/qede/qede_main.c
> @@ -2419,7 +2419,7 @@ static int qede_load(struct qede_dev *edev, enum qede_load_mode mode,
>  	goto out;
>  err4:
>  	qede_sync_free_irqs(edev);
> -	memset(&edev->int_info.msix_cnt, 0, sizeof(struct qed_int_info));
> +	memset_after(&edev->int_info, 0, msix);
>  err3:
>  	qede_napi_disable_remove(edev);
>  err2:
> -- 
> 2.30.2
> 

-- 
Kees Cook
