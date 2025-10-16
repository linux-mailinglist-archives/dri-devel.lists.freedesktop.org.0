Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 299E2BE5ABD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 00:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368D110E0E1;
	Thu, 16 Oct 2025 22:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=0la.ch header.i=@0la.ch header.b="IjoAMcto";
	dkim=permerror (0-bit key) header.d=0la.ch header.i=@0la.ch header.b="kDs0Bm2J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB1B10E0E1;
 Thu, 16 Oct 2025 22:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=0la.ch; c=relaxed/relaxed;
 h=From:To:Subject:Date:Message-ID; t=1760653494; bh=JX3ux736eVT9KG/v2s/TG8B
 r13bbULkBBPHlEbhguII=; b=IjoAMctoJHwcpVJrPFJ4jHkMhnHi56vsnPcBKM75akuOHGfD8r
 pyunHfGk+gUtNYmS9C/5/BcwnKP+1TSyKFOpPHhHUbpsPJDIb3hCEAvVdCX6x+C3Ud/Udp22NxY
 Zts4B2kie7XRXBvReKMSI5OrSEgNC+cdMpSr4NG+xvheWQ5T99qWeI9Fu0odll8beqqX9O897C2
 +XQ/ONb966LSzVzS4A3ZBf+b2qY+Q8N3TGs9T3nwAfIJsbHVKQXdPPzQeK1EvuqRjN2/GYbC75J
 VN+GnRPA2WnrdzxaHeO4411aEszyhp/t780X/dWzGj3dA9nP4Ce5Sl4lU8tXg+ORqRA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=0la.ch; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1760653494;
 bh=JX3ux736eVT9KG/v2s/TG8B
 r13bbULkBBPHlEbhguII=; b=kDs0Bm2JJtKr7GxUMQ3yA2qbfXzpdI5l2A0NjlOfulHpVqKo1+
 YrQNpdC2qc4dWmz4seWEN+oP++ur5I/mpkCA==;
Message-ID: <8a45cbe8-a0ed-473c-b830-1194c30d9414@0la.ch>
Date: Fri, 17 Oct 2025 00:24:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/edid: parse DRM VESA dsc bpp target
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Yaroslav Bolyukin
 <iam@lach.pw>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251016001038.13611-2-iam@lach.pw>
 <20251016001038.13611-4-iam@lach.pw>
 <3abc1087618c822e5676e67a3ec2e64e506dc5ec@intel.com>
 <adb2c2bd-a38e-4a40-ba1c-dcc7ad707727@0la.ch> <aPFZecm3PKaCpMXi@intel.com>
