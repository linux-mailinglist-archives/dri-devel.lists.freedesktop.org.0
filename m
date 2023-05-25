Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E9C710AD7
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 13:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7052C10E133;
	Thu, 25 May 2023 11:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4865410E059
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 11:24:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 69F3864391;
 Thu, 25 May 2023 11:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE7B9C433D2;
 Thu, 25 May 2023 11:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685013886;
 bh=btjnOS5QBQbH1TK+krstl7WoC4pjCk/EvZ5Dl24yVkA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BlGx7vULqkX0U0Lhjy84XofXnfTD4UM/yoGBln0OrkvrvDEn0HUQSoIOr+qBE/IoV
 IfLOZRRxCuy6N+sOfAuh4HwbZ+/7rUFiDri3KIW4+OlURootsv1ifFpFlrRnyCCT7h
 Pziwa+ibAp+ajH6tLKnml66xH20j1DcV00A3swnTXpemCyhDFf5ojGi6MMv1O3fDyr
 fJowxDn7KA0eXO+1AvBe81+VoOWr+QflNJAJugIiv3HOWmHaYq8bYArtET2vMcYUd2
 lWc3TmhPnIQsSe5g99na91nQ3aWL+/C7gXSpQ58gLUpAiUB2lBCB/jaGgzTMnYcRZy
 LSB3eQaqcrBAA==
Date: Thu, 25 May 2023 12:24:41 +0100
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] backlight: Switch i2c drivers back to use .probe()
Message-ID: <20230525112441.GA423913@google.com>
References: <20230521143844.375244-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230521143844.375244-1-u.kleine-koenig@pengutronix.de>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jianhua Lu <lujianhua000@gmail.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 21 May 2023, Uwe Kleine-König wrote:

> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() from
> struct i2c_driver.
> 
> Also fix two indention inconsistencies in the neighbourhood.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> this patch was generated using coccinelle, but I aligned the result to
> the per-file indention.
> 
> This is one patch for the whole backlight subsystem. If you want it
> split per driver for improved patch count numbers, please tell me.
> 
> Currently there are no changes to drivers/video/backlight in next, so
> the change should apply fine. If however there are other changes that
> result in conflicts, feel free to just drop the hunks in the relevant
> files and apply anyhow. I'll care about the fallout later.
> 
> Best regards
> Uwe
> 
> 
>  drivers/video/backlight/adp8860_bl.c | 4 ++--
>  drivers/video/backlight/adp8870_bl.c | 4 ++--
>  drivers/video/backlight/arcxcnn_bl.c | 2 +-
>  drivers/video/backlight/bd6107.c     | 2 +-
>  drivers/video/backlight/ktz8866.c    | 2 +-
>  drivers/video/backlight/lm3630a_bl.c | 2 +-
>  drivers/video/backlight/lm3639_bl.c  | 2 +-
>  drivers/video/backlight/lp855x_bl.c  | 2 +-
>  drivers/video/backlight/lv5207lp.c   | 2 +-
>  9 files changed, 11 insertions(+), 11 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
