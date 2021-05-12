Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A4037BDA1
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 15:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6937B6EBA6;
	Wed, 12 May 2021 13:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183156E7DD;
 Wed, 12 May 2021 13:04:27 +0000 (UTC)
IronPort-SDR: qzNtoflJBNW1rafs4a/LKlS7JdisJO87s+WrvW+mVa3WB4U47SHK8zchU+FkyAsymHanzuT9eL
 Jy/Ec+XggjQA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="220671227"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="220671227"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 06:04:22 -0700
IronPort-SDR: yzHorLl++4fONoDHCVE04kfL0m1bnBhWfH1+n9s95Kzwol6g0v6bV8EJu3IcbrSiAwudmNuEAr
 JHG4RPUMWkGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="435193414"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 12 May 2021 06:04:17 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 12 May 2021 16:04:16 +0300
Date: Wed, 12 May 2021 16:04:16 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: New uAPI for color management proposal and feedback request
Message-ID: <YJvSUCCPvWz7y/r7@intel.com>
References: <8c0d7ad8-7ade-bf8a-0414-cc795fbb6aa2@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c0d7ad8-7ade-bf8a-0414-cc795fbb6aa2@tuxedocomputers.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 12, 2021 at 02:06:56PM +0200, Werner Sembach wrote:
> Hello,
> 
> In addition to the existing "max bpc", and "Broadcast RGB/output_csc" drm properties I propose 4 new properties:
> "preferred pixel encoding", "active color depth", "active color range", and "active pixel encoding"
> 
> 
> Motivation:
> 
> Current monitors have a variety pixel encodings available: RGB, YCbCr 4:4:4, YCbCr 4:2:2, YCbCr 4:2:0.
> 
> In addition they might be full or limited RGB range and the monitors accept different bit depths.
> 
> Currently the kernel driver for AMD and Intel GPUs automatically configure the color settings automatically with little
> to no influence of the user. However there are several real world scenarios where the user might disagree with the
> default chosen by the drivers and wants to set his or her own preference.
> 
> Some examples:
> 
> 1. While RGB and YCbCr 4:4:4 in theory carry the same amount of color information, some screens might look better on one
> than the other because of bad internal conversion. The driver currently however has a fixed default that is chosen if
> available (RGB for Intel and YCbCr 4:4:4 for AMD). The only way to change this currently is by editing and overloading
> the edid reported by the monitor to the kernel.
> 
> 2. RGB and YCbCr 4:4:4 need a higher port clock then YCbCr 4:2:0. Some hardware might report that it supports the higher
> port clock, but because of bad shielding on the PC, the cable, or the monitor the screen cuts out every few seconds when
> RGB or YCbCr 4:4:4 encoding is used, while YCbCr 4:2:0 might just work fine without changing hardware. The drivers
> currently however always default to the "best available" option even if it might be broken.
> 
> 3. Some screens natively only supporting 8-bit color, simulate 10-Bit color by rapidly switching between 2 adjacent
> colors. They advertise themselves to the kernel as 10-bit monitors but the user might not like the "fake" 10-bit effect
> and prefer running at the native 8-bit per color.
> 
> 4. Some screens are falsely classified as full RGB range wile they actually use limited RGB range. This results in
> washed out colors in dark and bright scenes. A user override can be helpful to manually fix this issue when it occurs.
> 
> There already exist several requests, discussion, and patches regarding the thematic:
> 
> - https://gitlab.freedesktop.org/drm/amd/-/issues/476
> 
> - https://gitlab.freedesktop.org/drm/amd/-/issues/1548
> 
> - https://lkml.org/lkml/2021/5/7/695
> 
> - https://lkml.org/lkml/2021/5/11/416
> 
> 
> Current State:
> 
> I only know bits about the Intel i915 and AMD amdgpu driver. I don't know how other driver handle color management
> 
> - "max bpc", global setting applied by both i915 (only on dp i think?) and amdgpu. Default value is "8". For every
> resolution + frequency combination the highest possible even number between 6 and max_bpc is chosen. If the range
> doesn't contain a valid mode the resolution + frequency combination is discarded (but I guess that would be a very
> special edge case, if existent at all, when 6 doesn't work but 10 would work). Intel HDMI code always checks 8, 12, and
> 10 and does not check the max_bpc setting.

i915 does limit things below max_bpc for both HDMI and DP.

