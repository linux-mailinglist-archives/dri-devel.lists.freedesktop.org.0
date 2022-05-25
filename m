Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF33B533EC3
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 16:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C146C10E53E;
	Wed, 25 May 2022 14:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD59510E53E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 14:07:39 +0000 (UTC)
Date: Wed, 25 May 2022 14:07:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1653487656; x=1653746856;
 bh=PGuICWR5xVp/hCJM7WV+UGw5LoWMo7s78Bo1j4hSxSg=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=qT4+QW8hyugNtSkw43k7pfEVyQgD6A+Aga3W1hXw3vX9zWQC1HwxIyMo289XmtljB
 oJrdgZxNrifrPw8DTtyTmfLhsQ3VyX8e0tRHFC8OYVb8IMMk1j7Qf75x/JUQvnTQyf
 zlQVt8VjvJrFDOTZywKhdHh3ecIfn5bxAv9TH1EEbp7TkLf/LB4ZtkqoiAFZ/mn3IN
 wrGjvYpe+b1+iRDUGqEN802SfLnr4AKZnYjDLS3uoSnRINbB7NOZoipx0V0PsHmbqO
 ItwFaPoZDciNaBmA4qka6r59aZQGLzj4n1XQjdpcGaQ58Kmn3ashHlsTt3Xc7sJLKV
 l7obvdMrZMRjg==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Tackling the indefinite/user DMA fence problem
Message-ID: <nR302DiNnOEkhrGg7TsRINiS2R-WuPiI2uJiERdMMaSUV9e_0xlX1eu1CzzhlCXJmJ-ss1BdkTSZ-XiEOnyMUTn6v3A_sb1jTkvAxfuS-f8=@emersion.fr>
In-Reply-To: <Yo40X03axFXXN9/d@phenom.ffwll.local>
References: <20220502163722.3957-1-christian.koenig@amd.com>
 <YnJQs1iusrBvpuMs@phenom.ffwll.local>
 <a01c7703-f7f7-f8ce-f80e-632a6fdcbbbe@gmail.com>
 <Ynkg81p6ADyZBa/L@phenom.ffwll.local>
 <a249c0c4-ee6c-bfb0-737b-eb6afae29602@amd.com>
 <Yo4pin1Js4KXs2HL@phenom.ffwll.local>
 <19808e9e-a5a6-c878-a2f7-5b33444f547d@mailbox.org>
 <Yo40X03axFXXN9/d@phenom.ffwll.local>
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: tvrtko.ursulin@linux.intel.com, daniels@collabora.com,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 gustavo@padovan.org, Felix.Kuehling@amd.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, sergemetral@google.com, tzimmermann@suse.de,
 alexander.deucher@amd.com, skhawaja@google.com, sumit.semwal@linaro.org,
 jason@jlekstrand.net, maad.aldabagh@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, May 25th, 2022 at 15:51, Daniel Vetter <daniel@ffwll.ch> wrot=
e:

> > > Ofc in reality you can still flood your compositor and they're not ve=
ry
> > > robust, but with umf it's trivial to just hang your compositor foreve=
r and
> > > nothing happens.
> >
> > You can add that to the list of reasons why compositors need to stop
> > using buffers with unsignaled fences. There's plenty of other reasons
> > there already (the big one being that otherwise slow clients can slow
> > down the compositor, even if the compositor uses a high priority contex=
t
> > and the HW supports preemption).
>
>
> Yeah that's tbh another reason why I think we shouldn't do umf as a
> transparent thing - compositors need to get better anyway, so we might as
> well take this as a chance to do this right.

As a compositor dev, I agree -- we should definitely be smarter about
this. Note, it would help a lot to have a good way to integrate the
waits into a poll(2) event loop.
