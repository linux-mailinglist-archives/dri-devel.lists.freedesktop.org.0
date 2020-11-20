Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 719542BA8A5
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 12:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC0A89A1E;
	Fri, 20 Nov 2020 11:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D314789A1E
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 11:10:51 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6830822201;
 Fri, 20 Nov 2020 11:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605870651;
 bh=yaMyGLR6+HErwF5fFCq7lMMRoVDnM2QpDVBXqkEnsds=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PBdHfcXKscivK28jgHEaCCLTplQlGEUp5fR8ZY+phVIf1SWL7ecBj3ZuQ5z0AU2rN
 UysVnyL5nosXSP94td0CLPwY4xkbwIAk2DLBWV6KsXVjXC+Rn97qv+MN9AppIYWo9r
 dyC9I5SfM/wPrYf4SvNXTN+Z0FisFqjW41Vj+u14=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kg4JU-00CEWA-Sm; Fri, 20 Nov 2020 11:10:49 +0000
MIME-Version: 1.0
Date: Fri, 20 Nov 2020 11:10:48 +0000
From: Marc Zyngier <maz@kernel.org>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: Re: [PATCH 2/2] drm/meson: dw-hdmi: Enable the iahb clock early enough
In-Reply-To: <966e90ba-5b38-9ba5-65b3-1a17dbd51871@collabora.com>
References: <20201120094205.525228-1-maz@kernel.org>
 <20201120094205.525228-3-maz@kernel.org>
 <966e90ba-5b38-9ba5-65b3-1a17dbd51871@collabora.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <7e7ff26fdbc8540749522c23997549f6@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: guillaume.tucker@collabora.com, narmstrong@baylibre.com,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-20 10:54, Guillaume Tucker wrote:
> On 20/11/2020 09:42, Marc Zyngier wrote:
>> Instead of moving meson_dw_hdmi_init() around which breaks existing
>> platform, let's enable the clock meson_dw_hdmi_init() depends on.
>> This means we don't have to worry about this clock being enabled or
>> not, depending on the boot-loader features.
>> 
>> Fixes: b33340e33acd ("drm/meson: dw-hdmi: Ensure that clocks are 
>> enabled before touching the TOP registers")
>> Reported-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> 
> Although I am triaging kernelci bisections, it was initially
> found thanks to our friendly bot.  So if you're OK with this, it
> would most definitely appreciate a mention:
> 
>   Reported-by: "kernelci.org bot" <bot@kernelci.org>

Sure. Neil can add this when (and if) he applies these patches.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
