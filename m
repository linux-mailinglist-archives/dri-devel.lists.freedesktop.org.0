Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2D67A5A5A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 09:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B6010E350;
	Tue, 19 Sep 2023 07:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-224.mta1.migadu.com (out-224.mta1.migadu.com
 [95.215.58.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A5E10E342
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 20:55:46 +0000 (UTC)
Date: Tue, 19 Sep 2023 06:52:12 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1695070544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tD3Att9ZhAZZWzcTqs+Nca0qUc5//9Lj3PJessBJC+g=;
 b=HKE82hVocAGjDR2kt68+KpmpTheJCyztaklVxUtX3SHGrx4HzRMVdI3iPeoGg7+PBgoOtF
 vlQ+3OFyeZDExfQTm3HKsoRW4arlQHEpJUve7lcbTSsxGEa5ukeimCgEmJZzP6VPK4hBKN
 v70auWxJIRvlL1Rn9L1J1Rq9PtXWkEBcHlG/PRLVsFdQGeNYM8ZwYaFwos2kn+ZyjjO3oN
 XCgCxh01FPxxlZJi8G4jQRjO0UzWz82/Vnvbt9VVXLPIf4Dd9RQeW1hupUVlcT79PZbwAF
 igylu3P62bukh89pQq4WaORPfsCTchPYIXPItXaqAxSo+ngZnaKKgzUOacPP1g==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [RFC PATCH v2 3/9] drm/panel: nv3052c: Sleep for 150ms after reset
Message-ID: <ZQi4fFZ0VnsUIiXO@titan>
References: <20230918125853.2249187-1-contact@jookia.org>
 <20230918125853.2249187-4-contact@jookia.org>
 <7fc1ca68-ca7c-59b2-0b70-27bc34d83cee@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fc1ca68-ca7c-59b2-0b70-27bc34d83cee@quicinc.com>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 19 Sep 2023 06:59:32 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Chris Morgan <macromorgan@hotmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@edgeble.ai>,
 Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 18, 2023 at 01:19:03PM -0700, Jessica Zhang wrote:
> Hi John,
> 
> Just wondering, is there some context to this change? I.e., was this made to
> fix a specific issue?
> 
> This seems like a pretty significant increase in wait time so, if it's not a
> fix, I'm not sure if this would be an improvement on the current behavior.
> 
> Thanks,
> 
> Jessica Zhang

Hi Jessica,

Thank you for the feedback.

This patch here is required by the data sheet if the screen was already running
and was reset. This is necessary if for example the bootloader set up and had
the screen running. However I have not tested this, it's possible the specific
panels have shorter tolerances for resets. This is purely precautionary at
this stage based on what the data sheet says.

That said I will be investigating this specific use case with this panel over
the next few months. I am okay separating out this patch until I have proof it's
needed for my particular display. I don't know anything about the ltk display.

The second sleep patch can probably be omitted as I don't think the panel being
prepared then unprepared in rapid succession is a realistic situation, but I 
figured I might as well propose it to see if it's the right thing to do.

Thanks for your time and review,
John.
