Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E08156C82C
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 10:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4673F10FF79;
	Sat,  9 Jul 2022 08:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820EC10FF6F
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 08:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=m408M9s9rPxyqJxz1bhEH0hHqNjF0MlszAst34KoTDg=;
 b=XdmgHBU2Yxpw2gp4WjB6UK4/nC7XSgTseeDDvaaw3Trt8DoZuYwTIcyW2ZPxeT9EWRC5hLTreKolt
 QJjW3Fz+CT21t7X87Uy/aPzGY+doCdCMk7j3+6IpPT6Fd309CA6ZG0g78YAxJpv4xF/ADtARra8A3o
 hkNmSo3mLgvK4Fznuul41IBEsrjAX2vNgEZLqLYQ5OlnxKlFtipY/6JvIyag5rH5ms6m7n9OCBIvF5
 QbiyOdD1a+0YPC1kWCQTJc8clTJ0GVub3Pax0KfzzO/U4qCz6UgJs79HDf5aa5iIwn9yjwI/pc/5Ri
 4wxD6o06EpyOJfvGaGCXnYjnceQO9xg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=m408M9s9rPxyqJxz1bhEH0hHqNjF0MlszAst34KoTDg=;
 b=vGjbWJquN0gYDOg8FqxrorbzQ4xJ4YBiGyTU3zYRsoBVH15JpjInig+s2Yfz+lKQ/GMx4EyoTySb+
 t/NIg4uDg==
X-HalOne-Cookie: 8c1a99bd30ffe0bfb1642bd2706333b0c6eade8a
X-HalOne-ID: 5848c6ee-ff64-11ec-a6c6-d0431ea8a283
Received: from mailproxy4.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 5848c6ee-ff64-11ec-a6c6-d0431ea8a283;
 Sat, 09 Jul 2022 08:51:38 +0000 (UTC)
Date: Sat, 9 Jul 2022 10:51:37 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/3] drm/panel-novatek-nt35510: Emit an error message if
 power off fails
Message-ID: <YslBmR3+v4UTGTL3@ravnborg.org>
References: <20220708094922.1408248-1-u.kleine-koenig@pengutronix.de>
 <20220708094922.1408248-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220708094922.1408248-3-u.kleine-koenig@pengutronix.de>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

On Fri, Jul 08, 2022 at 11:49:21AM +0200, Uwe Kleine-König wrote:
> Returning an error code from a mipi_dsi remove callback fails, this is
> silently ignored. (mipi_dsi_drv_remove() propagates the return value to
> device_remove() which ignores it.) So emit an error code in the driver
> remove function and return 0.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed and applied to drm-misc (drm-misc-next).

	Sam
