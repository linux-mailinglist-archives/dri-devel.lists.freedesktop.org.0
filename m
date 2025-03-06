Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C8DA53ECE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 01:03:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7B410E86F;
	Thu,  6 Mar 2025 00:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DgFvHfHN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D57210E86F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 00:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741219434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Flg2kQTF/DcIyj09Ii0oL+jacM3Ozf8hm04LIV6I9So=;
 b=DgFvHfHNme3zqB0SjLmvt8hAZPidRUnHcurKJ8ky/P8Ejx+s21wulYK+oHww6ysAh3Aji1
 sMu/lhFB0g2Luzm5Uf5jwl3exzo+UIyfzRRV4rvXNyL8fbvzRSbVPU7pthFARxs8V1FIne
 S93Qwp6B4CZ3fxjPNLMAZnz80GbDclE=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-2C3zM-f6P12vSX9UAxIKMQ-1; Wed, 05 Mar 2025 19:03:52 -0500
X-MC-Unique: 2C3zM-f6P12vSX9UAxIKMQ-1
X-Mimecast-MFC-AGG-ID: 2C3zM-f6P12vSX9UAxIKMQ_1741219432
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-6fd3503faf8so1532717b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 16:03:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741219432; x=1741824232;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Flg2kQTF/DcIyj09Ii0oL+jacM3Ozf8hm04LIV6I9So=;
 b=gIrUwOL5lgNVY1jpmv76KrxpclgCHUWIoeRFRRUNip7sj2i90C9tSVbRKVbX5lKUXO
 dGvDLg1Dz3H6RmIdxbPyTE8BbQDfhZa4Pp3XlJjvOPccw8Mq1xdw6rwtLWnTccSOIiei
 0vdigwD2QShJd92IAO3v077ohMIkDJ3gyoYYNiISLD8hLTdMFWO1UCf8MteuhoR+1XNZ
 ox0SyID3oyjSD+CiHXhTJttnsZO7jCQIq9cTLsugzw+3JVDNL9d+n9CzPwexvqf81xWo
 Ic3Bm4C4e12xyRgJc/ORIrDV0BRwo0Fr8eTLQY8V0i+aRN/vDFmwwwWxwfTsB6teJ/Ff
 sPkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWNZ/7mjVbnQ8SS/YQFfy1HMw2MBKtLWlvWHIrfunre88l4h/rCbgyqyYvCQV/6NMnYA4z8v/Gsu0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjmqiJlUCz9PeO8mcmnGgsTZZhL0+/m/BlFvRUA43eyFJDuiFe
 fM5EQ/kmQnG4X7zLXW7mhjYPHo1Or8LruF1Dt2/mExhE7Zkc6RhKM9ULUV9KjxS89yibwVP82it
 MDNvKexS+ocuePzzJaG4N9eEmruhl2OAZMd4gJIMqQsLLCQkv01MXcDHL8apakbu5AHOYpE9afy
 WH6+yVmath6EVM/rgak5QCst6Kc/kuakzgB7vAW/Me
X-Gm-Gg: ASbGncu0WsZc1zi/65PfiohzqLcJan8ne3/+vcE7h1LpeP3CwowYKYLK06XaWulMg2U
 T+A+ifEiStk/PBPB+IluUY1Ym6N9p7KtJj6AEkOWzLMU07r588HVyMkZS5TlQgqXvGbjS7j8=
X-Received: by 2002:a05:690c:4c09:b0:6ef:4ed2:7dec with SMTP id
 00721157ae682-6fda30346afmr67176817b3.8.1741219430780; 
 Wed, 05 Mar 2025 16:03:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRyDfspNX+IRIlFHeLD53A7/t05aLiHTjUXqK5lwT0QMetWb6a8CwoYtfHTzjbONteO5IuFuJe3rTR4QtB3q0=
X-Received: by 2002:a05:690c:4c09:b0:6ef:4ed2:7dec with SMTP id
 00721157ae682-6fda30346afmr67176467b3.8.1741219430509; Wed, 05 Mar 2025
 16:03:50 -0800 (PST)
MIME-Version: 1.0
References: <20250206-mipi-cocci-v1-0-4ff0c69e8897@redhat.com>
 <CAD=FV=WkPefg00R_TAQQA6waRqGdD+3e84JXfPLk2i9BRzW6Yg@mail.gmail.com>
 <CAN9Xe3S6u1hjp0YifoFC4N9t6Ek3+ZZQPPbL529Y1_+AvnPNLg@mail.gmail.com>
 <bifqi2pn4cmefj5sxt26n7xc3kpn4rwaajgxcyv6aujlgpx3dt@tjfignye446u>
