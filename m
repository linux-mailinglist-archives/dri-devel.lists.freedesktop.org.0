Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C49489F4993
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 12:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2959810E073;
	Tue, 17 Dec 2024 11:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NBws1vpJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6692C10E073
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 11:07:51 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-53df6322ea7so7037440e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 03:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734433670; x=1735038470; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uYia6bkOtOvm8zyMUkFTLmAVFFk1rfM5TLia+8wKurw=;
 b=NBws1vpJyljQymzpQm9vRPib1i2ojidxRlClCFNBi9MUNkTymHum5+co2McnCu4hWC
 dBIbYMqi/hzQ+phsAJMUWh9A24exf9gYJdq4wiHT0F1eC+eciu8shcX5eU9yjxwh2o7i
 TATcCQmsvStFsfL91K3iyoyfETYAn7IeGTyfM5p+KHr+d8KQ4lz144nNpknygTRKg1JS
 4kiO4d/QIjIOZxD+3b5T8bosba8gAz8dX0x1UwutlS4hy5MljQd+MLbvCT/XHuSRZCw1
 f+XKE+h+4vkLkjZxb16szkL1t6bf1quHQB9PFrfKrPo7Ln2Br4swm5trxW0lzM7c+bKS
 voCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734433670; x=1735038470;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uYia6bkOtOvm8zyMUkFTLmAVFFk1rfM5TLia+8wKurw=;
 b=HuwP7sQLAKoDBtOv/LGGQ5slyvsU0SOxmi35Et33j98mL9eIWOyNmt+z9UUEs5dn7q
 eQnvuwjoyt0/IWNX5xjvGrSH18P/jcN150xog5HwwnF9u4/IB4F6OHc+OWc1BRurrPtq
 SF8vT5IWVp7weDIsGO/NAyadY+9+NCVIoP5eb7Loj/TSnGP93ZP4MzJUcemEBY3ezJ9f
 09EUXuFktvnG+sk6GgSBUXYcVI/I0oVWpaWEvCutR5MgmunJzaF3H2rpblJ4NrAzNcbh
 8Bb37tVKqOd3Ipk6qSrmYYmQ3fQpbNvRqfqMiqZHn47wzIDkdoTjjBWicsU9VKDYSuJB
 tQaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq3aEFKdZXDTEGhZrN+NjiWw9L47/g1glWO1OZx7fPVUds4WrCkJFZZAP/hjAcW8V+3WyEVixqj4E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCV8IZoPuz9tqcw1DF7MwNX5tzbpOPXed/pzfriwqnyiibkJ0w
 A9KPzsTNKui8+YACHrpSva4+EdrdPW5iOKg8jGXEktXrQ1RNkc6ELLu8kTJTlX4=
X-Gm-Gg: ASbGnctIHyy5TZQ4PcuPpo2eSZmvhtyfsjJsM/geFBqwZUNqwVE2ZyPtz+hbsR0CQ/Q
 7G59Q6Y1h8oEK7c2yT0OwQ40bbPd9tqUnzSxGU1EKrfnJbaXKTTmcpnv15JUP9z2OmiS/Eu2y8a
 VVrhhz91ETyEhOcFJ3SqjStyBI8d0gYmHJQU/21D4HmRcMF72EabJ+9wxXs1j93lFFIKuvljzPj
 fFeKsgPAQ3r5y5ojWGgYLeLzLs3pf4/bOUhPFU+wirU8IOWqu9516N3nMVYEwYsBIomYPiNCMr6
 xNTIDGu5Tup91xVyL3moQbAs/9o4T+crhIGI
X-Google-Smtp-Source: AGHT+IF9wRRafyTuXG62lAlU9PV2hBrxozyuUj5pTu0s/yHqf/P45mfDC//C58CWkkxQbTLd1cCzgA==
X-Received: by 2002:a05:6512:4012:b0:53f:22f5:afdb with SMTP id
 2adb3069b0e04-540905958a8mr5350614e87.35.1734433669649; 
 Tue, 17 Dec 2024 03:07:49 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120ba9db5sm1122725e87.88.2024.12.17.03.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 03:07:48 -0800 (PST)
Date: Tue, 17 Dec 2024 13:07:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 airlied@gmail.com, 
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, mripard@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com, oliver.brown@nxp.com, 
 alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: Re: [PATCH v20 2/9] drm: bridge: cadence: Update mhdp8546 mailbox
 access functions
Message-ID: <z4cmwy6vh6nncq445hvm23n4ar4quciemvcj5zvofevulyofx6@w266vucwqv7s>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
 <74bc3f2ff56348afd9d773589236ddf06dc3d45c.1734340233.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74bc3f2ff56348afd9d773589236ddf06dc3d45c.1734340233.git.Sandor.yu@nxp.com>
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

On Tue, Dec 17, 2024 at 02:51:44PM +0800, Sandor Yu wrote:
> Basic mailbox access functions are removed, they are replaced by
> mailbox helper functions:
> - cdns_mhdp_mailbox_send()
> - cdns_mhdp_mailbox_send_recv()
> - cdns_mhdp_mailbox_send_recv_multi()
> - cdns_mhdp_secure_mailbox_send()
> - cdns_mhdp_secure_mailbox_send_recv()
> - cdns_mhdp_secure_mailbox_send_recv_multi()
> 
> All MHDP commands that need to be passed through the mailbox
> have been rewritten using these new helper functions.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
> v19->v20:
> - remove mhdp helper functions from the patch.
> 
> v18->v19:
> - Use guard(mutex)
> - Add kerneldocs for all new APIs.
> - Detail comments for mailbox access specific case.
> - Remove cdns_mhdp_dp_reg_write() because it is not needed by driver now.
> 
> v17->v18:
> - Create three ordinary mailbox access APIs
>     cdns_mhdp_mailbox_send
>     cdns_mhdp_mailbox_send_recv
>     cdns_mhdp_mailbox_send_recv_multi
> - Create three secure mailbox access APIs
>     cdns_mhdp_secure_mailbox_send
>     cdns_mhdp_secure_mailbox_send_recv
>     cdns_mhdp_secure_mailbox_send_recv_multi
> - MHDP8546 DP and HDCP commands that need access mailbox are rewrited
>   with above 6 API functions.
> 
> v16->v17:
> - Replaces the local mutex mbox_mutex with a global mutex mhdp_mailbox_mutex
> 
> v12->v16:
>  *No change.
> 
>  drivers/gpu/drm/bridge/cadence/Kconfig        |   1 +
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 487 +++---------------
>  .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  47 +-
>  .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   | 212 +-------
>  .../drm/bridge/cadence/cdns-mhdp8546-hdcp.h   |  18 +-
>  5 files changed, 104 insertions(+), 661 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
