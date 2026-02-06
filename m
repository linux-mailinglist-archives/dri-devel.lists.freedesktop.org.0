Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKamEB7HhWnAGAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 11:49:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FC2FCCDA
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 11:49:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0091710E6F6;
	Fri,  6 Feb 2026 10:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ltwfn+3Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com
 [74.125.224.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F3E10E6F0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 10:48:58 +0000 (UTC)
Received: by mail-yx1-f46.google.com with SMTP id
 956f58d0204a3-649e456e7a8so2054214d50.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 02:48:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770374937; cv=none;
 d=google.com; s=arc-20240605;
 b=Uu5X3IL2yV1O4Op4VpKe6IMcdS86atKkEY3fXlNaiahmfnCttj8wbACpuSRUFopZo9
 9pVCRQGpOVRju8Nk56x0E2EKDBHj0jfNkKB3isX2UezYqmAWQoNQxxEOeBi7haEScwiV
 ZgVjd3e2oC9Upe59jGLiNFLcj8+CXUfDp6DJjClAHQ5jLPPgNmtTiqNdmPUUHi1gWw/b
 cTYOiW6BFzqjjyDQ486RM305IKVi8hHCxyyEgzuilIaeHa1zUM+T+2B9lqjopW0EEeVq
 6GFhx+F4sypjfdYIiwhFxsyLnLoD5P/XsqiPLge4K+q+nDZewLDCH6gAElpeeELXTgqk
 HRUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=eAn3o0Yd4xAGutFGBDLV7iIaln3v7d2nSWfObwWoltc=;
 fh=aQOY+RjQJO/uXk4/Oj8aqHJ2YZ1G/2dC2LSUuKLbRgM=;
 b=TD/Iu5jjOEt7bsa2AmAl20GwizHX3RhRhCy2WohKYZ0KFQvf5tH69XE6t0NJdXfjLt
 ccxNxcEJLZ+FGA+7IsTI+/7tBIwAIN/n0wPzlQwjC3nWGBeO2IJqoMbc9I+fPnPAlTqm
 cTwaj1ced8z3s5v9z0U+/7GBSMmJWQDWkAje9osEHBXArmv1O20PySmv8EM6zKrlIIJh
 OUsIOBQvnG2emJcfwLOLtP52evx85CQTRCRody+59fTM55mSrjuGLiAeuVfgn4aSdM37
 Z//ys66lUFCsz4bikQZ017J/MpvKzbkV45uAfGUJtSTAfUwrbP2FnqCQt8qw+GK2lnzh
 89zQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770374937; x=1770979737; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eAn3o0Yd4xAGutFGBDLV7iIaln3v7d2nSWfObwWoltc=;
 b=ltwfn+3ZOCtbJpXnIlXZxEg6ZmfEt+zdxqZNLqGIV+6n5zGYhJZLltGaDUoTxpNCjq
 Jv7xsuKFyA7rCkmZ49Zu9DQBmp8AHrPxZ+IALFg3jTaO1NcNA2uJY+21GtrcAQAHAT1N
 8bXR/J1eeTNIyFGCoYrCDqwugg6ETjKWFSAYrpwmXcxnaNcJwZrXANBYPQr1mTKA8cDc
 3hGSjuqQnVj7AOoLfgTOa+xvu3Euvh/jJwVQZpIPDQZfsC70FnESvW/tjVEAx5Ggbbcl
 UbnHxY696j+NNzSATcod6GfpcseMHF6Kz/HQIq5s7FGzXyV7MaV2hGQFuXI9HzJQblFG
 UMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770374937; x=1770979737;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eAn3o0Yd4xAGutFGBDLV7iIaln3v7d2nSWfObwWoltc=;
 b=tgycYqiLHCUL4iXV4Scl6Ku83jHO3Hcu1K+zRjNJ+PKLjK8oY46tgDw8fJ3RTxURl2
 48SwOxcNDL2uH6V/nGMhK7YO1RZgVlLzSMuEuz7elRKKHjrVuO9kDmD11kFTK1w/p7qq
 qPSRRW8JtEaCKzUVVw/sWVM2ZCc12njhMbz5Rx71r1uG+B0Fsd7Mfb7MHVlh/B3dTgLW
 WWMIFKIdg6wVDfsykT4xkHwFd/pPZapTN7mwYQVM9ijVZU8KoRuytTrYUelxe7tEKRrP
 kc/+frY90NV06ooZPiu4ZQPKNuqHVM44v/H+VjAepPpRbtblbBSR05zWct5R77GIHXLz
 KnAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV30tkxVASq9S8CYvzEVA9T3DHwol1RyXk/VQ31iZxKv2KgRQxUBAYx1pTaLMxMxlVrmEBSXk2WrZs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyv20JUZPItQpKiZ958sa7P5dtDkqZFW6Fi4lg1HU8SAP5slNho
 Ks20OxoFN31Uc9xDaV6kuCnYMLBo/kX12OauFP5VIWAuJYQ3p8W3HTXKPKJ6J2O6zOUE6Wfu3b4
 H2Fz0rhGKSJH8YudL6zHhtb3DOkaabyrY9H7VJS1oEQ==
X-Gm-Gg: AZuq6aIpvl3tOpwVUM3dw3ncBjQOd1p1gU1P5u3Lch2KDgdF/tLC6L1EnaTgmqoeS70
 g511i8YaM4v8pOiVVSNOySlI2EcKt3AhkPE+j93jZm6OYa483erxIt/C5jFpRGM91mw2tET1LP+
 oirYKCLPUqDbpIoVZ2k/vx1SwSkEct2N4mbEUzDXGZ+5IaiQQjkcfEzfal/A4kOM9WxfO3poeyA
 TbKsQxhOwAxYWxkIqqjd6KbBMvtdvNIaOCe1pvI3auuur6fYeOACnS1bQqkUG22lRsQ2uokXvzh
 Tg9U4g==
X-Received: by 2002:a05:690e:12c1:b0:649:c7dd:d2ea with SMTP id
 956f58d0204a3-649f1f16109mr1967700d50.39.1770374937050; Fri, 06 Feb 2026
 02:48:57 -0800 (PST)
MIME-Version: 1.0
References: <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
 <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
 <91d590de-fa00-4df3-923f-b49ad00cd9da@oss.qualcomm.com>
 <CABymUCOqxtYS7BaDMHeN2npn=4+Y-6kxLDOS6oskiiH58epR5w@mail.gmail.com>
 <bbd8e584-4398-40da-9759-0c27f34214d3@oss.qualcomm.com>
 <CABymUCMivNJt4fikx8XJ8KFZB-y4zc2RaqjBksxWrQFD9foEkg@mail.gmail.com>
 <7c3yxfkadtkd6xs6aiupcamykx75c2tieakc7n4a2jyymz6kzz@4gflcto2nbkj>
 <CABymUCMeS7cWgEProyWnMUJ1fF1rfba3dy4VB0mwTmPbpTvanA@mail.gmail.com>
 <g2kzzrfmcsmzs6wz7alzjjycytpuebxwbehkco7yimdg2jam5a@uqsrt7mov7la>
 <CABymUCOmq_FVOQRVQSz97wjF_gtdji4dXz0CucChvFyqmyw06w@mail.gmail.com>
 <5gninhmgt3udo3nxeo46lpydv24v7zy6ahuibshohd7flbw5nl@gwf2fujuzo4u>
In-Reply-To: <5gninhmgt3udo3nxeo46lpydv24v7zy6ahuibshohd7flbw5nl@gwf2fujuzo4u>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 6 Feb 2026 18:48:45 +0800
X-Gm-Features: AZwV_QhWbsureIrXGFM54d6J0U2P02RhZgYjmGBh3CSw3jwL-VMVq1Tq4XKBgV4
Message-ID: <CABymUCO7jUbTt_R4q2btdR1-iQzTOvj+z=A1x0Y=CEntkE=9Zw@mail.gmail.com>
Subject: Re: [PATCH v17 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jun.nie@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,mail.gmail.com:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: D7FC2FCCDA
X-Rspamd-Action: no action

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
2=E6=9C=884=E6=97=A5=E5=91=A8=E4=B8=89 10:44=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Feb 02, 2026 at 03:15:14PM +0800, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B41=E6=9C=8827=E6=97=A5=E5=91=A8=E4=BA=8C 03:06=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > On Mon, Jan 26, 2026 at 09:29:44PM +0800, Jun Nie wrote:
> > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=
=E5=B9=B41=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 20:31=E5=86=99=E9=81=93=EF=
=BC=9A
> > > > >
> > > > > On Mon, Jan 26, 2026 at 08:01:00PM +0800, Jun Nie wrote:
> > > > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2=
026=E5=B9=B41=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 18:49=E5=86=99=E9=81=93=
=EF=BC=9A
> > > > > > >
> > > > > > > On 26/01/2026 12:29, Jun Nie wrote:
> > > > > > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=
=8E2026=E5=B9=B41=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 18:13=E5=86=99=E9=
=81=93=EF=BC=9A
> > > > > > > >>
> > > > > > > >> On 26/01/2026 12:06, Jun Nie wrote:
> > > > > > > >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=
=BA=8E2026=E5=B9=B41=E6=9C=8822=E6=97=A5=E5=91=A8=E5=9B=9B 18:22=E5=86=99=
=E9=81=93=EF=BC=9A
> > > > > > > >>>>
> > > > > > > >>>> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
> > > > > > > >>>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =
=E4=BA=8E2026=E5=B9=B41=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89 17:30=E5=86=
=99=E9=81=93=EF=BC=9A
> > > > > > > >>>>>>
> > > > > > > >>>>>> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrot=
e:
> > > > > > > >>>>>>> Currently, plane splitting and SSPP allocation occur =
during the plane
> > > > > > > >>>>>>> check phase. Defer these operations until dpu_assign_=
plane_resources()
> > > > > > > >>>>>>> is called from the CRTC side to ensure the topology i=
nformation from
> > > > > > > >>>>>>> the CRTC check is available.
> > > > > > > >>>>>>
> > > > > > > >>>>>> Why is it important? What is broken otherwise?
> > > > > > > >>>>>
> > > > > > > >>>>> I see. Thanks! Will add below lines in next version.
> > > > > > > >>>>>
> > > > > > > >>>>> By default, the plane check occurs before the CRTC chec=
k.
> > > > > > > >>>>> Without topology information from the CRTC, plane split=
ting
> > > > > > > >>>>> cannot be properly executed. Consequently, the SSPP
> > > > > > > >>>>> engine starts without a valid memory address, which tri=
ggers
> > > > > > > >>>>> an IOMMU warning.
> > > > > > > >>>>
> > > > > > > >>>> What is plane splitting? Write commit message for somebo=
dy who doesn't
> > > > > > > >>>> exactly know what is going on.
> > > > > > > >>>
> > > > > > > >>> Thanks for the suggestion! Any more revise is needed?
> > > > > > > >>
> > > > > > > >> Sadly enough the text below is not a significant improveme=
nt.
> > > > > > > >>
> > > > > > > >>>
> > > > > > > >>> Currently, splitting plane into SSPP rectangles the alloc=
ation occur
> > > > > > > >>> during the plane check phase, so that a plane can be supp=
orted by
> > > > > > > >>> multiple hardware pipe.
> > > > > > > >>
> > > > > > > >> What does this mean? Without virtual planes in place, ther=
e are no
> > > > > > > >> multiple hardware pipes.
> > > > > > > >>
> > > > > > > >>> While pipe topology is decided in CRTC check.
> > > > > > > >>
> > > > > > > >> ?? What does it mean here?
> > > > > > > >>
> > > > > > > >>> By default, the plane check occurs before the CRTC check =
in DRM
> > > > > > > >>> framework. Without topology information from the CRTC, pl=
ane splitting
> > > > > > > >>> cannot be properly executed.
> > > > > > > >>
> > > > > > > >> What does 'properly' mean here? How is it executed? What h=
appens?
> > > > > > > >>
> > > > > > > >>> Consequently, the SSPP engine starts
> > > > > > > >>> without a valid memory address, which triggers IOMMU warn=
ing.
> > > > > > > >>
> > > > > > > >> IOMMU faults. There are no "warnings".
> > > > > > > >>
> > > > > > > >>>
> > > > > > > >>> Defer above plane operations until dpu_assign_plane_resou=
rces()
> > > > > > > >>> is called from the CRTC side to ensure the topology infor=
mation from
> > > > > > > >>> the CRTC check is available.
> > > > > > > >>
> > > > > > > >>
> > > > > > > > Thanks for the patience!
> > > > > > > >
> > > > > > > >
> > > > > > > > Currently, splitting plane into SSPP rectangles and allocat=
ion occur
> > > > > > > > during the plane check phase. When virtual plane is enabled=
 to support
> > > > > > > > quad-pipe topology later, 2 SSPPs with 4 rect will be neede=
d, so that
> > > > > > > > a plane can be supported by 4 hardware pipes. And pipe numb=
er is
> > > > > > >
> > > > > > > number of pipes
> > > > > > >
> > > > > > > > decided in CRTC check per interface number, resolution and =
hardware
> > > > > > > > feature.
> > > > > > >
> > > > > > > Okay, but IOMMU errors were reported with virtual planes bein=
g disabled.
> > > > > > > So how is it relevant?
> > > > > >
> > > > > > After revise of splitting plane into pipes, the number of pipes=
 will be decided
> > > > > > by CRTC check for both virtual plane and non-virtual plane case=
 to unify the
> > > > > > plane handling,  instead of assumption of 2 pipes at most.
> > > > >
> > > > > This needs to be explicitly written.
> > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > By default, the plane check occurs before the CRTC check in=
 DRM
> > > > > > > > framework. Without topology information from the CRTC, plan=
e splitting
> > > > > > >
> > > > > > > WHat is plane splitting?
> > > > > >
> > > > > > How about: s/plane splitting/splitting plane into pipes ?
> > > > >
> > > > > This plane is not being split into anything. It's being mapped on=
to hw
> > > > > pipes. But before that, the number of necessary hw pipes is being=
 determined
> > > > > based on foo, bar an baz,
> > > >
> > > > Thanks for the correction!
> > > >
> > > > Currently, plane is mapped onto at most 2 hardware pipes and 1 SSPP
> > > > allocation occur during the plane check phase. When virtual plane i=
s
> > > > enabled to support quad-pipe topology later, 2 SSPPs with 4 rect wi=
ll
> > > > be needed, so that a plane can be supported by 4 hardware pipes.
> > > >
> > > > After revise of quad-pipe, the number of pipes is decided in CRTC
> > > > check per number of interfaces, resolution, clock rate constrain,
> > >
> > > Where?
> >
> > The pipe is decided in dpu_crtc_get_topology(). Change to quad-pipe
> >  is made in later patch. So I drop this in this patch message below.
>
> The pipe isn't decides in that function.

Sorry for the inaccurate word. I mean the number of pipes is decided in
dpu_crtc_get_topology(), is it correct? Of course, the number of pipe may
be increased from 1 to 2 with filling  r_pipe_cfg in
dpu_plane_atomic_check_nosspp()
due to width or clock rate constrain in non-virtual-plane case. So the code
logic allows 2 mixers co-work with 1 SSPP rect, mixer number is decided in
topology and pipe is decided in plane side, though it is not very reasonabl=
e.
Does DPU support such topology? If not, the number of pipe shall be aliged
with the number of mixers info from topology side. Please help teach me
on the relation number of mixers and SSPP rectangles. Thanks!

>
> > >
> > > > hardware feature and virtual plane enablement. The decidsion of
> > >
> > > decision
> > >
> > > > number of pipes will happen in CRTC check for both virtual plane an=
d
> > > > non-virtual plane case to unify the plane handling. Before that, th=
e
> > >
> > > will? Do you mean, after this patch? If so, please use imperative
> > > language. See Documentation/process/submitting-patches.rst
> >
> > Yes, it is in later patch. So drop it in this patch message.
> >
> > It is possible to keep plane check unchanged, and rely on re-allocation
> > in later stage to support quad-pipe, if quad-pipe use case is detected.
> > But to unify the allocation logic for both non-virtual and virtual plan=
e
> > use cases, and to centralize resource management, we'd better defer
> > the allocation.
>
> Which allocation? The non-virtual-planes case is more or less static.

You are right. The SSPP is assigned to plane in non-virtual-planes case
statically. The plane may be re-mapped to other SSPP only in virtual-plane
case. Just got your point here. I will try to keep the SSPP assignment
unchanged for non-virtual-plane case, avoiding mixing assignment with
allocation.

>
> >
> >
> > >
> > > > the number of necessary hw pipes is being determined based on
> > > > resolution and clock rate constrain.
> > > >
> > > > By default, the plane check occurs before the CRTC check in DRM
> > > > framework. Without topology information from the CRTC, plane mappin=
g
> > > > will be skipped for the first time as number of pipe is 0.
> > > > Consequently, the SSPP engine starts without a valid memory address=
,
> > > > which triggers IOMMU fault.
> > > >
> > > > Defer above plane related operations until dpu_assign_plane_resourc=
es()
> > > > is called from the CRTC side to ensure the topology information fro=
m
> > > > the CRTC check is available.
> > > >
> > > > >
> > > > > >
> > > > > > >
> > > > > > > > will be skipped for the first time as pipe number is 0. Con=
sequently,
> > > > > > > > the SSPP engine starts without a valid memory address, whic=
h triggers
> > > > > > > > IOMMU fault.
> > > > > > > >
> > > > > > > > Defer above plane related operations until dpu_assign_plane=
_resources()
> > > > > > > > is called from the CRTC side to ensure the topology informa=
tion from
> > > > > > > > the CRTC check is available.
> > >
> > How about this commit message? It is more coherent with the change
> > in this patch.
> >
> >
> > Currently, a plane maps to at most two hardware pipes, and SSPP
> > allocation occurs during the plane check phase. However, when virtual
> > planes are enabled, SSPP re-allocation can occur within
> > dpu_assign_plane_resources() during the CRTC check.
>
> There is no _allocation_ for non-virtual-plane case. The SSPP are
> statically assigned to the planes.
>
> >
> > To support future quad-pipe topologies, which require allocating two
> > SSPPs with four rectangles by default, it is more efficient to perform
> > the primary allocation in a single pass rather than relying on later
> > re-allocations. So defer the allocation to CRTC check phase by default.
> > Allocation logic for both non-virtual and virtual plane use cases is
> > unified in this way.
> >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry
