Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEE9220240
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 04:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012716E21F;
	Wed, 15 Jul 2020 02:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2566E217
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 02:19:07 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 14 Jul 2020 19:19:03 -0700
Received: from [0.0.0.0] (oddjob.vmware.com [10.253.4.32])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 74F9940938;
 Tue, 14 Jul 2020 19:19:04 -0700 (PDT)
Subject: Re: [PATCH] drm/vmwgfx: Fix two list_for_each loop exit tests
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20200626103959.GC314359@mwanda>
 <77f0761a-11e6-e321-2245-700258d54924@vmware.com>
 <20200714082516.GZ2571@kadam>
From: Roland Scheidegger <sroland@vmware.com>
Message-ID: <9e2286d0-f941-bad6-d76a-efc60dbab712@vmware.com>
Date: Wed, 15 Jul 2020 04:19:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200714082516.GZ2571@kadam>
Content-Language: de-DE
Received-SPF: None (EX13-EDG-OU-001.vmware.com: sroland@vmware.com does not
 designate permitted sender hosts)
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.07.20 um 10:25 schrieb Dan Carpenter:
> On Tue, Jul 14, 2020 at 03:39:13AM +0200, Roland Scheidegger wrote:
>> Am 26.06.20 um 12:39 schrieb Dan Carpenter:
>>> These if statements are supposed to be true if we ended the
>>> list_for_each_entry() loops without hitting a break statement but they
>>> don't work.
>>>
>>> In the first loop, we increment "i" after the "if (i == unit)" condition
>>> so we don't necessarily know that "i" is not equal to unit at the end of
>>> the loop.
>> So, if I understand this right, this would only really be a problem if
>> there's no list entries at all, right? That is i == unit == 0.
>> Not sure if that can actually happen, but in any case the fix looks correct.
> 
> An empty list and there is another potential issue where unit is exactly
> off by one.
> 
> 	list_for_each_entry(con, &dev_priv->dev->mode_config.connector_list,
> 			    head) {
> 		if (i == unit)
> 			break;
> 		++i;  <-- this is the last iteration and it's off by one
> 			  so now i == unit but we didn't exit via the
> 			  break statement.
> 	}
> 
> 	if (i != unit) {
>             ^^^^^^^^^
> Since we didn't exit by the break statement we want this to be true but
> it's false instead.
> 
> 		DRM_ERROR("Could not find initial display unit.\n");
> 
> I don't know how *likely* this is, but static checkers complain.
> Technically correct is the best kind of correct!  ;)
Ahh indeed seems obvious now. But kinda difficult to spot :-).

Thanks again,

Roland


> 
> regards,
> dan carpenter
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
