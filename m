Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD43CACC6FA
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 14:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD9010E1F0;
	Tue,  3 Jun 2025 12:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kZsJAs37";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986B310E5B8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 12:48:35 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9347D7;
 Tue,  3 Jun 2025 14:48:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1748954908;
 bh=1Qplk4074K4KUwW1LP3wsbOBRE+6V7jaRgPpvk5Qnjg=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=kZsJAs377KSjp8h3VYAiQR2pUOGgnFo6OGYdp6v0ucbhxKbE1vWmsLhOOQIy6sP85
 kjt02FlGmgkaijGh33JJEziRTNWOa6Zjgnn+zovuKB+dUt+72SdR6niEe46GAurfKA
 7dLLwfIEA0MXRtSGu/O6PSPUEslI8oav+E5sBGZk=
Message-ID: <9c2c151d-f210-4fbc-af7c-d6aa5838cede@ideasonboard.com>
Date: Tue, 3 Jun 2025 15:48:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 0/5] drm/atomic-helper: Re-order CRTC and Bridge ops
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250406131642.171240-1-aradhya.bhatia@linux.dev>
 <19101cd7-5b4d-416d-a00e-6657b81149a6@ideasonboard.com>
 <a6416d2c-c928-4adf-8441-070e2c443db1@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <a6416d2c-c928-4adf-8441-070e2c443db1@ideasonboard.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime, Maarten, Thomas,

