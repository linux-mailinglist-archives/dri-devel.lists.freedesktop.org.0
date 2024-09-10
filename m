Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F39B3972A88
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 09:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4BC10E71B;
	Tue, 10 Sep 2024 07:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.b="vAtaZuy9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACDD10E71B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 07:22:42 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a8d29b7edc2so388604966b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 00:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.com; s=google; t=1725952961; x=1726557761; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=t2XzcGJ9CHpUVmI2Qjvu0h7RfZYDHRIyC3QcUD62zzQ=;
 b=vAtaZuy966+bP2AT4dT36RHZitPZaHprLPvjWUWYyh2g+SLstTq1MY07HOEgJfNlya
 ELOApDKLdpeZjtK9kxoMBFuFMwrdnXy1mv9m3FKc/4RGVbZqIM7eW5XX6MaDp2TzRdiE
 oYT2aJwSp77ALNIG0mFXneIfEAo+tmGJkOMKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725952961; x=1726557761;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t2XzcGJ9CHpUVmI2Qjvu0h7RfZYDHRIyC3QcUD62zzQ=;
 b=iGde76GmSulE3Afh358jcqcN/tslMefurF+c1MT5lJOrroxNUjDubRpJnRsvxoHmPd
 jUq0UKuVfhUSipeFbxmkCksBsztuTQgwj8dp9gJVOYLxiu1eTte6H56CSnckIV4S8UtU
 b9x+HrtEK2unbMinhP5i1DWp0NoRAgHD6zYsMuPec0ubc45ors7oWf/uqAjZ8UrYsYZq
 LqtgaGPRh2PVBIwqsGrQPza8aWY+FQy9bswf3IPQfItpHqkCXLPFEtCOdKQsR5zFOVJ8
 OIHYPP8hdJTRvf54M01RVy9dGW7eAkGRIfL8mZgOPvMgHe6G5eFUkauMB6tpjyq2RhPP
 XOtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXugv9xw7PCkzfRa1LKR+OLlsjWy1I/RsZA8vgSVSq/kHKo/cKABlFwV5LwpSQChedxPPGVuC6UCAk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaRyjxprvS/f3nFoKkdlKqiRun+tfXTS/nX8Jybc7ujI68Be1Z
 93cqIyDCh9DDSiS5jPUKwO7ipOhUh0a82wewehPrT6TJbuUDWAVSNBwxRoXAtEY=
X-Google-Smtp-Source: AGHT+IEguAdmxCBaR1QB8kCKr4wvM2lfEhrwmL0iuSI4thRN/LxomXCTbP9/stpoAL4vqJLfL4K0dw==
X-Received: by 2002:a17:907:3a96:b0:a8b:154b:7649 with SMTP id
 a640c23a62f3a-a8b154b790dmr817815766b.15.1725952959944; 
 Tue, 10 Sep 2024 00:22:39 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25ce9277sm447915066b.149.2024.09.10.00.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 00:22:39 -0700 (PDT)
Date: Tue, 10 Sep 2024 09:22:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Sam Ravnborg <sam@ravnborg.org>,
 xen-devel@lists.xenproject.org, Jason Andryuk <jason.andryuk@amd.com>,
 Arthur Borsboom <arthurborsboom@gmail.com>, stable@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbdev/xen-fbfront: Assign fb_info->device
Message-ID: <Zt_zvt3VXwim_DwS@macbook.local>
References: <20240910020919.5757-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240910020919.5757-1-jandryuk@gmail.com>
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

On Mon, Sep 09, 2024 at 10:09:16PM -0400, Jason Andryuk wrote:
> From: Jason Andryuk <jason.andryuk@amd.com>
> 
> Probing xen-fbfront faults in video_is_primary_device().  The passed-in
> struct device is NULL since xen-fbfront doesn't assign it and the
> memory is kzalloc()-ed.  Assign fb_info->device to avoid this.
> 
> This was exposed by the conversion of fb_is_primary_device() to
> video_is_primary_device() which dropped a NULL check for struct device.
> 
> Fixes: f178e96de7f0 ("arch: Remove struct fb_info from video helpers")
> Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
> Closes: https://lore.kernel.org/xen-devel/CALUcmUncX=LkXWeiSiTKsDY-cOe8QksWhFvcCneOKfrKd0ZajA@mail.gmail.com/
> Tested-by: Arthur Borsboom <arthurborsboom@gmail.com>
> CC: stable@vger.kernel.org
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> The other option would be to re-instate the NULL check in
> video_is_primary_device()

I do think this is needed, or at least an explanation.  The commit
message in f178e96de7f0 doesn't mention anything about
video_is_primary_device() not allowing being passed a NULL device
(like it was possible with fb_is_primary_device()).

Otherwise callers of video_is_primary_device() would need to be
adjusted to check for device != NULL.

Thanks, Roger.
