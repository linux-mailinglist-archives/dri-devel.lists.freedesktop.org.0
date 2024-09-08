Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0E59707A5
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 14:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A139110E1BA;
	Sun,  8 Sep 2024 12:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HZtBrN4Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEB810E274;
 Sun,  8 Sep 2024 12:59:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 18D9D5C4186;
 Sun,  8 Sep 2024 12:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9AEEC4CEC3;
 Sun,  8 Sep 2024 12:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1725800391;
 bh=YhbRXnQ7EvIla3z4/eYbiKI7JBI6Gs+gMj9L+GFh4sg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HZtBrN4ZrhaOMUqXBEWM6rYfy6dMhWXi5azbVVRiVwlh1Zbw43h9BiJOw72ZRrakL
 772lKjiq+5QmvD52Xb/VaXt8yg07ykkGHgUXT0sSy1AcCntIIgRUHZVgMucm8CcYL8
 Gqby4C6UQTM9gKycY8/qiwJumLsxImwofGL5+RCk=
Date: Sun, 8 Sep 2024 14:59:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Mukul Sikka <mukul.sikka@broadcom.com>, stable@vger.kernel.org,
 evan.quan@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 Jun.Ma2@amd.com, kevinyang.wang@amd.com, sashal@kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ajay.kaher@broadcom.com,
 alexey.makhalov@broadcom.com, vasavi.sirnapalli@broadcom.com,
 Bob Zhou <bob.zhou@amd.com>, Tim Huang <Tim.Huang@amd.com>
Subject: Re: [PATCH v5.15-v5.10] drm/amd/pm: Fix the null pointer dereference
 for vega10_hwmgr
Message-ID: <2024090829-mutt-remold-6d2c@gregkh>
References: <20240903045809.5025-1-mukul.sikka@broadcom.com>
 <CADnq5_OVSD1DXgi_9f_H-uT7KSjMwz-FfhP=vRQvposSxv=BMw@mail.gmail.com>
 <CAG99D9Jss=h5aVLDq0tkDjfZgGUbrNV1gqwcw631RbwCiPVqNg@mail.gmail.com>
 <CADnq5_NWX7u=S+jrC8YA6fJxN7GXpSN+kqsQieqphdOz2HT6EA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_NWX7u=S+jrC8YA6fJxN7GXpSN+kqsQieqphdOz2HT6EA@mail.gmail.com>
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

On Fri, Sep 06, 2024 at 11:02:32AM -0400, Alex Deucher wrote:
> On Fri, Sep 6, 2024 at 4:50 AM Mukul Sikka <mukul.sikka@broadcom.com> wrote:
> >
> > On Fri, Sep 6, 2024 at 12:05 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> > >
> > > On Tue, Sep 3, 2024 at 5:53 AM sikkamukul <mukul.sikka@broadcom.com> wrote:
> > > >
> > > > From: Bob Zhou <bob.zhou@amd.com>
> > > >
> > > > [ Upstream commit 50151b7f1c79a09117837eb95b76c2de76841dab ]
> > > >
> > > > Check return value and conduct null pointer handling to avoid null pointer dereference.
> > > >
> > > > Signed-off-by: Bob Zhou <bob.zhou@amd.com>
> > > > Reviewed-by: Tim Huang <Tim.Huang@amd.com>
> > > > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > > > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > > > Signed-off-by: Mukul Sikka <mukul.sikka@broadcom.com>
> > >
> > > Just out of curiosity, are you actually seeing an issue?  This and a
> > > lot of the other recent NULL check patches are just static checker
> > > fixes.  They don't actually fix a known issue.
> > >
> > No, according to the description of this patch and CVE-2024-43905.
> > It seems to be applicable to LTS.
> 
> I don't know that this is really CVE material, but oh well.  I'm not
> sure if it's actually possible to hit this in practice.

If it's not possible, there's no need to add the check.

thanks,

greg k-h
