Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7166C6E1EC1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 10:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6596B10EC9D;
	Fri, 14 Apr 2023 08:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3507 seconds by postgrey-1.36 at gabe;
 Fri, 14 Apr 2023 08:48:23 UTC
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26C310EC9D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 08:48:23 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33E7nhpc014392;
 Fri, 14 Apr 2023 02:49:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1681458583;
 bh=CuzhhjICpEU/rGlCLvbK8SfMg5Rq/XZkUaCGQb5HRfY=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Cqywuy6c48Fk3rBeB7bEYwFTLwAsdVgE9G4g+LT91cUt86nFDFZHVbT2yEHpgH44E
 zrYN1ryJOfptGCE8oOopoWYHWsT0e25BED7kG2w62st8yPalOx/a1elXNZtZgkto6W
 bBVEEkbneh/u2WjEtktu97fMLjagWrzpvM2uT/Oo=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33E7nhqm042728
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 14 Apr 2023 02:49:43 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 14
 Apr 2023 02:49:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 14 Apr 2023 02:49:43 -0500
Received: from [172.24.157.209] (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33E7ndi0071944;
 Fri, 14 Apr 2023 02:49:40 -0500
Message-ID: <655cfc4b-a414-47e1-f676-b11e410da32f@ti.com>
Date: Fri, 14 Apr 2023 13:19:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 5/7] drm/tidss: Set bus_format correctly from
 bridge/connector
Content-Language: en-US
To: Francesco Dolcini <francesco@dolcini.it>
References: <20201201121830.29704-1-nikhil.nd@ti.com>
 <20201201121830.29704-6-nikhil.nd@ti.com>
 <20201204115030.04509092@collabora.com>
 <ZCXENFdTY6g2rb0i@francesco-nb.int.toradex.com>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <ZCXENFdTY6g2rb0i@francesco-nb.int.toradex.com>
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
Cc: Nishanth Menon <nm@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Yuti Amonkar <yamonkar@cadence.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Swapnil Jakhade <sjakhade@cadence.com>, Devarsh Thakkar <devarsht@ti.com>,
 Rahul T R <r-ravikumar@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Francesco,

On 30-Mar-23 22:47, Francesco Dolcini wrote:
> Hello,
> chiming in in this *old* email thread.
> 
> Adding in copy a few more *@ti.com people recently involved in other tidss
> changes [1]
> 
> 
> [1] https://lore.kernel.org/all/20230125113529.13952-1-a-bhatia1@ti.com/
> 
> 
> On Fri, Dec 04, 2020 at 11:50:30AM +0100, Boris Brezillon wrote:
>> On Tue, 1 Dec 2020 17:48:28 +0530
>> Nikhil Devshatwar <nikhil.nd@ti.com> wrote:
>>
>>> Remove the old code to iterate over the bridge chain, as this is
>>> already done by the framework.
>>> The bridge state should have the negotiated bus format and flags.
>>> Use these from the bridge's state.
>>> If the bridge does not support format negotiation, error out
>>> and fail.
>>
>> That'd be even better if you implement the bridge interface instead of
>> the encoder one so we can get rid of the encoder_{helper}_funcs and use
>> drm_simple_encoder_init().
> 
> Did anything happened on this old discussion? I was working on a very
> similar change and after a while I realized about this thread.
> 
Nikhil has moved on from TI.

I will be taking up this patch series and implement the changes
requested.


Boris, Tomi

Are the changes discussed on this patch still relevant for the display
controller driver to support DRM_BRIDGE_ATTACH_NO_CONNECTOR?

Or are there some new changes in the framework that I should be looking
at?

Regards
Aradhya
