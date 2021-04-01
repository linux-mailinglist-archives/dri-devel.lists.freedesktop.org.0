Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F78835218A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 23:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61DEC6ED8F;
	Thu,  1 Apr 2021 21:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9406ED8F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 21:21:01 +0000 (UTC)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4FBGLx49rqz99;
 Thu,  1 Apr 2021 23:20:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1617312058; bh=wp5ulMslV+FO69Dd/0Jm8lzma8RRu75a3i/ED0uo47k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CLrLR2FCkR6a12kYONrJnIXsv38tlxC/3HNh9p5eLw9AvZxOXine3CuiMQuzs6H+e
 ukIabSDHFDLbYx2hgXpQyil9IVH593zNWkE4eIknX9sLeou1zgNKuxpsK9iz9cXSW4
 WwuQZVvPG6z+B1aKiLqhhzTuNqRUBjIXzSxpVjtKFW9iEM4q70PObqUhBWW1v3xu2L
 7ASqrkzOwb0N80jU3zdZlLNmt2uScP5jEIkqMINL9RwEVhs2EH2pLa0JKLY1rrK+fW
 ymH3s7GUv2uJGGc/FionG1j80Tli7AtxUakFQqQY3yXyohH36W5DSr8IvDTv2pJjsK
 zY3q+0bOi5IQg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date: Thu, 1 Apr 2021 23:19:49 +0200
From: =?iso-8859-2?B?TWljaGGzoE1pcm9zs2F3?= <mirq-linux@rere.qmqm.pl>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH v5 03/21] gpu: host1x: Show number of pending waiters in
 debugfs
Message-ID: <20210401211949.GA25223@qmqm.qmqm.pl>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-4-mperttunen@nvidia.com>
 <YFm/431gaaP6wY1A@orome.fritz.box>
 <1010683e-56c9-4b06-1540-d8c60a632c70@kapsi.fi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1010683e-56c9-4b06-1540-d8c60a632c70@kapsi.fi>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 digetx@gmail.com, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 26, 2021 at 04:34:13PM +0200, Mikko Perttunen wrote:
> On 3/23/21 12:16 PM, Thierry Reding wrote:
> > On Mon, Jan 11, 2021 at 03:00:01PM +0200, Mikko Perttunen wrote:
> > > Show the number of pending waiters in the debugfs status file.
> > > This is useful for testing to verify that waiters do not leak
> > > or accumulate incorrectly.
> > > =

> > > Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> > > ---
> > >   drivers/gpu/host1x/debug.c | 14 +++++++++++---
> > >   1 file changed, 11 insertions(+), 3 deletions(-)
> > > =

> > > diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
> > > index 1b4997bda1c7..8a14880c61bb 100644
> > > --- a/drivers/gpu/host1x/debug.c
> > > +++ b/drivers/gpu/host1x/debug.c
> > > @@ -69,6 +69,7 @@ static int show_channel(struct host1x_channel *ch, =
void *data, bool show_fifo)
> > >   static void show_syncpts(struct host1x *m, struct output *o)
> > >   {
> > > +	struct list_head *pos;
> > >   	unsigned int i;
> > >   	host1x_debug_output(o, "---- syncpts ----\n");
> > > @@ -76,12 +77,19 @@ static void show_syncpts(struct host1x *m, struct=
 output *o)
> > >   	for (i =3D 0; i < host1x_syncpt_nb_pts(m); i++) {
> > >   		u32 max =3D host1x_syncpt_read_max(m->syncpt + i);
> > >   		u32 min =3D host1x_syncpt_load(m->syncpt + i);
> > > +		unsigned int waiters =3D 0;
> > > -		if (!min && !max)
> > > +		spin_lock(&m->syncpt[i].intr.lock);
> > > +		list_for_each(pos, &m->syncpt[i].intr.wait_head)
> > > +			waiters++;
> > > +		spin_unlock(&m->syncpt[i].intr.lock);
> > =

> > Would it make sense to keep a running count so that we don't have to
> > compute it here?
> =

> Considering this is just a debug facility, I think I prefer not adding a =
new
> field just for it.

This looks like IRQ-disabled region, so unless only root can trigger
this code, maybe the additional field could save a potential headache?
How many waiters can there be in the worst case?

Best Regards
Micha=B3=A0Miros=B3aw
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
