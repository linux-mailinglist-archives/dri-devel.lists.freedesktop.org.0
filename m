Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEvSCu9apWlp+AUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 10:39:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB801D5A94
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 10:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5AD10E209;
	Mon,  2 Mar 2026 09:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="suTY8gcA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DFC10E471
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 09:39:55 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-483bd7354efso57371535e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 01:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772444394; x=1773049194; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:reply-to:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=JqpFEgvwHpU2hX5PSjnXyoj4uXycVqlvmrKK7iplIdY=;
 b=suTY8gcA7JS5RwayAWWWIVxrIHl6/22shKMfaISKmMrgDD72scy6oRz7eVv+7EqoUj
 IMhvfvvCWx3MlfZfpe+SmCutWRAlK5Z7Ra7ePPL1aiDmwtCHd5da2DK5SdljrqMM4NhL
 /OADbZV2+MU/U/qPfWU2yQUleC6biOqnYtO7FonbAaJGBS8tsjmL93ADB8SRgTHCJmMM
 bsXvpPUPsXH1yNYB//VnazuCiysCG9v3lT/t0i+yJRDiA5fhZwesoOqBPyXZ/1zut2OP
 Z2p1rsfQEUkuRj7ErPCeyxzk0NZ4ttdvmSbcJLJC4Vg/LY5FfELf5MISLEesBU8ybjzS
 qDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772444394; x=1773049194;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:reply-to:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JqpFEgvwHpU2hX5PSjnXyoj4uXycVqlvmrKK7iplIdY=;
 b=LIQbmdQvzOUzkTx4OqMJBi0sI2herxGxumK3rKYePoxmy+naEF5W3i3G4Ggs2sjBOn
 xPG33d+7V2STdxh+jVwaHRlKojNArMexGtJ1peCEGaPmiZiDTQX57uTd+qlzu0oNp0w4
 XG1IINwfbcHTWT4/DZV643JpcZq11+ntDkNl3K7aG8Y9coeipnmSPT6TQH5vT7WJBsq8
 1jA+Xsbq8os3fjm7o0QNbn20aZ1Xv2IutAs20qgPWWer0WyQ5Xgfi/Lz/we2wGN19g0a
 A8Dxx4lIkG9BvFbx8voqqFCIpSR3ANp4dteJCJg8RhOW6xH++qIdxN53OroFZZ3OKMvn
 ri2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXGUOWqd5qFvSHlPuWEM1GP0l1AEsdH76+qwzoqg9RueCduuDsJFQoV4kI5JomCss0+Af40X2Xutk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9DTLbH+gxm8BRnzDxB4kc0E4wb9fiyYVC+fSry8xgE/ujRPmx
 MC5M7eq67ZlPPOf9F0N08mELMZXDq/YNFNqhaD4f7dqzl1dQeT1hHSrptUnKZgWc0uQ=
X-Gm-Gg: ATEYQzxTdmpwo7CBt+CKlrx9TB//i5IloLb5do+n4dEUi8I+eTgyKrxXt6AioLFNGRR
 Pw54N0Z4NYD+LdK3zZUtpKDXtTzrdH87F0ekW069FT8H3jLm3jTgZ8JaaCWmo4y7pWQrOWkKCXF
 6ZxFee/0VZ3zPDk6kF5nbntdMCjGNceC/pJdYR92Qcn6x3/sh0Hntj42+vFc/pmS4efNEvMYjaz
 h/j9eGJk62thqcs1VxzYP2Oqo23E29EWUCgzSOnUaMAA9U0r6wt7r6jUvDLowUIG9lhjeKaqgED
 ECUL6PU2hL3ViTKQnWDBovD5ntbUT9CtpeSH6zeY3ExF8PS+/ER4Vawf4jig6YtB4qlo7ZjTJkd
 2FzkOj91r3Y3n5w9/VAzAhimhEJgDis5cH+jO3PgdaOC/rXPJUBr73LYghumAFRjXKj7OGyiict
 b/Z+gjWybOCUOBRwoiIJVtu1ep88AqCR9IKRJic+2MbVTyQVLHvPbsfbBS1m/p77XzAIp8yNUa/
 tFd
X-Received: by 2002:a05:600c:8711:b0:47e:e20e:bbb2 with SMTP id
 5b1f17b1804b1-483c9b970a5mr186563345e9.7.1772444394296; 
 Mon, 02 Mar 2026 01:39:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:c342:61e:309c:3478?
 ([2a01:e0a:106d:1080:c342:61e:309c:3478])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfba9a5esm272442605e9.4.2026.03.02.01.39.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 01:39:53 -0800 (PST)
Message-ID: <4d39b428-75ae-43a7-b423-d93d8396004c@linaro.org>
Date: Mon, 2 Mar 2026 10:39:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2] drm/msm/dpu: enable virtual planes by default
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260226-dpu-enable-virt-planes-v2-1-87971236fe86@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260226-dpu-enable-virt-planes-v2-1-87971236fe86@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,quicinc.com,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:mid,linaro.org:replyto,linaro.org:dkim,linaro.org:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 9AB801D5A94
X-Rspamd-Action: no action

On 2/26/26 14:49, Dmitry Baryshkov wrote:
> Turn on the switch and use virtual planes by default, enhancing
> utilisation of the display pipelines. It is still possible to use legacy
> implementation by using `msm.dpu_use_virtual_planes=false` kernel boot
> parameter.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> This is being sent as an RFT for now. Please give it a test with your
> compositor of choice. X11. Weston. Sway. Wlroot. CrOS. I plan to turn
> the switch for 7.1
> ---
> Changes in v2:
> - Rebased on msm-next
> - Updated the cover letter, targeting the switch to 7.1
> - Link to v1: https://lore.kernel.org/r/20250514-dpu-enable-virt-planes-v1-1-bf5ba0088007@oss.qualcomm.com
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 0623f1dbed97..7c5b3495bddf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -52,7 +52,7 @@
>   #define DPU_DEBUGFS_DIR "msm_dpu"
>   #define DPU_DEBUGFS_HWMASKNAME "hw_log_mask"
>   
> -bool dpu_use_virtual_planes;
> +bool dpu_use_virtual_planes = true;
>   module_param(dpu_use_virtual_planes, bool, 0);
>   
>   static int dpu_kms_hw_init(struct msm_kms *kms);
> 
> ---
> base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
> change-id: 20250514-dpu-enable-virt-planes-7b7ce0a6ce2a
> 
> Best regards,

LGTM

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
