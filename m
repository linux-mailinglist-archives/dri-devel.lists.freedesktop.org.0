Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A295AA5086
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 17:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D15910E358;
	Wed, 30 Apr 2025 15:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="sDHIAcok";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10B110E358
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 15:39:35 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53UFd28s4163729
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Apr 2025 10:39:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1746027542;
 bh=hhn+vDhm+UWBoNuh8sgVsVRmxE61cfefKqQBYf1mIOw=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=sDHIAcok3DfLJ58Nbh2wdZykhwK4drQSyK+dfn7fpFnPTs3ky9H6AdlyBwN2Ixjek
 BLRsy5ItxV3HLqHTOPDZaV8wPR4VyVwEAucVeRln6l0o6wTk5HCV8FLNXwXuvNL3PG
 kTazrYKvl0GsnEBAewU4CW7xUxYRlye4mQQcXc5U=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53UFd277057151
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Apr 2025 10:39:02 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 30
 Apr 2025 10:39:01 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 30 Apr 2025 10:39:01 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com
 [172.24.227.193])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53UFctaL103871;
 Wed, 30 Apr 2025 10:38:56 -0500
Message-ID: <096ff788-7a25-47a3-ad13-caff971cf0bc@ti.com>
Date: Wed, 30 Apr 2025 21:08:55 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v4 2/3] drm/tidss: Update infrastructure to support K3 DSS
 cut-down versions
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <aradhya.bhatia@linux.dev>,
 <s-jain1@ti.com>, <r-donadkar@ti.com>, <j-choudhary@ti.com>,
 <h-shenoy@ti.com>, <jyri.sarha@iki.fi>, <airlied@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>
References: <20250326145736.3659670-1-devarsht@ti.com>
 <20250326145736.3659670-3-devarsht@ti.com>
 <b16761e5-be8a-42f6-8fc9-b84455716382@ideasonboard.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <b16761e5-be8a-42f6-8fc9-b84455716382@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Hi Tomi

Thanks for the review. I had missed to respond back to below comment
before sending V5, so kindly find the response for the same as below.

On 27/03/25 16:48, Tomi Valkeinen wrote:

>> *dispc, u32 hw_plane,
>>                  const struct drm_plane_state *state,
>>                  u32 hw_videoport)
>>   {
>> -    bool lite = dispc->feat->vid_lite[hw_plane];
>> +    bool lite = dispc->feat->vid_info[hw_plane].is_lite;
>>       u32 fourcc = state->fb->format->format;
>>       u16 cpp = state->fb->format->cpp[0];
>>       u32 fb_width = state->fb->pitches[0] / cpp;
>> @@ -2210,7 +2275,7 @@ static void dispc_k2g_plane_init(struct
>> dispc_device *dispc)
>>       /* MFLAG_START = MFLAGNORMALSTARTMODE */
>>       REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 0, 6, 6);
>>   -    for (hw_plane = 0; hw_plane < dispc->feat->num_planes;
>> hw_plane++) {
>> +    for (hw_plane = 0; hw_plane < dispc->feat->num_vids; hw_plane++) {
>>           u32 size = dispc_vid_get_fifo_size(dispc, hw_plane);
> 
> And here.
> 

I don't think we need to us hw_id for dispc_vid* functions as they
directly act on VID register base which is mapped based on device-tree.
So for e.g. if an SoC does not have VID0 then it won't map that register
base at all. For e.g. AM62L does not have VID region and has only VIDL
so to access VIDL base (which is the first vid region mapped hence index
0) we only need to use hw_plane as index 0

 void __iomem *base = dispc->base_vid[hw_plane];

The hw_id is only required for dispc_k3_vid* functions which access
common register space for vid* specific registers and bits. For e.g.
AM62L does not have VID base so there is a hole there and after 0x4
offset (i.e. at index 1) VIDL starts, so in this case we need to pass
hw_id as 1 (from vid_info struct).

Regards
Devarsh
