Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 599A0B2215A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 10:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE9710E0FF;
	Tue, 12 Aug 2025 08:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kxpgntL+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7146D10E0FF
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 08:39:59 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-459ddada9b1so48257625e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 01:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754987998; x=1755592798; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PfCe+Hab0EGiwiSh46Us94InqOs3PEdCxahZrUvq8fY=;
 b=kxpgntL+fH1UQA2oVMgoH/fkCh/JK1uzY+dtdjdm5bBXgn8LLQZJJ6xLnWHTmDoRy6
 ZP+cxM+5O800xNtqOzepA/2ADPp927VxkQivRIoXmKBI6GNUDieQiPPYqvA5soBmWVTp
 6z2nNj3rwcmxAhgsyA2PjqkZ6uaFVPfr3SCjPyOJcbL2tKv0APmqjHPzkyUt/qcZMXsX
 +J/SGoUXxEj8kaUNRq4gRI5dxTRA0JW9y2Hi2rMF2p+oE/mWEd5Uwi3qzoIO+bB/BTIJ
 /2qxI1bYOFI3FZmLt/u7MOhTO8l7Xi6o8Azgs5ckRCw/YUl0KPh4gxi7oS/uoouHvw0R
 n9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754987998; x=1755592798;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PfCe+Hab0EGiwiSh46Us94InqOs3PEdCxahZrUvq8fY=;
 b=qZLNizkcvsuKhCiyxBIjCiWROwdoZKvA5ZGUq/cNGE0OfSKB8m2hiGC4LdPaBSR6Op
 1f9eUkRMG5x98uX7xpOhYSADcEdkUEek+LgLzyedDuO6EYRxWPFtQRnCEQBSany37VLb
 sSwofbYcJVYRyV4XIL3Ht58T0gsFR9FhrW0I4r+YAIdc9Lu4Moyvj+z33r3KxE5r5dxl
 gC1/JChPvAn0qvGLCzyhdpzupGWCM5ESHGxFGbQzgnZlKIXlvcvYRuKdx7t4pulF80Sf
 P1BxbqcJABcZNU/+IkE5dtAK0L5AqEfmfhEmThU/s7j8ZF8SUYM/FqJ+n0NKDsIP5XG0
 ktoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5EKdjcsn9Gt8Tn+w+7VSpSRRM5l7Ejl9WZ/Nd3NtnexrII6isoadBQxKkR0A8ZGPAcYgUvztybp4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLjdKgpzBmzej1+3VdYBOKgCguqwqK43cigiWY7KxU6ceroe0L
 ynEwqJJY/YnjdXNaFvYTMICu/fTYr3e/d9o25eSZtc+QhXOg+32udsuL9CNgc/wW+Ek=
X-Gm-Gg: ASbGnctojG3w9b3gnYhpUN3TSQcI/1DKg0ZASlUVN/OSU4aHh+0u7qkvN5v19F2MxRq
 LgIhgvFeIjJQCSda1rR172IKqLUnUaz9AAIO0WhCSLwcOqLcWdPbOZjzCKDa21nBcLYS5AzbE1V
 4NEXNK3z1jIOmOTzXGD0b80Bty9WUP6vrhXG7TyJFPV+srxOEVEeqmKGyhhb5Irh9so151NDD0P
 i+Ja6IQB5ITsSpAsfVSyX7TN4mr2uEBMo5HfxjIR9LB5hJCZGsA9n2UMgydNEDSv0GPbIlrHiW5
 M/swuz73MM8QisOvUQVIoU+uw5vbWuShHFqqOqG2KcyiBg9x+ilWR5kUkse27tb3FdfG5B9zI+a
 lrq8foUW6aDbqv0qvhtoBtxnpIsKE+cpNYoFvYKC3dJvMZLivD+kyBQ==
X-Google-Smtp-Source: AGHT+IE8bA/wEEcwiHAKiaf7wSlcuwAOC59hiKgi/SIS6TbVIxNjim6ybFDyEh6Rbupki1OUm1hb0g==
X-Received: by 2002:a05:600c:1caa:b0:456:e39:ec1a with SMTP id
 5b1f17b1804b1-459f4ec3a43mr156381895e9.14.1754987997836; 
 Tue, 12 Aug 2025 01:39:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-459d712c386sm370853285e9.23.2025.08.12.01.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 01:39:57 -0700 (PDT)
Date: Tue, 12 Aug 2025 11:39:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
 hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/vkms: Assert if vkms_config_create_*() fails
Message-ID: <aJr92bN5iQnIzTbP@stanley.mountain>
References: <20250811101529.150716-1-jose.exposito89@gmail.com>
 <91587a35-f884-46ad-9869-126d3efbfc61@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91587a35-f884-46ad-9869-126d3efbfc61@bootlin.com>
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

On Mon, Aug 11, 2025 at 07:21:18PM +0200, Louis Chauvet wrote:
> 
> 
> Le 11/08/2025 à 12:15, José Expósito a écrit :
> > Check that the value returned by the vkms_config_create_*() functions is
> > valid. Otherwise, assert and finish the KUnit test.
> > 
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/dri-devel/aJTL6IFEBaI8gqtH@stanley.mountain/
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> 
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> I am not sure on how to use smach, I don't have any warning at all for the
> whole kernel, so I will wait for Dan Carpenter review before applying.
> 

Looks good.  Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

> Side question: should we use __must_check in this case to warn at compile
> time?

We wouldn't normally...  It turns out the existing code was already
checking for errors so this is really just a "silence the checker"
patch.

regards,
dan carpenter

