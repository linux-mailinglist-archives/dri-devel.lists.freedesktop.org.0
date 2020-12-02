Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CED2CBBF1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 12:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DB26EA18;
	Wed,  2 Dec 2020 11:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2AD6EA18
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 11:52:14 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B2Bq58K008754;
 Wed, 2 Dec 2020 05:52:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606909925;
 bh=5LCAFrusraR24nb3XrGoOmt1D3yteLf6ottAwTKWWs4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=qEEC5fctkXUoWdbp1e0sUEGqCodHQRG8qLOCMmWuzrezVrw2yJrhsMDT2bcdqywdM
 VW/GVDF7C1zzhfqxkCmHJkFMDzPjzUTAutQlU5iW8J5Akoz1Ip/WTH1yxhaHlN1fsx
 rYrK7LOOWNO2ahnLHjJ5hbd7M5d2wWcgTsvxULpA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B2Bq5D6022260
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 2 Dec 2020 05:52:05 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 2 Dec
 2020 05:52:04 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 2 Dec 2020 05:52:04 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B2Bq2OE127226;
 Wed, 2 Dec 2020 05:52:02 -0600
Subject: Re: [PATCH v2 1/5] drm: add legacy support for using degamma for gamma
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201103080310.164453-1-tomi.valkeinen@ti.com>
 <20201103080310.164453-2-tomi.valkeinen@ti.com>
 <20201130103840.GR4141@pendragon.ideasonboard.com>
 <f744a803-6d8c-5188-7bfa-93cc05cc26bf@ti.com>
 <20201130141057.GL401619@phenom.ffwll.local>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <93e718be-01ff-fc5c-6497-f7afb2becb38@ti.com>
Date: Wed, 2 Dec 2020 13:52:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130141057.GL401619@phenom.ffwll.local>
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
 Nikhil Devshatwar <nikhil.nd@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/11/2020 16:10, Daniel Vetter wrote:

> The thing is, the legacy helpers should be able to pull off what userspace
> needs to do when it's using atomic anyway. Hard-coding information in the
> kernel means we have a gap here. Hence imo legacy helpers doing the right
> thing in all reasonable cases is imo better.
> 
> In many cases I think we should even go further, and ditch driver ability
> to overwrite legacy helper hooks like this. I thought we'd need that
> flexibility for legacy userspace being incompatible in awkward ways, but
> wasn't ever really needed. Worse, many drivers forget to wire up the
> compat hooks.
> 
> tldr, imo right thing to do here:
> - move legacy gamma function from helpers into core code
> - call it unconditionally for all atomic drivers (if there's no legacy
>   drivers using the hook left then we can outright remove it)
> - make sure it dtrt in all cases

There are atomic drivers which have their custom gamma_set function. I guess they don't support
atomic color mgmt, but do support (legacy) gamma.

We could make the core code call the gamma legacy helper automatically for atomic drivers that don't
have gamma_set defined but do have GAMMA_LUT or DEGAMMA_LUT. But the gamma_set function is called
also in a few places from drm_fb_helper.c, so this code wouldn't be fully inside drm_color_mgmt.c.

Or we could just change drm_atomic_helper_legacy_gamma_set() to do the right thing, depending on
GAMMA_LUT & DEGAMMA_LUT existence.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
