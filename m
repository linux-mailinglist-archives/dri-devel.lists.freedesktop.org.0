Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0D1522428
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 20:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EC010E566;
	Tue, 10 May 2022 18:34:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005AD10EC96;
 Tue, 10 May 2022 18:17:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 961251F8C1;
 Tue, 10 May 2022 18:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652206659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iiGLHqQlexjKp2BCk/wVVn8oKcq1hyMdphZCk4Mecmk=;
 b=FJ/35b9BVDalbSkvNr3+Dnf4RLDEqQwFxW2y25rnm7oKIqQ32a0DwCX5vKaxteDBm4+64q
 q1VKW5GZPX/L2Rbvh9kjtN6ZXFshll6uQndDSttzC2+UBjLynlnjSPMTkD/Vx430llG3ns
 6G6V2NShE4ICZGJkalATUxc7sV05Qd8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652206659;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iiGLHqQlexjKp2BCk/wVVn8oKcq1hyMdphZCk4Mecmk=;
 b=wAaQwnykYpP5wcAAHomQMuBG/2Magts3Quiv9hbSXtw62XmDGlxZA0Xvl10KK3N5FLOVxp
 gLH6fX3lvkLIv4BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 295FB13AA5;
 Tue, 10 May 2022 18:17:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lug+CEOsemL4LgAAMHmgww
 (envelope-from <jroedel@suse.de>); Tue, 10 May 2022 18:17:39 +0000
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [BUG] Warning and NULL-ptr dereference in amdgpu driver with 5.18
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
In-Reply-To: <CADnq5_NYVvjcUru9hfbnATfcHJR5+eiK9bJAA9m41WKa=OJsog@mail.gmail.com>
Date: Tue, 10 May 2022 20:17:38 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <505081FC-4323-4424-87A9-89B95A89515D@suse.de>
References: <YnTAc96Uv0CXcGhD@suse.de>
 <CADnq5_NT3UtawpGuPDwF+dgmRdaoysb7sD_-oWWBC=T3BoUH7Q@mail.gmail.com>
 <YnpIjdTT3esZ72Bf@suse.de>
 <CADnq5_NYVvjcUru9hfbnATfcHJR5+eiK9bJAA9m41WKa=OJsog@mail.gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-Mailman-Approved-At: Tue, 10 May 2022 18:34:47 +0000
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
Cc: David Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> Am 10.05.2022 um 17:31 schrieb Alex Deucher <alexdeucher@gmail.com>:
>=20
> On Tue, May 10, 2022 at 7:12 AM J=C3=B6rg R=C3=B6del <jroedel@suse.de> =
wrote:
>>=20
>> Gentle ping. This is a 5.18 regression and I also see it with
>> 5.18-rc6. Please let me know if you need anything else to debug.
>>=20
>=20
> Are you doing anything special when it happens?  I.e., does it happen
> when the monitor is coming out of DPMS or something like that?
>=20

Yes, it usually happens when I return to the machine and press some =
button on the keyboard to get the screens enabled again. It doesn=E2=80=99=
t happen always, it seems to depend on how slow the monitors come out of =
power saving mode.

Regards,

J=C3=B6rg R=C3=B6del
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Maxfeldstr. 5
90409 N=C3=BCrnberg
Germany
=20
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev=
