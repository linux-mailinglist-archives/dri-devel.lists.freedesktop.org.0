Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 223F4A144A8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 23:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFB410EA1A;
	Thu, 16 Jan 2025 22:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="Juf+PWEn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id EF33110EA1A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 22:42:24 +0000 (UTC)
Received: from hm-sls2
 (bras-base-toroon4332w-grc-51-184-146-177-43.dsl.bell.ca [184.146.177.43])
 by linux.microsoft.com (Postfix) with ESMTPSA id 6DFDD20591A4;
 Thu, 16 Jan 2025 14:42:23 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6DFDD20591A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1737067344;
 bh=S+x2NkiKdN3StrakzSz+9rNarqYorO4bSI9BRNYHsiM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Juf+PWEnYr3403EfSEckSk9tnHlCFRj4eD/EDJIz+tRSPKxJyCFEUvE2H3VdxdrZ2
 BxLzGPrAmFWpfu5zlnGeuEfhbu2be2hiEzV1iofD46E4wUMwsTxpLR1UNmY5oIep2S
 A8arWnw2pbhfyADt1JCZqa3J6tMIaAm6/AnwbgYA=
Date: Thu, 16 Jan 2025 17:42:21 -0500
From: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Karol Herbst <kherbst@redhat.com>,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: Re: [PATCH] drm/edid: add CTA Video Format Data Block support
Message-ID: <Z4mLTbsh6VZ1Noqc@hm-sls2>
References: <20241106014638.350678-1-hamza.mahfooz@amd.com>
 <CADnq5_MqTjprg3vPEMCPfq-i8yiuV_DTa==NdiSwRboH-NN1Zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_MqTjprg3vPEMCPfq-i8yiuV_DTa==NdiSwRboH-NN1Zg@mail.gmail.com>
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

On Thu, Jan 16, 2025 at 09:13:18AM -0500, Alex Deucher wrote:
> On Tue, Nov 5, 2024 at 9:14 PM Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
> >
> > Video Format Data Blocks (VFDBs) contain the necessary information that
> > needs to be fed to the Optimized Video Timings (OVT) Algorithm.
> > Also, we require OVT support to cover modes that aren't supported by
> > earlier standards (e.g. CVT). So, parse all of the relevant VFDB data
> > and feed it to the OVT Algorithm, to extract all of the missing OVT
> > modes.
> >
> > Cc: Ian Forbes <ian.forbes@broadcom.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Suggested-by: Karol Herbst <kherbst@redhat.com>
> > Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> > ---
> > v3: move ovt stuff above add_cea_modes() and break up
> >     calculate_ovt_mode() to make it easier to read.
> >
> > v4: fix 32 bit build and constify read-only vars.
> >
> > v5: Implement suggestions from:
> >     https://lore.kernel.org/dri-devel/87plpbk92h.fsf@intel.com/
> >     and export drm_ovt_mode().
> 
> Any concerns with this patch?  Can we land this?

As Jani mentioned, I don't believe anyone has had a chance to review all
of the OVT calculations.

Hamza

