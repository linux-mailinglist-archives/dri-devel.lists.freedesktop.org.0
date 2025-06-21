Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3D7AE286E
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 11:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3887810E118;
	Sat, 21 Jun 2025 09:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 587 seconds by postgrey-1.36 at gabe;
 Sat, 21 Jun 2025 09:55:56 UTC
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [83.223.95.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EB510E118
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jun 2025 09:55:56 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id 424172C06849;
 Sat, 21 Jun 2025 11:46:08 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 2CF521E4C40; Sat, 21 Jun 2025 11:46:08 +0200 (CEST)
Date: Sat, 21 Jun 2025 11:46:08 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Ahmed Salem <x0rw3ll@gmail.com>
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [RFC PATCH] amd64-agp: do not bind to pci driver if probing fails
Message-ID: <aFZ_YJH30f1WDneD@wunner.de>
References: <c5kqcudzrcafm24nr5ixgalhxdkxl3uoueerjlp6tbksj3hzy7@klytjugpkvdm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5kqcudzrcafm24nr5ixgalhxdkxl3uoueerjlp6tbksj3hzy7@klytjugpkvdm>
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

On Sat, Jun 21, 2025 at 04:55:52AM +0300, Ahmed Salem wrote:
> --- a/drivers/char/agp/amd64-agp.c
> +++ b/drivers/char/agp/amd64-agp.c
> @@ -768,10 +768,15 @@ int __init agp_amd64_init(void)
>  
>  		/* Look for any AGP bridge */
>  		agp_amd64_pci_driver.id_table = agp_amd64_pci_promisc_table;
> -		err = driver_attach(&agp_amd64_pci_driver.driver);
> -		if (err == 0 && agp_bridges_found == 0) {
> +		if ((int *)agp_amd64_pci_driver.probe != 0) {
>  			pci_unregister_driver(&agp_amd64_pci_driver);
>  			err = -ENODEV;
> +		} else {
> +			err = driver_attach(&agp_amd64_pci_driver.driver);
> +			if (err == 0 && agp_bridges_found == 0) {
> +				pci_unregister_driver(&agp_amd64_pci_driver);
> +				err = -ENODEV;
> +			}

Is the "probe" member in agp_amd64_pci_driver overwritten with a
zero pointer anywhere?  I don't see that it is, so it seems the
else-branch is never entered.

I had already prepared a fix for this, but waited for 0-day to
crunch through it.  I've just submitted it, so that's what I had
in mind:

https://lore.kernel.org/r/f8ff40f35a9a5836d1371f60e85c09c5735e3c5e.1750497201.git.lukas@wunner.de/

Thanks,

Lukas
