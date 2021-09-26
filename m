Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F49418ACE
	for <lists+dri-devel@lfdr.de>; Sun, 26 Sep 2021 21:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874BB6E54C;
	Sun, 26 Sep 2021 19:34:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460B389FCC
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 19:34:16 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id 24so22753969oix.0
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 12:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=uIERk105rjOXZD5aEzEh93KdjBwmVeqw64MCasbg/XU=;
 b=cuh8lOR/LuOoewWle2BBV/pZBy5es4jYwmsVxwqCZhu5lv1H6K0d1DeCLSDzTzeALP
 UpBAqC2yD4ASfFCp70rf+x7k8Cpmr/NPtcElK9j/ANKwmN1CQdW5RdmAJDnEdzQSecAD
 rAfcUpJbasNJ9+JA6LHuSUG6sP0Xw6Vk7SmA/9n4hV5CY+nLCxAnx4fZ0XVwd+2hL7S5
 mZeB/dQ3xWcQYZoCSS6/L6Ou8/DKCiYDS1d2i55BGwQNm0lm+oNVoG+3hs2AbPs62LD4
 kpESrzzKXeoOKtQjw/+K7ln2nzIVorqAM9lD3iY3QIyjbDO7JVmIX0QdegY4inToI1ku
 6YsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=uIERk105rjOXZD5aEzEh93KdjBwmVeqw64MCasbg/XU=;
 b=VWA+AMmsEPJ/72Kzc7637s/SE/DuxcD4k+rULKPOOR5Fci1lg2OWluElDUb1HBn8Ht
 6+uqsMnvBgdTObgILMvChhfXgaGvtRfbkAJCbklNM9usLOMX/ByvgOKvCmEMrs1XEHzs
 xZWBfkfkN2AxyNrV2mmpbmJjGsfUSBOm0NPx0PHj7svJL2PN2Bt4aJG8GHUO3Ngb3tjJ
 qJmHSj3QJhwfwAnwbjsCpQwGEcBnWLggiDM4B4Po4eCqqLVs2R6UcFtKJNaXNWSEfJOb
 ROihODf9PnY/dzS8MuPGSO0Sw2TfCZ4MKC/D7+uYkIK0FJRwCf4hvdo77snCupAfQKdG
 aiPA==
X-Gm-Message-State: AOAM533+AadPG7XI3IaiU6GMYKbQtEWLJim8oqRMvMA+Al2Q1RyoHACA
 8h8ea6pBampaM2Lj95KovvdTnQ==
X-Google-Smtp-Source: ABdhPJzr5zY9+jZyJyjKGzeb8XHW1/YHEy6UbOVkL5duxiE/6fISBcVLP8Fm5UmzrI/z/osWVpCv+Q==
X-Received: by 2002:a05:6808:198b:: with SMTP id
 bj11mr6343362oib.105.1632684855854; 
 Sun, 26 Sep 2021 12:34:15 -0700 (PDT)
Received: from MacBook-Pro.hackershack.net
 (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
 by smtp.gmail.com with ESMTPSA id bh25sm3456033oib.40.2021.09.26.12.34.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 12:34:15 -0700 (PDT)
Subject: Re: [PATCH] drm/msm: Fix crash on dev file close
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20210926190554.761482-1-robdclark@gmail.com>
From: Steev Klimaszewski <steev@kali.org>
Message-ID: <cbbf1be7-89d4-5194-3aec-fc0970e86888@kali.org>
Date: Sun, 26 Sep 2021 14:34:14 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210926190554.761482-1-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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


On 9/26/21 2:05 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> If the device file was opened prior to fw being available (such as from
> initrd before rootfs is mounted, when the initrd does not contain GPU
> fw), that would cause a later crash when the dev file is closed due to
> unitialized submitqueues list:
>
>    CPU: 4 PID: 263 Comm: plymouthd Tainted: G        W         5.15.0-rc2-next-20210924 #2
>    Hardware name: LENOVO 81JL/LNVNB161216, BIOS 9UCN33WW(V2.06) 06/ 4/2019
>    pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>    pc : msm_submitqueue_close+0x30/0x190 [msm]
>    lr : msm_postclose+0x54/0xf0 [msm]
>    sp : ffff80001074bb80
>    x29: ffff80001074bb80 x28: ffff03ad80c4db80 x27: ffff03ad80dc5ab0
>    x26: 0000000000000000 x25: ffff03ad80dc5af8 x24: ffff03ad81e90800
>    x23: 0000000000000000 x22: ffff03ad81e90800 x21: ffff03ad8b35e788
>    x20: ffff03ad81e90878 x19: 0000000000000000 x18: 0000000000000000
>    x17: 0000000000000000 x16: ffffda15f14f7940 x15: 0000000000000000
>    x14: 0000000000000000 x13: 0000000000000001 x12: 0000000000000040
>    x11: 0000000000000000 x10: 0000000000000000 x9 : ffffda15cd18ff88
>    x8 : ffff03ad80c4db80 x7 : 0000000000000228 x6 : 0000000000000000
>    x5 : 1793a4e807e636bd x4 : ffff03ad80c4db80 x3 : ffff03ad81e90878
>    x2 : 0000000000000000 x1 : ffff03ad80c4db80 x0 : 0000000000000000
>    Call trace:
>     msm_submitqueue_close+0x30/0x190 [msm]
>     msm_postclose+0x54/0xf0 [msm]
>     drm_file_free.part.0+0x1cc/0x2e0 [drm]
>     drm_close_helper.isra.0+0x74/0x84 [drm]
>     drm_release+0x78/0x120 [drm]
>     __fput+0x78/0x23c
>     ____fput+0x1c/0x30
>     task_work_run+0xcc/0x22c
>     do_exit+0x304/0x9f4
>     do_group_exit+0x44/0xb0
>     __wake_up_parent+0x0/0x3c
>     invoke_syscall+0x50/0x120
>     el0_svc_common.constprop.0+0x4c/0xf4
>     do_el0_svc+0x30/0x9c
>     el0_svc+0x20/0x60
>     el0t_64_sync_handler+0xe8/0xf0
>     el0t_64_sync+0x1a0/0x1a4
>    Code: aa0003f5 a90153f3 f8408eb3 aa1303e0 (f85e8674)
>    ---[ end trace 39b2fa37509a2be2 ]---
>    Fixing recursive fault but reboot is needed!
>
> Fixes: 86c2a0f000c1 drm/msm: ("Small submitqueue creation cleanup")
> Reported-by: Steev Klimaszewski <steev@kali.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c         | 3 +++
>  drivers/gpu/drm/msm/msm_submitqueue.c | 4 ----
>  2 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index f350de754f84..938765ad7109 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -689,6 +689,9 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
>  	if (!ctx)
>  		return -ENOMEM;
>  
> +	INIT_LIST_HEAD(&ctx->submitqueues);
> +	rwlock_init(&ctx->queuelock);
> +
>  	kref_init(&ctx->ref);
>  	msm_submitqueue_init(dev, ctx);
>  
> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
> index 32a55d81b58b..7ce0771b5582 100644
> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> @@ -140,10 +140,6 @@ int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx)
>  	 */
>  	default_prio = DIV_ROUND_UP(max_priority, 2);
>  
> -	INIT_LIST_HEAD(&ctx->submitqueues);
> -
> -	rwlock_init(&ctx->queuelock);
> -
>  	return msm_submitqueue_create(drm, ctx, default_prio, 0, NULL);
>  }
>  

Have not seen the crash since applying the patch.

Tested-By: Steev Klimaszewski <steev@kali.org>

