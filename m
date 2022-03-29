Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F78A4EB69A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 01:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFAB10F1AD;
	Tue, 29 Mar 2022 23:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF7910F195;
 Tue, 29 Mar 2022 23:17:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 31C6A1F44074
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648595851;
 bh=vNOmry5ThwZXsotfcrBezmCsAHRH+JMNFUfaSsIR1GY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=D4P34mYNJY6M7Oz8ATv7zNF8aeyzQ2jScIuorEl7BXVhy3SrlRhjvPvzZczvzXyKa
 WjScuOK6EJM040rfOLlkgvoeO7A0n4GrlLpbl+l1agHYy0on9x+TpKw0dZVmZYCSgW
 c5ZdbL4hVqVe6DfgZw9LMT8DhovSzp3goCLGL/tsGNX4tstvvytqBS84uxiZMSq2hx
 kNK86GV8wFomze2ERyiokH6qPpIC+4p0WT3BfjEmciFMar+6uLSNba2MvG9+Sga0De
 DE7RccOC5/qo9tk0dibZzuU1oRwS+x7gqXYDGGEeN5JTnlbYhaevaY8M+yKE50vfRy
 UU9LWMInwT2wA==
Message-ID: <74a98688-67ad-6f8d-da1e-8fa0b32cff71@collabora.com>
Date: Wed, 30 Mar 2022 02:17:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 9/9] drm/msm: Add a way for userspace to allocate GPU iova
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220329230105.601666-1-robdclark@gmail.com>
 <20220329230105.601666-10-robdclark@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220329230105.601666-10-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/30/22 02:00, Rob Clark wrote:
> +static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
> +		struct drm_file *file, struct drm_gem_object *obj,
> +		uint64_t iova)
> +{
> +	struct msm_drm_private *priv = dev->dev_private;
> +	struct msm_file_private *ctx = file->driver_priv;
> +
> +	if (!priv->gpu)
> +		return -EINVAL;
> +
> +	/* Only supported if per-process address space is supported: */
> +	if (priv->gpu->aspace == ctx->aspace)
> +		return -EINVAL;

nit: -EOPNOTSUPP ?
