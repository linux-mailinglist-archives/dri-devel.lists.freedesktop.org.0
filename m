Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC34A11BC81
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 20:08:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24966EBBA;
	Wed, 11 Dec 2019 19:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E03C6EBBA
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 19:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576091327;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=IrfDRBh73rWP1u73zjEpNrmuVZ5BrGbHJSfvTnckB2I=;
 b=YAvJ95+1p5CHzKrKboSaWrACBBj/bSmWlIoMr9M1xuCdajs1cnhGJWT+Wwwdof4lR1
 ehs1GlqFEUJN5gAXg0MyBmbaAxgfscyQnfH34dKMPv/FcK3mqR9go5qJURA77afMfqMk
 xxzFZEVtSG4JBmBP85CBfr3lxrb4g10OKNs6Seup2HI8bIvOhDmIVMoTU7JIBxEjmtTD
 k0qxeU3VB2CY29QfDiIiG1NWhFS+do83ZSAiE/l5tJXbstgbAP646eIRx/po5X5zXAbj
 OCpQmYtBENThg3hznB1sd65HWMKhpOVkob2RQXF57nBRBXQSPtC2E5gYgMAZPTrSpURf
 AMkQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u266EZF6ORJGV8vHxv6O"
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.0.2 AUTH)
 with ESMTPSA id R01a59vBBJ8kolB
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 11 Dec 2019 20:08:46 +0100 (CET)
Date: Wed, 11 Dec 2019 20:08:39 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] drm/modes: Support video parameters with only reflect
 option
Message-ID: <20191211190839.GA52803@gerhold.net>
References: <20191209183254.211428-1-stephan@gerhold.net>
 <20191210102046.fu5s4hzwcdfnv5zz@gilmour.lan>
 <20191210104237.GA228968@gerhold.net>
 <20191211181046.xhlzc74m75lb525c@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211181046.xhlzc74m75lb525c@gilmour.lan>
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

On Wed, Dec 11, 2019 at 07:10:46PM +0100, Maxime Ripard wrote:
> Hi Stephan,
> 
> On Tue, Dec 10, 2019 at 11:42:37AM +0100, Stephan Gerhold wrote:
> > On Tue, Dec 10, 2019 at 11:20:46AM +0100, Maxime Ripard wrote:
> > > Hi,
> > >
> > > On Mon, Dec 09, 2019 at 07:32:54PM +0100, Stephan Gerhold wrote:
> > > > At the moment, video mode parameters like video=540x960,reflect_x,
> > > > (without rotation set) are silently ignored.
> > > >
> > > > One of the reasons for this is that the calculation that
> > > > combines the panel_orientation with cmdline->rotation_reflection
> > > > does not handle the case when cmdline->rotation_reflection does
> > > > not have any rotation set.
> > > > (i.e. cmdline->rotation_reflection & DRM_MODE_ROTATE_MASK == 0)
> > > >
> > > > Example:
> > > >   *rotation = DRM_MODE_ROTATE_0 (no panel_orientation)
> > > >   cmdline->rotation_reflection = DRM_MODE_REFLECT_X (video=MODE,reflect_x)
> > > >
> > > > The current code does:
> > > >   panel_rot = ilog2(*rotation & DRM_MODE_ROTATE_MASK);
> > > >   cmdline_rot = ilog2(cmdline->rotation_reflection & DRM_MODE_ROTATE_MASK);
> > > >   sum_rot = (panel_rot + cmdline_rot) % 4;
> > > >
> > > > and therefore:
> > > >   panel_rot = ilog2(DRM_MODE_ROTATE_0) = ilog2(1) = 0
> > > >   cmdline_rot = ilog2(0) = -1
> > > >   sum_rot = (0 + -1) % 4 = -1 % 4 = 3
> > > >    ...
> > > >   *rotation = DRM_MODE_ROTATE_270 | DRM_MODE_REFLECT_X
> > > >
> > > > So we incorrectly generate DRM_MODE_ROTATE_270 in this case.
> > > > To prevent cmdline_rot from becoming -1, we need to treat
> > > > the rotation as DRM_MODE_ROTATE_0.
> > > >
> > > > On the other hand, there is no need to go through that calculation
> > > > at all if no rotation is set in rotation_reflection.
> > > > A simple XOR is enough to combine the reflections.
> > > >
> > > > Finally, also allow DRM_MODE_ROTATE_0 in the if statement below.
> > > > DRM_MODE_ROTATE_0 means "no rotation" and should therefore not
> > > > require any special handling (e.g. specific tiling format).
> > > >
> > > > This makes video parameters with only reflect option work correctly.
> > > >
> > > > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > >
> > > Thanks for that commit message.
> > >
> > > Can you also add a selftest to make sure we don't get a regression in
> > > the future?
> >
> > Can you explain how/where I would add a test for drm_client_rotation()
> > in drm_client_modeset.c? I'm not familiar with selftests to be honest.
> >
> > I found test-drm_cmdline_parser.c but that seems to cover only the
> > cmdline parsing (which is working correctly already).
> 
> The cmdline here is the kernel command line. You were mentionning in
> your commit log that video=540x960,reflect_x was broken?
> 

The parameter is parsed correctly and placed into connector->cmdline_mode.
Therefore, not the *parsing* is broken, only the way we try to apply
and merge them with the panel orientation in drm_client_modeset.c.

There are existing test cases for the parsing of parameters similar to
video=540x960,reflect_x, see drm_cmdline_test_hmirror()
in the aforementioned test file.

Maybe my commit message was not as clear as I hoped :)

Thanks,
Stephan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
