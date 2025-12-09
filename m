Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E8ACAEDC2
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 05:23:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBCB10E1AE;
	Tue,  9 Dec 2025 04:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ba5XdOFK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CDA810E1AE
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 04:23:14 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5957db5bdedso6384717e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 20:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765254192; x=1765858992; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xidum6Ax5Dt0//wps6VgEDCvik6XGzu3SF8WxrOIsrk=;
 b=ba5XdOFKkGnqjTDscYafGLAEYZ0MY3fXkPcMZhZSm8wrW7ruOJ3r+/r28He+5ykJd4
 zqxHPeOLWyywokEnkB8xpouqhxRGRb8lhdeYEV6rbvwakzQGWX+3xauOlke+55MB8lyr
 oZCbnKaFAdEuwpH4sjBSxNjRO34L37HQ8cc/MaAlu0j06PlWTj9z4Z+fDNIM0mkJaXb5
 H+x3EtVmyjvBRKQZQ+bh4VRGyKfzpGdBmuczw2TOMT+1sXbK77MnMlNjEkHzq/viVih6
 qzloUtxPO61SMvPhyh2OkHWuYbSiYHG1ZPPtvi2FW1bVOJGLJbShOLq43+82D5PijpPW
 mNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765254192; x=1765858992;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xidum6Ax5Dt0//wps6VgEDCvik6XGzu3SF8WxrOIsrk=;
 b=rdRkxubA7w7D97/GklGVONEtKAz7w66MveuRkiFVTxF1BtkP0AU4UB7lon1zSQc5gL
 dclAY4xxVCQEBAva6qYW1FlODdoUe9C/NQa80l0VGbwu+ILB2EJyHPHJv+Kbuql7Q39B
 hn5SI15kvVyZM0i29ZoQRoqHWsCPaFZw4zwJmpcNRrg2eiCaQ9ozUyXQzx47lKHZTz6u
 9G9/n7vzZIyaJQ3MRuNX6cnl5TUYyjEnEHAqXurXBYQ9AzcG5h/veMtTdq+a7xppq3lw
 4u248pFFSQmjXTOTFLvz1FtQ3niqJ2751dmbT3uovnbgBa9u5wA/kk9j+/dKyGnaAko0
 F92Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHQIzTmUnEI736n7ugM0fxzWmj8o4fe51jqq4NzLj7MIr06S3qu9gdBWcVdAtS+Prc2qfPmB/WhOY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxh/d79cH7xR7TJByYRhqCp+pJXHAjDbydelE6Sn8rbWHVfuhpg
 DJAuA7zHpq6EBMDyR8tIm17ZLh2BRcmdWoaG1a5J/EQiM6L21XYoOJl9HNUI8AVs7FDvFj148WT
 gDQL8lJe6xDs9aMeu2TMvUBER1ImfvLQ=
X-Gm-Gg: ASbGncssw5mRZrt5jAHqSZspbQOgznUC4tkUEHxeoOTXoA1nmf19j/AFW8WJHVcOXB/
 9Uu5mWlNKfXD7m+z9KMWGoFmHyyXrexz4DpCDG1Zvx5tzNpa9m1DnF2OwzSK7uUVPIYkPylYh42
 oZo/xyBaMhJV1oeQwrfdY8gMv4SJGYE1SaU5cSPhfWBzhBrPD8R4y9fOu2f+6cDgUVDh3QVslYw
 5YQXyIOj2jxfcEd8rkGkZlqiOqwZlGEWo6Ym45TKyvpNrokKVanC/9zNkGSfhH/i6sNpTM=
X-Google-Smtp-Source: AGHT+IFBCioYeN6sYXPWCKblrghcpnAhZODyEAkggpUZZxCCmgnDzmxZVGfICMVC50kni0lsvTcYWEicDD3bxlITNa4=
X-Received: by 2002:a05:6512:3ca4:b0:592:f115:292d with SMTP id
 2adb3069b0e04-5987e88da5amr3420881e87.6.1765254192213; Mon, 08 Dec 2025
 20:23:12 -0800 (PST)
MIME-Version: 1.0
References: <20251101-tegra-drm-cmu-v1-1-211799755ab8@gmail.com>
 <pedxgtvzfrfzihoshhfvntin3hwwi3znleilbz4abjad74nowb@un33lgiaa26z>
 <CALHNRZ9-XrMUkQE0cwjq-HUYsy5uerhOQ9sNpirp23kKoaPuYw@mail.gmail.com>
 <72llskwvuwyllvz24zoex4ad6v6t5skiehmwylj7exoh7bmzjo@xq3v7vja5w62>
 <CALHNRZ_k6e9ZRmpK6Pzpet=RzUQ0fRYmfnea6U+9E2oZc8=z7w@mail.gmail.com>
 <eac10a43-5164-4ecf-8b56-6099e69001bc@gmail.com>
