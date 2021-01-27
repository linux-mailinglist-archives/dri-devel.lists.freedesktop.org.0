Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EF23070D9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4E06E8F6;
	Thu, 28 Jan 2021 08:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id ED81A6E3D0;
 Wed, 27 Jan 2021 10:24:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D72231B;
 Wed, 27 Jan 2021 02:24:53 -0800 (PST)
Received: from [10.57.4.29] (unknown [10.57.4.29])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F21263F66B;
 Wed, 27 Jan 2021 02:24:50 -0800 (PST)
Subject: Re: [PATCH] drm/lima: add governor data with pre-defined thresholds
To: Christian Hewitt <christianshewitt@gmail.com>
References: <20210125081804.13016-1-christianshewitt@gmail.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <9e30a8e1-ef69-5929-17f1-cdb603686495@arm.com>
Date: Wed, 27 Jan 2021 10:24:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20210125081804.13016-1-christianshewitt@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Qiang Yu <yuq825@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On 1/25/21 8:18 AM, Christian Hewitt wrote:
> This patch adapts the panfrost pre-defined thresholds change [0] to the
> lima driver to improve real-world performance. The upthreshold value has
> been set to ramp GPU frequency to max freq faster (compared to panfrost)
> to compensate for the lower overall performance of utgard devices.
> 
> [0] https://patchwork.kernel.org/project/dri-devel/patch/20210121170445.19761-1-lukasz.luba@arm.com/
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> I have been using Kodi as my test application. If you scroll in library
> views with hundreds of list items and the panfrost values the slow GPU
> ramp up is quite noticeable and the GUI feels sluggish. As everything
> lima runs on is inherently slower than panfrost using devices I believe
> it's better to ramp up to max freq quicker.

It's quite low value for the upthreshold, but I believe you have
experimented and observed that a bit higher (30, 40?) don't work well.
I don't know the Kodi system, though.

You can check if the other frequencies are also used in statistics for
devfreq device:
cat /sys/class/devfreq/<your_gpu>/trans_stats

If they are also used, then it OK (better than stuck at min freq).

Regards,
Lukasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
