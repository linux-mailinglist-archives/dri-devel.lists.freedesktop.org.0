Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 108EA3BE559
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 11:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417746E85D;
	Wed,  7 Jul 2021 09:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C2A336E85D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 09:09:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E48F4ED1;
 Wed,  7 Jul 2021 02:09:53 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D9523F694;
 Wed,  7 Jul 2021 02:09:52 -0700 (PDT)
Subject: Re: [PATCH v3 5/7] drm/panfrost: Add a new ioctl to submit batches
To: Alyssa Rosenzweig <alyssa@collabora.com>
References: <20210702143225.3347980-1-boris.brezillon@collabora.com>
 <20210702143225.3347980-6-boris.brezillon@collabora.com>
 <YN8tDD6tRF85cR4z@maud> <20210702173843.44b3e322@collabora.com>
 <YN9DsztrsMWY1rv+@maud> <20210702201112.4c07c2c7@collabora.com>
 <a059fc1a-2596-314c-ace8-c3bd44d1b052@arm.com>
 <20210705104319.7b709530@collabora.com>
 <b2002c8c-ebce-0d6b-03d1-d29775db3cc5@arm.com> <YORRLPYgX1nbetLG@maud>
From: Steven Price <steven.price@arm.com>
Message-ID: <42936ea3-6bb5-72c3-ca99-355218b8ac8d@arm.com>
Date: Wed, 7 Jul 2021 10:09:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YORRLPYgX1nbetLG@maud>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/07/2021 13:48, Alyssa Rosenzweig wrote:
>> My concern is if we ever find a security bug which requires new
>> information/behaviour in the submit ABI to properly fix. In this case it
>> would be appropriate to backport a 'feature' (bug fix) which provides a
>> new ABI but it would need to be a small change. A flags field where we
>> can set a "PANFROST_ACTUALLY_BE_SECURE" bit would be useful then - but
>> we wouldn't want to start bumping version numbers in the backport.
>>
>> But at least for now we could just assume we'll expand the ioctl struct
>> if we ever hit that situation, so no need for an explicit flags field.
> 
> I'm curious if kbase ever hit something like this? It wouldn't have
> occurred to me as a possibility.
> 

kbase (at least historically) didn't care about backwards compatibility
- so has tended to just break the ABI if necessary.

We have had workarounds such as BASE_HW_ISSUE_8987 (with the lovely
named DEFAULT_SECURE_BUT_LOSS_OF_PERFORMANCE flag) where the isolation
between address spaces was broken. It might have been reasonable in that
situation to have exposed a new flag which allows security sensitive
applications (e.g. the on-screen keyboard) to force the more secure mode
of operation (taking the performance hit) while not penalising other
applications.

But it's probably just my paranoia ;) All the serious security bugs I
can think of were genuine software bugs and could just be fixed.

Steve
