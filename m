Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D0E581131
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 12:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841578A2D6;
	Tue, 26 Jul 2022 10:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94FC8A297
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 10:32:34 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26Q7EU0R002774;
 Tue, 26 Jul 2022 05:32:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=Rgzgn6pxWGdE46sVS9kTTyVGpCIohZ0hRtKU1FWs9Mc=;
 b=RXQjezNLjwj/HpVEXGbOyfRCXB5YFUyDPskFMN5B2gh2Ii7dYvLXpqCWvBXlpciFOLp+
 ESVZEG+AgwriFTCm8AyIa307P3hdpEJq7POcukYdaxYJ2/ip1izmyVEKqM9HP0oiMSpl
 SUhhPH0nMCGOPu1pHgFDZ5Vxj4P1dptp12vmowgDW+MSWdxsSTRJDgwK2qZgxo4vTjgy
 XWedYzXp/50XmnKgDTiDT6X/3H56QT4epJJ3p8pwGH5nTzHL8yp3UmCCIyZQBRG33R2E
 FNubhDk8/aIq4L7nhjQukMX+1R6rYZkJEv14JD3PdVPTzsvYyBmlbyrRbsAHkHrqVQvJ Dg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3hged1ubug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 05:32:31 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Tue, 26 Jul
 2022 05:32:29 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1118.9 via Frontend Transport; Tue, 26 Jul 2022 05:32:29 -0500
Received: from [198.90.251.95] (edi-sw-dsktp-006.ad.cirrus.com [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B1BAE2C5;
 Tue, 26 Jul 2022 10:32:29 +0000 (UTC)
Message-ID: <4165774b-2b96-83d1-67eb-f7c49dd8041e@opensource.cirrus.com>
Date: Tue, 26 Jul 2022 11:32:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] component: try_module_get() to prevent unloading while in
 use
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20220725160859.1274472-1-rf@opensource.cirrus.com>
 <Yt7cT66p0Bn+aXn5@kroah.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <Yt7cT66p0Bn+aXn5@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _DlEI_9hgYWZuqTkzb6e6eQs-CQ8iuIv
X-Proofpoint-ORIG-GUID: _DlEI_9hgYWZuqTkzb6e6eQs-CQ8iuIv
X-Proofpoint-Spam-Reason: safe
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
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rafael@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/07/2022 19:09, Greg KH wrote:
> On Mon, Jul 25, 2022 at 05:08:59PM +0100, Richard Fitzgerald wrote:
>> Call try_module_get() on a component before attempting to call its
>> bind() function, to ensure that a loadable module cannot be
>> unloaded while we are executing its bind().
> 
> How can bind be called while the module is unloaded?
> 

I didn't say it could. What I said is "unloaded while we are executing
its bind()". Maybe that's already guaranteed to be safe somehow. It's
actually the problem below that I was trying to fix but placing the
try_module_get() before the bind() rather than after bind() seemed a
trivial extra safety.

>> If the bind is successful the module_put() is called only after it
>> has been unbound. This ensures that the module cannot be unloaded
>> while it is in use as an aggregate device.
> 
> That's almost never the correct thing to do, what problem is this
> solving?
> 

What I see is that when a loadable module has been made part of an
aggregate it is still possible to rmmod'd it.

An alternative workaround would be for the parent to softdep to every
driver that _might_ provide the aggregated components. Softdeps aren't
unusual (we use it in some drivers that are directly related but don't
directly link into each other). But to me this feels like a hack when
used with the component framework - isn't the idea that the parent
doesn't know (or doesn't need to know) which drivers will be aggregated?
Wouldn't it be better that when a component driver is bound into an
aggregate its module is automatically marked in-use?

If there's a better way to mark the module in-use while is it bound
into an aggregate, let me know and I'll look at implementing it.

> thanks,
> 
> greg k-h
