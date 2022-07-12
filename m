Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AF95712F0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 09:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667A511AECC;
	Tue, 12 Jul 2022 07:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E5B11AECC
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 07:18:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F08BF6145E;
 Tue, 12 Jul 2022 07:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A891C3411E;
 Tue, 12 Jul 2022 07:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1657610283;
 bh=z4IW8CyCNKewOiEMx21gPmE/TlmZbo7uErzj1tCUxPA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yUroBLU+6EdrWtNipGeYGmY8DxSnJBO0cIm2+No8LZRSRPlO4JCfV/qejbeXDu0U2
 YlgIXfeKtjxGQnBLY2ryjH4g7Agg47QelLioXxrkP9QQGAoZdMVebRIGPqce9uOhTb
 CDuWWa8r6AjGVspOCheuJ06FiwSfZp5KFpRyh0LM=
Date: Tue, 12 Jul 2022 09:17:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiangshan Yi <13667453960@163.com>
Subject: Re: [PATCH] component: replace ternary operator with min()
Message-ID: <Ys0gJlsZap/Qd1Gi@kroah.com>
References: <20220712071223.301160-1-13667453960@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712071223.301160-1-13667453960@163.com>
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
Cc: Jiangshan Yi <yijiangshan@kylinos.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rafael@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 12, 2022 at 03:12:23PM +0800, Jiangshan Yi wrote:
> From: Jiangshan Yi <yijiangshan@kylinos.cn>
> 
> Fix the following coccicheck warning:
> 
> drivers/base/component.c:544: WARNING opportunity for min().
> drivers/base/component.c:740: WARNING opportunity for min().
> 
> min() macro is defined in include/linux/minmax.h. It avoids
> multiple evaluations of the arguments when non-constant and performs
> strict type-checking.
> 
> Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
> ---
>  drivers/base/component.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/base/component.c b/drivers/base/component.c
> index 5eadeac6c532..349c54694481 100644
> --- a/drivers/base/component.c
> +++ b/drivers/base/component.c
> @@ -541,7 +541,7 @@ int component_master_add_with_match(struct device *parent,
>  
>  	mutex_unlock(&component_mutex);
>  
> -	return ret < 0 ? ret : 0;
> +	return min(ret, 0);

This is a traditional "if there is an error, report it, otherwise return
0" pattern, and not really a min() call.  So perhaps the original should
stay, or be turned into:
	if (ret < 0)
		return ret
	return 0;
to make it more obvious?

thanks,

greg k-h
