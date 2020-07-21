Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEEA227E00
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 13:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991606E103;
	Tue, 21 Jul 2020 11:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEBA86E05F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 11:03:10 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1jxq37-000393-Fq; Tue, 21 Jul 2020 13:03:05 +0200
Message-ID: <e38c494a544d7e0607ee89abcc6a85419e700011.camel@pengutronix.de>
Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
From: Lucas Stach <l.stach@pengutronix.de>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>, Luben Tuikov
 <luben.tuikov@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 21 Jul 2020 13:03:04 +0200
In-Reply-To: <2cef1ca3-115c-44ee-9caf-6cb8d6404796@amd.com>
References: <1574715089-14875-1-git-send-email-andrey.grodzovsky@amd.com>
 <0de5ad33ca2ff86fee13a453aa9096c274afbd3c.camel@pengutronix.de>
 <d710aba7c3acc537bfb1c20362f7c8dbee421f02.camel@pengutronix.de>
 <740fb929-e788-075b-87db-e2524ed4b086@gmail.com>
 <CADnq5_Np=OFgqAb4TPRz5yqx1YZSwWybS=F6R_r6r01QRrzADA@mail.gmail.com>
 <61128c11-9e65-bc21-6306-ea4efea18b76@amd.com>
 <90de1234-a103-a695-4ad7-83b1486e15ee@amd.com>
 <02ba868c-e904-3681-c795-59a4e48926d5@amd.com>
 <b1ebac7c-5593-bc87-1f36-ea55503f05d1@amd.com>
 <4b5c56d2-4ce4-3626-623f-d4a8124d76fa@amd.com>
 <d4ba6ed9-604e-5e88-f427-679639dcf8e9@amd.com>
 <dbb2e7f0-85b7-f9e0-7875-144a8cca4993@amd.com>
 <2cef1ca3-115c-44ee-9caf-6cb8d6404796@amd.com>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Emily Deng <Emily.Deng@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 steven.price@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrey,

Am Mittwoch, den 12.02.2020, 11:33 -0500 schrieb Andrey Grodzovsky:
> On 2/11/20 7:53 PM, Luben Tuikov wrote:
> > On 2020-02-11 4:27 p.m., Andrey Grodzovsky wrote:
> > > On 2/11/20 10:55 AM, Andrey Grodzovsky wrote:
> > > > On 2/10/20 4:50 PM, Luben Tuikov wrote:
> > > > > Hi Lucas,
> > > > > 
> > > > > Thank you for bringing awareness of this issue, publicly.
> > > > > 
> > > > > As soon as this patch showed up back in November of 2019,
> > > > > I objected to it, privately.
> > > > 
> > > > I didn't find this objection in my mail actually
> > Yes, I didn't send it to you.
> > 
> > > > > I suggested to instead use a _list_ to store the "state" of
> > > > > all jobs of the same state. Then, at any time, timeout interrupt
> > > > > or whatever, we can atomically (irq spinlock) move the timeout/bad
> > > > > job to the timedout/cleanup/bad job list, and wake someone up
> > > > > to deal with that list asynchronously, and return from the
> > > > > interrupt/etc.
> > > > > immediately.
> > > > 
> > > > Sounds a good idea to me, i think enough for us to have 2 lists,
> > > > timeout list for jobs scheduled to HW and not yet completed
> > > > (completion fence signaled) and cleanup list for those that did
> > > > complete. This should give alternative solution to the race condition
> > > > this patch was addressing without causing the break the Lucas
> > > > reported. If no one objects I think i can try implement it.
> > > > 
> > > > Andrey
> > > 
> > > Thinking more i realize Luben is right about having also bad job list as
> > > this is needed for normal job competition (by fence callback from
> > > amdgpu_fence_process)  and you need to decide if you move it to cleanup
> > > list from timeout list or not. If it's already in bad job list - meaning
> > > that it's being processed by GPU recovery code you don't touch it,
> > > otherwise you move it to cleanup list where it will be freed eventually
> > > by invocation of drm_sched_get_cleanup_job.
> > Yep...
> > 
> > Perhaps fewer lists, than "timeout", "bad" and "cleanup" could be had.
> > I'd also name the "bad" list as "recovery" list, as that is what would
> > be done to commands on that list.
> > 
> > "Timeout" is a status "timed-out", so perhaps just set the timeout
> > flag and move it to a "done" list. (Note that the command can still
> > complete asynchronously while on that list and while it has status
> > "timed-out'.)
> > 
> > The idea is that,
> > 1) it avoid contention and races when more than one context
> >     can update the job at the same time, and
> > 2) easy to process all jobs of a certain state and/or
> >     move them around, etc.
> > 
> > Let's discuss it and come up with a plan. :-)
> > 
> > Regards,
> > Luben
> 
> Sure, let me maybe come up with a draft patch so we have more concrete 
> stuff to discuss and review.

It seems we all dropped the ball on this one. I believe this is still
an open issue. Has there been any progress from your side on fixing
this?

Regards,
Lucas

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
