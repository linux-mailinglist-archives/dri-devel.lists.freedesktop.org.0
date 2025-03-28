Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77810A7459E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 09:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0AF810E2F3;
	Fri, 28 Mar 2025 08:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oCGo3RDt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EEAE10E2F3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 08:42:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 05F32A410AD;
 Fri, 28 Mar 2025 08:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819DBC4CEE4;
 Fri, 28 Mar 2025 08:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743151365;
 bh=eKiysfOtXP1WtvpY1AV0YfA4J7E/PtTyWO4U4gpCiT0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oCGo3RDtIzVH0sJT2bwZHE5CvaoGNME4l1ssBly4wNuIPPtDzjGuRKA3tBSu8L5qG
 vB5lQ9Tfh11RGt31s5jYzl310aI+LSHajyBPozzAdXi8HeifobRt8RYV5T7NvJ7OEb
 Ff8+l4ODqmMffdxeryXMuVMu+t6g85cE81scqBR/UeQpjOsKtlUJIl7lpER7oY3bqm
 1fZFb7WbEuhH2uekwJeX6Yvd7zuEukrQbMzUk5fzyZelipzpGH9LBs5swJS2qU9ZnY
 b+uXu1XJLCnVPShrvUImpVkkkhU2E5sgsNeejmBLBppQ3M4GFO8F0W70pqn+Lwoysg
 lIIInw8veY/AA==
Date: Fri, 28 Mar 2025 08:42:40 +0000
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Thompson <danielt@kernel.org>, pavel@ucw.cz,
 jingoohan1@gmail.com, deller@gmx.de, simona@ffwll.ch,
 linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v4 08/11] backlight: lcd: Replace fb events with a
 dedicated function call
Message-ID: <20250328084240.GD585744@google.com>
References: <20250321095517.313713-1-tzimmermann@suse.de>
 <20250321095517.313713-9-tzimmermann@suse.de>
 <Z91NHP65X9GFIYOe@aspen.lan>
 <fd216fbf-ff4b-4d33-a8be-b1b7fe525a35@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd216fbf-ff4b-4d33-a8be-b1b7fe525a35@suse.de>
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

On Mon, 24 Mar 2025, Thomas Zimmermann wrote:

> Hi
> 
> Am 21.03.25 um 12:27 schrieb Daniel Thompson:
> > On Fri, Mar 21, 2025 at 10:54:01AM +0100, Thomas Zimmermann wrote:
> > > Remove support for fb events from the lcd subsystem. Provide the
> > > helper lcd_notify_blank_all() instead. In fbdev, call
> > > lcd_notify_blank_all() to inform the lcd subsystem of changes
> > > to a display's blank state.
> > > 
> > > Fbdev maintains a list of all installed notifiers. Instead of fbdev
> > > notifiers, maintain an internal list of lcd devices.
> > > 
> > > v3:
> > > - export lcd_notify_mode_change_all() (kernel test robot)
> > > v2:
> > > - maintain global list of lcd devices
> > > - avoid IS_REACHABLE() in source file
> > > - use lock guards
> > > - initialize lcd list and list mutex
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
> > Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
> 
> Thanks for reviewing.  There are reviews of all patches. If nothing else
> comes in, feel free to merge it via the backlight tree.  I can also take the
> series into dri-devel.

I plan to take this in via the Backlight tree.  Once applied, I'll send
out a pull-request for other maintainers to pull from.

For the record, just so we're clear, this will not make v6.15.

-- 
Lee Jones [李琼斯]
