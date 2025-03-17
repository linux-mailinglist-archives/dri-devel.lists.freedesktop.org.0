Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1CFA6621A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 23:54:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F81810E05D;
	Mon, 17 Mar 2025 22:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.b="sjGTpFcW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95F610E05D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 22:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CA02E41081
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1742252030; bh=m1ArYPexXQLLtsttigae2e4aJ3hQRaLakaXfUFdgBoY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=sjGTpFcWrFNyxcrEhg5znWVSCMX/Jxov0q9Ugh8gtnqqZboBDzXiAlylqrhRY2zi1
 cyIGLnkpswu+aJtUY2TZFzVxJp5OtmTs2P6lw6wCWVbxIjHv9FM/b8k656bRWLHLaV
 IuhbgxUjA3neuEQ3ZllosRbua/ZfRVTLxtuJzGbPskBFHH+A8gwLanTpL4YSk5Rnhk
 xKToCE+f5fDf2QwgTp9qiWfUyAm1N7yKJA7tJq1AlBPoNPjGlJG83tN41wUr7ewT3Z
 P1JXzlHeb8updjN+8+EUEZwreC8NacJv2vgz5hPP5DZ+bfIcUze43tjUudxE7PLO28
 j0KiF4vKWTBRw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id CA02E41081;
 Mon, 17 Mar 2025 22:53:49 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, simona.vetter@ffwll.ch, airlied@gmail.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: Re: [PATCH] docs: driver-api: firmware: clarify userspace requirements
In-Reply-To: <20250314100137.2972355-1-jacek.lawrynowicz@linux.intel.com>
References: <20250314100137.2972355-1-jacek.lawrynowicz@linux.intel.com>
Date: Mon, 17 Mar 2025 16:53:49 -0600
Message-ID: <874izre0aq.fsf@trenco.lwn.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com> writes:

> The guidelines mention that firmware updates can't break the kernel,
> but it doesn't state directly that they can't break userspace programs.
> Make it explicit that firmware updates cannot break UAPI.
>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  .../driver-api/firmware/firmware-usage-guidelines.rst        | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/driver-api/firmware/firmware-usage-guidelines.rst b/Documentation/driver-api/firmware/firmware-usage-guidelines.rst
> index fdcfce42c6d28..5f8f13e2ee510 100644
> --- a/Documentation/driver-api/firmware/firmware-usage-guidelines.rst
> +++ b/Documentation/driver-api/firmware/firmware-usage-guidelines.rst
> @@ -42,3 +42,8 @@ then of course these rules will not apply strictly.)
>    deprecating old major versions, then this should only be done as a
>    last option, and be stated clearly in all communications.
>  
> +* Firmware files that affect the User API (UAPI) shall not introduce
> +  changes that break existing userspace programs. Updates to such firmware
> +  must ensure backward compatibility with existing userspace applications.
> +  This includes maintaining consistent interfaces and behaviors that
> +  userspace programs rely on.
> \ No newline at end of file

This ^^^^^^^^^^^^^^^^^^^^^^^^  is a good thing to avoid.  That can be
fixed up at apply time.

Dave, you're the only one with fingerprints on this document; is the
change OK with you?

Thanks,

jon
