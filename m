Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBBF98478C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 16:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F8810E716;
	Tue, 24 Sep 2024 14:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="caRUWLkh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0882510E716
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 14:21:45 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5365cf5de24so6917746e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 07:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727187703; x=1727792503; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=APtwNX4goi3YuxtkCvF33AuyhynT4SX43dIq2QZAR1c=;
 b=caRUWLkhhq83Q2nV5GDJsRki35x52klTqzIUhCIXoql71lV/gTVheq3IsNzKtwDfNs
 fMtX8Qhd/6eRq7Eeou+qO9hDvl/lSCjtnPQMe/EvCIjiIHzMtLsVo9uDzn4OY6KGpqLz
 MPB5XOxlzVnzU7TSxEZyLigI9DxQ8w1k7jOB8LSm+AHhDIL7W0qwfRAMGFfmGs+dtz9/
 m7Ks4iWkRoKlBjJyt8Kgp+SrdEX2ixUyupQ7DOtMBwQC5jIGA3VtS3Pzi7Q/enLYs513
 SEz4Y197SzShcuOp3HD26nnH9S1F/XKRzX/Y5k2MeWfdPx1KsRV5ilYgzEP58LQpUiqw
 FTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727187703; x=1727792503;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=APtwNX4goi3YuxtkCvF33AuyhynT4SX43dIq2QZAR1c=;
 b=gb6XWEZ8HRpkQOba+QiKyw2bG5DPHEcSaU1Fq6gGGYX0FI74eZYgzQgS90JjjVWDJh
 OK4qZw3muDlNWasLl3obPsvaSAtFRwQuatZadfqLQvfPGRZBRNSD1TPYbOR277PdVci6
 pBwGDmlcuUXaYQu8nddcMg7EDt56d1XGzY5bI3NgMEn+kY3UFOBhCsWNFVWOESqENz4f
 e4hCndrEhPa4b/JhnRsZrMvmnoqff+SPOFozT2yx9OQ0PTh3+COn2H5i4Tj5InhUDxzN
 aqWpeoeZad6xZA7WkBKWBTGtb9Urtr/9NxrV3a/G3aVOyoJa6LwLcai9g2Q7Lwtcn9sN
 fwPw==
X-Gm-Message-State: AOJu0Ywn146oaMogO9/OTSv39ypEY0EsMct2b7RlEsllKrgFU/mBfwHR
 PoZWbWKz6B9WDMAqbhjKljS74M7H612qjh9FSB0aczvfVCXdoZKACDanmy8Z6YQ=
X-Google-Smtp-Source: AGHT+IGZ7j8dNC9vmJkw2CsVcVLyyFojx36RieimtO9D6Pm1dMVRIcFmkD/e9Y2L8+9PptcHq88tQA==
X-Received: by 2002:a05:6512:104c:b0:533:46cc:a71e with SMTP id
 2adb3069b0e04-536ad3eb9d1mr9233953e87.54.1727187703078; 
 Tue, 24 Sep 2024 07:21:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a85ee5a1sm244879e87.83.2024.09.24.07.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 07:21:41 -0700 (PDT)
Date: Tue, 24 Sep 2024 17:21:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, 
 Derek Foreman <derek.foreman@collabora.com>, kernel@collabora.com,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v4] drm/connector: hdmi: Fix writing Dynamic Range
 Mastering infoframes
Message-ID: <adsevd7dledyzrbe6smq7d7cnqiodinprsj3jul4i4nd4gc2p4@dzyvhhktsrut>
References: <20240827163918.48160-1-derek.foreman@collabora.com>
 <172718718877.90582.18381097503447839347.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172718718877.90582.18381097503447839347.b4-ty@kernel.org>
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

On Tue, Sep 24, 2024 at 04:13:08PM GMT, Maxime Ripard wrote:
> On Tue, 27 Aug 2024 11:39:04 -0500, Derek Foreman wrote:
> > The largest infoframe we create is the DRM (Dynamic Range Mastering)
> > infoframe which is 26 bytes + a 4 byte header, for a total of 30
> > bytes.
> > 
> > With HDMI_MAX_INFOFRAME_SIZE set to 29 bytes, as it is now, we
> > allocate too little space to pack a DRM infoframe in
> > write_device_infoframe(), leading to an ENOSPC return from
> > hdmi_infoframe_pack(), and never calling the connector's
> > write_infoframe() vfunc.
> > 
> > [...]
> 
> Applied to misc/kernel.git (drm-misc-fixes).

With an empty line between Fixes and the rest of the tags :-(

> 
> Thanks!
> Maxime
> 

-- 
With best wishes
Dmitry
