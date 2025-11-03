Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1656EC2AE13
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 10:55:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FAEF10E39D;
	Mon,  3 Nov 2025 09:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="WjHqLbTe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA6910E39D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 09:55:42 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-470ff2f6e56so81215e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 01:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762163740; x=1762768540;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/iKwbtWviZdAY+4F++DJl0rWWY/RQA9LSGiuI2/hl/A=;
 b=WjHqLbTeaihn0zyC2YkqBlvPkzyIXcI3WyrujAMOoihlnHLdqx6bmKOk7maHnzRdhz
 L/8tGP+MWDxdp9uasMfJfpQji3XzEGwO90JOfQfZvCH3Q16lV7nqMzBEPYdheSemkOvw
 /cW1urRZ1C+RHKyUYugIBWikLF04OKsypSE1F4qydXE2xORyuTv72KSOPcAkhweYg2rE
 8EjPRFQkdIio2eUdHBNJ8OaD7j42HeZxL3oennFo6FUy4GyGV0jM/7+bSHTddBYvGVCL
 zOPPg2DTEFMLOxfJX/lxYY4aAB56UA0ecqm+7Kv/yu8nnu+FlQxioLNSgro6dYrT/Tsf
 mjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762163740; x=1762768540;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/iKwbtWviZdAY+4F++DJl0rWWY/RQA9LSGiuI2/hl/A=;
 b=uXOfm/tOk5hA40q8+DKoH6pmnhNBOLo3yOmLi88/cG0/Fcyat4OCIBYBQDZ0pu71yt
 me1LWNFiQoybqruDYC4+8qW25DCuZvNzBxMx8BTgoIurvwtGBlaCdWKv2UiDk/wkemG5
 4BgwaE5qWIX96zKPAUTmJAZoVmdb3XZXPyjpxrc2zii7gDww6csPAR/GRVJ9do4yH0F6
 rj1FubN6uv0id5GimYPkb2kkwpAy/rhXNqZl+tahB0N6qlz1c1jAOG3XRLZSv9+zL77A
 XUWa8WF1apJ6HLsVuUgAKQDYfe/7MzsVT7kvzGkGkEiAbUCzT1eK0Ql+Kw5gImbTnJdM
 IEKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4fQnXyiHDyPyS+6+5r5eomPNgpwzHnDOwr51uFKUBbr51N00Emnqo+efSta/Feqq6UOmjqVYm4SY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcTRZ1Jv58xSD+wv5ts05TQDbmMGRiL4cb138S8yWn3FkV/+xt
 yTTyISamqY9ozQ0LAnZk1RfjPQL05dG7TOSejEZGsy2c35iImf5wusPoDTaDlEtG7g==
X-Gm-Gg: ASbGncuBxdqlnyjm9zGxSvWBh7Zvb4nkjPskTA8F759eW5Bl7SOu7CPOBLw+nWNA6f5
 7BR9tItWhleuOK3R2t3AO3KETTc/QcEv1kVzyCfQWObuQnMUikVA65djcv5Rnu8ZmgA2K7/Kmg6
 Hd8hvmZd9cMYA0Y99qTL7pc9KG0LwxIZ6KdIkoL2S9ODLiROj3jdu5YRSnWLus0/0YfbPrIpm16
 l0Hcc+/Akhx263AeS/p+PQ+EGG2m3SkERhaQxAXKCNojPEvZ6ZDXJfMaLKWaZGo5h9xth0d6KO+
 JmCdh0ORVFM/yRtzFVfN3inoMp47mLRUC7tM4P8/Gvop4BdRrW1STlEzw1iCt2bGSBnh4oiK/Gl
 MVdRixGqi8yAmxgGzKBNLz7PbGJpJoozsojxA5tKgk5GwvQZCtdzykeT5+FcFC0TSqLV2Ez01Q+
 Yyi899uWH/iyvXQkyeRzPMmM9pBgI3vRfKgWe2uFCX6JSu7FO4Zw==
X-Google-Smtp-Source: AGHT+IHAx+AWORE9paLXTzRW7mKzqe0hb2wtQ9DF+W6v23M9Vo/fGIuffOpRO4zhYPoMBhdyXFmsSw==
X-Received: by 2002:a05:600c:8a0d:20b0:477:255c:bea8 with SMTP id
 5b1f17b1804b1-4773da9baeemr5918155e9.7.1762163740369; 
 Mon, 03 Nov 2025 01:55:40 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com.
 [34.140.140.54]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c13ebfe8sm19975798f8f.35.2025.11.03.01.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 01:55:39 -0800 (PST)
Date: Mon, 3 Nov 2025 09:55:36 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Pranjal Shrivastava <praan@google.com>, qat-linux@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 virtualization@lists.linux.dev, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, patches@lists.linux.dev
Subject: Re: [PATCH 14/22] vfio: Require drivers to implement get_region_info
Message-ID: <aQh8GG15d_-Ge2Xx@google.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <14-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
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

On Thu, Oct 23, 2025 at 08:09:28PM -0300, Jason Gunthorpe wrote:
> Remove the fallback through the ioctl callback, no drivers use this now.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  drivers/vfio/vfio_main.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index a390163ce706c4..f056e82ba35075 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -1297,13 +1297,13 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
>  		break;
>  
>  	case VFIO_DEVICE_GET_REGION_INFO:
> -		if (!device->ops->get_region_info)
> -			goto ioctl_fallback;
> -		ret = device->ops->get_region_info(device, uptr);
> +		if (unlikely(!device->ops->get_region_info))
> +			ret = -EINVAL;
> +		else
> +			ret = device->ops->get_region_info(device, uptr);
>  		break;
>  
>  	default:
> -ioctl_fallback:
>  		if (unlikely(!device->ops->ioctl))
>  			ret = -EINVAL;
>  		else
> -- 
> 2.43.0
> 
