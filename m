Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B88F7979541
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2024 09:55:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1B010E2DD;
	Sun, 15 Sep 2024 07:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FGrbHN+P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6809810E2DA;
 Sun, 15 Sep 2024 07:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726386943; x=1757922943;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PufssB3I2tMkXbhYle1zSk98DVcTwT73ZLV58VhkH+I=;
 b=FGrbHN+PHNeRcGbmTpG8ChJIEniyZhRTzsaFGL8mBx/VyAXuP85iKIbo
 B4RXLS5b/eF3Y2Vx+jP26MGtHSTdiTGNYL2npxWw0j56kBgIBTX+R+FLb
 iLQ3N6iUQMRUNEJnGLD5nPlPlKD//6t/ENfo29iFsNlJHsxsBtyE034AZ
 X/1c7WFvmC7Vldw7bXpXeh4i0xxecL4s5hgKmVUMdqsCr399lNetrybPH
 5cDZ0/zVIrwsh0yvkn78gEBx9DPEnDPkjzMlbbsfrC7HtCn/vR2MwgC0g
 TfWLWY9QrhYouiotp6IlP9uf1MRM3RZIBZhldxnLmZYVZi9PqmFTJVBd8 Q==;
X-CSE-ConnectionGUID: l0A+HCueRB6pcXMOP7cheQ==
X-CSE-MsgGUID: 2ITKaERTQZKy4wdboJjq7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="42757393"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; d="scan'208";a="42757393"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2024 00:55:39 -0700
X-CSE-ConnectionGUID: 5qBhNywuRJu7S2M2nXVNrQ==
X-CSE-MsgGUID: RxvnlLTfQFanKhyrYp3jzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; d="scan'208";a="106017552"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 15 Sep 2024 00:55:37 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1spk6Y-0008Vc-0A;
 Sun, 15 Sep 2024 07:55:34 +0000
Date: Sun, 15 Sep 2024 15:54:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <superm1@kernel.org>, Alex Hung <alex.hung@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Melissa Wen <mwen@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, kernel-dev@igalia.com,
 Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v6 01/10] drm/amd/display: switch amdgpu_dm_connector to
 use struct drm_edid
Message-ID: <202409151547.hCDVOK5L-lkp@intel.com>
References: <20240911213537.2338164-2-superm1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911213537.2338164-2-superm1@kernel.org>
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

