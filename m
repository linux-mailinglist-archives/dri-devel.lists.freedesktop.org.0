Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB419FCEE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B638992E;
	Wed, 28 Aug 2019 08:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E069C89950
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 15:25:57 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id i4so21641452qtj.8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 08:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version;
 bh=UYsPsgGfUckufMeEUec2JwS26x9RnxC68LqfuMsCJb4=;
 b=r9Sv5NK/71Vang2zJQEmg1x5KJIAyJmgFKsWXQMl6mXk8fK845JSLAO60jDJMmH1lK
 fOACPg7BumCE9g5qQxoSVqKXFLrkxvsQz+YV1w3wi10mwxzu6j2n6LFtjh8waVvNEdnz
 8MRBYaZurDgobSCCs7UwHQZc9oxKeHD+FmxD2SFLfv3enLYeHh4s9IevjvHhT2zX8EOo
 DAJSqxy1P0H09Mf8Z7Q9OqgHIODxB/MFvlsS3AAUPBDZ9xKwkv7OYussREkk/ygBogli
 HguGN5MasiU+K1as508RV+nBnRldW1OYWZpAWtVd/KJrgcQeUqWO/vzkK9ek5VsdOwVV
 p5Kw==
X-Gm-Message-State: APjAAAXFhXeBKdUpjMYVXa7K/Ts1l+Qz6mEn8xpo5rQFnTIvixKMa8c+
 oYEBB4PWHG1waZZTPfaIlDicQA==
X-Google-Smtp-Source: APXvYqyz2z2LwgJPPM/lvqPrfZk6dZuilv+UvVvnsCTjgYLjcKlMdJnfhv4XQUcExaXeKHLvVSiVZw==
X-Received: by 2002:ac8:7b2a:: with SMTP id l10mr624196qtu.115.1566919557007; 
 Tue, 27 Aug 2019 08:25:57 -0700 (PDT)
Received: from tpx230-nicolas (modemcable154.55-37-24.static.videotron.ca.
 [24.37.55.154])
 by smtp.gmail.com with ESMTPSA id p201sm7988339qke.6.2019.08.27.08.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 08:25:55 -0700 (PDT)
Message-ID: <ed170df34f3dadc941f509a84730fe94d7c6a3a4.camel@ndufresne.ca>
Subject: Re: [PATCH 6/7] misc: bcm-vk: add Broadcom Valkyrie driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Arnd Bergmann <arnd@arndb.de>, Scott Branden <scott.branden@broadcom.com>
Date: Tue, 27 Aug 2019 11:25:53 -0400
In-Reply-To: <CAK8P3a1WBkmXbJx=rZMumxn7EN4bmA1AdZEgrWBVyQ3XNngU6Q@mail.gmail.com>
References: <20190822192451.5983-1-scott.branden@broadcom.com>
 <20190822192451.5983-7-scott.branden@broadcom.com>
 <CAK8P3a1WBkmXbJx=rZMumxn7EN4bmA1AdZEgrWBVyQ3XNngU6Q@mail.gmail.com>
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 28 Aug 2019 08:28:09 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version;
 bh=UYsPsgGfUckufMeEUec2JwS26x9RnxC68LqfuMsCJb4=;
 b=Q1NhQkKVxAJlcKICo7k5uO5wNqrqJBvNZeECLILQCFrPYYBxQy90++0mMzPVwDn4S8
 TpWXTq7/bbzvvgU9XibqgTuSn9KYLWVYUi1wr9wQPm0n9tinq18kYuBsi9mSXbnjVrPJ
 LI569nCbjvqAHQkLM+ORs/6pREwitnixakqmoxua+Bv9X29ughQwtfmxM2n/Ma4L3FlZ
 2gjAgAiF2FJcNrKH4g6grpJB8XVrqdboghb2Lp7XhhnM/FOMqhACKeZyzu+PJMkQwCOg
 dU4mOurRaiSuhta9WPdCrG3SSlUO0bBwb96IjQIJajtvjgjxfd4voZ23uY9kZi8KwooA
 lKXw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Brown <david.brown@linaro.org>, "open
 list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, James Hu <james.hu@broadcom.com>,
 BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
 Desmond Yan <desmond.yan@broadcom.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, linux-arm-msm@vger.kernel.org,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: multipart/mixed; boundary="===============0122263285=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0122263285==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-Q6lkT7+PAzBRKQ8Zlvb3"


--=-Q6lkT7+PAzBRKQ8Zlvb3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 ao=C3=BBt 2019 =C3=A0 16:14 +0200, Arnd Bergmann a =C3=A9crit :
> On Thu, Aug 22, 2019 at 9:25 PM Scott Branden
> <scott.branden@broadcom.com> wrote:
> > Add Broadcom Valkyrie driver offload engine.
> > This driver interfaces to the Valkyrie PCIe offload engine to perform
> > should offload functions as video transcoding on multiple streams
> > in parallel.  Valkyrie device is booted from files loaded using
> > request_firmware_into_buf mechanism.  After booted card status is updat=
ed
> > and messages can then be sent to the card.
> > Such messages contain scatter gather list of addresses
> > to pull data from the host to perform operations on.
> >=20
> > Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> > Signed-off-by: Desmond Yan <desmond.yan@broadcom.com>
> > Signed-off-by: James Hu <james.hu@broadcom.com>
>=20
> Can you explain the decision to make this is a standalone misc driver
> rather than hooking into the existing framework in drivers/media?
>=20
> There is an existing interface that looks like it could fit the hardware
> in include/media/v4l2-mem2mem.h. Have you considered using that?
>=20
> There is also support for video transcoding using GPUs in
> driver/gpu/drm/, that could also be used in theory, though it sounds
> like a less optimal fit.

I believe that a major obstacle with this driver is usability. Even
though I have read through, I believe it's just impossible for anyone
to actually write Open Source userspace for it. The commit message does
not even try to help in this regard.

Note that depending on the feature your transcoder has, there is also
the option to model it around the media controller. That is notably
useful for certain transcoders that will also do scaling and produce
multiple streams (for adaptive streaming usecases were you want to
share a single decoder).

An 1 to 1 transcoder modeled around m2m would eventually required
documentation so that other transcoder can be implemented in a way that
they would share the same userspace. This is currently being worked on
for m2m encoder and decoders (including state-less variants).

regards,
Nicolas



--=-Q6lkT7+PAzBRKQ8Zlvb3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXWVLgQAKCRBxUwItrAao
HOWtAJ9PEGIeS4lUvTlk5tzICIY0ocFUrgCfZ7hh+138dIIu9Aq/IBhBjjcgRwg=
=7DWJ
-----END PGP SIGNATURE-----

--=-Q6lkT7+PAzBRKQ8Zlvb3--


--===============0122263285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0122263285==--

