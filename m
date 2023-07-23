Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D73F75E446
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jul 2023 21:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B157610E0F0;
	Sun, 23 Jul 2023 19:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3006::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AD410E0F0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jul 2023 19:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202212;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ud9zq6aOuGaXkNMbJmCVf0S/cXsiIFg4ZOBVoVGhI8Y=; b=DZhl+XrGeHz8fjA3z0+2nOKQBo
 EAHo0I4FcH78b2LZOfZF0y2zh3DJ0jeGLnYCG0ADK4fDBye7N2ejghiVZMZfVwdKtge/JX9Cg3G7H
 JTECEnhu6PJTF+XrPQdS4ZHhcnWerZD3/L60MN4LbesqIQdp5mxSr/uUqQZi9Sr4JtpZjq2BsmXwj
 Ua9eg+sWvy4YM6TqvAhM7jUQmOZleEiOBpIrZx4t4lFAt2+pqW3Ml2Evl2Zd4jaLn6UdF4atVHDcq
 6JAVhf3codZUBWMWeMXBUoH5nxH7w4K6EoEyB1XGDWfQYyvYbk2/p0J4rL2vpbCzK5JXc+tvktf4J
 +eOmpuaA==;
Received: from [2a01:799:95f:2800:2fb5:c6db:11b1:a10f] (port=48554)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1qNeQS-00Gp56-ST;
 Sun, 23 Jul 2023 21:07:28 +0200
Message-ID: <1cbc85a0-b9cf-477b-3463-ca238e1899a9@tronnes.org>
Date: Sun, 23 Jul 2023 21:07:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] drm/mipi-dbi: Lock SPI bus before setting D/C GPIO
Content-Language: en-US
To: =?UTF-8?Q?Otto_Pfl=c3=bcger?= <otto.pflueger@abscue.de>,
 dri-devel@lists.freedesktop.org
References: <20230720102605.67805-1-otto.pflueger@abscue.de>
 <20230720102605.67805-2-otto.pflueger@abscue.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20230720102605.67805-2-otto.pflueger@abscue.de>
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
 noralf@tronnes.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/20/23 12:26, Otto Pflüger wrote:
> Multiple displays may be connected to the same bus and share a D/C GPIO,
> so the display driver needs exclusive access to the bus to ensure that
> it can control the D/C GPIO safely.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> ---
>  drivers/gpu/drm/drm_mipi_dbi.c | 17 +++++++++++++----
>  drivers/gpu/drm/tiny/ili9225.c |  7 ++++++-
>  drivers/gpu/drm/tiny/ili9486.c |  4 ++++

You forgot to CC the driver maintainers, please add them in the next
version of the patchset. The get_maintainer script should be able to
pick them out for you.

Noralf.
