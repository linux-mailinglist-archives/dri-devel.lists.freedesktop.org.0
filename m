Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C526C325C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 14:12:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0279110E154;
	Tue, 21 Mar 2023 13:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAC010E0E8
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 13:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679404353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eWFUnBtyx/hu3aRB6Qds/QASdRiQBFm/RsXbD7zPrs8=;
 b=Jilm9lR3RjM0li9w23ba2zYN1oCEwoywN+l0AnCKBt01N+7fANolIrgQU8cTI1matMmab5
 F9SOD653S9gpliXZVzVYFoGFPjjF9J3QLf/RCXg3OjuTg0uDH+6E1vuUvssj9kIOIK9BXl
 MSNGo4Cv1MaqAadbYwYbFJFsnE0Eixs=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-neG8t583PMeZkWTCIwD1JQ-1; Tue, 21 Mar 2023 09:12:31 -0400
X-MC-Unique: neG8t583PMeZkWTCIwD1JQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 be36-20020a05651c172400b00295aa1d0db6so4076050ljb.21
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 06:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679404350;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eWFUnBtyx/hu3aRB6Qds/QASdRiQBFm/RsXbD7zPrs8=;
 b=l9KpxhyBPhmt058YgBc49YoLj/mGjBAtXKDxIe/I7HJocdijwDpgr6f3dR58/j2wik
 ZD1r15dUCkGjoIpg6eD5SeSj9BewLg/hJ66HaXTKCEYQSa9DzP5hWhXvZ/TDPBiipvrx
 hnuyrEBwIed+M2giqk+K+qVkVcPYWYcHelGmaSPEIN/FMy4A87M5mDzriZiEWjX6FNwZ
 hTTZSASYOsVfKorHXsPZw3KzTPGW2jvhbMp5DmSZU9+YUqY4ui9KPpNzjLCl9aXef3EN
 yzYaEaFjWnc2EguGwfeAIRUjs845fyLr6j2L+x6Tg44xnr3mh8iMZx96wyZopbDHcxXe
 bKDQ==
X-Gm-Message-State: AO0yUKUB8cSaWURvvHzVrk3Lr0BLxkRCluWH1rPJahvozj1TNu6T0Gda
 srsRf1fEj8OBmYTYMMAtGL+GQzCK4oMwr11TdMgvGRoGCR0F3pEKRTnbXfkK/SBPalCGCGzcLNc
 d0/cafWfYuCtdLKlYLOx3f45+Tb1DDLgXyAfyeFCrmGRY
X-Received: by 2002:a2e:9257:0:b0:299:ac4e:a8ad with SMTP id
 v23-20020a2e9257000000b00299ac4ea8admr867814ljg.1.1679404350533; 
 Tue, 21 Mar 2023 06:12:30 -0700 (PDT)
X-Google-Smtp-Source: AK7set/KbT8OnF5ZSrDD+joOOnVNq3dH1Zkr9qSjkGdKShhAj9uhTOGz8Y5fZZNQQMsXpTyWmZgzXbQ4rHZgY2BfE9w=
X-Received: by 2002:a2e:9257:0:b0:299:ac4e:a8ad with SMTP id
 v23-20020a2e9257000000b00299ac4ea8admr867802ljg.1.1679404350223; Tue, 21 Mar
 2023 06:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230113162428.33874-1-harry.wentland@amd.com>
In-Reply-To: <20230113162428.33874-1-harry.wentland@amd.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Tue, 21 Mar 2023 14:12:19 +0100
Message-ID: <CA+hFU4xASm0wTs98HpqTfJjcsq24WX6uULTnfXobW75bWSzJ1A@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] Enable Colorspace connector property in amdgpu
To: Harry Wentland <harry.wentland@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 dri-devel@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

FWIW, I still think this series is good (minus the UAPI changes) and
would allow us to work on user space HDR support without custom
kernels.

