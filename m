Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 743719134E8
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2024 17:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B1B10E183;
	Sat, 22 Jun 2024 15:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="fuFcoEsd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Fri, 21 Jun 2024 08:53:22 UTC
Received: from out30-110.freemail.mail.aliyun.com
 (out30-110.freemail.mail.aliyun.com [115.124.30.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EAFE10F0D2;
 Fri, 21 Jun 2024 08:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1718960000; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
 bh=3vsqKJpmmEF1YlrnBNdvTctEj6bpEdbnO2+TdQxtZ1w=;
 b=fuFcoEsdAFokX+FAU7v5lBdzGEpY06XStm74nNChWL4AL1Mun0YCLTXplQEaV+GBRhdbgnE5JnuAcioK8TX+mYYmtGn0pTGNzJtWsV7CxwJIJqzYx0k/QXJ3HuwVN4MJ7LDIKCdFPZZJ7tJZsQJW4KHI/tv1CenVCi4ipNCAmMU=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R981e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033037067112;
 MF=hengqi@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0W8vhyN2_1718959694; 
Received: from 30.221.148.166(mailfrom:hengqi@linux.alibaba.com
 fp:SMTPD_---0W8vhyN2_1718959694) by smtp.aliyun-inc.com;
 Fri, 21 Jun 2024 16:48:15 +0800
Message-ID: <78a99414-314d-452e-938b-07e86182a8bf@linux.alibaba.com>
Date: Fri, 21 Jun 2024 16:48:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/qxl: Add check for drm_cvt_mode
To: Chen Ni <nichen@iscas.ac.cn>
Cc: virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 airlied@redhat.com, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 noralf@tronnes.org
References: <20240621071031.1987974-1-nichen@iscas.ac.cn>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <20240621071031.1987974-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 22 Jun 2024 15:43:41 +0000
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


在 2024/6/21 下午3:10, Chen Ni 写道:
> Add check for the return value of drm_cvt_mode() and return the error if
> it fails in order to avoid NULL pointer dereference.
>
> Fixes: 1b043677d4be ("drm/qxl: add qxl_add_mode helper function")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>   drivers/gpu/drm/qxl/qxl_display.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
> index c6d35c33d5d6..86a5dea710c0 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -236,6 +236,9 @@ static int qxl_add_mode(struct drm_connector *connector,
>   		return 0;
>   
>   	mode = drm_cvt_mode(dev, width, height, 60, false, false, false);
> +	if (!mode)
> +		return 0;
> +
>   	if (preferred)
>   		mode->type |= DRM_MODE_TYPE_PREFERRED;
>   	mode->hdisplay = width;

Reviewed-by: Heng Qi <hengqi@linux.alibaba.com>

Thanks.
