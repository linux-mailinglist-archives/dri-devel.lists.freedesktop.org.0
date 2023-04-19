Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE836E727A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 06:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6215410E0D2;
	Wed, 19 Apr 2023 04:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB8D10E10B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 04:59:31 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f18123d9f6so584275e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 21:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681880369; x=1684472369;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=x4h9mgi4PzKesSJC7XIsTMZkcYL8dBVXESTqkBCdQKM=;
 b=m82flReCGw1X6m+CoV2VKD+wwl0j8lhmJJMb1tzlpP7xDwbIRKqHgdxpEyWmt/mY4c
 XTijt6KK4i7rlCf0Bnj157U2I6rx/K8al9Ebeg7iTvyf4oiJEfF60ppFAsaF5FjDVEeA
 zB1HnTygglUtV62FVkt9TLP/s+qGZZ6saHHf9USTP8BR5TUYQHvSugtytraVJzt0LFcB
 cGFIDy9zaPi/LVaLiTLtbxuqs/itW/h8gqKWGs95B1OkGL6j+zzs7EGYRt1iHO2ErVZ2
 V4Q97TWS3RGDSmi08ihhwflvQ09RLq8kjZ37HMbANMMr16yhhlrrhYdDEX1neMaNBNeo
 kLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681880369; x=1684472369;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x4h9mgi4PzKesSJC7XIsTMZkcYL8dBVXESTqkBCdQKM=;
 b=bT8FE+9eWTHlO3liO5XUShVEkpsLljTwFmPlzisu3f78evmQG/eUq1h4eHjzpYe5E3
 3RjO6veNseik0W74Hh72Z8dZKE7nbbP7w8luXPbYWun9dzxk5CDkQReH9LmcWWQHlTKr
 9AvsYxe8J186YEfUeOL5bzzu17W/k6Btb3VDxSGABAdwfdSNEl2SRFItWKBPWp4YLyoc
 dzXRs9/jAiNmPJHxecCJLIhQDqZE4tFxRR5fesCT4zCmD+C5ycdeNmUDu0eG5wlUJDD/
 RsCtwVkKF91X8R11FgvAFNldGinOoXI00LBc2BXL9Vd56m5IyNh6A0hmxSMXqNJZS3WN
 0ZxA==
X-Gm-Message-State: AAQBX9cPtA5kkHfwg3634JWCtu+tiGyzbtqGoZx4HpHExu9CP3Uqep8y
 qsA6y69HSWy73swf86vP514=
X-Google-Smtp-Source: AKy350bukf4oJKo+btPlV5rCqL74IzCRSna9IqwXsdE6vXBZNGYK2s177m//3AXWr3mxuIcjhn5NNw==
X-Received: by 2002:adf:cd05:0:b0:2f0:df59:1ea7 with SMTP id
 w5-20020adfcd05000000b002f0df591ea7mr3621918wrm.31.1681880369662; 
 Tue, 18 Apr 2023 21:59:29 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 i15-20020a5d630f000000b002f27dd92643sm14487616wru.99.2023.04.18.21.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 21:59:29 -0700 (PDT)
Date: Wed, 19 Apr 2023 07:59:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] video: fbdev: mmp: Fix deferred clk handling in
 mmphw_probe()
Message-ID: <a7c75eb0-857c-4755-aa23-0a4a96a6d2ca@kili.mountain>
References: <685f452cacc74f4983aaff2bc28a02a95e8aa8b7.1681414375.git.christophe.jaillet@wanadoo.fr>
 <67353089-4966-424c-99c2-8524818f0e37@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67353089-4966-424c-99c2-8524818f0e37@kili.mountain>
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Cai Huoqing <cai.huoqing@linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 15, 2023 at 04:09:03PM +0300, Dan Carpenter wrote:
> On Thu, Apr 13, 2023 at 09:33:17PM +0200, Christophe JAILLET wrote:
> > When dev_err_probe() is called, 'ret' holds the value of the previous
> > successful devm_request_irq() call.
> > 'ret' should be assigned with a meaningful value before being used in
> > dev_err_probe().
> > 
> > While at it, use and return "PTR_ERR(ctrl->clk)" instead of a hard-coded
> > "-ENOENT" so that -EPROBE_DEFER is handled and propagated correctly.
> > 
> > Fixes: 81b63420564d ("video: fbdev: mmp: Make use of the helper function dev_err_probe()")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> 
> Presumably you already wrote a Coccinelle script for this but I've added
> it to Smatch as well.

Here is this warning:
drivers/video/fbdev/mmp/hw/mmp_ctrl.c:518 mmphw_probe() warn: passing zero to 'dev_err_probe'

Other warnings.  All five are interesting.
drivers/power/supply/rt9467-charger.c:1026 rt9467_request_interrupt() warn: passing zero to 'dev_err_probe'
drivers/pci/controller/dwc/pcie-bt1.c:601 bt1_pcie_add_port() warn: passing zero to 'dev_err_probe'
drivers/spi/spi-sprd-adi.c:570 sprd_adi_probe() warn: passing zero to 'dev_err_probe'
drivers/soc/qcom/icc-bwmon.c:776 bwmon_probe() warn: passing zero to 'dev_err_probe'
drivers/soc/qcom/icc-bwmon.c:781 bwmon_probe() warn: passing zero to 'dev_err_probe'

regards,
dan carpenter

