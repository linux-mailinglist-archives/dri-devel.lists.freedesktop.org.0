Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D20082D9C68
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 17:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F9C89CBE;
	Mon, 14 Dec 2020 16:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B8B6E2A3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 16:20:39 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D69A2225AB;
 Mon, 14 Dec 2020 16:20:38 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1koqaS-001DWu-Nn; Mon, 14 Dec 2020 16:20:36 +0000
MIME-Version: 1.0
Date: Mon, 14 Dec 2020 16:20:36 +0000
From: Marc Zyngier <maz@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 01/15] irqchip: Allow to compile bcmstb on other platforms
In-Reply-To: <20201214152731.mgoo2hvlu6uoi5md@gilmour>
References: <20201210134648.272857-1-maxime@cerno.tech>
 <20201210134648.272857-2-maxime@cerno.tech>
 <e0f1aed2b0007eab6e9192ac73fd411f@kernel.org>
 <20201214152731.mgoo2hvlu6uoi5md@gilmour>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <05aff5990faee6060696e98afb8b3a27@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: maxime@cerno.tech, eric@anholt.net,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 daniel.vetter@intel.com, airlied@linux.ie,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
 linux-kernel@vger.kernel.org, mchehab@kernel.org, tglx@linutronix.de,
 dave.stevenson@raspberrypi.com, linux-rpi-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 2020-12-14 15:27, Maxime Ripard wrote:
> Hi Marc,
> 
> On Thu, Dec 10, 2020 at 05:59:09PM +0000, Marc Zyngier wrote:

[...]

>> I'm always sceptical of making interrupt controllers user-selectable.
>> Who is going to know that they need to pick that one?
>> 
>> I'd be much more in favour of directly selecting this symbol
>> from DRM_VC4_HDMI_CEC, since there is an obvious dependency.
> 
> It's a bit weird to me that the HDMI CEC support selects it, since that
> interrupt controller is external and here no matter what.

 From glancing at the series, I was under the impression that these
controllers were there for the sole benefit of the HDMI controllers.
Is there anything else connected to them?

> Would selecting it from the ARCH_* Kconfig option work for you?

Sure. My only ask is that the low level plumbing is selected without
requiring any user guesswork.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
