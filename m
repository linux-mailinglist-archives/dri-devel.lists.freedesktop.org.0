Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D85A55A2B8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534AC10F3AF;
	Fri, 24 Jun 2022 20:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB34A10F3AF
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=9rV7rmTUfpzPtlwowSz9p1z60VIIot0KQLA/WiXxBeA=;
 b=pHDkNdVf6STnjKUshSXvwCtLkvy1okgANpIqFeyr0zbeNDGVDqwZZ36iVmusEI3YbZMTKMU1gzpj3
 uIdecYgYU9bchEiyS3HNMg60xKyiVavfRz0ZXcg9s3ZEh1Xbq1/NZ4I8INTbnxi3kj7LSQLbHP3DyL
 +QJHmCddqNg+8LbSxxon87ukMKgIWdX7acJMiWjfqkCFYa4zN44Z9cKs7dZldps79g9u9R+b3D6dt7
 DWzCRl+FRz+1s/j77tVGMge7uwSKBhPb2KBd/d/3PxGg77+dbH89WQKaLK8GqIcNA5R5wk9V2/3pmn
 exhoG3U7vPepuW9l1Rl4broKKNqxMag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=9rV7rmTUfpzPtlwowSz9p1z60VIIot0KQLA/WiXxBeA=;
 b=WiJlVYaxeG1eVJ9QOAGe9bPNIpKx+3kKMa7EHEO8XjkvwvJOOk8h8v8gmOEXVv4NgbR7Cn/Jr4D27
 jVTs+9XCA==
X-HalOne-Cookie: d3783bc8887fa11d3fbd817fdcbe0ed542c9b62f
X-HalOne-ID: e9d1b734-f3fc-11ec-8233-d0431ea8bb10
Received: from mailproxy4.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id e9d1b734-f3fc-11ec-8233-d0431ea8bb10;
 Fri, 24 Jun 2022 20:33:32 +0000 (UTC)
Date: Fri, 24 Jun 2022 22:33:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH v2] drm: bridge: adv7511: Add check for
 mipi_dsi_driver_register
Message-ID: <YrYfmqJbRmGWh0qw@ravnborg.org>
References: <20220602103401.2980938-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602103401.2980938-1-jiasheng@iscas.ac.cn>
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
Cc: jernej.skrabec@gmail.com, maxime@cerno.tech, narmstrong@baylibre.com,
 airlied@linux.ie, robert.foss@linaro.org, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 alsi@bang-olufsen.dk, biju.das.jz@bp.renesas.com, jagan@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 02, 2022 at 06:34:01PM +0800, Jiasheng Jiang wrote:
> As mipi_dsi_driver_register could return error if fails,
> it should be better to check the return value and return error
> if fails.
> Moreover, if i2c_add_driver fails,  mipi_dsi_driver_register
> should be reverted.
> 
> Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Thanks, added to drm-misc (added to drm-misc-next as this did not look
like something that required fast forward to mainline).

	Sam
