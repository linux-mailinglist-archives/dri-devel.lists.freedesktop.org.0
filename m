Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7915A140472
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 08:25:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDA86F3ED;
	Fri, 17 Jan 2020 07:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B946F3ED
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 07:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
 bh=xkBF8jCSOWPumWg9R+MOpddk9K9WEJFLsXsk5vUpwbU=; 
 b=ctgc1bMFPsEvVCcRWuutv+YO2ueOPTps5Bt6MPdOZxl0KloyUOn9f0hYS7JBAP89XHhp/vfRf7bptujxrAIlMsrG0sWnRbKLIAuU7iS9+xFRPoZ8VL+OvJ7WMAu1kkK7v3nMnJ3y3hIxjvVhUeA8s0Wcjg080Em0FF8EeHom99OO8mLi13fCUVAKq5Pj50iiEdcc4m63hho9fAfWt+TAU3Zyf0QCRtiYU9AMd98dJqiA64iCO3yjrPiofo+VNVdjjJ74qNABJwgbedobd2rr8QEMJduQYJOcFwUubSPhukHyPiVuM1DC7scKUrxgryJ2apfGF+D9rINzKTEEJhxXrw==;
Received: from [192.168.10.170] (helo=ip170.dynamic.igalia.com)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1isM0Y-00039r-B1; Fri, 17 Jan 2020 08:25:30 +0100
Message-ID: <cb93a21557216d1b389390c556f421132aac88f0.camel@igalia.com>
Subject: Re: [PATCH AUTOSEL 5.4 003/205] drm/v3d: don't leak bin job if
 v3d_job_init fails.
From: Iago Toral <itoral@igalia.com>
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
Date: Fri, 17 Jan 2020 08:25:30 +0100
In-Reply-To: <20200116164300.6705-3-sashal@kernel.org>
References: <20200116164300.6705-1-sashal@kernel.org>
 <20200116164300.6705-3-sashal@kernel.org>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sasha,


please notice that there were two separate patches that addressed the
same issue and applying both simultaneously leads to a double free
(which is what I see is happening with this patch: see the second call
to kfree(bin) right below the one added here). This issue was raised
previously here:

https://lists.freedesktop.org/archives/dri-devel/2019-October/241425.html

Iago

On Thu, 2020-01-16 at 11:39 -0500, Sasha Levin wrote:
> From: Iago Toral Quiroga <itoral@igalia.com>
> 
> [ Upstream commit 0d352a3a8a1f26168d09f7073e61bb4b328e3bb9 ]
> 
> If the initialization of the job fails we need to kfree() it
> before returning.
> 
> Signed-off-by: Iago Toral Quiroga <itoral@igalia.com>
> Signed-off-by: Eric Anholt <eric@anholt.net>
> Link: 
> https://patchwork.freedesktop.org/patch/msgid/20190916071125.5255-1-itoral@igalia.com
> Fixes: a783a09ee76d ("drm/v3d: Refactor job management.")
> Reviewed-by: Eric Anholt <eric@anholt.net>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/v3d/v3d_gem.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c
> b/drivers/gpu/drm/v3d/v3d_gem.c
> index 19c092d75266..6316bf3646af 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -565,6 +565,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void
> *data,
>  		ret = v3d_job_init(v3d, file_priv, &bin->base,
>  				   v3d_job_free, args->in_sync_bcl);
>  		if (ret) {
> +			kfree(bin);
>  			v3d_job_put(&render->base);
>  			kfree(bin);
>  			return ret;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
