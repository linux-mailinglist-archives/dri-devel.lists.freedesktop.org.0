Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F203641ADE2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 13:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CAC6E117;
	Tue, 28 Sep 2021 11:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C5F6E116
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 11:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632828823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u328q7WNSMymaUrmKQOk37LWvJYmT3DIFH6zimZGPjY=;
 b=YY2tBTrv/DcOVYtaQRg2YIgVqkS7ly8l6JMnaivskUswWmLCpW8uMaEJ73fBIjnakR34XE
 7ThIxq/U39eOXXgPc91c9S8g5rQ79dLAaiKW1e/c8HoQqUzdJhx9dkZM+kqAEbETMz0kfV
 mm9F2zkk40+QrfKkmGeSPUBwHNyV0/0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-EuYt8EBzNUCHDP2H_2VCOg-1; Tue, 28 Sep 2021 07:33:42 -0400
X-MC-Unique: EuYt8EBzNUCHDP2H_2VCOg-1
Received: by mail-wr1-f69.google.com with SMTP id
 j16-20020adfa550000000b0016012acc443so15022062wrb.14
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 04:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u328q7WNSMymaUrmKQOk37LWvJYmT3DIFH6zimZGPjY=;
 b=7Fygap8AkuhsuXHK9Jj6EN3Nfn12Hs7hp6QQx1HaZw4KFJjlEVlKsnDswjkAX/g3I0
 N6o2NQWkCNup3FgsihvnMLFpOUScWZveTf5K3/SwWL+/AljEoO1nZ23MCOVX24rD5otP
 nmlTTDB/DyiMaIwZ2O2nW6KSjrk35aGgTfFtrmT8rgHkrblJywttpcg6U6ztRpyUgvWN
 Sa2smuIucoxOUwpRKVti8q728W5kYxK19cEV7SYC2LHM7BsOXl/3FnFdfKQEqmOjx0hl
 1zU9hD+MsIeRGpH9A0n2a8Uv4cJl9VzdcWiz5sUBQVq/cW4hoF2Cwp1SScSehs09VNfo
 92BA==
X-Gm-Message-State: AOAM530GZfhGZzYzIuPQ1lqnu2rU3QE/PrspssFFfEm5qNFm7Q+YR4RL
 /yrkHRhMPtHcMAyl5f+CB1AobQe5Aqgxmi5g9ne02zQ55V6VqkXP06jyWnT/+l7zz9DgkvcmxjH
 MkcmhrwWJmJ0aGEc19AwHonqzYWt7H9gY64E82NxG13gR
X-Received: by 2002:adf:e44c:: with SMTP id t12mr5899186wrm.49.1632828821479; 
 Tue, 28 Sep 2021 04:33:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzz58XfMdNwS1JsheQmMOCdmsi2kubnksqbD9z+tXbyLb/8yux+PD/EOIxuFTfpkUkADbbnb+9ZEA793Gf+IR4=
X-Received: by 2002:adf:e44c:: with SMTP id t12mr5899164wrm.49.1632828821289; 
 Tue, 28 Sep 2021 04:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210911075023.3969054-1-yangyingliang@huawei.com>
In-Reply-To: <20210911075023.3969054-1-yangyingliang@huawei.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 28 Sep 2021 13:33:30 +0200
Message-ID: <CACO55ttfBAYcLUi7QGFupLFyUQZ2kDet+aABXWA0NVVx+cNEVg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/nouveau/kms/nv50-: fix file release memory leak
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 nouveau <nouveau@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Sat, Sep 11, 2021 at 9:45 AM Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> When using single_open() for opening, single_release() should be
> called, otherwise the 'op' allocated in single_open() will be leaked.
>
> Fixes: 12885ecbfe62 ("drm/nouveau/kms/nvd9-: Add CRC support")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/crc.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
> index b8c31b697797..66f32d965c72 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
> @@ -704,6 +704,7 @@ static const struct file_operations nv50_crc_flip_threshold_fops = {
>         .open = nv50_crc_debugfs_flip_threshold_open,
>         .read = seq_read,
>         .write = nv50_crc_debugfs_flip_threshold_set,
> +       .release = single_release,
>  };
>
>  int nv50_head_crc_late_register(struct nv50_head *head)
> --
> 2.25.1
>

