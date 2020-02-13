Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCDC15BD16
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 11:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6EA56E1F9;
	Thu, 13 Feb 2020 10:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7F66E1F9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 10:50:15 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01DAnfXI105617;
 Thu, 13 Feb 2020 04:49:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581590981;
 bh=O0TSlCI6XSkFaaRYZWoLggvdT+mamM3SWbqJgmBxfko=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=fRj+75VwsLvf+hBoMkqYnNF3HRSt+eSJat/XHQzO7/zQG1Y1hkyrMIt+tsk9S2yW8
 ON4bxdycIMRsNOE9S+jQH/J/e+gHXYdhxr+tKgmTA6JG2DlMG/KCTwQHQCJ1NMiDVQ
 M9rm90xBqlcrB99l6Jhd0XxkeksclEUkKAfuYUPw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01DAnfUJ057161
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 13 Feb 2020 04:49:41 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 13
 Feb 2020 04:49:41 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 13 Feb 2020 04:49:40 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01DAncAF125343;
 Thu, 13 Feb 2020 04:49:39 -0600
Subject: Re: [PATCH v3] drm/tidss: dispc: Rewrite naive plane positioning code
To: Jyri Sarha <jsarha@ti.com>, <dri-devel@lists.freedesktop.org>
References: <20200213104419.29617-1-jsarha@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <0cd1098f-fb3d-34cb-2f79-bb543ca99203@ti.com>
Date: Thu, 13 Feb 2020 12:49:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200213104419.29617-1-jsarha@ti.com>
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
Cc: praneeth@ti.com, peter.ujfalusi@ti.com, laurent.pinchart@ideasonboard.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/2020 12:44, Jyri Sarha wrote:

> +	/*
> +	 * If a plane on a CRTC changes add all active planes on that
> +	 * CRTC to the atomic state. This is needed for updating the
> +	 * plane positions in tidss_crtc_position_planes() which is
> +	 * called from crtc_atomic_enable() and crtc_atomic_flush().
> +	 * The update is needed for x,y-position changes too, so
> +	 * zpos_changed condition is not enough and we need this if
> +	 * planes_changed is true too.
> +	 */
> +	for_each_new_crtc_in_state(state, crtc, cstate, i) {
> +		if (cstate->zpos_changed || cstate->planes_changed) {
> +			ret = drm_atomic_add_affected_planes(state, crtc);
> +			if (ret)
> +				return ret;
> +		}
> +	}

I think 99.99...% of the commits are such where only planes' fb address is changed. I think 
"planes_changed" is true for these. I wonder if it would be a sensible optimization to skip this for 
those 99.99...% cases. Can we detect that easily?

Well, we haven't optimized for those 99.99...% cases anywhere else either, so it's possible it 
doesn't matter.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
