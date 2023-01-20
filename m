Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 110AA675AC9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 18:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0887510E0FD;
	Fri, 20 Jan 2023 17:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9786210E0FD
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 17:07:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2F8A8B82851;
 Fri, 20 Jan 2023 17:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B027FC433EF;
 Fri, 20 Jan 2023 17:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674234472;
 bh=I6PH2H2Yw675+U9o8hDY9JH33oLdXehSqpyemY5dpRw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JaEnJgLx9EHv3vhiH7sCQTn9pOT9W8ogMRKD3E44E/5bgeqq2dSWZhN8bXVgaIM1k
 GNTAIcGK13iQCJlPl7fqc6FUd8IP2H4hUzQ9n7bNDsq8zIgBMaG8cYOvqZmABY63vQ
 jT6I+Bhgdp05A8MlQD+I5Ths0h297fbsJ9OLuas35U47/aZ2y7Pm8RRASmhC6wSDD7
 9V/b+uoEAcmoCN5bIGxZ17JdE5Zg+gujKXLfJjpl7c6/+PYLyIQl6EO+P8QbZIqt6n
 U+4S3G/RjkgcauE3ZmrnbQO/w79B6fX+NP6wbf/BQaW3LTAYSsxaXBHHN4tRWTApug
 1sliVIDuuLCCA==
Date: Fri, 20 Jan 2023 17:07:45 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 2/2] backlight: pwm_bl: Don't rely on a disabled PWM
 emiting inactive state
Message-ID: <Y8rKYUVU90Y6HgK+@google.com>
References: <20230120120018.161103-1-u.kleine-koenig@pengutronix.de>
 <20230120120018.161103-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230120120018.161103-3-u.kleine-koenig@pengutronix.de>
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 kernel@pengutronix.de, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 20 Jan 2023, Uwe Kleine-König wrote:

> Most but not all PWMs drive the PWM pin to its inactive state when
> disabled. However if there is no enable_gpio and no regulator the PWM
> must drive the inactive state to actually disable the backlight.
> 
> So keep the PWM on in this case.
> 
> Note that to determine if there is a regulator some effort is required
> because it might happen that there isn't actually one but the regulator
> core gave us a dummy. (A nice side effect is that this makes the
> regulator actually optional even on fully constrained systems.)
> 
> This fixes backlight disabling e.g. on i.MX6 when an inverted PWM is
> used.
> 
> Hint for the future: If this change results in a regression, the bug is
> in the lowlevel PWM driver.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/video/backlight/pwm_bl.c | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
