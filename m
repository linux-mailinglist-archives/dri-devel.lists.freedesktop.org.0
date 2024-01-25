Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 630A283C3FF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 14:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB5E10F1D6;
	Thu, 25 Jan 2024 13:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C24510F1D6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 13:45:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 322C062202;
 Thu, 25 Jan 2024 13:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59646C433C7;
 Thu, 25 Jan 2024 13:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706190304;
 bh=NkGyl0Jo0whrkxO3b7LKj7C4yJ2z5Q7jS9gPgnwH+To=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rug8Utf/w3dEQerx0wbHVZ/SWWLm4O7sohG0zDLffqrmWy1HvAKou2t+boHVJO82r
 +wpGR6eKbO4rXTPaejfNyYwS8RxD5FSOnymemR/CviaMKn1H6ZhtKt9RVJyexJs+MW
 DcK9n4RlsioLM/MRILqegUMF79BdrWHlfGqtQ2X8cBcNXjrCSfgrrrImI3ueuCg/8h
 iHXb0JHwoTtGos5SeeD/EylC6Yq+7hTRzfWURDCmZRRT67R7ib026siLqXYVvzH4/N
 PZzt51NLWtfLNpaBoE52UJui1OwWm1uMSJM9wCfXzRJERo6qQvyRr7eehDSvc/XuDY
 gudz9vm89sPpA==
Date: Thu, 25 Jan 2024 13:44:58 +0000
From: Lee Jones <lee@kernel.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: Re: [PATCH v4 1/3] leds: ktd2692: move ExpressWire code to library
Message-ID: <20240125134458.GK74950@google.com>
References: <20240122-ktd2801-v4-0-33c986a3eb68@skole.hr>
 <20240122-ktd2801-v4-1-33c986a3eb68@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240122-ktd2801-v4-1-33c986a3eb68@skole.hr>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Daniel Thompson <daniel.thompson@linaro.org>, dri-devel@lists.freedesktop.org,
 Karel Balej <balejk@matfyz.cz>, linux-fbdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 Jan 2024, Duje Mihanović wrote:

> The ExpressWire protocol is shared between at least KTD2692 and KTD2801
> with slight differences such as timings and the former not having a
> defined set of pulses for enabling the protocol (possibly because it
> does not support PWM unlike KTD2801). Despite these differences the
> ExpressWire handling code can be shared between the two, so move it into
> a library in preparation for adding KTD2801 support.
> 
> Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
> ---
>  MAINTAINERS                       |   7 +++
>  drivers/leds/Kconfig              |   4 ++
>  drivers/leds/Makefile             |   3 +
>  drivers/leds/flash/Kconfig        |   2 +-
>  drivers/leds/flash/leds-ktd2692.c | 116 +++++++++-----------------------------

>  drivers/leds/leds-expresswire.c   |  68 ++++++++++++++++++++++
>  include/linux/leds-expresswire.h  |  36 ++++++++++++

Please can you separate the Expresswire addition into its own patch?

>  7 files changed, 146 insertions(+), 90 deletions(-)

-- 
Lee Jones [李琼斯]
