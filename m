Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1811354B2B6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 16:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501F210FEEC;
	Tue, 14 Jun 2022 14:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619DF11239E;
 Tue, 14 Jun 2022 14:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655215414; x=1686751414;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MakQODmiUTQ7+4pG4wWuoyIaucVqIRtTkgSMz7Kr06E=;
 b=eTxW6ZBunUU8gwQlG7rgvY5aGb/11iPEFxpMVl43IsbPlH2YAeigvysu
 UwaGE6Ntr8KVhIbG6aLEweM/wi/gTSZNtaPOFkOGzDm2eoDKbgU34lW5d
 KcCCGnb7FyigeYmyDbbWuClm2vsHJ+NhQQ0sPCeksy2aJHkCOszxu+joZ
 ni1Sq85SDbdPIDz54et/LiuQo5sbCKK7wntHvh8L0Y8XJeY1Q+R879JAf
 bFWYcJXsmvrROzalJKkSfJAaAuTqssWEoAIvWSYE3PqS1gaDU2MRzlrix
 A/dcJ9gQCwxWM84ZBquE7+qeP101v/QoJ1bUwzMtZAeegdx6K0i/mqgD9 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="276167861"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="276167861"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 07:03:16 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="640390127"
Received: from nncongwa-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.32.178])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 07:03:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: imre.deak@intel.com
Subject: Re: [PATCH] drm/dp/mst: Read the extended DPCD capabilities during
 system resume
In-Reply-To: <YqiF3k/gyy2Axtwz@ideak-desk.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220614094537.885472-1-imre.deak@intel.com>
 <87sfo7xw5g.fsf@intel.com> <YqiF3k/gyy2Axtwz@ideak-desk.fi.intel.com>
Date: Tue, 14 Jun 2022 17:03:12 +0300
Message-ID: <87mtefxrz3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Jun 2022, Imre Deak <imre.deak@intel.com> wrote:
> On Tue, Jun 14, 2022 at 03:32:59PM +0300, Jani Nikula wrote:
>> On Tue, 14 Jun 2022, Imre Deak <imre.deak@intel.com> wrote:
>> > The WD22TB4 Thunderbolt dock at least will revert its DP_MAX_LINK_RATE
>> > from HBR3 to HBR2 after system suspend/resume if the DP_DP13_DPCD_REV
>> > registers are not read subsequently also as required.
>> 
>> Does it actually change the behaviour depending on whether the dpcd is
>> read or not, or is this just about the resume path overwriting mgr->dpcd
>> with stuff from DP_DPCD_REV?
>
> Yes, the reading out DP_DP13_DPCD_REV has a side-effect, see
> https://gitlab.freedesktop.org/drm/intel/-/issues/5292#note_1343399

:o

Okay, the commit message is fine as-is.

>
>> drm_dp_mst_topology_mgr_set_mst() does use drm_dp_read_dpcd_caps() for
>> reading the caps, which would normally set mgr->dpcd from
>> DP_DP13_DPCD_REV.
>
> Right, but at that point DP_DP13_DPCD_REV returns HBR2 w/o this change.
>
>> BR,
>> Jani.
>> 
>> >
>> > Fix this by reading DP_DP13_DPCD_REV registers as well, matching what is
>> > done during connector detection. While at it also fix up the same call
>> > in drm_dp_mst_dump_topology().
>> >
>> > Cc: Lyude Paul <lyude@redhat.com>
>> > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5292
>> > Signed-off-by: Imre Deak <imre.deak@intel.com>
>> > ---
>> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 7 ++-----
>> >  1 file changed, 2 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> > index 67b3b9697da7f..18f2b6075b780 100644
>> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> > @@ -3860,9 +3860,7 @@ int drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,
>> >  	if (!mgr->mst_primary)
>> >  		goto out_fail;
>> >  
>> > -	ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, mgr->dpcd,
>> > -			       DP_RECEIVER_CAP_SIZE);
>> > -	if (ret != DP_RECEIVER_CAP_SIZE) {
>> > +	if (drm_dp_read_dpcd_caps(mgr->aux, mgr->dpcd) < 0) {
>> >  		drm_dbg_kms(mgr->dev, "dpcd read failed - undocked during suspend?\n");
>> >  		goto out_fail;
>> >  	}
>> > @@ -4911,8 +4909,7 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
>> >  		u8 buf[DP_PAYLOAD_TABLE_SIZE];
>> >  		int ret;
>> >  
>> > -		ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, buf, DP_RECEIVER_CAP_SIZE);
>> > -		if (ret) {
>> > +		if (drm_dp_read_dpcd_caps(mgr->aux, buf) < 0) {
>> >  			seq_printf(m, "dpcd read failed\n");
>> >  			goto out;
>> >  		}
>> 
>> -- 
>> Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
