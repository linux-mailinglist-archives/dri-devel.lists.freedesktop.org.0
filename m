Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C926499B90D
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2024 12:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A54710E032;
	Sun, 13 Oct 2024 10:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="H8+COFdE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Sun, 13 Oct 2024 10:00:23 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D1910E048
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2024 10:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1728813623; x=1760349623;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UnjVHzXxbyrm6dBNgzmBWG95oOhZhEuahhTR4t6B0TM=;
 b=H8+COFdEJTODiHvB5eCcItq2WwSflRjd2EWPRV6to9tgL0A8NM/dfQ3s
 2KUwHcPR1Z+R3V7V7X/qakR3/CVqC3q7ns3IvLAgUN03hM0Bb7fPXSFPB
 R//otK+NHRAHhcrtYPrKAsKJicm4TlmwHTjpMu00jj7swJrwqHZNUXFGT
 0j9dVX7GZ/WDQx6349w6xDuNE0zoK1/hyaz5tY+ZV3X8PcGJ/3buIBJsf
 gFCkADS8UBpqLYWA6IEQ4DgG6VkcFBq9momOd8RLV1r3mbQv3JcP7WYij
 i/wKF3EoZk7WLSg1Lw1sU+CO1QSdXMQdMvrBo3gX3RYM7pZHXlTXtynBi w==;
X-CSE-ConnectionGUID: WbtJBVtfTFKCjrEfhWFFuQ==
X-CSE-MsgGUID: RTC9G46iT7KBEuwPZLnxug==
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; d="scan'208";a="264005111"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2024 02:53:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 13 Oct 2024 02:52:36 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 13 Oct 2024 02:52:32 -0700
Date: Sun, 13 Oct 2024 09:52:31 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Simon Horman <horms@kernel.org>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Woojung Huh <woojung.huh@microchip.com>, Andrew Lunn
 <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, Richard Cochran <richardcochran@gmail.com>, Jiawen Wu
 <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Carl Vanderlip
 <quic_carlv@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>,
 <UNGLinuxDriver@microchip.com>, <netdev@vger.kernel.org>,
 <llvm@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH net-next 1/3] net: dsa: microchip: copy string using
 strscpy
Message-ID: <20241013095231.qoy3aa5zvrftezso@DEN-DL-M70577>
References: <20241011-string-thing-v1-0-acc506568033@kernel.org>
 <20241011-string-thing-v1-1-acc506568033@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241011-string-thing-v1-1-acc506568033@kernel.org>
X-Mailman-Approved-At: Sun, 13 Oct 2024 10:22:33 +0000
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

> Prior to this patch ksz_ptp_msg_irq_setup() uses snprintf() to copy
> strings. It does so by passing strings as the format argument of
> snprintf(). This appears to be safe, due to the absence of format
> specifiers in the strings, which are declared within the same function.
> But nonetheless GCC 14 warns about it:
> 
> .../ksz_ptp.c:1109:55: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
>  1109 |         snprintf(ptpmsg_irq->name, sizeof(ptpmsg_irq->name), name[n]);
>       |                                                              ^~~~~~~
> .../ksz_ptp.c:1109:55: note: treat the string as an argument to avoid this
>  1109 |         snprintf(ptpmsg_irq->name, sizeof(ptpmsg_irq->name), name[n]);
>       |                                                              ^
>       |                                                              "%s",
> 
> As what we are really dealing with here is a string copy, it seems make
> sense to use a function designed for this purpose. In this case null
> padding is not required, so strscpy is appropriate. And as the
> destination is an array, the 2-argument variant may be used.

.. is an array - and of fixed size.

> 
> Signed-off-by: Simon Horman <horms@kernel.org>
> ---
>  drivers/net/dsa/microchip/ksz_ptp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/dsa/microchip/ksz_ptp.c b/drivers/net/dsa/microchip/ksz_ptp.c
> index 050f17c43ef6..22fb9ef4645c 100644
> --- a/drivers/net/dsa/microchip/ksz_ptp.c
> +++ b/drivers/net/dsa/microchip/ksz_ptp.c
> @@ -1106,7 +1106,7 @@ static int ksz_ptp_msg_irq_setup(struct ksz_port *port, u8 n)
>         ptpmsg_irq->port = port;
>         ptpmsg_irq->ts_reg = ops->get_port_addr(port->num, ts_reg[n]);
> 
> -       snprintf(ptpmsg_irq->name, sizeof(ptpmsg_irq->name), name[n]);
> +       strscpy(ptpmsg_irq->name, name[n]);
> 
>         ptpmsg_irq->num = irq_find_mapping(port->ptpirq.domain, n);
>         if (ptpmsg_irq->num < 0)
> 
> --
> 2.45.2
>

This looks good to me.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>

