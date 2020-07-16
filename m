Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8142224DF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 16:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6336E064;
	Thu, 16 Jul 2020 14:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B906E064
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 14:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 6F036FB03;
 Thu, 16 Jul 2020 16:08:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8_DNoGSdlg8i; Thu, 16 Jul 2020 16:08:44 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id D8C5942576; Thu, 16 Jul 2020 16:08:43 +0200 (CEST)
Date: Thu, 16 Jul 2020 16:08:43 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH 0/2] Fix st7703 panel initialization failures
Message-ID: <20200716140843.GA359122@bogon.m.sigxcpu.org>
References: <20200716123753.3552425-1-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716123753.3552425-1-megous@megous.com>
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
Cc: Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Robert Chiras <robert.chiras@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ondrej,
On Thu, Jul 16, 2020 at 02:37:51PM +0200, Ondrej Jirman wrote:
> When extending the driver for xbd599 panel support I tried to do minimal
> changes and keep the existing initialization timing.
> 
> It turned out that it's not good enough and the existing init sequence
> is too aggressive and doesn't follow the specification. On PinePhone
> panel is being powered down/up during suspend/resume and with current
> timings this frequently leads to corrupted display.

Given the amount of ST7703 look alikes i don't think you can go by the
datasheet and hope not to break other panels. The current sleeps cater
for the rocktech panel (which suffered from similar issues you describe
when we took other parameters) so you need to make those panel specific.

Cheers,
 -- Guido

> 
> This patch series fixes the problems.
> 
> The issue was reported by Samuel Holland.
> 
> Relevant screenshots from the datasheet:
> 
>   Power on timing: https://megous.com/dl/tmp/35b72e674ce0ca27.png
>   Power off timing: https://megous.com/dl/tmp/dea195517106ff17.png
>   More optimal reset on poweron: https://megous.com/dl/tmp/a9e5caf14e1b0dc6.png
>   Less optimal reset on poweron: https://megous.com/dl/tmp/246761039283c4cf.png
>   Datasheet: https://megous.com/dl/tmp/ST7703_DS_v01_20160128.pdf
> 
> Please take a look.
> 
> thank you and regards,
>   Ondrej Jirman
> 
> Ondrej Jirman (2):
>   drm/panel: st7703: Make the sleep exit timing match the spec
>   drm/panel: st7703: Fix the power up sequence of the panel
> 
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 29 ++++++++++---------
>  1 file changed, 15 insertions(+), 14 deletions(-)
> 
> -- 
> 2.27.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
