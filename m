Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FD8C5BE72
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 09:13:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2212810E9C8;
	Fri, 14 Nov 2025 08:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nvNIya+/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E12D10E9C8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 08:13:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1DE20435F7;
 Fri, 14 Nov 2025 08:13:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B39DC4CEF1;
 Fri, 14 Nov 2025 08:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763107992;
 bh=PuJH4AZc5Qy8bJbMBrsiC84XGEAmby/s9fedLtlTjns=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nvNIya+/w/lTkrZb3XeEDlwqzQGzESD7Zqm8tOMrRVCij0fdxX3OCJyaRIAYUiDh0
 Ks//Bc3vb0jUqxzpz94HFBcit1vB9uc28bLbha2uqg+GqsX/tIHE08+uYFTP0uPx3f
 XR6sMfFAoeOkzrOiXMG2RStEJUyxYFIjPE1ZDmFOxxcFaIRUJbxC3o63/A02SaGFiH
 NWrhKNZbxyPcQS4SsZun/YVjVeF1o4PbqxsyjZdAQ3yTSG/BpbARfkxn1oAbM2A/vx
 ZFLW3IqsFmaup5yYsAnnNyNk92b/jKhnkrDFHeY+3ez/ec8EKCL8Jn+UePm9xPlBh3
 qabHbd3W2mALg==
Date: Fri, 14 Nov 2025 09:13:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 01/12] dt-bindings: panel: Convert Samsung SOFEF00
 DDIC into standalone yaml
Message-ID: <20251114-uptight-nondescript-whippet-fba10c@kuoka>
References: <20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz>
 <20251113-sofef00-rebuild-v2-1-e175053061ec@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251113-sofef00-rebuild-v2-1-e175053061ec@ixit.cz>
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

On Thu, Nov 13, 2025 at 06:57:35PM +0100, David Heidelberg wrote:
> Reason for moving from simple panel is this DDIC has three supplies,
> while panel-simple-dsi is limited to one.
> 
> Previous compatible only described the DDIC, but didn't include panel
> connected to it. Let's fix it, and offer bindings authors two
> compatibles to distinguish the connected panel.
> 
> Basic description for SOFEF00 DDIC with attached panels
> 
>  - Samsung AMS601NT22 6.01 inch, 1080x2160 pixels, 18:9 ratio
>  - Samsung AMS628NW01 6.28 inch, 1080x2280 pixels, 19:9 ratio
> 
> There is only one user which uses samsung,sofef00 and it's updated to
> comply within this patch series.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

