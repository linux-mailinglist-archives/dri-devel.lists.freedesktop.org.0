Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B1F42C7BE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 19:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29CE6EA5F;
	Wed, 13 Oct 2021 17:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF03E6EA7B;
 Wed, 13 Oct 2021 17:35:51 +0000 (UTC)
Date: Wed, 13 Oct 2021 19:35:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1634146549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wQMLAq54XtPtiUmi3cuCL2sgXoin4T6JNV4B+n7cIbk=;
 b=LAhmieBm2yE9l0Rf4YWCbCuUDgMTcgFjMnqLPTf0UoDXrSla1JdozG2L13ndkLggbtid/x
 vo4L0/uWQ2s63qhCTvgVaNK5RcXPrNkpL8U1vMG2bz/6bINa62Vb3qEIQg83As7HeNCFau
 akzmAdXNZNNgY9FVf9eYCCpbJ0wA1ZRTtSiGc9qQfEiJ7AEPWerT+IzU/zzXNs7ewp9UG+
 9oi81dWXp53ZNGtI+q+KJwwbms1gRRgZnuKLB2h6tI5bouFEUGUw0NIYQZDxTSHtEoi1O9
 z9mu5V6f5kizeZUkcM9hw27o6Mroz3wqZ4rjSTVesDIKbChIIIAj+oiGhTn8nQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1634146549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wQMLAq54XtPtiUmi3cuCL2sgXoin4T6JNV4B+n7cIbk=;
 b=cKFQBr4SmGhT9xlL4dJ26JYtmbU4D56qYWVQesU7gqxEcGmRXhqoa0S0GX9mnplHv+M2BU
 RnFNpoPjs2LL2yBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC PATCH] drm: Increase DRM_OBJECT_MAX_PROPERTY by 18.
Message-ID: <20211013173548.nldcwheo4t52dgvp@linutronix.de>
References: <20211005065151.828922-1-bigeasy@linutronix.de>
 <YWbK8wSxNjVu9OLm@phenom.ffwll.local>
 <20211013123525.5nijgyx5ivnuujes@linutronix.de>
 <YWbXvvTzMF1EZ5c7@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YWbXvvTzMF1EZ5c7@phenom.ffwll.local>
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

On 2021-10-13 14:57:34 [+0200], Daniel Vetter wrote:
> Hm there's a pile of commits there, and nothing immediately jumps to
> light. The thing is, 18 is likely way too much, since if e.g. we have a
> single new property on a plane and that pushes over the limit on all of
> them, you get iirc 3x4 already simply because we have that many planes.
> 
> So would be good to know the actual culprit.
> 
> Can you pls try to bisect the above range, applying the patch as a fixup
> locally (without commit, that will confuse git bisect a bit I think), so
> we know what/where went wrong?

c7fcbf2513973 -> does not boot
c7fcbf2513973 + 2f425cf5242a0 -> boots, 18 x DRM_OBJECT_MAX_PROPERTY
6f11f37459d8f -> boots, 0 x DRM_OBJECT_MAX_PROPERTY
6f11f37459d8f + 2f425cf5242a0 -> boots, 18 x DRM_OBJECT_MAX_PROPERTY

> I'm still confused why this isn't showing up anywhere in our intel ci ...
> 
> Thanks, Daniel

Sebastian
