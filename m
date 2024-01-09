Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04939828356
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 10:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E4C10E38E;
	Tue,  9 Jan 2024 09:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD3710E38E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 09:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704793082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qYAn+Ts4Fmm6VQY+r54s1ckSg4+A/PPrtRXbVyzS4H4=;
 b=OlBmfIFjapYT/efaMFzQlp7DKSIiypmc2MM/OA6OVIoNUBF9bZpOQv/9f5k2HbMgii3x6z
 /o/sjEF5XW0mZIvgP35H4+IrjBpkvtSkorIV67ien9ZR8TpFCDd0BUc3ZCGsVUooUMJ0gk
 AKD4eZevzWb9Wb7VHlycw34W3Yn/DRc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-7pEUS424NkipscX4XypR_w-1; Tue, 09 Jan 2024 04:38:01 -0500
X-MC-Unique: 7pEUS424NkipscX4XypR_w-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4299dfcdc0fso2391111cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 01:38:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704793080; x=1705397880;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ky5q4Lye4xDM1EU7ISSxxpSTjWDC6pdqfZjOsW+ZzgY=;
 b=g6ukwO2TL+HJAxBRGeJ3WOHshNcYOo/PzZ+OcH/wcorpq6+06NarlF9u8pmcSJHKKa
 whBX5Gq71VY8HFpFAR0yyhb0WMW0V4fPNJwpruSnNGTSZ6jHovLJOpSwQYlaXmlwA/Qh
 923IjOh34D56ZqqPo8AidB4uN1jVD9hVq6EAepw2u7YYYOMbAJRNFgQToK3+RLRlNsoM
 +0DtZSWSmbZ+swrcfogVr0ErKc2YCETTz0lGhyLc+LM6acTK6n7qox23eYQPuLexhGtu
 wwQKmpqYA74zSejY1POVWqw1Ef273vhv9TE6fyvBMNG9a8Bck4PYp7U5MalA3LXr8yqP
 OD9Q==
X-Gm-Message-State: AOJu0Yy6IlQ7dKfihV7fCAZbviw8akIsLZE5tvqZXmEvNGq8OwiJgw58
 RDGkXsCx80s7dsskS+Bfe0yVl2j3smC3nIvgFG1GLqmjXjFs+BmcHLStb8ovpZ4ViZKY3ET//wC
 mghd7HraZX6jYna40k5A1HaZ63Kl7qQrDqWHS
X-Received: by 2002:ac8:7e96:0:b0:429:7bf4:f6df with SMTP id
 w22-20020ac87e96000000b004297bf4f6dfmr11145554qtj.4.1704793080540; 
 Tue, 09 Jan 2024 01:38:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7DZjLgo1mS+4fbiobPrucDM8xf3Zq3INpPYhYQwz3yTpWNUvJ5BzG6Y3jQpGhehseYzzM4w==
X-Received: by 2002:ac8:7e96:0:b0:429:7bf4:f6df with SMTP id
 w22-20020ac87e96000000b004297bf4f6dfmr11145547qtj.4.1704793080276; 
 Tue, 09 Jan 2024 01:38:00 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 g8-20020ac84808000000b0042987870887sm708466qtq.10.2024.01.09.01.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 01:38:00 -0800 (PST)
Message-ID: <da747c7ca3424cfa5a0d7ecf1733dc1a7303a9ee.camel@redhat.com>
Subject: Re: [PATCH v2 1/2] platform_device: add devres function region-reqs
From: Philipp Stanner <pstanner@redhat.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Tue, 09 Jan 2024 10:37:56 +0100
In-Reply-To: <ixywpvuwlhdpv6szvssipy2ygjhzdvt6nrbcppy4yx5ix5b3is@pq7s6hpse2ni>
References: <20240108092042.16949-2-pstanner@redhat.com>
 <20240108092042.16949-3-pstanner@redhat.com>
 <hywkbwwwkddbd5vye366bhz64dlpet4chv3kzwfu5dx6rvvix6@2jnk3xx6vfiy>
 <404aea6b7bb7874064153044f04f3b8f6fccb97b.camel@redhat.com>
 <ixywpvuwlhdpv6szvssipy2ygjhzdvt6nrbcppy4yx5ix5b3is@pq7s6hpse2ni>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, David Gow <davidgow@google.com>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yo!

On Mon, 2024-01-08 at 12:46 +0100, Uwe Kleine-K=C3=B6nig wrote:
> On Mon, Jan 08, 2024 at 10:45:31AM +0100, Philipp Stanner wrote:
> > On Mon, 2024-01-08 at 10:37 +0100, Uwe Kleine-K=C3=B6nig wrote:
> > > Other than that I indifferent if this is a good idea. There are
> > > so many
> > > helpers around these functions ...
> >=20
> > Around which, the devres functions in general? There are, but
> > that's
> > kind of the point, unless we'd want everyone to call into the
> > lowest
> > level region-request functions with their own devres callbacks.
> >=20
> > In any case: What would your suggestion be, should parties who
> > can't
> > (without restructuring very large parts of their code) ioremap()
> > and
> > request() simultaneously just not use devres? See my patch #2
> > Or is there another way to reach that goal that I'm not aware of?
>=20
> This wasn't a constructive feedback unfortunately and more a feeling
> than a measurable criticism. To actually improve the state, maybe
> first
> check what helpers are actually there, how they are used and if they
> are
> suitable to what they are used for.
>=20
> Having many helpers is a hint that the usage is complicated. Is that
> because the situation is complicated, or is this just a big pile of
> inconsistency that can be simplified and consolidated?

I thought about that and tend to believe that you are right in this
case. The reason being that there'd be very few callers to such a
wrapper.
We have the functions for doing pure requests and pure ioremaps, so
that should be sufficient.

I think we can do sth like this in the rare cases where someone needs
to request without (immediately) mapping:


struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
{
=09struct platform_device *pdev =3D to_platform_device(dev);
=09int ret;
=09struct resource *res;
=09struct dcss_dev *dcss;
=09const struct dcss_type_data *devtype;
=09resource_size_t res_len;

=09devtype =3D of_device_get_match_data(dev);
=09if (!devtype) {
=09=09dev_err(dev, "no device match found\n");
=09=09return ERR_PTR(-ENODEV);
=09}

=09res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
=09if (!res) {
=09=09dev_err(dev, "cannot get memory resource\n");
=09=09return ERR_PTR(-EINVAL);
=09}

=09res_len =3D res->end - res->start;
=09if (!devm_request_mem_region(pdev->dev, res->start, res_len, "dcss")) {
=09=09dev_err(dev, "cannot request memory region\n");
=09=09return ERR_PTR(-EBUSY);
=09}


And then do the associated devm_ioremap()s where they're needed.


So I'd 'close' this patch series and handle it entirely through my dcss
patch-series.

Thx for the feedback

P.


>=20
> Also I think there are helpers that take a resource type parameter
> (as
> your function) and others hard code it in the function name. Maybe
> unifying that would be nice, too.
>=20
> Best regards
> Uwe
>=20

