Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA88C07658
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 18:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B000710EB19;
	Fri, 24 Oct 2025 16:49:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="oieEWKBF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1AC10EB19
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:49:48 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ctTQc70Q1z9sdM;
 Fri, 24 Oct 2025 18:49:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761324585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=voMhPB56AjZqI1kvGnHcSiUUhK8Wg3bhpr9YnMNAyT4=;
 b=oieEWKBFBDRsdgxZE5eHK9Xd/Ycru1/jelXO40sEvgWSOiozSlaXJfKTek6OUCjVKyDBlT
 e+Csbh6+mXBLJaNaXqAkePkeSYvMUglcsrfjeeFomFENI7KqWCBoRB7mM6O0p8uFF0R5H9
 5z6OAD8gnzz45dr2Cj5MkEIFBKgZTHx+pNqQw/DmoARCBRdo9tsVoorwrXnCkTJcGqTpMb
 cvuPygxxAgDC2fvezRLNxuCtx7m0h9V3ZTLYCxHbPYY1aZBZNsIOiqTLaCB5VFYIr7+w7o
 qqSKYArh5P2vmw7+IvYfD42iL8uGQ/dG+AJdlNZcTraRjj/N6Rm4j0NI5jOKUg==
Message-ID: <a9c1aea1-1427-4c15-9453-3e7510183082@mailbox.org>
Date: Fri, 24 Oct 2025 18:49:40 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/i915/dmabuf: Flush the cache in vmap
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Christian Brauner <brauner@kernel.org>,
 Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20251024110432.1313391-1-jfalempe@redhat.com>
 <a1d6cf1f-02b6-4c89-84e2-4b2af39829ef@ursulin.net>
 <6757f62e-0b10-4fc5-a9cb-16006c723459@redhat.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: de-CH-frami, en-CA
In-Reply-To: <6757f62e-0b10-4fc5-a9cb-16006c723459@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 6ixkkyxgpz6k615ok73tmkoswm4f4eg4
X-MBO-RS-ID: dce591b738c6af03645
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

On 10/24/25 14:48, Jocelyn Falempe wrote:
> On 24/10/2025 13:53, Tvrtko Ursulin wrote:
>> On 24/10/2025 12:04, Jocelyn Falempe wrote:
>>> On a lenovo se100 server, when using i915 GPU for rendering, and the
>>> ast driver for display, the graphic output is corrupted, and almost
>>> unusable.
>>>
>>> Adding a clflush call in the vmap function fixes this issue
>>> completely.
>>
>> AST is importing i915 allocated buffer in this use case, or how exactly is the relationship?
> 
> I think it's mutter/gnome-shell who copy the buffer from i915 to ast, here is the logs:
> 
> gnome-shell[2079]: Failed to initialize accelerated iGPU/dGPU framebuffer sharing: Do not want to use software renderer (llvmpipe (LLVM 19.1.7, 256 bits)), falling back to CPU copy path

FWIW, the code which logged "falling back to CPU copy path" was removed in mutter 42. Can you still reproduce the issue with a newer version of mutter, ideally 49? A lot has changed over the last 3.5 years.


> gnome-shell[1533]: Created gbm renderer for '/dev/dri/card0'
> gnome-shell[1533]: GPU /dev/dri/card1 selected as primary
> 
> card0 is ast and card1 is i915
> 
> Do you think there is something missing in mutter?

Not that I can see offhand.

After logging "Failed to initialize accelerated iGPU/dGPU framebuffer sharing", mutter tries to export a dma-buf from the i915 BO, import it into the AST device, create an KMS FB for the imported BO and assign the FB to the primary plane of a CRTC. If this path works (which seems to be the case in this scenario, or you wouldn't see BOs shared between i915 & AST), mutter doesn't do any copies between different BOs. It's between the AST & i915 drivers to correctly handle access to the shared BO.

Does the AST driver wait for the i915 GPU to finish drawing to the shared BO, by waiting for the exclusive fence of the dma-buf synchronization object, before reading from the BO?


P.S. If the path described above didn't work, mutter would fall back to reading the i915 BO contents with glReadPixels and copying them to a dumb BO allocated from the AST device, so you wouldn't see BOs shared between the drivers. With current mutter, you can force this fallback with the environment variable MUTTER_DEBUG_MULTI_GPU_FORCE_COPY_MODE=primary-gpu-cpu . Does that avoid the issue?


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
