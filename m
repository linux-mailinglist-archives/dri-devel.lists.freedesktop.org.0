Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2196E45F2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 13:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7824110E407;
	Mon, 17 Apr 2023 11:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668DE10E407
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 11:02:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BF93262274;
 Mon, 17 Apr 2023 11:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50123C433D2;
 Mon, 17 Apr 2023 11:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681729364;
 bh=dVSmXgHc7Wtq5f3KTG1Nv3Jo2iMZ9ubzY2vutXfxDvU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=s7eTyOVtBebCEcitRRwiCrhz5ZYaAis5MtzW5zCo7lEaCl418rXJb3cLfzdAMtKxa
 i1B5/x2H0NA3QcS9YymojTsXU9rZKhmC8orr683S/wEDRRzlMuVJAG1bTRWXAvkgwL
 qHNfE5OduLyKch7U8X2PBBxVID1zeG05yDokzeFhCfbisdQO1C5uwL/BIsNVF4yz1N
 UI+5LFtlqy6CAQeW7BfR2ZtzI8p2tD5344rSZ9Qxpk5LaodUuLdBrTgVqlZuuDGnDw
 meNTzw/SoNRG2F0GABCFHkm3qBSBmoVoUcgUVmsfc0JQmAO4HYZOxB7k181OSFqivW
 k1n4MKwt4R3HQ==
Message-ID: <73d0178c3b9608fae207c9f135aa1f807cb56e47.camel@kernel.org>
Subject: Re: [PATCH] drm: make drm_dp_add_payload_part2 gracefully handle
 NULL state pointer
From: Jeff Layton <jlayton@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul
 <lyude@redhat.com>,  "Lin, Wayne" <Wayne.Lin@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>
Date: Mon, 17 Apr 2023 07:02:41 -0400
In-Reply-To: <87leiqer8g.fsf@intel.com>
References: <20230413111254.22458-1-jlayton@kernel.org>
 <87edooarpq.fsf@intel.com>
 <CADnq5_PVnYMSiKO77+cfg_V-tDKYkVJYN3qGNb1vhQO3QtXskA@mail.gmail.com>
 <CO6PR12MB5489044012B2A96639470F38FC999@CO6PR12MB5489.namprd12.prod.outlook.com>
 <4d8479f20ef30866fcf73f3602f1237376110764.camel@kernel.org>
 <878reug394.fsf@intel.com>
 <7a1b00f02b125bd65824b18ea09509efe3cf777d.camel@redhat.com>
 <874jpegao0.fsf@intel.com>
 <b99732f7c0dd968c0702ae7629695e8fb9cb573f.camel@kernel.org>
 <87leiqer8g.fsf@intel.com>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2023-04-17 at 13:29 +0300, Jani Nikula wrote:
> On Mon, 17 Apr 2023, Jeff Layton <jlayton@kernel.org> wrote:
> > On Mon, 2023-04-17 at 11:44 +0300, Jani Nikula wrote:
> > > On Fri, 14 Apr 2023, Lyude Paul <lyude@redhat.com> wrote:
> > > > On Fri, 2023-04-14 at 13:35 +0300, Jani Nikula wrote:
> > > > > On Fri, 14 Apr 2023, Jeff Layton <jlayton@kernel.org> wrote:
> > > > > > On Fri, 2023-04-14 at 04:40 +0000, Lin, Wayne wrote:
> > > > > > > [Public]
> > > > > > >=20
> > > > > > > Hi Jeff,
> > > > > > >=20
> > > > > > > Thanks. I might need more information to understand why we ca=
n't retrieve
> > > > > > > the drm atomic state. Also , "Failed to create MST payload fo=
r port" indicates
> > > > > > > error while configuring DPCD payload ID table. Could you help=
 to provide log
> > > > > > > with KMS + ATOMIC + DP debug on please? Thanks in advance!
> > > > > > >=20
> > > > > > > Regards,
> > > > > > > Wayne
> > > > > > >=20
> > > > > >=20
> > > > > > Possibly. I'm not that familiar with display driver debugging. =
Can you
> > > > > > send me some directions on how to crank up that sort of debug l=
ogging?
> > > > > >=20
> > > > > > Note that this problem is _very_ intermittent too: I went about=
 2 weeks
> > > > > > between crashes, and then I got 3 in one day. I'd rather not ru=
n with a
> > > > > > lot of debug logging for a long time if that's what this is goi=
ng to
> > > > > > require, as this is my main workstation.
> > > > > >=20
> > > > > > The last time I got this log message, my proposed patch did pre=
vent the
> > > > > > box from oopsing, so I'd really like to see it go in unless it'=
s just
> > > > > > categorically wrong for the caller to pass down a NULL state po=
inter to
> > > > > > drm_dp_add_payload_part2.
> > > > >=20
> > > > > Cc: Lyude.
> > > > >=20
> > > > > Looks like the state parameter was added in commit 4d07b0bc4034
> > > > > ("drm/display/dp_mst: Move all payload info into the atomic state=
") and
> > > > > its only use is to get at state->dev for debug logging.
> > > > >=20
> > > > > What's the plan for the parameter? Surely something more than tha=
t! :)
> > > >=20
> > > > I don't think there was any plan for that, or at least I certainly =
don't even
> > > > remember adding that D:. It must totally have been by mistake and s=
nuck by
> > > > review, if that's the only thing that we're using it for I'd say it=
's
> > > > definitely fine to just drop it entirely
> > >=20
> > > I guess we could use two patches then, first replace state->dev with
> > > mgr->dev as something that can be backported as needed, and second dr=
op
> > > the state parameter altogether.
> > >=20
> > > Jeff, up for it? At least the first one?
> > >=20
> > >=20
> > > BR,
> > > Jani.
> > >=20
> >=20
> > Sure. I'm happy to test patches if you send them along.
>=20
> I was hoping to lure you into sending patches. ;)
>=20
> Anyway, I'm not working on this.
>=20
>=20

Ok. I misunderstood, I'll change the patch I've been using to use mgr-
>dev instead and will send along a v2 here in a few days (after some
testing).
--=20
Jeff Layton <jlayton@kernel.org>
