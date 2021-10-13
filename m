Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B81B542BE5F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 13:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5826EA16;
	Wed, 13 Oct 2021 11:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7946EA16
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 11:00:15 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id q5so1948336pgr.7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 04:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nQQWQUgxuW6Tu+PRvCtkwuIVHgAhZ7y427FiGzCqW1I=;
 b=zuDceFqPkzhsXg/5Ra0cCOC1bU0nBHOgMC+yisKtXJINh/T8f5KQ5Xk3tN1hEQWy1f
 fF/5Ti7SlnxHTZ8CRdyv6Jl7qV6+yL697U37ZNkhKajiI+l/0MJiVPCdQ2f0nPB60e3l
 deL9dfPtSkXLUF1i0K5lBK/jrlNzSLsedO4pErBw8lcHrmTQsFpVw/Kq9PVvZIU+2X3S
 BjO3inmiQSb4KC3RcJr5s4SFs01LRfMOjiO3Y4IdS3Rj0CRwh+XHIqdFiSxlkBam0yxV
 rxKuYNPGd/pLOsHpTEsqWBSUGsQm4kgH2TClaSNsf9ya4bJIDlxKTpNOca2+BLM7jp/t
 D1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nQQWQUgxuW6Tu+PRvCtkwuIVHgAhZ7y427FiGzCqW1I=;
 b=S2PUtL04k1Oz3B5sqMcQuf4PMcyMse5YO8H5esdPb6qd55VmiFi84XpNviREc3qEZw
 gzkdXqN+dB6K9tVkr0JoAaadRasY2twe0o8VRvqyT5Jh5nhdrEhhF/2SlWoFbveZj0/z
 tL0FBCiAUOye3pjFQ2ZJLpKFzRHI/Sp9qCBxMbHs6F6P4kCRIlOBupxZWyb3kdbSinyR
 Hsvff0gUShYMLG88QKtcF8otcG49uYDIXSexsxJDnWwlR1gTc7SL1FkZxNmMo3T9McDY
 U6svs20vBb7sSD7ddlfdJUVMu9/Mmc9H0+AUrfKWoGNTyVQX6fX48uhBlUZne+/DWzsP
 M7hw==
X-Gm-Message-State: AOAM531uO+ryICD4KWXPm7/kp0yNHpH37zk82z8mWoATrUNQszN9ae4K
 ifXqxa83foN246EkLW7cAzeQUA==
X-Google-Smtp-Source: ABdhPJxhzjNSoABq+dGG77CzsRDyX+40KYVEdGsQI8qW5B1JHU6i8UmOJoBqJRMmoCIvhAQ+em8rxg==
X-Received: by 2002:a63:2dc7:: with SMTP id
 t190mr27705777pgt.455.1634122814960; 
 Wed, 13 Oct 2021 04:00:14 -0700 (PDT)
Received: from localhost ([106.201.113.61])
 by smtp.gmail.com with ESMTPSA id g189sm5284657pfb.75.2021.10.13.04.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 04:00:14 -0700 (PDT)
Date: Wed, 13 Oct 2021 16:30:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jeff Dike <jdike@addtoit.com>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Amit Shah <amit@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gonglei <arei.gonglei@huawei.com>, "David S. Miller" <davem@davemloft.net>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 Viresh Kumar <vireshk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jie Deng <jie.deng@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 Kalle Valo <kvalo@codeaurora.org>, Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 David Hildenbrand <david@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Eric Van Hensbergen <ericvh@gmail.com>,
 Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-um@lists.infradead.org, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, iommu@lists.linux-foundation.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 nvdimm@lists.linux.dev, linux-remoteproc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, kvm@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH RFC] virtio: wrap config->reset calls
Message-ID: <20211013110012.3exppbls2wggqfhb@vireshk-i7>
References: <20211013105226.20225-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013105226.20225-1-mst@redhat.com>
User-Agent: NeoMutt/20180716-391-311a52
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

On 13-10-21, 06:55, Michael S. Tsirkin wrote:
> This will enable cleanups down the road.
> The idea is to disable cbs, then add "flush_queued_cbs" callback
> as a parameter, this way drivers can flush any work
> queued after callbacks have been disabled.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  drivers/gpio/gpio-virtio.c                 | 2 +-
>  drivers/i2c/busses/i2c-virtio.c            | 2 +-

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
