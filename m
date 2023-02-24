Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 893A56A18B4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 10:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E216810E6AC;
	Fri, 24 Feb 2023 09:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776B010E0AE;
 Fri, 24 Feb 2023 09:26:43 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id s20so16834273lfb.11;
 Fri, 24 Feb 2023 01:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=tn4heN+xayUw9CWYDpKV49sFxbJE9AzvhKDPogIlGWk=;
 b=IKlcOFPKkpIHAWPHxnKle3uFn3WD4QwmXkL8sqaE5FNUMIHyr+DBlyBcLbq/Fv/Jw3
 Q/1NaM0pgUfkDRTJg7BFBYyZf8sC2p87BVQ6ngYM3+ukxCpe5w6jsT+XxXx6sdcYlcHz
 BnGcimg0syH0bj38qSO6iGzPo9cTKMho+ij4ubm/GWjf0hj8a+KY4W9Hb0wTnXwnKVTI
 PjjL/6dlg0ulXwQl2abIr44yvVakn9dz6kHx01WXHs7XKks2VqEJFN6u8n6ZDZwCQzwI
 MtGuAiQhBThTXX6LLYU7Ej+BhguWTwCF39ml5FeCgGwDIQ7ZvEd/YYFg9JvBcaM/bfAz
 FCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tn4heN+xayUw9CWYDpKV49sFxbJE9AzvhKDPogIlGWk=;
 b=QmX/bf6QOYT4W8215ty9mIWQGneTwdLkdT9y7UKy8Fwsd5hGmGjKMbuus7WXXwJIND
 ATNdDRc6lqcinKHAC/NV/POtphNXbbYtorN3u5qwkFUfEbxZaRPgaAR9+0qsUrLLuTu0
 BgJ8vYpcOw/s61AB9MBk5p+akzu9P+l2rs/x35J/A3kLEjIOI6Rd2XoL/ObkIPKplE+s
 iPLfuQp9X2Mfs5ULnelohd0oiSFqrj1GCFLhZHHPFms+1mioDr9DAzozooDQSk2tSKLZ
 OqvqKCI+5tPlSjTIWaEGirVunqBiLhgxAD9yEI2vDtSle6CzzCfBP9dtnH+1EdU7GZ+r
 Kg+w==
X-Gm-Message-State: AO0yUKUhxbQcNJNqGNljuE9L8fegZyXaBUekrOPNVK63hPMKgocjqc9S
 zDNUyttw+wnE966W8agS40M=
X-Google-Smtp-Source: AK7set8Edu6TJIEzFp8nO3iN/aWffOHgPnU91xlvxqbHQLnvZm/Xo+5/CWn5cDLMMcJZbfqIKVI3QQ==
X-Received: by 2002:ac2:4c08:0:b0:4d8:6c17:8a65 with SMTP id
 t8-20020ac24c08000000b004d86c178a65mr5535378lfq.58.1677230801553; 
 Fri, 24 Feb 2023 01:26:41 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 1-20020ac25681000000b004db25f2c103sm1529997lfr.86.2023.02.24.01.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 01:26:41 -0800 (PST)
Date: Fri, 24 Feb 2023 11:26:30 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v4 06/14] dma-buf/sync_file: Support (E)POLLPRI
Message-ID: <20230224112630.313d7b76@eldfell>
In-Reply-To: <CAF6AEGuE89kuKTjjzwW1xMppcVw-M4-hcrtifed-mvsCA=cshQ@mail.gmail.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-7-robdclark@gmail.com>
 <20230220105345.70e46fa5@eldfell>
 <CAF6AEGv9fLQCD65ytRTGp=EkNB1QoZYH5ArphgGQALV9J08Cmw@mail.gmail.com>
 <cdd5f892-49b9-1e22-4dc1-95a8a733c453@amd.com>
 <CAF6AEGuMn3FywPkEtfJ7oZ16A0Bk2aiaRvj4si4od1d3wzXkPw@mail.gmail.com>
 <20230222114900.1b6baf95@eldfell>
 <CAF6AEGs1_75gg+LCBj6=PH8Jn60PXiE+Kx_2636nP-+pajN8Hg@mail.gmail.com>
 <20230223113814.3010cedc@eldfell>
 <CAF6AEGuE89kuKTjjzwW1xMppcVw-M4-hcrtifed-mvsCA=cshQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uHBSYjb20fW6JX00W0Xc.i_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/uHBSYjb20fW6JX00W0Xc.i_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Feb 2023 10:51:48 -0800
