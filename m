Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C7E7E8D27
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 23:37:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC0610E279;
	Sat, 11 Nov 2023 22:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F6B10E279
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 22:37:18 +0000 (UTC)
Received: from [10.3.2.161] (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 500AE66073B7;
 Sat, 11 Nov 2023 22:37:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1699742236;
 bh=kcnph6BupyvfM+9WxwbNjoM/5J3WECWSWsxKnJmzdRs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QZCDibZ1rcDdpGmDidypOppeJpPvcPUEFLh4IHbD6yEps9nRQsqntDU24SrYoROVj
 kgemyecJDrWxndan6WyghUctxJsrTpm7uVeeXiWpk5R/7yGinogJT0YLh9iIN4AL6G
 J0leOmTmBIuTpKaVi4pKW7vxsQPANh/YVhG5//j757XDFeVvHNgMWjGO9phXAUmoFY
 cooWSwsqz3FYPrT9zIlpdVscTuQ49WQZwIa2uzkzQ2L8Qgu2XBJPNWTQXR1GXruq2Y
 DUsU4kWD/KqSXr3bnP4H0fXRkw2awF/y5diK4ENttbqlzRkOnIK8o1s5Hy14ANPQd1
 NSc5x7ZCzYp9A==
Message-ID: <9b2f45e1-ea49-97ae-e359-3f9c0996394f@collabora.com>
Date: Sun, 12 Nov 2023 01:37:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/2] drm/uapi: add explicit virtgpu context debug name
Content-Language: en-US
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 dri-devel@lists.freedesktop.org
References: <20231018181727.772-1-gurchetansingh@chromium.org>
 <20231018181727.772-2-gurchetansingh@chromium.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20231018181727.772-2-gurchetansingh@chromium.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: josh.simonot@gmail.com, kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/18/23 21:17, Gurchetan Singh wrote:
> +		case VIRTGPU_CONTEXT_PARAM_DEBUG_NAME:
> +			if (vfpriv->explicit_debug_name) {
> +				ret = -EINVAL;
> +				goto out_unlock;
> +			}
> +
> +			ret = strncpy_from_user(vfpriv->debug_name,
> +						u64_to_user_ptr(value),
> +						DEBUG_NAME_MAX_LEN - 1);
> +
> +			if (ret < 0) {
> +				ret = -EFAULT;
> +				goto out_unlock;
> +			}
> +
> +			vfpriv->explicit_debug_name = true;
> +			break;

Spotted a problem here. The ret needs to be set to zero on success. I'll
send the fix shortly. Gurchetan you should've been getting the
DRM_IOCTL_VIRTGPU_CONTEXT_INIT failure from gfxstream when you tested
this patch, haven't you?

Also noticed that the patch title says "drm/uapi" instead of
"drm/virtio". My bad for not noticing it earlier. Please be more careful
next time too :)

-- 
Best regards,
Dmitry

