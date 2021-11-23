Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 668DF45AB77
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 19:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBD06E095;
	Tue, 23 Nov 2021 18:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FDF6E095
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 18:47:39 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id x15so95735253edv.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 10:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LKJrDfQmwKaC53bj2iHawRUpVnad+wbaQMjhFO5RDyA=;
 b=BtRqghgRFhUtoNOS+OOnBF8RzAgbmUSpkNjprtb4qFgZVgl8RJKGI4sW5b7Svcsb3k
 2IDgBK9w+bUYEkOcy2U4dO0mL865Er+SgF1I3ppCRoEFtvCk93SbYAfMXpJ1nxh0FIlM
 mKXCwU3D5yufMN1Y7gMYvt8RKB128jBlnsXu9qjzSC4/soJLngUtBe95Scl7vFjf0DrK
 A3nlIgRa7/+Jqmzp8tKbbiW4EN/MDwg+3sjQr0RgBt8aRQ/s8/92NskDPJpSz6NPdseW
 iR3QjDgMa4V7K2x/EIB05RrcwpXIPFjBiCZX72oigvKNo8Q/oVFOtWrnLEYS6qir+RQX
 Ty8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LKJrDfQmwKaC53bj2iHawRUpVnad+wbaQMjhFO5RDyA=;
 b=zbmpez0BCyLwbON+EhtcQGIEDI6ORUvYujlSmIW9XdVZGqs6Ui4sex7+u9ndBPYu+I
 YWrKyibmQcVMpNuWSF0RrC4NAgaV7J6AhcVFPVbUfODKBC3/EKdWYKfwiw7yNNoUc2mQ
 i93wqdt40g/iWKycYL7Qtykyh2FaLQpSEw6Fskx1GF2DMhrBw0UIslw+xOr6HPfrETg0
 4WkfL72C55ddTyuCnMUipR22W6UddCK00ZmrgoPf3A84dDuDjT+d9xVK6DbGIuwVZkHL
 fTiImp7DvpZBY95qKnFsZvvZZnNPL/ZyvlBO2xs/Rpv+V0qZ2naKhCz/Au2vLTL0t1O0
 CKMg==
X-Gm-Message-State: AOAM531I5yt14x4kpabLCXwnc4FGMr+4J6lrn+3vxIiL9ivEuRKppMna
 4LzdStDxyRaWQvNBm4Uuegx+RixCgYBpjr8UdAY=
X-Google-Smtp-Source: ABdhPJxDgvQbGh55arMTMvVVtGGMagNZkVz0+HZG7Jro3W6BzwdGTZ5kJmTH/FQ23iQpqvxdZHZroQyzUbbdqNziWiY=
X-Received: by 2002:a17:907:6d05:: with SMTP id
 sa5mr10579024ejc.246.1637693257678; 
 Tue, 23 Nov 2021 10:47:37 -0800 (PST)
MIME-Version: 1.0
References: <20211118111632.GE1147@kili>
In-Reply-To: <20211118111632.GE1147@kili>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 23 Nov 2021 10:47:26 -0800
Message-ID: <CAPaKu7RKuHNfy4ANqfCCVGMhrTd7y-kMpJvz+UP7U2o=i4OJbg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/virtio: Fix an NULL vs IS_ERR() bug in
 virtio_gpu_object_shmem_init()
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
 NET AND BLOCK DRIVERS" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 18, 2021 at 3:16 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The drm_gem_shmem_get_sg_table() function never returns NULL.  It returns
> error pointers on error.
>
> Fixes: c66df701e783 ("drm/virtio: switch from ttm to gem shmem helpers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: I originally sent this patch on 19 Jun 2020 but it was somehow
>     not applied.  As I review it now, I see that the bug is actually
>     older than I originally thought and so I have updated the Fixes
>     tag.
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
