Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 073BE1F7442
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 09:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11ED76E2F2;
	Fri, 12 Jun 2020 07:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A5E6E2F2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 07:01:43 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 04E4680587;
 Fri, 12 Jun 2020 09:01:38 +0200 (CEST)
Date: Fri, 12 Jun 2020 09:01:37 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/3] drm/ast: Use per-device logging macros
Message-ID: <20200612070137.GA172811@ravnborg.org>
References: <20200611082809.7838-1-tzimmermann@suse.de>
 <20200611082809.7838-4-tzimmermann@suse.de>
 <20200611192406.GB160102@ravnborg.org>
 <59164816-57b4-0279-56e9-a49a333ce839@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <59164816-57b4-0279-56e9-a49a333ce839@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=G88y7es5 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=ZWOSB2g9pmbKBe_4jyEA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: airlied@redhat.com, chen@aspeedtech.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas

On Fri, Jun 12, 2020 at 08:28:40AM +0200, Thomas Zimmermann wrote:
> Hi Sam
> 
> Am 11.06.20 um 21:24 schrieb Sam Ravnborg:
> > Hi Thomas.
> > On Thu, Jun 11, 2020 at 10:28:09AM +0200, Thomas Zimmermann wrote:
> >> Converts the ast driver to drm_info() and drm_err(). No functional
> >> changes are made.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > 
> > I hope you will later follow-up with a patch that introduces drm_WARN_*.
> 
> I only found DRM_INFO and DRM_ERROR calls. Did I miss any other warning
> macros?

The following:
ast_mode.c:     if (WARN_ON_ONCE(gpu_addr < 0))
ast_mode.c:     if (WARN_ON_ONCE(fb->width > AST_MAX_HWC_WIDTH) ||
ast_mode.c:         WARN_ON_ONCE(fb->height > AST_MAX_HWC_HEIGHT))
ast_mode.c:             if (WARN_ON_ONCE(off < 0))
ast_mode.c:     if (WARN_ON(!crtc->state))

can benefit from:

/*
 * struct drm_device based WARNs
 *
 * drm_WARN*() acts like WARN*(), but with the key difference of
 * using device specific information so that we know from which device
 * warning is originating from.
 *
 * Prefer drm_device based drm_WARN* over regular WARN*
 */

...

#define drm_WARN_ON(drm, x)                                             \
        drm_WARN((drm), (x), "%s",                                      \
                 "drm_WARN_ON(" __stringify(x) ")")

#define drm_WARN_ON_ONCE(drm, x)                                        \
        drm_WARN_ONCE((drm), (x), "%s",                                 \
                      "drm_WARN_ON_ONCE(" __stringify(x) ")")


Also from drm/drm_print.h

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
