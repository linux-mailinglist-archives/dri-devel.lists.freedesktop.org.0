Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFF6A0B4A2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 11:32:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8798B10E62D;
	Mon, 13 Jan 2025 10:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hhEnqQaL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421B010E636
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 10:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1JVzKP2IlDqQEzmQWPyrEpKXy+Laoi5wufhIqZo3qIk=; b=hhEnqQaLlHZKhbG9GHS2iV7a4U
 HBFYcsUAAhw3SbGZm05dzP7pXqK5y4VovnPE3HEedu4Ef0IUci1jqzvwF2gxGwQQC+fsn+nEXGdyU
 vvIVtJrmSxAbEYFyjqDywcCU1r7jeQTGCDKwKYabXPPjDH/KchBzqFAdZCyvjxlDSskaqkEsZ27t4
 sYbywPWonZnE6g6XOt6X2oGzY0Ef8uCnN7SnHTUFjII4eLHM0EyPYYmyYVFl1eGUbKEw0EA6RkqHa
 p1e7yqBAEsSNDj7gZtO+LoNMm+Ln5FeV54tCeq7ub7pM3vu2yv5V58fmA0Dd/duafdmk54zSFh4rq
 3wjDVriQ==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tXHkD-00F8iL-6K; Mon, 13 Jan 2025 11:32:29 +0100
Message-ID: <4f2bb683-f25e-4f75-80c7-14bae601450c@igalia.com>
Date: Mon, 13 Jan 2025 10:32:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 07/18] drm/imagination: Use the drm_sched_job_has_dependency
 helper
To: Matt Coster <Matt.Coster@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>, Frank Binns <Frank.Binns@imgtec.com>
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
 <20250108183528.41007-8-tvrtko.ursulin@igalia.com>
 <97165dc2-2693-4bd1-86fc-9f29913d3969@imgtec.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <97165dc2-2693-4bd1-86fc-9f29913d3969@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


Hi Matt,

On 10/01/2025 16:39, Matt Coster wrote:
> On 08/01/2025 18:35, Tvrtko Ursulin wrote:
>> Instead of manually peeking into the DRM scheduler implementation details
>> lets use the previously added helper.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <pstanner@redhat.com>
>> Cc: Frank Binns <frank.binns@imgtec.com>
>> Cc: Matt Coster <matt.coster@imgtec.com>
> 
> Reviewed-by: Matt Coster <matt.coster@imgtec.com>

Thanks - let me resend these two standalone.

Regards,

Tvrtko
