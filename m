Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E653D765584
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 16:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6EA10E58B;
	Thu, 27 Jul 2023 14:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA9910E584;
 Thu, 27 Jul 2023 14:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From
 :References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QX1DDbxtMHuXEHnDb3PgOVQ6vlS0/4xc4UqVjWUbjmo=; b=GnbO5RQPlbPLUaAuvsA9HsDUsC
 mRfaetpSt3/eLZ34Kp3HOSuhBwNp42cTIfBeaJWsIeFdgjL4+Bd2j9sIf0PMqYVXaJIdjdcvuNGIT
 S9NDLls3U/ifL7ZVl8nRQdJk6KBgn5GrSHpWQxyHJJYkD0nyNYDwdrGTxFLIA7LwP9RB+a2zLjddH
 ybufO7StERiAH4IMvZ/A+Xk/YOqpiYR+wpFo5L53koEB+jh2F5iECSTaauEVV2kyA/DR7/T/ShGDl
 jtw/pgD+wT4w06+QOZfldWLgRfQ1wjIROx/LdnwBiXqhXzht3Fxq3DN5TH36s6bVgr7bGa0GnOqMT
 pBPCXjJg==;
Received: from [187.36.235.191] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qP1Yc-004feF-GX; Thu, 27 Jul 2023 16:01:34 +0200
Message-ID: <daaf05b5-3b18-c365-62e8-e7848c403ab7@igalia.com>
Date: Thu, 27 Jul 2023 11:01:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, emma@anholt.net, mwen@igalia.com
References: <20230718-nsecs_to_jiffies_timeout-constant-logical-operand-v1-0-36ed8fc8faea@kernel.org>
 <20230718-nsecs_to_jiffies_timeout-constant-logical-operand-v1-1-36ed8fc8faea@kernel.org>
From: Maira Canal <mcanal@igalia.com>
Subject: Re: [PATCH 1/2] drm/v3d: Avoid -Wconstant-logical-operand in
 nsecs_to_jiffies_timeout()
In-Reply-To: <20230718-nsecs_to_jiffies_timeout-constant-logical-operand-v1-1-36ed8fc8faea@kernel.org>
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
Cc: trix@redhat.com, intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 ndesaulniers@google.com, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, justinstitt@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nathan,

On 7/18/23 18:44, Nathan Chancellor wrote:
> A proposed update to clang's -Wconstant-logical-operand to warn when the
> left hand side is a constant shows the following instance in
> nsecs_to_jiffies_timeout() when NSEC_PER_SEC is not a multiple of HZ,
> such as CONFIG_HZ=300:
> 
>    In file included from drivers/gpu/drm/v3d/v3d_debugfs.c:12:
>    drivers/gpu/drm/v3d/v3d_drv.h:343:24: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
>      343 |         if (NSEC_PER_SEC % HZ &&
>          |             ~~~~~~~~~~~~~~~~~ ^
>    drivers/gpu/drm/v3d/v3d_drv.h:343:24: note: use '&' for a bitwise operation
>      343 |         if (NSEC_PER_SEC % HZ &&
>          |                               ^~
>          |                               &
>    drivers/gpu/drm/v3d/v3d_drv.h:343:24: note: remove constant to silence this warning
>    1 warning generated.
> 
> Turn this into an explicit comparison against zero to make the
> expression a boolean to make it clear this should be a logical check,
> not a bitwise one.
> 
> Link: https://reviews.llvm.org/D142609
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Thanks for all the hard work with clang! Let me know if you need someone
to push it to drm-misc-next.

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/v3d/v3d_drv.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> index b74b1351bfc8..7f664a4b2a75 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -340,7 +340,7 @@ struct v3d_submit_ext {
>   static inline unsigned long nsecs_to_jiffies_timeout(const u64 n)
>   {
>   	/* nsecs_to_jiffies64() does not guard against overflow */
> -	if (NSEC_PER_SEC % HZ &&
> +	if ((NSEC_PER_SEC % HZ) != 0 &&
>   	    div_u64(n, NSEC_PER_SEC) >= MAX_JIFFY_OFFSET / HZ)
>   		return MAX_JIFFY_OFFSET;
>   
> 
