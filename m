Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FB416FDB4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 12:30:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7C86E4C9;
	Wed, 26 Feb 2020 11:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3220A6E4C9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 11:30:39 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01QBUZ9d075431;
 Wed, 26 Feb 2020 05:30:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582716635;
 bh=Qi7tyoQuQdbHE6mRABzRfE/kS163wNB3e2L+hAQCg3Y=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=oVhwl/EoTn3GpiDCZVksre8bZxyIBl4JnKUAyv6sxyXQJh5QfOfvnGz8HgWBOxqlb
 9Xto504upHZPT791ZmGFfTmf+6te4eDqEop6YwdL49qyCldI1OjM3zup66GuNDye86
 7/eA5/AGeuFuxLFraokgZ/vJwnrb/izalsXhb3C8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01QBUZjg028759
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 26 Feb 2020 05:30:35 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 26
 Feb 2020 05:30:24 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 26 Feb 2020 05:30:24 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01QBUNjQ068536;
 Wed, 26 Feb 2020 05:30:23 -0600
Subject: Re: [PATCH v5] drm/tidss: dispc: Fix broken plane positioning code
To: Jyri Sarha <jsarha@ti.com>, <dri-devel@lists.freedesktop.org>
References: <20200224200204.764-1-jsarha@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <776d3596-bf3f-24af-65fb-8b822710a855@ti.com>
Date: Wed, 26 Feb 2020 13:30:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224200204.764-1-jsarha@ti.com>
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
Cc: peter.ujfalusi@ti.com, laurent.pinchart@ideasonboard.com, praneeth@ti.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/02/2020 22:02, Jyri Sarha wrote:
> The old implementation of placing planes on the CRTC while configuring
> the planes was naive and relied on the order in which the planes were
> configured, enabled, and disabled. The situation where a plane's zpos
> was changed on the fly was completely broken. The usual symptoms of
> this problem was scrambled display and a flood of sync lost errors,
> when a plane was active in two layers at the same time, or a missing
> plane, in case when a layer was accidentally disabled.
> 
> The rewrite takes a more straight forward approach when HW is
> concerned. The plane positioning registers are in the CRTC (or
> actually OVR) register space and it is more natural to configure them
> in a one go when configuring the CRTC. To do this we need make sure we
> have all the planes on the updated CRTCs in the new atomic state. The
> untouched planes on CRTCs that need plane position update are added to
> the atomic state in tidss_atomic_check().
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
