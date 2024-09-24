Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B28E4984701
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 15:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8A510E6ED;
	Tue, 24 Sep 2024 13:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ctd5+qd6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2EA10E6ED
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 13:47:51 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5365aa568ceso6514440e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 06:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727185670; x=1727790470; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kBt3x6ALV42ewF+LrxPLGBD5z1fDXU5VRBYVjXfLHqA=;
 b=Ctd5+qd6JvlmFQTO5NLG/f+W9w96/0jEUxbfgHn5PApiXW98KmTRCxiSPfglfzr3SE
 qjUdq64wg1Hj1T4ptAMW52u081imCYxDGh7xfj7PyBFdAO7jVrrHqMfHuivRnV9hLDZa
 hn05flji5XKBXoZaPnHyKVQgq6Jf+OyN4cC2JPTePlzoL/Yu4fzGmh52tEvZmR07TEJ+
 PsIbeDw5GasG00rw09LWNJESx5WEhTVHJdbJddUBWXNsdGnIIAQ9bOgEZEkRBRbJk287
 K6XBomPDjUDeX1+0M8srTdlBc3xLLJxVKq5STI1sbD6bR2QS5OMuPcEWurSb8O5aQZLA
 VKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727185670; x=1727790470;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kBt3x6ALV42ewF+LrxPLGBD5z1fDXU5VRBYVjXfLHqA=;
 b=nUHTEm2H3oaDvkU00UCi6C3MgwwT/hKhfn30yzlQ0hSEIrYyluPttPmK7GjgUtCncP
 O5kLM9iZ/bgWhH2vAQAv5Ylmng671xaT5CKUD3bSKLD5xW/xAXZLiu8aNe4nql41ComJ
 S6mmBKbp9DJI3CYIG4ZAEql9A+/rsmv0QaJ/lmox99hH9Ax0JWDwCwIuA3kE+kbcpvHe
 b18lyHTNEcxuV+BDcLnvQBW5XrgZN/UdIzGwi7ltSpWkYsP+v+2maK8g9zXWF/O7GseT
 TqBSUBSzpxAfdYlUTeaL/CgDUXQYnutdJ9wOK2uruOtLILp/lt8ke3x8PuzfZQSjWBB/
 qfJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGHKEmOTNb0phuyTYvK3ZtCQ9DOFx4OiOUC9fils3K07rMQ/LK+n2QqPuw7m0NLI8Bp4mUciZziqo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwG9jSkABm7RcHjyqJXMu6bOH5EVFRZT1ufkUwgPdsNMxYet/rc
 5m9zOilSfKAm8AtvtMZFas5rOc9/d5Y39lBEYmMzjidFpG0qlhkqSeiCrJbXDRI=
X-Google-Smtp-Source: AGHT+IGJKZpf6QQ+S8K3ti23EiAXeRY+081fsTj6EyFFUngV4d81tjNwb7xcXTbrQdu0LscMt/VsWQ==
X-Received: by 2002:a05:6512:3048:b0:533:4785:82ab with SMTP id
 2adb3069b0e04-536ac2d6a6bmr9755530e87.1.1727185669530; 
 Tue, 24 Sep 2024 06:47:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a86408cesm233908e87.149.2024.09.24.06.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 06:47:48 -0700 (PDT)
Date: Tue, 24 Sep 2024 16:47:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Sandor Yu <Sandor.yu@nxp.com>, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 festevam@gmail.com, 
 vkoul@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, 
 kernel@pengutronix.de, linux-imx@nxp.com, oliver.brown@nxp.com, 
 alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: Re: [PATCH v17 4/8] drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
Message-ID: <2mug3ii2vi735sk7nwwu2rcj63d3mlgazlhg4sydcxb6uf5nsc@qi5ut5pmajsv>
References: <cover.1727159906.git.Sandor.yu@nxp.com>
 <8bdf573bfd7e3feb45d7ccb53765a978a685ce2d.1727159906.git.Sandor.yu@nxp.com>
 <20240924-mottled-psychedelic-lorikeet-ef8f4c@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-mottled-psychedelic-lorikeet-ef8f4c@houat>
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

On Tue, Sep 24, 2024 at 12:16:27PM GMT, Maxime Ripard wrote:
> On Tue, Sep 24, 2024 at 03:36:49PM GMT, Sandor Yu wrote:
> > +static int cdns_mhdp8501_read_hpd(struct cdns_mhdp8501_device *mhdp)
> > +{
> > +	u8 status;
> > +	int ret;
> > +
> > +	mutex_lock(&mhdp_mailbox_mutex);
> > +
> > +	ret = cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_GENERAL,
> > +				     GENERAL_GET_HPD_STATE, 0, NULL);
> > +	if (ret)
> > +		goto err_get_hpd;
> > +
> > +	ret = cdns_mhdp_mailbox_recv_header(&mhdp->base, MB_MODULE_ID_GENERAL,
> > +					    GENERAL_GET_HPD_STATE,
> > +					    sizeof(status));
> > +	if (ret)
> > +		goto err_get_hpd;
> > +
> > +	ret = cdns_mhdp_mailbox_recv_data(&mhdp->base, &status, sizeof(status));
> > +	if (ret)
> > +		goto err_get_hpd;
> > +
> > +	mutex_unlock(&mhdp_mailbox_mutex);
> 
> That's better I guess, but it's still not a good API design. If you
> can't have concurrent accesses, then cdns_mhdp_mailbox_send et al.
> should take the mutex themselves.

I think that a proper API might be:

int cdns_mhdp_mailbox_send_recv(struct cdns_mhdp_device *mhdp,
			u8 module_id, u8 opcode,
			u16 size, const u8 *message,
			u16 buf_size, u8 *buf);

Internally it should take the lock, exchange the data, then return.

-- 
With best wishes
Dmitry
