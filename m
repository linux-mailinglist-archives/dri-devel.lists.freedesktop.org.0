Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D65B807AE8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 23:00:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B5210E7CC;
	Wed,  6 Dec 2023 22:00:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 474 seconds by postgrey-1.36 at gabe;
 Wed, 06 Dec 2023 17:31:46 UTC
Received: from bg2.exmail.qq.com (bg2.exmail.qq.com [114.132.197.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DFF10E775
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 17:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bbaa.fun;
 s=krwu2211; t=1701883901;
 bh=iZnK7m4fZ7e98vxh0afq/MQdKbR7QWZiPYSGAgsUuWc=;
 h=Message-ID:Date:MIME-Version:To:From:Subject;
 b=aDQGxB6U5UPa161a+4z2ET2JgrMSrNpM5PGdbKRYmQ7HvmkQjg32YFK0nQG9ipPcV
 1aiaXgusMlzERaxxn1XtjloF9UZHQWMpDOM1HKMJsrbW2cScipV6yUU/XtNW/niSe0
 vmghYyBRMc38WCGbc8TkDbFOLcdNnUndjALZPvcI=
X-QQ-mid: bizesmtp86t1701883416t4wj37ny
Received: from [172.19.0.1] ( [180.136.64.83]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 07 Dec 2023 01:23:35 +0800 (CST)
X-QQ-SSF: 0100000000000020D000000A0000000
X-QQ-FEAT: 7jw2iSiCazqZ6dSLb47h+W6s+UEIRpOyr02MNWu1I3midhLRAZ2AZypc9VefA
 /wzA04Jev//ABPDQTleeNhm/AhgMnqDztByo6/eO0LD8sXBG4SqoqPHxP29ls/irEb/aKsP
 bP4d6sRj04fuuOkT/8LCoj8SDsnk5Yp3/LjkpKahNm0E/33y4aQXj7YKhuUkJnmT+Jp1MvN
 +BfxRXVvhwtgoKlcwKrs82YuuXw/Bf6X3hrL5ze9nUURYcr7bY2vv4FY69uL29vSPfH5irx
 bAfc8/46raSw2MQMvrU/sN8hf6HRbdXcVJDlNGIE8Md9ae9anOdiQEvUIGebGLlopb/FI53
 NEe8p72TY1ttyqvmml1CNcVGVGjfw==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5791449306475714065
Content-Type: multipart/alternative;
 boundary="------------FiZjwmkMuOXPUHiGaV04bovv"
Message-ID: <57BBFAAD83255278+587e2f64-3507-4af9-bca4-43194400c68c@bbaa.fun>
Date: Thu, 7 Dec 2023 01:23:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
From: bbaa <bbaa@bbaa.fun>
Subject: [Bug Report] drm/edid: drm_edid_override_connector_update returns a
 incorrect value
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

This is a multi-part message in MIME format.
--------------FiZjwmkMuOXPUHiGaV04bovv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

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

NVIDIA MODULE:https://github.com/NVIDIA/open-gpu-kernel-modules/blob/4c29105/kernel-open/nvidia-drm/nvidia-drm-connector.c#L106



--------------FiZjwmkMuOXPUHiGaV04bovv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(0, 0, 51); white-space: pre-wrap; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Hello everyone,

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
  2316			drm_dbg_kms(connector-&gt;dev,
  2317				    "[CONNECTOR:%d:%s] adding %d modes via fallback override/firmware EDID\n",
  2318				    connector-&gt;base.id, connector-&gt;name, num_modes);
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
<span style="font-family:monospace"><span
    style="color:#000000;background-color:#ffffff;">   103  #if defined(NV_DRM_CONNECTOR_HAS_OVERRIDE_EDID)</span>
   104      if (connector-&gt;override_edid) {
   105  #else
   106      if (drm_edid_override_connector_update(connector) &gt; 0) {
   107  #endif
   108          const struct drm_property_blob *edid = connector-&gt;edid_blob_ptr;
   109


</span><span style="font-family:monospace">drm_edid_override_connector_update(connector)</span> will return zero here.

regards,
bbaa

NVIDIA MODULE: <a class="moz-txt-link-freetext" href="https://github.com/NVIDIA/open-gpu-kernel-modules/blob/4c29105/kernel-open/nvidia-drm/nvidia-drm-connector.c#L106">https://github.com/NVIDIA/open-gpu-kernel-modules/blob/4c29105/kernel-open/nvidia-drm/nvidia-drm-connector.c#L106</a>



</pre>
    <p></p>
    <p></p>
  </body>
</html>

--------------FiZjwmkMuOXPUHiGaV04bovv--
