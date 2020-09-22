Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E90D273C3F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5F46E03C;
	Tue, 22 Sep 2020 07:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C69A6E0C4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 07:44:47 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08M7if6T122133;
 Tue, 22 Sep 2020 02:44:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600760681;
 bh=g5HrnxVv+6ch7rTECm70DtEL1mI3PuRtUthaa96yeb0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=SFNQ2xRZUJAGd2ss8lUP7tA0qqYnAUeG5dW1cCEWBkhcL34e7iPA4w8qtQljZcPsJ
 q5je9sSsSbJKvnBAmMn6IKbQ9nH+FcRHBtksAcN8DiMe9f7o0VGqCvZcQ54WZSOhH5
 OcutyQNXtpjBTWBV2u0a08sqHu/gqxAVALPSIyQQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08M7ifBd092960;
 Tue, 22 Sep 2020 02:44:41 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 22
 Sep 2020 02:44:41 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 22 Sep 2020 02:44:41 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08M7idTi099822;
 Tue, 22 Sep 2020 02:44:39 -0500
Subject: Re: [PATCH 4/7] drm/omap: Implement CTM property for CRTC using OVL
 managers CPR matrix
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20190902125359.18001-1-tomi.valkeinen@ti.com>
 <20190902125359.18001-5-tomi.valkeinen@ti.com>
 <20190903152413.GB8247@pendragon.ideasonboard.com>
 <b44372e2-1bb7-ddb8-d121-ae096b38d918@ti.com>
 <20190904111105.GA4811@pendragon.ideasonboard.com>
 <d75b942b-0256-3824-9055-1f6b68bb8c3b@ti.com>
 <CAKb7Uvhcvi5AQZq21ky8V07wjeNfdpV0y+5j=O=S1PTp=4o5Bw@mail.gmail.com>
 <5beadfb2-86a5-a782-ff88-ce77c727ecfe@ti.com>
 <20200921144944.3f2aa593@eldfell>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <b06e3c39-2a87-c5e0-0fdb-162eead5d36e@ti.com>
Date: Tue, 22 Sep 2020 10:44:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200921144944.3f2aa593@eldfell>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, Jyri Sarha <jsarha@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/09/2020 14:49, Pekka Paalanen wrote:

> would it not be simplest if KMS UAPI specification defined the abstract
> color pipeline with all the blocks that may be exposed with
> driver-agnostic UAPI, and then just say that if a block is not present,
> it behaves as pass-through, a no-op?
> 
> Each block would be represented by standardised KMS properties, that
> either exist or don't.
> 
> I think that would be fairly easy for userspace to grasp, but I don't
> know if the abstract model itself would be feasible considering all the
> hardware out there.
> 
> If we happened to be limited to
> 
> FB -> plane-degamma -> plane-CTM -> plane-gamma -> (blending) ->
> degamma -> CTM -> gamma -> encoder -> wire
> 
> it would still be tractable.
> 
> No funny business with new KMS properties changing how old KMS
> properties behave. Old userspace understands and uses old KMS
> properties but not new KMS properties, so it wouldn't even work.

Isn't this how it's currently defined for the output side? So if I understand right, your suggestion
means that a HW that has:

gamma -> CTM -> out

would map those to DRM's degamma and CTM, and the userspace should use degamma to do gamma? I'm ok
with that, and it's probably more manageable than having properties which would describe the order
of the blocks.

While using degamma for gamma sounds a bit illogical, but thinking of it as:

pregamma -> ctm -> postgamma

sounds fine.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
