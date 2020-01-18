Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C26481416B5
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2020 10:11:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF056F9D2;
	Sat, 18 Jan 2020 09:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B348D6F9D2
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2020 09:11:46 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E15CA80440;
 Sat, 18 Jan 2020 10:11:41 +0100 (CET)
Date: Sat, 18 Jan 2020 10:11:40 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: display: Convert a bunch of panels to DT
 schema
Message-ID: <20200118091140.GA12245@ravnborg.org>
References: <20200117231756.3141-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200117231756.3141-1-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=mvVtXd7HAW45dodTMrUA:9 a=dLSrt29t64xHWj39:21 a=gagzr6WNY6cZXZWM:21
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob.

On Fri, Jan 17, 2020 at 05:17:56PM -0600, Rob Herring wrote:
> Convert all the 'simple' panels which match the constraints of the
> common panel-simple.yaml schema. This conversion is based on how the
> panels are documented. Some may turn out to be more complex once the
> schema is applied to actual dts files.

Thanks for updating this patch - and very good to reduce the number of
files with almost the same content.

One comment below, with that addressed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

There are likely some dt files that assume panels need no power and need a
fixed-regulator or something as power-supply now is mandatory.
Should this be checked before we apply this patch?

As we continue to see new panels more or less every week I would like
this patch applied to drm-misc-next as soon as possible to avoid any
future conflicts.

> index 513f03466aba..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Innolux P120ZDG-BF1 12.02 inch eDP 2K display panel
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> -
> -Required properties:
> -- compatible: should be "innolux,p120zdg-bf1"
> -- power-supply: regulator to provide the supply voltage
> -
> -Optional properties:
> -- enable-gpios: GPIO pin to enable or disable the panel
> -- backlight: phandle of the backlight device attached to the panel
> -- no-hpd: If HPD isn't hooked up; add this property.

panel-simple.yaml does not include the no-hpd property.
We only have 2 bindings, this and sharp,ld-d5116z01b.yaml
that include the no-hpd property.

We have two options:
1) add the no-hpd property to panel-simple.yaml
2) keep an independent binding for panels using no-hpd

I suggest to keep an independent binding for innolux,p120zdg-bf1
so we keep panel-simple.yaml slim.
In other words do not delete this file and remove the compatible from
panel-simple.yaml

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
