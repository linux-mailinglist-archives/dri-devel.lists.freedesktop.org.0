Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC87478699
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 09:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060FF10F70E;
	Fri, 17 Dec 2021 08:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C04A210F70D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 08:56:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74FDF1435;
 Fri, 17 Dec 2021 00:56:03 -0800 (PST)
Received: from [10.57.6.245] (unknown [10.57.6.245])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16DE53F774;
 Fri, 17 Dec 2021 00:56:01 -0800 (PST)
Subject: Re: [PATCH] drm/panfrost: Avoid user size passed to kvmalloc()
To: Alyssa Rosenzweig <alyssa@collabora.com>
References: <20211216161603.983711-1-steven.price@arm.com>
 <Ybt8QWEAooP++R7a@maud>
From: Steven Price <steven.price@arm.com>
Message-ID: <0e62a011-ef0a-fa04-664e-a70e5dd49cf2@arm.com>
Date: Fri, 17 Dec 2021 08:56:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ybt8QWEAooP++R7a@maud>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/12/2021 17:49, Alyssa Rosenzweig wrote:
>> This provides an easy method for user
>> space to trigger the OOM killer (by temporarily allocating large amounts
>> of kernel memory)
> 
> panfrost user space has a lot of easy ways to trigger to the OOM killer
> unfortunately .... if this is something we want to fix there are a lot
> more patches coming :(
> 

Sorry I should have been a bit clearer in my wording. The issue isn't
triggering the OOM killer as such - it's triggering the OOM killer
without allocating memory accounted to the process. So e.g. allocating
large numbers of BOs should be ok as the OOM killer will come for the
process that allocated those BOs (so this is not much different from
allocating normal user space memory). However in this path there's no
user space allocation - so we can have a tiny process that triggers a
large kernel allocation and the OOM killer will go after every other
process first.

As Dan points out syzbot can have fun with this sort of thing (if it can
figure out the ioctl).

Thanks,

Steve
