Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDAA86C657
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 11:05:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E809610E19E;
	Thu, 29 Feb 2024 10:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ViWpHkNz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BF110E3EA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 10:05:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi
 [89.27.53.110])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1517D2E7;
 Thu, 29 Feb 2024 11:04:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1709201090;
 bh=3lGwHxI8UnE8JqcWEhpZmZgiy3H+Qv7T/7shG1gtysA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ViWpHkNz18IU7gDdLPt4zKYPqt2i2i0z6PKTAE5PRvqDrWqFkGYWvgXCXYl0a9hFz
 g2+YeoFWRkF21qCjEbAulYDEGfHU2kOiY9fWxx6Ue6nFn4CMHmRvu0FYl84NfI4ghP
 YcCcGm8xarEITCnMTBean4AbPUWFEEnyZA/t7hLs=
Date: Thu, 29 Feb 2024 12:05:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Nikolai Kondrashov <spbnick@gmail.com>,
 Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org,
 dave.pigott@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 gustavo.padovan@collabora.com, pawiecz@collabora.com,
 tales.aparecida@gmail.com, workflows@vger.kernel.org,
 kernelci@lists.linux.dev, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com,
 davidgow@google.com, cocci@inria.fr, Julia.Lawall@inria.fr,
 laura.nao@collabora.com, ricardo.canuelo@collabora.com,
 kernel@collabora.com, torvalds@linuxfoundation.org,
 gregkh@linuxfoundation.org
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
Message-ID: <20240229100505.GB30889@pendragon.ideasonboard.com>
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
 <20240229-quizzical-persimmon-honeybee-b5db48@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240229-quizzical-persimmon-honeybee-b5db48@houat>
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

On Thu, Feb 29, 2024 at 10:56:58AM +0100, Maxime Ripard wrote:
> Hi!
> 
> On Thu, Feb 29, 2024 at 11:23:22AM +0200, Nikolai Kondrashov wrote:
> > Hi everyone,
> > 
> > On 2/29/24 11:02, Maxime Ripard wrote:
> > > On Wed, Feb 28, 2024 at 07:55:25PM -0300, Helen Koike wrote:
> > > > Which rating would you select?
> > > 
> > > 4.5 :)
> > > 
> > > One thing I'm wondering here is how we're going to cope with the
> > > different requirements each user / framework has.
> > > 
> > > Like, Linus probably want to have a different set of CI before merging a
> > > PR than (say) linux-next does, or stable, or before doing an actual
> > > release.
> > > 
> > > Similarly, DRM probably has a different set of requirements than
> > > drm-misc, drm-amd or nouveau.
> > > 
> > > I don't see how the current architecture could accomodate for that. I
> > > know that Gitlab allows to store issues template in a separate repo,
> > > maybe we could ask them to provide a feature where the actions would be
> > > separate from the main repo? That way, any gitlab project could provide
> > > its own set of tests, without conflicting with each others (and we could
> > > still share them if we wanted to)
> > > 
> > > I know some of use had good relationship with Gitlab, so maybe it would
> > > be worth asking?
> > 
> > GitLab already supports getting the CI YAML from other repos. You can change
> > that in the repo settings.
> 
> I'm interested but couldn't find it in the doc, do you have a link to
> the right section?

e.g. https://gitlab.freedesktop.org/camera/libcamera/-/settings/ci_cd

Expand "General pipelines", the setting is "CI/CD configuration file".
You can specify the path to a file in the local repository, or in a
separate repository. See
https://gitlab.freedesktop.org/help/ci/pipelines/settings#specify-a-custom-cicd-configuration-file
for the syntax.

> > However, I think a better approach would be *not* to add the .gitlab-ci.yaml
> > file in the root of the source tree, but instead change the very same repo
> > setting to point to a particular entry YAML, *inside* the repo (somewhere
> > under "ci" directory) instead.
> > 
> > This way all the different subtrees can have completely different setup, but
> > some could still use Helen's work and employ the "scenarios" she
> > implemented.
> 
> I'm worried that this kind of setup will just create duplicated YAML
> that will be developped in complete silos and will become difficult to
> maintain. But that's definitely an opinion :)

-- 
Regards,

Laurent Pinchart