Content-Language: en-US
From: Yaroslav <iam@0la.ch>
In-Reply-To: <aPFZecm3PKaCpMXi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2025-10-16 22:45, Ville Syrjälä wrote:
> On Thu, Oct 16, 2025 at 07:11:48PM +0200, Yaroslav wrote:
>> On 2025-10-16 18:36, Jani Nikula wrote:
>>   > On Thu, 16 Oct 2025, Yaroslav Bolyukin <iam@lach.pw> wrote:
>>   >> As per DisplayID v2.0 Errata E9 spec "DSC pass-through timing support"
>>   >> VESA vendor-specific data block may contain target DSC bits per pixel
>>   >> fields
>>   >
>>   > Thanks for the patch.
>>
>> Thanks for the quick review! :D
>>
>>   > I think there's just too much going on in a single patch. Should
>>   > probably be split to several patches:
>>   >
>>   > - rename drm_parse_vesa_mso_data() to drm_parse_vesa_specific_block()
>>   >
>>   > - handle DSC pass-through parts in the above, including the macros for
>>   >    parsing that (but nothing about timing here yet), and adding to
>>   >    display_info
>>   >
>>   > - note that the above would be needed to backport mso support for 7 byte
>>   >    vendor blocks to stable!
>>
>> Sorry, can you elaborate? Right now stable kernel just ignores
>> everything going after 5th byte, so it "supports 7 byte blocks" by
>> ignoring them.
>>
>>   > - Add the detailed timing parsing in a separate patch
>>   >
>> I'll split the patch as requested
>>   >>
>>   >> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
>>   >> ---
>>   >>   drivers/gpu/drm/drm_displayid_internal.h |  8 ++++
>>   >>   drivers/gpu/drm/drm_edid.c               | 61 ++++++++++++++++--------
>>   >>   include/drm/drm_connector.h              |  6 +++
>>   >>   include/drm/drm_modes.h                  | 10 ++++
>>   >>   4 files changed, 64 insertions(+), 21 deletions(-)
>>   >>
>>   >> diff --git a/drivers/gpu/drm/drm_displayid_internal.h
>> b/drivers/gpu/drm/drm_displayid_internal.h
>>   >> index 957dd0619f5c..d008a98994bb 100644
>>   >> --- a/drivers/gpu/drm/drm_displayid_internal.h
>>   >> +++ b/drivers/gpu/drm/drm_displayid_internal.h
>>   >> @@ -97,6 +97,10 @@ struct displayid_header {
>>   >>   	u8 ext_count;
>>   >>   } __packed;
>>   >>
>>   >> +#define DISPLAYID_BLOCK_REV				GENMASK(2, 0)
>>   >> +#define DISPLAYID_BLOCK_PASSTHROUGH_TIMINGS_SUPPORT	BIT(3)
>>   >> +#define DISPLAYID_BLOCK_DESCRIPTOR_PAYLOAD_BYTES	GENMASK(6, 4)
>>   >
>>   > These two are related to the rev of struct
>>   > displayid_detailed_timing_block only, and should probably be defined
>>   > next to it.
>>
>> BLOCK_REV is handled identically for all the displayid block types
>> afaik, and DISPLAYID_BLOCK_DESCRIPTOR_PAYLOAD_BYTES is unrelated to the
>> timings block, I didn't want to spread the masks around the file, but
>> will do if you think that's better.
>>
>>   >> +
>>   >>   struct displayid_block {
>>   >>   	u8 tag;
>>   >>   	u8 rev;
>>   >> @@ -144,12 +148,16 @@ struct displayid_formula_timing_block {
>>   >>
>>   >>   #define DISPLAYID_VESA_MSO_OVERLAP	GENMASK(3, 0)
>>   >>   #define DISPLAYID_VESA_MSO_MODE		GENMASK(6, 5)
>>   >> +#define DISPLAYID_VESA_DSC_BPP_INT	GENMASK(5, 0)
>>   >> +#define DISPLAYID_VESA_DSC_BPP_FRACT	GENMASK(3, 0)
>>   >>
>>   >>   struct displayid_vesa_vendor_specific_block {
>>   >>   	struct displayid_block base;
>>   >>   	u8 oui[3];
>>   >>   	u8 data_structure_type;
>>   >>   	u8 mso;
>>   >> +	u8 dsc_bpp_int;
>>   >> +	u8 dsc_bpp_fract;
>>   >>   } __packed;
>>   >>
>>   >>   /*
>>   >> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>>   >> index e2e85345aa9a..6e42e55b41f9 100644
>>   >> --- a/drivers/gpu/drm/drm_edid.c
>>   >> +++ b/drivers/gpu/drm/drm_edid.c
>>   >> @@ -6524,8 +6524,8 @@ static void drm_get_monitor_range(struct
>> drm_connector *connector,
>>   >>   		    info->monitor_range.min_vfreq, info->monitor_range.max_vfreq);
>>   >>   }
>>   >>
>>   >> -static void drm_parse_vesa_mso_data(struct drm_connector *connector,
>>   >> -				    const struct displayid_block *block)
>>   >> +static void drm_parse_vesa_specific_block(struct drm_connector
>> *connector,
>>   >> +					  const struct displayid_block *block)
>>   >>   {
>>   >>   	struct displayid_vesa_vendor_specific_block *vesa =
>>   >>   		(struct displayid_vesa_vendor_specific_block *)block;
>>   >> @@ -6541,7 +6541,7 @@ static void drm_parse_vesa_mso_data(struct
>> drm_connector *connector,
>>   >>   	if (oui(vesa->oui[0], vesa->oui[1], vesa->oui[2]) != VESA_IEEE_OUI)
>>   >>   		return;
>>   >>
>>   >> -	if (sizeof(*vesa) != sizeof(*block) + block->num_bytes) {
>>   >> +	if (block->num_bytes < 5) {
>>   >>   		drm_dbg_kms(connector->dev,
>>   >>   			    "[CONNECTOR:%d:%s] Unexpected VESA vendor block size\n",
>>   >>   			    connector->base.id, connector->name);
>>   >> @@ -6564,28 +6564,40 @@ static void drm_parse_vesa_mso_data(struct
>> drm_connector *connector,
>>   >>   		break;
>>   >>   	}
>>   >>
>>   >> -	if (!info->mso_stream_count) {
>>   >> -		info->mso_pixel_overlap = 0;
>>   >> -		return;
>>   >> -	}
>>   >> +	info->mso_pixel_overlap = 0;
>>   >
>>   > Nitpick, I kind of like having this in the else path below instead of
>>   > first setting it to 0 and then setting it again to something else.
>>   >>>
>>   >> -	info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP,
>> vesa->mso);
>>   >> -	if (info->mso_pixel_overlap > 8) {
>>   >> -		drm_dbg_kms(connector->dev,
>>   >> -			    "[CONNECTOR:%d:%s] Reserved MSO pixel overlap value %u\n",
>>   >> -			    connector->base.id, connector->name,
>>   >> -			    info->mso_pixel_overlap);
>>   >> -		info->mso_pixel_overlap = 8;
>>   >> +	if (info->mso_stream_count) {
>>   >> +		info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP,
>> vesa->mso);
>>   >> +		if (info->mso_pixel_overlap > 8) {
>>   >> +			drm_dbg_kms(connector->dev,
>>   >> +				    "[CONNECTOR:%d:%s] Reserved MSO pixel overlap value %u\n",
>>   >> +				    connector->base.id, connector->name,
>>   >> +				    info->mso_pixel_overlap);
>>   >> +			info->mso_pixel_overlap = 8;
>>   >> +		}
>>   >>   	}
>>   >>
>>   >>   	drm_dbg_kms(connector->dev,
>>   >>   		    "[CONNECTOR:%d:%s] MSO stream count %u, pixel overlap %u\n",
>>   >>   		    connector->base.id, connector->name,
>>   >>   		    info->mso_stream_count, info->mso_pixel_overlap);
>>   >
>>   > Not sure we want to debug log this unless info->mso_stream_count !=
>>   > 0. This is a rare feature.
>>   >
>>   > Side note, we seem to be lacking the check for
>>   > data_structure_type. Probably my bad. I'm not asking you to fix it, but
>>   > hey, if you're up for it, another patch is welcome! ;)
>> I see, MSO overlap/stream count shouldn't be parsed for eDP, I'll do it.
>> Is that what you meant by "note that the above would be needed to
>> backport mso support for 7 byte vendor blocks to stable!"?
>>   >> +
>>   >> +	if (block->num_bytes < 7) {
>>   >> +		/* DSC bpp is optional */
>>   >> +		return;
>>   >> +	}
>>   >> +
>>   >> +	info->dp_dsc_bpp = FIELD_GET(DISPLAYID_VESA_DSC_BPP_INT,
>> vesa->dsc_bpp_int) << 4 |
>>   >> +			   FIELD_GET(DISPLAYID_VESA_DSC_BPP_FRACT, vesa->dsc_bpp_fract);
>>   >> +
>>   >> +	drm_dbg_kms(connector->dev,
>>   >> +		    "[CONNECTOR:%d:%s] DSC bits per pixel %u\n",
>>   >> +		    connector->base.id, connector->name,
>>   >> +		    info->dp_dsc_bpp);
>>   >>   }
>>   >>
>>   >> -static void drm_update_mso(struct drm_connector *connector,
>>   >> -			   const struct drm_edid *drm_edid)
>>   >> +static void drm_update_vesa_specific_block(struct drm_connector
>> *connector,
>>   >> +					   const struct drm_edid *drm_edid)
>>   >>   {
>>   >>   	const struct displayid_block *block;
>>   >>   	struct displayid_iter iter;
>>   >> @@ -6593,7 +6605,7 @@ static void drm_update_mso(struct
>> drm_connector *connector,
>>   >>   	displayid_iter_edid_begin(drm_edid, &iter);
>>   >>   	displayid_iter_for_each(block, &iter) {
>>   >>   		if (block->tag == DATA_BLOCK_2_VENDOR_SPECIFIC)
>>   >> -			drm_parse_vesa_mso_data(connector, block);
>>   >> +			drm_parse_vesa_specific_block(connector, block);
>>   >>   	}
>>   >>   	displayid_iter_end(&iter);
>>   >>   }
>>   >> @@ -6630,6 +6642,7 @@ static void drm_reset_display_info(struct
>> drm_connector *connector)
>>   >>   	info->mso_stream_count = 0;
>>   >>   	info->mso_pixel_overlap = 0;
>>   >>   	info->max_dsc_bpp = 0;
>>   >> +	info->dp_dsc_bpp = 0;
>>   >>
>>   >>   	kfree(info->vics);
>>   >>   	info->vics = NULL;
>>   >> @@ -6753,7 +6766,7 @@ static void update_display_info(struct
>> drm_connector *connector,
>>   >>   	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB422)
>>   >>   		info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
>>   >>
>>   >> -	drm_update_mso(connector, drm_edid);
>>   >> +	drm_update_vesa_specific_block(connector, drm_edid);
>>   >>
>>   >>   out:
>>   >>   	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_NON_DESKTOP)) {
>>   >> @@ -6784,7 +6797,8 @@ static void update_display_info(struct
>> drm_connector *connector,
>>   >>
>>   >>   static struct drm_display_mode *drm_mode_displayid_detailed(struct
>> drm_device *dev,
>>   >>   							    const struct displayid_detailed_timings_1 *timings,
>>   >> -							    bool type_7)
>>   >> +							    bool type_7,
>>   >> +							    int rev)
>>   >
>>   > If we added struct displayid_detailed_timing_block *block parameter
>>   > (between dev and timings), the function could figure it all out from
>>   > there instead of having to pass several parameters. Dunno which is
>>   > cleaner. It's also not neat to pass rev as int, when it's really data
>>   > that has to be parsed.
>>
>> I agree, just didn't like passing both the block and struct from the
>> block (timings param), but it should be fine, I'll redo it.
>>
>>   >>   {
>>   >>   	struct drm_display_mode *mode;
>>   >>   	unsigned int pixel_clock = (timings->pixel_clock[0] |
>>   >> @@ -6805,6 +6819,10 @@ static struct drm_display_mode
>> *drm_mode_displayid_detailed(struct drm_device *d
>>   >>   	if (!mode)
>>   >>   		return NULL;
>>   >>
>>   >> +	if (type_7 && FIELD_GET(DISPLAYID_BLOCK_REV, rev) >= 1)
>>   >> +		mode->dsc_passthrough_timings_support =
>>   >> +			!!(rev & DISPLAYID_BLOCK_PASSTHROUGH_TIMINGS_SUPPORT);
>>   >
>>   > I wonder if it would make life easier all around if we just filled the
>>   > dp_dsc_bpp in the mode itself, instead of having a flag and having to
>>   > look it up separately?
>>
>> They are stored in the separate blocks, and vesa vendor specific block
>> can be located after the timings blocks, meaning to do that we need to
>> iterate over all the mode blocks again and parse their timings support
>> flag from rev again to fill this data. I don't like this either, but
>> seems like this is the most logical implementation.
>>
>> We also have max_dsc_bpp declared in display_mode, and it should be
>> related to this.
>>
>> It also won't help with the fact that it is hard to handle mode flag for
>> the modes created at runtime (see AMDGPU patch). I believe there should
>> be a fancier way to do this, but this anin't it.
>>
>> I still have troubles understanding why does this flag need to exist, as
>> far as I can see, every device with passthrough timings doesn't have
>> both modes using them and not using them, and the implementation doesn't
>> look good due to this fact.
> 
> This looks like it would need to be handled in the same as the
> "420 only" stuff. But since this doesn't use the VIC it's going to
> be even more annoying. Basically you'd have to store the pass-through
> timings in eg. display info and then check against that list whenever
> you have to figure out if the mode you're looking at is one of these
> pass through modes.

Except right now DRM_IOCTL_MODE_SETCRTC allows userspace to create 
arbitrary drm_display_mode struct value (I have no idea if that even 
works, but as far as I can see nothing prevents that in amdgpu driver 
implementation), and for that case there needs to be an exception in 
case if all the modes are passthru, because then passed mode should use 
dsc_bpp value regardless (i.e device only supports passthru)?

This behavior is not declared by spec, but based on my testing I can 
only assume that this flag is only a hint, and no hardware supports both 
modes with fixed dsc_bpp value and without it.

And with Jani Nikula's suggestion there is a matter of which dsc_bpp 
value to use, as with proposed move of this value to the mode itself, in 
theory there might be different values for the modes, even if during 
edid parsing only one value (from VESA vendor specific block) might appear.

It just feels too fragile and incomplete.
>> On VivePro2 there is a HID command to switch between display modes:
>> modes without dsc_bpp are grouped, and two of the of the high resolution
>> modes have different dsc_bpp_x16 values on them. I believe it is just
>> this flag is redundant, as there are no devices in the wild having set
>> dsc_bpp, and the flag unset, but I try to follow the spec, and here we are.
>>
>>   >> +
>>   >>   	/* resolution is kHz for type VII, and 10 kHz for type I */
>>   >>   	mode->clock = type_7 ? pixel_clock : pixel_clock * 10;
>>   >>   	mode->hdisplay = hactive;
>>   >> @@ -6846,7 +6864,7 @@ static int
>> add_displayid_detailed_1_modes(struct drm_connector *connector,
>>   >>   	for (i = 0; i < num_timings; i++) {
>>   >>   		struct displayid_detailed_timings_1 *timings = &det->timings[i];
>>   >>
>>   >> -		newmode = drm_mode_displayid_detailed(connector->dev, timings,
>> type_7);
>>   >> +		newmode = drm_mode_displayid_detailed(connector->dev, timings,
>> type_7, block->rev);
>>   >>   		if (!newmode)
>>   >>   			continue;
>>   >>
>>   >> @@ -6893,7 +6911,8 @@ static int add_displayid_formula_modes(struct
>> drm_connector *connector,
>>   >>   	struct drm_display_mode *newmode;
>>   >>   	int num_modes = 0;
>>   >>   	bool type_10 = block->tag == DATA_BLOCK_2_TYPE_10_FORMULA_TIMING;
>>   >> -	int timing_size = 6 + ((formula_block->base.rev & 0x70) >> 4);
>>   >> +	int timing_size = 6 +
>>   >> +		FIELD_GET(DISPLAYID_BLOCK_DESCRIPTOR_PAYLOAD_BYTES,
>> formula_block->base.rev);
>>   >
>>   > I think this is an unrelated change. Probably something we want, but
>>   > should not be in the same patch with the rest.
>>
>> I'll split the patches, would it be ok to have it in the same patchset?
>> Same question for mso data_structure_type.
>>
>>   >>
>>   >>   	/* extended blocks are not supported yet */
>>   >>   	if (timing_size != 6)
>>   >> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>>   >> index 8f34f4b8183d..01640fcf7464 100644
>>   >> --- a/include/drm/drm_connector.h
>>   >> +++ b/include/drm/drm_connector.h
>>   >> @@ -837,6 +837,12 @@ struct drm_display_info {
>>   >>   	 */
>>   >>   	u32 max_dsc_bpp;
>>   >>
>>   >> +	/**
>>   >> +	 * @dp_dsc_bpp: DP Display-Stream-Compression (DSC) timing's target
>>   >> +	 * DSC bits per pixel in 6.4 fixed point format. 0 means undefined.
>>   >> +	 */
>>   >> +	u16 dp_dsc_bpp;
>>   >
>>   > It's slightly annoying that we have max_dsc_bpp which is int, and
>>   > dp_dsc_bpp, which is 6.4 fixed point. The drm_dp_helper.c uses _x16
>>   > suffix for the 6.4 bpp, so maybe do the same here, dp_dsc_bpp_x16?
>>
>> Yep, didn't notice we already have bpp value in display_info.
>>
>>   >> +
>>   >>   	/**
>>   >>   	 * @vics: Array of vics_len VICs. Internal to EDID parsing.
>>   >>   	 */
>>   >> diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
>>   >> index b9bb92e4b029..312e5c03af9a 100644
>>   >> --- a/include/drm/drm_modes.h
>>   >> +++ b/include/drm/drm_modes.h
>>   >> @@ -417,6 +417,16 @@ struct drm_display_mode {
>>   >>   	 */
>>   >>   	enum hdmi_picture_aspect picture_aspect_ratio;
>>   >>
>>   >> +	/**
>>   >> +	 * @dsc_passthrough_timing_support:
>>   >> +	 *
>>   >> +	 * Indicates whether this mode timing descriptor is supported
>>   >> +	 * with specific target DSC bits per pixel only.
>>   >> +	 *
>>   >> +	 * VESA vendor-specific data block shall exist with the relevant
>>   >> +	 * DSC bits per pixel declaration when this flag is set to true.
>>   >> +	 */
>>   >> +	bool dsc_passthrough_timings_support;
>>   >>   };
>>   >>
>>   >>   /**
>>
>> Regards,
>>
>> Lach
> 