> 
> - "Broadcast RGB" for i915 and "output_csc" for the old radeon driver (not amdgpu), overwrites the kernel chosen color
> range setting (full or limited). If I recall correctly Intel HDMI code defaults to full unless this property is set,
> Intel dp code tries to probe the monitor to find out what to use. amdgpu has no corresponding setting (I don't know how
> it's decided there).

i915 has the same behaviour for HDMI and DP, as per the CTA-861/DP
specs. Unfortunately as you already mentioned there are quite a few
monitors (DP monitors in particular) that don't implemnt the spec
correctly. IIRC later DP specs even relaxed the wording to say
that you can basically ignore the spec and do whatever you want.
Which I supose is just admitting defeat and concluding that there
is no way to get this right 100% of the time.

> 
> - RGB pixel encoding can be forced by overloading a Monitors edid with one that tells the kernel that only RGB is
> possible. That doesn't work for YCbCr 4:4:4 however because of the edid specification. Forcing YCbCr 4:2:0 would
> theoretically also be possible this way. amdgpu has a debugfs switch "force_ycbcr_420" which makes the driver default to
> YCbCr 4:2:0 on all monitors if possible.
> 
> 
> Proposed Solution:
> 
> 1. Add a new uAPI property "preferred pixel encoding", as a per port setting.
> 
>     - An amdgpu specific implementation was already shared here: https://gitlab.freedesktop.org/drm/amd/-/issues/476
> 
>     - It also writes back the actually used encoding if the one requested was not possible, overwriting the requested
> value in the process. I think it would be better to have this feedback channel as a different, read-only property.
> 
>     - Make this solution vendor agnostic by putting it in the drm_connector_state struct next do max_bpc
> https://elixir.bootlin.com/linux/v5.13-rc1/source/include/drm/drm_connector.h#L654 and add patches to amdgpu and i915 to
> respect this setting
> 
> 2. Convert "Broadcast RGB" to a vendor agnostic setting/replace with a vendor agnostic setting.
> 
>     - Imho the name is not very fitting, but it pops up in many tutorials throughout the web (some other opinions? how
> could a rename be handled?".

IIRC there was an attempt to unify this. Not sure what happened to it.

> 
>     - Also move it from Intel specific structs to the drm_connector_state struct (please let me know if there is a
> better place)
> 
> 3. Strive for full implementation of "max bpc"
> 
>     - I need to double check the Intel HDMI code.
> 
> 4. Add 3 feedback channels "active color depth", "active color range", and "active pixel encoding" as vendor agnostic
> settings in the drm_connector_state struct
> 
>     - Possible values are:
> 
>         - unknown, undefined, 6-bit, 8-bit, 9-bit, 10-bit, 11-bit, 12-bit, 14-bit, 16-bit (alternatively: an integer
> from -1 (unknown), 0 (undefined) to 16, let me know what would be more suitable)
> 
>         - unknown, undefined, full, limited
> 
>         - unknown, undefined, rgb, ycbcr444, ycbcr422, ycbcr420
> 
>     - it's the responsibility of the driver to update the values once the port configuration changes
> 
>     - if the driver does not support the feedback channels they are set to unknown
> 
>     - if the driver uses a non listed setting it should set the property to undefined
> 
>     - A more detailed description why I think these feedback channel are important and should be their own read-only
> property can be found here: https://lkml.org/lkml/2021/5/11/339
> 
> 
> Adoption:
> 
> A KDE dev wants to implement the settings in the KDE settings GUI:
> https://gitlab.freedesktop.org/drm/amd/-/issues/476#note_912370
> 
> Tuxedo Computers (my employer) wants to implement the settings desktop environment agnostic in Tuxedo Control Center. I
> will start work on this in parallel to implementing the new kernel code.

I suspect everyone would be happier to accept new uapi if we had
multiple compositors signed up to implement it.

> 
> 
> Questions:
> 
> I'm very curious about feedback from the dri-devel community. Would the concept outlaid above be accepted as new uAPI
> once it's fully implemented?
> 
> Where would be the best way to store the new vendor agnostic settings? Following the implementation of max_bpc i would
> put it in the drm_connector_state struct.
> 
> My way forward would be to implement the feedback channels first, because they can be very useful for debugging the
> setting properties afterwards.

For debugging we have dmesg/debugfs/etc. If we add new uapi IMO
it will have to have some real world use cases beyond debugging.

> I will split each of it up it in 3 or 5 patch sets: 1 for the vendor agnostic part, 1 for
> Intel (or 2 split up between HDMI and DP), and 1 for AMD (or 2 split up between HDMI and DP)
> 
> Kind regards,
> 
> Werner Sembach
> 

-- 
Ville Syrjälä
Intel
