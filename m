Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9050E4E8600
	for <lists+dri-devel@lfdr.de>; Sun, 27 Mar 2022 07:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564F210E3B3;
	Sun, 27 Mar 2022 05:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gateway22.websitewelcome.com (gateway22.websitewelcome.com
 [192.185.46.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DE510E3B3
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 05:38:09 +0000 (UTC)
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
 by gateway22.websitewelcome.com (Postfix) with ESMTP id DCAA82FFB
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 00:38:07 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
 by cmsmtp with SMTP
 id YLbLn8lYNdx86YLbLnmuTI; Sun, 27 Mar 2022 00:38:07 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BoZuv/9DcRoaynINRpapPayPOCj/UW/KOGZtheWpl6g=; b=nsbzF968mDXRHlfCjmCfVCzcXs
 boxwI0gpNVWTaETOXxvOQz4jrYIHqbzH3Ly2qTDmULePGx7yzAUPzH8w4zi/WUd6t7HVhN7yPqr9g
 jrGP4nLezsuHdUEAc/7khJ7k8ov7TKuVgQdvoDa016BqCTXozTwGD3qZ7XsFsJuimmkObCCK4z/BK
 fTD189BnS4epLA84i8B04dihsc6BvR6BQD5IPSDn8Wzl15Ja0cMVkDOAoDU3k5OK/9Jyqcib7DKHl
 IkDiCPnbAdxJDzgkzvg/Ln7oEYyeHg27ykTNQxbAAo1trrWsvG5VwotosQiKunMNAkjS1w7NbPuqQ
 p6s0oyiA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:54512)
 by bh-25.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@roeck-us.net>)
 id 1nYLbL-004H8z-7i; Sun, 27 Mar 2022 05:38:07 +0000
Message-ID: <80429172-37c6-c9ce-4df7-259bb90338a8@roeck-us.net>
Date: Sat, 26 Mar 2022 22:38:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] device: fix missing check on list iterator
Content-Language: en-US
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>, bskeggs@redhat.com
References: <20220327053139.2572-1-xiam0nd.tong@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220327053139.2572-1-xiam0nd.tong@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nYLbL-004H8z-7i
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 [108.223.40.66]:54512
X-Source-Auth: linux@roeck-us.net
X-Email-Count: 4
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
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
Cc: kherbst@redhat.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/26/22 22:31, Xiaomeng Tong wrote:
> The bug is here:
> 	lo = pstate->base.domain[domain->name];
> 
> The list iterator 'pstate' will point to a bogus position containing
> HEAD if the list is empty or no element is found. This case should
> be checked before any use of the iterator, otherwise it will lead
> to a invalid memory access.
> 
> To fix this bug, add an check. Use a new value 'iter' as the list
> iterator, while use the old value 'pstate' as a dedicated variable
> to point to the found element.
> 
> Cc: stable@vger.kernel.org
> Fixes: 9838366c1597d ("drm/nouveau/device: initial control object class, with pstate control methods")
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
> ---
>   drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
> index ce774579c89d..6b768635e8ba 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
> @@ -72,7 +72,7 @@ nvkm_control_mthd_pstate_attr(struct nvkm_control *ctrl, void *data, u32 size)
>   	} *args = data;
>   	struct nvkm_clk *clk = ctrl->device->clk;
>   	const struct nvkm_domain *domain;
> -	struct nvkm_pstate *pstate;
> +	struct nvkm_pstate *pstate = NULL, *iter;
>   	struct nvkm_cstate *cstate;
>   	int i = 0, j = -1;
>   	u32 lo, hi;
> @@ -103,11 +103,16 @@ nvkm_control_mthd_pstate_attr(struct nvkm_control *ctrl, void *data, u32 size)
>   		return -EINVAL;
>   
>   	if (args->v0.state != NVIF_CONTROL_PSTATE_ATTR_V0_STATE_CURRENT) {
> -		list_for_each_entry(pstate, &clk->states, head) {
> -			if (i++ == args->v0.state)
> +		list_for_each_entry(iter, &clk->states, head) {
> +			if (i++ == args->v0.state) {
> +				pstate = iter;

Is iter and the assignment really necessary ? Unless I am missing something,
list_for_each_entry() always assigns pos (pstate/iter), even if the list is
empty. If nothing is found, pstate would be NULL at the end, so

>   				break;
> +			}
>   		}
>   
> +		if (!pstate)
> +			return -EINVAL;
> +
... just this check should do to cover both the "not found" and "list empty"
cases.

Thanks,
Guenter

>   		lo = pstate->base.domain[domain->name];
>   		hi = lo;
>   		list_for_each_entry(cstate, &pstate->list, head) {

