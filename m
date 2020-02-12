Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 795B415ABF8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 16:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7396F523;
	Wed, 12 Feb 2020 15:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CAA6F523
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 15:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581521394;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=VFa8/gRmawqxfkmkYUELWQzzhnjm/S3+v1DqweCVP6w=;
 b=AN3fQfvY4OnWojZsnKvfKJpKv4VaaGx656IY8SYHNPPKs673XT9K/vIQe3rIdkyPL5
 o3U56X3DKz6FiYB7LcRK0+TpYqCEoYK/dJnL5G2K98Fb0rgizTTQZf14H+le05jTaGd0
 NMew/wJIpnoPKc3BVHzVpofGX9IPIrrBgvTo9b0wKFxawQ8wdHCksvCb15uVlDpP+xf9
 rob2YRdFV2mpEhuVnzguowVLfpBLDrWZsInyeUOpewG2F0y7jnHkJjdvi9XF14Vr5RK5
 eZNBgaebD1Q3kIZy0qI8qlbG3h+L/R+5DmQm1pYFFPdGDp06UAOX21EMRScdbYVaoDPz
 x0UQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u266EZF6ORJBBWA4Dje7"
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.1.12 AUTH)
 with ESMTPSA id a01fe9w1CFTsDZ4
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 12 Feb 2020 16:29:54 +0100 (CET)
Date: Wed, 12 Feb 2020 16:29:48 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v3 0/2] drm/modes: Apply video parameters with only
 reflect option
Message-ID: <20200212152948.GA17735@gerhold.net>
References: <20200117153429.54700-1-stephan@gerhold.net>
 <20200117185100.dukz3e7np3z3df7k@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200117185100.dukz3e7np3z3df7k@gilmour.lan>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Fri, Jan 17, 2020 at 07:51:00PM +0100, Maxime Ripard wrote:
> On Fri, Jan 17, 2020 at 04:34:27PM +0100, Stephan Gerhold wrote:
> > At the moment, video mode parameters like video=540x960,reflect_x,
> > (without rotation set) are not taken into account when applying the
> > mode in drm_client_modeset.c.
> >
> > One of the reasons for this is that the calculation that
> > combines the panel_orientation with cmdline->rotation_reflection
> > does not handle the case when cmdline->rotation_reflection does
> > not have any rotation set.
> > (i.e. cmdline->rotation_reflection & DRM_MODE_ROTATE_MASK == 0)
> >
> > However, we really should not generate such a value in the first place.
> > Rotation values should have exactly one rotation angle set
> > (DRM_MODE_ROTATE_0 for "no rotation").
> >
> > This patch set changes the command line parser to make sure that we generate
> > only valid rotation values (defaulting to DRM_MODE_ROTATE_0).
> >
> > Finally it allows DRM_MODE_ROTATE_0 when applying the rotation from
> > the video mode parameters to make parameters without rotation work correctly.
> 
> For both,
> Acked-by: Maxime Ripard <mripard@kernel.org>

Can you apply these two patches for me?
This is my second contribution to the DRM subsystem, so I don't have
commit access to drm-misc yet.

Thanks,
Stephan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
