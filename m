Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A36DF13279D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 14:30:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F095F6E05D;
	Tue,  7 Jan 2020 13:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6F16E05D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 13:30:44 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 007DURTO071576;
 Tue, 7 Jan 2020 07:30:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1578403827;
 bh=oIRYCz7LOAD0EbCATIFEXlHHAWz+kvMI81nO7v0KVgM=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=hK9JVBsQA0w9wNmgbqK9GU8z960PZhm3TJ62iWpTQ6ulIytmy6XzZw7/bvZcMy7Ao
 pe7bFjuSbFRuuqaCRPRpa9ZYIU1R++SaUHtdKvKaVaQToS6eKxxlyY2rGooQV0fRA7
 STBRBLUniLwpgL4usOEtqbMVQ5nGtvbNCwrUmS2Q=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 007DURdq118756
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 7 Jan 2020 07:30:27 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 7 Jan
 2020 07:30:26 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 7 Jan 2020 07:30:26 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 007DUOoJ119993;
 Tue, 7 Jan 2020 07:30:24 -0600
Subject: Re: [PATCH] drm/omap: gem: Fix tearing with BO_TILED
To: Tony Lindgren <tony@atomide.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-omap@vger.kernel.org>, "H . Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>,
 Matthijs van Duin <matthijsvanduin@gmail.com>
References: <20191221005711.47314-1-tony@atomide.com>
 <20191221164141.GI35479@atomide.com> <20200104050950.GA11429@chinchilla>
 <20200104055011.GA5885@atomide.com> <20200105203704.GD5885@atomide.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <6526b54b-a3c3-2873-2164-f9b96f11ad68@ti.com>
Date: Tue, 7 Jan 2020 15:30:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200105203704.GD5885@atomide.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/01/2020 22:37, Tony Lindgren wrote:
> Hi,
> 
> * Tony Lindgren <tony@atomide.com> [200104 05:51]:
>>
>> Just changing the alingment fixes the issue. Looks like the minimum
>> alignment we currently allow is 128, I think 512 was the minimum
>> that worked for me, so maybe the right fix would be to just change
>> the minimum to 512 with no specific need to use 4096 for now.
> 
> So Matthijs and I chatted about this a bit on irc, and here's what
> we concluded so far:
> 
> 1. We have at least three different alignment needs for tiler
> 
> - Linux use of tiler aligned to 128 bytes
> 
> - SGX use of tiler aligned to 4096 bytes (or 512 bytes?)
> 
> - Fast userspace mapping aligned to 4096 bytes
> 
> 2. The alignment need may need to be configured by the tiler consumer
>     in #1 above
> 
> 3. The alignment need for SGX seems to be based on SGX MMU page size
> 
> 4. The issue I'm seeing with stellarium on droid4 may be a stride
>     issue as about one out of 3 or 4 frames is OK and aligning to
>     512 also fixes the issue maybe because it happens to make
>     multiple frames align to 4096
> 
> So let's wait on this patch until we have more info and know how
> the different alignments should be handled.

I don't know if these are related to the issue you have, and it's been a while since I looked at 
TILER, but two thoughts after looking at the thread:

- If the usergart is not used, the width of each line has to be expanded to be page size aligned, 
right? Do the patches from Matthijs do this?

- Afaik, there's no safe way to use TILER 2D buffers with other IPs. dmabuf exposes the buffers as 
contiguous, i.e. including also the area outside the buffer itself (the TILER "stride"). The IPs 
have no idea that they should not be touching the are outside the buffer itself. My experience with 
this is with the capture drivers, and I don't know if the SGX driver deals with the buffers the same 
way, though. If there's special TILER 2D support code in the SGX driver, then it might be safe.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
