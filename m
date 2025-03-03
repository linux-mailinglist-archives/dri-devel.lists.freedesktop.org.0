Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDC6A4CC1B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 20:41:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40F610E4CA;
	Mon,  3 Mar 2025 19:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j4R/4wfq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A9110E4C6;
 Mon,  3 Mar 2025 19:41:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4D96BA44F88;
 Mon,  3 Mar 2025 19:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 726B8C4CED6;
 Mon,  3 Mar 2025 19:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741030871;
 bh=KZ7XHt3siA+yNszSiXHA6b2kocbImvk02r3QUZ/DZZM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j4R/4wfqdlrIGvmcugqLfadqwrTOGhj7dTagqcKlM/tk0jdSaoHVHBi5NoHg/J+y6
 2KFr/inmJ3UqWjEeYw+YYmQRr5G59RaZxbjV2H+TQrTVVL4RnjU1vYJyneFxFuSbcW
 wc7nBI7LXcCvC6j708R2cjA6L7Dj/r1YRsS4Z+v9hJ0CvbBRDla/G6qWowhMfVCmMY
 cvnl/DVYxMqxHe8biHWokNOEAx/gE2dN5chjNK17bYd0WzE0l6IJx8W6X+1Vy3Uk7K
 o8hM7ZcIqrjiedyi2XMAWIZxlGo+TG4NubYoUedcd26BrriSqAucab1v6bmVXMl1bb
 NV0ZC/Fnj+zgg==
Date: Mon, 3 Mar 2025 20:41:06 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Simona Vetter <simona@ffwll.ch>, cocci@inria.fr,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] drm/nouveau: Add a jump label in
 nouveau_gem_ioctl_pushbuf()
Message-ID: <Z8YF0kkYLlh1m5ys@pollux>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <8f785de5-ebe2-edd9-2155-f440acacc643@web.de>
 <809905c6-73c0-75a6-1226-048d8cb8dfda@web.de>
 <684bfc0d-7e1d-40f1-b1b7-d6ed64fcd8b7@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <684bfc0d-7e1d-40f1-b1b7-d6ed64fcd8b7@web.de>
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

On Mon, Mar 03, 2025 at 06:49:07PM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 5 Apr 2023 18:38:54 +0200
> 
> The label “out_prevalid” was used to jump to another pointer check
> despite of the detail in the implementation of the function
> “nouveau_gem_ioctl_pushbuf” that it was determined already in one case
> that the corresponding variable contained an error pointer
> because of a failed call of the function “u_memcpya”.
> 
> Thus use an additional label.
> 
> This issue was detected by using the Coccinelle software.
> 
> Fixes: 2be65641642e ("drm/nouveau: fix relocations applying logic and a double-free")
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

I'm not entirely sure, but I remember that we had this discussion already.

Can you please send patches from the same address as indicated by your SoB?
