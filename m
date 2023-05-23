Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B9A70E952
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C2C10E550;
	Tue, 23 May 2023 22:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FDD10E550
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 22:55:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D28096111A;
 Tue, 23 May 2023 22:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1A75C433D2;
 Tue, 23 May 2023 22:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684882504;
 bh=dS/YAPwYvnC+rAO3yycyAQlX67UojDPpvbvnHvURfM0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QhbaASO3SX6oEMdYloRMuQu+fO8z7EMT6Ht41KN3RvFMYNoPMsHWom9rwqMLPqYZ9
 //+ZB8v/Plyz8JALAqURXUge8kP3UmeQfQ6+S+LSpI4QQ1U4rXBt5vDQesaNq86tYv
 ZZRxtxg6MnPtnwE+3ANCP55NxE5DtcDRXShPtJYT+E8PBAv8g4w2WZZuPEHYQZFHs9
 9h2YAnK9oSGUbGB4YM/eGiCEkbB6FK5wiBpyqkwUuZ/aKT4ZUEkfdV5Vn9nZNUahxx
 5C1SU3M+wUNnpn1DpA/PiI0bgIde1/DZkqe9wNHBHhkwAzjWR3F0qxgmJKysAbmOby
 QPPia3CpkWBHQ==
Date: Tue, 23 May 2023 23:54:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Justin Chen <justin.chen@broadcom.com>
Subject: Re: [PATCH net-next v4 2/6] dt-bindings: net: Brcm ASP 2.0 Ethernet
 controller
Message-ID: <20230523-unfailing-twisting-9cb092b14f6f@spud>
References: <1684878827-40672-1-git-send-email-justin.chen@broadcom.com>
 <1684878827-40672-3-git-send-email-justin.chen@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1684878827-40672-3-git-send-email-justin.chen@broadcom.com>
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
Cc: andrew@lunn.ch, simon.horman@corigine.com, dri-devel@lists.freedesktop.org,
 edumazet@google.com, justinpopo6@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 sumit.semwal@linaro.org, f.fainelli@gmail.com,
 Florian Fainelli <florian.fainelli@broadcom.com>, linux@armlinux.org.uk,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, richardcochran@gmail.com, opendmb@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net,
 robh+dt@kernel.org, christian.koenig@amd.com, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Justin,

On Tue, May 23, 2023 at 02:53:43PM -0700, Justin Chen wrote:

> +  compatible:
> +    enum:
> +      - brcm,asp-v2.0
> +      - brcm,bcm72165-asp
> +      - brcm,asp-v2.1
> +      - brcm,bcm74165-asp

> +        compatible = "brcm,bcm72165-asp", "brcm,asp-v2.0";

You can't do this, as Rob's bot has pointed out. Please test the
bindings :( You need one of these type of constructs:

compatible:
  oneOf:
    - items:
        - const: brcm,bcm72165-asp
        - const: brcm,asp-v2.0
    - items:
        - const: brcm,bcm74165-asp
        - const: brcm,asp-v2.1

Although, given either you or Florian said there are likely to be
multiple parts, going for an enum, rather than const for the brcm,bcm..
entry will prevent some churn. Up to you.

Cheers,
Conor.
