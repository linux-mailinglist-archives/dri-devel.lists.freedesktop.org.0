Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AC176CBC2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 13:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C5110E066;
	Wed,  2 Aug 2023 11:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3006::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD32D10E066
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 11:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202212;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KtyXEDjRXykfMMI9e+J/s9T/m9ueAOCtjWNluDP+qUY=; b=b3xoIh/8c+vzvIpTRWizszzCo2
 JRIUcR+cGF0x8Klqq6y0cqYWFfKrVCvEimrSNkbAb2zIgzNCzmTLJtSiOtXORdTn4PXyKO4P3OOv+
 oUWTthnsk2sPdZN+AqJaHO5NMO2KzpUa32stdjRTk2bUbCwx/tkukwxMlbDuxmc7EEUkEGYzRu35W
 5r0r2o69x8rrc57Ub/99xud0PL1grYfGSTHapLZvMIZR7CpA79wan7ABCSpUjRSveXKD4YDbyw09D
 BOizTMtwnqBsMgl5QD8Xk2C3+b97G/9Nzph7JVPZHWfn69VoV1zNHa1nGUt0LjV0/0ln3Kzg20dqy
 DLjGQ9Jg==;
Received: from [2a01:799:95f:2800:2fb5:c6db:11b1:a10f] (port=54492)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1qR9zr-00Bx5W-5A;
 Wed, 02 Aug 2023 13:26:31 +0200
Message-ID: <00821258-6393-6717-8923-45b9b03a82ce@tronnes.org>
Date: Wed, 2 Aug 2023 13:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 0/2] drm/mipi-dbi: Allow using same the D/C GPIO for
 multiple displays
Content-Language: en-US
To: =?UTF-8?Q?Otto_Pfl=c3=bcger?= <otto.pflueger@abscue.de>,
 dri-devel@lists.freedesktop.org
References: <20230724065654.5269-1-otto.pflueger@abscue.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20230724065654.5269-1-otto.pflueger@abscue.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 noralf@tronnes.org, Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 David Lechner <david@lechnology.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/24/23 08:56, Otto Pflüger wrote:
> When multiple displays are connected to the same SPI bus, the data/command
> switch is sometimes considered part of the bus and is shared among the
> displays.
> 
> This series adds the GPIO_FLAGS_BIT_NONEXCLUSIVE flag for this GPIO and
> SPI bus locking to the panel-mipi-dbi/drm_mipi_dbi drivers to support
> this hardware setup.
> 
> ---

Thanks, applied to drm-misc-next.

Noralf.

> Changes in v3:
> - add comment and remove unnecessary line break as suggested by Noralf
> Changes in v2:
> - fix uses of mipi_dbi_spi_transfer outside drm_mipi_dbi.c (errors
>   reported by kernel test robot)
> - remove the is_locked argument introduced in v1 which was always set to
>   true
> 
> Otto Pflüger (2):
>   drm/mipi-dbi: Lock SPI bus before setting D/C GPIO
>   drm/tiny: panel-mipi-dbi: Allow sharing the D/C GPIO
> 
>  drivers/gpu/drm/drm_mipi_dbi.c        | 17 +++++++++++++----
>  drivers/gpu/drm/tiny/ili9225.c        |  7 ++++++-
>  drivers/gpu/drm/tiny/ili9486.c        |  4 ++++
>  drivers/gpu/drm/tiny/panel-mipi-dbi.c |  3 ++-
>  4 files changed, 25 insertions(+), 6 deletions(-)
> 
> 
> base-commit: ae867bc97b713121b2a7f5fcac68378a0774739b
