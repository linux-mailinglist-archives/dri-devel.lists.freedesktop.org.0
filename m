Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 587EA124BA3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 16:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3F76E56D;
	Wed, 18 Dec 2019 15:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D099C6E56D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 15:27:38 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBIFRXKb014527;
 Wed, 18 Dec 2019 09:27:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576682853;
 bh=0Qp0AtCxF680S7LDxo1URkVU18tqBDjREGmIZ+Wf/5E=;
 h=From:Subject:To:CC:References:Date:In-Reply-To;
 b=Hjlpx0fkeG5glvosozLq0pFye6GVFlRAl8mc8lmVzdikmKOcKiyGvoDFhaRq2CI6r
 BgGdmByNSsVatR3Z7F7FXqbawiCJckYapAkI8pVB04ndl+NTzMHvNR4n0hlhBRs+CC
 KHq91gvewUSECxteDMpStGxhdiZHDq5tHOO/2Gvk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBIFRXUx123900
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 18 Dec 2019 09:27:33 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 18
 Dec 2019 09:27:32 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 18 Dec 2019 09:27:32 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBIFRU3x096115;
 Wed, 18 Dec 2019 09:27:31 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 00/50] drm/omap: Replace custom display drivers with
 drm_bridge and drm_panel
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191215122728.GA32124@ravnborg.org>
 <20191218020336.GN4874@pendragon.ideasonboard.com>
 <932bbb46-a3fb-67c6-6f12-85540fe7f234@ti.com>
 <20191218144626.GD4863@pendragon.ideasonboard.com>
Message-ID: <6caaa467-37ea-6a9a-5895-2222281ea4bb@ti.com>
Date: Wed, 18 Dec 2019 17:27:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218144626.GD4863@pendragon.ideasonboard.com>
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
Cc: Sean Paul <sean@poorly.run>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/12/2019 16:46, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Wed, Dec 18, 2019 at 09:07:52AM +0200, Tomi Valkeinen wrote:
>> On 18/12/2019 04:03, Laurent Pinchart wrote:
>>>> Hopefully we can soon have this series landed so we can start
>>>> working on top of the new bridge/connector handling.
>>>>
>>>> I assume it will be applied direct to drm-misc-next, so we do not
>>>> have to wait extra time to get it.
>>>
>>> Tomi, how would you like to proceed ? The core patches are ready in my
>>> opinion. I can post a v4 without the omapdrm patches, which could be
>>> merged to drm-misc already while you finish reviewing patches 30/50
>>> onwards.
>>
>> This sounds good to me.
>>
>> I have tested your branch on AM5 EMV, AM4 EVM and Panda, without any issues. But that's with the
>> omapdrm patches, and things will be slightly different without them.
>>
>> You add TPD12S015 and OPA362 driver in the earlier part. Should those be moved to the omapdrm side?
>> In theory there won't be any issues, but having multiple drivers for the same device can create
>> conflicts.
> 
> Indeed, although if they're not selected it shouldn't be a problem. On
> the other hand you've reviewed the omapdrm patches up to "drm/omap:
> Switch the HDMI and VENC outputs to drm_bridge" which removes the old
> drivers, the rest being just cleanups. We could thus merge up to that
> patch in one go. What's your preference ?

I'll finish the reviews tomorrow, the rest of the patches look like quick to review.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
