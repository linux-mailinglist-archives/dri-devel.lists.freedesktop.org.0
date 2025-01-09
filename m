Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E65DA07772
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C207410EDD5;
	Thu,  9 Jan 2025 13:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="iCA7Dvkl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E53410EDD5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 13:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vOrCV+Ck49Q8g7v+R3D5bRqM025jeXLIy0D6KSXsCLg=; b=iCA7DvklBq00sX28/hPN4oBWpE
 ZC8k+w/ZKZ9qIQjQqP3JBVBHwaTtjFf0AvpLyS+BV2ZF97xChP5ZxhcV5nGJcEphYLTGzvSmnG9Bg
 j9eVZtvz9XcRbjPDxvuHb7wd+B1VMjPSnJsIXu4r00KzyNQao7lzyVVHq5rY+2O4o6UsrSKxYIW+R
 QSag+cdNH73ZBwCHfNbewyLG9FgsWTzKMULLel2VUKe4b3fU5q+Mll3yAP7VeL7+8xeUvqgc7igOn
 87lPPpSdaqNhSa6TdjAShvTHldoZDzPzES2o/TfQXpToncoYygZgtSNLvPGTRalr3hsMxP48ybTuD
 3CvukVqA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tVscr-00DZSW-79; Thu, 09 Jan 2025 14:31:05 +0100
Message-ID: <70797b0f-e944-43e6-b5bd-5e22c92e2f38@igalia.com>
Date: Thu, 9 Jan 2025 13:31:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 11/14] drm/sched: Connect with dma-fence deadlines
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>, Rob Clark <robdclark@gmail.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <20241230165259.95855-12-tursulin@igalia.com>
 <7e74dffc-ff0c-449c-8b4d-20b500fa7800@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <7e74dffc-ff0c-449c-8b4d-20b500fa7800@mailbox.org>
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


On 09/01/2025 11:38, Michel Dänzer wrote:
> On 2024-12-30 17:52, Tvrtko Ursulin wrote:
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>> index 0f35f009b9d3..dfc7f50d4e0d 100644
>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>> @@ -168,6 +168,8 @@ static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>>   
>>   	spin_unlock_irqrestore(&fence->lock, flags);
>>   
>> +	drm_sched_entity_set_deadline(fence->entity, deadline);
> 
> AFAICT sync_file_ioctl_set_deadline passes through the unmodified deadline from user space. If the scheduler uses that directly, all user space can fake unlimited high priority for its jobs via the ioctl?

Yes, that wouldn't be great. I could only allow high priority 
contexts/entities to have their deadlines respected. I hope the uapi 
side of deadlines did not make any hard promises. Well obviously it did 
not since it is not wired up at the moment anyway.

I also need to improve it and pull in the internal deadline to some time 
before the userspace one.

Regards,

Tvrtko
