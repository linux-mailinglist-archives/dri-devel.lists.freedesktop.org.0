Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDB46FA2B8
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 10:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E4410E1A3;
	Mon,  8 May 2023 08:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E198310E1A7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 08:58:51 +0000 (UTC)
Date: Mon, 08 May 2023 08:58:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1683536328; x=1683795528;
 bh=0oI/dUxpbrMhycb004++9wudBjSEQgWs7IBj+gAGh+M=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=WpfD4GrlzTYvdZah+GL2peZ7I0PanXy6s/E3M/QCdbrjHDQjPKoXUSCuMvAPpx4hh
 AigNld49ByFZfn0MdtpqKRJLvSR90hCPCJqXbdTKfsn+YAqdMB+tCXpCBLc3gDk+cX
 2LZWOudSUOxepX8V1mZHSoXoQcLQ4YKXAjIiE+3i/O6h9LWdpXbebdaYTMidwYJN3P
 oGSy/RD9Uf+jE8LJApZSmxo1wNkIlstIImW3hpq3veeNRDGcxKOE1b+sLP731JZbCU
 Fb1mGOLTn6aHwOAAnobZ6RTyRCT99Y3wevztkso4/ZdHv0GrhLZCwtFV7an0EvLs6v
 MjjYI659L00Xw==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <DN4DsX1iIafGb2QiXpToAtyTLkdWlCDgHjsIoC_bq9QN0iEVnuZYRH3AM6ER8AtpT0glLr_CUplpU4V7YEI1_lxcYXGeBdX54cdsO3X7-PY=@emersion.fr>
In-Reply-To: <ZFVe1EPIV65ZpaQv@phenom.ffwll.local>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <ZFUgnMI4IIbv78By@phenom.ffwll.local>
 <-srJIIP1y4EoWtJAfk4_EaRpo7i2x1lXu0HKX4wLHcsmMfnrCdMb0EpPHOdedfZitFpdxIl3rDjBceq_UtYhQSIyJmNMVase-Oa9iP-RQ2o=@emersion.fr>
 <ZFVe1EPIV65ZpaQv@phenom.ffwll.local>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, Melissa Wen <mwen@igalia.com>,
 =?utf-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, May 5th, 2023 at 21:53, Daniel Vetter <daniel@ffwll.ch> wrote:

> On Fri, May 05, 2023 at 04:06:26PM +0000, Simon Ser wrote:
> > On Friday, May 5th, 2023 at 17:28, Daniel Vetter <daniel@ffwll.ch> wrot=
e:
> >
> > > Ok no comments from me on the actual color operations and semantics o=
f all
> > > that, because I have simply nothing to bring to that except confusion=
 :-)
> > >
> > > Some higher level thoughts instead:
> > >
> > > - I really like that we just go with graph nodes here. I think that w=
as
> > >   bound to happen sooner or later with kms (we almost got there with
> > >   writeback, and with hindsight maybe should have).
> >
> > I'd really rather not do graphs here. We only need linked lists as Seba=
stian
> > said. Graphs would significantly add more complexity to this proposal, =
and
> > I don't think that's a good idea unless there is a strong use-case.
>=20
> You have a graph, because a graph is just nodes + links. I did _not_
> propose a full generic graph structure, the link pointer would be in the
> class/type specific structure only. Like how we have the plane->crtc or
> connector->crtc links already like that (which already _is_ is full blown
> graph).

I really don't get why a pointer in a struct makes plane->crtc a full-blown
graph. There is only a single parent-child link. A plane has a reference to=
 a
CRTC, and nothing more.

You could say that anything is a graph. Yes, even an isolated struct somewh=
ere
is a graph: one with a single node and no link. But I don't follow what's t=
he
point of explaining everything with a graph when we only need a much simple=
r
subset of the concept of graphs?

Putting the graph thing aside, what are you suggesting exactly from a concr=
ete
uAPI point-of-view? Introducing a new struct type? Would it be a colorop
specific struct, or a more generic one? What would be the fields? Why do yo=
u
think that's necessary and better than the current proposal?

My understanding so far is that you're suggesting introducing something lik=
e
this at the uAPI level:

    struct drm_mode_node {
        uint32_t id;

        uint32_t children_count;
        uint32_t *children; // list of child object IDs
    };

I don't think this is a good idea for multiple reasons. First, this is
overkill: we don't need this complexity, and this complexity will make it m=
ore
difficult to reason about the color pipeline. This is a premature abstracti=
on,
one we don't need right now, and one I heaven't heard a potential future
use-case for. Sure, one can kill an ant with a sledgehammer if they'd like,=
 but
that's not the right tool for the job.

Second, this will make user-space miserable. User-space already has a trick=
y
task to achieve to translate its abstract descriptive color pipeline to our
proposed simple list of color operations. If we expose a full-blown graph, =
then
the user-space logic will need to handle arbitrary graphs. This will have a
significant cost (on implementation and testing), which we will be paying i=
n
terms of time spent and in terms of bugs.

Last, this kind of generic "node" struct is at odds with existing KMS objec=
t
types. So far, KMS objects are concrete like CRTC, connector, plane, etc.
"Node" is abstract. This is inconsistent.

Please let me know whether the above is what you have in mind. If not, plea=
se
explain what exactly you mean by "graphs" in terms of uAPI, and please expl=
ain
why we need it and what real-world use-cases it would solve.
