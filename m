Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13BD8778CB
	for <lists+dri-devel@lfdr.de>; Sun, 10 Mar 2024 23:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082AB10E0A2;
	Sun, 10 Mar 2024 22:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=xnux.eu header.i=@xnux.eu header.b="GTkGpEn3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 321 seconds by postgrey-1.36 at gabe;
 Sun, 10 Mar 2024 22:29:25 UTC
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A098910E0A2
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Mar 2024 22:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xnux.eu; s=mail;
 t=1710109441; bh=0dh7I6BWcg7FvSd5QFiZfq+RVCTqyfeXWc/UPHa5atk=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=GTkGpEn3N5HcVUAR98jLSZy17qzKnKu8TgBB3cjtDGJQwkOzKb2yJp+bqFI3joH8J
 uxgzo2F5cx7Ie2uyLtEtjQHwljMVm3T9ziyfDh8cfCjn0rjENGS4QXMOWjo56VdoDY
 MuQU5vWCEQULn3w6drNgNV6COrsqnjUR85xMS+IE=
Date: Sun, 10 Mar 2024 23:23:57 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <x@xnux.eu>
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Icenowy Zheng <uwu@icenowy.me>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: tcon: Support keeping dclk rate upon ancestor
 clock changes
Message-ID: <s3iqqnqiqnlujncbb6vnip7hvofgbom54on7fx4hxmyfsk2v2w@gbvpkptsa5g3>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <x@xnux.eu>, 
 Frank Oltmanns <frank@oltmanns.dev>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Icenowy Zheng <uwu@icenowy.me>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20240310-tcon_keep_stable_rate-v1-1-0296b0a85c02@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240310-tcon_keep_stable_rate-v1-1-0296b0a85c02@oltmanns.dev>
X-Mailman-Approved-At: Sun, 10 Mar 2024 22:33:18 +0000
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

Hello Frank,

On Sun, Mar 10, 2024 at 02:32:29PM +0100, Frank Oltmanns wrote:
> +static int sun4i_rate_reset_notifier_cb(struct notifier_block *nb,
> +				      unsigned long event, void *data)
> +{
> +	struct sun4i_rate_reset_nb *rate_reset = to_sun4i_rate_reset_nb(nb);
> +
> +	if (event == POST_RATE_CHANGE)
> +		schedule_delayed_work(&rate_reset->reset_rate_work, msecs_to_jiffies(100));

If you get multiple reset notifier calls within 100ms of the first one,
the delay from the last one will not be 100ms, so this may violate expectations
you're describing in the commit message.

schedule_delayed_work doesn't re-schedule the work if it's already pending.

Kind regards,
	o.
