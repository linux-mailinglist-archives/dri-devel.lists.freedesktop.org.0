Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A238BDDC6
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 11:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71E710ED18;
	Tue,  7 May 2024 09:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="s3LA4Acg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD0610ED18
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 09:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OLS/N5P3FtoLgrFGKOse8TqhjN4ZBFdnpVw6omGPAJs=; b=s3LA4AcgT1FdIAJ5XDkrHWU6J0
 ffWwQSdJRLLA5pncHrlJ8ThtdZjmC56JYN7OkkTLHAqYLHoAWkt5HU3I/VuGYnH0wV4nU256tnkZq
 iE7GGeXekRylbfE+VpKh6bMwINZgFFVGgs4lizgPOIJ/YIDfoghBw4SwqvppiodOpRdQrWKJZ8G+J
 J56mfQ44iDPG3zLAyY/8iTZTVcRRg4s3Hou33TUNuCJV9wpci+S3vhtIubugz+8m/6iA4T0rWtAmq
 UTVoOpRZ0TRBAfeoxi70ADdqFE5aNGrjxsAkD4JRvrD+vMqD/fsrUOxwCfr8hpVWMPmRA2Ruk5ouT
 ePnwPqLw==;
Received: from [84.69.19.168] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1s4Gp4-001jge-Pq; Tue, 07 May 2024 11:09:18 +0200
Message-ID: <55e260b7-12d3-462b-aa08-a939a4ee67ef@igalia.com>
Date: Tue, 7 May 2024 10:09:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm scheduler and wq flavours
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <7236d76a-8e6d-4a8e-9e4e-e2644c5df2d7@igalia.com>
 <ZjlmZHBMfK9fld9c@DUT025-TGLU.fm.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <ZjlmZHBMfK9fld9c@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 07/05/2024 00:23, Matthew Brost wrote:
> On Thu, May 02, 2024 at 03:33:50PM +0100, Tvrtko Ursulin wrote:
>>
>> Hi all,
>>
>> Continuing after the brief IRC discussion yesterday regarding work queues
>> being prone to deadlocks or not, I had a browse around the code base and
>> ended up a bit confused.
>>
>> When drm_sched_init documents and allocates an *ordered* wq, if no custom
>> one was provided, could someone remind me was the ordered property
>> fundamental for something to work correctly? Like run_job vs free_job
>> ordering?
>>
> 
> Before the work queue (kthread design), run_job & free_job were ordered.
> It was decided to not break this existing behavior.

Simply for extra paranoia or you remember if there was a reason identified?

>> I ask because it appears different drivers to different things and at the
>> moment it looks we have all possible combos or ordered/unordered, bound and
>> unbound, shared or not shared with the timeout wq, or even unbound for the
>> timeout wq.
>>
>> The drivers worth looking at in this respect are probably nouveau, panthor,
>> pvr and xe.
>>
>> Nouveau also talks about a depency betwen run_job and free_job and goes to
>> create two unordered wqs.
>>
>> Then xe looks a bit funky with the workaround/hack for lockep where it
>> creates 512 work queues and hands them over to user queues in round-robin
>> fashion. (Instead of default 1:1.) Which I suspect is a problem which should
>> be applicable for any 1:1 driver given a thorough enough test suite.
>>
> 
> I think lockdep ran out of chains or something when executing some wild
> IGT with 1:1. Yes, any driver with a wild enough test would likely hit
> this lockdep splat too. Using a pool probably is not bad idea either.

I wonder what is different between that and having a single shared 
unbound queue and let kernel manage the concurrency? Both this..

>> So anyway.. ordered vs unordered - drm sched dictated or at driver's choice?
>>
> 
> Default ordered, driver can override with unordered.

.. and this, go back to my original question - whether the default queue 
must be ordered or not, or under which circustmances can drivers choose 
unordered. I think in drm_sched_init, where kerneldoc says it will 
create an ordered queue, it would be good to document the rules.

Regards,

Tvrtko
