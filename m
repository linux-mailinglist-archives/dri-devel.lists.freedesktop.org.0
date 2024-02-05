Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD52C849D0A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 15:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F10410F115;
	Mon,  5 Feb 2024 14:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="smMvYEz3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08F510F115;
 Mon,  5 Feb 2024 14:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aUM+hQgik4d0GPIw/Az0027uuDMg4FPZg3NR915xjXA=; b=smMvYEz3VWLizrCOLdWV7T9BmR
 CTG4iQLiCmZFYH23rijUZ6Ld7SInCEJ3o+8cLACZovYtQLQ3p6/RBiUuoZr7oYlZQswDNp7pLKRiF
 IAmsPX+3VUliDuEm1hudQg+/bpazGrsCwNFjadV1vAcjVoM+LOd4GL+a18qiekECklHNr1GK21Y0D
 JnJw5//U0RipYMY5KId8nHjPvLawS4uwYvDpGmFFUZdoB3WZ6EnHbbz9nYC8MnQD6XOzDQaV0fVT/
 IgC1d4ceEUdABEmcX+E1ZvSr4+IhztPAcB61+yApvgB6qjYx2OHW6JqbYVNOsRNibL2sk4lzjgAYf
 58fum40A==;
Received: from [186.193.11.42] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rWzxB-00E1Oo-RU; Mon, 05 Feb 2024 15:28:10 +0100
Date: Mon, 5 Feb 2024 11:27:01 -0300
From: Melissa Wen <mwen@igalia.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, airlied@gmail.com, 
 alexander.deucher@amd.com, alex.hung@amd.com, christian.koenig@amd.com,
 daniel@ffwll.ch, 
 harry.wentland@amd.com, Rodrigo.Siqueira@amd.com, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, 
 kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: Re: [RFC PATCH 0/2] drm/amd/display: switch amdgpu_dm_connector to
Message-ID: <tjojqwfxcc4pg22wy24xpurdi54he7or7z6osoq7aztzs6emej@bat7jq7mdm5e>
References: <20240126163429.56714-1-mwen@igalia.com>
 <5fdad82b-3f14-4bb4-9f49-b8397419204d@amd.com>
 <87o7d4jxlz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o7d4jxlz.fsf@intel.com>
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

On 01/29, Jani Nikula wrote:
> On Fri, 26 Jan 2024, Mario Limonciello <mario.limonciello@amd.com> wrote:
> > On 1/26/2024 10:28, Melissa Wen wrote:
> >> Hi,
> >> 
> >> I'm debugging a null-pointer dereference when running
> >> igt@kms_connector_force_edid and the way I found to solve the bug is to
> >> stop using raw edid handler in amdgpu_connector_funcs_force and
> >> create_eml_sink in favor of managing resouces via sruct drm_edid helpers
> >> (Patch 1). The proper solution seems to be switch amdgpu_dm_connector
> >> from struct edid to struct drm_edid and avoid the usage of different
> >> approaches in the driver (Patch 2). However, doing it implies a good
> >> amount of work and validation, therefore I decided to send this RFC
> >> first to collect opinions and check if there is any parallel work on
> >> this side. It's a working in progress.
> >> 
> >> The null-pointer error trigger by the igt@kms_connector_force_edid test
> >> was introduced by:
> >> - e54ed41620f ("drm/amd/display: Remove unwanted drm edid references")
> >> 
> >> You can check the error trace in the first patch.
> >> 
> >> This series was tested with kms_hdmi_inject and kms_force_connector. No
> >> null-pointer error, kms_hdmi_inject is successul and kms_force_connector
> >> is sucessful after the second execution - the force-edid subtest
> >> still fails in the first run (I'm still investigating).
> >> 
> >> There is also a couple of cast warnings to be addressed - I'm looking
> >> for the best replacement.
> >> 
> >> I appreciate any feedback and testing.
> >
> > So I'm actually a little bit worried by hardcoding EDID_LENGTH in this 
> > series.
> >
> > I have some other patches that I'm posting later on that let you get the 
> > EDID from _DDC BIOS method too.  My observation was that the EDID can be 
> > anywhere up to 512 bytes according to the ACPI spec.
> >
> > An earlier version of my patch was using EDID_LENGTH when fetching it 
> > and the EDID checksum failed.
> >
> > I'll CC you on the post, we probably want to get your changes and mine 
> > merged together.
> 
> One of the main points of struct drm_edid is that it tracks the
> allocation size separately.
> 
> We should simply not trust edid->extensions, because most of the time it
> originates from outside the kernel.
> 
> Using drm_edid and immediately drm_edid_raw() falls short. That function
> should only be used during migration to help. And yeah, it also means
> EDID parsing should be done in drm_edid.c, and not spread out all over
> the subsystem.

Hi Mario and Jani,

Thanks for the feedback.

I agree with you. I used the drm_edid_raw() as an intermediate step to
assess/validate this migration, but I'll work on removing this hack.

So, I understand that the transition from edid to drm_edid is the right
path, so I'll improve this work (keeping the points you raised in mind)
and send a version.

BR,

Melissa
> 
> 
> BR,
> Jani.
> 
> 
> >
> >> 
> >> Melissa
> >> 
> >> Melissa Wen (2):
> >>    drm/amd/display: fix null-pointer dereference on edid reading
> >>    drm/amd/display: switch amdgpu_dm_connector to use struct drm_edid
> >> 
> >>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 78 ++++++++++---------
> >>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  4 +-
> >>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  9 ++-
> >>   .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 23 +++---
> >>   4 files changed, 60 insertions(+), 54 deletions(-)
> >> 
> >
> 
> -- 
> Jani Nikula, Intel
