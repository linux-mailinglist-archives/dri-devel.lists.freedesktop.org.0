Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B530A987450
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 15:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D42E10E17A;
	Thu, 26 Sep 2024 13:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QWm0BYOk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB79110E17A
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 13:17:08 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2f759688444so9171031fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 06:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727356627; x=1727961427; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GM3RKm/IiEU4R2YOL22+MAC/pegYQ57jlvEwwzPJmcA=;
 b=QWm0BYOkZvH1S9O1fqd4GoT8Y7LmDG9o3sNNaZDxpF+vrxDFmh3/GM0OAjpU4nSYpu
 0K9lM4IXXG6eMW9C8nRND5dOvsNrxxRpSomlRclchPDMGfMgneKoCtIORKVajGpmhI3D
 +BmTSDxCbeyZE4FGx2zjpvXZwgq4H/nl5cJueTlXHDmDfsRSH8ycj6C69Swml7hAr5j3
 ABGouQjCogq6YhCDIK3K+MrAdCmv8fdgVFJWuwtv3WsmT+T/auwnvEY21dgiKSF0dEmF
 UP5ul6ftQtMFqzqsxqEFUnK6YCQnx/rp4kV1r617Ktdv2ExYaav7WM7i9v70EX6NS6ZR
 zgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727356627; x=1727961427;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GM3RKm/IiEU4R2YOL22+MAC/pegYQ57jlvEwwzPJmcA=;
 b=IKnAcgWmGnf9370wy6DlQY7YcVrFU7AgPiVrWZQ66MEYdGq6YH/DHEXEWzv+1JbJ5O
 bOR1nEyaLBeLgFRcTvF+MfXK0TGVgGpgVoEI81rJ3upP4ylxheDJv14WVE+KjSPYajH/
 nduTHx5ef0sVJaPNo8TfJrV41e0pKS0vMWR8vzYzg2IT0hUka+DJhaLrFqP1PlMYPfjl
 MQ+L3jUdihyz14o2Jnpy6g2D3IE2XfOicoLcLZ47kIRDhWUSTTmdKSQOji4IwGSLbodk
 TJVvX4QZPgN03PDdIrch6JNEFzOi0Am3hrSElpRfpN57n89Mxzb8PHq70wJTPutCWkuq
 Se2Q==
X-Gm-Message-State: AOJu0YzJ0RM4uVq/sv0HAZoSGVmKmR3ggGZch3SEvO/SdulynttQuYt1
 pxRBrW0hvGKNR1m6doPoOFMG44my42nLxPV0xQ/cvAec+Gfib839kpSL4vvtZtw=
X-Google-Smtp-Source: AGHT+IGPdz6Zq39ZcMHQuEFEhpswvaMhP9fdfa65d/2tYFo2kAqZeFweAnUeXc/K7/bvrZkkLbeHIg==
X-Received: by 2002:a2e:bc1a:0:b0:2f7:9d1b:da58 with SMTP id
 38308e7fff4ca-2f915fdb765mr39058931fa.10.1727356626699; 
 Thu, 26 Sep 2024 06:17:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d284cc21sm8395241fa.58.2024.09.26.06.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 06:17:06 -0700 (PDT)
Date: Thu, 26 Sep 2024 16:17:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marco Rodolfi <marco.rodolfi.1992@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Marco Rodolfi <marco.rodolfi@tuta.io>
Subject: Re: [PATCH] [v3] drm: panel-orientation-quirks: Also handle rotation
 for DeckHD equipped LCDs units
Message-ID: <hcypfd2xs6koqgoc2oxq4mg6q5eaddymivr27rb6owqz5iybfv@xxc3t2fsyk3v>
References: <20240926070106.208328-1-marco.rodolfi@tuta.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926070106.208328-1-marco.rodolfi@tuta.io>
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

On Thu, Sep 26, 2024 at 09:01:06AM GMT, Marco Rodolfi wrote:
> Orientation quirk code take panel resolution into account when
> determining panel orientation. Add orientation configuration for the
> popular aftermarket DeckHD panel, which resolution (1200x1920) differs
> from the standard panel (800x1280).
> 
> Signed-off-by: Marco Rodolfi <marco.rodolfi@tuta.io>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks!

> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry
