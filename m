Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C726AE4B65
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 18:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB86910E069;
	Mon, 23 Jun 2025 16:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L/j+oaUT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFEC10E069
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 16:50:40 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-adf34d5e698so1089568466b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 09:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750697439; x=1751302239; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZkbTHFqp4OOayCxB+8smrXfMGunG4i7REp6CpRVicc4=;
 b=L/j+oaUT/WxkerpXAGoaa2KaeqANFDHLfMkm+t4hWpFEt67LzAdgfKe2DlThj32TIO
 zGQh4wF0vaRKE4CP9k/yc4WGSoQJa0z1k6Nxn25Uo1qX1iPsxXUZNhxXsc6DEkd7H/kf
 TMMBVCKktCltLj3yXGtOgnmjAgMWmSp8k6c6vJCZHWa+JVbZmZyAtiTDnfbpkbtK0Z29
 th+dL1e+s9asLYw2CX5d4PI8YAfkQCG9+Ivb/dfJ4+hJMOrelTezlKlXflDxISDJxvQu
 XiinNv4KCnur6eCrfGgrLB8gAdCzN0UgHXGo1daoiUB5cUUGdbIp6+3XrxROeEkojVS0
 L5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750697439; x=1751302239;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZkbTHFqp4OOayCxB+8smrXfMGunG4i7REp6CpRVicc4=;
 b=CLvG6S2pPiz6sGMHm418MJYK9qcl8yHoWP6EZW6bhlV9KgogU51s3xvdFx+QMAMSf8
 tWfjyjO1vz8aE51nPrB5CwtbZ4Ntm/x+SjoJQNC8tDsMmEEEIY1FDBF4OgDVoYz0Z4kI
 r/m+oTJd/DMA382Nym5krJgxf/kzU4LkD4HN7rF2IH6hUuR7FnMaqNJxpRknwvBdHxi4
 V9b7e99UV/HItRqDa6XUJ/T5xNBQ03l1iQGU/4yGFNga51RSr4kkpW6FbrHZi+g+KKsc
 f8gn+nnlwAu4hpec1TF5QPpMMhe7ge123realjVRE3m7eLWL+2qX3zRcza4vDaiI5HdT
 CA+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzKgLr8by2rcZk2sIN+hv0id3vEDiPCMq/EdIPnMVWNPc8S5FAeFGQfytP4tSi4+sOfNuY3hMCXXg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjUk/ya6E7VqTAAixj3OSA1K7c6rHSd+MJWPJfoMcEMdsdRuWH
 WSmdGQUThE4OccS59LzBqdx2LJ2DBOFHJS8CoCe061NTvbclNryN5Bef
X-Gm-Gg: ASbGncssYo2nxtD6j0dcPCzw3XylvBChpE4kArGvFZ6m/Bd3fPux6o1Ulb/4/oNBD+O
 JkMEub+8buyJwxaRGKt7ux3wu+g+MQSBcOebVqL/Ns+r4GRECTEtTzEe5cagJMeH34v8x8Z8VTV
 pPPfS9Np+NUUTqmFRVRbn+U1Wgp+GPDTHuvMdhZOLnRpYnRxz/dN4UR5P+Qsj3Llw/bplPDpiPt
 djObCLYA0phe+C+xxrk5pBen6YUan8/VPUHKbhyjuvhMgoPLZq4dsMihUI3/7uR+BClYQQBpmn0
 GdCtU32fq6SY3Y4ys6BURqOPEBb+yLdd/w7BAZhOfth6z9YNHZkX3PgmF8KYPCudgj2o0QZgA7q
 P/ZaRzrB8+bR32NtAuU6huiCUUnBsxaN7cc5nkgWoyY5xHyxp23Z8gVTNFaIGKw==
X-Google-Smtp-Source: AGHT+IFjhAA6UeQ6iJtINER/INOY7ygvNNOjwHW/YCzhUOAkeneTAX3+lEeXKstulP3ywyDPHp9tkw==
X-Received: by 2002:a17:907:2585:b0:ad5:431d:fb32 with SMTP id
 a640c23a62f3a-ae0a740dd8fmr16761166b.14.1750697438854; 
 Mon, 23 Jun 2025 09:50:38 -0700 (PDT)
Received: from ernest.hoecke-nb
 (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60a18d01902sm6357004a12.79.2025.06.23.09.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 09:50:38 -0700 (PDT)
Date: Mon, 23 Jun 2025 18:50:37 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: dianders@chromium.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 dri-devel@lists.freedesktop.org, tomi.valkeinen@ideasonboard.com,
 max.krummenacher@toradex.com, 
 jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 kieran.bingham+renesas@ideasonboard.com, linux-kernel@vger.kernel.org,
 max.oss.09@gmail.com, devarsht@ti.com, geert@linux-m68k.org
Subject: Re: [PATCH v5] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
Message-ID: <cypbfwbsimknqtuzutprhpst2ugeih2f5c2qf35vtwc5qx5uzl@y6rsjwtlw7ca>
References: <20250616093240.499094-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616093240.499094-1-j-choudhary@ti.com>
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

Hi Jayesh,

Thanks a lot for all your work on this patch. I tested this version on a
board with the broken HPD signal and can confirm that eDP works as
expected anyways.

Tested-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Kind regards,
Ernest

