Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E46D403D71
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 18:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449576E207;
	Wed,  8 Sep 2021 16:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09ABB6E207
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 16:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1631117688;
 bh=SDKQCiJOvH5asAxA25gbqHPetI8smS6fMLt+kuu9yiM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=okbUDYuJEFOz+OjE0IN+9EyTIRkgvRdaT9QAJQEICEU/jvkWA9u14+LWcP5MXXneq
 50XKXyE3q/VhkMzYOHyBFtzgBr44GBpV4oB0TVV4jkWDeypXtGBCumDaScNO7IyZ9B
 0Wav48UqPf9ah0WnV6/nqCqUcfTijqo+LxK7KLSk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from reader ([171.25.193.77]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lu52Q-1n7Ppe0r4Q-011RtL; Wed, 08
 Sep 2021 18:14:48 +0200
Received: by reader (Postfix, from userid 1000)
 id 8A01537B8; Wed,  8 Sep 2021 18:14:40 +0200 (CEST)
Date: Wed, 8 Sep 2021 18:14:40 +0200
From: Dennis Filder <d.filder@web.de>
To: Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Sebastian Wick <sebastian@sebastianwick.net>
Subject: Re: Handling DRM master transitions cooperatively
Message-ID: <YTjhcMmkkAKCC/zW@reader>
Mail-Followup-To: Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Sebastian Wick <sebastian@sebastianwick.net>
References: <YTJypepF1Hpc2YYT@reader> <20210907130746.7b667dac@eldfell>
 <Kh2hM9odvPcbqNUxhSEwQbnUCLt6nyrAzGhxnQ0JO1CcAzI6y31enf8_AmgAynFxWo3E1QUlW1m8UvKPDAq0gFLQi2CF1b3FFNMRfiUzOAI=@emersion.fr>
 <20210907155214.285b3561@eldfell>
 <jSyTJ5Ev5ZkQFBv0Ar_6MALQ4Vj1e5lvB9gXrWcYkilCvhQ_Zo-9zpuPti5L0h1flBJuc4N_ayBmoqTbfqiSaUMwk3b08EgQ1DYKTHMYQsI=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jSyTJ5Ev5ZkQFBv0Ar_6MALQ4Vj1e5lvB9gXrWcYkilCvhQ_Zo-9zpuPti5L0h1flBJuc4N_ayBmoqTbfqiSaUMwk3b08EgQ1DYKTHMYQsI=@emersion.fr>
X-Provags-ID: V03:K1:9PhfjBWjXWAriXOpzeVSUUavPFZUeJJlmdD5ZPpvxgrUEIKDDgD
 U2XGn4WRfob79WVeNJ+0Jn8mKu61g7j3s/8uzJfAsXmCBPYwbzKkqZVcU2NL1dJd3lchdNA
 9ymG2glACZbDXVogY8AAh4EHSy6EtY1FT/iXstIWw9W0kRpVNCRABTJaUJkqDD8RFe5r7qC
 XIEUCVDuqIEwjmjr4LAYQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LDh8+BjQ8Z8=:BAmRL4UubYobACzXkK9Qaq
 Y9adwnw8PKtpcVWsguc2vkRy1wRc8dLFcNlxhB9eTExq35WJE54aIpjF9QJCfIWjbtSBFnpH1
 KEQCEMYJuIh2kUFUDLQYq+oFxVrAQocchikwAmBHDSSfSvu9u4L0Aq0TyNTlQTSUHcYV+B+Zs
 x7TTucZtxnDwj9eP4M8dzrE2U5aOo/UKmv5tMS3y2/E5jsAAYk6W0P4zzKWtsLp6wfQmhryAq
 /b9Ice/trPSdQ5UN00ujAlVQkPZE/i7rtmRgo6Uxx1u38aWxPlmG1gyzSjvW9FuwPupQFP1O5
 H8RhAGjbRh9HXK5BUODjbk47bY3HvSElH7FEx7P1bj4F9n7Ahsr6OdrdQy1kfB+sXEphEukkT
 invjm10tebiNRiA9uRw9Jm2qd+Op8KzRxPerUtyMKnEbvoeSvPKALb+IU/BFMJlYUnCA0niA2
 4zJkEMtV1nFOlxSYB4gLBgjXyV1GhkafRhHZjRymchswjBQuxWyAl+Vl6WM/EH5YYMz+vq+F8
 cPQhJ2cAGpRMSFNczKx1d57dD/3Q1MOJ0OCtx9o6S1j00P/NAWWrkKHDLI3onmJEDeuuzmGxK
 6pe3tUkGeNHqeyfu+JXltvMiQ6Dg95uFXxask9gnTSi9QpjkQjh5FmOLylZOD5j3xMybzFzgJ
 rR3T5TxWQ0SAmLJ6aiEVjTvz9OurMd6uqCff//yozyXkRkyfyGuWUQh1m6UoUnx23tm8z0gjz
 4HcHQpUxWWe3gZa7qaSnvV6fo1ZW8RWc3tRe8jwJ4Ep5O+uWG0lJw8PByBzkbIRMQxlImEP1H
 dIgzf46eqqEsbNqEZ25meAB4oFyxlb2VUnGUlAlvxp6JLgit3j0kAV3wzVzq1s98NCd4Su1d5
 3abHFyh19X3e8GZ454wIUhb7577D0/eOB7VcBp56pW2HvT9nqTPxDo7zuQ5nvap8a/I+LfRgT
 fOkrqIHQ1RySXlpna9oCAtQ8+zZKPrqMCM3UkBokZVgYEmCZ0z7EmiHpPYScicKKYQmJvjCcP
 BLkNl7DZvg7tKiC84d+SgH7DpyU12vlQyEGIztGfsPfqrHXruhB5PT/mM5hR10sZQnCKjW3z+
 bV4gLoAhad8jeM=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 08, 2021 at 09:51:54AM +0000, Simon Ser wrote:
> > On Tue, 07 Sep 2021 10:19:03 +0000
> > Simon Ser <contact@emersion.fr> wrote:
> >
> > > FWIW, I've just hit a case where a compositor leaves a "rotation" KM=
S
> > > prop set behind, then Xorg tries to startup and fails because it doe=
sn't
> > > reset this prop. So none of this is theoretical.
> > >
> > > I still think a "reset all KMS props to an arbitrary default value" =
flag
> > > in drmModeAtomicCommit is the best way forward. I'm not sure a user-=
space
> > > protocol would help too much.
> >
> > Hi Simon,
> >
> > for the "reset KMS state" problem, sure. Thanks for confirming the
> > problem, too.
> >
> > The hand-off problem does need userspace protocol though, so that the
> > two parties can negotiate what part of KMS state can be inherited by
> > the receiver and who will do the animation from the first to the secon=
d
> > state in case you want to avoid abrupt changes. It would also be usefu=
l
> > for a cross-fade as a perhaps more flexible way than the current "leak
> > an FB, let the next KMS client scrape it via ioctls and copy it so it
> > can be textured from".
>
> The KMS state can be limited to single FB on primary plane covering the =
whole
> CRTC, no scaling, no other property set than FB_ID/CRTC_*/SRC_*.
>
> Is it useful to make the previous client perform the animation? I don't =
really
> understand the use-case here.

The use case for the animation is e.g. the transition from Plymouth to
the display server.  Currently it is done as a still frame transition,
maybe with a blend-over effect.  But with the current design it is not
possible to blend Plymouth's animation over into another animation in
the display server because the second client lacks the knowledge how
to keep it going for a little bit.

Another use case is switching between sessions which currently also is
only possible as a still frame transition.  However, if you wanted to
present the session switching by doing e.g. a shaking screen animation
and blending the old display content over into the new content then
the first client would have to render the first half of the animation,
and the second client would have to render the second half during
which it would then blend away the content of the first screen while
blending in its own content and also slowing the shaking to a stop.
For that to work the second client would need all the information
necessary to render that animation, and also a way to perform the
frame-perfect change-over.

Granted, that is a very complicated, eye-candy-oriented use case, but
it would serve to show-case the potential of the design.

Regards.