On Fri, Jan 13, 2023 at 5:24=E2=80=AFPM Harry Wentland <harry.wentland@amd.=
com> wrote:
>
> This patchset enables the DP and HDMI infoframe properties
> in amdgpu.
>
> The first two patches are not completely related to the rest. The
> first patch allows for HDR_OUTPUT_METADATA with EOTFs that are
> unknown in the kernel.
>
> The second one prints a connector's max_bpc as part of the atomic
> state debugfs print.
>
> The following patches rework the connector colorspace code to
> 1) allow for easy printing of the colorspace in the drm_atomic
>    state debugfs, and
> 2) allow drivers to specify the supported colorspaces on a
>    connector.
>
> The rest of the patches deal with the Colorspace enablement
> in amdgpu.
>
> Why do drivers need to specify supported colorspaces? The amdgpu
> driver needs support for RGB-to-YCbCr conversion when we drive
> the display in YCbCr. This is currently not implemented for all
> colorspaces.
>
> Since the Colorspace property didn't have an IGT test I added
> one to kms_hdr. The relevant patchset can be found on the IGT
> mailing list or on
> https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/hdr-colorim=
etry
>
> We tested v1 of the patchset and confirmed that the infoframes
> are as expected for both DP and HDMI when running the IGT
> colorimetry tests.
>
> Open Items
> ----------
>
> A couple comments from Pekka about colorspace documentation are
> left unaddressed. I hope they won't block merging this set but
> should still be addressed separately.
>
> Pekka's questions really got me thinking of how this colorspace
> property should be used and working with it more closely with
> Joshua who is enabling HDR in gamescope made me wonder even more.
>
> Uma, is there a (canonical, upstream) userspace that uses this
> property that I can look at to understand more?
>
> One of the key challenges that is currently not addressed is that
> userspace is expected to pick a colorspace format straight from the
> list of definitions out of the DP or HDMI spec. But the kernel
> driver are the ones deciding on the output encoding (RGB, YCBCR444,
> YCBCR420, etc.). So there is no way for userspace to decide correctly
> between, for example, BT2020_RGB, BT2020_CYCC, BT2020_YCC.
>
> So we end up in a scenario where gamescope sets BT2020_RGB but we
> output YCBCR444 so have to correct the colorspace value to
> BT2020_YCC. This in turn breaks the colorspace IGT tests I
> wrote. I don't think "fixing" the IGT tests to accept this is
> the right thing to do.
>
> The way it stands this patchset allows us to specify the output
> colorspace on amdgpu and we try to do the right thing, but I don't
> thing the way the colorspace property is defined is right. We're trying
> to expose things to userspace that should be under driver control. A
> much better approach would be to give userspace options for colorspace
> that are not tied to DP or HDMI specs, i.e., sRGB, BT709, BT2020, etc.,
> and have the driver do the right thing to fill the infoframe, e.g., by
> picking BT2020_YCC if the requested colorspace is BT2020 and the
> is YCBCR444.
>
> If no upstream userspace currently makes use of this property I
> can make that change, i.e., no longer tie the colorspace property
> directly to the infoframe and reduce the options to sRGB, BT709,
> BT601, and BT2020 (and possibly opRGB).
>
> v2:
> - Tested with DP and HDMI analyzers
> - Confirmed driver will fallback to lower bpc when needed
> - Dropped hunk to set HDMI AVI infoframe as it was a no-op
> - Fixed BT.2020 YCbCr colorimetry (JoshuaAshton)
> - Simplify initialization of supported colorspaces (Jani)
> - Fix kerneldoc (kernel test robot)
>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Michel D=C3=A4nzer <michel.daenzer@mailbox.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
>
> Harry Wentland (16):
>   drm/display: Don't block HDR_OUTPUT_METADATA on unknown EOTF
>   drm/connector: print max_requested_bpc in state debugfs
>   drm/connector: Drop COLORIMETRY_NO_DATA
>   drm/connector: Convert DRM_MODE_COLORIMETRY to enum
>   drm/connector: Pull out common create_colorspace_property code
>   drm/connector: Allow drivers to pass list of supported colorspaces
>   drm/connector: Print connector colorspace in state debugfs
>   drm/amd/display: Always pass connector_state to stream validation
>   drm/amd/display: Register Colorspace property for DP and HDMI
>   drm/amd/display: Signal mode_changed if colorspace changed
>   drm/amd/display: Send correct DP colorspace infopacket
>   drm/amd/display: Add support for explicit BT601_YCC
>   drm/amd/display: Add debugfs for testing output colorspace
>   drm/amd/display: Add default case for output_color_space switch
>   drm/amd/display: Don't restrict bpc to 8 bpc
>   drm/amd/display: Format input and output CSC matrix
>
> Joshua Ashton (5):
>   drm/amd/display: Always set crtcinfo from create_stream_for_sink
>   drm/amd/display: Fallback to 2020_YCBCR if the pixel encoding is not
>     RGB
>   drm/amd/display: Refactor avi_info_frame colorimetry determination
>   drm/amd/display: Calculate output_color_space after pixel encoding
>     adjustment
>   drm/amd/display: Fix COLOR_SPACE_YCBCR2020_TYPE matrix
>
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  90 ++++++---
>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  57 ++++++
>  .../drm/amd/display/dc/core/dc_hw_sequencer.c |  38 ++--
>  .../gpu/drm/amd/display/dc/core/dc_resource.c |  28 ++-
>  drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |  54 +++--
>  drivers/gpu/drm/display/drm_hdmi_helper.c     |   8 +-
>  drivers/gpu/drm/drm_atomic.c                  |   2 +
>  drivers/gpu/drm/drm_connector.c               | 189 ++++++++++--------
>  .../gpu/drm/i915/display/intel_connector.c    |   4 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                |   2 +-
>  include/drm/display/drm_dp.h                  |   2 +-
>  include/drm/drm_connector.h                   |  57 +++---
>  12 files changed, 345 insertions(+), 186 deletions(-)
>
> --
> 2.39.0
>

