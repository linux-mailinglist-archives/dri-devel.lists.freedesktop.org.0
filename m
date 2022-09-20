Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 967F75BE90C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 16:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310D810E20F;
	Tue, 20 Sep 2022 14:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B591110E6E0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 14:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663684291; x=1695220291;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bY5RtMAG7f0wFT5lINECIu5FOz12IAUzKssIl25greg=;
 b=irilmlN8VTauiXxrI8vvDeDWH5iDHUOwwk2Ioazcaf8v6S21M7ibsBde
 MfJUyJ2RX/A1uh7teZtFdaJQkGsho8FGZAxQNHSACfUwuqtywav9G4rZ+
 i+aSM4WrKsiLyYkBlW+nVePbMLbHCYjl1YL7T/mc9zMW/tDXCSpRd9s2u
 8tS8xLreLlVqnar70wHpeE1rRhNxCQaE97HJfM3/TXglHMxaRAZ6A7/Px
 0ZPTP+L4JFfCD2JaCQu6Nk/qrZs8Oo9/6vpQWG1E2qF2mdYrdHclckxZi
 D7ZpZp5HhwSL1Jo2OxL4ZSeA65dmQ8f8vF3t/nOzRa2nQZp1xzdx79n9p w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="280089233"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="280089233"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 07:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="681332296"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga008.fm.intel.com with SMTP; 20 Sep 2022 07:31:27 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 20 Sep 2022 17:31:26 +0300
Date: Tue, 20 Sep 2022 17:31:26 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/5] drm/damage-helper: Do partial updates if framebuffer
 has not been changed
Message-ID: <YynOvpMGbVKWiO8p@intel.com>
References: <20220920135619.9209-1-tzimmermann@suse.de>
 <20220920135619.9209-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220920135619.9209-5-tzimmermann@suse.de>
X-Patchwork-Hint: comment
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
Cc: airlied@linux.ie, drawat.floss@gmail.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 20, 2022 at 03:56:18PM +0200, Thomas Zimmermann wrote:
> Set partial updates on a plane if the framebuffer has not been changed
> on an atomic commit. If such a plane has damage clips, the driver will
> use them; otherwise the update is effectively empty. Planes that change
> their framebuffer still perform a full update.

I have a feeling you're sort of papering over some inefficient
userspace that's asking updates on planes that don't actually
need them. I'm not sure adding more code for that is a particularly
great idea. Wouldn't it be better to just fix the userspace code?

Any property change on the plane could need a full plane
update as well (eg. some color mangement stuff etc.). So you'd
have to keep adding exceptions to that list whenever new
properties are added.

And I think the semantics of the ioctl(s) has so far been that
basically any page flip (whether or not it actually changes
the fb) still ends up doing whatever flushing is needed to
guarantee the fb contents are up to date on the screen (if
someone sneaked in some front buffer rendering in between).
Ie. you could even use basically a nop page flip in place 
of dirtyfb.

Another thing the ioctls have always done is actually perform
the commit whether anything changed or nor. That is, they
still do all the same the same vblanky stuff and the commit
takes the same amount of time. Not sure if your idea is
to potentially short circuit the entire thing and make it 
take no time at all?

-- 
Ville Syrjälä
Intel
