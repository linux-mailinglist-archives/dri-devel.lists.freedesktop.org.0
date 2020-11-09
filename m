Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B2C2AB4BC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 11:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C2889819;
	Mon,  9 Nov 2020 10:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B04E89819
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 10:22:32 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A9AMPqV112757;
 Mon, 9 Nov 2020 04:22:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604917345;
 bh=CG5PEK/x5ITMrjZxW8GzNu++r9MHgpTFkJ94/g0VLhY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=byYpNonEpo5d3IBk0EIzc4OTEum4FgAvGRlArhiqeT+faabMNmwxGsffXAMk7reV6
 IHqa/HU12C8ZmWO+XDPZmcg20mHOv/w8W8C+vXIX9NWd/pmOsr3Ja0FvQoke02eoaC
 kzrX6Hmp4MOdLUMT1KLpFhXAyrOapWnN2dKe4c40=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A9AMPdO003234
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Nov 2020 04:22:25 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 9 Nov
 2020 04:22:25 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 9 Nov 2020 04:22:25 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A9AMMUo058494;
 Mon, 9 Nov 2020 04:22:23 -0600
Subject: Re: [PATCH v3 00/56] Convert DSI code to use drm_mipi_dsi and
 drm_panel
To: "H. Nikolaus Schaller" <hns@goldelico.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <61C04176-4654-4D2D-A55B-31FBB6D2E5AA@goldelico.com>
 <fcbc8488-5861-8e51-0f86-1ed6498083f7@ti.com>
 <579243AA-014A-411B-9014-F5846C9B8137@goldelico.com>
 <ab33baff-dd8c-2ee0-6f89-35aa4df7b9cf@ti.com>
 <837EA533-9946-43B3-B058-69060EC43981@goldelico.com>
 <08589e51-f5e6-2743-57ec-8ac509f97ff0@ti.com>
 <1f1afce4-c822-0fbf-1ce3-dda0064b65c6@ti.com>
 <67786545-23D2-444F-85B8-7A030070B317@goldelico.com>
 <a20f2b88-bfe6-0ab4-a19b-ba5316db6c4f@ti.com>
 <17F5238B-1CC3-4764-B744-C57D9CE4EB42@goldelico.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <db0b9694-4d04-18ba-fdf0-093b5914bbf0@ti.com>
Date: Mon, 9 Nov 2020 12:22:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <17F5238B-1CC3-4764-B744-C57D9CE4EB42@goldelico.com>
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
Cc: Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/11/2020 11:30, H. Nikolaus Schaller wrote:
> 
>> Am 09.11.2020 um 09:04 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
>>
>> On 07/11/2020 14:19, H. Nikolaus Schaller wrote:
>>
>>> I have set up based on our complete letux-5.10-rc2 tree and maybe using our private config makes
>>> the difference. Anyways, the driver is now probed and I can see the call to w677l_get_modes().
>>>
>>> I have still no image and no calls to prepare/unprepare etc. but now I can start to debug on omap5.
>>> And hopefully we are close to push the panel driver for review. And in a second step some device
>>> tree for the Pyra.
>>>
>>> The new tree is here: https://git.goldelico.com/?p=letux-kernel.git;a=shortlog;h=refs/heads/work-pyra-panel
>>
>> Ok, good. Do you have a link the previous driver that works (omapdrm specific panel driver)? I think
>> it's good to have that as a reference.
> 
> Yes, here:
> 
> https://git.goldelico.com/?p=letux-kernel.git;a=shortlog;h=refs/heads/letux/panels

Ok. The old driver uses two separate VC configurations (request_vc calls), so it may not work with
this series. I think we need to implement logic to the dsi driver to somehow handle this kind of setup.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
