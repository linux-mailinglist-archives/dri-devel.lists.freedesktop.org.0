Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B8984368B
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 07:21:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52C2113986;
	Wed, 31 Jan 2024 06:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D53113987
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 06:21:09 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id DF81F60417;
 Wed, 31 Jan 2024 06:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1706682069;
 bh=1stjmB4mIQIgjXzEdef4k7mYxVV6dJBOLDOpjOEsKgA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VJe7n5AjQvvnU9dL4abFmdrz9smQ62eqsrW5YXVrm5+ZeLeK/3atXMfC/DnTorl7p
 NBUknsdV39KrNygf7h6UadzelEXF98CNMKxeHLW54j7gaMqmM+08grrx9ox6O/XGnJ
 zdy2VMIp2xwB4zsYurz5LfHmQBy0XyDUckhtdrJyTv1ZhBcGvqxZ7R8dxAmdqBexaB
 M/u4Sqz7v3AD9v+L21o+4kP6JteJUHNigSa6y62rX7FHYX6Tck79ViLMavIFbR7KY+
 yHVBEJq7Og8F5nkJq8CRroOswHul6RmyncB1OYoxaUhJ2UIxCIPK2SnLv4r2e1cBuX
 XKyQ/2mipYhqg==
Date: Wed, 31 Jan 2024 08:20:21 +0200
From: Tony Lindgren <tony@atomide.com>
To: Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH v2 09/10] drm/bridge: tc358775: Add support for tc358765
Message-ID: <20240131062021.GV31612@atomide.com>
References: <CAA8EJppYoBxYaFnu7UHxCgNiRwcjmVgPXXcQboaeu_dGCosJXg@mail.gmail.com>
 <20231204095213.2573620-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204095213.2573620-1-mwalle@kernel.org>
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
Cc: mripard@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 ivo.g.dimitrov.75@gmail.com, rfoss@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, tzimmermann@suse.de, jonas@kwiboo.se,
 pavel@ucw.cz, sam@ravnborg.org, merlijn@wizzup.org, neil.armstrong@linaro.org,
 sre@kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, simhavcs@gmail.com,
 dmitry.baryshkov@linaro.org, philipp@uvos.xyz, jernej.skrabec@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Michael Walle <mwalle@kernel.org> [231204 09:52]:
> >> @@ -643,6 +658,7 @@ static int tc_probe(struct i2c_client *client)
> >>
> >>         tc->dev = dev;
> >>         tc->i2c = client;
> >> +       tc->type = (enum tc3587x5_type)of_device_get_match_data(dev);
> >
> > Would it make sense to use i2c_get_match_data() instead?
> 
> FWIW, I' planning to add a dsi binding for this driver. So I'd
> suggest either the of_ or the device_ variant. Not sure though,
> if the new device supports the DSI commands.

Yeah good point as some hardware may not have i2c wired at all. Let's keep
this as of_device_get_match_data() for now as the driver is currently
completely dependant on devicetree.

I'll update the enumeration to use the hardware id numbering like Dmitry
suggested though.

Regards,

Tony
