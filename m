Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF022CEC8B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 11:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB546E140;
	Fri,  4 Dec 2020 10:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0B46E13A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 10:56:36 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B4AuUDi005458;
 Fri, 4 Dec 2020 04:56:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607079390;
 bh=G7+R3h12cNc1pD2JLecmKNlcK9n4nufOVHzz6150Mcs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=lSNmsbCayez6seiRFbSE4enR5GYN+VcDmN3gB2g5BhppE4LtLCFNlXfDxqoSVeaSm
 ikPHaxycjv2l2C15QoGH/WdocG6uBAahbR1gH50mXf7ndts3Y0NuWGj2hQRdtzNwLQ
 EH+756eQychL2T82inxvndj7iE9KNgyrBIewLXEM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B4AuUo1010885
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 4 Dec 2020 04:56:30 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 4 Dec
 2020 04:56:29 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 4 Dec 2020 04:56:29 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B4AuRHh074501;
 Fri, 4 Dec 2020 04:56:28 -0600
Subject: Re: [PATCH v4 5/7] drm/tidss: Set bus_format correctly from
 bridge/connector
To: Boris Brezillon <boris.brezillon@collabora.com>, Nikhil Devshatwar
 <nikhil.nd@ti.com>
References: <20201201121830.29704-1-nikhil.nd@ti.com>
 <20201201121830.29704-6-nikhil.nd@ti.com>
 <20201204115030.04509092@collabora.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <422bd85b-cbda-7b9f-4393-057bef127894@ti.com>
Date: Fri, 4 Dec 2020 12:56:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201204115030.04509092@collabora.com>
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
Cc: Yuti Amonkar <yamonkar@cadence.com>, Sekhar Nori <nsekhar@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Boris,

On 04/12/2020 12:50, Boris Brezillon wrote:
> On Tue, 1 Dec 2020 17:48:28 +0530
> Nikhil Devshatwar <nikhil.nd@ti.com> wrote:
> 
>> Remove the old code to iterate over the bridge chain, as this is
>> already done by the framework.
>> The bridge state should have the negotiated bus format and flags.
>> Use these from the bridge's state.
>> If the bridge does not support format negotiation, error out
>> and fail.
> 
> That'd be even better if you implement the bridge interface instead of
> the encoder one so we can get rid of the encoder_{helper}_funcs and use
> drm_simple_encoder_init().

I'm a bit confused here. What should be the design here...

These formats need to be handled by the crtc (well, the display controller, which is modeled as the
crtc). Should we have a tidss_crtc.c file, which implements a crtc, a simple encoder and a bridge?
And just consider those three DRM components as different API parts of the display controller?

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
