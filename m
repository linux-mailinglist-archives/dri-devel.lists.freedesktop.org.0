Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 996C96D55B7
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 03:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E588410E115;
	Tue,  4 Apr 2023 01:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FCA10E115
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 01:07:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id AA28F42463;
 Tue,  4 Apr 2023 01:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1680570473;
 bh=NqFfGeRAgetr0RxYEmdjG5bzNmvvZRW80Gx/LVqUOIQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=zZ5YdSlJDGhuIkCOiu1ay0BzfsV55EZ2zTqPImZXSdIcxZawUK3q7fqU7No9AM8V6
 Jx9eDhaCb9Vq5UU8Qnqs0OWQiJNHw8FihZqgPt8Rfxt3AxzOZXe434N3D21vEq8Hzv
 ItSMNpxw6WpDfrG8PoNSJ9PBa0q/UDWyL3rB53pEm5Camwu5GHFlCX80wtLSNzdSI5
 PqkvWMotrtkl6By4FZz7j1HY3AruyeWJOEqCDLMtssgoEdtDkCnw3vgulTY4/ThP64
 t0TKKoa91PAzQA75u4/ovNeLTfymg8K6Q0CennShwwLmR+00sT+SWR9LIoiLirWM3d
 ycJiHFpWmXgDQ==
Message-ID: <50fff1d4-9982-d60d-23e0-66c2020af5bf@asahilina.net>
Date: Tue, 4 Apr 2023 10:07:48 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230404002211.3611376-1-matthew.brost@intel.com>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <20230404002211.3611376-1-matthew.brost@intel.com>
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, thanks for the Cc!

On 04/04/2023 09.22, Matthew Brost wrote:
> Hello,
> 
> As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
> have been asked to merge our common DRM scheduler patches first as well
> as develop a common solution for long running workloads with the DRM
> scheduler. This RFC series is our first attempt at doing this. We
> welcome any and all feedback.
> 
> This can we thought of as 4 parts detailed below.
> 
> - DRM scheduler changes for 1 to 1 relationship between scheduler and
> entity (patches 1-3)
> 
> In Xe all of the scheduling of jobs is done by a firmware scheduler (the
> GuC) which is a new paradigm WRT to the DRM scheduler and presents
> severals problems as the DRM was originally designed to schedule jobs on
> hardware queues. The main problem being that DRM scheduler expects the
> submission order of jobs to be the completion order of jobs even across
> multiple entities. This assumption falls apart with a firmware scheduler
> as a firmware scheduler has no concept of jobs and jobs can complete out
> of order. A novel solution for was originally thought of by Faith during
> the initial prototype of Xe, create a 1 to 1 relationship between scheduler
> and entity. I believe the AGX driver [3] is using this approach and
> Boris may use approach as well for the Mali driver [4].
> 
> To support a 1 to 1 relationship we move the main execution function
> from a kthread to a work queue and add a new scheduling mode which
> bypasses code in the DRM which isn't needed in a 1 to 1 relationship.
> The new scheduling mode should unify all drivers usage with a 1 to 1
> relationship and can be thought of as using scheduler as a dependency /
> infligt job tracker rather than a true scheduler.

Yup, we're in the exact same situation with drm/asahi, so this is very 
welcome! We've been using the existing scheduler as-is, but this should 
help remove some unneeded complexity in this use case.

Do you want me to pull in this series into our tree and make sure this 
all works out for us?

I also have a couple bugfixes for drm/sched I need to send out, but I 
think the rebase/merge with this series should be trivial. I'll send 
that out this week.

> - Generic messaging interface for DRM scheduler
> 
> Idea is to be able to communicate to the submission backend with in band
> (relative to main execution function) messages. Messages are backend
> defined and flexable enough for any use case. In Xe we use these
> messages to clean up entites, set properties for entites, and suspend /
> resume execution of an entity [5]. I suspect other driver can leverage
> this messaging concept too as it a convenient way to avoid races in the
> backend.

We haven't needed this so far (mostly by using fine-grained locking and 
refcounting all over the place) but I can see it being useful to 
simplify some of those constructs and maybe avoid potential deadlocks in 
some places. I'm not sure yet whether we can fully get rid of the main 
queue refcounting/locking (our completion/error signaling path doesn't 
map well to DMA fences directly so we still need something there to get 
from the global GPU completion signaling thread to individual queues) 
but it might be a step in the right direction at least!

~~ Lina

