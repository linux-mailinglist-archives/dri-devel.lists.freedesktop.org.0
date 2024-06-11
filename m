Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 357F8904194
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 18:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A70210E105;
	Tue, 11 Jun 2024 16:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="FJXXi9WI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06B610E1BB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 16:50:14 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-7955aaf8006so216311585a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 09:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718124612; x=1718729412;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S0XuMDRDWpXOBdAPwQUmPVsc22XbW+IAi1HUrnJZSy4=;
 b=FJXXi9WI9h+mQD5X/6IMFuelhZZpUwdb0b0gbl1+BYPhTnmC63j0DhsYrL4+To6u+t
 gKb69KLnKzgy/TFqZM1uTn7w0EKm1EG6AIHwwiSfGTKj26afVUO+2c8s4iRLXe2T0D6W
 a+mjinJek2WqLE+Fltld4iSJrRIcUGFmmXzXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718124612; x=1718729412;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S0XuMDRDWpXOBdAPwQUmPVsc22XbW+IAi1HUrnJZSy4=;
 b=vXoKDAsYgI9BqVEhnMy8s0zYzLcjBPXNBRWhcqXKyWBb9Eq6rcs9506XZBw/nJW4FO
 XZL+JCllpWHtxqaqwkbjzMS71wpIR9Vh7vhucdrXLqOiSD4KmeMoIiJFSafJXIYn1oCs
 pEImV4F/R4P1RkCUHcWdxdrmj29ZHK3ewCNc9X6FdsuhF+rpvkLGg1qXtg+Y46IvgMCm
 /WZmBFvhefooT43Kc2jd0+1s/lUNtyVlSKC6XiRM+pAbU+y2jAspIiSQoARypcJhmHR9
 hf1DTfNkgrH+G6PZQY9dWFTBxV9ImU0LrMHafb2tN0WWmLCOqdIidugpG9RbqZtsnhKR
 33gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdFVISDHPXBjcv9dU6QID/FFQ69nJPSaa87ARLxaU055/kp5C6weIpEOPeQoaIu9No7iauUpKjrYh1l2WPNpvv/lR29rpFtpuAf+teeAwY
X-Gm-Message-State: AOJu0Yxu708E0NaE35sR1M+dAvdB43LxXY/ct7ZIvoul5A6OB/2LpPam
 tS0jdsqDNy5cr1No00sd7roTMqwfXY1b6jd/dcN+VPIlWADskf9P735BZL2PByIE1SioJuoarHY
 =
X-Google-Smtp-Source: AGHT+IGxeGNhggloJQK2cUIMAhCklOn0C+Qb4Uc7MWV8LYcKtL2B9fDwJqTPnppNsIHjhRnxnQFjuA==
X-Received: by 2002:a05:620a:1a22:b0:795:4c3c:c3be with SMTP id
 af79cd13be357-7954c3cc930mr1377504385a.53.1718124612180; 
 Tue, 11 Jun 2024 09:50:12 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com.
 [209.85.160.180]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7979196fac8sm156241585a.118.2024.06.11.09.50.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 09:50:11 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4405cf01a7fso395281cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 09:50:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUBeQzQVndnifRdC239b4zwgvXraAg5mF9PRvGgChOUQXZNFkKqCnCLVZPoIqhWhYNEyqIOD0V5PgKipX6d6oLEEuR3UuAl5ZpMWJuvgnFv
X-Received: by 2002:a05:622a:5e85:b0:441:4878:1238 with SMTP id
 d75a77b69052e-441487812b8mr3625141cf.8.1718124610639; Tue, 11 Jun 2024
 09:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240422060811.670693-1-xuxinxiong@huaqin.corp-partner.google.com>
 <CAD=FV=WRLLuOkCJeM6RdAb6xLN-cPH+hfWbOv9-LujB-WMGEFw@mail.gmail.com>
 <CAGoogDB-mj8_xu04w3V2ZxOBTWoXcPKrVR1NRt6BFcpjHX3-7Q@mail.gmail.com>
 <CAD=FV=WwsR9e-ZXJRY11FvdUZ66YPy9vqmY_=sGDw5Wqk1eV3w@mail.gmail.com>
 <CAGoogDBCzfKwkAA-VAs3_Cdw_4oFO94mt7yjy47Sp2RAtqtPxA@mail.gmail.com>
 <CAD=FV=WYiD-BUpksBnZrkWvORepZqtaAvm5645X-_oJPea0s0w@mail.gmail.com>
 <CAD=FV=WMC0XZBc3UKP+Qzb5aeiWBnXrYDf31PNP5cGeAT-8XcA@mail.gmail.com>
In-Reply-To: <CAD=FV=WMC0XZBc3UKP+Qzb5aeiWBnXrYDf31PNP5cGeAT-8XcA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 11 Jun 2024 09:49:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ua_CuWsPRMsZZhXF2kFjf6-o=s9zKYq=FC4XHQNL8UqQ@mail.gmail.com>
Message-ID: <CAD=FV=Ua_CuWsPRMsZZhXF2kFjf6-o=s9zKYq=FC4XHQNL8UqQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add panel CSOT MNB601LS1-1
To: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 hsinyi@google.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

Hi,

On Tue, May 28, 2024 at 9:27=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, May 6, 2024 at 8:54=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > Hi,
> >
> > On Tue, Apr 23, 2024 at 6:55=E2=80=AFPM Xuxin Xiong
> > <xuxinxiong@huaqin.corp-partner.google.com> wrote:
> > >
> > > Hi Doug, thank you!
> > > We had reported this info to the CSOT to correct the vendor id.
> > > If they confirm to fix this with the same product ID, we will submit =
a
> > > patch to fix this.
> >
> > FYI, "top posting" like this is generally frowned upon on kernel
> > mailing lists. One such reference about this is [1]. Some folks are
> > very passionate about this topic, so please keep it in mind to avoid
> > upsetting people in the community.
> >
> > In any case: did you get any response from CSOT about the improper EDID=
?
>
> Just following up here. Was there any response from CSOT?

Continuing to follow up here. Did CSOT say anything about this?

-Doug