(You're the first three names returned with get_maintainers.pl =), so:)

Ping on this.

 Tomi

On 26/05/2025 13:40, Tomi Valkeinen wrote:
> Hi Maxime, Maarten, Thomas,
> 
> On 16/05/2025 15:23, Tomi Valkeinen wrote:
>> Hi all,
>>
>> On 06/04/2025 16:16, Aradhya Bhatia wrote:
>>> Hello all,
>>>
>>> This series re-orders the sequences in which the drm CRTC and the drm
>>> Bridge get enabled and disabled with respect to each other.
>>>
>>> The bridge pre_enable calls have been shifted before the crtc_enable and
>>> the bridge post_disable calls have been shifted after the crtc_disable.
>>>
>>> This has been done as per the definition of bridge pre_enable.
>>> "The display pipe (i.e. clocks and timing signals) feeding this bridge
>>> will
>>> not yet be running when this callback is called".
>>>
>>> Since CRTC is also a source feeding the bridge, it should not be enabled
>>> before the bridges in the pipeline are pre_enabled.
>>
>> Any further comments to this?
>>
>> All the patches have been reviewed and tested. I can push this, along
>> with the serieses that depend on this, via drm-misc, but I'll need an
>> ack from a maintainer.
> 
> Would any of you have a moment to check this out and ack/apply? This
> series is blocking further development on DSI and OLDI.
> 
>  Tomi
> 
>>
>>  Tomi
>>
>>
>>> The original sequence. for display pipe enable looks like:
>>>
>>>        crtc_enable
>>>
>>>        bridge[n]_pre_enable
>>>        ...
>>>        bridge[1]_pre_enable
>>>
>>>        encoder_enable
>>>
>>>        bridge[1]_enable
>>>        ...
>>>        bridge[n]_enable
>>>
>>> The sequence of enable after this patch-set will look like:
>>>
>>>        bridge[n]_pre_enable
>>>        ...
>>>        bridge[1]_pre_enable
>>>
>>>        crtc_enable
>>>        encoder_enable
>>>
>>>        bridge[1]_enable
>>>        ...
>>>        bridge[n]_enable
>>>
>>>
>>> For the disable sequence, this is what the original looks like:
>>>
>>>        bridge[n]_disable
>>>        ...
>>>        bridge[1]_disable
>>>
>>>        encoder_disable
>>>
>>>        bridge[1]_post_disable
>>>        ...
>>>        bridge[n]_post_disable
>>>
>>>        crtc_disable
>>>     
>>> This is what the disable sequence will be, after this series of patches:
>>>
>>>        bridge[n]_disable
>>>        ...
>>>        bridge[1]_disable
>>>
>>>        encoder_disable
>>>        crtc_disable
>>>
>>>        bridge[1]_post_disable
>>>        ...
>>>        bridge[n]_post_disable
>>>
>>> This series further updates the bridge API definitions to accurately
>>> reflect the updated scenario.
>>>
>>> This series is a subset of its v11[0] which had 14 patches in the
>>> revision.
>>> 9 of those 14 patches (which were specific to the cdns-dsi bridge driver)
>>> were merged[1].
>>>
>>> Regards
>>> Aradhya
>>>
>>> ---
>>> * Note on checkpatch warning in patch 2/4 *
>>> Patch 2/4 causes the checkpatch to flare up for 1 checkpatch 'check' -
>>>
>>> CHECK: Lines should not end with a '('
>>> #79: FILE: drivers/gpu/drm/drm_atomic_helper.c:1304:
>>> +                       new_crtc_state = drm_atomic_get_new_crtc_state(
>>>
>>> This patch is largely duplicating the original code, with minor
>>> differences to
>>> perform different operations. This line of code pre-exists in the file
>>> and
>>> have simply been duplicated. I have decided to keep it as is to
>>> maintain the
>>> uniformity and the originally intended readability. Should perhaps a
>>> fix be
>>> required, this patch/series is not the right place, and another patch
>>> can be
>>> created to fix this across the whole file.
>>>
>>> References:
>>> [0]: Revision v11 of this series.
>>> https://lore.kernel.org/all/20250329113925.68204-1-
>>> aradhya.bhatia@linux.dev/
>>>
>>> [1]: Patches 1 through 9 getting merged.
>>> https://lore.kernel.org/
>>> all/174335361171.2556605.12634785416741695829.b4-ty@oss.qualcomm.com/
>>>
>>>
>>> ---
>>> Change Log:
>>>
>>>    - Changes in v12:
>>>      - Drop patches 1 through 9 since they have been merged.
>>>      - Rebase onto newer drm-misc-next.
>>>      - Re-word the patch 3/4, ("drm/bridge: Update the bridge enable/
>>> disable doc")
>>>        to make it more readable.
>>>
>>>    - Changes in v11:
>>>      - Add patch v11:13/14 ("drm/bridge: Update the bridge enable/
>>> disable doc"),
>>>        that updates the documentation about the order of the various
>>> bridge
>>>        enable/disable hooks being called wrt the CRTC and encoder hooks.
>>>      - Rebase on drm-misc-next instead of linux-next.
>>>        As part of rebase, accommodate the following change:
>>>        - Change patch v10:08/13 ("drm/bridge: cdns-dsi: Support atomic
>>> bridge
>>>          APIs") to v11:08/13 ("drm/bridge: cdns-dsi: Add input format
>>>          negotiation"), since Maxime has already updated the bridge
>>> hooks to
>>>          their atomic versions in commit 68c98e227a96 ("drm/bridge:
>>> cdns-csi:
>>>          Switch to atomic helpers").
>>>          My new patch now only adds the format negotiation hook for
>>> the cdns-dsi.
>>>          (Note: Since the new patch is now only a subset of the old
>>> one, without
>>>          any change in logic, I decided to carry forward the R-b and
>>> T-b tags.)
>>>      - Add Alexander Sverdlin's T-b in patches 10, 11, 12.
>>>
>>>    - Changes in v10:
>>>      - Rebase on latest linux-next (next-20250226).
>>>      - As part of rebase, update the patches to accommodate a couple of
>>>        widespread changes in DRM Framework -
>>>          - All the ("drm/atomic-helper: Change parameter name of ***")
>>> commits.
>>>          - All the ("drm/bridge: Pass full state to ***") commits.
>>>        (These updates are only trivial substitutions.)
>>>      - Add Tomi Valkeinen's T-b tags in all the patches.
>>>
>>>    - Changes in v9:
>>>      - Fix the oops in 11/13 - where the encoder_bridge_enable _was_
>>> pre_enabling
>>>        the bridges instead of enabling.
>>>      - Add the following tags:
>>>        - Dmitry Baryshkov's R-b in patches 2, 10, 11, and A-b in patch
>>> 12.
>>>        - Jayesh Choudhary's R-b in patch 12.
>>>        - Tomi Valkeinen's R-b in patches 2, 10, 11, 12.
>>>
>>>    - Changes in v8:
>>>      - Move the phy de-initialization to bridge post_disable() instead
>>> of bridge
>>>        disable() in patch-3.
>>>      - Copy the private bridge state (dsi_cfg), in addition to the
>>> bridge_state,
>>>        in patch-9.
>>>      - Split patch v7:11/12 into three patches, v8:{10,11,12}/13, to
>>> separate out
>>>        different refactorings into different patches, and improve
>>> bisectability.
>>>      - Move patch v7:02/12 down to v8:06/12, to keep the initial
>>> patches for
>>>        fixes only.
>>>      - Drop patch v7:04/12 as it doesn't become relevant until patch
>>> v7:12/12.
>>>      - Add R-b tags of Dmitry Baryshkov in patch-9 and patch-3, and of
>>>        Tomi Valkeinen in patch-9.
>>>        - Changes in v7:
>>>      - phy_init()/exit() were called from the PM path in v6. Change it
>>> back to
>>>        the bridge enable/disable path in patch-3, so that the
>>> phy_init() can go
>>>        back to being called after D-Phy reset assert.
>>>      - Reword commit text in patch-5 to explain the need of the fix.
>>>      - Drop the stray code in patch-10.
>>>      - Add R-b tag of Dmitry Baryshkov in patch-6.
>>>
>>>    - Changes in v6:
>>>      - Reword patch 3 to better explain the fixes around phy de-init.
>>>      - Fix the Lane ready timeout condition in patch 7.
>>>      - Fix the dsi _bridge_atomic_check() implementation by adding a new
>>>        bridge state structure in patch 10.
>>>      - Rework and combine patches v5:11/13 and v5:12/13 to v6:11/12.
>>>      - Generate the patches of these series using the "patience"
>>> algorithm.
>>>        Note: All patches, except v6:11/12, *do not* differ from their
>>> default
>>>        (greedy) algorithm variants.
>>>        For patch 11, the patience algorithm significantly improves the
>>> readability.
>>>      - Rename and move the Bridge enable/disable enums from public to
>>> private
>>>        in patch 11.
>>>      - Add R-b tags of Tomi Valkeinen in patch 6, and Dmitry Baryshkov
>>> in patch 2.
>>>
>>>    - Changes in v5:
>>>      - Fix subject and description in patch 1/13.
>>>      - Add patch to check the return value of
>>>        phy_mipi_dphy_get_default_config() (patch: 6/13).
>>>      - Change the Clk and Data Lane ready timeout from forever to 5s.
>>>      - Print an error instead of calling WARN_ON_ONCE in patch 7/13.
>>>      - Drop patch v4-07/11: "drm/bridge: cdns-dsi: Reset the DCS write
>>> FIFO".
>>>        There has been some inconsistencies found with this patch upon
>>> further
>>>        testing. This patch was being used to enable a DSI panel based
>>> on ILITEK
>>>        ILI9881C bridge. This will be debugged separately.
>>>      - Add patch to move the DSI mode check from _atomic_enable() to
>>>        _atomic_check() (patch: 10/13).
>>>      - Split patch v4-10/11 into 2 patches - 11/13 and 12/13.
>>>        Patch 11/13 separates out the Encoder-Bridge operations into a
>>> helper
>>>        function *without* changing the logic. Patch 12/13 then changes
>>> the order
>>>        of the encoder-bridge operations as was intended in the
>>> original patch.
>>>      - Add detailed comment for patch 13/13.
>>>      - Add Tomi Valkeinen's R-b in patches 1, 2, 4, 5, 7, 8, 9, 13.
>>>
>>>    - Changes in v4:
>>>      - Add new patch, "drm/bridge: cdns-dsi: Move to
>>> devm_drm_of_get_bridge()",
>>>        to update to an auto-managed way of finding next bridge in the
>>> chain.
>>>      - Drop patch "drm/bridge: cdns-dsi: Fix the phy_initialized
>>> variable" and
>>>        add "drm/bridge: cdns-dsi: Fix Phy _init() and _exit()" that
>>> properly
>>>        de-initializes the Phy and maintains the initialization state.
>>>      - Reword patch "drm/bridge: cdns-dsi: Reset the DCS write FIFO"
>>> to explain
>>>        the HW concerns better.
>>>      - Add R-b tag from Dmitry Baryshkov for patches 1/11 and 8/11.
>>>
>>>    - Changes in v3:
>>>      - Reword the commit message for patch "drm/bridge: cdns-dsi: Fix
>>> OF node
>>>        pointer".
>>>      - Add a new helper API to figure out DSI host input pixel format
>>>        in patch "drm/mipi-dsi: Add helper to find input format".
>>>      - Use a common function for bridge pre-enable and enable, and
>>> bridge disable
>>>        and post-disable, to avoid code duplication.
>>>      - Add T-b tag from Dominik Haller in patch 5/10. (Missed to add
>>> it in v2).
>>>      - Add R-b tag from Dmitry Baryshkov for patch 8/10.
>>>
>>>    - Changes in v2:
>>>      - Drop patch "drm/tidss: Add CRTC mode_fixup"
>>>      - Split patch "drm/bridge: cdns-dsi: Fix minor bugs" into 4
>>> separate ones
>>>      - Drop support for early_enable/late_disable APIs and instead re-
>>> order the
>>>        pre_enable / post_disable APIs to be called before / after
>>> crtc_enable /
>>>        crtc_disable.
>>>      - Drop support for early_enable/late_disable in cdns-dsi and use
>>>        pre_enable/post_disable APIs instead to do bridge enable/disable.
>>>
>>>
>>> Previous versions:
>>>
>>> v1:  https://lore.kernel.org/all/20240511153051.1355825-1-a-
>>> bhatia1@ti.com/
>>> v2:  https://lore.kernel.org/all/20240530093621.1925863-1-a-
>>> bhatia1@ti.com/
>>> v3:  https://lore.kernel.org/all/20240617105311.1587489-1-a-
>>> bhatia1@ti.com/
>>> v4:  https://lore.kernel.org/all/20240622110929.3115714-1-a-
>>> bhatia1@ti.com/
>>> v5:  https://lore.kernel.org/all/20241019195411.266860-1-
>>> aradhya.bhatia@linux.dev/
>>> v6:  https://lore.kernel.org/all/20250111192738.308889-1-
>>> aradhya.bhatia@linux.dev/
>>> v7:  https://lore.kernel.org/all/20250114055626.18816-1-
>>> aradhya.bhatia@linux.dev/
>>> v8:  https://lore.kernel.org/all/20250126191551.741957-1-
>>> aradhya.bhatia@linux.dev/
>>> v9:  https://lore.kernel.org/all/20250209121032.32655-1-
>>> aradhya.bhatia@linux.dev/
>>> v10: https://lore.kernel.org/all/20250226155228.564289-1-
>>> aradhya.bhatia@linux.dev/
>>> v11: https://lore.kernel.org/all/20250329113925.68204-1-
>>> aradhya.bhatia@linux.dev/
>>>
>>> ---
>>>
>>> Aradhya Bhatia (5):
>>>    drm/atomic-helper: Refactor crtc & encoder-bridge op loops into
>>>      separate functions
>>>    drm/atomic-helper: Separate out bridge pre_enable/post_disable from
>>>      enable/disable
>>>    drm/atomic-helper: Re-order bridge chain pre-enable and post-disable
>>>    drm/bridge: Update the bridge enable/disable doc
>>>    drm/bridge: cdns-dsi: Use pre_enable/post_disable to enable/disable
>>>
>>>   .../gpu/drm/bridge/cadence/cdns-dsi-core.c    |  64 +++--
>>>   drivers/gpu/drm/drm_atomic_helper.c           | 160 +++++++++--
>>>   include/drm/drm_bridge.h                      | 249 +++++++++++++-----
>>>   3 files changed, 355 insertions(+), 118 deletions(-)
>>>
>>>
>>> base-commit: dd717762761807452ca25634652e180a80349cd8
>>
> 

