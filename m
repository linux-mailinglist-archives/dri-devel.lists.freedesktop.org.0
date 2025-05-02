Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 652E5AA70EC
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 13:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DABF10E8EA;
	Fri,  2 May 2025 11:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="vb5sMp6t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131CA10E18A
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 11:53:01 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542BqUe03852546
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 2 May 2025 06:52:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1746186750;
 bh=ylg5pHJj6soRgfq6YOqDlWI4JdGvCXUzDJpfJJFlwoQ=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=vb5sMp6t7wlt8I3haJ/yR/M68BhrswtvCDpm8GkEqAit5aG6Tx+9tjBEZLB1hS2Vl
 thI4PGAsqZIyYzxp8C762fSj4RF+iavs+05lrq8m0Bli0cPMPgZFWvOmcDMMgJnfFh
 P/IK9hUIFGYn82xPG54r4CNqYEmcmxTYnjCo4FZQ=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542BqTAC064408
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 2 May 2025 06:52:29 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 06:52:29 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 06:52:29 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com
 [172.24.227.193])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542BqNfA101955;
 Fri, 2 May 2025 06:52:24 -0500
Message-ID: <ead31912-d1e5-4813-99a7-5cd2754672ef@ti.com>
Date: Fri, 2 May 2025 17:22:23 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v5 2/3] drm/tidss: Update infrastructure to support K3 DSS
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
References: <20250429143656.3252877-1-devarsht@ti.com>
 <20250429143656.3252877-3-devarsht@ti.com>
 <f729c0d6-45a0-4610-b22b-92c03f534bf7@ideasonboard.com>
 <1f8c43cd-8c26-4e42-b144-b91f5ffc2e2e@ti.com>
 <88993439-bfdc-418c-95c6-d6d8bdb5b87f@ideasonboard.com>
 <466254e9-145f-4839-9451-a5f282ff02e9@ti.com>
 <ce831f65-67d0-4f4c-9f08-3014b1d00dc0@ideasonboard.com>
 <ca008cb0-bec6-4b10-b6b5-0f29648f76c0@ti.com>
 <ed82e498-b3af-46f6-97ce-3a2f47872935@ideasonboard.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <ed82e498-b3af-46f6-97ce-3a2f47872935@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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

Hi,

<snip>
>> It uses hw_id i.e. 1 for all vid irqstatus related registers since it is
>> accessing am65x common region register space which has vid on idx0 which
>> we want to skip for am62l.
>>
>> For dispc_plane_enable(), the caller uses
>>> 0, for dispc_k3_vid_write_irqstatus(), the caller uses 1...
>>
>> Yes above is correct, and I think that's how it is supposed to be.
> 
> No it's not. Both functions have "hw_plane" parameter, yet they require
> a different value to be used even when referring to the same plane.
>
>>> With a quick look at the code, changing the callers to pass the "old
>>> style" hw_plane as the parameter to those irq functions, and the
>>> functions internally get the hw_id, would solve most of the problems.
>>
>> I don't follow above, hw_plane has 0 so it should not be used for
>> programming irq related functions which expect idx 1 as explained above.
> 
> We have various functions in tidss_dispc.c that have hw_plane as a
> parameter. But the caller is supposed to know that for some functions
> hw_plane is a plane index from 0, and for some it's the hw_id from
> vid_info[].
> 
>> There's still dispc_k3_set_irqenable() which manages 'main_disable' and
>>> needs the hw_id, but maybe that's fine, even if a bit confusing.
>>>
>>
>> I still feel there is no inherent bug here, but let me know if you want
>> me to put some debug prints or get register dump so that we can double
>> confirm.
> 
> I'm not saying there's a bug. I'm saying it's bad code and will cause
> confusion and bugs in the future.
> 

Ok I see what you mean to say.....although functionally it is working
fine but from readability point of view it is confusing since both
functions use same argument name i.e hw_plane in two different contexts.
In that case, I would propose to use hw_id as arg name for all
dispc_k3_vid* functions, will that be okay ?

Regards
Devarsh
