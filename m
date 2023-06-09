Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A367293D7
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 10:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B231A10E228;
	Fri,  9 Jun 2023 08:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C5210E67B;
 Fri,  9 Jun 2023 08:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686300823; x=1717836823;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=T11vZfsBg9+4G9OSNHQ+OPyp9PW8VEExnz5/IWZIgP0=;
 b=LkJBxuYpTYP4oINK5nTZi6LaiAMT3BNhkipwB+2BW0bx54eq/q8SBz/E
 DbbE0Mg8xKeJ2JYORy2bR0HRyeO2tkdmF6DX/XthBczX/kxrSnNIjr2bv
 jG7XUPKQPupi0sZByo+yG5CRsy76wu62qX7/odcsd7xliwP2avJUxMp9S
 rycw2DL9kRZdGH0bhzashkmBgDS8aoNSghTzkHL+N+B5tQNYwX+ys1282
 NmJPls0pnPtgx49yoDHgcp507OcPHQG5a/UQ4kCJZE7es8QsULNo+/PHs
 /PXwOeW4xtWkH7Ue5zA8/Fc1UxoaIjYhwW+Tbz5ZK3YYjqDFSPCXBXuH+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="385910291"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; d="scan'208";a="385910291"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 01:53:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="800152172"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; d="scan'208";a="800152172"
Received: from skolhe-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.58.254])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 01:53:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v4] drm/dp_mst: Clear MSG_RDY flag before sending new
 message
In-Reply-To: <CO6PR12MB548948F83852B367F228F9A9FC51A@CO6PR12MB5489.namprd12.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230608114316.3078024-1-Wayne.Lin@amd.com>
 <87a5xarvh9.fsf@intel.com>
 <CO6PR12MB548948F83852B367F228F9A9FC51A@CO6PR12MB5489.namprd12.prod.outlook.com>
Date: Fri, 09 Jun 2023 11:53:17 +0300
Message-ID: <871qilrp8i.fsf@intel.com>
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
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> > bool *handled)
>> > +int drm_dp_mst_hpd_irq_handle_event(struct drm_dp_mst_topology_mgr
>> *mgr, const u8 *esi,
>> > +                               u8 *ack, bool *handled)
>> >  {
>> >     int ret = 0;
>> >     int sc;
>> > @@ -4078,18 +4089,47 @@ int drm_dp_mst_hpd_irq(struct
>> drm_dp_mst_topology_mgr *mgr, u8 *esi, bool *handl
>> >     if (esi[1] & DP_DOWN_REP_MSG_RDY) {
>> >             ret = drm_dp_mst_handle_down_rep(mgr);
>> >             *handled = true;
>> > +           *ack |= DP_DOWN_REP_MSG_RDY;
>>
>> My idea was that esi and ack would be the same size buffers, so the caller
>> wouldn't have to worry where exactly to point ack to.
>>
>> I think the asymmetry here is misleading, with ack and esi having to point at
>> different locations.
>>
> Thanks, Jani.
>
> But Event status Indicator Files (DPCD 0x2000h ~ 0x21FFH) are not all designed
> to be ack clear, e.g. esi[0] here. My thought is to be precise about what is handled
> and what is going to be ack clear. Otherwise, write ack[0] to DPCD 0x2002h is
> not reasonable.

The point is that you have the same indexes everywhere, even if ack[0]
ends up being unused.

Handle esi[1] & DP_DOWN_REP_MSG_RDY, set ack[1] |= DP_DOWN_REP_MSG_RDY.

Similar pattern everywhere, drm core and drivers. The only place that
needs to know the difference is where the ack is written back to DPCD.

If we end up adding more helpers for drm core handling ESI, we'll keep
repeating the same pattern, instead of passing individual u8 acks
everywhere, with the driver having to figure out what pointers to pass.

BR,
Jani.




-- 
Jani Nikula, Intel Open Source Graphics Center
