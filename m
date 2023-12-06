Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B36807AE7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 23:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6F010E7C2;
	Wed,  6 Dec 2023 22:00:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 323 seconds by postgrey-1.36 at gabe;
 Wed, 06 Dec 2023 17:29:11 UTC
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.67.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3A510E113
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 17:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bbaa.fun;
 s=krwu2211; t=1701883743;
 bh=6L0aV80MpIMQg2v5Xc3R+ZHBxuMW5G2CI33EecTOYII=;
 h=Message-ID:Date:MIME-Version:From:Subject:To;
 b=mP28PRvKGwNvAJYY5rYxXAcoFA4AwMwyV2iriDMU0jLIntBFm60kqC4/jz53iTBCp
 lxceN4PYca35v0bDFfVm7aGFY2t+P+OaqlLQuxTYUX/jz4nAWo1DLrYSYfYMJvOM4r
 KMk3exHlbSU5LDUMpjeTSdO7Bua9rLD4dNyUnaHg=
X-QQ-mid: bizesmtp77t1701883740ty5ph78u
Received: from [172.19.0.1] ( [180.136.64.83]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 07 Dec 2023 01:28:59 +0800 (CST)
X-QQ-SSF: 0100000000000020D000000A0000000
X-QQ-FEAT: drHCGgIjzJeRUGRdfbDjWYjjJBYARogEeTBTHHGihUsYAekWhZED4JBBNP9v7
 6FYxsRtjQahzqsOFd6dhrLkr9z5DPEGnrbYIlzksn3ZW709akCCPboOoshcCJuSCPsJCWsB
 ej1Fr2qP6eIrFYHNqN89LDmawoCxqsLaCSmjN/QH5VaPnyJRPH1PiReeEhEtFg5tcNh0hez
 x3y4zoAKCo/yMVW1dv5eO3aDTYz57/s/4fDUlnk0PeFnIBVOT3jx/K6IgGcOTRMGyu0jGYr
 8SVG+M3H7rgABYzEofoymxWPImH+D18aLZ38z627gZ+fhrUWuYQPKo7xAvEp1d+wNb02gmH
 KxnBgQDGcfDJe7VDbHjTdOLXP1NP26LpMqs7K/c
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12811341502959775276
Message-ID: <930E9B4C7D91FDFF+29b34d89-8658-4910-966a-c772f320ea03@bbaa.fun>
Date: Thu, 7 Dec 2023 01:28:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: bbaa <bbaa@bbaa.fun>
Subject: [Bug Report] drm/edid: drm_edid_override_connector_update returns a
 incorrect value
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:bbaa.fun:qybglogicsvrgz:qybglogicsvrgz5a-0
X-Mailman-Approved-At: Wed, 06 Dec 2023 21:59:57 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello everyone,

drm_edid_override_connector_update seem return a incorrect value.

drivers/gpu/drm/drm_edid.c (Linux 6.7-rc4)
   2294	/**
   2295	 * drm_edid_override_connector_update - add modes from override/firmware EDID
   2296	 * @connector: connector we're probing
   2297	 *
   2298	 * Add modes from the override/firmware EDID, if available. Only to be used from
   2299	 * drm_helper_probe_single_connector_modes() as a fallback for when DDC probe
   2300	 * failed during drm_get_edid() and caused the override/firmware EDID to be
   2301	 * skipped.
   2302	 *
   2303	 * Return: The number of modes added or 0 if we couldn't find any.
   2304	 */
   2305	int drm_edid_override_connector_update(struct drm_connector *connector)
   2306	{
   2307		const struct drm_edid *override;
   2308		int num_modes = 0;
   2309	
   2310		override = drm_edid_override_get(connector);
   2311		if (override) {
   2312			num_modes = drm_edid_connector_update(connector, override);
   2313	
   2314			drm_edid_free(override);
   2315	
   2316			drm_dbg_kms(connector->dev,
   2317				    "[CONNECTOR:%d:%s] adding %d modes via fallback override/firmware EDID\n",
   2318				    connector->base.id, connector->name, num_modes);
   2319		}
   2320	
   2321		return num_modes;
   2322	}
   2323	EXPORT_SYMBOL(drm_edid_override_connector_update);

The comment describes that it will return the number of modes added
However the function calls drm_edid_connector_update, will return 0 upon successful execution.

drivers/gpu/drm/drm_edid.c
   6813	/**
   6814	 * drm_edid_connector_update - Update connector information from EDID
   6815	 * @connector: Connector
   6816	 * @drm_edid: EDID
   6817	 *
   6818	 * Update the connector display info, ELD, HDR metadata, relevant properties,
   6819	 * etc. from the passed in EDID.
   6820	 *
   6821	 * If EDID is NULL, reset the information.
   6822	 *
   6823	 * Must be called before calling drm_edid_connector_add_modes().
   6824	 *
   6825	 * Return: 0 on success, negative error on errors.
   6826	 */
   6827	int drm_edid_connector_update(struct drm_connector *connector,
   6828				      const struct drm_edid *drm_edid)
   6829	{
   6830		update_display_info(connector, drm_edid);
   6831	
   6832		_drm_update_tile_info(connector, drm_edid);
   6833	
   6834		return _drm_edid_connector_property_update(connector, drm_edid);
   6835	}
   6836	EXPORT_SYMBOL(drm_edid_connector_update);

This will break the EDID override behavior on Nvidia graphics cards.

NVIDIA/open-gpu-kernel-modules:
kernel-open/nvidia-drm/nvidia-drm-connector.c:
   103  #if defined(NV_DRM_CONNECTOR_HAS_OVERRIDE_EDID)   104      if 
(connector->override_edid) {   105  #else   106      if 
(drm_edid_override_connector_update(connector) > 0) {   107  #endif 
   108          const struct drm_property_blob *edid = 
connector->edid_blob_ptr;   109 
drm_edid_override_connector_update(connector)  will return zero here.

regards,
bbaa



