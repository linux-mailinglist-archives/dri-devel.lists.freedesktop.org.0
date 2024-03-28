Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AD9890339
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 16:39:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781D511249E;
	Thu, 28 Mar 2024 15:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OSsmWM+H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5C511249E
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 15:39:18 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-6e6b6f86975so760528b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 08:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711640358; x=1712245158; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mPjQD/vT8EW8FIsS5EhEUvjw7Yq2DPw74odbleQjQC0=;
 b=OSsmWM+H5B9/Hfu0Q8pRuf8YfAUbMz8SVzqTbewN4VjI1ViYPo030rWpA80DYjpOAd
 tajvoaThW0oM4CT1yUiH0efZzEpvgLZMesODI/Eu3vHiktht9iDG5TQUDJO3t8vBJE6P
 e4N5FiRuJCh/Q3RVVmURhS2vlDHT3psyz85oj9/H0p+z0CM8g8toWbVbE6B/1yTbdixJ
 b7SybPir6pWbF0a+LUasAV34xklltBCR93g0KZcnWbY55xu+Zvw22G9kJLiUhYDz6UPy
 9q2nfjA7h4MBA4y7sAytHtPzjTiaiaGdPyvZ/hRHMDdA8utANwdMJgXns68otxis0aiw
 TqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711640358; x=1712245158;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mPjQD/vT8EW8FIsS5EhEUvjw7Yq2DPw74odbleQjQC0=;
 b=lGpSAkgcLF0oj+bSekiRu625eD3MGo56j+YhInrA4V4XnY+1VhLJj0uvqSeNEr+MZV
 eU0kWkF0jr9wJsFECfRsIHHzGd272ty4nK3528gFj8uw4lNu5n6CXk3Q0oDbakBNSFRz
 s/dhnFOBfKkMJux8MB+lP5Z+NCAqXCHHe9Z4dWRdPq++LX9YnlkuIln1c4sYkpTwj6bP
 NVtvacChGp1Cmu3NQR7bgTqKd7i2/yg+RVuJ8OGAd+TwiXPmpFJUWFSIHHE3CJP1CAnR
 jGAY/w7aOtDOMVKuqX0VGxQY6BMvjMWIceEX+xXROL6BRnuROwO6qEtEOE3ZDuGdh5h9
 hgsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRpJ3xyvIacqNCLyjsUs1Ne3uYkSF/NYYCTWcQsflHQlrlrgydc0Qr4j+cKL+1UzS+V41QB9g8/pm9mNodoodDJsann/4r/CbmCgKv6Jaa
X-Gm-Message-State: AOJu0YyBunxcmbsFJ1Ppe2QotW5BQsTRt5xjNZzxMxKouNqz2mIWXZ7w
 nvLp7yjKVYnQejPDhIgV4wxlkdLC/qZk5X7T+6nWMM5OQ57MPZgXYjD0qO3YbDc=
X-Google-Smtp-Source: AGHT+IGhUQYINGDQ7hWfiGCoXweY10vLCz/e/x+HjJ8dVvYs43ivIcKXZCgoqnZGIv+19J3DIwIpug==
X-Received: by 2002:a05:6a00:a12:b0:6ea:92a7:fb82 with SMTP id
 p18-20020a056a000a1200b006ea92a7fb82mr3800870pfh.27.1711640357806; 
 Thu, 28 Mar 2024 08:39:17 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ff63:c57b:4625:b68c])
 by smtp.gmail.com with ESMTPSA id
 e2-20020aa798c2000000b006ea923678a6sm1505830pfm.137.2024.03.28.08.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 08:39:17 -0700 (PDT)
Date: Thu, 28 Mar 2024 09:39:10 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Amit Shah <amit@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gonglei <arei.gonglei@huawei.com>, "David S. Miller" <davem@davemloft.net>,
 Viresh Kumar <vireshk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Alexander Graf <graf@amazon.com>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Kalle Valo <kvalo@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Vivek Goyal <vgoyal@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 virtualization@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, netdev@vger.kernel.org, v9fs@lists.linux.dev,
 kvm@vger.kernel.org, linux-wireless@vger.kernel.org,
 nvdimm@lists.linux.dev, linux-remoteproc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 19/22] rpmsg: virtio: drop owner assignment
Message-ID: <ZgWPHntosUk+5qac@p14s>
References: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
 <20240327-module-owner-virtio-v1-19-0feffab77d99@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327-module-owner-virtio-v1-19-0feffab77d99@linaro.org>
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

On Wed, Mar 27, 2024 at 01:41:12PM +0100, Krzysztof Kozlowski wrote:
> virtio core already sets the .owner, so driver does not need to.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Depends on the first patch.
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 1062939c3264..e9e8c1f7829f 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -1053,7 +1053,6 @@ static struct virtio_driver virtio_ipc_driver = {
>  	.feature_table	= features,
>  	.feature_table_size = ARRAY_SIZE(features),
>  	.driver.name	= KBUILD_MODNAME,
> -	.driver.owner	= THIS_MODULE,
>  	.id_table	= id_table,
>  	.probe		= rpmsg_probe,
>  	.remove		= rpmsg_remove,

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> -- 
> 2.34.1
> 
