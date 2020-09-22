Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4434274452
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 16:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E93B8982D;
	Tue, 22 Sep 2020 14:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4792789260;
 Tue, 22 Sep 2020 14:25:34 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D3F7E2073A;
 Tue, 22 Sep 2020 14:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600784734;
 bh=wQx7HRd1PEMCjgO+IIjRBfqRQ/i8QsVPVrEKxApVDCY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0GDOmErSh9Jgj+/3Vk7j0+x7Lp2zRADZFYttC95BZnGyB6R44l7r1m8K6t4ne0KDO
 yjFVo7r7PwQN6hAXU6UmFCvrE4zaFqoPhnEA/Vry7VSuntc+4Ck8BYziSEF++uxYdU
 ihnCKZgD8HyAyy8/c4aY1Fo2XZCXTbXhr7S4cf+o=
Date: Tue, 22 Sep 2020 10:25:32 -0400
From: Sasha Levin <sashal@kernel.org>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH AUTOSEL 5.4 13/15] drm/amdgpu/dc: Require primary plane
 to be enabled whenever the CRTC is
Message-ID: <20200922142532.GO2431@sasha-vm>
References: <20200921144054.2135602-1-sashal@kernel.org>
 <20200921144054.2135602-13-sashal@kernel.org>
 <1ee666b4-f1af-a19f-e03a-fdfc00698d2f@daenzer.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1ee666b4-f1af-a19f-e03a-fdfc00698d2f@daenzer.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, stable@vger.kernel.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 21, 2020 at 04:48:05PM +0200, Michel D=E4nzer wrote:
>On 2020-09-21 4:40 p.m., Sasha Levin wrote:
>>From: Michel D=E4nzer <mdaenzer@redhat.com>
>>
>>[ Upstream commit 2f228aab21bbc74e90e267a721215ec8be51daf7 ]
>>
>>Don't check drm_crtc_state::active for this either, per its
>>documentation in include/drm/drm_crtc.h:
>>
>>  * Hence drivers must not consult @active in their various
>>  * &drm_mode_config_funcs.atomic_check callback to reject an atomic
>>  * commit.
>>
>>atomic_remove_fb disables the CRTC as needed for disabling the primary
>>plane.
>>
>>This prevents at least the following problems if the primary plane gets
>>disabled (e.g. due to destroying the FB assigned to the primary plane,
>>as happens e.g. with mutter in Wayland mode):
>>
>>* The legacy cursor ioctl returned EINVAL for a non-0 cursor FB ID
>>   (which enables the cursor plane).
>>* If the cursor plane was enabled, changing the legacy DPMS property
>>   value from off to on returned EINVAL.
>>
>>v2:
>>* Minor changes to code comment and commit log, per review feedback.
>>
>>GitLab: https://gitlab.gnome.org/GNOME/mutter/-/issues/1108
>>GitLab: https://gitlab.gnome.org/GNOME/mutter/-/issues/1165
>>GitLab: https://gitlab.gnome.org/GNOME/mutter/-/issues/1344
>>Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
>>Signed-off-by: Michel D=E4nzer <mdaenzer@redhat.com>
>>Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>I'm a bit nervous about this getting backported so far back so =

>quickly. I'd prefer waiting for 5.9 final first at least.

Will drop it for now, thanks.

-- =

Thanks,
Sasha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
