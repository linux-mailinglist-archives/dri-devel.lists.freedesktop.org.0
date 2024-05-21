Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DBF8CB044
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 16:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427AB10EC37;
	Tue, 21 May 2024 14:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K315iUjp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF4810EC37
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 14:21:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ACB226228C;
 Tue, 21 May 2024 14:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33621C4AF09;
 Tue, 21 May 2024 14:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716301266;
 bh=CLn2G4vuf3oqkBDthyQRr2R2coyMKZzEup6hxUQ08uc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K315iUjpBHdqtqR4SIkjemhcchKB0hAco+F+zmDbiSjfML1DhHMC26xg+aIor62ZL
 B58A+4O2N5B7z9+j9su5xbnz3rqZKPOHGn/d/+hoYTaVijlZCVYdzvdeGmttb2yYBv
 O0sMT4IBB1J0ymBAqfxwEIQWda8b+T8uQAr43Xf1sx8oyfcAKrGRK09poTVMEjG+eT
 HFgHRvX52akpZeLeSLFvkqXMRAPZlucaDURmkbfOZDrfxX84q5Do35I7RVWkJHmHri
 zud1cpeFU6p1KJGSJVLF0jP1M4kGeG6EFAIbuAvMZnZtqu1VCYs27uNVNEwUbgy0ot
 K0eNwl8qveSIQ==
Date: Tue, 21 May 2024 09:21:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: Reorganize legacy eDP panel bindings
Message-ID: <171630126263.4110905.17984387768866183422.robh@kernel.org>
References: <20240520153813.1.Iefaa5b93ca2faada269af77deecdd139261da7ec@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520153813.1.Iefaa5b93ca2faada269af77deecdd139261da7ec@changeid>
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


On Mon, 20 May 2024 15:38:17 -0700, Douglas Anderson wrote:
> Back in the day, we used to need to list the exact panel in dts for
> eDP panels. This led to all sorts of problems including a large number
> of cases where people listed a bogus panel in their device tree
> because of the needs of second sourcing (and third sourcing, and
> fourth sourcing, ...). Back when we needed to add eDP panels to dts
> files we used to list them in "panel-simple.yaml".
> 
> These days we have the new way of doing things as documented in
> "panel-edp.yaml". We can just list the compatible "edp-panel", add
> some timing info to the source code, and we're good to go. There's not
> really good reasons not to use this new method.
> 
> To try to make it obvious that we shouldn't add new compatible strings
> for eDP panels, let's move them all out of the old "panel-simple.yaml"
> file to their own file: "panel-edp-legacy.yaml". This new file will
> have a description that makes it obvious that we shouldn't use it for
> new panels.
> 
> While we're doing this:
> - We can remove eDP-specific properties from panel-simple.yaml since
>   there are no more panels there.
> - We don't need to copy non-eDP properties to the
>   "panel-edp-legacy.yaml".
> - We'll fork off a separate yaml file for "samsung,atna33xc20.yaml".
>   This is an eDP panel which isn't _quite_ handled by the generic
>   "edp-panel" compatible since it's not allowed to have an external
>   backlight (it has one builtin) and it absolutely requires an
>   "enable" GPIO.
> - We'll un-fork the "sharp,ld-d5116z01b.yaml" and put it in
>   "panel-edp-legacy.yaml" since there doesn't appear to be any reason
>   for it to be separate.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  .../display/panel/panel-edp-legacy.yaml       | 127 ++++++++++++++++++
>  .../bindings/display/panel/panel-simple.yaml  |  58 --------
>  .../display/panel/samsung,atna33xc20.yaml     |  95 +++++++++++++
>  .../display/panel/sharp,ld-d5116z01b.yaml     |  30 -----
>  4 files changed, 222 insertions(+), 88 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-edp-legacy.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

