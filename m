Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941BC8B8B9B
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2024 16:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067F91121DF;
	Wed,  1 May 2024 14:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WzXUDFj0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75F31121DF
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2024 14:01:48 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-346359c8785so5577027f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 May 2024 07:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714572107; x=1715176907; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MRQauao233bl7PaCKp2AAgdkPImfXRP53eHl06LQeag=;
 b=WzXUDFj0h9xLTULLysHtutPQ9clWz9KyL0sipwDb0gAZIU0I7vPciC+n+5IKuzpzVo
 RTeuJ5gpijfWMe8t4QQsmAgtfRcAj48PAZkFstmBJmWROV/a7N+cVuGrxxzvGj0X1X3g
 MhEe20kSy6b1YTZVVLiWkSyg3J6yqIChT+wT/NhAdXovieZSo4wx4+dN7stPblB+TOx5
 v7QzteiCgurq1YsRmMARM17gjLD5LCX67u3pPJGTS1jsy52IvQcDPu3aEbuWRfx+S4Cn
 F9wD2iA8Esaaat7djjcXXq2+Gj/kJM7MBSi+/oyse1h1gaXS10jG/GWHvjYIxlrvBWB0
 wWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714572107; x=1715176907;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MRQauao233bl7PaCKp2AAgdkPImfXRP53eHl06LQeag=;
 b=LJLfWi3tRRkjhXpjxpSOaZZeNf5YBKXZIfP+s2Jhl94vDJmUxJnMeuVzvgk0B2/2EH
 ZvEWe+pEYeRrRFsf9ftS85xIATAdBFCZPHUfsY+jgUGLRuE47ZL97zf/AsAy2rYd8iEX
 wbneJP10fXHwMfO4q6PJ2P5TG4asm+rBBYrNfaD1Or8HlCpA+GS3aeflNnG6lnBNQpSw
 iuHvh6Nr0pscMI+Cc4NDrxpLkdb/3zMmKGLecHCqke+cNKAy+OC6OkvcLL9yF6ytnik/
 2JBqBKmd2G3ku1XPjdgkVygA8xfEAPsEVO+2GE2DcMEKlDamgJfr/F3YDwOEcPS0ulp3
 hNgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqTa3tpDfdCDp10V8xHor3u3HIChHYnTpPcuAIB+aqerjyvNF2OR9G2owpqH8f3oxiqNxYlqE1xnxKXo5rU4X1CXgiiSvlIf9mMCgLPphR
X-Gm-Message-State: AOJu0Ywl6lbXKXnSPBdJRryNcqAvycC0Ealytq+0ragiX5lQoAvQk3mo
 fOcmZMuHEPH4hJ5QYXQpTzG2TftfS5ORosCww0VjQp6OEkhmF1aFTX8xTkmke/Q=
X-Google-Smtp-Source: AGHT+IF6AVQRyF6Dk1uSruwo7/L5zDwxkFGB+A6XFcz0Xm5YcaxaSXEkcGktSgGbTNPnxqHZOX+zUw==
X-Received: by 2002:a5d:4a05:0:b0:34c:a488:e6d0 with SMTP id
 m5-20020a5d4a05000000b0034ca488e6d0mr1782698wrq.36.1714572106928; 
 Wed, 01 May 2024 07:01:46 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a5d4c4c000000b0034de40673easm1117019wrt.74.2024.05.01.07.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 07:01:46 -0700 (PDT)
Date: Wed, 1 May 2024 15:01:44 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: R Sundar <prosunofficial@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com,
 Julia Lawall <julia.lawall@inria.fr>,
 Shresth Prasad <shresthprasad7@gmail.com>
Subject: Re: [PATCH] backlight: sky81452-backlight: replace of_node_put with
 __free
Message-ID: <20240501140144.GA10180@aspen.lan>
References: <20240501125146.33648-1-prosunofficial@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240501125146.33648-1-prosunofficial@gmail.com>
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

On Wed, May 01, 2024 at 06:21:46PM +0530, R Sundar wrote:
> Use the new cleanup magic to replace of_node_put() with
> __free(device_node) marking to auto release when they get out of scope.
>
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: R Sundar <prosunofficial@gmail.com>

Thanks for the patch but I think this one is a more appropriate
solution to this issue:
https://lore.kernel.org/all/20240421104916.312588-2-shresthprasad7@gmail.com/


Daniel.
