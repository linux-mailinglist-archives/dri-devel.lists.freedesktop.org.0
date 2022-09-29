Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F109B5EFA72
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19AF210E627;
	Thu, 29 Sep 2022 16:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBA510E61B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 16:28:57 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 130-20020a1c0288000000b003b494ffc00bso3016481wmc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 09:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=QYOc+OHLL6KTLMFJnSaBlHOJKuyxaHY1IrKcRU6FlxE=;
 b=i7VvxBKe42H0wsYkketjbbO1S+y1ZSB9UCVHGjDGb7VMh78L9uFyy8OZ2uDv3J8Ueg
 LlJsnL8zy1piibOOibuYeYPZMAPJp42W54K/9j8ZwEvXa/MsYfrGEMNAXRXV7AaDv+of
 B6CDddpZbCqkR7Lm+fb45H4uvRFKTiu7Gx5JrXP/2HJLTOtMwEXrASNPNYwTLUGVxcwR
 Ok92NyPQloOxe/geRO2TxRXDE/FhGR5mtUzHghPSfsi4LULskZ2/Xnz8Oe0uKlgvv9Z+
 zFEjb+MQ13Q9UjWzscxvyVLuLeQPxpEOzrj13sZlWT2unhHj0JFAc7OBNqOxxAEi4zY1
 67Fg==
X-Gm-Message-State: ACrzQf17KJtIaqvtIYB8tFc9kFRitBu8AOKpLJgArPrnjOwPAkmAPKz1
 fuSrZ0UPOuj4hgLe0ul76hw=
X-Google-Smtp-Source: AMsMyM5b/OYKlGx3DqtnOYo7cHOWYylUcTVvTbFZnkntH3B86vTEuk1JHoRmIuzJA2Zq7X3vY5YMPw==
X-Received: by 2002:a05:600c:a14e:b0:3b4:7ff1:299b with SMTP id
 ib14-20020a05600ca14e00b003b47ff1299bmr11387647wmb.18.1664468935378; 
 Thu, 29 Sep 2022 09:28:55 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id
 q14-20020adfea0e000000b00228d7078c4esm7232054wrm.4.2022.09.29.09.28.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 09:28:54 -0700 (PDT)
Date: Thu, 29 Sep 2022 16:28:53 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
Subject: Re: [PATCH] drm/hyperv: Add ratelimit on error message
Message-ID: <YzXHxf/5WaiIrqMi@liuwe-devbox-debian-v2>
References: <1662736193-31379-1-git-send-email-ssengar@linux.microsoft.com>
 <88fab56a-f6e5-bae0-5ed7-1e01c070d136@suse.de>
 <20220911161142.GA7754@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220911161142.GA7754@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
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
Cc: linux-hyperv@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 airlied@linux.ie, ssengar@microsoft.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mikelley@microsoft.com,
 drawat.floss@gmail.com, Wei Liu <wei.liu@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 11, 2022 at 09:11:42AM -0700, Saurabh Singh Sengar wrote:
> On Sat, Sep 10, 2022 at 08:06:05PM +0200, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 09.09.22 um 17:09 schrieb Saurabh Sengar:
> > >Due to a full ring buffer, the driver may be unable to send updates to
> > >the Hyper-V host.  But outputing the error message can make the problem
> > >worse because console output is also typically written to the frame
> > >buffer.
> > >Rate limiting the error message, also output the error code for additional
> > >diagnosability.
> > >
> > >Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
> > >---
> > >  drivers/gpu/drm/hyperv/hyperv_drm_proto.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > >diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
> > >index 76a182a..013a782 100644
> > >--- a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
> > >+++ b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
> > >@@ -208,7 +208,7 @@ static inline int hyperv_sendpacket(struct hv_device *hdev, struct synthvid_msg
> > >  			       VM_PKT_DATA_INBAND, 0);
> > >  	if (ret)
> > >-		drm_err(&hv->dev, "Unable to send packet via vmbus\n");
> > >+		drm_err_ratelimited(&hv->dev, "Unable to send packet via vmbus; error %d\n", ret);
> > 
> > I better option would probably be drm_err_once(). Then you'd get the
> > first error message and skip all others.
> 
> Thanks for your comment however the intention here is to limit the printk messages and break the chain
> rather then printing only once. There can be cases where at different point of time we again get a
> ring buffer full condition and we don't want to miss that. We should get the message for each of these
> errror which are widely-separated in time not just the first time.

Applied to hyperv-next. Thanks.
