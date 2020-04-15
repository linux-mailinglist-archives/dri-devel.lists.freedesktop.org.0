Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB011AA478
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 15:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040766E824;
	Wed, 15 Apr 2020 13:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB6E6E824
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 13:31:27 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03FDVNXs107173;
 Wed, 15 Apr 2020 08:31:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1586957483;
 bh=bLcmO1wP2LuxaPXNyrd89fecV1tT61snwlRqhfcr+wk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=cFWlfj3Eb5lgFQ4AsFRcGSVrs5KOd698My8/sNlfJgu5Rs9Gh2Ljod55tEsiPauPJ
 fzH/dwnBCUVxQcw4MjgWc1dZ/n5Zp7266QJ4XshKtChEZxunKLFfrvM99SbYubpMwH
 Js97nJz3/+ZjV9rkjr0M3iWTIKJDJ5yeNM8ar0Ac=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03FDVNvq040779
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 15 Apr 2020 08:31:23 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Apr 2020 08:31:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Apr 2020 08:31:22 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03FDVLF3089740;
 Wed, 15 Apr 2020 08:31:21 -0500
Subject: Re: [PATCH] drm/tidss: fix crash related to accessing freed memory
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200415092006.26675-1-tomi.valkeinen@ti.com>
 <20200415124550.GC4758@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <e5fac8b0-8025-96bd-92cd-9cdea5ef8955@ti.com>
Date: Wed, 15 Apr 2020 16:31:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415124550.GC4758@pendragon.ideasonboard.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 15/04/2020 15:45, Laurent Pinchart wrote:

>> +static void tidss_crtc_destroy(struct drm_crtc *crtc)
>> +{
>> +	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
>> +
>> +	drm_crtc_cleanup(crtc);
>> +	kfree(tcrtc);
> 
> I would personally store the CRTC pointers, or embed the CRTC instances
> in the tidss_device structure, and free everything in the top-level
> tidss_release() handler, to avoid spreading the release code all around
> the driver. Same for planes and encoders. It may be a matter of personal
> taste though, but it would allow dropping the kfree() calls in
> individual error paths and centralize them in a single place if you
> store the allocated pointer in tidss_device right after allocation.

This seemed the easiest way to fix this for 5.7-rcs, without doing too many changes all around that 
might cause conflicts. The allocs and frees are close to each other, in the same files, although 
there's repetition of course.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
