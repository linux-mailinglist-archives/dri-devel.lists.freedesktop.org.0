Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CB1476E4D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 10:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7A510E4F1;
	Thu, 16 Dec 2021 09:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 479 seconds by postgrey-1.36 at gabe;
 Thu, 16 Dec 2021 09:52:46 UTC
Received: from relay.hostedemail.com (relay029.a.hostedemail.com
 [64.99.140.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1C210E5A7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 09:52:46 +0000 (UTC)
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay11.hostedemail.com (Postfix) with ESMTP id 9AB54809C7;
 Thu, 16 Dec 2021 09:44:45 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf19.hostedemail.com (Postfix) with ESMTPA id 2848120030; 
 Thu, 16 Dec 2021 09:44:44 +0000 (UTC)
Message-ID: <c0adb7fef6d51691e864fdaef5595a9014b12f1e.camel@perches.com>
Subject: Re: [PATCH v2] drm/tilcdc: add const to of_device_id
From: Joe Perches <joe@perches.com>
To: Xiang wangx <wangxiang@cdjrlc.com>, jyri.sarha@iki.fi
Date: Thu, 16 Dec 2021 01:44:43 -0800
In-Reply-To: <20211216092652.33414-1-wangxiang@cdjrlc.com>
References: <20211216092652.33414-1-wangxiang@cdjrlc.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2848120030
X-Spam-Status: No, score=-1.79
X-Stat-Signature: 1ejh8eydgrzx5rpem8djar6wyzg5mp6s
X-Rspamd-Server: rspamout06
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX185wlLD3hW15ItyHxqsUmsy66CD1KCd2q0=
X-HE-Tag: 1639647884-52255
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, tomba@kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2021-12-16 at 17:26 +0800, Xiang wangx wrote:
> struct of_device_id should normally be const.
[]
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
[]
> @@ -60,7 +60,7 @@ void tilcdc_module_cleanup(struct tilcdc_module *mod)
>  	list_del(&mod->list);
>  }
>  
> -static struct of_device_id tilcdc_of_match[];
> +static const struct of_device_id tilcdc_of_match[];

This line could likely be removed instead.

$ git grep -w -n tilcdc_of_match
drivers/gpu/drm/tilcdc/tilcdc_drv.c:63:static struct of_device_id tilcdc_of_match[];
drivers/gpu/drm/tilcdc/tilcdc_drv.c:590:static struct of_device_id tilcdc_of_match[] = {
drivers/gpu/drm/tilcdc/tilcdc_drv.c:595:MODULE_DEVICE_TABLE(of, tilcdc_of_match);
drivers/gpu/drm/tilcdc/tilcdc_drv.c:603:                .of_match_table = tilcdc_of_match,

> @@ -587,7 +587,7 @@ static int tilcdc_pdev_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static struct of_device_id tilcdc_of_match[] = {
> +static const struct of_device_id tilcdc_of_match[] = {
>  		{ .compatible = "ti,am33xx-tilcdc", },
>  		{ .compatible = "ti,da850-tilcdc", },
>  		{ },


