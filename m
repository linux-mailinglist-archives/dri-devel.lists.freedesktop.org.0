Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A994B27DB35
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 23:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9957489D64;
	Tue, 29 Sep 2020 21:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E3389D64
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 21:56:30 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id z19so7381045lfr.4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 14:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=36473NzORxqdJM7ltefZiYnrOviszimn5rIn0r27hLU=;
 b=jI3Ib8qhHB1Qk9AlCxGly+d9KjCmEzdYG8fCPqzWdw680U6OmAvFJiu9leN0sPtMjQ
 LPbVas8qbav1BT6g8FdEHrGVx9xYp+iYGA1DkEZ+nssi8LCdOXzi3HgwbOQ5xxKqcM25
 xeGV7Ytkr26WhQjUtphOHAk18jegesuT7ARBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=36473NzORxqdJM7ltefZiYnrOviszimn5rIn0r27hLU=;
 b=r5a/+wORccQfnAVzD4Wom0oAhsbh9l1JUI3Auwr6ptEpR4BEp7RTA4ZHYE4gcpx7C4
 vMi/D7lxXFRTju2yHEcubE7Odz8+XTkAK27EIGUZE5kazQIakPbTzOQZSlCDq5+2r8Nn
 eGbFwdBOJH/AsQWkbZRyyRLsxjNKxNW8zy6pKV1+p+lEWijtwdj295/g2yIKdfbe6zq7
 j00xHmgIoJbuqB/Hf/7je+zbUo2S3+d6xldEuYaC2pKSACJd+H9WNqGp2GxLaeUV4IBH
 c/lcvNAB088rbNJLBuoPGxMSdCBhWkiDvWYkCTb91ahVG6mIBCwqUmNRmn8cJro4qGxO
 /Wvg==
X-Gm-Message-State: AOAM531A/2MqjF9rlwBBjwKkh4d0CO3VNNwmqUrXVmWQvqLEq53tVIev
 ECzPNB1zjuNHfimOAECJMi+o72IHDbR+Ew==
X-Google-Smtp-Source: ABdhPJyAS0XvkstdEeC+cqAPbqbq0lgfigLuNyvg1IAXC9TmWgiqa/s0KNfRJBmDtfzxC/+jafLuxQ==
X-Received: by 2002:a19:ca1e:: with SMTP id a30mr1821353lfg.575.1601416589197; 
 Tue, 29 Sep 2020 14:56:29 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170])
 by smtp.gmail.com with ESMTPSA id r28sm477247ljn.76.2020.09.29.14.56.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2020 14:56:28 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id s205so5296784lja.7
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 14:56:28 -0700 (PDT)
X-Received: by 2002:a2e:6f0d:: with SMTP id k13mr1684118ljc.250.1601416588146; 
 Tue, 29 Sep 2020 14:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200924003214.662-1-gurchetansingh@chromium.org>
 <20200929093252.kpdrfv77knouaj7p@sirius.home.kraxel.org>
In-Reply-To: <20200929093252.kpdrfv77knouaj7p@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 29 Sep 2020 14:56:15 -0700
X-Gmail-Original-Message-ID: <CAAfnVB=-x+vr14Vbah-X94pfSwVwzBtfP_F869of0Mi3hjkwwA@mail.gmail.com>
Message-ID: <CAAfnVB=-x+vr14Vbah-X94pfSwVwzBtfP_F869of0Mi3hjkwwA@mail.gmail.com>
Subject: Re: [PATCH v4 01/19] drm/virtio: blob prep: refactor getting pages
 and attaching backing
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0267941009=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0267941009==
Content-Type: multipart/alternative; boundary="000000000000e00c4105b07ada32"

--000000000000e00c4105b07ada32
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 29, 2020 at 2:33 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Wed, Sep 23, 2020 at 05:31:56PM -0700, Gurchetan Singh wrote:
> > Useful for upcoming blob resources.
>
> Pushed to drm-misc-next (whole series).
>

Thanks -- sent over a 32-bit/64-bit bug fix and requested a virtio-spec
vote.


>
> thanks,
>   Gerd
>
>

--000000000000e00c4105b07ada32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 29, 2020 at 2:33 AM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, =
Sep 23, 2020 at 05:31:56PM -0700, Gurchetan Singh wrote:<br>
&gt; Useful for upcoming blob resources.<br>
<br>
Pushed to drm-misc-next (whole series).<br></blockquote><div><br></div><div=
>Thanks -- sent over a 32-bit/64-bit bug fix and requested a virtio-spec vo=
te.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
thanks,<br>
=C2=A0 Gerd<br>
<br>
</blockquote></div></div>

--000000000000e00c4105b07ada32--

--===============0267941009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0267941009==--