Rob Clark <robdclark@gmail.com> wrote:

> On Thu, Feb 23, 2023 at 1:38 AM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> >
> > On Wed, 22 Feb 2023 07:37:26 -0800
> > Rob Clark <robdclark@gmail.com> wrote:
> > =20
> > > On Wed, Feb 22, 2023 at 1:49 AM Pekka Paalanen <ppaalanen@gmail.com> =
wrote: =20

...

> > > > On another matter, if the application uses SET_DEADLINE with one
> > > > timestamp, and the compositor uses SET_DEADLINE on the same thing w=
ith
> > > > another timestamp, what should happen? =20
> > >
> > > The expectation is that many deadline hints can be set on a fence.
> > > The fence signaller should track the soonest deadline. =20
> >
> > You need to document that as UAPI, since it is observable to userspace.
> > It would be bad if drivers or subsystems would differ in behaviour.
> > =20
>=20
> It is in the end a hint.  It is about giving the driver more
> information so that it can make better choices.  But the driver is
> even free to ignore it.  So maybe "expectation" is too strong of a
> word.  Rather, any other behavior doesn't really make sense.  But it
> could end up being dictated by how the hw and/or fw works.

It will stop being a hint once it has been implemented and used in the
wild long enough. The kernel userspace regression rules make sure of
that.

See the topic of implementing triple-buffering in Mutter in order to
put more work to the GPU in order to have the GPU ramp up clocks in
order to not miss rendering deadlines. I don't think that patch set has
landed in Mutter upstream, but I hear distributions in downstream are
already carrying it.

https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1383
https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1441

Granted, GPU clocks are just one side of that story it seems, and
triple-buffering may have other benefits.

If SET_DEADLINE would fix that problem without triple-buffering, it is
definitely userspace observable, expected and eventually required
behaviour.


Thanks,
pq

--Sig_/uHBSYjb20fW6JX00W0Xc.i_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmP4gsYACgkQI1/ltBGq
qqfZTw/+Lbv76M0E26urQwDLG2JyGPlyP2cGStoEl3g1AGFqwTc4GwQroDY2kntr
Q/8Ux8jQ3UOsIgdkPji1jYSXMUo3fnzKSaAjHqt60BLDXM05WelYTLuCRJVDd5zM
E/+TYH45x8wRvZz/BJJl8KW6Lis2izfsS2hHERFKtqHEkiiN+VMvx0Aj5/fcToI4
OuM79Bblb10aqHVEEuka6TENfJG94jZtpHWvO0JdRtjQnVHSy9AxIR6EdaOnSVXb
6gAob42KMODAiYpDze8GVIP16VzlWVpFQaVv0XcQkh8SVtpKuwRU6hTOb6uys74Q
89yh3OUp1BpN4PwIVrhrV6X7VHe0Fb45F//QX6L/bkNUNPq2BujvQRcNrpVD+UOq
aAMC6nUpRgrQEveqqmWWloicApPcF4tbpcVHWpu+t6edPRquwNN2n8DS5bOhYs+Z
fHcmaj84jbOPdKXxxauFtq8r4t2du0mKvXTE54+BhWx/IHTf6E5mq3LpydpjPCcD
X8exj4pRfjmi9juUjaBepDMfoqbh3yvQR/ER0M01By5GOzO3TlHVmtdBfsUzehTI
uXfmWZWwEqgWPMf285UDEDL4sw697G6E8egllZlyH5Ynp+xOpv/p2QIffwq1AvRL
uj/MCIiSJDmLmNyA7WuBSyxYYtJahvi+UP7BB80lynbBEnQfhvE=
=5gOd
-----END PGP SIGNATURE-----

--Sig_/uHBSYjb20fW6JX00W0Xc.i_--
