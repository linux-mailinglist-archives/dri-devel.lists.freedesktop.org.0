Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1418919C07F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 13:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9BA6EA6B;
	Thu,  2 Apr 2020 11:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 658 seconds by postgrey-1.36 at gabe;
 Thu, 02 Apr 2020 11:50:27 UTC
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net
 [176.9.242.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC086EA69
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 11:50:27 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
 by bmailout3.hostsharing.net (Postfix) with ESMTPS id 332821005938C;
 Thu,  2 Apr 2020 13:50:26 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id B6D9144DF86; Thu,  2 Apr 2020 13:50:25 +0200 (CEST)
Date: Thu, 2 Apr 2020 13:50:25 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Daniel Dadap <ddadap@nvidia.com>
Subject: Re: How to handle disconnection of eDP panels due to dynamic display
 mux switches
Message-ID: <20200402115025.phwr2kv4o3e24me7@wunner.de>
References: <956fd624-e1f5-e2a0-90de-9a5f2934547d@nvidia.com>
 <20200402113925.2zvatduiyqld7pj2@wunner.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200402113925.2zvatduiyqld7pj2@wunner.de>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 02, 2020 at 01:39:25PM +0200, Lukas Wunner wrote:
> First of all, there's DPCD byte 3 bit 6 (NO_AUX_HANDSHAKE_LINK_TRAINING)
> which is documented as follows:
> 
>     Does not require AUX CH handshake when the link configuration is
>     already known. [...] The known-good drive current and pre-emphasis
>     level (or those used in the last "full" link training with AUX CH
>     handshake) must be used when the link training is performed without
>     AUX CH handshake.
> 
> That bit is set on the MacBook Pros in question.
> 
> So I think what we should be doing here is that the DRM driver which
> happens to be muxed to the panel on boot performs link training and
> informs vga_switcheroo of the drive current, pre-emph level, etc.
> The other DRM driver is notified when that information is available
> and uses it to set up its eDP output, skipping an actual AUX CH
> handshake.

Actually I now remember that I already prepared for this by adding a
vga_switcheroo handler capability:

 * @VGA_SWITCHEROO_NEEDS_EDP_CONFIG: whether the handler is unable to switch
 *      the AUX channel separately. This signals to clients that the active
 *      GPU needs to train the link and communicate the link parameters to the
 *      inactive GPU (mediated by vga_switcheroo). The inactive GPU may then
 *      skip the AUX handshake and set up its output with these pre-calibrated
 *      values (DisplayPort specification v1.1a, section 2.5.3.3)

And the referenced DP spec section says:

        For a closed, embedded connection, the DisplayPort transmitter
        and receiver may be set to pre-calibrated parameters without
        going through the full link training sequence. In this mode,
        the DisplayPort transmitter may start a normal operation
        following the transmission of the Clock Recovery Pattern with
        pre-calibrated drive current and pre-emphasis level, as shown
        with a dotted arrow in Figure 2-36.

Thanks,

Lukas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
