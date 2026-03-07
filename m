Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOU9LLV8q2lUdgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 02:17:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4062294F1
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 02:17:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0674110E335;
	Sat,  7 Mar 2026 01:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=sina.com header.i=@sina.com header.b="qbD0Wymb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from r3-20.sinamail.sina.com.cn (r3-20.sinamail.sina.com.cn
 [202.108.3.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E9A10E335
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2026 01:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1772846255; bh=hl5Gx8ORpg4RhkGdyFFWdkjfTiswS1fYGPRgCUTRirg=;
 h=From:Subject:Date:Message-ID;
 b=qbD0WymbbJDT1RgDY3T7ipI/+ApRoP9785pphBDXBNG8QF9IaNpDfw7p2YD/r4wJp
 o/EtO+O2DM3x9G7W5jSkEdTXhwk+73kkjSKz8CcJyWM/8kJ+6DyhQ9lxtfZfWKSB3g
 l8Vyi9YZsRtKUlBjwq+Nr8lil2JEl9AL1KAErJ+Q=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.144])
 by sina.com (10.54.253.32) with ESMTP
 id 69AB7CA700001F82; Sat, 7 Mar 2026 09:17:30 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=hdanton@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 1019254456634
X-SMAIL-UIID: C83C79BFABAE416FB5C5AE7B220CC511-20260307-091730-1
From: Hillf Danton <hdanton@sina.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: Re: [PATCH v5 09/28] drm/sched: Add fair scheduling policy
Date: Sat,  7 Mar 2026 09:17:15 +0800
Message-ID: <20260307011717.712-1-hdanton@sina.com>
In-Reply-To: <b5b3461f-7434-42db-bad3-ae9187fdbfc1@igalia.com>
References: <20251219135351.25880-1-tvrtko.ursulin@igalia.com>
 <20251219135351.25880-10-tvrtko.ursulin@igalia.com>
 <DFONORJMB1ZM.1JHSIXB9ULHJV@kernel.org>
 <1fceb644-ff22-45c8-bd83-4a32786c35f2@igalia.com>
 <DFP4XVVKNIRC.2O817MGMKCQ3P@kernel.org>
 <7b1d848c-a0e3-4960-94da-4f9001c1d96f@igalia.com>
 <DFPK5HIP7G9C.2LJ6AOH2UPLEO@kernel.org>
MIME-Version: 1.0
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
X-Rspamd-Queue-Id: 0E4062294F1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[sina.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[sina.com:s=201208];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:tvrtko.ursulin@igalia.com,m:dakr@kernel.org,m:amd-gfx@lists.freedesktop.org,m:kernel-dev@igalia.com,m:matthew.brost@intel.com,m:phasta@kernel.org,m:pierre-eric.pelloux-prayer@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[sina.com];
	FORGED_SENDER(0.00)[hdanton@sina.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sina.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.967];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hdanton@sina.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Tue, 20 Jan 2026 09:51:48 +0000 Tvrtko Ursulin wrote:
> On 15/01/2026 23:39, Danilo Krummrich wrote:
> > On Thu Jan 15, 2026 at 2:00 PM CET, Tvrtko Ursulin wrote:
> 
> 8><
> 
> >> Okay but I am sure you know there are memory barriers, RCU, SPSC queue,
> >> completions, worker management, and at least two locks, and everything
> >> is interdependent.
> > 
> > I am, and I couldn't describe the maintainance burden of the scheduler any
> > better. :)
> > 
> >> This series at least removes a bunch of code without making things more
> >> complicated and so can be a good base for further rework. If you suggest to
> >> hold it until all of the above is resolved it will be a few more years easily.
> > 
> > Let me explain a bit where I'm coming from:
> > 
> >  From a maintainer perspective - without saying that things are either black or
> > white - I'm assessing contributors and contributions on whether the intention is
> > to improve the infrastructure in terms of design and maintainability or whether
> > the main intention is to "just" get a certain feature merged.
> > 
> > While both are valuable contributions that are appreciated, contributions that
> > have a tendency into the latter direction, have to be seen with more sceptisism.
> > 
> > Especially when the code base already has known design issues, bulding features
> > on top is very dangerous. Not necessarily because the resulting code might be
> > wrong or because of regressions, etc. But because it most likely increases the
> > difficulty resolving the existing issues -- in the worst case leading to a dead
> > end.
> > 
> > Having that said, I am not saying that you "just" try to get your feature merged
> > no matter what. Quite the opposite, I very much appreciate your contributions to
> > the scheduler and recognize the cleanup work you are doing.
> > 
> > However, for this series I require you to acknowledge that, even if correct,
> > some of this code introduces additional workarounds due to existing design
> > issues, locking and synchronization subtleties that should be solved in better
> > ways.
> > 
> > I have no objections going ahead with this series if we are on the same page
> > regarding this and you are willing to also help out fixing those underlying
> > design issues, locking and synchronization quirks, etc. subsequently.
> > 
> > But if you are more leaning in the direction of "I don't see an issue overall,
> > the code is correct!" I do have concerns.
> > 
> > Improving the situation with the scheduler is the fundamental reason why Philipp
> > and me were stepping up as maintainers, Philipp being more of the active part
> > (doing a great job) and me working more in the background, helping and mentoring
> > him.
> > 
> > Believe me when I say that we want this to move forward, but we also have to
> > ensure that we are not making a step into the direction of increasing the
> > difficulty to solve the underlying issues.
> > 
> > So, again, if we are on the same page with this, no objections from my side.
> 
> I thought it would have been obvious by now that I am trying to improve 
> and fix things across the board. I even mentioned I had attempted a more 
> ambitious rewrite already, which hit some stumbling blocks, so I settled 
> for this smaller step first.
> 
> I am also glad to hear there is desire to attempt more significant 
> refactors. Because in the past I was a bit concerned with a little bit 
> of "it's scary don't touch it" messaging.
> 
> So yes, I do plan to stick around to keep fixing and improving things.
>
After FIFO and RR are cut in the subsequent 12/28, you have a couple of options
1, forget priority once for all given vruntime, or
2, prio will not change once entity is created, or
3, move prio to entity->stats
