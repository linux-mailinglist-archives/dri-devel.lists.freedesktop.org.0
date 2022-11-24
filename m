Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BACD637C26
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 15:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7EF10E0E4;
	Thu, 24 Nov 2022 14:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A809B10E0E4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 14:56:44 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4B58820004;
 Thu, 24 Nov 2022 14:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1669301802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DHCQJ7ZAuuzC6UG49hSRfKeMxjBT7Ylpk7GBcGZRErE=;
 b=CVo66w0Atcxwn8aG3nTnKq12p3m+IrxlyisSdyRW1FupbUNbjU0oG74obbqTQhTSaY9oFS
 iusK80KUYBZbwkvG3b5V4NSZv5Z5qjNZL9KgPbPzL9ugR6BcqtooqsvBolXaTAoMIW9Ef8
 PJrRd+Vymz7xOEXFd/lNJf83UfaQCe/bVy6et+JqxjuQbJws4xdSlLetXfiNps6PKdEW9b
 PHOGdohwZGk43SIc+ERg4RIbHYp9cvbJLZCaqOzUyIRnqY22ZT7TpHGZiQLxaQ13PJxb4Q
 D9X5YL3d6O82VAVCsAIT6fyLe1ZDm76d0E0y9SCTFy8xjvRmbCdhJc4AQYg/hw==
Date: Thu, 24 Nov 2022 15:56:34 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 00/23] Add Tegra20 parallel video input capture
Message-ID: <20221124155634.5bc2a423@booty>
In-Reply-To: <3ecd7c3d-b013-18b8-ea12-ca3c673de22c@xs4all.nl>
References: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
 <3ecd7c3d-b013-18b8-ea12-ca3c673de22c@xs4all.nl>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, Richard Leitner <richard.leitner@skidata.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HI Hans,

On Thu, 24 Nov 2022 09:36:14 +0100
Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:

> Hi Luca,
> 
> On 09/11/2022 15:18, luca.ceresoli@bootlin.com wrote:
> > From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > Tegra20 and other Tegra SoCs have a video input (VI) peripheral that can
> > receive from either MIPI CSI-2 or parallel video (called respectively "CSI"
> > and "VIP" in the documentation). The kernel currently has a staging driver
> > for Tegra210 CSI capture. This patch set adds support for Tegra20 VIP
> > capture.
> > 
> > Unfortunately I had no real documentation available to base this work on,
> > and I started from a working downstream 3.1 kernel, that I have heavily
> > reworked to fit into the existing tegra-video driver. The existing code
> > appears written with the intent of being modular and allow adding new input
> > mechanisms and new SoCs while keeping a unique VI core module. However its
> > modularity and extensibility was not enough to add Tegra20 VIP support, so
> > I added some hooks to turn hard-coded behaviour into per-SoC or per-bus
> > customizable code. There are also some fixes, some generic cleanups and DT
> > bindings.  
> 
> I plan on testing this series (esp. making sure it keeps working on non-tegra210
> hardware), but I have to find time for that. This is on my TODO list, so I will
> get to it, but it might time.

Thanks for letting me know!

Indeed, with respect to what you wrote, even testing on tegra210
hardware would be useful in case you have any, as all the hardware I
can access is tegra20.

Kind regards.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
