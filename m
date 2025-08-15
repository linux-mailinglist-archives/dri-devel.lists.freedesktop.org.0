Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4087FB282D9
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 17:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A469D10E22D;
	Fri, 15 Aug 2025 15:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="X+xtf1O9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E085310E22D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 15:22:45 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57FFMcII2181599;
 Fri, 15 Aug 2025 10:22:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1755271358;
 bh=NP8j7nP6LkL9pUYPoGdT46SLIliAXWeDJDHxTfi5v7I=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=X+xtf1O9/+5drBeANW5X6yVmTk05Lo/qM1qa8NLJKXBWajzefcCVQK4+bQti1A/gH
 v9L+qKUYuiK2rdbPcHsPXwfWHDFtQHUQRP3Rj08jaNfaLM2E96mqWpnj7oelBX0WsT
 3IaNdyjKEgHJ24smOwpwj3lfsaVNgkcI2TFr1LV4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57FFMcJ01698106
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Fri, 15 Aug 2025 10:22:38 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 15
 Aug 2025 10:22:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 15 Aug 2025 10:22:38 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57FFMcNN1473281;
 Fri, 15 Aug 2025 10:22:38 -0500
Date: Fri, 15 Aug 2025 10:22:38 -0500
From: Nishanth Menon <nm@ti.com>
To: Andrew Davis <afd@ti.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, David Airlie
 <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Robert Nelson <robertcnelson@gmail.com>,
 Jason Kridner <jkridner@beagleboard.org>,
 <tomi.valkeinen@ideasonboard.com>, <devarsht@ti.com>
Subject: Re: [PATCH V3 3/4] drm/bridge: it66121: Use vid/pid to detect the
 type of chip
Message-ID: <20250815152238.culfazudi4le2ykt@gravy>
References: <20250815034105.1276548-1-nm@ti.com>
 <20250815034105.1276548-4-nm@ti.com>
 <e3416746-ee96-449d-8a17-28efcd391c55@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e3416746-ee96-449d-8a17-28efcd391c55@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

On 08:52-20250815, Andrew Davis wrote:
> > This also allows for some future compatibility to be checked only
> > against a restricted set of vid/pid.

^^ See below

> >   static const struct of_device_id it66121_dt_match[] = {
> > -	{ .compatible = "ite,it66121", &it66121_chip_info },
> > -	{ .compatible = "ite,it6610", &it6610_chip_info },
> > +	{ .compatible = "ite,it66121", &it66xx_chip_info },
> > +	{ .compatible = "ite,it6610", &it66xx_chip_info },
> 
> If you will pass in the same data to all devices, just don't pass
> anything. Move the it66121_dt_match table up above probe, and just
> use it, no need for fetching it from i2c_get_match_data().

(rationale in commit messsage)
Yeah, I was going to do that, but this vendor has a bunch of devices and
I am not able to see all possible combinations.. so was thinking that
maybe some combination device will need different checks with a limited
vid/pid list.. just lack of public documentation makes me a bit
paranoid.

I am not tied to this that hard (it was a "meh"), so if folks feel this
can be thrown out, can respin.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
