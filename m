Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C001138FE8
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 12:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A95E89BC0;
	Mon, 13 Jan 2020 11:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F0589BC0;
 Mon, 13 Jan 2020 11:18:04 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19860154-1500050 for multiple; Mon, 13 Jan 2020 11:17:55 +0000
MIME-Version: 1.0
To: Wambui Karuga <wambui.karugax@gmail.com>, airlied@linux.ie, daniel@ffwll.ch,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200113111025.2048-1-wambui.karugax@gmail.com>
References: <20200113111025.2048-1-wambui.karugax@gmail.com>
Message-ID: <157891427231.27314.12398974277241668021@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/i915: convert to new logging macros based on struct
 intel_engine_cs.
Date: Mon, 13 Jan 2020 11:17:52 +0000
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Wambui Karuga (2020-01-13 11:10:25)
> fn(...) {
> ...
> struct intel_engine_cs *E = ...;
> +struct drm_i915_private *dev_priv = E->i915;

No new dev_priv.

There should be no reason for drm_dbg here, as the rest of the debug is
behind ENGINE_TRACE and so the vestigial debug should be moved over, or
deleted as not being useful.

The error messages look unhelpful.

>                 if ((batch_end - cmd) < length) {
> -                       DRM_DEBUG("CMD: Command length exceeds batch length: 0x%08X length=%u batchlen=%td\n",
> -                                 *cmd,
> -                                 length,
> -                                 batch_end - cmd);
> +                       drm_dbg(&dev_priv->drm,
> +                               "CMD: Command length exceeds batch length: 0x%08X length=%u batchlen=%td\n",

No. This is not driver debug. If anything this should be pr_debug, or
some over user centric channel.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
