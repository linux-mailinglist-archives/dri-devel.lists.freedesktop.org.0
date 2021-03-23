Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA1A345BD4
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 11:23:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BA46E896;
	Tue, 23 Mar 2021 10:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842236E896
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 10:23:34 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id kt15so16680909ejb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 03:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HNnaCAjmXDBFveZGtI9mXBcylAwvRGa/IpIIAh5IsGg=;
 b=Eh400LyV8Al/3xnhtK+/LuEpxnjK0ciJ0aPNZ4yJkCM1JgQ1AQyaGbcqhhzYZY8BB5
 UKQy2f1//ygQ7Zz/enFivmAGEKEUeD547O6n05M29fKkREwHDAdXPkFD1jhE9DpC+O0F
 oEqSjIGCvS1kf61Ww3nNa1CZdnYDkOCdIiyi9qS+ICF8GXeOEPpobv0rKYp/pq18i28W
 TYWEMS3tD0fCxVrvbYDRE2PGcG66UULiwEKPDKyiFvwRrYwTLoVeVX+xtCyO1XmRBlzE
 w34N5S/nU2UMOL92kst9Kvp+2u3v5L+r2ExsaxWu64VLg5H1n/t6ZEg07QNchg0bs5uM
 zuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HNnaCAjmXDBFveZGtI9mXBcylAwvRGa/IpIIAh5IsGg=;
 b=pzMsz12tql0LmrL/62b96mgeENwBlats+QVNRIbYw72yBs5sA5JP3D+DoG7nt3AN/2
 +p6JdW9k2grVC7blBNxnlaYtfUSGY0Bv7eD7i0ne77LrsU+3AyYu0zFWqCDIVugr2+Vt
 qvn56byyGc5MYUKYT1VnCDuKVLlfeIKxBSnacCGKEJSBe5ovUMNa134d4lLtUCPaf5RB
 r1VJG+946k6mkCHO8cg6rZFbqOUqCQCePeJK49B5ojB/vz4WlzfVGBqZro7Wy5nqbtWW
 nu/yjiio8Dm3E/BkJiEocGP0wpWj/QcUnDiQfdgAmfuo4l4lzebwsogUzih8s/zy/Xi7
 qfdg==
X-Gm-Message-State: AOAM532LFZwHrafD1eHxjG0lAeu/2FyOZcXxm9C8PZO0xfAacvtb7Mw2
 DsPjEmhWUZ6waHp/4RJzUbY=
X-Google-Smtp-Source: ABdhPJypvVpE9XhkeJkF+6AyHrxjM1YG4YyDb2PF1gc1Pp2bzhBEzUJalFaSfx7nlQXEqqJpCRtZdA==
X-Received: by 2002:a17:906:1c98:: with SMTP id
 g24mr4205649ejh.51.1616495013207; 
 Tue, 23 Mar 2021 03:23:33 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id ha5sm10817534ejb.39.2021.03.23.03.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 03:23:27 -0700 (PDT)
Date: Tue, 23 Mar 2021 11:23:47 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH v5 04/21] gpu: host1x: Remove cancelled waiters immediately
Message-ID: <YFnBs4O0V4ynnf79@orome.fritz.box>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-5-mperttunen@nvidia.com>
 <1c2c4a31-68a2-c938-fe65-6059d9889126@gmail.com>
 <1f98ce42-dc6b-299c-f55e-f6dd87b99cab@kapsi.fi>
MIME-Version: 1.0
In-Reply-To: <1f98ce42-dc6b-299c-f55e-f6dd87b99cab@kapsi.fi>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: multipart/mixed; boundary="===============1475458259=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1475458259==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VWm2//u8N7to5iZc"
Content-Disposition: inline


