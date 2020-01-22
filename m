Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25426145940
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 17:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E82F6F5BE;
	Wed, 22 Jan 2020 16:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9054A6F5BE
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 16:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HhYTSAkpNLbXz+OhwRONY5jVpeGYq+xxBfjetx6HZO4=; b=Kb1AHbFmNn+swdgubtklczJjSV
 2ZP77IQ1sKU8/SKzKBnJBse9teEvzCzhLdQPmRF5AGQ7/k7OqdJhKTEhEKmzX4Ume5rbaeOxp+TUY
 ismqhDsQkI1YLeOxqif9EOnwlE/xTuTfpCdm8trpL6PXko7pAG5/NNEi/IQjvmk5AXqABmYBv2IuE
 0RDtw/QKj5OKgM+1Tn8Urfzi+k6tiRG5MvY2xdIh8tCWxjUjXn0IZZFvfmOY/xRhdUOAx+Gk4HB1G
 VximlmpddKnvtcICMk/f6P7o6VhjLqipTVAYbc0BMw/EM7AU4bqyicLxu5X29XFXl3dFn2ZzJ6Dkc
 qsXr3knw==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:43752 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1iuISn-00040P-BE; Wed, 22 Jan 2020 11:02:41 -0500
Subject: Re: [PATCH v1 2/4] drm/tiny/repaper: No need to set ->owner for
 spi_register_driver()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20200122105403.30035-1-andriy.shevchenko@linux.intel.com>
 <20200122105403.30035-2-andriy.shevchenko@linux.intel.com>
From: David Lechner <david@lechnology.com>
Message-ID: <8e1d79b1-fd5f-ebe9-0496-26121b7031ed@lechnology.com>
Date: Wed, 22 Jan 2020 10:02:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200122105403.30035-2-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

On 1/22/20 4:54 AM, Andy Shevchenko wrote:
> The spi_register_driver() will set the ->owner member to THIS_MODULE.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
Reviewed-by: David Lechner <david@lechnology.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