In-Reply-To: <eac10a43-5164-4ecf-8b56-6099e69001bc@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 8 Dec 2025 22:23:01 -0600
X-Gm-Features: AQt7F2pF_-pQQg5fEIgQmcZxfxWQsfQP15gdzBUZUGGjmEBsB58G_YNRaH-Evns
Message-ID: <CALHNRZ9b98Su9qAqXRSTCStoUPtC_u3+MG0cr4SQ-g3aVJD7LQ@mail.gmail.com>
Subject: Re: [PATCH] drm/tegra: Enable cmu for Tegra186 and Tegra194
To: Jasper Korten <jja2000@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, Nov 5, 2025 at 3:28=E2=80=AFPM Jasper Korten <jja2000@gmail.com> wr=
ote:
>
> Hi all,
>
> On 11/4/25 19:12, Aaron Kling wrote:
> > On Tue, Nov 4, 2025 at 3:14=E2=80=AFAM Thierry Reding <thierry.reding@g=
mail.com> wrote:
> >> On Mon, Nov 03, 2025 at 12:39:57PM -0600, Aaron Kling wrote:
> >>> On Mon, Nov 3, 2025 at 5:54=E2=80=AFAM Thierry Reding <thierry.reding=
@gmail.com> wrote:
> >>>> On Sat, Nov 01, 2025 at 06:15:17PM -0500, Aaron Kling via B4 Relay w=
rote:
> >>>>> From: Aaron Kling <webgeek1234@gmail.com>
> >>>>>
> >>>>> Without the cmu, nvdisplay will display colors that are notably dar=
ker
> >>>>> than intended. The vendor bootloader and the downstream display dri=
ver
> >>>>> enable the cmu and sets a sRGB table. Loading that table here resul=
ts in
> >>>>> the intended colors.
> >>>>>
> >>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> >>>>> ---
> >>>>>   drivers/gpu/drm/tegra/dc.h  |  13 +++
> >>>>>   drivers/gpu/drm/tegra/sor.c | 206 +++++++++++++++++++++++++++++++=
+++++++++++++
> >>>>>   2 files changed, 219 insertions(+)
> >>>> What does "darker than intended" mean? Who defines the intention? Ho=
w do
> >>>> we know what the intention is? What this patch ultimately seems to b=
e
> >>>> doing is define sRGB to be the default colorspace. Is that always th=
e
> >>>> right default choice? What if people want to specify a different
> >>>> colorspace?
> >>> I reported this issue almost a month ago. See kernel lore [0] and
> >>> freedesktop issue [1]. The pictures in the latter show what nvdisplay
> >>> looks like right now. It's nigh unusably dark. When booted into
> >>> Android with a tv launcher that has a black background, as is default
> >>> for LineageOS, it is really hard to read anything. Is it correct as a
> >>> default? Well, cboot hardcodes this, so... presumably? It would be
> >>> more ideal to expose this and csc to userspace, but I'm not sure if
> >>> drm has a standardized interface for that or if tegra would have to
> >>> make something vendor specific. I think that would be a separate
> >>> change concept compared to setting this default, though.
> >> The reason I'm asking is because I don't recall ever seeing "broken"
> >> colors like you do. So I suspect that this may also be related to what
> >> display is connected, or the mode that we're setting.
> I have tried it on both a MacroSilicon HDMI capture card and an Arzopa
> Z1FC 1080p portable monitor and run into the same darker colors. Both
> have in common that they use HDMI which seems to line up with what Aaron
> is reporting. I do not have an eDP display to test or another carrier
> board with a different display out to test.
> >> It could perhaps
> >> also be related to what infoframes we're sending and how these are
> >> supported/interpreted by the attached display.
> >>
> >> All of that is to say that maybe this looks broken on the particular
> >> setup that you have but may works fine on other setups. Changing the
> >> default may fix your setup and break others.
> > Do you have a device set up so you can check? Or does the regression
> > test bench have a display that can be forwarded?
> >
> > My current setup is a rack of units plugged via hdmi to a kvm which is
> > then plugged to a pikvm. I also observed this issue before I had this
> > setup, plugged directly to a 1080p monitor. I have not checked
> > displayport. I can cycle through a couple other displays without this
> > patch to see if I get any other result. I am fairly certain I have
> > consistently seen this issue since I started trying to work with
> > tegra-drm on kernel 6.1 or maybe even 5.15. I've never seen it work to
> > allow for a bisect.
> >
> > I am in contact with one other person with a tx2 devkit, who
> > replicated the issue when I asked. Who plans to reply to this thread
> > with setup info later.
>
> For reference, I am said person. I have a Jetson TX2 Devkit that uses
> the P2771 Device Tree. I'm running a Fedora distrokernel with no
> additional patches applied by myself. I have personally noticed the
> issue to at least be present on 6.14.5 and 6.17.4.
>
>
> I'm currently not at home to take screenshots with and without the
> submitted patch, but will be able to do it tomorrownight or friday.

Any further thoughts from the maintainers on this patch? As far as I
know, this is an issue for all users, at the very least on hdmi.

Aaron