--VWm2//u8N7to5iZc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2021 at 12:20:38AM +0200, Mikko Perttunen wrote:
> On 1/13/21 12:07 AM, Dmitry Osipenko wrote:
> > 11.01.2021 16:00, Mikko Perttunen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > -void host1x_intr_put_ref(struct host1x *host, unsigned int id, void =
*ref)
> > > +void host1x_intr_put_ref(struct host1x *host, unsigned int id, void =
*ref,
> > > +			 bool flush)
> > >   {
> > >   	struct host1x_waitlist *waiter =3D ref;
> > >   	struct host1x_syncpt *syncpt;
> > > -	while (atomic_cmpxchg(&waiter->state, WLS_PENDING, WLS_CANCELLED) =
=3D=3D
> > > -	       WLS_REMOVED)
> > > -		schedule();
> > > +	atomic_cmpxchg(&waiter->state, WLS_PENDING, WLS_CANCELLED);
> > >   	syncpt =3D host->syncpt + id;
> > > -	(void)process_wait_list(host, syncpt,
> > > -				host1x_syncpt_load(host->syncpt + id));
> > > +
> > > +	spin_lock(&syncpt->intr.lock);
> > > +	if (atomic_cmpxchg(&waiter->state, WLS_CANCELLED, WLS_HANDLED) =3D=
=3D
> > > +	    WLS_CANCELLED) {
> > > +		list_del(&waiter->list);
> > > +		kref_put(&waiter->refcount, waiter_release);
> > > +	}
> > > +	spin_unlock(&syncpt->intr.lock);
> > > +
> > > +	if (flush) {
> > > +		/* Wait until any concurrently executing handler has finished. */
> > > +		while (atomic_read(&waiter->state) !=3D WLS_HANDLED)
> > > +			cpu_relax();
> > > +	}
> >=20
> > A busy-loop shouldn't be used in kernel unless there is a very good
> > reason. The wait_event() should be used instead.
> >=20
> > But please don't hurry to update this patch, we may need or want to
> > retire the host1x-waiter and then these all waiter-related patches won't
> > be needed.
> >=20
>=20
> Yes, we should improve the intr code to remove all this complexity. But
> let's merge this first to get a functional baseline and do larger design
> changes in follow-up patches.

I agree, there's no reason to hold back any interim improvements. But I
do agree with Dmitry's argument about the busy loop. Prior to this, the
code used schedule() to let the CPU run other code while waiting for the
waiter to change state. Is there any reason why we can't keep schedule()
here?

Thierry

--VWm2//u8N7to5iZc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBZwbMACgkQ3SOs138+
s6FYKxAAilwe66XMDrPimmJTC9lDugNdnbWI6+RFcP7/C3P4oqI1UmJWeR4WVPYS
GRUhN6dPG9VHQMUpQ+0MhPAIhoRdHw9JjGKVCNWdUAuj5pYCjbjt560vNYfILJIt
AKNe+Orn4ZP1dlbkelV0cniUn8QyGZLUnyHqdNIqPBTYQA/7XcraV3+ppnfb4otK
hSI/Z2GMVbtmTbefhcStcTOjt26GSet8FtLN4mqu2IvlDDeiqQutR3gRL/QVy3Kp
ST3oyZn/IXmML4PogS5PnEjTC7eOfoAq42Xb1opLLT83ztVA5v8rITvs53Q9dstU
G/WNrpNp/zDJAWMhvcUwnCdUSa+gxpKrVPEWtwjIti6/UWsBeHLrEuMsZXd95Utv
md1qdykZaGTKWcQbXHsFfMuRdnB5dM1DTh8b+BsTyu+CFWFMwSsJFld37rb5zekg
REY2lNgFzzflImzdRW+kFw4P+ievcnftzTIWVvowvplBy+k2hrJgp+1fQgzKvbBO
1e5w3+MdQvEIYdmPLXgSjGsXHwQIP3VHCrZk962mvHlp7j5T4l7KEsyTG3KHlZ2M
HcQnKoHzg8b76koS6jy5oSiL9ryCtl2dl1iCTtwMblRVor+slLH8kPYgeHlzmz5e
EmWwwTIyJ5s45TU/L/amhKHzTxjyTM2TSB2R8tJsb1E31WMCMvE=
=9V/0
-----END PGP SIGNATURE-----

--VWm2//u8N7to5iZc--

--===============1475458259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1475458259==--
