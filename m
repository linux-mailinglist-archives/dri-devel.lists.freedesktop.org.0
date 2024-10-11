Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3517999C70
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 08:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E36310EA37;
	Fri, 11 Oct 2024 06:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bF4rdRfG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB4A10EA37;
 Fri, 11 Oct 2024 06:09:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 71AF2A4512D;
 Fri, 11 Oct 2024 06:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B52C4CEC3;
 Fri, 11 Oct 2024 06:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1728626963;
 bh=i9cYUz3cSkHkjlbjXX2TL+CxfIfYsIh3kS/FujNH0ns=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bF4rdRfGhj7EVWEvLjIfvY+4Raq2vEZe+yssbLN3OZ7fW7bmvDXav08gT+gBmnGSN
 +kmbBAOFkJtlYBrDlPTHGKAwQ7ax+wesMXi2/XL+kUHhYtiJRprpUQREwCqcUwTNpH
 tw+1wq1CQATrSDYV/rW/qsI+U6tk1p7cmzHdYaBs=
Date: Fri, 11 Oct 2024 08:09:20 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Brian Cain <bcain@quicinc.com>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-serial@vger.kernel.org, linux-arch@vger.kernel.org,
 Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v8 4/5] tty: serial: handle HAS_IOPORT dependencies
Message-ID: <2024101112-tile-cupping-3431@gregkh>
References: <20241008-b4-has_ioport-v8-0-793e68aeadda@linux.ibm.com>
 <20241008-b4-has_ioport-v8-4-793e68aeadda@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008-b4-has_ioport-v8-4-793e68aeadda@linux.ibm.com>
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

On Tue, Oct 08, 2024 at 02:39:45PM +0200, Niklas Schnelle wrote:
> In a future patch HAS_IOPORT=n will disable inb()/outb() and friends at
> compile time. We thus need to add HAS_IOPORT as dependency for those
> drivers using them unconditionally. Some 8250 serial drivers support
> MMIO only use, so fence only the parts requiring I/O ports and print an
> error message if a device can't be supported with the current
> configuration.
> 
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
