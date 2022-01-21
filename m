Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A02495784
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 02:00:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7164F10E592;
	Fri, 21 Jan 2022 01:00:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6DE10E40D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 01:00:51 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id f21so36040977eds.11
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 17:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qvrcavduwvJQ107/U7y4f2WAZMKBIw7TGMDOsClD2es=;
 b=o5MgGa3IEPcw+i/fK2gpC1VcpHWGdOhAFpJEoEpIFVh2R0KFtNO7tVgfDQh2E9jJh+
 P/V8IoKvHwAUHt0eWRB89CdPa2izOoGnJCXk9T7Itbzqy8I2eq6xAPugzd4r6vOE9LV7
 ng+32CXwoDZPW2/NM5fnD69OPwxgsm5qq9Ed6h6gMqSycdga8zt00yTmY2wuj85LzWCt
 1BvNMfS2R5mQIrZudB/yFZC5XvgYqeMz8c6KnRNwTzIs2Hdfi/HekylYDM+i3q6cYfoF
 Tl6oLDM0wYrdx/L6aGIDZIZgGTi2uKPqMI5yBge7G+p1PuKFQaQp3dkI3rdSEPqluhn0
 i7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qvrcavduwvJQ107/U7y4f2WAZMKBIw7TGMDOsClD2es=;
 b=fEkPr4ZIc1zk1cQR2j+hligNt5515RF5Nr9wjFBB7wO1jj33l8kfmaxcMyBsztdUqw
 +W3IO3+jfq1WdAMU32MGp9BxPK3gZl9mmlPtuXOCL4ZHMPnBLqrliDCdTuw7ArskNgU1
 Fk6k2RtGB5PPh8EkOOKpvVKtMySuZpz1tBjocMIyKlR4M1sBvH0xWcVWYiMChOHZZMZ0
 kQeEJJX38KmqrGA1I+JZbRQDyXSCfGmCBDILpmBIoq+5A7nCowrHNWGvyglO06JlCrYb
 sRp0b27CTXjNKOe6XRO7AtoSewykSrGWi946/EIpbDHe58kBEWclbx2ry2lyqxf6vAPs
 9T6Q==
X-Gm-Message-State: AOAM532gD763tL3letxBjFaIyW2G/mioTXylJ9lRFfFKCy+YZHXHh4ow
 vPzdW6Af0g+kaU7NqFO5GvnB2m4pMbDd9MbugnVOcQ==
X-Google-Smtp-Source: ABdhPJybSFC7dbhNUzL7HJOrA6Rwh39AsAtnRqH3dM9c8VcGcj4oZT9LuhMAquJMwUZFq/xrv1cCl1cLEeAnjvwIF2c=
X-Received: by 2002:a05:6402:1693:: with SMTP id
 a19mr1850592edv.247.1642726850236; 
 Thu, 20 Jan 2022 17:00:50 -0800 (PST)
MIME-Version: 1.0
References: <20220117232259.180459-1-michal.winiarski@intel.com>
 <20220117232259.180459-7-michal.winiarski@intel.com>
 <CAGS_qxo+Jeuoo7QQnEW883bT5z3HJqz2sCX=kzhra3UsEM9xOQ@mail.gmail.com>
 <22c46f5f-37c8-448a-6fff-2b0ec9d28fa9@intel.com>
In-Reply-To: <22c46f5f-37c8-448a-6fff-2b0ec9d28fa9@intel.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Thu, 20 Jan 2022 17:00:39 -0800
Message-ID: <CAGS_qxpt3uH4D=3pEa2pBcTr5UqtHbTGPEDFW67=6b2jrumvvQ@mail.gmail.com>
Subject: Re: [RFC 06/10] drm: test-drm_dp_mst_helper: Convert to KUnit
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
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
Cc: linux-kselftest@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Brendan Higgins <brendanhiggins@google.com>,
 dri-devel@lists.freedesktop.org, Arkadiusz Hiler <arek@hiler.eu>,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 20, 2022 at 4:49 PM Micha=C5=82 Winiarski
<michal.winiarski@intel.com> wrote:
> > Tangent:
> > It might have been easier to do that if the kunit assertions returned p=
ass/fail.
> > E.g. instead of having to do
> >
> > if (!<long-condition>) {
> >    KUNIT_FAIL("<long-condition> not met");
> >    return;
> > }
> >
> > if we could do
> >
> > if(!KUNIT_EXPECT_TRUE(long-condition))
> >    return;
> >
> > or if there was a new macro type
> >
> > KUNIT_EXPECT_RET_TRUE(long-condition); // like ASSERT, but just return
> > from this func on failure
>
> This would simplify a bunch of other tests as well.
> On the other hand - EXPECT_TRUE returning a value is not something I
> would expect :)

Yeah.
It felt painful to type that out :)

But I felt the same need when looking at converting some other selftests ov=
er.
It definitely feels like there's room to make these sorts of helper
functions better.

KTF solved these by allowing asserts to `goto` or `break`, e.g.
https://github.com/oracle/ktf/blob/63c19dead80de9cd654b08120d28a04f24174f4b=
/kernel/ktf.h#L560

I had floated the idea of KUnit having a
KUNIT_ASSERT_GOTO/KUNIT_ASSERT_RET (return)
macro, but these would add yet another dimension to the macros (EXPECT
vs ASSERT, _MSG vs no _MSG).

But I have some patches out that delete hundreds of lines from the
assert macros along with some others I haven't sent out publicly yet.
Maybe such a thing would be more palatable after those land?

But for now, I think they can either just print enough debug info so
that the failures are obvious (like this does), or they can use
kunit_err() to print out additional info (like you do in other patches
in this series).

>
> Thanks!
> -Micha=C5=82
