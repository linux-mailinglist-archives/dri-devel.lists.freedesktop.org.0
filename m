Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKhvC7ujjWlh5gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:56:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0027512C174
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F49E10E715;
	Thu, 12 Feb 2026 09:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nWWr6peE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823C810E71E;
 Thu, 12 Feb 2026 09:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4r0axd0p9XoEl01VZ9/+DTiAeYB+VWDSn46gotmm7z8=; b=nWWr6peEIhBI1uqfmMMBfW6bMS
 gFnz5tGiqA+8i7y8aB5GEb9C8zbQgvINBDKESIyBCAXs9Hr+2UnP9cG96gRHS6E6OugwMP3gvwgXE
 AVnXAEjxfOGGrgNkIh9ISwuJb/5CmLeMogylIntoh1dn/0yX1vcGjagwG9MnJXMQIuHr4GYzAKTIp
 oPUkyNDH7nT4aSodChixhJ+LJ2lCQDIBsLc+bOPRIa7OYu5n8QceFDwZZfDdu9qnzIBNu+yUfXw4C
 otks9nCv3bHoluOk5p3WCxk0NWW6ypUjlNCni8U69gdhovo+b0K6Vk3mpsCP5uREldRC2UjLyelRQ
 Xol8NrOg==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vqTQX-00HT9m-U0; Thu, 12 Feb 2026 10:56:01 +0100
Message-ID: <12fc3ede-d9af-4d32-8ea4-822a9b93627d@igalia.com>
Date: Thu, 12 Feb 2026 09:56:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/31] Fair(er) DRM scheduler
To: phasta@kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Leo Liu <Leo.Liu@amd.com>, Lucas Stach <l.stach@pengutronix.de>,
 Matthew Brost <matthew.brost@intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
References: <20260128110806.38350-1-tvrtko.ursulin@igalia.com>
 <7fcca1f49427e0279a740b6c1b9bb072eabc2c35.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <7fcca1f49427e0279a740b6c1b9bb072eabc2c35.camel@mailbox.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:mid];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-]
X-Rspamd-Queue-Id: 0027512C174
X-Rspamd-Action: no action


On 11/02/2026 11:08, Philipp Stanner wrote:
> On Wed, 2026-01-28 at 11:07 +0000, Tvrtko Ursulin wrote:
>> ** NOTE:
>>     First three patches have been already reviewed and are conceptualy
>>     independent. But as the code conflicts, I am including them while waiting for
>>     them to be merged via amd-next, and until they percolate back to drm-tip, in
>>     order to avoid having to maintain two separate patch series.
> 
> 
> So your intention with this v6 is just to get more reviews? What is the
> purpose?
> 
> And since the plan is supposedly that the drm_sched maintainers take
> it, when will they know that it's ready now?
> 
> Can we agree on delaying a v7 until all lights are green?

I am waiting on Christian to merge the first three patches via amd-next. 
That is pending for a month now and in the meantime I did not want to 
send this series and have someone tell me it does not apply. If by a 
miracle someone actually went to try and give it a spin.

For the moment I don't think this is a problem for this series since 
there are so many more patches still pending to review. And based on the 
past experience you will not be merging it any time soon. As there are 
no design conflicts between the two, the review can progress just fine 
ignoring the first three patches.

> For the future, I think the more canonical (and less confusing) way to
> handle situations like this is not to include foreign patches into a
> single-topic patch series, but to hint in the cover letter at the
> situation and provide links: "Series is blocked by [1], [2]".

Again, like that it wouldn't build and no one would be able to test it. 
For now just skip the first three and focus on the rest and hopefully by 
v7 I will be able to drop those.

Regards,

Tvrtko

