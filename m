Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3377824957D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 08:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971A16E1BD;
	Wed, 19 Aug 2020 06:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cmta16.telus.net (cmta16.telus.net [209.171.16.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468C889CE1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 17:58:07 +0000 (UTC)
Received: from montezuma.home ([154.5.226.127]) by cmsmtp with SMTP
 id 85s1kclQL5b7l85s3kLDKf; Tue, 18 Aug 2020 11:58:05 -0600
X-Telus-Authed: none
X-Authority-Analysis: v=2.3 cv=YPHhNiOx c=1 sm=1 tr=0
 a=f8b3WT/FcTuUJCJtQO1udw==:117 a=f8b3WT/FcTuUJCJtQO1udw==:17
 a=kj9zAlcOel0A:10 a=x7bEGLp0ZPQA:10 a=COSDN44dAAMA:10 a=pGLkceISAAAA:8
 a=zPWn4OYR4t-Te5tHu7sA:9 a=CjuIK1q_8ugA:10
Date: Tue, 18 Aug 2020 10:58:01 -0700 (PDT)
From: Zwane Mwaikambo <zwanem@gmail.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] drm: assure aux_dev is nonzero before using it
In-Reply-To: <a1141faf8c6a0a924d87132fb4a297cd6d47e09d.camel@redhat.com>
Message-ID: <alpine.DEB.2.21.2008181057090.8571@montezuma.home>
References: <alpine.DEB.2.21.2008101004110.27032@montezuma.home>
 <20200811085830.GZ2352366@phenom.ffwll.local>
 <alpine.DEB.2.21.2008111514210.35094@montezuma.home>
 <CAKMK7uHxikojLQNbsnnfDfGZ3tFP9CRUTzvr+DsZghzQupaBGg@mail.gmail.com>
 <a1141faf8c6a0a924d87132fb4a297cd6d47e09d.camel@redhat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKAcyA95kOPAOAZwHufvwnS2/RdfvleXrrWCc7rTEJrWQ7yfHBW4WJewuClsh+VwBNpBMcdYcCW5KpGnfvFWf8e2jGoOHDD81JJl7sTKooDBOjWsbGZn
 2z7WTlSDnR81sqtX+7regsIyAreaPe6LaFQJMRV9biuUfk6yx+Gz0XHtgJGy6nQDggUk33+wq/nhv9NeRNxZAYgYc1aPDdMQxZwcwBt0QZEsguPqSsDocfFp
 bmnLtNBdGXEf7U8xbJQ2x4nADEkRTjbxwQbgu/9uJrobv7oTuJyS9yHRZNkHWw0OPADglZ2FNy5GeVuOV66D0BQvEkqdRFIwvOlMyUCAFa0=
X-Mailman-Approved-At: Wed, 19 Aug 2020 06:56:51 +0000
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, dkwon@redhat.com,
 Linux Kernel <linux-kernel@vger.kernel.org>, tcamuso@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Aug 2020, Lyude Paul wrote:

> On Wed, 2020-08-12 at 16:10 +0200, Daniel Vetter wrote:
> > On Wed, Aug 12, 2020 at 12:16 AM Zwane Mwaikambo <zwanem@gmail.com> wrote:
> > > On Tue, 11 Aug 2020, Daniel Vetter wrote:
> > > 
> > > > On Mon, Aug 10, 2020 at 10:11:50AM -0700, Zwane Mwaikambo wrote:
> > > > > Hi Folks,
> > > > >     I know this thread eventually dropped off due to not identifying
> > > > > the underlying issue. It's still occuring on 5.8 and in my case it
> > > > > happened because the udev device nodes for the DP aux devices were not
> > > > > cleaned up whereas the kernel had no association with them. I can
> > > > > reproduce the bug just by creating a device node for a non-existent
> > > > > minor
> > > > > device and calling open().
> > > > 
> > > > Hm I don't have that thread anymore, but generally these bugs are solved
> > > > by not registering the device before it's ready for use. We do have
> > > > drm_connector->late_register for that stuff. Just a guess since I'm not
> > > > seeing full details here.
> > > 
> > > In this particular case, the physical device disappeared before the nodes
> > > were cleaned up. It involves putting a computer to sleep with a monitor
> > > plugged in and then waking it up with the monitor unplugged.
> > 
> > We also have early_unregister for the reverse, but yes this sounds
> > more tricky ... Adding Lyude who's been working on way too much
> > lifetime fun around dp recently.
> > -Daniel
> > 
> Hi-I think just checking whether the auxdev is NULL or not is a reasonable
> fix, although I am curious as to how exactly the aux dev's parent is getting
> destroyed before it's child, which I would have thought would be the only way
> you could hit this?

Hi, If this is acceptable, would you consider an updated patch against 
5.8?

Thanks,
	Zwane
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
