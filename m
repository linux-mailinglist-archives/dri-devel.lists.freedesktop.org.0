Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 404E2AD565E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 15:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C822C10E65A;
	Wed, 11 Jun 2025 13:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hG2DfL5J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC4B10E65A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 13:02:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A1B61A4E5E3;
 Wed, 11 Jun 2025 13:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C76C4CEEE;
 Wed, 11 Jun 2025 13:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749646972;
 bh=GWYTVxKC93YJVMhVzanm/CX1o4JT55CaAW87EgvJi2k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hG2DfL5JR+8qDvnZmSLi/lKndMr1EnbHqsT75jBCcqxPrs46YBWQs78lBKvfIE+aC
 Ft54mn2k1z/VL94FG/gGRpAFTrRaNC2WrIJddrIdSTxXBdhZ11poBFM5GyIKizdlje
 XLei3+O+DuE8lYoCRgHIF7PTD81y3M8EX7/gvgRuJe7aWmOSpRkCP450dZW1rVp1Z+
 271mRK0wm/Wxo+Pbymb6PpDzhp7/YZF5km8FQlnR2xbYKftcYV784uiCDkHso6pVrU
 yVZ1Vy0MKOlQ4a+FR2WvVC+7/32bydLAzh0g3S0E3MX5pQZwhALd++Sh1U+r04u37P
 Y8AgWtX7mANzQ==
Date: Wed, 11 Jun 2025 18:32:43 +0530
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
 Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 05/12] tee: increase TEE_MAX_ARG_SIZE to 4096
Message-ID: <aEl-c-eoezGYKOpE@sumit-X1>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
 <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-5-024e3221b0b9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-5-024e3221b0b9@oss.qualcomm.com>
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

On Mon, May 26, 2025 at 11:56:50PM -0700, Amirreza Zarrabi wrote:
> Increase TEE_MAX_ARG_SIZE to accommodate worst-case scenarios where
> additional buffer space is required to pass all arguments to TEE.
> This change is necessary for upcoming support for Qualcomm TEE, which
> requires a larger buffer for argument marshaling.
> 
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  include/uapi/linux/tee.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> index 441d97add53f..71a365afb89b 100644
> --- a/include/uapi/linux/tee.h
> +++ b/include/uapi/linux/tee.h
> @@ -42,7 +42,7 @@
>  #define TEE_IOC_MAGIC	0xa4
>  #define TEE_IOC_BASE	0
>  
> -#define TEE_MAX_ARG_SIZE	1024
> +#define TEE_MAX_ARG_SIZE	4096
>  
>  #define TEE_GEN_CAP_GP		(1 << 0)/* GlobalPlatform compliant TEE */
>  #define TEE_GEN_CAP_PRIVILEGED	(1 << 1)/* Privileged device (for supplicant) */
> 
> -- 
> 2.34.1
> 
> 
