Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD7224D4AA
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 14:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4BA6E10E;
	Fri, 21 Aug 2020 12:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A43F6E10E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 12:07:31 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07LC73JE030109;
 Fri, 21 Aug 2020 07:07:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1598011623;
 bh=Elz/9n2A7E9MeIn4e8Ei1rQfUn6BwgGav4oa/R3NlgY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=oBK7zLkdjltsOOeJe+AYO98TES7rye9lU54yuwIZH8hY0Xs4Ga1AfGvYkcJXuBaUC
 nlICVFizJ5QEdy0mQhackZOQZjMJVArHnZwwVon3MX7gWDAAT4CBxbO6B4hzGztdxW
 s5mvAMhM/DQGZ9By8k8zX/hrUt53oy2w8/O3S5hY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07LC72PV056631
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 21 Aug 2020 07:07:03 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 21
 Aug 2020 07:07:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 21 Aug 2020 07:07:02 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07LC6x4O110362;
 Fri, 21 Aug 2020 07:07:00 -0500
Subject: Re: [PATCH] drm/omap: Fix runtime PM imbalance in dsi_runtime_get
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, <kjlu@umn.edu>
References: <20200821074506.32359-1-dinghao.liu@zju.edu.cn>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <5123d7ae-f491-d2d2-788d-b5250ae9e31d@ti.com>
Date: Fri, 21 Aug 2020 15:06:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200821074506.32359-1-dinghao.liu@zju.edu.cn>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: David Airlie <airlied@linux.ie>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 zhengbin <zhengbin13@huawei.com>, Tony Lindgren <tony@atomide.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 21/08/2020 10:45, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter
> even when it returns an error code. However, users of
> dsi_runtime_get(), a direct wrapper of pm_runtime_get_sync(),
> assume that PM usage counter will not change on error. Thus a
> pairing decrement is needed on the error handling path to keep
> the counter balanced.
> 
> Fixes: 4fbafaf371be7 ("OMAP: DSS2: Use PM runtime & HWMOD support")
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index eeccf40bae41..973bfa14a104 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -1112,8 +1112,11 @@ static int dsi_runtime_get(struct dsi_data *dsi)
>  	DSSDBG("dsi_runtime_get\n");
>  
>  	r = pm_runtime_get_sync(dsi->dev);
> -	WARN_ON(r < 0);
> -	return r < 0 ? r : 0;
> +	if (WARN_ON(r < 0)) {
> +		pm_runtime_put_noidle(dsi->dev);
> +		return r;
> +	}
> +	return 0;
>  }

Thanks! Good catch. I think this is broken in all the other modules in omapdrm too (e.g. dispc.c,
venc.c, etc).

Would you like to update the patch to cover the whole omapdrm?

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
