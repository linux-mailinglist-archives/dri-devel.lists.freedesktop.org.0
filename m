Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA91D04F27
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 18:27:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CC310E7AC;
	Thu,  8 Jan 2026 17:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ON0v8SfW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77ADB10E79C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 16:30:19 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-42fb0fc5aa4so2487587f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 08:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767889818; x=1768494618; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dc6ScawRFQFrQUqCDUjRRKZdfrcmCO8h2beLP6+ws/E=;
 b=ON0v8SfW2RN+CzwZiocbmda/4ACu43yNzB+9JgxHLxnheqLyVwpRZ72gF4wWHSVMw3
 Z7z4fjlby8X7p1uYBmZ4K7JClGAjl1IQgQ8Dk3k77+qPqRIzMXzbk/Qg1Nk9KhAK1af9
 yzsmGxm6G2aBgmVO+0frAA/GQUjgeaEnV0kFQNlYNGYA6teOvBL/esvLyZ/bqhHq+WTg
 w+JIM3TGLLbCBamNIp3AQf1aHhgjZA5x1P4Cu0gSfIROWw+//ho3SDO+r907+W22ZCa/
 QX1r7yK+SPrXw1cvl1sNDzCij4X3LGnT2vYG4hrY4rikB3ISEXKxcN5EQ3Fne4tbSmDZ
 hpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767889818; x=1768494618;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dc6ScawRFQFrQUqCDUjRRKZdfrcmCO8h2beLP6+ws/E=;
 b=RS55reYD7aALzUraDN/4rp7EvHWHOW1VTvgBdw5Z/MfIMSnYkENmT5+5ur+DxeShq9
 trDqK6Gvr2iCR/wLfULCYFKXN9w+zLcVyFVaGbMWk/nDAM5aSKrtBuLnMjlxZmkMcCgw
 9BcDlV1GQNB4teUheGsSa4vO1CbEcof1/9vzX+DVgioA2s+LAxessfRIQEM3hCNSf16A
 jCixbDqKGcnod7hBPBFSaED410xHfH0mAE8iEWjwdv/o1AriIkzBXUcivmXmhJmq4boO
 h+bxXBeI0OvqNRtBuIWs5H82n6g9tGJVHRuvx8+F5VZG35qBfMpiC1QxGyut8GC+IxUE
 /2rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5bFwF6TumLf5XIhzpFS8WBswfDCUSr+TI56k1LfqkRxBSCZ5uLOzCwIhQ1Xew27Wf0SFyLSLNkNw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7dckpLmhtVxkhxbLWNC7ojGF2sjAzjU3cktk8yAsrzLwVU0C8
 x3wHm5kNon0N+mO4jH33CpnSdy3LXyZ4DTQLziyCpZcnU6IbwfQ77yyx
X-Gm-Gg: AY/fxX5BmTaeCsR/cXrPTu0G2o9UzvTOZ9GXVN22fKA3OlJYqpz9W+p5Sx5kivwPelS
 FmGSElBrS1RxtGPzQ7L+hCzLGXDHT9EB25c2a+a4+5CBweu+PXrJImh4lSKWoFgN/JKbYUwflGC
 5bFjZUMl7Fj8fiLx7TuExnf0pX0CTJBEoOJgUnd6pKvyJk3zUhBG+8RgWCWJDFPKqny7B1rq4bG
 04L5QX8bw0fYGn1VRRcRUH1v7HpAGdRn9YW1uaEx08qgeJHGkWCaAzTm2tnWk88JKQzZygMrs6b
 CkOMK7sZ8dKlxauiVXo2lVGdFCMtUK79S+Gwk5QUl9zAwujtbN5NBBB4Si1hif7xCXOWdpQ9JU3
 JUGj/TwFOU4wDyU7bQIBMj9BLEDDZ7kGzM4EARfT4o1WGeyuS//ZL2PFv8bXfnRmdlOV9ywt+1n
 Wajz9WZ4JxEDM263w=
X-Google-Smtp-Source: AGHT+IE4SajyDnRk2hr30qLnG3Fcgl62hbDw/YtWLnVk7GBUPLY+eK+cM4NcwzeY7S/EvSNq+LiWyA==
X-Received: by 2002:a05:6000:1844:b0:430:f7bc:4cf1 with SMTP id
 ffacd0b85a97d-432c377422amr9188459f8f.26.1767889817727; 
 Thu, 08 Jan 2026 08:30:17 -0800 (PST)
Received: from owl5 ([2001:861:3201:3d10:f038:1f4:4b8b:647c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ee5eesm17365651f8f.34.2026.01.08.08.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 08:30:17 -0800 (PST)
Date: Thu, 8 Jan 2026 17:30:15 +0100
From: Gary Bisson <bisson.gary@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, matthias.bgg@gmail.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: Add support for High Speed (HS)
 mode
Message-ID: <aV_bl8c3tMpih9s_@owl5>
References: <20260108101959.14872-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108101959.14872-1-angelogioacchino.delregno@collabora.com>
X-Mailman-Approved-At: Thu, 08 Jan 2026 17:27:44 +0000
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

On Thu, Jan 08, 2026 at 11:19:59AM +0100, AngeloGioacchino Del Regno wrote:
> Up until now, the MediaTek DSI Controller has always been working
> in Low Power Mode (LPM), as this driver has always ignored the
> MIPI_DSI_MSG_USE_LPM flag hence never setting HS mode.
> 
> In the current state of the driver the only thing that is needed
> to add support for DSI High Speed (HS) transmit is to simply set
> the "HSTX" config bit in the configuration register.
> 
> Check if flag MIPI_DSI_MSG_USE_LPM is set and, if not, set HSTX.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Tested-by: Gary Bisson <bisson.gary@gmail.com>

This patch was needed for the TI SN65DSI83 DSI to LVDS bridge to work as
it requires HS mode.

Regards,
Gary
