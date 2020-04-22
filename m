Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2652E1B3965
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 09:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC1D6E9E5;
	Wed, 22 Apr 2020 07:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA236E9E5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 07:51:47 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03M7pfor015094;
 Wed, 22 Apr 2020 02:51:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1587541901;
 bh=0qzb9XgHtudnkz7lbBkw74ucY2oykHyzy4LTQbWvHpo=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=nCoWE6HZ8H6O8qQSDyrOT5zJ43L9Tou4oaazp47n6Ijl1WMWmLKQkThw4ZGe6hmrz
 JONjFjKyNkmERBzhWLAlHwhztGs5vQQbpSP7ClZpH561dv1OQJerSC/JZKewr1gubZ
 /QyT7Ym9vY1W7HPuYye+f1ZCqhA+fK19NHquAsMY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03M7pfAU086881;
 Wed, 22 Apr 2020 02:51:41 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 22
 Apr 2020 02:51:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 22 Apr 2020 02:51:40 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03M7pcH4025597;
 Wed, 22 Apr 2020 02:51:38 -0500
Subject: Re: [PATCH] omapfb/dss: fix comparison to bool warning
To: Jason Yan <yanaijie@huawei.com>, <b.zolnierkie@samsung.com>, <afd@ti.com>, 
 <linux-omap@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20200422071903.637-1-yanaijie@huawei.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <fecc5f43-d1a2-f29f-da3a-79c297bff462@ti.com>
Date: Wed, 22 Apr 2020 10:51:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422071903.637-1-yanaijie@huawei.com>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/04/2020 10:19, Jason Yan wrote:
> Fix the following coccicheck warning:
> 
> drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c:461:15-32: WARNING:
> Comparison to bool
> drivers/video/fbdev/omap2/omapfb/dss/dispc.c:891:5-35: WARNING:
> Comparison of 0/1 to bool variable
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---
>   drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 2 +-
>   drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c | 4 +---
>   2 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
