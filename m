Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E859EAE6C81
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 18:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4FC10E111;
	Tue, 24 Jun 2025 16:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KHzmhfDh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2933410E111
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 16:35:19 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-735b9d558f9so213303a34.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 09:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750782919; x=1751387719; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rSz1JFe75zgnTFQjk7azgszRdIK56k+5FDXoGc03hUA=;
 b=KHzmhfDh18szYbacB9SkfibdU4ITYjDDlIPbtsEWFOE6bIIKi0SumaxgpbKDgTn7wR
 QNhKmnDs4cOgFxn/Cjh0PB4tKTWJCL8M+oHTuBH6//lPvn8Wvh648jQjD5vCOmVIDjhJ
 4t1Da2L2YUGKYPMwp6LMlYieIUpk+Fr1RmQd0VfsDZExHK/ival/BpF3N161Nma353Dm
 wPQWQpZN4GO6qjugxZ2MF/zuXVW3h6iqZ6g+yfWnG02YcSm/MyHlLLxBNtv+4UujQWhm
 A+kGasoqWm8fwo8piLxyEkFw4L83hVy2iBx9FoLeEQPEUkNI5V2jz33CHp79PVh+4kcT
 UJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750782919; x=1751387719;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rSz1JFe75zgnTFQjk7azgszRdIK56k+5FDXoGc03hUA=;
 b=tsgAS6ZBSjCZTXs1ex6kaeX0bi9u8sDE12RlZtJj2xWcRfX8dJ3NcrffvS3YTUbHK/
 opwLRyd6N8fKAMv1QttbVUQLH5vCBVSJ5NMu1P2q9IcLR3vFQjxEa5HQS8lEYS4wIVHG
 DSCGoQmg5nR8Igj3AYPlp37GjZ5g6U+Ct/TncxcRDn314HjU8XASkNC7pOvOrIkDfHZ4
 rn8h6tBr1AlmEow+Cml0VUjTw8F7MadJqoNv9cz55kaQTO8JH/qdZZAClnZvQA4naOXn
 ATTXZp9M9VlDyZg4cLyF4dIGr+aI2/wM68XlpyTNtaZfPsgU5kDqlsHSs5bPpUnHGBF/
 hEgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPBZwCSMtRmtVJqDDooWwpyyCYfRtJCR1H08MJPdmtgpqYig7wl3CMtomKL38ePcSJO//DSErAESo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxNRQ84xTExqA6Y+BZkA8I/irblXrnhMlC72iKBZ5uD5F2B3/c
 5RbUFvKo/tY+tHSJJkCUrpRvCGC3ejrhin7E6YMJfFk0EE4ffJo7CcMIbY6FD2XjBt0=
X-Gm-Gg: ASbGnctx8/iXsGQS+4mHJLspWNRWJ9TTRkdIWaUFi1UJFZqJHd86wS0nn52+WGpOIi6
 E7XiM6X4OLDBjJ31RK+mrkd7jEIE0biL/kKTtXNuSYOQO3YDth2q4v2hHR9TSbZKRVSh0LHWTOM
 2PohM+XmBepC5jSYcY4ompIRWe+Sziri8TxvaOc8ob20UweCLVm8MnNTyH987B40c0KT+ezbLxd
 pxoCvTPaFJmNiJOKrNsJK1n0OrmYyMK/nJbY4E4iAjK/J/sDZ8TYghg+GGS867o8CPCUPhK0NdZ
 fNz3EHCRgpSLcENwTd7HfdCPxfkbQUIRweWC5JK008YoNtedJ6JKEQPCSMV5pDqG/z+D4w==
X-Google-Smtp-Source: AGHT+IGLBmzoZDcj+02IHdZnbhdqNE7ZpcxtaWGwO/yBFtE/sR9o3STi9jOIWS56QlRwP/UQ/l/YfA==
X-Received: by 2002:a05:6870:a44d:b0:2df:5323:520b with SMTP id
 586e51a60fabf-2eeee4e4535mr11595383fac.19.1750782918736; 
 Tue, 24 Jun 2025 09:35:18 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:22c9:dcd3:f442:dd1d])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6115b7a1d04sm1323856eaf.20.2025.06.24.09.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 09:35:18 -0700 (PDT)
Date: Tue, 24 Jun 2025 19:35:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: Colin Ian King <colin.i.king@gmail.com>,
 Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/vmwgfx: fix missing assignment to ts
Message-ID: <0b83e41e-7bb3-4e20-b568-12feaf73a79c@suswa.mountain>
References: <20250623223526.281398-1-colin.i.king@gmail.com>
 <CAO6MGtiLtHKk3tuvxpz5wEC8PxshANhdP97MQ+jD9euu8UmYxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO6MGtiLtHKk3tuvxpz5wEC8PxshANhdP97MQ+jD9euu8UmYxQ@mail.gmail.com>
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

On Tue, Jun 24, 2025 at 10:02:41AM -0500, Ian Forbes wrote:
> On Mon, Jun 23, 2025 at 5:35 PM Colin Ian King <colin.i.king@gmail.com> wrote:
> >
> > The assignment to ts is missing on the call to ktime_to_timespec64.
> > Fix this by adding the missing assignment.
> >
> > Fixes: db6a94b26354 ("drm/vmwgfx: Implement dma_fence_ops properly")
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> 
> Was this caught by a compiler warning? I'm surprised I didn't get some
> sort of warning for this.
> 

We've disabled uninitialized variable warnings in GCC.  Perhaps
Clang would have caught this but I'm not sure because tracking
uninitialized struct members is a bit more complicated than tracking
uninitialized variables.

regards,
dan carpenter

