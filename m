Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7456E2B9001
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 11:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB39589BD2;
	Thu, 19 Nov 2020 10:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D4789BD2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 10:20:47 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B457A24698;
 Thu, 19 Nov 2020 10:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605781246;
 bh=ehcYypQuHzkF5BBv0v8MHkj6WiebOTftlrc66yRCup8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aOcHDQupECII/OPF1ZL97joCf5UAJW1nxgbLLnjhMpeewNP59EcUgNH31uCt5Jlbj
 R/BzklO4l86Zii9GwTGFGPFrapVYBlYHRrZuqvtN0Bw+she5+i7wkSAn+Fqeru4o35
 daNhqKAPZVA+pQddvIgsaNYfW29MhZHbi6+JZVcY=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kfh3P-00Bv0R-EZ; Thu, 19 Nov 2020 10:20:39 +0000
MIME-Version: 1.0
Date: Thu, 19 Nov 2020 10:20:39 +0000
From: Marc Zyngier <maz@kernel.org>
To: Guillaume Tucker <guillaume.tucker@collabora.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: Re: next/master bisection: baseline.dmesg.emerg on meson-gxbb-p200
In-Reply-To: <a0bec7c4-9bec-8858-4879-52f4688d9992@collabora.com>
References: <5fb5e094.1c69fb81.a2014.2e62@mx.google.com>
 <a0bec7c4-9bec-8858-4879-52f4688d9992@collabora.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <630e00e83cdd07ee5a0eaba9d3479554@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: guillaume.tucker@collabora.com, narmstrong@baylibre.com,
 kernelci-results@groups.io, khilman@baylibre.com, jbrunet@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 martin.blumenstingl@googlemail.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: kernelci-results@groups.io,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-19 08:50, Guillaume Tucker wrote:
> Please see the automated bisection report below about some kernel
> errors on meson-gxbb-p200.
> 
> Reports aren't automatically sent to the public while we're
> trialing new bisection features on kernelci.org, however this one
> looks valid.
> 
> The bisection started with next-20201118 but the errors are still
> present in next-20201119.  Details for this regression:
> 
>   https://kernelci.org/test/case/id/5fb6196bfd0127fd68d8d902/
> 
> The first error is:
> 
>   [   14.757489] Internal error: synchronous external abort: 96000210
> [#1] PREEMPT SMP

Looks like yet another clock ordering setup. I guess different Amlogic
platforms have slightly different ordering requirements.

Neil, do you have any idea of which platform requires which ordering?
The variability in DT and platforms is pretty difficult to follow (and
I don't think I have such board around).

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
