Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5467A69B96F
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 11:34:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B07E10E07D;
	Sat, 18 Feb 2023 10:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C25110E04F;
 Sat, 18 Feb 2023 10:33:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A16DB60AEF;
 Sat, 18 Feb 2023 10:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 751CDC433EF;
 Sat, 18 Feb 2023 10:33:48 +0000 (UTC)
Message-ID: <075c7910-89de-1941-4808-bfa6d76bac30@xs4all.nl>
Date: Sat, 18 Feb 2023 11:33:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 00/21] Enable Colorspace connector property in amdgpu
To: Pekka Paalanen <ppaalanen@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
 <20230207144711.6f70c6eb@eldfell>
Content-Language: en-US
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230207144711.6f70c6eb@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 amd-gfx@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>,
 dri-devel@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/02/2023 13:47, Pekka Paalanen wrote:
> On Fri, 13 Jan 2023 11:24:07 -0500
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> This patchset enables the DP and HDMI infoframe properties
>> in amdgpu.
>>
>> The first two patches are not completely related to the rest. The
>> first patch allows for HDR_OUTPUT_METADATA with EOTFs that are
>> unknown in the kernel.
>>
>> The second one prints a connector's max_bpc as part of the atomic
>> state debugfs print.
>>
>> The following patches rework the connector colorspace code to
>> 1) allow for easy printing of the colorspace in the drm_atomic
>>    state debugfs, and
>> 2) allow drivers to specify the supported colorspaces on a
>>    connector.
>>
>> The rest of the patches deal with the Colorspace enablement
>> in amdgpu.
>>
>> Why do drivers need to specify supported colorspaces? The amdgpu
>> driver needs support for RGB-to-YCbCr conversion when we drive
>> the display in YCbCr. This is currently not implemented for all
>> colorspaces.
>>
>> Since the Colorspace property didn't have an IGT test I added
>> one to kms_hdr. The relevant patchset can be found on the IGT
>> mailing list or on
>> https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/hdr-colorimetry
>>
>> We tested v1 of the patchset and confirmed that the infoframes
>> are as expected for both DP and HDMI when running the IGT
>> colorimetry tests.
>>
>> Open Items
>> ----------
>>
>> A couple comments from Pekka about colorspace documentation are
>> left unaddressed. I hope they won't block merging this set but
>> should still be addressed separately.
>>
>> Pekka's questions really got me thinking of how this colorspace
>> property should be used and working with it more closely with
>> Joshua who is enabling HDR in gamescope made me wonder even more.
>>
>> Uma, is there a (canonical, upstream) userspace that uses this
>> property that I can look at to understand more?
>>
>> One of the key challenges that is currently not addressed is that
>> userspace is expected to pick a colorspace format straight from the
>> list of definitions out of the DP or HDMI spec. But the kernel
>> driver are the ones deciding on the output encoding (RGB, YCBCR444,
>> YCBCR420, etc.). So there is no way for userspace to decide correctly
>> between, for example, BT2020_RGB, BT2020_CYCC, BT2020_YCC.
>>
>> So we end up in a scenario where gamescope sets BT2020_RGB but we
>> output YCBCR444 so have to correct the colorspace value to
>> BT2020_YCC. This in turn breaks the colorspace IGT tests I
>> wrote. I don't think "fixing" the IGT tests to accept this is
>> the right thing to do.
>>
>> The way it stands this patchset allows us to specify the output
>> colorspace on amdgpu and we try to do the right thing, but I don't
>> thing the way the colorspace property is defined is right. We're trying
>> to expose things to userspace that should be under driver control. A
>> much better approach would be to give userspace options for colorspace
>> that are not tied to DP or HDMI specs, i.e., sRGB, BT709, BT2020, etc.,
>> and have the driver do the right thing to fill the infoframe, e.g., by
>> picking BT2020_YCC if the requested colorspace is BT2020 and the
>> is YCBCR444.
> 
> Hi Harry,
> 
> well explained.
> 
> Indeed, if you want to keep the driver in control of the encoding on
> the monitor cable, then your suggestion seems correct (ignoring the
> question whether it breaks something existing).
> 
> I do recall something about letting userspace control the encoding on
> the cable though, particularly when it affects performance or quality.
> E.g. 4:2:0 sub-sampling might be wanted in some cases and unwanted in
> others. It's a bit similar to bpc. The trade-off may be frame rate or
> resolution. It might better to know that the hardware cannot do what
> you ask, than to silently degrade. E.g. if you use sub-pixel rendering,
> you really do not want 4:2:0.
> 
> That's compatible with your suggestion on changing the Colorspace
> property, I think it would complement it. Cable encoding parameters
> could be other properties, which might also be on "auto".
> 
> If Colorspace property cannot be changed, then options I haven't seen
> discussed yet are have it force the cable encoding parameters, or
> another new property replacing it.
> 
>> If no upstream userspace currently makes use of this property I
>> can make that change, i.e., no longer tie the colorspace property
>> directly to the infoframe and reduce the options to sRGB, BT709,
>> BT601, and BT2020 (and possibly opRGB).
>>
>> v2:
>> - Tested with DP and HDMI analyzers
>> - Confirmed driver will fallback to lower bpc when needed
>> - Dropped hunk to set HDMI AVI infoframe as it was a no-op
>> - Fixed BT.2020 YCbCr colorimetry (JoshuaAshton)
>> - Simplify initialization of supported colorspaces (Jani)
>> - Fix kerneldoc (kernel test robot)
> 
> I recall saying this before, but in the series there are occurrences
> where sRGB is spelled as "RGB". I find that very confusing that "RGB"
> would imply anything about colorimetry when it's just a color model.
> 
> Sometimes it might not be sRGB because the "default RGB" has probably
> not been sRGB for many years now, depending on monitor settings. See
> also https://gitlab.freedesktop.org/pq/color-and-hdr/-/issues/17 . Then
> one might ask the philosophical question whether the signal on the
> cable is sRGB but it's just the monitor that does a gamut mapping
> instead.

