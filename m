Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 034E06F0FBF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 02:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB3610E34C;
	Fri, 28 Apr 2023 00:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0A810E34C;
 Fri, 28 Apr 2023 00:43:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8BDEA63FA1;
 Fri, 28 Apr 2023 00:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56E5C433D2;
 Fri, 28 Apr 2023 00:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682642598;
 bh=wz8irEFNIyCOfjjQkYnc8P2nuOEo62WSf74Cbxl+LBs=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=lSHofhSqI56QXEYS9lldNE1wrsN6xpN7/9Fzjb5GZvrDl+7mKjcXM3Hh2x1RA9tud
 vNHVw0KsGMP5BJRQWYnUhyI2XgV8HJgrRKDSbwmfUD6OJzKB+4aGXxXnc0+yVk3aMO
 f9xS7uW+D9rNp439kr7H89CvifdxiN1dooiKtUVlCy229UkGkQINUdUy23KK3LPVUh
 RdIR7hqaGoCxpP5nMe5d+m/rxqFCwgxYnprPdny8wYvz5HqHffCMThAn+hPTbSWF+T
 EPdND5vJJlFHPqLJ2WCFzPSz30TIil5G+sb9WykajZUKBaigyBjRqJeUtYjdcTFnY1
 PicWAujTXpu6A==
Date: Thu, 27 Apr 2023 17:43:15 -0700
From: Kees Cook <kees@kernel.org>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>
Subject: Re: Disabling -Warray-bounds for gcc-13 too
User-Agent: K-9 Mail for Android
In-Reply-To: <CACO55tvJE4UvsAY8yfY7j4gMRkk4kLUPedfL0Sw2B7OF=s-rEw@mail.gmail.com>
References: <CAHk-=whMiMqAv5ATKRkjrdgP2R7WgWmCS4hW2mPwBcL=gzdDNw@mail.gmail.com>
 <D57F9A07-AB77-4FF9-B0A6-C502DC60D093@kernel.org>
 <529e56c85732b0bfcf277de9c651f6c58f47b3b4.camel@redhat.com>
 <CACO55tvJE4UvsAY8yfY7j4gMRkk4kLUPedfL0Sw2B7OF=s-rEw@mail.gmail.com>
Message-ID: <8B2F4001-01FC-4554-B6E0-1E75E9CE473B@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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
Cc: Kees Cook <keescook@chromium.org>, gustavo@embeddedor.com,
 Linus Torvalds <torvalds@linux-foundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, qing.zhao@oracle.com,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On April 27, 2023 3:50:06 PM PDT, Karol Herbst <kherbst@redhat=2Ecom> wrote=
:
>On Fri, Apr 28, 2023 at 12:46=E2=80=AFAM Lyude Paul <lyude@redhat=2Ecom> =
wrote:
>>
>> Hey Linus, Kees=2E Responses below
>>
>> On Sun, 2023-04-23 at 13:23 -0700, Kees Cook wrote:
>> > On April 23, 2023 10:36:24 AM PDT, Linus Torvalds <torvalds@linux-fou=
ndation=2Eorg> wrote:
>> > > Kees,
>> > >  I made the mistake of upgrading my M2 Macbook Air to Fedora-38, an=
d
>> > > in the process I got gcc-13 which is not WERROR-clean because we on=
ly
>> > > limited the 'array-bounds' warning to gcc-11 and gcc-12=2E But gcc-=
13
>> > > has all the same issues=2E
>> > >
>> > > And I want to be able to do my arm64 builds with WERROR on still=2E=
=2E=2E
>> > >
>> > > I guess it never made much sense to hope it was going to go away
>> > > without having a confirmation, so I just changed it to be gcc-11+=
=2E
>> >
>> > Yeah, that's fine=2E GCC 13 released without having a fix for at leas=
t one (hopefully last) known array-bounds vs jump threading bug:
>> > https://gcc=2Egnu=2Eorg/bugzilla/show_bug=2Ecgi?id=3D109071
>> >
>> > > And one of them is from you=2E
>> > >
>> > > In particular, commit 4076ea2419cf ("drm/nouveau/disp: Fix
>> > > nvif_outp_acquire_dp() argument size") cannot possibly be right, It
>> > > changes
>> > >
>> > > nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[16],
>> > >
>> > > to
>> > >
>> > > nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CA=
P_SIZE],
>> > >
>> > > and then does
>> > >
>> > >        memcpy(args=2Edp=2Edpcd, dpcd, sizeof(args=2Edp=2Edpcd));
>> > >
>> > > where that 'args=2Edp=2Edpcd' is a 16-byte array, and DP_RECEIVER_C=
AP_SIZE is 15=2E
>> >
>> > Yeah, it was an incomplete fix=2E I sent the other half here, but it =
fell through the cracks:
>> > https://lore=2Ekernel=2Eorg/lkml/20230204184307=2Enever=2E825-kees@ke=
rnel=2Eorg/
>>
>> Thanks for bringing this to our attention, yeah this definitely just lo=
oks
>> like it got missed somewhere down the line=2E It looks like Karol respo=
nded
>> already so I assume the patch is in the pipeline now, but let me know i=
f
>> there's anything else you need=2E
>>
>
>uhm, I didn't push anything, but I can push it through drm-misct asap,
>just wanted to ask if somebody wants to pick a quicker route=2E But I
>guess not?

If you can pick it up, that would be great=2E There's no rush=2E :)



--=20
Kees Cook
