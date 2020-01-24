Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AF1148524
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 13:29:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECA46FA4A;
	Fri, 24 Jan 2020 12:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A877C6FA4A;
 Fri, 24 Jan 2020 12:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id DE4EA3F39C;
 Fri, 24 Jan 2020 13:29:02 +0100 (CET)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=fmn/uwOf; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wf9tc-gPkaPd; Fri, 24 Jan 2020 13:29:02 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 69BAE3F36B;
 Fri, 24 Jan 2020 13:29:00 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 8EDEA36015F;
 Fri, 24 Jan 2020 13:29:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1579868940; bh=39fWQg6VSLXjSvmE+Hqa3YydW9mZEqNCTX4MsHfyyc0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fmn/uwOfWubGYy+HzDh47xmzlhO80Qln1807n0/w1+cH7F7NqQRyHV4Q9A0ixNBXy
 yX/EWy6o1w3F9y4Thz59kjrWGtX+b6cZRW73nQunvPp5xfoEzJs3L669crGAsLqa51
 r/g5vIt5wEc7/7VSEESILeQG38df7mUkfZAC7pmw=
Subject: Re: [PATCH v2] drm: Release filp before global lock
To: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org
References: <20200122155637.496291-1-chris@chris-wilson.co.uk>
 <20200123222112.26840-1-chris@chris-wilson.co.uk>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <42d50b1f-8e9d-ef5d-88d2-74cde7c09ce8@shipmail.org>
Date: Fri, 24 Jan 2020 13:29:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200123222112.26840-1-chris@chris-wilson.co.uk>
Content-Language: en-US
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
Cc: intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/23/20 11:21 PM, Chris Wilson wrote:
> The file is not part of the global drm resource and can be released
> prior to take the global mutex to drop the open_count (and potentially
> close) the drm device. As the global mutex is indeed global, not only
> within the device but across devices, a slow file release mechanism can
> bottleneck the entire system.
>
> However, inside drm_close_helper() there are a number of dev->driver
> callbacks that take the drm_device as the first parameter... Worryingly
> some of those callbacks may be (implicitly) depending on the global
> mutex.

 From a quick audit, via, sis and vmwgfx are safe, so for those

Acked-by: Thomas Hellstrom <thellstrom@vmware.com>

Savage appears to be unsafe, due to unprotected access in the dma device 
member. Haven't audited i810 or potential other drivers affected. 
Perhaps it makes sense to enable lockfree filp release on a per-driver 
basis to begin with?

/Thomas


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