FYI: the CTA-861.6 addendum adds support for explicit sRGB or defaultRGB
signaling. See chapter 8 in that standard.

The colorimetry that video sources us when transmitting RGB over HDMI is
usually sRGB, except for MacBooks, they use the colorimetry defined in the
EDID Base Block. And there was no way to signal exactly what a source was
using, or what a display expects.

Strictly speaking the approach MacBooks took was correct, but 1) not all
hardware can convert sRGB to a custom colorimetry setting, and 2) this
'requirement' was hidden in a footnote of a very long table in the spec.

In addition, the colorimetry information in the EDID Base Block was usually
identical or close to that of sRGB, but with extended gamut displays this
tends to diverge more and more in modern displays.

Regards,

	Hans

> 
> 
> Thanks,
> pq
> 
>>
>> Cc: Pekka Paalanen <ppaalanen@gmail.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Cc: Vitaly.Prosyak@amd.com
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Joshua Ashton <joshua@froggi.es>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Michel Dänzer <michel.daenzer@mailbox.org>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: amd-gfx@lists.freedesktop.org
>>
>> Harry Wentland (16):
>>   drm/display: Don't block HDR_OUTPUT_METADATA on unknown EOTF
>>   drm/connector: print max_requested_bpc in state debugfs
>>   drm/connector: Drop COLORIMETRY_NO_DATA
>>   drm/connector: Convert DRM_MODE_COLORIMETRY to enum
>>   drm/connector: Pull out common create_colorspace_property code
>>   drm/connector: Allow drivers to pass list of supported colorspaces
>>   drm/connector: Print connector colorspace in state debugfs
>>   drm/amd/display: Always pass connector_state to stream validation
>>   drm/amd/display: Register Colorspace property for DP and HDMI
>>   drm/amd/display: Signal mode_changed if colorspace changed
>>   drm/amd/display: Send correct DP colorspace infopacket
>>   drm/amd/display: Add support for explicit BT601_YCC
>>   drm/amd/display: Add debugfs for testing output colorspace
>>   drm/amd/display: Add default case for output_color_space switch
>>   drm/amd/display: Don't restrict bpc to 8 bpc
>>   drm/amd/display: Format input and output CSC matrix
>>
>> Joshua Ashton (5):
>>   drm/amd/display: Always set crtcinfo from create_stream_for_sink
>>   drm/amd/display: Fallback to 2020_YCBCR if the pixel encoding is not
>>     RGB
>>   drm/amd/display: Refactor avi_info_frame colorimetry determination
>>   drm/amd/display: Calculate output_color_space after pixel encoding
>>     adjustment
>>   drm/amd/display: Fix COLOR_SPACE_YCBCR2020_TYPE matrix
>>
>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  90 ++++++---
>>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  57 ++++++
>>  .../drm/amd/display/dc/core/dc_hw_sequencer.c |  38 ++--
>>  .../gpu/drm/amd/display/dc/core/dc_resource.c |  28 ++-
>>  drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |  54 +++--
>>  drivers/gpu/drm/display/drm_hdmi_helper.c     |   8 +-
>>  drivers/gpu/drm/drm_atomic.c                  |   2 +
>>  drivers/gpu/drm/drm_connector.c               | 189 ++++++++++--------
>>  .../gpu/drm/i915/display/intel_connector.c    |   4 +-
>>  drivers/gpu/drm/vc4/vc4_hdmi.c                |   2 +-
>>  include/drm/display/drm_dp.h                  |   2 +-
>>  include/drm/drm_connector.h                   |  57 +++---
>>  12 files changed, 345 insertions(+), 186 deletions(-)
>>
>> --
>> 2.39.0
>>
> 

