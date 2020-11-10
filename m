Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CE72AD71C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 14:08:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D9C896EB;
	Tue, 10 Nov 2020 13:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E034896EB
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 13:07:59 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AAD7jK8052249;
 Tue, 10 Nov 2020 07:07:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605013665;
 bh=ZKDE3dAfQVYFP/KPUoqJ2Qf0GM5psHsYsp1JmKIyMng=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=FpE0hcU6MldIuM1S+lqL3ZejoUGaGj5qZiKNwQlvOcry+heI1HPBgHVi2lJS341W+
 q6Ygogv2E43WXOrFbFxL8F09pHKEYIzukzh8Uxaf9UNT6PwmaTQf6YXz8gcQ7kSU2r
 msFhPO29Qv6zEPjwjGdTs5Ygn1MS9vY5mCp+Akjk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AAD7jkD018596
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Nov 2020 07:07:45 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 10
 Nov 2020 07:07:45 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 10 Nov 2020 07:07:45 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AAD7hR0029534;
 Tue, 10 Nov 2020 07:07:44 -0600
Subject: Re: [PATCH 0/4] drm/omap: fix reference leak in runtime get ops
To: Zhang Qilong <zhangqilong3@huawei.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
References: <20201110125108.3827430-1-zhangqilong3@huawei.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <de58e5ef-c700-fde1-5080-c10607a8def0@ti.com>
Date: Tue, 10 Nov 2020 15:07:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201110125108.3827430-1-zhangqilong3@huawei.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/11/2020 14:51, Zhang Qilong wrote:
> This series of patches fixed several usage counter leaks refer to
> pm_runtime_get_sync. Many callers forget to call pm_runtime_put_noidle
> when pm_runtime_get_sync failed, and we fixed it.
> 
> Zhang Qilong (4):
>   drm: omapdrm: dsi: fix-reference-leak-in dsi_runtime_get.
>   drm: omapdrm: dss: fix reference leak in dss_runtime_get
>   drm/omap: hdmi4: fix reference leak in hdmi_runtime_get
>   drm/omap: hdmi5: fix reference leak in hdmi_runtime_get
> 
>  drivers/gpu/drm/omapdrm/dss/dsi.c   | 8 ++++++--
>  drivers/gpu/drm/omapdrm/dss/dss.c   | 8 ++++++--
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c | 4 +++-
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c | 4 +++-
>  4 files changed, 18 insertions(+), 6 deletions(-)

I have applied an earlier series from Dinghao Liu which does the same thing.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
