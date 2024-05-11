Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0518C32A6
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 19:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73EFD10E26D;
	Sat, 11 May 2024 17:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="a4NzGwVH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B6E10E26D
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 17:08:27 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44BH8EGc019533;
 Sat, 11 May 2024 12:08:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1715447294;
 bh=timvJRGsOvaAJupM+NGf/T5JlzD1cz4vtYJRKUFZTHQ=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=a4NzGwVH5nDzUxCmVpYQ+fMN5BN+GmueErg4d7loqutgIKrvCI6AUuihmGN2fCU+z
 frzOoL7mLBc7Bb/gZdaP6Fx42PRBuShiwO7HmwWjMpXC5/GuvRtBMmcN1+IwucbaRy
 PO5qs5SIFQPQMEYUvMDU3XpwzA+7HjUD16fNbLaE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44BH8E2G040776
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 11 May 2024 12:08:14 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 11
 May 2024 12:08:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 11 May 2024 12:08:14 -0500
Received: from [10.249.130.181] ([10.249.130.181])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44BH852Q090626;
 Sat, 11 May 2024 12:08:05 -0500
Message-ID: <7e3ad816-6a2a-4e02-9b41-03a8562812ad@ti.com>
Date: Sat, 11 May 2024 22:38:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] media: imagination: Round to closest multiple for
 cropping region
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
 <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
 <dri-devel@lists.freedesktop.org>, <laurent.pinchart@ideasonboard.com>,
 <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>,
 <j-luthra@ti.com>, <b-brnich@ti.com>, <detheridge@ti.com>,
 <p-mantena@ti.com>, <vijayp@ti.com>, <andrzej.p@collabora.com>,
 <nicolas@ndufresne.ca>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <akpm@linux-foundation.org>,
 <gregkh@linuxfoundation.org>, <adobriyan@gmail.com>,
 <jani.nikula@intel.com>
References: <20240509184001.4064820-1-devarsht@ti.com>
 <Zj447ePSnccbj76v@smile.fi.intel.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <Zj447ePSnccbj76v@smile.fi.intel.com>
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

Hi Andy,

Thanks for the quick review.
On 10/05/24 20:40, Andy Shevchenko wrote:
> On Fri, May 10, 2024 at 12:10:01AM +0530, Devarsh Thakkar wrote:
>> If neither of the flags to round down (V4L2_SEL_FLAG_LE) or round up
>> (V4L2_SEL_FLAG_GE) are specified by the user, then round to nearest
>> multiple of requested value while updating the crop rectangle coordinates.
>>
>> Use the rounding macro which gives preference to rounding down in case two
>> nearest values (high and low) are possible to raise the probability of
>> cropping rectangle falling inside the bound region.
> 
> This is arguable. How do we know that the bigger range is supported?
> The safest side is to go smaller than bigger.
> 

Yes and that's what the driver does when do when application passes
V4L2_SEL_FLAG_LE while doing the selection. If application does not
specify explicitly whether to round down or round up the cropping
parameters requested by it (i.e app is neither passing V4L2_SEL_FLAG_LE
nor V4L2_SEL_FLAG_GE flags), then it is preferred by driver to round the
cropping parameters to nearest possible value by either rounding down or
rounding up to align with hardware requirements.

For e.g. If requested width for cropping region is 127 and HW requires
width to be multiple of 64 then we would prefer to round it up to 128
rather than rounding down to a more distant value (i.e. 64), but if
requested cropping width is 129 then we would prefer to instead round it
down to 128. But if requested cropping width is 160 then there are two
nearest possible values 160 - 32 = 128 and 160 + 32 = 192 and in which
case we prefer the smaller value as you suggested and that's why the
driver uses round_closest_down.

For any reason, if still the cropping rectangle falls beyond the bound
region, then driver will return out of range error (-ERANGE) to
application.

Regards
Devarsh


