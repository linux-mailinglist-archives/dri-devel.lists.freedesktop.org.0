Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34220B56D0D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 02:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A7E10E265;
	Mon, 15 Sep 2025 00:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uYBsB4oe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2A810E264
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 00:01:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3DE3640545;
 Mon, 15 Sep 2025 00:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7155C4CEF0;
 Mon, 15 Sep 2025 00:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757894494;
 bh=jf5WwI0Ql0igVBqg1T4+B4coelbMzYEoCfro+I3iuiY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uYBsB4oeIu6sKduzjLbuGGOQ5ycoP1olbc2bGupqhUtrSC68uPDRu4gQ+p7k91YLa
 wcFwC+QHO6EmmbejrTNXy/PhJoiGsDh+2gb/rhKk/NPveOLVFbcz63WrloEVnUzDb1
 PJWaFlImzUxZ+MRfGR7nUYU5wCOiHnGoVKPcIC3Xo3PN8qFC2jQFyIEn6opkqHatKX
 HTxXTM/JNJDwmBz+CjHWWefrR8srcwVNkKbXpCprS6FsfLJxUWRf/ovSsQxnWXwc0L
 PAqD1QbCgGsR+sCtsZjvCo9JhTZuQ9O1Uuq0vnrIqhtV3hQas6xsNk2r33bAJQY/7d
 rRul+E9pRcHMA==
Date: Sun, 14 Sep 2025 19:01:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: linux-arm-msm@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans de Goede <hansg@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-leds@vger.kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Pavel Machek <pavel@kernel.org>,
 linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, threeway@gmail.com,
 Daniel Thompson <danielt@kernel.org>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v5 2/4] dt-bindings: leds: commonize leds property
Message-ID: <175789449249.2282086.2330482533980735722.robh@kernel.org>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
 <20250910-leds-v5-2-bb90a0f897d5@vinarskis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-leds-v5-2-bb90a0f897d5@vinarskis.com>
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


On Wed, 10 Sep 2025 14:01:09 +0200, Aleksandrs Vinarskis wrote:
> A number of existing schemas use 'leds' property to provide
> phandle-array of LED(s) to the consumer. Additionally, with the
> upcoming privacy-led support in device-tree, v4l2 subnode could be a
> LED consumer, meaning that all camera sensors should support 'leds'
> and 'led-names' property via common 'video-interface-devices.yaml'.
> 
> To avoid dublication, commonize 'leds' property from existing schemas
> to newly introduced 'led-consumer.yaml'.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  .../devicetree/bindings/leds/backlight/led-backlight.yaml         | 6 +-----
>  Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml | 5 +----
>  .../devicetree/bindings/media/video-interface-devices.yaml        | 8 ++++++++
>  3 files changed, 10 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

