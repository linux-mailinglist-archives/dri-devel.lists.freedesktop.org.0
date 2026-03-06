Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIQBKA+hqmlLUgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:40:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A306B21E184
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E23E10ECBF;
	Fri,  6 Mar 2026 09:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="PrnLuqGT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3679C10ECBE;
 Fri,  6 Mar 2026 09:40:27 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fS1bl6lDqz9tnK;
 Fri,  6 Mar 2026 10:40:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1772790020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1d5t60sG93+LnzWWh+XElXwAJjn+1bF6t4NEEFILjfM=;
 b=PrnLuqGTOAONfiFYkDJiPfxQdtcZqFXjzkHJLK+9nsLnxlbRCVocj5jtnwwVkNmN5C9hSJ
 CVZG30+5C6/+Hx66RRWCAij/XmC7yn9dAFUo3/UIJxuDDWxxraO4A7/ky/n6mzg6CSK+sA
 vazPwwnx7szI1mBmed2QoGNHbFtHVZZqOmiVN3Ja33YwpO/fEw+NxuQ7BnLakhwV2Nii4E
 K3F2JCejhN6VyGLXwQCEte0yJovAaDVWFdhpJRgK3iAoynsWosNPt4WcGVxKJjX0YNR+oD
 71wCVyZ0XRKhPZKn0zHOGJ5eQWlUm+RIjAP1AGRIr0mMKmcSMLUyfCQddUpPBQ==
Message-ID: <4289aeea-0446-4bc5-a18d-d5049bc1dabd@mailbox.org>
Date: Fri, 6 Mar 2026 10:40:05 +0100
MIME-Version: 1.0
Subject: Re: drm_sched run_job and scheduling latency
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
To: Chia-I Wu <olvaffe@gmail.com>, Matthew Brost <matthew.brost@intel.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 intel-xe@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, tj@kernel.org
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
 <aajkqXZDGUFPlq1o@lstrano-desk.jf.intel.com> <20260305092711.20069ca1@fedora>
 <aalWTOZSNYcKpvdd@lstrano-desk.jf.intel.com> <20260305115201.6fb044f0@fedora>
 <aans5SMXDbwhpqY8@lstrano-desk.jf.intel.com>
 <CAPaKu7SXsCv=G+O38unCsdrUNeeOmbopRdBpjqP+Qxp+EP9JtA@mail.gmail.com>
 <28ce8bae-bc49-4f51-9f12-ae7bc427c920@mailbox.org>
Content-Language: de-CH-frami, en-CA
In-Reply-To: <28ce8bae-bc49-4f51-9f12-ae7bc427c920@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 41874f796c875257b63
X-MBO-RS-META: a5pdtawje54i1igtfoec9jjacta3j3is
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
X-Rspamd-Queue-Id: A306B21E184
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.75 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,intel.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[collabora.com,lists.freedesktop.org,arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:email,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Action: no action

On 3/6/26 10:36, Michel Dänzer wrote:
> On 3/6/26 06:13, Chia-I Wu wrote:
>> On Thu, Mar 5, 2026 at 12:52 PM Matthew Brost <matthew.brost@intel.com> wrote:
>>> On Thu, Mar 05, 2026 at 11:52:01AM +0100, Boris Brezillon wrote:
>>>> On Thu, 5 Mar 2026 02:09:16 -0800
>>>> Matthew Brost <matthew.brost@intel.com> wrote:
>>>>> On Thu, Mar 05, 2026 at 09:27:11AM +0100, Boris Brezillon wrote:
>>>>>> On Wed, 4 Mar 2026 18:04:25 -0800
>>>>>> Matthew Brost <matthew.brost@intel.com> wrote:
>>>>>>> On Wed, Mar 04, 2026 at 02:51:39PM -0800, Chia-I Wu wrote:
>>>>>>>>
>>>>>>>> Thoughts? Or perhaps this becomes less of an issue if all drm_sched
>>>>>>>> users have concrete plans for userspace submissions..
>>>>>>>
>>>>>>> Maybe some day....
>>>>>>
>>>>>> I've yet to see a solution where no dma_fence-based signalization is
>>>>>> involved in graphics workloads though (IIRC, Arm's solution still
>>>>>> needs the kernel for that). Until that happens, we'll still need the
>>>>>> kernel to signal fences asynchronously when the job is done, which I
>>>>>> suspect will cause the same kind of latency issue...
>>>>>>
>>>>>
>>>>> I don't think that is the problem here. Doesn’t the job that draws the
>>>>> frame actually draw it, or does the display wait on the draw job’s fence
>>>>> to signal and then do something else?
>>>>
>>>> I know close to nothing about SurfaceFlinger and very little about
>>>> compositors in general, so I'll let Chia answer that one. What's sure
>>>
>>> I think Chia input would good, as if SurfaceFlinger jobs have input
>>> dependencies this entire suggestion doesn't make any sense.
>>>
>>>> is that, on regular page-flips (don't remember what async page-flips
>>>> do), the display drivers wait on the fences attached to the buffer to
>>>> signal before doing the flip.
>>>
>>> I think SurfaceFlinger is different compared to Wayland/X11 use cases,
>>> as maintaining a steady framerate is the priority above everything else
>>> (think phone screens, which never freeze, whereas desktops do all the
>>> time). So I believe SurfaceFlinger decides when it will submit the job
>>> to draw a frame, without directly passing in application dependencies
>>> into the buffer/job being drawn. Again, my understanding here may be
>>> incorrect...
>> That is correct. SurfaceFlinger only ever latches buffers whose
>> associated fences have signaled, and sends down the buffers to gpu for
>> composition or to the display for direct scanout. That might also be
>> how modern wayland compositors work nowadays?
> 
> Many (most of the major ones?) do, yes. (Weston being a notable exception AFAIK, though since it supports the Wayland syncobj protocol now, switching to this model shoul

Err, I meant the commit-timing protocol, Weston doesn't support the syncobj protocol yet AFAICT.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
