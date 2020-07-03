Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F67213922
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 13:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06986EB59;
	Fri,  3 Jul 2020 11:11:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50E36EB59
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 11:11:12 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 13F9780635;
 Fri,  3 Jul 2020 13:11:09 +0200 (CEST)
Date: Fri, 3 Jul 2020 13:11:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 12/14] drm/ast: Replace struct ast_crtc with struct
 drm_crtc
Message-ID: <20200703111108.GA3928@ravnborg.org>
References: <20200702115029.5281-1-tzimmermann@suse.de>
 <20200702115029.5281-13-tzimmermann@suse.de>
 <20200703063848.GA1690637@ravnborg.org>
 <59bd0ea8-ab95-5e37-287c-021c33e6556d@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <59bd0ea8-ab95-5e37-287c-021c33e6556d@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=kEpzv6bw_eon_2oUgLIA:9 a=CjuIK1q_8ugA:10
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
Cc: airlied@redhat.com, emil.l.velikov@gmail.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

On Fri, Jul 03, 2020 at 08:51:31AM +0200, Thomas Zimmermann wrote:
> Hi Sam
> 
> Am 03.07.20 um 08:38 schrieb Sam Ravnborg:
> > Hi Thomas.
> > 
> > Just browsing code..
> > 
> > On Thu, Jul 02, 2020 at 01:50:27PM +0200, Thomas Zimmermann wrote:
> >> Struct ast_crtc has been cleaned up and it's now a wrapper around the
> >> DRM CRTC structure struct drm_crtc. This patch converts the driver to
> >> struct drm_crtc and removes struct ast_crtc.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > 
> > Why is it we cannot embed struct drm_crtc?
> 
> I want to do that in a later patchset. The conversion to managed code is
> fairly large, so thought it might be better to do it in several rounds.

Understood, and several rounds are good.

> 
> This patchset is only for modesetting. I have another patchset that
> converts the memory management to managed interfaces. After that the
> final patchset will address device structures. Embedding everything CRTC
> and other structures in struct ast_private would be part of this.
> 
> If you prefer a longer patchset that does everything, let me know.
> 
> > And I also failed to see where is is de-allocated - but surely I miss
> > something obvious here.
> 
> It's freed in ast_crtc_destroy().

Ohh, one of the places that worked/works because struct crtc was/is the
first member.

I get it now, thanks for the explanation.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
