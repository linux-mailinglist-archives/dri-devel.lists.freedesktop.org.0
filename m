Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D82D024F10A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 04:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301646E197;
	Mon, 24 Aug 2020 02:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9CFD6E197
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 02:18:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26B72279;
 Mon, 24 Aug 2020 04:18:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1598235529;
 bh=RoKm8ixOBiN9I2lstV2sr8M8mjB5HkR5dbHfe1S+R6s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LSBTXbotaqk4zEATQtqy3tif3cy2aX0VWWOHz4zL6NpNtJd98yHd5wvzGsfROtNcO
 xWUb9l40Cx422WfaSjzi75UhfCiwWklums84WckO3yPJz34oyF9GqcBv7+7WHU8mXw
 VAhu3HBjGc3mgv2PFNofwHKtX10v8KdKByjginOg=
Date: Mon, 24 Aug 2020 05:18:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v8 2/3] drm: bridge: Add support for Cadence MHDP DPI/DP
 bridge
Message-ID: <20200824021830.GZ6002@pendragon.ideasonboard.com>
References: <1596713672-8146-1-git-send-email-sjakhade@cadence.com>
 <1596713672-8146-3-git-send-email-sjakhade@cadence.com>
 <20200811023622.GC13513@pendragon.ideasonboard.com>
 <49c2a4c8-6d84-6164-d350-6a985fc9a3e9@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49c2a4c8-6d84-6164-d350-6a985fc9a3e9@ti.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, praneeth@ti.com,
 yamonkar@cadence.com, narmstrong@baylibre.com, airlied@linux.ie,
 jonas@kwiboo.se, nsekhar@ti.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com, robh+dt@kernel.org,
 jsarha@ti.com, Swapnil Jakhade <sjakhade@cadence.com>, mparab@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Fri, Aug 14, 2020 at 12:29:35PM +0300, Tomi Valkeinen wrote:
> On 11/08/2020 05:36, Laurent Pinchart wrote:
> 
> >> +static int cdns_mhdp_mailbox_write(struct cdns_mhdp_device *mhdp, u8 val)
> >> +{
> >> +	int ret, full;
> >> +
> >> +	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
> >> +
> >> +	ret = readx_poll_timeout(readl, mhdp->regs + CDNS_MAILBOX_FULL,
> >> +				 full, !full, MAILBOX_RETRY_US,
> >> +				 MAILBOX_TIMEOUT_US);
> >> +	if (ret < 0)
> >> +		return ret;
> >> +
> >> +	writel(val, mhdp->regs + CDNS_MAILBOX_TX_DATA);
> >> +
> >> +	return 0;
> >> +}
> > 
> > As commented previously, I think there's room for optimization here. Two
> > options that I think should be investigated are using the mailbox
> > interrupts, and only polling for the first byte of the message
> > (depending on whether the firmware implementation can guarantee that
> > when the first byte is available, the rest of the message will be
> > immediately available too). This can be done on top of this patch
> > though.
> 
> I made some tests on this.
> 
> I cannot see mailbox_write ever looping, mailbox is never full. So in this case the
> readx_poll_timeout() call is there just for safety to catch the cases where something has gone
> totally wrong or perhaps once in a while the mbox can be full for a tiny moment. But we always do
> need to check CDNS_MAILBOX_FULL before each write to CDNS_MAILBOX_TX_DATA, so we can as well use
> readx_poll_timeout for that to catch the odd cases (afaics, there's no real overhead if the exit
> condition is true immediately).
> 
> mailbox_read polls sometimes. Most often it does not poll, as the data is ready in the mbox, and in
> these cases the situation is the same as for mailbox_write.
> 
> The cases where it does poll are related to things where the fw has to wait for something. The
> longest poll waits seemed to be EDID read (16 ms wait) and adjusting LT (1.7 ms wait). And afaics,
> when the first byte of the received message is there, the rest of the bytes will be available
> without wait.
> 
> For mailbox_write and for most mailbox_reads I think using interrupts makes no sense, as the
> overhead would be big.
> 
> For those few long read operations, interrupts would make sense. I guess a simple way to handle this
> would be to add a new function, wait_for_mbox_data() or such, which would use the interrupts to wait
> for mbox not empty. This function could be used in selected functions (edid, LT) after
> cdns_mhdp_mailbox_send().
> 
> Although I think it's not that bad currently, MAILBOX_RETRY_US is 1ms, so it's quite lazy polling,
> so perhaps this can be considered TODO optimization.

I'm fine with TODO optimization.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
