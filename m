Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0483D97BA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 23:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15166E3B2;
	Wed, 28 Jul 2021 21:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A256E3B2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 21:45:58 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso6070990pjf.4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 14:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XicekCZGMuTmx7BgzDuVSPZdtJx2YNBwg9Vgy0Mbawo=;
 b=qRsvbI+rHYEiRC2rsaQilPSeDsG6xHz23Gg7u7G77h5lVYiE9RY/ic/QrdP1CiLGFG
 HNGvcUk7vxNmx+5k1fEoVctQeebmoMZAtWlgrNdUC3wYJKUtcM9ps+7FkAM8Tf4dFWZq
 WLiZmfxApauaFEr8uRik+m2354Ycce0Jc/G8MKm3OJqS4b18r+xGepvsfIByOyUXQTOV
 AEdblj9EfgtvfzohyJVRv1CHNdEnV0N0a5aFfg2/BCMTmURWn3I4OGoCrN29tUESJzlq
 ucoykYE6ETvM5+vW8doZjyiEbC0lv68lJXr+ICOdJrjzus1Eyqko+Fxd94zBL8I7lj2k
 YlCg==
X-Gm-Message-State: AOAM530byz4yqa649A+R7yUub+s7FMyc7so+r46PoSgJF+eyTdfcE4R2
 Asbd2/SqLF81gng+npvN+os=
X-Google-Smtp-Source: ABdhPJw8GLTntP9/607bFZm4hvTLuV2RygVm16ypIjamKfpthJMPHWWs51SpMIWNplCV818V7piMmg==
X-Received: by 2002:a62:61c3:0:b029:35b:cb61:d2c3 with SMTP id
 v186-20020a6261c30000b029035bcb61d2c3mr1780844pfb.62.1627508758153; 
 Wed, 28 Jul 2021 14:45:58 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:1:3328:5f8d:f6e2:85ea])
 by smtp.gmail.com with ESMTPSA id b15sm876167pgj.60.2021.07.28.14.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 14:45:57 -0700 (PDT)
Subject: Re: [PATCH 48/64] drbd: Use struct_group() to zero algs
To: Kees Cook <keescook@chromium.org>, linux-hardening@vger.kernel.org
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-49-keescook@chromium.org>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <1cc74e5e-8d28-6da4-244e-861eac075ca2@acm.org>
Date: Wed, 28 Jul 2021 14:45:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210727205855.411487-49-keescook@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, netdev@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/27/21 1:58 PM, Kees Cook wrote:
> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memset(), avoid intentionally writing across
> neighboring fields.
> 
> Add a struct_group() for the algs so that memset() can correctly reason
> about the size.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>   drivers/block/drbd/drbd_main.c     | 3 ++-
>   drivers/block/drbd/drbd_protocol.h | 6 ++++--
>   drivers/block/drbd/drbd_receiver.c | 3 ++-
>   3 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
> index 55234a558e98..b824679cfcb2 100644
> --- a/drivers/block/drbd/drbd_main.c
> +++ b/drivers/block/drbd/drbd_main.c
> @@ -729,7 +729,8 @@ int drbd_send_sync_param(struct drbd_peer_device *peer_device)
>   	cmd = apv >= 89 ? P_SYNC_PARAM89 : P_SYNC_PARAM;
>   
>   	/* initialize verify_alg and csums_alg */
> -	memset(p->verify_alg, 0, 2 * SHARED_SECRET_MAX);
> +	BUILD_BUG_ON(sizeof(p->algs) != 2 * SHARED_SECRET_MAX);
> +	memset(&p->algs, 0, sizeof(p->algs));
>   
>   	if (get_ldev(peer_device->device)) {
>   		dc = rcu_dereference(peer_device->device->ldev->disk_conf);
> diff --git a/drivers/block/drbd/drbd_protocol.h b/drivers/block/drbd/drbd_protocol.h
> index dea59c92ecc1..a882b65ab5d2 100644
> --- a/drivers/block/drbd/drbd_protocol.h
> +++ b/drivers/block/drbd/drbd_protocol.h
> @@ -283,8 +283,10 @@ struct p_rs_param_89 {
>   
>   struct p_rs_param_95 {
>   	u32 resync_rate;
> -	char verify_alg[SHARED_SECRET_MAX];
> -	char csums_alg[SHARED_SECRET_MAX];
> +	struct_group(algs,
> +		char verify_alg[SHARED_SECRET_MAX];
> +		char csums_alg[SHARED_SECRET_MAX];
> +	);
>   	u32 c_plan_ahead;
>   	u32 c_delay_target;
>   	u32 c_fill_target;
> diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
> index 1f740e42e457..6df2539e215b 100644
> --- a/drivers/block/drbd/drbd_receiver.c
> +++ b/drivers/block/drbd/drbd_receiver.c
> @@ -3921,7 +3921,8 @@ static int receive_SyncParam(struct drbd_connection *connection, struct packet_i
>   
>   	/* initialize verify_alg and csums_alg */
>   	p = pi->data;
> -	memset(p->verify_alg, 0, 2 * SHARED_SECRET_MAX);
> +	BUILD_BUG_ON(sizeof(p->algs) != 2 * SHARED_SECRET_MAX);
> +	memset(&p->algs, 0, sizeof(p->algs));

Using struct_group() introduces complexity. Has it been considered not 
to modify struct p_rs_param_95 and instead to use two memset() calls 
instead of one (one memset() call per member)?

Thanks,

Bart.
