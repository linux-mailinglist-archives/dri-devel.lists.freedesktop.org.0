Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE2F545477
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 20:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87D611B278;
	Thu,  9 Jun 2022 18:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7976A11B239
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 18:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=jKbDcZ4FhDibO8JxQCv+QTocgVRW/U4XOgTC8XfUUug=;
 b=hB40xZ4hyPPam4Fq/YieoN0twbebpXGTVjxxVs1G+S+8a9iH9D8i0u3i+AMp8/RLibzAcma9Vlt7v
 VyO6DO4zilHHgBE2VUs2eADzCQ5C/q6dQqPCKNR4iCwX8ge4AdqSQkqi5sSjaapMCA7XLkmGPSY7sW
 epNdmDZ3KYvcvm5DO25vTWp9w/uRRpcYqwX12wYXCOO/IgXaIwiYYcPBqnB3nKlV9atmQM8kstFqwp
 tpSeGRj0hDrBQuiizXznNkHJ3TETssMxo//Rk6pbLM7V6caV93KqPdX/yHx3UQPQsKs8o1QtEqdWq7
 jjGblP9Qw5uY2Mg3/ncc6DnA2XjU0ag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=jKbDcZ4FhDibO8JxQCv+QTocgVRW/U4XOgTC8XfUUug=;
 b=h+XYNB6d3kMH4x9JO6z2R7yz+scQXKcFoWGqN5h9JQ+W64bMGdDm5wYYLMKC72jEHdyxVuWYMau7f
 8sh55jeCA==
X-HalOne-Cookie: b7de46776df3454b5a3e685c6072709fa563f076
X-HalOne-ID: c0b9d5a1-e825-11ec-8231-d0431ea8bb10
Received: from mailproxy3.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id c0b9d5a1-e825-11ec-8231-d0431ea8bb10;
 Thu, 09 Jun 2022 18:55:39 +0000 (UTC)
Date: Thu, 9 Jun 2022 20:55:37 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH v2] fbdev: atmel_lcdfb: Rework backlight status updates
Message-ID: <YqJCKQmQEuVsbspK@ravnborg.org>
References: <20220609180440.3138625-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609180440.3138625-1-steve@sk2.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Helge Deller <deller@gmx.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen, thanks!
On Thu, Jun 09, 2022 at 08:04:40PM +0200, Stephen Kitt wrote:
> Instead of checking the state of various backlight_properties fields
> against the memorised state in atmel_lcdfb_info.bl_power,
> atmel_bl_update_status() should retrieve the desired state using
> backlight_get_brightness (which takes into account the power state,
> blanking etc.). This means the explicit checks using props.fb_blank
> and props.power can be dropped.
> 
> The backlight framework ensures that backlight is never negative, so
> the test before reading the brightness from the hardware always ends
> up false and the whole block can be removed. The framework retrieves
> the brightness from the hardware through atmel_bl_get_brightness()
> when necessary.
> 
> As a result, bl_power in struct atmel_lcdfb_info is no longer
> necessary, so remove that while we're at it. Since we only ever care
> about reading the current state in backlight_properties, drop the
> updates at the end of the function.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