Hi Mario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on amd-pstate/linux-next]
[also build test WARNING on amd-pstate/bleeding-edge linus/master v6.11-rc7 next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/drm-amd-display-switch-amdgpu_dm_connector-to-use-struct-drm_edid/20240912-093827
base:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git linux-next
patch link:    https://lore.kernel.org/r/20240911213537.2338164-2-superm1%40kernel.org
patch subject: [PATCH v6 01/10] drm/amd/display: switch amdgpu_dm_connector to use struct drm_edid
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240915/202409151547.hCDVOK5L-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409151547.hCDVOK5L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409151547.hCDVOK5L-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:11976: warning: Function parameter or struct member 'drm_edid' not described in 'amdgpu_dm_update_freesync_caps'
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:11976: warning: Excess function parameter 'edid' description in 'amdgpu_dm_update_freesync_caps'


vim +11976 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

f9b4f20c4777bd Stylon Wang          2020-12-04  11962  
c620e79bb695b8 Rodrigo Siqueira     2022-02-21  11963  /**
c620e79bb695b8 Rodrigo Siqueira     2022-02-21  11964   * amdgpu_dm_update_freesync_caps - Update Freesync capabilities
c620e79bb695b8 Rodrigo Siqueira     2022-02-21  11965   *
41ee1f18ef5239 Alex Deucher         2022-08-30  11966   * @connector: Connector to query.
41ee1f18ef5239 Alex Deucher         2022-08-30  11967   * @edid: EDID from monitor
c620e79bb695b8 Rodrigo Siqueira     2022-02-21  11968   *
c620e79bb695b8 Rodrigo Siqueira     2022-02-21  11969   * Amdgpu supports Freesync in DP and HDMI displays, and it is required to keep
c620e79bb695b8 Rodrigo Siqueira     2022-02-21  11970   * track of some of the display information in the internal data struct used by
c620e79bb695b8 Rodrigo Siqueira     2022-02-21  11971   * amdgpu_dm. This function checks which type of connector we need to set the
c620e79bb695b8 Rodrigo Siqueira     2022-02-21  11972   * FreeSync parameters.
c620e79bb695b8 Rodrigo Siqueira     2022-02-21  11973   */
98e6436d3af5fe Anthony Koo          2018-08-21  11974  void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
c8133532d2e08c Melissa Wen          2024-09-11  11975  				    const struct drm_edid *drm_edid)
e7b07ceef2a650 Harry Wentland       2017-08-10 @11976  {
eb0709ba077a21 Souptick Joarder     2021-02-23  11977  	int i = 0;
c8133532d2e08c Melissa Wen          2024-09-11  11978  	const struct detailed_timing *timing;
c8133532d2e08c Melissa Wen          2024-09-11  11979  	const struct detailed_non_pixel *data;
c8133532d2e08c Melissa Wen          2024-09-11  11980  	const struct detailed_data_monitor_range *range;
c84dec2fe8837f Harry Wentland       2017-09-05  11981  	struct amdgpu_dm_connector *amdgpu_dm_connector =
c84dec2fe8837f Harry Wentland       2017-09-05  11982  			to_amdgpu_dm_connector(connector);
bb47de73666188 Nicholas Kazlauskas  2018-10-04  11983  	struct dm_connector_state *dm_con_state = NULL;
9ad544670514e2 Colin Ian King       2021-08-29  11984  	struct dc_sink *sink;
534eee82356c22 Srinivasan Shanmugam 2023-11-12  11985  	struct amdgpu_device *adev = drm_to_adev(connector->dev);
f9b4f20c4777bd Stylon Wang          2020-12-04  11986  	struct amdgpu_hdmi_vsdb_info vsdb_info = {0};
c8133532d2e08c Melissa Wen          2024-09-11  11987  	const struct edid *edid;
c620e79bb695b8 Rodrigo Siqueira     2022-02-21  11988  	bool freesync_capable = false;
5b49da02ddbe1b Sung Joon Kim        2023-01-12  11989  	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
b830ebc910f641 Harry Wentland       2017-07-26  11990  
8218d7f1f70179 Harry Wentland       2017-10-17  11991  	if (!connector->state) {
8218d7f1f70179 Harry Wentland       2017-10-17  11992  		DRM_ERROR("%s - Connector has no state", __func__);
bb47de73666188 Nicholas Kazlauskas  2018-10-04  11993  		goto update;
8218d7f1f70179 Harry Wentland       2017-10-17  11994  	}
8218d7f1f70179 Harry Wentland       2017-10-17  11995  
9b2fdc33218933 Aurabindo Pillai     2021-08-11  11996  	sink = amdgpu_dm_connector->dc_sink ?
9b2fdc33218933 Aurabindo Pillai     2021-08-11  11997  		amdgpu_dm_connector->dc_sink :
9b2fdc33218933 Aurabindo Pillai     2021-08-11  11998  		amdgpu_dm_connector->dc_em_sink;
9b2fdc33218933 Aurabindo Pillai     2021-08-11  11999  
c8133532d2e08c Melissa Wen          2024-09-11  12000  	if (!drm_edid || !sink) {
98e6436d3af5fe Anthony Koo          2018-08-21  12001  		dm_con_state = to_dm_connector_state(connector->state);
98e6436d3af5fe Anthony Koo          2018-08-21  12002  
98e6436d3af5fe Anthony Koo          2018-08-21  12003  		amdgpu_dm_connector->min_vfreq = 0;
98e6436d3af5fe Anthony Koo          2018-08-21  12004  		amdgpu_dm_connector->max_vfreq = 0;
9b2fdc33218933 Aurabindo Pillai     2021-08-11  12005  		connector->display_info.monitor_range.min_vfreq = 0;
9b2fdc33218933 Aurabindo Pillai     2021-08-11  12006  		connector->display_info.monitor_range.max_vfreq = 0;
9b2fdc33218933 Aurabindo Pillai     2021-08-11  12007  		freesync_capable = false;
98e6436d3af5fe Anthony Koo          2018-08-21  12008  
bb47de73666188 Nicholas Kazlauskas  2018-10-04  12009  		goto update;
98e6436d3af5fe Anthony Koo          2018-08-21  12010  	}
98e6436d3af5fe Anthony Koo          2018-08-21  12011  
8218d7f1f70179 Harry Wentland       2017-10-17  12012  	dm_con_state = to_dm_connector_state(connector->state);
8218d7f1f70179 Harry Wentland       2017-10-17  12013  
e7b07ceef2a650 Harry Wentland       2017-08-10  12014  	if (!adev->dm.freesync_module)
bb47de73666188 Nicholas Kazlauskas  2018-10-04  12015  		goto update;
f9b4f20c4777bd Stylon Wang          2020-12-04  12016  
c8133532d2e08c Melissa Wen          2024-09-11  12017  	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
c8133532d2e08c Melissa Wen          2024-09-11  12018  
a638b837d0e605 Tom Chung            2024-06-14  12019  	/* Some eDP panels only have the refresh rate range info in DisplayID */
a638b837d0e605 Tom Chung            2024-06-14  12020  	if ((connector->display_info.monitor_range.min_vfreq == 0 ||
a638b837d0e605 Tom Chung            2024-06-14  12021  	     connector->display_info.monitor_range.max_vfreq == 0))
a638b837d0e605 Tom Chung            2024-06-14  12022  		parse_edid_displayid_vrr(connector, edid);
a638b837d0e605 Tom Chung            2024-06-14  12023  
2f14c0c8cae8e9 Mario Limonciello    2024-03-05  12024  	if (edid && (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
2f14c0c8cae8e9 Mario Limonciello    2024-03-05  12025  		     sink->sink_signal == SIGNAL_TYPE_EDP)) {
f9b4f20c4777bd Stylon Wang          2020-12-04  12026  		bool edid_check_required = false;
f9b4f20c4777bd Stylon Wang          2020-12-04  12027  
2f14c0c8cae8e9 Mario Limonciello    2024-03-05  12028  		if (is_dp_capable_without_timing_msa(adev->dm.dc,
2f14c0c8cae8e9 Mario Limonciello    2024-03-05  12029  						     amdgpu_dm_connector)) {
2f14c0c8cae8e9 Mario Limonciello    2024-03-05  12030  			if (edid->features & DRM_EDID_FEATURE_CONTINUOUS_FREQ) {
2f14c0c8cae8e9 Mario Limonciello    2024-03-05  12031  				amdgpu_dm_connector->min_vfreq = connector->display_info.monitor_range.min_vfreq;
2f14c0c8cae8e9 Mario Limonciello    2024-03-05  12032  				amdgpu_dm_connector->max_vfreq = connector->display_info.monitor_range.max_vfreq;
9023ec5d55f399 Tom Chung            2024-06-19  12033  				if (amdgpu_dm_connector->max_vfreq -
9023ec5d55f399 Tom Chung            2024-06-19  12034  				    amdgpu_dm_connector->min_vfreq > 10)
9023ec5d55f399 Tom Chung            2024-06-19  12035  					freesync_capable = true;
2f14c0c8cae8e9 Mario Limonciello    2024-03-05  12036  			} else {
2f14c0c8cae8e9 Mario Limonciello    2024-03-05  12037  				edid_check_required = edid->version > 1 ||
2f14c0c8cae8e9 Mario Limonciello    2024-03-05  12038  						      (edid->version == 1 &&
2f14c0c8cae8e9 Mario Limonciello    2024-03-05  12039  						       edid->revision > 1);
2f14c0c8cae8e9 Mario Limonciello    2024-03-05  12040  			}
e7b07ceef2a650 Harry Wentland       2017-08-10  12041  		}
f9b4f20c4777bd Stylon Wang          2020-12-04  12042  
2f14c0c8cae8e9 Mario Limonciello    2024-03-05  12043  		if (edid_check_required) {
e7b07ceef2a650 Harry Wentland       2017-08-10  12044  			for (i = 0; i < 4; i++) {
e7b07ceef2a650 Harry Wentland       2017-08-10  12045  
e7b07ceef2a650 Harry Wentland       2017-08-10  12046  				timing	= &edid->detailed_timings[i];
e7b07ceef2a650 Harry Wentland       2017-08-10  12047  				data	= &timing->data.other_data;
e7b07ceef2a650 Harry Wentland       2017-08-10  12048  				range	= &data->data.range;
e7b07ceef2a650 Harry Wentland       2017-08-10  12049  				/*
e7b07ceef2a650 Harry Wentland       2017-08-10  12050  				 * Check if monitor has continuous frequency mode
e7b07ceef2a650 Harry Wentland       2017-08-10  12051  				 */
e7b07ceef2a650 Harry Wentland       2017-08-10  12052  				if (data->type != EDID_DETAIL_MONITOR_RANGE)
e7b07ceef2a650 Harry Wentland       2017-08-10  12053  					continue;
e7b07ceef2a650 Harry Wentland       2017-08-10  12054  				/*
e7b07ceef2a650 Harry Wentland       2017-08-10  12055  				 * Check for flag range limits only. If flag == 1 then
e7b07ceef2a650 Harry Wentland       2017-08-10  12056  				 * no additional timing information provided.
e7b07ceef2a650 Harry Wentland       2017-08-10  12057  				 * Default GTF, GTF Secondary curve and CVT are not
e7b07ceef2a650 Harry Wentland       2017-08-10  12058  				 * supported
e7b07ceef2a650 Harry Wentland       2017-08-10  12059  				 */
e7b07ceef2a650 Harry Wentland       2017-08-10  12060  				if (range->flags != 1)
e7b07ceef2a650 Harry Wentland       2017-08-10  12061  					continue;
e7b07ceef2a650 Harry Wentland       2017-08-10  12062  
a0ffc3fd67e72b Stylon Wang          2021-01-05  12063  				connector->display_info.monitor_range.min_vfreq = range->min_vfreq;
a0ffc3fd67e72b Stylon Wang          2021-01-05  12064  				connector->display_info.monitor_range.max_vfreq = range->max_vfreq;
a0ffc3fd67e72b Stylon Wang          2021-01-05  12065  
68e05b932dcba9 Alex Deucher         2024-02-28  12066  				if (edid->revision >= 4) {
68e05b932dcba9 Alex Deucher         2024-02-28  12067  					if (data->pad2 & DRM_EDID_RANGE_OFFSET_MIN_VFREQ)
68e05b932dcba9 Alex Deucher         2024-02-28  12068  						connector->display_info.monitor_range.min_vfreq += 255;
68e05b932dcba9 Alex Deucher         2024-02-28  12069  					if (data->pad2 & DRM_EDID_RANGE_OFFSET_MAX_VFREQ)
68e05b932dcba9 Alex Deucher         2024-02-28  12070  						connector->display_info.monitor_range.max_vfreq += 255;
68e05b932dcba9 Alex Deucher         2024-02-28  12071  				}
68e05b932dcba9 Alex Deucher         2024-02-28  12072  
68e05b932dcba9 Alex Deucher         2024-02-28  12073  				amdgpu_dm_connector->min_vfreq =
68e05b932dcba9 Alex Deucher         2024-02-28  12074  					connector->display_info.monitor_range.min_vfreq;
68e05b932dcba9 Alex Deucher         2024-02-28  12075  				amdgpu_dm_connector->max_vfreq =
68e05b932dcba9 Alex Deucher         2024-02-28  12076  					connector->display_info.monitor_range.max_vfreq;
68e05b932dcba9 Alex Deucher         2024-02-28  12077  
e7b07ceef2a650 Harry Wentland       2017-08-10  12078  				break;
e7b07ceef2a650 Harry Wentland       2017-08-10  12079  			}
e7b07ceef2a650 Harry Wentland       2017-08-10  12080  
c84dec2fe8837f Harry Wentland       2017-09-05  12081  			if (amdgpu_dm_connector->max_vfreq -
c84dec2fe8837f Harry Wentland       2017-09-05  12082  			    amdgpu_dm_connector->min_vfreq > 10) {
98e6436d3af5fe Anthony Koo          2018-08-21  12083  
bb47de73666188 Nicholas Kazlauskas  2018-10-04  12084  				freesync_capable = true;
e7b07ceef2a650 Harry Wentland       2017-08-10  12085  			}
e7b07ceef2a650 Harry Wentland       2017-08-10  12086  		}
ec8e59cb4e0c1a Bhawanpreet Lakha    2023-06-12  12087  		parse_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
ec8e59cb4e0c1a Bhawanpreet Lakha    2023-06-12  12088  
ec8e59cb4e0c1a Bhawanpreet Lakha    2023-06-12  12089  		if (vsdb_info.replay_mode) {
ec8e59cb4e0c1a Bhawanpreet Lakha    2023-06-12  12090  			amdgpu_dm_connector->vsdb_info.replay_mode = vsdb_info.replay_mode;
ec8e59cb4e0c1a Bhawanpreet Lakha    2023-06-12  12091  			amdgpu_dm_connector->vsdb_info.amd_vsdb_version = vsdb_info.amd_vsdb_version;
ec8e59cb4e0c1a Bhawanpreet Lakha    2023-06-12  12092  			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
ec8e59cb4e0c1a Bhawanpreet Lakha    2023-06-12  12093  		}
ec8e59cb4e0c1a Bhawanpreet Lakha    2023-06-12  12094  
c8133532d2e08c Melissa Wen          2024-09-11  12095  	} else if (drm_edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
7c7dd77489540d Arnd Bergmann        2021-02-25  12096  		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
7c7dd77489540d Arnd Bergmann        2021-02-25  12097  		if (i >= 0 && vsdb_info.freesync_supported) {
f9b4f20c4777bd Stylon Wang          2020-12-04  12098  			timing  = &edid->detailed_timings[i];
f9b4f20c4777bd Stylon Wang          2020-12-04  12099  			data    = &timing->data.other_data;
f9b4f20c4777bd Stylon Wang          2020-12-04  12100  
f9b4f20c4777bd Stylon Wang          2020-12-04  12101  			amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
5b49da02ddbe1b Sung Joon Kim        2023-01-12  12102  			amdgpu_dm_connector->max_vfreq = vsdb_info.max_refresh_rate_hz;
5b49da02ddbe1b Sung Joon Kim        2023-01-12  12103  			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
5b49da02ddbe1b Sung Joon Kim        2023-01-12  12104  				freesync_capable = true;
5b49da02ddbe1b Sung Joon Kim        2023-01-12  12105  
5b49da02ddbe1b Sung Joon Kim        2023-01-12  12106  			connector->display_info.monitor_range.min_vfreq = vsdb_info.min_refresh_rate_hz;
5b49da02ddbe1b Sung Joon Kim        2023-01-12  12107  			connector->display_info.monitor_range.max_vfreq = vsdb_info.max_refresh_rate_hz;
5b49da02ddbe1b Sung Joon Kim        2023-01-12  12108  		}
5b49da02ddbe1b Sung Joon Kim        2023-01-12  12109  	}
5b49da02ddbe1b Sung Joon Kim        2023-01-12  12110  
5b49da02ddbe1b Sung Joon Kim        2023-01-12  12111  	as_type = dm_get_adaptive_sync_support_type(amdgpu_dm_connector->dc_link);
5b49da02ddbe1b Sung Joon Kim        2023-01-12  12112  
5b49da02ddbe1b Sung Joon Kim        2023-01-12  12113  	if (as_type == FREESYNC_TYPE_PCON_IN_WHITELIST) {
5b49da02ddbe1b Sung Joon Kim        2023-01-12  12114  		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
5b49da02ddbe1b Sung Joon Kim        2023-01-12  12115  		if (i >= 0 && vsdb_info.freesync_supported && vsdb_info.amd_vsdb_version > 0) {
5b49da02ddbe1b Sung Joon Kim        2023-01-12  12116  
5b49da02ddbe1b Sung Joon Kim        2023-01-12  12117  			amdgpu_dm_connector->pack_sdp_v1_3 = true;
5b49da02ddbe1b Sung Joon Kim        2023-01-12  12118  			amdgpu_dm_connector->as_type = as_type;
5b49da02ddbe1b Sung Joon Kim        2023-01-12  12119  			amdgpu_dm_connector->vsdb_info = vsdb_info;
5b49da02ddbe1b Sung Joon Kim        2023-01-12  12120  
5b49da02ddbe1b Sung Joon Kim        2023-01-12  12121  			amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
f9b4f20c4777bd Stylon Wang          2020-12-04  12122  			amdgpu_dm_connector->max_vfreq = vsdb_info.max_refresh_rate_hz;
f9b4f20c4777bd Stylon Wang          2020-12-04  12123  			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
f9b4f20c4777bd Stylon Wang          2020-12-04  12124  				freesync_capable = true;
f9b4f20c4777bd Stylon Wang          2020-12-04  12125  
f9b4f20c4777bd Stylon Wang          2020-12-04  12126  			connector->display_info.monitor_range.min_vfreq = vsdb_info.min_refresh_rate_hz;
f9b4f20c4777bd Stylon Wang          2020-12-04  12127  			connector->display_info.monitor_range.max_vfreq = vsdb_info.max_refresh_rate_hz;
f9b4f20c4777bd Stylon Wang          2020-12-04  12128  		}
f9b4f20c4777bd Stylon Wang          2020-12-04  12129  	}
bb47de73666188 Nicholas Kazlauskas  2018-10-04  12130  
bb47de73666188 Nicholas Kazlauskas  2018-10-04  12131  update:
bb47de73666188 Nicholas Kazlauskas  2018-10-04  12132  	if (dm_con_state)
bb47de73666188 Nicholas Kazlauskas  2018-10-04  12133  		dm_con_state->freesync_capable = freesync_capable;
bb47de73666188 Nicholas Kazlauskas  2018-10-04  12134  
bb47de73666188 Nicholas Kazlauskas  2018-10-04  12135  	if (connector->vrr_capable_property)
bb47de73666188 Nicholas Kazlauskas  2018-10-04  12136  		drm_connector_set_vrr_capable_property(connector,
bb47de73666188 Nicholas Kazlauskas  2018-10-04  12137  						       freesync_capable);
e7b07ceef2a650 Harry Wentland       2017-08-10  12138  }
e7b07ceef2a650 Harry Wentland       2017-08-10  12139  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
