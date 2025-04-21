Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84231A94F54
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 12:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088D210E088;
	Mon, 21 Apr 2025 10:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vIvT1Q2b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEAF10E088
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 10:18:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4B76E5C4814;
 Mon, 21 Apr 2025 10:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A7AC4CEE4;
 Mon, 21 Apr 2025 10:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745230738;
 bh=8Ffn2L/E0jE5G4k79DkPy1qxCBgnq2nUNskI3OC5VYc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vIvT1Q2b+urrArvw0pMf7nki2sOwhMimV+cTWMMxX2mdc7xoOo73naTPPmuav+9UT
 y2v9P5elcn4StqqYSTIFW4ljb0Qn0PcVgR7WN7YMgwRDpFmTSCLZH16XKzT9tMlPgF
 xuZF5kNkJLmBrtqgVrOgaCIiccOV5a4QZofRqKLwjJqI3R898RBLaH3mPT3Z1W5IZE
 Ww3TlB9j04jXctgTguQFCredejFVaRGmryL4IFT08RGNrtAIkty9VWuYx4BKgRhCph
 lcG7Pi8Q0qQWMnbUeecWd55ncbeq2fQfF5g5LhchReHmN1sSeYh52Ixq6BNTKNyuHe
 kObt26Hr32aVw==
Date: Mon, 21 Apr 2025 15:48:48 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 01/11] tee: allow a driver to allocate a tee_device
 without a pool
Message-ID: <aAYbiAOyYkYob3rU@sumit-X1>
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
 <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-1-7f457073282d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-1-7f457073282d@oss.qualcomm.com>
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

On Thu, Mar 27, 2025 at 07:47:23PM -0700, Amirreza Zarrabi wrote:
> A TEE driver doesn't always need to provide a pool if it doesn't
> support memory sharing ioctls and can allocate memory for TEE
> messages in another way. Although this is mentioned in the
> documentation for tee_device_alloc(), it is not handled correctly.
> 
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/tee/tee_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index d113679b1e2d..24edce4cdbaa 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -888,7 +888,7 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
>  
>  	if (!teedesc || !teedesc->name || !teedesc->ops ||
>  	    !teedesc->ops->get_version || !teedesc->ops->open ||
> -	    !teedesc->ops->release || !pool)
> +	    !teedesc->ops->release)
>  		return ERR_PTR(-EINVAL);
>  
>  	teedev = kzalloc(sizeof(*teedev), GFP_KERNEL);
> 
> -- 
> 2.34.1
> 
> 
