Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 007945BB6AE
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 08:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E11710E0D4;
	Sat, 17 Sep 2022 06:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAF010E0D4
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 06:35:27 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id e18so34404178edj.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 23:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=I7fH7xM2QntBl/3ZfFF6X3xIpZY2sK9i3vAPrDeAMYc=;
 b=FF+dt4BGFbsH14kVvDc+MGjC//oE/MAlXMWtj0S6K/fzF6AkSzzFsgQ7W9w6fPI48q
 Shfo34XJXMS2buiEZPUISCMdIFJj+N40oNvT27xQnP0m7wssqzr7q3bgCKQ0Vlf6osCE
 j+UuteUG2p+QEDDD5S/DWjg08dt5rRUEHXVTaab2u2V32iw4KZml5x/GhcQZhxudSxIS
 8Vusequ2tAsUBhPfWuiNWR5wghTphaHbMIzWo8jrFWXW29KIjtHnpdy8yWOUPlLX/kxn
 j+l/SLpmFVSYK9b15+jGJtQPu4V+pDo6wDO6ozVRny2X3VA6EfcaoiPMtLAt69IoYQep
 DzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=I7fH7xM2QntBl/3ZfFF6X3xIpZY2sK9i3vAPrDeAMYc=;
 b=0xIMnV2zGUaw+tH6aEM6syhFBz+deDrh189oEufyM1bfSRXC7sovhmbsXzg00ZMiMM
 pN53Jjuknf7UzlAyJTBemKXDim2vNIm4au4NqIKHsAnG7p/PPOAX5wVSr5uPjCUrs8+a
 25jFYaIpRXaW4sErKVB0uSKmEUSgy1l8CajKe78R8WtwATBq3DpqxWE4XuqFqGOcYnip
 a50rwq0ltHDH+QxckOSEvcj8NwNds8G9kdQP8qDlCM6g+1xHYLjl/7hXq0Vw6pW0DDG3
 wwo9UZJW3YR5MCdm179plrqOYmG4ZKHZpp3dL/jtAeXaA2YpWhWSr0OPEbFjxlyOBJy8
 x9vw==
X-Gm-Message-State: ACrzQf2UsSsPeCsjEzG2ggaj9RTGT+CPBCpKxa5Bxx1UmtxoNLiA7i3q
 EvlApeuG5hYAkdEgQOiMaL8=
X-Google-Smtp-Source: AMsMyM4KC0vfNFMs1aijxmybiqmZRZcNzFkgFje05cuMXXQLT9p3K/oE40zhonkkleVxcqbP4cXTlQ==
X-Received: by 2002:aa7:d51a:0:b0:453:9086:fc37 with SMTP id
 y26-20020aa7d51a000000b004539086fc37mr2372020edq.174.1663396525771; 
 Fri, 16 Sep 2022 23:35:25 -0700 (PDT)
Received: from [192.168.2.181] (46-10-149-62.ip.btc-net.bg. [46.10.149.62])
 by smtp.gmail.com with ESMTPSA id
 o22-20020aa7c7d6000000b0044e9601e53fsm14929755eds.19.2022.09.16.23.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 23:35:25 -0700 (PDT)
Message-ID: <d9c9e901-a96d-e6ed-497c-a69eede2e36e@gmail.com>
Date: Sat, 17 Sep 2022 09:35:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/vmwgfx: Fix memory leak in vmw_mksstat_add_ioctl()
Content-Language: en-US
To: Rafael Mendonca <rafaelmendsr@gmail.com>, Zack Rusin <zackr@vmware.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Martin Krastev <krastevm@vmware.com>
References: <20220916204751.720716-1-rafaelmendsr@gmail.com>
From: "Martin Krastev (VMware)" <martinkrastev768@gmail.com>
In-Reply-To: <20220916204751.720716-1-rafaelmendsr@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thank you for the catch!

Reviewed-by: Martin Krastev <krastevm@vmware.com>


Regards,

Martin



On 16.09.22 г. 23:47 ч., Rafael Mendonca wrote:
> If the copy of the description string from userspace fails, then the page
> for the instance descriptor doesn't get freed before returning -EFAULT,
> which leads to a memleak.
>
> Fixes: 7a7a933edd6c ("drm/vmwgfx: Introduce VMware mks-guest-stats")
> Signed-off-by: Rafael Mendonca <rafaelmendsr@gmail.com>
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
> index 2aceac7856e2..089046fa21be 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
> @@ -1076,6 +1076,7 @@ int vmw_mksstat_add_ioctl(struct drm_device *dev, void *data,
>   
>   	if (desc_len < 0) {
>   		atomic_set(&dev_priv->mksstat_user_pids[slot], 0);
> +		__free_page(page);
>   		return -EFAULT;
>   	}
>   
