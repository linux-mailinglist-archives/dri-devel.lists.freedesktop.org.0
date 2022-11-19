Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 573AA6310BE
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 21:35:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6777D10E02C;
	Sat, 19 Nov 2022 20:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B3910E02C
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 20:35:48 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id w9so5209681qtv.13
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 12:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+Q8d53TLpjCP7gdCP7UpIRVe0VEVtUGymc2f5Rbugko=;
 b=X3f8PGrW6OlGIyjAOq5RqjIzl1/LR7qL3lBC8lRK0cVsBBAQ6YIRonj8FxLnWXlimF
 GJvAd4k8Z4JLg5YAoOkXzhvLkyVbKsMkyfhGm5nRnQo6io4NkwbmBgt63d59e+9z+Sfm
 ACcIho6irT4KN1xsNw05BS8UQ3E0pROqRfT+JjAIhLhyzzx+i25Cb+GI2QTj/6OpQVxY
 DaUPG6El0f3FO7iPL3je0iX6/J6WkbAPMgQ6L0cOf+lKuyO5hB9XXctefoubh6J4OgDq
 5j9QZSlda/KLg/q4LSfuv+DtQG6qFV7TZNqxMxm7n4F2NmIR+J7YKDPVf7tZYKBOdjQA
 Nrig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+Q8d53TLpjCP7gdCP7UpIRVe0VEVtUGymc2f5Rbugko=;
 b=3UUHuKSa/AdD7mEkcd4RKRxzNZlXZ6+KQ1IMshEWFIku6i+i+im9KS+OSFInhc8k9b
 yHqXabmJng6eIJF0nEauI0WrsnQKskgVIsEQctdiolI9+4lWY4eLVAyyJpCMrsD+C+kq
 /hZ5uQYYOJz78w01+H4fty/q3G8I/HLJ3S0OyQpW46LgbHqvRfgGKMK7BaVGlG0IWnO1
 ES4pJXjEZepbUyA4sR2Fd7lwsHUisQDXVHF65Dytth+F/8WygKDkeXAKmnUMk08zswcq
 f0bhiYbLM+SnXKzMaB4KZGn/vSZF78h4nAXexWHEHFES+LYIbE4b40wx7Z3mwepLMgpH
 691Q==
X-Gm-Message-State: ANoB5pmjLU+KcoMnsMBfww3MBYoSB8m+mWUS380Pp949QTy/dgl4xmon
 73eTnEgbSTWuouosV/zMf/Xy4Q==
X-Google-Smtp-Source: AA0mqf7u+gaF38rzqg9VhfXbkShj2Hx3ztQIyZplmwrs/8bVvLIJVPykTe9XjaNAaZ4JqewmP8z3dw==
X-Received: by 2002:ac8:75c9:0:b0:3a5:4a1a:6ff0 with SMTP id
 z9-20020ac875c9000000b003a54a1a6ff0mr11974238qtq.481.1668890147686; 
 Sat, 19 Nov 2022 12:35:47 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net.
 [192.222.136.102]) by smtp.gmail.com with ESMTPSA id
 x13-20020a05620a448d00b006fa4ac86bfbsm5061437qkp.55.2022.11.19.12.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Nov 2022 12:35:47 -0800 (PST)
Message-ID: <4f79e934aac717ca7fac0c3b8b553a5690efd13a.camel@ndufresne.ca>
Subject: Re: Try to address the DMA-buf coherency problem
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Rob Clark <robdclark@gmail.com>
Date: Sat, 19 Nov 2022 15:35:46 -0500
In-Reply-To: <CAF6AEGuqgWi0T=B9cb+Uy7aoWBPGQmZ3JbwFcK_45GbkY2nHPg@mail.gmail.com>
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
 <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
 <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
 <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
 <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
 <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com>
 <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
 <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
 <4fa4e5d3b1f46e46139bad069cbf5e795e63afa8.camel@pengutronix.de>
 <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
 <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
 <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
 <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
 <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com>
 <346d6ad023ef8697aafd93ac1b100890f3637e44.camel@ndufresne.ca>
 <CAF6AEGuqgWi0T=B9cb+Uy7aoWBPGQmZ3JbwFcK_45GbkY2nHPg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
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
Cc: linux-media@vger.kernel.org,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, Tomasz Figa <tfiga@chromium.org>,
 sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le vendredi 18 novembre 2022 =C3=A0 11:32 -0800, Rob Clark a =C3=A9crit=C2=
=A0:
> On Thu, Nov 17, 2022 at 7:38 AM Nicolas Dufresne <nicolas@ndufresne.ca> w=
rote:
> >=20
> > Le jeudi 17 novembre 2022 =C3=A0 13:10 +0100, Christian K=C3=B6nig a =
=C3=A9crit :
> > > > > DMA-Buf let's the exporter setup the DMA addresses the importer u=
ses to
> > > > > be able to directly decided where a certain operation should go. =
E.g. we
> > > > > have cases where for example a P2P write doesn't even go to memor=
y, but
> > > > > rather a doorbell BAR to trigger another operation. Throwing in C=
PU
> > > > > round trips for explicit ownership transfer completely breaks tha=
t
> > > > > concept.
> > > > It sounds like we should have a dma_dev_is_coherent_with_dev() whic=
h
> > > > accepts two (or an array?) of devices and tells the caller whether =
the
> > > > devices need explicit ownership transfer.
> > >=20
> > > No, exactly that's the concept I'm pushing back on very hard here.
> > >=20
> > > In other words explicit ownership transfer is not something we would
> > > want as requirement in the framework, cause otherwise we break tons o=
f
> > > use cases which require concurrent access to the underlying buffer.
> >=20
> > I'm not pushing for this solution, but really felt the need to correct =
you here.
> > I have quite some experience with ownership transfer mechanism, as this=
 is how
> > GStreamer framework works since 2000. Concurrent access is a really com=
mon use
> > cases and it is quite well defined in that context. The bracketing syst=
em (in
> > this case called map() unmap(), with flag stating the usage intention l=
ike reads
> > and write) is combined the the refcount. The basic rules are simple:
>=20
> This is all CPU oriented, I think Christian is talking about the case
> where ownership transfer happens without CPU involvement, such as via
> GPU waiting on a fence

HW fences and proper ownership isn't incompatible at all. Even if you have =
no
software involved during the usage, software still need to share the dmabuf=
 (at
least once), and sharing modify the ownership, and can be made explicit.

p.s. I will agree if someone raises that this is totally off topic

Nicolas
> BR,
> -R

