Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 705D32C8358
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 12:40:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802C36E463;
	Mon, 30 Nov 2020 11:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263836E486
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 11:40:05 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AUBdvmT053204;
 Mon, 30 Nov 2020 05:39:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606736397;
 bh=eROjjuMD6FMH0/tS07rSVroup7h5Oeziz6FX8M2SiGs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=XS2HISatIhHLdRiOlNr1zru86PeJz7w5IIErLeivMzjjtgJ9nPB876CkxAWOHdxNm
 1QsuD7zFvp6IdBFUK8DS1YcXjOOFvytdCITYcG1nWbIQrwN1UISxHlbHIeDMqpx+dG
 CIgZFYrm7m/ir9lNepaCXGtyPEEsMq0ja31SMzzg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AUBdvhx045892
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Nov 2020 05:39:57 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 30
 Nov 2020 05:39:56 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 30 Nov 2020 05:39:56 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AUBds7u130183;
 Mon, 30 Nov 2020 05:39:54 -0600
Subject: Re: [PATCH v2 3/5] drm/omap: Implement CTM property for CRTC using
 OVL managers CPR matrix
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201103080310.164453-1-tomi.valkeinen@ti.com>
 <20201103080310.164453-4-tomi.valkeinen@ti.com>
 <20201130104141.GS4141@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <60143ced-cf8d-6044-1b25-dd3af30a11e4@ti.com>
Date: Mon, 30 Nov 2020 13:39:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130104141.GS4141@pendragon.ideasonboard.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Sekhar Nori <nsekhar@ti.com>, Jyri Sarha <jsarha@ti.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/11/2020 12:41, Laurent Pinchart wrote:
> Hi Tomi and Jyri,
> 
> Thank you for the patch.
> 
> On Tue, Nov 03, 2020 at 10:03:08AM +0200, Tomi Valkeinen wrote:
>> From: Jyri Sarha <jsarha@ti.com>
>>
>> Implement CTM color management property for OMAP CRTC using DSS
>> overlay manager's Color Phase Rotation matrix. The CPR matrix does not
>> exactly match the CTM property documentation. On DSS the CPR matrix is
>> applied after gamma table look up. However, it seems stupid to add a
>> custom property just for that.
> 
> Should this be updated now that the driver has switched to using degamma
> ?

Right, good catch. I think I can just drop everything after the first sentence.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
