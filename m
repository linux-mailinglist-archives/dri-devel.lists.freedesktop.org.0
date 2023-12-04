Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB94B803B02
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 17:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0713A10E365;
	Mon,  4 Dec 2023 16:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6231110E365
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 16:59:35 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c0a11a914so13677495e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 08:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701709174; x=1702313974; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VW6ZEKeTAlPv+01U3KpzrPDmkbuFSecehjWoA2e6+hQ=;
 b=xl87ZJhq7Mj9uieYM9+SUewj2k11yxG19XCEJskG/rcgd+E92t369jn6RFEzQ1Xdso
 lbAb+brFFwkCZQQIinDL4ytDRE8audqznETpuwr50Z1Kgf10wvR9BDhLFfO6PxX+8/b/
 D/qPp5Ia/0DY3PWhsg2FhkvtVsT3glLsdFW4Z+T3N/isT6o89t+zS9QW8rDxqQCZYTF+
 EshQFfZfWIHvIAWYACq4aw25gKzseSJaEAqxiJvN6DouZp0VaiY/12/mQ7P708ar3044
 qBNc8GhaEw6JQIED/gGQFYuNiHsYUauOubgUCBtkRSGXDm+ff1UmmTfBdZkQ+a4okvDl
 iwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701709174; x=1702313974;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VW6ZEKeTAlPv+01U3KpzrPDmkbuFSecehjWoA2e6+hQ=;
 b=KpptUABU1iyNwHjI/jepwiGBE+NbbTNyaPE2QBBwMa95p0c5o+JIJ1JIeR4zbrR0Yb
 tn7aimLssB1VKAjWg6NEKfDIOEU/tG49HRMk114ouYtrxs7Q62zwI42r7pgnXRbHtS0F
 d7pixGENA5e6Rk/6HP4TMCjxClLbZZMhBkISk2ErmVB0mYYnXeYKEC8LRnYGXL3BffjJ
 vx5RO/JMwAuAocZSXHAZrzui+1tDDg2dlXwPGQZRznIGjE4s4gcpl6aQHXt5+EU30mbc
 rVCWgWAHjEylgb92jNgFVVLGIFFlhPHV97nkzkDC+Cuao9Pt71MRzQPYCYHt2p0x3j/L
 eQfg==
X-Gm-Message-State: AOJu0Yz4YTeP6ov2NMX2xm/W2YlCoQKSe6NYfU96EpAXEvuBzU9siB+O
 S+/6ABQC8IzlhJ6UmVvIY6Yo6w==
X-Google-Smtp-Source: AGHT+IHaL3ty79uYhfKsJFnFrKTOOoQTADVZipWg49o81gK38O85rKNT/7xxht0aYKZlpg2yjKro4A==
X-Received: by 2002:a05:600c:1e22:b0:40b:5e21:cc39 with SMTP id
 ay34-20020a05600c1e2200b0040b5e21cc39mr2684911wmb.100.1701709173702; 
 Mon, 04 Dec 2023 08:59:33 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 u19-20020a05600c139300b0040841e79715sm15796431wmf.27.2023.12.04.08.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 08:59:33 -0800 (PST)
Date: Mon, 4 Dec 2023 19:59:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: nxp-ptn3460: fix i2c_master_send() error
 checking
Message-ID: <bb28e859-215d-4279-bc7e-f601352d06df@suswa.mountain>
References: <0cdc2dce-ca89-451a-9774-1482ab2f4762@moroto.mountain>
 <75c11af4-3f5e-4909-a3d3-8feea947d4ea@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75c11af4-3f5e-4909-a3d3-8feea947d4ea@linaro.org>
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
Cc: Maxime Ripard <mripard@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 04, 2023 at 02:53:05PM +0100, Neil Armstrong wrote:
> On 04/12/2023 13:29, Dan Carpenter wrote:
> > The i2c_master_send/recv() functions return negative error codes or the
> > number of bytes that were able to be sent/received.  This code has
> > two problems.  1)  Instead of checking if all the bytes were sent or
> > received, it checks that at least one byte was sent or received.
> > 2) If there was a partial send/receive then we should return a negative
> > error code but this code returns success.
> > 
> > Fixes: a9fe713d7d45 ("drm/bridge: Add PTN3460 bridge driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > This is from static analysis and code review.  It's always a concern
> > when you add stricter error handling that something will break.
> > 
> >   drivers/gpu/drm/bridge/nxp-ptn3460.c | 10 +++++-----
> >   1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> > index d81920227a8a..9b7eb8c669c1 100644
> > --- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
> > +++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> > @@ -56,13 +56,13 @@ static int ptn3460_read_bytes(struct ptn3460_bridge *ptn_bridge, char addr,
> >   	ret = i2c_master_send(ptn_bridge->client, &addr, 1);
> >   	if (ret <= 0) {
> >   		DRM_ERROR("Failed to send i2c command, ret=%d\n", ret);
> > -		return ret;
> > +		return ret ?: -EIO;
> >   	}
> >   	ret = i2c_master_recv(ptn_bridge->client, buf, len);
> > -	if (ret <= 0) {
> > +	if (ret != len) {
> 
> This is impossible, i2c_transfer_buffer_flags() returns len as-is if no error, so
> ret can only be negative or equal to len. The original code is right.

It works, but it's not "right".  The <= 0 could be changed to < 0.  The
"len" variable is EDID_LENGTH (128).

regards,
dan carpenter

