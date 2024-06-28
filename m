Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2103F91C3E4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 18:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A1510E03E;
	Fri, 28 Jun 2024 16:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jookia.org header.i=@jookia.org header.b="QsZGUPCn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com
 [95.215.58.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5220010E03E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 16:40:59 +0000 (UTC)
X-Envelope-To: jani.nikula@linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1719592856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U88aOQSqT01+NP3zcbq60KCUzmQTSGOugyTyS/riJNQ=;
 b=QsZGUPCnEh3DuJ3GkQXXuAcR3AniphwAx4OzyRv3l4XguZx/3+QRDksAKnwUViZOSNZRR8
 owcillfhfKTN1sg5pZpzJcObvp+vwORSJKA0RJpwysoD0nZaBPNAdt4Tdpd3Pf8k6FAxy+
 trXBUefxICGDy621NzJPEcCPnnrAxpWleBznS1c7rblsrDPp23n28mdF3sFR6C5qbk43W1
 n8ZAvta2xUX0WTskx+vuFcV07A7c7wJVaFMY02Gv/qs8+VJ3hV+VdtpZo8qQQTs2FkAIg5
 s4yoHQ5fQtwQEqNkQrB68Uvcf0JYJf15rZRbLDsMoUoZ0jpifWvN5faZ1IvwiQ==
X-Envelope-To: dri-devel@lists.freedesktop.org
Date: Sat, 29 Jun 2024 02:39:16 +1000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: How to specify panel bit order in driver?
Message-ID: <Zn7nNMti5pdX67DH@titan>
References: <Zn4z_OJJ07xg_xmh@titan>
 <87le2pbjdf.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87le2pbjdf.fsf@intel.com>
X-Migadu-Flow: FLOW_OUT
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

Hi Jani,

On Fri, Jun 28, 2024 at 10:45:48AM +0300, Jani Nikula wrote:
> Might be helpful to actually point at the source code or commits or
> something.

The source code is here: drivers/gpu/drm/panel/panel-newvision-nv3052c.c
It's just a standard MIPI DBI panel. It reports using an RGB888 bus format.

> Maybe look at include/uapi/drm/drm_fourcc.h, and how the DRM_FORMAT_*
> macros are used.
> 
> Can't help you with device tree, but maybe this gives you pointers to
> other places for examples.

Currently it works like this:

- DRM uses 24-bit depth
- CRTC puts out a 24-bit signal
- This gets output over LCD pins
- The PCB drops 2 bits per channel by wiring 6 pins to GND
- The panel is told to only use 18 bits

Getting DRM to use MEDIA_BUS_FMT_RGB666_1X18 would be nice and allow the panel
to auto-detect which bits to use. But the bus format is set in the panel :(

Where is the bus format usually set for cases where a board only supports a
physical format?

> HTH,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel

John.
