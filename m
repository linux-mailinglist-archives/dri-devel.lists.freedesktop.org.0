Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 096C0978F9D
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2024 11:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC0C10E266;
	Sat, 14 Sep 2024 09:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fDLB1vee";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C2C10E095
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Sep 2024 01:17:10 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2d86f71353dso2015210a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 18:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726276630; x=1726881430; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PTN/Iyx1fmNv4bUuNCbr/8MD5bSrQHUUXAacttKOu3k=;
 b=fDLB1veeWlAjD01xkGkdz3DICpJF2Ae3iU8bMJeO0bUi9x4ZYHh11HWkV9Wj4a3y/O
 VPUaspYIw12sXFSbSGU5NwvfBWW67anD1/s6SE2C+K1mlxBNggyUpwUuRbgbBNSocyKz
 35thURH7cSEjhNfALM7+cer5zCs79aakn5LEAt3/YGo9zIV/OvrZ83Wez37eCGAsyGAZ
 ivMhK1g/IDhw0VYA5Qv7WXJL2gs/TcHIJTAwB8Q6qgHW/wi7z/iGWOkVs0o1QJnhdgYf
 rT7P6rqOr1fi9nf9E6rtKppJQQUTYnLGF12f0aIgR5MmpLF6DxOI5iQ3g7C32b3Jrcwe
 +Nzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726276630; x=1726881430;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PTN/Iyx1fmNv4bUuNCbr/8MD5bSrQHUUXAacttKOu3k=;
 b=WJFRpMs5BjvX08NbpfWi5p0iaT0IhiVRJ04lZ3RFjbgtR75G4jhYm1iwQo7L9yq+Id
 krm17KQJgwwFW708d+4PcBwYyxX+jeOvob+DwdJ65f8lqbuWTKxBS5ihR/PwLUXTSb/O
 pVFNQEITXijthrT8h5Rthkdy0vpUcbyisCsGpk2VY2jBAihUKgxLsabk6bGC2y/XXh33
 vXdgeNGvmz9CgMbkXdMKp4S5w3ONMIWjT4BvQGqL6CCuX5WlBB0cZfF/GcRVzROVrtHw
 3/oQqS5RjDN4663rP23e6r4WbrXdvkAFEN3g8M8IgwmPrK1UVHKBbgt/RI7Qdc35KQOL
 LKvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXsw7knNk757jj1MIdJGAB892dyEUhjEIBf7Bh4myBpwac6eW3qaXlpUoq+unRX+chg/BQOojxdGs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrxhhX5J+d0BOt0lPD5BNhtrOHK02P8XK8M8CwsjBtm97loA77
 Pe00SPheWcRZFoOVyj+rXhXhB9A/0tY8BE/l0Mtyr0aQblFwatrG
X-Google-Smtp-Source: AGHT+IGMf7gnqJVZSKs42t/gcn1+j6/nD/tGqsbkcOn8iLdJLkWkWIxDqgRtg60Y5HjYECc6+vcQVA==
X-Received: by 2002:a17:90a:d346:b0:2d8:dd14:79ed with SMTP id
 98e67ed59e1d1-2dba0048e18mr8253613a91.31.1726276629951; 
 Fri, 13 Sep 2024 18:17:09 -0700 (PDT)
Received: from geday ([2804:7f2:8006:9f55:654b:622b:2859:2848])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2dbb9ccb87dsm2460726a91.32.2024.09.13.18.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 18:17:09 -0700 (PDT)
Date: Fri, 13 Sep 2024 22:17:00 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Hugh Cole-Baker <sigmaris@gmail.com>,
 ALSA-devel <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [RESEND PATCH v2] drm/bridge: dw-hdmi-i2s: set insert_pcuv bit
 if hardware supports it
Message-ID: <ZuTkDMx4qalIFKdH@geday>
References: <Y01E5MvrnmVhnekO@geday>
 <9b0a0cd8-0994-4235-9823-37f0da1a751d@gmail.com>
 <ZuSufaLavkdMdsSL@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuSufaLavkdMdsSL@geday>
X-Mailman-Approved-At: Sat, 14 Sep 2024 09:50:57 +0000
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

On Fri, Sep 13, 2024 at 06:28:34PM -0300, Geraldo Nascimento wrote:
> On Fri, Sep 13, 2024 at 10:12:39PM +0100, Hugh Cole-Baker wrote:
> > I added printk to show the value of AUD_CONF2, and found that on 6.1.23, the
> > value is 0 before the code in this patch sets the insert_pcuv bit. On 6.10.3
> > the value is 4, i.e. insert_pcuv is already set.
> > 
> > According to the RK3399 TRM, the value-after-reset of the insert_pcuv bit is 1,
> > so apparently on the 6.1.23 kernel something is clearing the bit after HW reset
> > but before this driver sets the hw_params, and this patch sets it back to the
> > correct value. On 6.10.3 the bit is not cleared, i.e. this patch is seemingly
> > no longer necessary (but is a harmless no-op).
> 
> Hi Hugh,
> 
> Thank you for your extensive testing. It seems then there's no action we
> need to take for mainline, as it's already fixed there.

Unless Neil wants to pick-up it up for Stable? Neil, although not a
regression, this is definitely a show-stopper for sound on RK3399
for older, still supported kernels. And thanks to Hugh detailed
report we now have confirmation that this happens on vanilla
RK3399 and is not a quirk of my Rock Pi N10 board or sink.

Thanks,
Geraldo Nascimento
