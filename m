Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF747A67004
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 10:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A27010E455;
	Tue, 18 Mar 2025 09:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cTzqeLHQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9190510E455
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 09:41:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 39204A48F10;
 Tue, 18 Mar 2025 09:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03B7C4CEDD;
 Tue, 18 Mar 2025 09:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742290863;
 bh=TSc5W2q6U2pCETrZtYcwbVySG6HvhFvMTOtr1i1RvG8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cTzqeLHQyr05coLOSUhhzopp77QKqrqw1LJ6Vgr4/UbU3TSEKwOGYDbomUbrtmANr
 FQuQTnLQ6q0eQ7Vg2ahqmvFAC0IOvAZDEqVSQ9sYktHGOA/+/jbOM/swDyJ1K+VQ/D
 6uroiAglI7QL5Hwr6KEj0dZyg91Wmfu1D+YBFYTNEKsK+ITQPUUs+vJ089/qIB3pBw
 Y8faoQwRSqn52e7oIURqnXbe1pREuxojNe1ZEfZ2HsLaHLrwn4ZluVx9c8dF+Po+M0
 mLXf6oW4/mUSkJOvMfrufE3s7FnlSflw9anSqqZJLb5bh/Wh9JJ+WjUVzmxGcN2xXR
 lFBkAjTG9SO3g==
Date: Tue, 18 Mar 2025 09:40:59 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, pavel@ucw.cz, jingoohan1@gmail.com, deller@gmx.de,
 simona@ffwll.ch, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 08/11] backlight: lcd: Replace fb events with a
 dedicated function call
Message-ID: <Z9k_qy-Kh3-v5tKg@aspen.lan>
References: <20250306140947.580324-1-tzimmermann@suse.de>
 <20250306140947.580324-9-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306140947.580324-9-tzimmermann@suse.de>
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

On Thu, Mar 06, 2025 at 03:05:50PM +0100, Thomas Zimmermann wrote:
> Remove support for fb events from the lcd subsystem. Provide the
> helper lcd_notify_blank_all() instead. In fbdev, call
> lcd_notify_blank_all() to inform the lcd subsystem of changes
> to a display's blank state.
>
> Fbdev maintains a list of all installed notifiers. Instead of fbdev
> notifiers, maintain an internal list of lcd devices.

I don't love the LCD devices list, however I can see the list of notifiers
had the same semantic effect (only less explicit) so I can live with
it ;-).

> v3:
> - export lcd_notify_mode_change_all() (kernel test robot)
> v2:
> - maintain global list of lcd devices
> - avoid IS_REACHABLE() in source file
> - use lock guards
> - initialize lcd list and list mutex
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Happy with these changes, but have the same EXPORT_SYMBOL_GPL()
questions I did with the backlight code.


Daniel.
