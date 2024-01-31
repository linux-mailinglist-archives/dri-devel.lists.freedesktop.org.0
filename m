Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E70D84421C
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 15:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAF210E2A1;
	Wed, 31 Jan 2024 14:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51ED110E2A1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 14:43:24 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-40e9101b5f9so54701135e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 06:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706712143; x=1707316943; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=K31KqT5V5uF5b954ZcpqYJhJ0+aoYbQF+sfNU7Nx2B4=;
 b=U0bgcC6wtxb8oVGwCUm/j3JKxldsTwrtY2Y/MXGSPw6wV6fstJgfXldUO01J6iyNVA
 Nr9jwJRUb/0s3rn/yTkG1v368tRMf1V7JRmccTG28du/N08Rr9mNRSXXjIB7sP1i4lGo
 621nDeb5J+MLEjN0VnG5LbCM4qkKtLiKJ08gGEub2oHq+O7YmgY76LwP9R5yOZ9X64mf
 OhUSeCgZEch2xa8VD/ruwOVNc4sAQebuyXFcwc1RsKFZIrj2CT7xeLQJNZ+aBlH0thR8
 niDd41eamJiSvz9yrZ3zKb4YLYWe33mYSy7k3f2lAWSxT9lgy6dI/aNNp6umGGKRChaV
 9lPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706712143; x=1707316943;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K31KqT5V5uF5b954ZcpqYJhJ0+aoYbQF+sfNU7Nx2B4=;
 b=tQet/Gv3o8JKY5+6KyV6gwO5EgwRFxU2oR0MDek8UZQVdjtrczsNBYuMsC/WKtOHUo
 M+eRC2Nn+MUEg91RuGljLyBLFCWmJp56eS7XKofVhkBTmBJhBm12d5ark+3KlBI9UtPs
 gx/PDcH3ECfwRoV/poyu0VE4n1aTo1yKauMTYksBU8k/SUX3qTlPuAfpwJ5sjXEa9oUO
 SZLZ9twtsS9BQIuIsZY8UwF+sQdL84JKuHDQyWOAZvqRdGfaxY4EEwEGqcoOdV1hlYQP
 EtNw2jgYdtcDWUpdjUXbPnr3sP5g69d5MSGDlrO35q/Pyfmx0aEGE/SkrPX3lKUmP4KF
 gUdg==
X-Gm-Message-State: AOJu0Yy1S0TJfvPxpbjjsF+C989kDRVMTZf6WJn2sFNPsAucXNx9QOGy
 nPpxJj6zrbkdagVOJkg0A1oHZ+A/GZM2stzT+OeFooQ4bn86LbuO/BOtQNv3T5c=
X-Google-Smtp-Source: AGHT+IHrC/K+xdbE/khLOxKWVe2CNuHMAaEhHqNgScg2QXA2v/u7cDClshre9bUbEaRveSzAwxcppw==
X-Received: by 2002:a05:600c:1386:b0:40e:f5d0:8517 with SMTP id
 u6-20020a05600c138600b0040ef5d08517mr1321066wmf.33.1706712143446; 
 Wed, 31 Jan 2024 06:42:23 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c1d1200b0040e89ade84bsm1830569wms.4.2024.01.31.06.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 06:42:23 -0800 (PST)
Date: Wed, 31 Jan 2024 14:42:21 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sean Young <sean@mess.org>
Subject: Re: [PATCH] backlight: mp3309c: Use pwm_apply_might_sleep()
Message-ID: <20240131144221.GB5929@aspen.lan>
References: <20240128154905.407302-1-sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240128154905.407302-1-sean@mess.org>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Flavio Suligoi <f.suligoi@asem.it>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 28, 2024 at 03:49:04PM +0000, Sean Young wrote:
> pwm_apply_state() is deprecated since commit c748a6d77c06a ("pwm: Rename
> pwm_apply_state() to pwm_apply_might_sleep()"). This is the final user
> in the tree.
>
> Signed-off-by: Sean Young <sean@mess.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
