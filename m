Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B3029FFA9
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:23:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908C26E994;
	Fri, 30 Oct 2020 08:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4456C6E967
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 08:13:09 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CMw6W39qyz1qsbF;
 Fri, 30 Oct 2020 09:13:07 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CMw6W2PtBz1qs0L;
 Fri, 30 Oct 2020 09:13:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id hMdnGehF6OuB; Fri, 30 Oct 2020 09:13:05 +0100 (CET)
X-Auth-Info: vUAR87pUiQ6NPBNlluh20KaWp5vIQWxxjSorIyZwwqQ=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 30 Oct 2020 09:13:05 +0100 (CET)
Subject: Re: [PATCH v7] backlight: lms283gf05: Convert to GPIO descriptors
To: Linus Walleij <linus.walleij@linaro.org>, Lee Jones
 <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
References: <20201030002014.5398-1-linus.walleij@linaro.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <6965ac31-c268-290c-c227-9c0e48ebf82f@denx.de>
Date: Fri, 30 Oct 2020 09:13:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201030002014.5398-1-linus.walleij@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Mack <daniel@zonque.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/30/20 1:20 AM, Linus Walleij wrote:
> This converts the lms283gf05 backlight driver to use GPIO
> descriptors and switches the single PXA Palm Z2 device
> over to defining these.
> 
> Since the platform data was only used to convey GPIO
> information we can delete the platform data header.
> 
> Notice that we define the proper active low semantics in
> the board file GPIO descriptor table (active low) and
> assert the reset line by bringing it to "1" (asserted).
> 
> Cc: Marek Vasut <marex@denx.de>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v6->v7:
> - Rebase onto v5.10-rc1
> ChangeLog v5->v6:
> - Rebase onto v5.9-rc1
> ChangeLog v4->v5:
> - Rebase on v5.8-rc1
> - Collected Daniel's Reviewed-by tag.
> ChangeLog v3->v4:
> - Check IS_ERR() on the returned GPIO descriptor.
> - Unconditionally set consumer name since the API tolerates NULL.
> ChangeLog v2->v3:
> - Fix a use-before-allocated bug discovered by compile tests.
> - Remove unused ret variable as autobuilders complained.
> ChangeLog v1->v2:
> - Bring up the GPIO de-asserted in probe()
> 
> Marek: I saw this was written by you, are you regularly
> testing the Z2 device?

No, it has been a very long time since I last used this device.

[...]
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
