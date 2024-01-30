Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 500E9842D8B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 21:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBBC113525;
	Tue, 30 Jan 2024 20:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE72113525
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 20:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4648141A47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1706645596; bh=qc+FUESSC4CgMeoT5lKa+9TenrTCMiJSvkxdiwl2RKY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aup2R0qlc2N2Sb4Cujbc3RoKo/v7y4RIb89hNg5W9j93QgraOOCbq/wj67VxOHGjG
 /KTBqozjTxoPjkR7mzEgxYKjHY4Ed43BQ7Es7552wVzvk7SWp4MMqrv3NuopbDCRoF
 IxRC02TWivmpCr8cTYIy7fZi68btN+u6nSp68cVA4wH7AtRpSMBOb/MgVpQ2UOxIZ0
 81rN0R5hwuKJ4F4gm9yxBlkBKmIOrLfjBZTqrZwQUDMlXUz7N1vkbMXjLHhw7wdjMI
 3l1BhUTzsDgJjYEzW95YexlQKOsEGiTSY0kSSe//BorBrb7QIsQKpx4TlKIgdC6zkf
 by0+R7C2Xs3Zw==
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 4648141A47;
 Tue, 30 Jan 2024 20:13:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/2] kernel-doc: Do not pre-process comments
In-Reply-To: <20240122093152.22536-1-anna-maria@linutronix.de>
References: <20240122093152.22536-1-anna-maria@linutronix.de>
Date: Tue, 30 Jan 2024 13:13:15 -0700
Message-ID: <87v87abmw4.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Anna-Maria Behnsen <anna-maria@linutronix.de> writes:

> Hi,
>
> this is a repost of the RFC queue
> https://lkml.kernel.org/r/20240116151456.48238-1-anna-maria@linutronix.de
>
> Jonathan Corbet is fine with this change and mentioned in an answer the
> following:
>
>   "The kernel-doc change should really go together with the DRM change.
>   I'm happy to carry both with an ack from DRMland or have the kernel-doc
>   patch go through the DRM tree, whichever is easiest."
>
> But back to the patchset: Commit 654784284430 ("kernel-doc: bugfix -
> multi-line macros") introduces pre-processing of backslashes at the end of
> a line to not break multi-line macros. This pre-processing is done
> independently if it is inside code or inside a comment.
>
> This illustation of a hierarchy as a code block inside a kernel-doc comment
> has a backslash at the end of the line:
>
> ---8<---
> /**
>  * DOC: hierarchy
>  *
>  *                    Top Level
>  *                /               \
>  *         Child A                 Child B
>  */
> ---8<---
>
> It will be displayed as:
>
> ---8<---
> 	     Top Level
> 	 /                *        Child A                 Child B
> ---8<---
>
>
> As I asked for a solution on the linux-doc mailing list, I got some
> suggestions with workarounds and also got the suggestion by Matthew Wilcox
> to adapt the backslash preprocessing in kernel-doc script. I tested it and
> fixed then the newly produced warnings which are covered in the first
> patch. The processing of the documentation seems to work - but please don't
> rely on my tests as I'm not a perl neither a kernel-doc expert.
>
> Thanks,
>
> 	Anna-Maria
>
>
>
> Anna-Maria Behnsen (2):
>   drm/vram-helper: Fix 'multi-line' kernel-doc comments
>   scripts/kernel-doc: Do not process backslash lines in comments
>
>  drivers/gpu/drm/drm_gem_vram_helper.c | 44 ++++++++++++---------------
>  include/drm/drm_gem_vram_helper.h     | 16 +++++-----
>  scripts/kernel-doc                    |  2 +-
>  3 files changed, 29 insertions(+), 33 deletions(-)

Series applied, thanks.

jon