In-Reply-To: <bifqi2pn4cmefj5sxt26n7xc3kpn4rwaajgxcyv6aujlgpx3dt@tjfignye446u>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 5 Mar 2025 19:03:39 -0500
X-Gm-Features: AQ5f1JqV3lrn7sbyK3mmgQe9h--BiiBfCrW1rkO6wf5hEYIWDi9R5-SHsu3oxmc
Message-ID: <CAN9Xe3Rfr6-m5GNuRdDBkafzwf6h7UDncsBEQkwh293Yq0mg8w@mail.gmail.com>
Subject: Re: [PATCH 00/14] drm/panel: Transition away from using
 mipi_dsi_*_write_seq()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Joel Selvaraj <jo@jsfamily.in>, Ondrej Jirman <megi@xff.cz>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Artur Weber <aweber.kernel@gmail.com>, 
 Jianhua Lu <lujianhua000@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Tejas Vipin <tejasvipin76@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UMnUONvBIVpE-kQ_O_A_AtMB2SpY2rVJkfQbRlhhTBA_1741219432
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a1cb07062fa13d59"
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

--000000000000a1cb07062fa13d59
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 4:29=E2=80=AFPM Dmitry Baryshkov <dmitry.baryshkov@l=
inaro.org>
wrote:

> On Wed, Mar 05, 2025 at 12:29:06PM -0500, Anusha Srivatsa wrote:
> > On Sat, Feb 8, 2025 at 3:43=E2=80=AFPM Doug Anderson <dianders@chromium=
.org>
> wrote:
> >
> > > Hi,
> > >
> > > On Thu, Feb 6, 2025 at 1:06=E2=80=AFPM Anusha Srivatsa <asrivats@redh=
at.com>
> > > wrote:
> > > >
> > > > Transition away from mipi_dsi_generic_write_seq() and
> > > > mipi_dsi_dcs_write_seq() to mipi_dsi_generic_write_seq_multi()
> > > > and mipi_dsi_dcs_write_seq_multi() respectively.
> > > >
> > > > This is addressing one of the gpu todo items [1]
> > > >
> > > > Used Coccinelle to make the code changes.
> > >
> > > As Dmitry mentioned [1], I think a real cleanup needs more thought
> > > than can be done in a Coccinelle script. Maybe you can make a script
> > > that's super fancy and does a perfect conversion, but I sorta doubt i=
t
> > > in this case.
> > >
> > > A few other note:
> > >
> > > * Tejas Vipin has been slowly whittling down this TODO item. It would
> > > be good to CC him on any attempts to avoid duplicating work. He just
> > > submitted a patch [2] that duplicates one of the panels you ran your
> > > script on. It would also be good to look at the patches he has been
> > > posting to see some of the extra complexities.
> > >
> > > * I'm happy you CCed on the cover letter, but given that I've been
> > > helping with this TODO entry it would have been nice to have been CCe=
d
> > > on all the patches.
> > >
> > > For now I'm not going to review the individual patches in this series=
.
> > > If there are any where you think your Coccinelle script really got
> > > everything adjusted perfectly then feel free to point them out and
> > > I'll review them. If you want to help with this effort, my own
> > > personal preference would be to at least start w/ one panel at a time
> > > since probably review feedback on all the conversions will be similar=
.
> > >
> > > Thanks!
> > >
> > >
> > I thought I had replied to this  :( (face-palm) sincere apologies.
> Luckily
> > I bumped into this today.  Thanks for the feedback. I agree with what y=
ou
> > said. While the script catches the patterns , a little of manual
> conversion
> > and proof checking is needed. I am taking this into account while I spi=
n
> > the next version. WIll CC everyone in individual patches who have taken
> > their time to take a look at my clearly incomplete approach to this
> > redesign.
>
> - Please post them one by one rather than the whole series
> - As you are looking into the same set of items as Tejas has been
>   working on, please make sure to discuss the order, so that you don't
>   do the same job twice.
>
>
Sounds good!
https://lore.kernel.org/dri-devel/20250305-mipi-synaptic-1-v1-1-92017cd19ef=
6@redhat.com/T/#u

Anusha

> >
> > Again, thanks Dough
> >
> > Anusha
> >
> > > -Doug
> > >
> > > [1]
> > >
> https://lore.kernel.org/r/mz6usiheb2lx6wlk47z3btvf6t6kbo4ja4n6mli5hosrpcv=
dwp@wmvfvhaqhpkm
> > > [2]
> > >
> http://lore.kernel.org/r/20250208051541.176667-1-tejasvipin76@gmail.com
> > >
> > >
>
> --
> With best wishes
> Dmitry
>
>

--000000000000a1cb07062fa13d59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 5, =
2025 at 4:29=E2=80=AFPM Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.barys=
hkov@linaro.org">dmitry.baryshkov@linaro.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Wed, Mar 05, 2025 at 12:29:0=
6PM -0500, Anusha Srivatsa wrote:<br>
&gt; On Sat, Feb 8, 2025 at 3:43=E2=80=AFPM Doug Anderson &lt;<a href=3D"ma=
ilto:dianders@chromium.org" target=3D"_blank">dianders@chromium.org</a>&gt;=
 wrote:<br>
&gt; <br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Feb 6, 2025 at 1:06=E2=80=AFPM Anusha Srivatsa &lt;<a hre=
f=3D"mailto:asrivats@redhat.com" target=3D"_blank">asrivats@redhat.com</a>&=
gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Transition away from mipi_dsi_generic_write_seq() and<br>
&gt; &gt; &gt; mipi_dsi_dcs_write_seq() to mipi_dsi_generic_write_seq_multi=
()<br>
&gt; &gt; &gt; and mipi_dsi_dcs_write_seq_multi() respectively.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This is addressing one of the gpu todo items [1]<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Used Coccinelle to make the code changes.<br>
&gt; &gt;<br>
&gt; &gt; As Dmitry mentioned [1], I think a real cleanup needs more though=
t<br>
&gt; &gt; than can be done in a Coccinelle script. Maybe you can make a scr=
ipt<br>
&gt; &gt; that&#39;s super fancy and does a perfect conversion, but I sorta=
 doubt it<br>
&gt; &gt; in this case.<br>
&gt; &gt;<br>
&gt; &gt; A few other note:<br>
&gt; &gt;<br>
&gt; &gt; * Tejas Vipin has been slowly whittling down this TODO item. It w=
ould<br>
&gt; &gt; be good to CC him on any attempts to avoid duplicating work. He j=
ust<br>
&gt; &gt; submitted a patch [2] that duplicates one of the panels you ran y=
our<br>
&gt; &gt; script on. It would also be good to look at the patches he has be=
en<br>
&gt; &gt; posting to see some of the extra complexities.<br>
&gt; &gt;<br>
&gt; &gt; * I&#39;m happy you CCed on the cover letter, but given that I&#3=
9;ve been<br>
&gt; &gt; helping with this TODO entry it would have been nice to have been=
 CCed<br>
&gt; &gt; on all the patches.<br>
&gt; &gt;<br>
&gt; &gt; For now I&#39;m not going to review the individual patches in thi=
s series.<br>
&gt; &gt; If there are any where you think your Coccinelle script really go=
t<br>
&gt; &gt; everything adjusted perfectly then feel free to point them out an=
d<br>
&gt; &gt; I&#39;ll review them. If you want to help with this effort, my ow=
n<br>
&gt; &gt; personal preference would be to at least start w/ one panel at a =
time<br>
&gt; &gt; since probably review feedback on all the conversions will be sim=
ilar.<br>
&gt; &gt;<br>
&gt; &gt; Thanks!<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; I thought I had replied to this=C2=A0 :( (face-palm) sincere apologies=
. Luckily<br>
&gt; I bumped into this today.=C2=A0 Thanks for the feedback. I agree with =
what you<br>
&gt; said. While the script catches the patterns , a little of manual conve=
rsion<br>
&gt; and proof checking is needed. I am taking this into account while I sp=
in<br>
&gt; the next version. WIll CC everyone in individual patches who have take=
n<br>
&gt; their time to take a look at my clearly incomplete approach to this<br=
>
&gt; redesign.<br>
<br>
- Please post them one by one rather than the whole series<br>
- As you are looking into the same set of items as Tejas has been<br>
=C2=A0 working on, please make sure to discuss the order, so that you don&#=
39;t<br>
=C2=A0 do the same job twice.<br>
<br></blockquote><div><br></div><div>Sounds good!</div><div><a href=3D"http=
s://lore.kernel.org/dri-devel/20250305-mipi-synaptic-1-v1-1-92017cd19ef6@re=
dhat.com/T/#u">https://lore.kernel.org/dri-devel/20250305-mipi-synaptic-1-v=
1-1-92017cd19ef6@redhat.com/T/#u</a></div><div></div><div><br></div><div>An=
usha <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; Again, thanks Dough<br>
&gt; <br>
&gt; Anusha<br>
&gt; <br>
&gt; &gt; -Doug<br>
&gt; &gt;<br>
&gt; &gt; [1]<br>
&gt; &gt; <a href=3D"https://lore.kernel.org/r/mz6usiheb2lx6wlk47z3btvf6t6k=
bo4ja4n6mli5hosrpcvdwp@wmvfvhaqhpkm" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lore.kernel.org/r/mz6usiheb2lx6wlk47z3btvf6t6kbo4ja4n6mli5hosrpcvdwp=
@wmvfvhaqhpkm</a><br>
&gt; &gt; [2]<br>
&gt; &gt; <a href=3D"http://lore.kernel.org/r/20250208051541.176667-1-tejas=
vipin76@gmail.com" rel=3D"noreferrer" target=3D"_blank">http://lore.kernel.=
org/r/20250208051541.176667-1-tejasvipin76@gmail.com</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
<br>
-- <br>
With best wishes<br>
Dmitry<br>
<br>
</blockquote></div></div>

--000000000000a1cb07062fa13d59--