> 
> Alex
> 
> > ---
> >  drivers/gpu/drm/drm_edid.c | 465 +++++++++++++++++++++++++++++++++++++
> >  include/drm/drm_edid.h     |   3 +
> >  2 files changed, 468 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index 855beafb76ff..e5e34397be00 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -31,6 +31,7 @@
> >  #include <linux/bitfield.h>
> >  #include <linux/byteorder/generic.h>
> >  #include <linux/cec.h>
> > +#include <linux/gcd.h>
> >  #include <linux/hdmi.h>
> >  #include <linux/i2c.h>
> >  #include <linux/kernel.h>
> > @@ -741,6 +742,87 @@ static const struct minimode extra_modes[] = {
> >         { 2048, 1536, 60, 0 },
> >  };
> >
> > +struct cta_rid {
> > +       u16 hactive;
> > +       u16 vactive;
> > +       u8 hratio;
> > +       u8 vratio;
> > +};
> > +
> > +/* CTA-861-I Table 11 - Resolution Identification (RID) */
> > +static const struct cta_rid rids[] = {
> > +       [0]  = { 0, 0, 0, 0 },
> > +       [1]  = { 1280, 720, 16, 9 },
> > +       [2]  = { 1280, 720, 64, 27 },
> > +       [3]  = { 1680, 720, 64, 27 },
> > +       [4]  = { 1920, 1080, 16, 9 },
> > +       [5]  = { 1920, 1080, 64, 27 },
> > +       [6]  = { 2560, 1080, 64, 27 },
> > +       [7]  = { 3840, 1080, 32, 9 },
> > +       [8]  = { 2560, 1440, 16, 9 },
> > +       [9]  = { 3440, 1440, 64, 27 },
> > +       [10] = { 5120, 1440, 32, 9 },
> > +       [11] = { 3840, 2160, 16, 9 },
> > +       [12] = { 3840, 2160, 64, 27 },
> > +       [13] = { 5120, 2160, 64, 27 },
> > +       [14] = { 7680, 2160, 32, 9 },
> > +       [15] = { 5120, 2880, 16, 9 },
> > +       [16] = { 5120, 2880, 64, 27 },
> > +       [17] = { 6880, 2880, 64, 27 },
> > +       [18] = { 10240, 2880, 32, 9 },
> > +       [19] = { 7680, 4320, 16, 9 },
> > +       [20] = { 7680, 4320, 64, 27 },
> > +       [21] = { 10240, 4320, 64, 27 },
> > +       [22] = { 15360, 4320, 32, 9 },
> > +       [23] = { 11520, 6480, 16, 9 },
> > +       [24] = { 11520, 6480, 64, 27 },
> > +       [25] = { 15360, 6480, 64, 27 },
> > +       [26] = { 15360, 8640, 16, 9 },
> > +       [27] = { 15360, 8640, 64, 27 },
> > +       [28] = { 20480, 8640, 64, 27 },
> > +};
> > +
> > +/* CTA-861-I Table 12 - AVI InfoFrame Video Format Frame Rate */
> > +static const u16 video_format_frame_rates[] = {
> > +       /* Frame Rate 0-7 */
> > +       0, 24, 25, 30, 48, 50, 60, 100,
> > +       /* Frame Rate 8-15 */
> > +       120, 144, 200, 240, 300, 360, 400, 480,
> > +};
> > +
> > +/* CTA-861-I Table 13 - RID To VIC Mapping */
> > +static const u8 rid_to_vic[][8] = {
> > +       [0]  = {},
> > +       [1]  = { 60, 61, 62, 108, 19, 4, 41, 47 },
> > +       [2]  = { 65, 66, 67, 109, 68, 69, 70, 71 },
> > +       [3]  = { 79, 80, 81, 110, 82, 83, 84, 85 },
> > +       [4]  = { 32, 33, 34, 111, 31, 16, 64, 63 },
> > +       [5]  = { 72, 73, 74, 112, 75, 76, 77, 78 },
> > +       [6]  = { 86, 87, 88, 113, 89, 90, 91, 92 },
> > +       [7]  = {},
> > +       [8]  = {},
> > +       [9]  = {},
> > +       [10] = {},
> > +       [11] = { 93, 94, 95, 114, 96, 97, 117, 118 },
> > +       [12] = { 103, 104, 105, 116, 106, 107, 119, 120 },
> > +       [13] = { 121, 122, 123, 124, 125, 126, 127, 193 },
> > +       [14] = {},
> > +       [15] = {},
> > +       [16] = {},
> > +       [17] = {},
> > +       [18] = {},
> > +       [19] = { 194, 195, 196, 197, 198, 199, 200, 201 },
> > +       [20] = { 202, 203, 204, 205, 206, 207, 208, 209 },
> > +       [21] = { 210, 211, 212, 213, 214, 215, 216, 217 },
> > +       [22] = {},
> > +       [23] = {},
> > +       [24] = {},
> > +       [25] = {},
> > +       [26] = {},
> > +       [27] = {},
> > +       [28] = {},
> > +};
> > +
> >  /*
> >   * From CEA/CTA-861 spec.
> >   *
> > @@ -4131,6 +4213,7 @@ static int add_detailed_modes(struct drm_connector *connector,
> >  #define CTA_DB_VIDEO                   2
> >  #define CTA_DB_VENDOR                  3
> >  #define CTA_DB_SPEAKER                 4
> > +#define CTA_DB_VIDEO_FORMAT            6
> >  #define CTA_DB_EXTENDED_TAG            7
> >
> >  /* CTA-861-H Table 62 - CTA Extended Tag Codes */
> > @@ -4972,6 +5055,16 @@ struct cea_db {
> >         u8 data[];
> >  } __packed;
> >
> > +struct cta_vfd {
> > +       u8 rid;
> > +       u8 fr_fact;
> > +       bool bfr50;
> > +       bool fr24;
> > +       bool bfr60;
> > +       bool fr144;
> > +       bool fr48;
> > +};
> > +
> >  static int cea_db_tag(const struct cea_db *db)
> >  {
> >         return db->tag_length >> 5;
> > @@ -5250,6 +5343,376 @@ static int edid_hfeeodb_extension_block_count(const struct edid *edid)
> >         return cta[4 + 2];
> >  }
> >
> > +/* CTA-861 Video Format Descriptor (CTA VFD) */
> > +static void parse_cta_vfd(struct cta_vfd *vfd, const u8 *data, int vfd_len)
> > +{
> > +       vfd->rid = data[0] & 0x3f;
> > +       vfd->bfr50 = data[0] & 0x80;
> > +       vfd->fr24 = data[0] & 0x40;
> > +       vfd->bfr60 = vfd_len > 1 ? (data[1] & 0x80) : true;
> > +       vfd->fr144 = vfd_len > 1 ? (data[1] & 0x40) : false;
> > +       vfd->fr_fact = vfd_len > 1 ? (data[1] & 0x3f) : 0x3;
> > +       vfd->fr48 = vfd_len > 2 ? (data[2] & 0x1) : false;
> > +}
> > +
> > +static bool vfd_has_fr(const struct cta_vfd *vfd, int rate)
> > +{
> > +       static const u8 factors[] = {
> > +               1, 2, 4, 8, 12, 16
> > +       };
> > +       int factor = 0;
> > +       int i;
> > +
> > +       switch (rate) {
> > +       case 24:
> > +               return vfd->fr24;
> > +       case 48:
> > +               return vfd->fr48;
> > +       case 144:
> > +               return vfd->fr144;
> > +       }
> > +
> > +       if (!(rate % 25)) {
> > +               if (!vfd->bfr50)
> > +                       return false;
> > +
> > +               factor = rate / 25;
> > +       } else if (!(rate % 30)) {
> > +               if (!vfd->bfr60)
> > +                       return false;
> > +
> > +               factor = rate / 30;
> > +       }
> > +
> > +       for (i = 0; i < ARRAY_SIZE(factors); i++)
> > +               if (factor == factors[i] && (vfd->fr_fact & (1 << i)))
> > +                       return true;
> > +
> > +       return false;
> > +}
> > +
> > +#define OVT_PIXEL_CLOCK_GRANULARITY    1000            /* Hz */
> > +#define OVT_MIN_HTOTAL_GRANULARITY     8               /* pixels */
> > +#define OVT_MIN_VBLANK_DURATION        460000000       /* ps */
> > +#define OVT_MIN_VBLANK_LINES           20
> > +#define OVT_MIN_VSYNC_LEADING_EDGE     400             /* us */
> > +#define OVT_MIN_VSYNC_LE_LINES         14
> > +#define OVT_MIN_CLOCK_RATE_420         590000000       /* Hz */
> > +#define OVT_PIXEL_FACTOR_420           2
> > +#define OVT_MIN_HBLANK_444             80              /* pixels */
> > +#define OVT_MIN_HBLANK_420             128             /* pixels */
> > +#define OVT_MAX_CHUNK_RATE             650000000       /* Hz */
> > +#define OVT_AUDIO_PACKET_RATE          195000          /* Hz */
> > +#define OVT_AUDIO_PACKET_SIZE          32
> > +#define OVT_LINE_OVERHEAD              32
> > +#define OVT_HSYNC_WIDTH                32
> > +#define OVT_VSYNC_WIDTH                8
> > +
> > +static u32 calculate_ovt_min_vtotal(const struct cta_rid *rid, u64 max_vrate,
> > +                                   u32 vtotal_granularity)
> > +{
> > +       u64 max_active_time;
> > +       u32 min_line_time;
> > +       u32 min_vblank;
> > +       u32 min_vtotal;
> > +
> > +       /* step 2 */
> > +       max_active_time = div64_u64(1000000000000, max_vrate) -
> > +               (u64)OVT_MIN_VBLANK_DURATION;
> > +
> > +       min_line_time = div_u64(max_active_time, rid->vactive);
> > +
> > +       min_vblank = max_t(u64, (u64)OVT_MIN_VBLANK_LINES,
> > +                          DIV64_U64_ROUND_UP(OVT_MIN_VBLANK_DURATION,
> > +                                             min_line_time));
> > +
> > +       min_vtotal = rid->vactive + min_vblank;
> > +
> > +       if (min_vtotal % vtotal_granularity)
> > +               min_vtotal += vtotal_granularity - (min_vtotal %
> > +                                                   vtotal_granularity);
> > +
> > +       return min_vtotal;
> > +}
> > +
> > +static u32 calculate_ovt_min_htotal(const struct cta_rid *rid,
> > +                                   const u32 max_vrate,
> > +                                   const u32 min_vtotal,
> > +                                   u32 *min_hblank,
> > +                                   u32 *htotal_granularity)
> > +{
> > +       u32 max_audio_packets_per_line;
> > +       u32 htotal_granularity_chunk;
> > +       u64 min_pixel_clock_rate;
> > +       u32 min_line_rate;
> > +       u32 min_htotal;
> > +
> > +       /* step 3 */
> > +       min_line_rate = max_vrate * min_vtotal;
> > +
> > +       max_audio_packets_per_line = DIV_ROUND_UP(OVT_AUDIO_PACKET_RATE,
> > +                                                 min_line_rate);
> > +
> > +       /* step 4 */
> > +       *min_hblank = OVT_LINE_OVERHEAD + OVT_AUDIO_PACKET_SIZE *
> > +               max_audio_packets_per_line;
> > +
> > +       min_htotal = rid->hactive + max(OVT_MIN_HBLANK_444, *min_hblank);
> > +
> > +       min_pixel_clock_rate = max_vrate * min_htotal * min_vtotal;
> > +
> > +       htotal_granularity_chunk =
> > +               roundup_pow_of_two(DIV64_U64_ROUND_UP(min_pixel_clock_rate,
> > +                                                     OVT_MAX_CHUNK_RATE));
> > +
> > +       *htotal_granularity = max(OVT_MIN_HTOTAL_GRANULARITY,
> > +                                 htotal_granularity_chunk);
> > +
> > +       if (min_htotal % *htotal_granularity)
> > +               min_htotal += *htotal_granularity - (min_htotal %
> > +                                                    *htotal_granularity);
> > +
> > +       return min_htotal;
> > +}
> > +
> > +static u64 calculate_ovt_pixel_clock_rate(const struct cta_rid *rid,
> > +                                         const u32 max_vrate,
> > +                                         const u32 min_hblank,
> > +                                         u32 min_htotal,
> > +                                         u32 min_vtotal,
> > +                                         const u32 htotal_granularity,
> > +                                         const u32 vtotal_granularity,
> > +                                         u32 *htotal, u32 *vtotal)
> > +{
> > +       u32 resolution_granularity;
> > +       u64 pixel_clock_rate;
> > +       u64 min_resolution;
> > +       u64 rem;
> > +       u32 h;
> > +       u64 r;
> > +       u32 v;
> > +
> > +       resolution_granularity = OVT_PIXEL_CLOCK_GRANULARITY /
> > +               gcd(OVT_PIXEL_CLOCK_GRANULARITY, max_vrate);
> > +
> > +       do {
> > +               /* step 5 */
> > +               min_resolution = 0;
> > +               v = min_vtotal;
> > +
> > +               goto loop_end;
> > +
> > +               while (!min_resolution || r <= min_resolution) {
> > +                       goto inner_loop_end;
> > +
> > +                       while (rem || div64_u64(max_vrate * r, (h & ~(h - 1))) >
> > +                              OVT_MAX_CHUNK_RATE) {
> > +                               h += htotal_granularity;
> > +                               r = (u64)h * (u64)v;
> > +inner_loop_end:
> > +                               div64_u64_rem(r, resolution_granularity, &rem);
> > +                       }
> > +
> > +                       if (!min_resolution || r < min_resolution) {
> > +                               *htotal = h;
> > +                               *vtotal = v;
> > +                               min_resolution = r;
> > +                       }
> > +
> > +                       v += vtotal_granularity;
> > +
> > +loop_end:
> > +                       h = min_htotal;
> > +                       r = (u64)h * (u64)v;
> > +               }
> > +
> > +               pixel_clock_rate = max_vrate * min_resolution;
> > +
> > +               /* step 6 */
> > +               min_htotal = rid->hactive + max(OVT_MIN_HBLANK_420,
> > +                                               OVT_PIXEL_FACTOR_420 *
> > +                                               min_hblank);
> > +
> > +       } while (pixel_clock_rate >= OVT_MIN_CLOCK_RATE_420 &&
> > +                *htotal < min_htotal);
> > +
> > +       return pixel_clock_rate;
> > +}
> > +
> > +static const struct cta_rid *find_rid(u8 rid)
> > +{
> > +       if (!rid || rid >= ARRAY_SIZE(rids))
> > +               return NULL;
> > +
> > +       return &rids[rid];
> > +}
> > +
> > +/* OVT Algorthim as specified in CTA-861-I */
> > +struct drm_display_mode *drm_ovt_mode(struct drm_device *dev, int r_id,
> > +                                     int vrefresh)
> > +{
> > +       const struct cta_rid *rid = find_rid(r_id);
> > +       struct drm_display_mode *mode;
> > +       u32 vtotal_granularity = 1;
> > +       u32 htotal_granularity;
> > +       u32 max_vrate = vrefresh;
> > +       u64 pixel_clock_rate;
> > +       u32 vsync_position;
> > +       u32 min_hblank;
> > +       u32 min_htotal;
> > +       u32 min_vtotal;
> > +       u32 htotal;
> > +       u32 vtotal;
> > +
> > +       if (!rid)
> > +               return NULL;
> > +
> > +       /* step 1 */
> > +       switch (vrefresh) {
> > +       case 24:
> > +       case 25:
> > +               max_vrate = 30;
> > +               fallthrough;
> > +       case 30:
> > +               vtotal_granularity = 20;
> > +               break;
> > +       case 48:
> > +       case 50:
> > +               max_vrate = 60;
> > +               fallthrough;
> > +       case 60:
> > +               vtotal_granularity = 20;
> > +               break;
> > +       case 100:
> > +               max_vrate = 120;
> > +               fallthrough;
> > +       case 120:
> > +               vtotal_granularity = 5;
> > +               break;
> > +       case 200:
> > +               max_vrate = 240;
> > +               fallthrough;
> > +       case 240:
> > +               vtotal_granularity = 5;
> > +               break;
> > +       case 300:
> > +               max_vrate = 360;
> > +               fallthrough;
> > +       case 360:
> > +               vtotal_granularity = 5;
> > +               break;
> > +       case 400:
> > +               max_vrate = 480;
> > +               fallthrough;
> > +       case 480:
> > +               vtotal_granularity = 5;
> > +               break;
> > +       }
> > +
> > +       min_vtotal = calculate_ovt_min_vtotal(rid, max_vrate,
> > +                                             vtotal_granularity);
> > +
> > +       min_htotal = calculate_ovt_min_htotal(rid, max_vrate, min_vtotal,
> > +                                             &min_hblank, &htotal_granularity);
> > +
> > +       pixel_clock_rate = calculate_ovt_pixel_clock_rate(rid, max_vrate,
> > +                                                         min_hblank,
> > +                                                         min_htotal,
> > +                                                         min_vtotal,
> > +                                                         htotal_granularity,
> > +                                                         vtotal_granularity,
> > +                                                         &htotal, &vtotal);
> > +
> > +       /* step 7 */
> > +       vtotal = vtotal * max_vrate / (u32)vrefresh;
> > +
> > +       /* step 8 */
> > +       vsync_position = max(OVT_MIN_VSYNC_LE_LINES,
> > +                            DIV64_U64_ROUND_UP((u64)OVT_MIN_VSYNC_LE_LINES *
> > +                                               pixel_clock_rate,
> > +                                               (u64)htotal * (u64)1000000));
> > +
> > +       mode = drm_mode_create(dev);
> > +
> > +       if (!mode)
> > +               return NULL;
> > +
> > +       /* step 10 */
> > +       mode->clock = div_u64(pixel_clock_rate, 1000);
> > +       mode->hdisplay = rid->hactive;
> > +       mode->hsync_start = htotal - OVT_HSYNC_WIDTH * 2;
> > +       mode->hsync_end = mode->hsync_start + OVT_HSYNC_WIDTH;
> > +       mode->htotal = htotal;
> > +
> > +       mode->vdisplay = rid->vactive;
> > +       mode->vsync_start = vtotal - vsync_position;
> > +       mode->vsync_end = mode->vsync_start + OVT_VSYNC_WIDTH;
> > +       mode->vtotal = vtotal;
> > +
> > +       return mode;
> > +}
> > +
> > +static u8 find_vic(u8 rid, int rate_idx)
> > +{
> > +       if (video_format_frame_rates[rate_idx] > 120 || !find_rid(rid))
> > +               return 0;
> > +
> > +       return rid_to_vic[rid][rate_idx - 1];
> > +}
> > +
> > +/* CTA-861 Video Format Data Block (CTA VFDB) */
> > +static int add_modes_from_vfdb(struct drm_connector *connector,
> > +                              const struct cea_db *db)
> > +{
> > +       const struct drm_display_info *info = &connector->display_info;
> > +       int vfdb_len = cea_db_payload_len(db);
> > +       struct drm_display_mode *mode;
> > +       struct cta_vfd vfd;
> > +       int num_modes = 0;
> > +       int rate_idx;
> > +       int vfd_len;
> > +       int rate;
> > +       int i;
> > +
> > +       if (!vfdb_len)
> > +               return 0;
> > +
> > +       vfd_len = (db->data[0] & 0x3);
> > +
> > +       if (!vfd_len)
> > +               return 0;
> > +
> > +       vfd_len++;
> > +       vfdb_len--;
> > +       vfdb_len -= (vfdb_len % vfd_len);
> > +
> > +       for (i = 0; i < vfdb_len; i += vfd_len) {
> > +               parse_cta_vfd(&vfd, &db->data[i + 1], vfd_len);
> > +
> > +               for (rate_idx = 1; rate_idx <
> > +                    ARRAY_SIZE(video_format_frame_rates); rate_idx++) {
> > +                       rate = video_format_frame_rates[rate_idx];
> > +
> > +                       if (!vfd_has_fr(&vfd, rate) || find_vic(vfd.rid,
> > +                                                               rate_idx))
> > +                               continue;
> > +
> > +                       mode = drm_ovt_mode(connector->dev, vfd.rid, rate);
> > +
> > +                       if (!mode)
> > +                               continue;
> > +
> > +                       mode->height_mm = info->height_mm;
> > +                       mode->width_mm = info->width_mm;
> > +
> > +                       drm_mode_probed_add(connector, mode);
> > +                       num_modes++;
> > +               }
> > +       }
> > +
> > +       return num_modes;
> > +}
> > +
> >  /*
> >   * CTA-861 YCbCr 4:2:0 Capability Map Data Block (CTA Y420CMDB)
> >   *
> > @@ -5318,6 +5781,8 @@ static int add_cea_modes(struct drm_connector *connector,
> >                         /* Add 4:2:0(only) modes present in EDID */
> >                         modes += do_y420vdb_modes(connector, vdb420,
> >                                                   cea_db_payload_len(db) - 1);
> > +               } else if (cea_db_tag(db) == CTA_DB_VIDEO_FORMAT) {
> > +                       modes += add_modes_from_vfdb(connector, db);
> >                 }
> >         }
> >         cea_db_iter_end(&iter);
> > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> > index eaac5e665892..78831207ec65 100644
> > --- a/include/drm/drm_edid.h
> > +++ b/include/drm/drm_edid.h
> > @@ -450,6 +450,9 @@ struct drm_display_mode *
> >  drm_display_mode_from_cea_vic(struct drm_device *dev,
> >                               u8 video_code);
> >
> > +struct drm_display_mode *drm_ovt_mode(struct drm_device *dev, int rid,
> > +                                     int vrefresh);
> > +
> >  /* Interface based on struct drm_edid */
> >  const struct drm_edid *drm_edid_alloc(const void *edid, size_t size);
> >  const struct drm_edid *drm_edid_dup(const struct drm_edid *drm_edid);
> > --
> > 2.46.1
> >
