Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B861AA3DBAB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 14:49:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2D610E95E;
	Thu, 20 Feb 2025 13:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="F6tUSOJP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1C910E95E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 13:49:38 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-3072f8dc069so9448291fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 05:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740059376; x=1740664176; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JVChDugCDHNh1sYydRHTglk+V7CxAJZfPMAov1KRCoA=;
 b=F6tUSOJPoGo2U+v9fIFv5juGjT7EGAVyhEwyTqwPsvyEpy8sY4Vwvk8sx66aJzYZt6
 6abr7ZyGVOAVTOU3q3u4h5cvVgzXmcrU88UCZ/CwUw5qLhDxo5v6NPB8/2mlq+3lt46t
 PAOzevrDohNLOYejWgRJ0h4lSOO1Vnc9jEvSHQrwxHOChUZ/5K478XdhrUtktsm/9/QP
 GUwe02YhIChofIHJBLfR1WJtC3m0ge5YMx04NkXp+f9p5UrF4EzKPCYXAX4B2UvAB/jz
 rI/Kpbi1i00dKEH/OY6SA7Sdw4gWVfZY3Fr98pSBNS54c7VOLnX+Nn/bfyjSN6pxYq35
 lHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740059376; x=1740664176;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JVChDugCDHNh1sYydRHTglk+V7CxAJZfPMAov1KRCoA=;
 b=MPYoJeUfT/372EnnqWF/VUG7+PUYSEwPV5xPAx0R2XfsEZRd062VpKLMbdV+k5yUwJ
 5IzuXUjuep800mbzQkalmNnMjbd/m1oMrFYzn3lb8hkNgjgNan3RfiPO7UiVgZlBUlXw
 s/O5q4mChy615GoNjx7T1kt1KgVBrcxHPEiXDV9hgMro9IxvByt+ivVbM9s6WUejpJtT
 aQQtwyrX2y2BmIeHwEnokkueEFGyLExLrrqgYDaOE0q6lkRqD6ASdHhzqwTyApPn6UyZ
 BLERdlE1CWECMZ6DOyVd7Iwx+4+ODW/D91tzVqzzrreUG+oJFR6HIxVHaaameOAW6kRa
 9pTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCeeIz5Z+cTu/lPLD3y8AmVENaLlOM0yemsqIcxEjvRqUWcc8gnU8Mo3HMYdPllZeuSrCa32SFAQw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz//vn8sNJxceBfDkasn3Q/GGhyeGPcgE2tu1qGV0jSR8wJOwPe
 lVr9CzLqHOAaqJzH26NoP9PDiH4Nby5c2nbxNg1ke2zhgv49L9PjZfcp0O0+B9g=
X-Gm-Gg: ASbGncuj2EhgkGxldbTFg5Hzhv/jGpYK8kP+QB43zxDopGlEISSGAS4irvpp3cJ+reI
 7qx4xqbUzLxGH4XrEGg5d17Lk1paGu6dkOUNOaSQoJAsO9trw9nX2JMUIDd2oJ7rXOMoyGzrgFf
 UESicW793ohlJ1r+LxTgSQm/oqYBDkgkj1ww3PZ8xC2dYo2FbKsa3F/pApOCq1uy1S2zAcKWnY4
 020CW5N1IdgEmkYB8YPjBSvrMFNjBz+sbF2hH8irRfnmmxtJhXK5DiOzeL+F3YyEHYUZ5cFqk4k
 D4e97DjxnJ0hM3tywFjh6Lm+weSNPsfaCFGk8Yf45wPm1NvKXwh49wNafOrspC5iMKkg6TY=
X-Google-Smtp-Source: AGHT+IGsOfsqDJo7AefkxFTmXC+8Xia9z7Pzt320U3bkWePPHzHtswdcejk3sC0/NN4ev4LoA3nCRA==
X-Received: by 2002:a05:6512:2342:b0:53e:3a7c:c0b5 with SMTP id
 2adb3069b0e04-5462eedb4c9mr2941295e87.10.1740059376386; 
 Thu, 20 Feb 2025 05:49:36 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452e9099d8sm1939324e87.79.2025.02.20.05.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 05:49:35 -0800 (PST)
Date: Thu, 20 Feb 2025 15:49:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm: writeback: Fix kernel doc name
Message-ID: <xgkfvp7dmgzd64hriccbpyc2beoj7syiw2a5pgmtaao3fmlhdn@a5vudlyhzhqm>
References: <20250207-b4-fix-warning-v1-1-b4964beb60a3@bootlin.com>
 <9efc1ba4-89ad-4aed-b4d5-b0a53b120fd4@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9efc1ba4-89ad-4aed-b4d5-b0a53b120fd4@bootlin.com>
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

On Thu, Feb 20, 2025 at 01:51:37PM +0100, Louis Chauvet wrote:
> 
> 
> Le 07/02/2025 à 18:35, Louis Chauvet a écrit :
> > During the creation of drmm_ variants for writeback connector, one
> > function was renamed, but not the kernel doc.
> > 
> > To remove the warning, use the proper name in kernel doc.
> > 
> > Fixes: 135d8fc7af44 ("drm: writeback: Create an helper for drm_writeback_connector initialization")
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Closes: https://lore.kernel.org/all/20250207142201.550ce870@canb.auug.org.au/
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> Hi all,
> 
> Gentle ping on this patch. Can someone ack/review it so I can apply it on
> drm-misc-next?

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry
