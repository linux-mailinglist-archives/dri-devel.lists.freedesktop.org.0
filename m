Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AF18FE7D7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 15:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA4E10E0BD;
	Thu,  6 Jun 2024 13:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="IIauxGLV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9633710E0BD
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 13:31:55 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 456DVYEY112323;
 Thu, 6 Jun 2024 08:31:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1717680694;
 bh=Kx5MbrOxEtUYpPljTcPyApoVWRxhbFbQe/9s37OMmCI=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=IIauxGLVgHg8W+1s6ZuXkpglyYHoGyj6IbB/vdCltxFUk5OMs1jzDWba6/9RH6VpF
 QKfehPzFWYMiIyAaEIvkBHLd3TT4sGc6gsO3SVtPFOC2idQy+mHWEVuU1qsr6fdiPQ
 B2udbUq6G6Zenk8payCeoJ4yekMhmgRwPh2jnUts=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 456DVYU6025743
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 6 Jun 2024 08:31:34 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Jun 2024 08:31:34 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Jun 2024 08:31:34 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be
 forged))
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 456DVQmd125266;
 Thu, 6 Jun 2024 08:31:27 -0500
Message-ID: <7e4a0071-18a0-b892-5cd3-c8eb70617090@ti.com>
Date: Thu, 6 Jun 2024 19:01:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v12 12/13] media: imagination: Round to closest multiple
 for cropping region
Content-Language: en-US
To: Sebastian Fricke <sebastian.fricke@collabora.com>
CC: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
 <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <benjamin.gaignard@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
 <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
 <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
 <vijayp@ti.com>, <andrzej.p@collabora.com>, <nicolas@ndufresne.ca>,
 <p.zabel@pengutronix.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <akpm@linux-foundation.org>, <gregkh@linuxfoundation.org>,
 <andriy.shevchenko@linux.intel.com>, <adobriyan@gmail.com>,
 <jani.nikula@intel.com>
References: <20240604104001.2235082-1-devarsht@ti.com>
 <20240604105335.2257629-1-devarsht@ti.com>
 <20240606114459.x73yebdu7kg7re52@basti-XPS-13-9310>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20240606114459.x73yebdu7kg7re52@basti-XPS-13-9310>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

Hi Sebastian

Thanks for the update.
On 06/06/24 17:14, Sebastian Fricke wrote:
> Hey,
> 
> On 04.06.2024 16:23, Devarsh Thakkar wrote:
>> If neither of the flags to round down (V4L2_SEL_FLAG_LE) or round up
>> (V4L2_SEL_FLAG_GE) are specified by the user, then round to nearest
>> multiple of requested value while updating the crop rectangle coordinates.
>>
>> Use the rounding macro which gives preference to rounding down in case two
>> nearest values (high and low) are possible to raise the probability of
>> cropping rectangle falling inside the bound region.
>>
>> This complies with the VIDIOC_G_SELECTION, VIDIOC_S_SELECTION ioctl
>> description as documented in v4l uapi [1] which specifies that driver
>> should choose crop rectangle as close as possible if no flags are passed by
>> user-space, as quoted below :
>>
>> "``0`` - The driver can adjust the rectangle size freely and shall choose a
>> crop/compose rectangle as close as possible to the requested
>> one."
>>
>> Link:
>> https://www.kernel.org/doc/Documentation/userspace-api/media/v4l/vidioc-g-selection.rst [1]
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> 
> Acked-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> 
> Can, whoever picks up the math changes, pick up this change as well?
> I will send 1-6 via the media subsystem.
> 

For [PATCH 1/13] to [PATCH 6/13] patches from the series,
I see few warnings reported to me offline for some of the patches which were
caught from using smatch/sparse related automation scripts which were somehow
missed by my equivalent test script. The fixes should be trivial though and I
will be rolling out a v13 soon to fix them up.

The rest of the patches (PATCH 7/13 to PATCH 13/13) no smatch/sparse related
warnings were caught for these though, and are good to go in. Although, I can
still include them in V13 too just to avoid any confusion.

Regards
Devarsh
