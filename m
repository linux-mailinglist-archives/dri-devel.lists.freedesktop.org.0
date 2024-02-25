Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 740DE86296D
	for <lists+dri-devel@lfdr.de>; Sun, 25 Feb 2024 07:44:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EDE010E094;
	Sun, 25 Feb 2024 06:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=atomide.com header.i=@atomide.com header.b="Ie0O9Jb5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3099610E094
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 06:44:25 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id 99E406049D;
 Sun, 25 Feb 2024 06:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1708843465;
 bh=yOiWI4zXxk9tteBxt/1jtMEPSWGGVFPg76RiIDMTL6A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ie0O9Jb56Wbh1T7zAGMmHbqPK5dAgIlYpOjJRMXwmeezXIitzzXkYvGyKGSdfKYEU
 +DJM17sOHqVcIUGiGpKCFQIROcgUabxEsUc3uvndt3CSLgESVHoYinza9qwHlf0HS8
 vawaI5TNDA/IJUex2d9a4IfNfnnzLBTo2jxxK2letEppGoZIcQ9PpqEbmjXGUJ3VCs
 AkjnaspHLAvU2m7O/mJev6Wxd3CMpc6/XWjPGsAWfgeVcHc6i8O1mcO5OBGsgGjwBZ
 l0KQikYuKNddqxltu1mzJr7k36j8Z8XkKqXWJEirE8ZnorOMBjxRE556KlkE1A6QTj
 o+tRaZhmsP42Q==
Date: Sun, 25 Feb 2024 08:44:04 +0200
From: Tony Lindgren <tony@atomide.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/omapdrm: Fix console with deferred ops
Message-ID: <20240225064404.GS5299@atomide.com>
References: <20240219142001.19727-1-tony@atomide.com>
 <20240219142001.19727-2-tony@atomide.com>
 <7ab37c2e-8a28-4ada-a72e-96112b708b06@suse.de>
 <20240220085655.GO5299@atomide.com>
 <56475919-7aaf-47d6-8803-ef9c7673857b@suse.de>
 <20240220101654.GP5299@atomide.com>
 <2e37574b-dede-4bd6-8a71-32ab354f7510@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e37574b-dede-4bd6-8a71-32ab354f7510@suse.de>
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

* Thomas Zimmermann <tzimmermann@suse.de> [240220 10:42]:
> The changes below look good. You can test by instrumenting
> drm_fb_helper_deferred_io() with printk(). For testing, you can reduce the
> write-back frequency by setting helper->fbdefio.delay to a higher value. If
> you set it to HZ, it should only do a write-back once per second. Then do an
> mmap() from userspace and copy data into the memory region. It should print
> something from drm_fb_helper_deferred_io(). Best regards Thomas

OK thanks I tested with fbtest.c I found [0] with some trace_printk
added and it works nicely :) Will post v2 set of patches.

Regards,

Tony

[0] https://gist.github.com/rafalrusin/1482697
