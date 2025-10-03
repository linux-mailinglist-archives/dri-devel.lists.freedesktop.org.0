Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 825B4BB720B
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 16:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CEF710E002;
	Fri,  3 Oct 2025 14:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="F9VKuaiZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D337710E002
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 14:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759500732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DIh0ta/ySV31IDAsjscXZdxDAf93kz39y+kPAUa/I64=;
 b=F9VKuaiZMLgsRzzouEJOmneQq1QmQi3uBRskKIMBuihqgDIOuLbgfO2EzlpD1VblKIOSl/
 gCVIKx1l0KxaifZF63QvV6fzXaH87J6W0nOnLnUmCthQXUFN8+/whtFCAUs/Zu4MbEPGaN
 UKXMmUKgaUfqBEHApWi/riqNXf3RnSY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-I5sCUkUYOS20EbFejojZuQ-1; Fri, 03 Oct 2025 10:12:10 -0400
X-MC-Unique: I5sCUkUYOS20EbFejojZuQ-1
X-Mimecast-MFC-AGG-ID: I5sCUkUYOS20EbFejojZuQ_1759500729
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-46e35baddc1so15906525e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 07:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759500729; x=1760105529;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DIh0ta/ySV31IDAsjscXZdxDAf93kz39y+kPAUa/I64=;
 b=tDYXlu2HPjIl6TRoUM4sw21TJCp/GPc+yhlAjN525im2SAIiBDqH0m+EBz0FuPxcFG
 rH9IwN0xlnsaBqkCjFbKS321aE/72IxGJnr2OXjR9MKEXG3Ovqrk0SM987eiODouMSdl
 acsax/dJzl6vY6HVzjexpljVFN5QVYvfeRps/FPjOm2hnd7+rIzIcMhFFtVYlYI+OeIk
 RhentrqTRKh0vf1gMyd5NiVygDJT2LwH+DgvQwfR7eIgiyvRzfL/RpwNsP2iJU+7c0wJ
 PI5+VEhh3iSnKBBLCQ3h2vLNTKie27/nZdGEQUKtdAOquH9qaJNNNa4l/JlPVU1nnquz
 VgGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmY24gQQlII5CjhR57k4b7o9Ovp/nlbq1G+s3IAE/Yvu+wa2EI95hpvEJOzf7fI4b/PjiB/Hz6tV4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcrzxKylhwEFBAHhnxyFuQfMEJ8w6HpOes7n24Io++6qvo1wwR
 kE96xac8O44BsPcH12zzFXMR6aPENaudKnEmvZgCbqi51/V13iDReyZE5RZW5HYCa/mZBJQLM4W
 W7fLqDQkDlvgSztEOS2r0f1l4Gl5B2i4xIEN01BeE8Swhk1Zd/jiZv2NP7HOo7dt2GVwsoA==
X-Gm-Gg: ASbGncsATEzSMw2KM4MxwOgbuamJHhKWnpZzndy/cV4/CBIlp4VdEYYCaudeWadoJzH
 fk+AeV4u4MeI+r7DmVzDKoZsD1FnISSDxNaEM9YpGea5hsJDNVncMy2NY32q5gzWW446IfMgBe4
 B76s+EaCl4Vnsu2E6HCvNkV+4CmRIenqI90r+FoJw5Lb0MKfvW8Ess+TlHupU2bIKa61mzSB9z+
 WDUJYX1xIBGsmvGeWO/8cb8rnzgQrUj4+uUwcLlCp5cbM0CsiCxrt+Bj9k7p8mX8UE1bWl+WbNr
 8+GTjbHyYPCB31lhTJQvng==
X-Received: by 2002:a05:600c:1986:b0:46e:4287:a85e with SMTP id
 5b1f17b1804b1-46e71109f78mr19837025e9.13.1759500729023; 
 Fri, 03 Oct 2025 07:12:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvZE78Vlry2HWGKctUpuvV3NYdSpp6VF7NSq0LXvMOwPsaZRtbqFATFnYhybF+GpisNk1RcA==
X-Received: by 2002:a05:600c:1986:b0:46e:4287:a85e with SMTP id
 5b1f17b1804b1-46e71109f78mr19836735e9.13.1759500728555; 
 Fri, 03 Oct 2025 07:12:08 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e7234f69bsm36548575e9.8.2025.10.03.07.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 07:12:08 -0700 (PDT)
Date: Fri, 3 Oct 2025 16:12:07 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, 
 linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v12 3/9] tee: implement protected DMA-heap
Message-ID: <20251003-majestic-indigo-emu-d9dbdd@houat>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
 <20250911135007.1275833-4-jens.wiklander@linaro.org>
 <20251002-sceptical-goose-of-fame-7b33d6@houat>
 <CAHUa44H3nGgY9q68YRRp5A7Q6Ku3P_URuv+L7H8chYzLAKd8mQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="uh2g5nrijwsim4uc"
Content-Disposition: inline
In-Reply-To: <CAHUa44H3nGgY9q68YRRp5A7Q6Ku3P_URuv+L7H8chYzLAKd8mQ@mail.gmail.com>
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


--uh2g5nrijwsim4uc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v12 3/9] tee: implement protected DMA-heap
MIME-Version: 1.0

On Thu, Oct 02, 2025 at 02:57:25PM +0200, Jens Wiklander wrote:
> Hi,
>=20
> On Thu, Oct 2, 2025 at 9:54=E2=80=AFAM Maxime Ripard <mripard@redhat.com>=
 wrote:
> >
> > On Thu, Sep 11, 2025 at 03:49:44PM +0200, Jens Wiklander wrote:
> > > +static const char *heap_id_2_name(enum tee_dma_heap_id id)
> > > +{
> > > +     switch (id) {
> > > +     case TEE_DMA_HEAP_SECURE_VIDEO_PLAY:
> > > +             return "protected,secure-video";
> > > +     case TEE_DMA_HEAP_TRUSTED_UI:
> > > +             return "protected,trusted-ui";
> > > +     case TEE_DMA_HEAP_SECURE_VIDEO_RECORD:
> > > +             return "protected,secure-video-record";
> > > +     default:
> > > +             return NULL;
> > > +     }
> > > +}
> >
> > We've recently agreed on a naming guideline (even though it's not merge=
d yet)
> >
> > https://lore.kernel.org/r/20250728-dma-buf-heap-names-doc-v4-1-f73f71cf=
0dfd@kernel.org
>=20
> I wasn't aware of that (or had forgotten it), but during the revisions
> of this patch set, we changed to use "protected".

I think protected is fine and what is documented in that patch, right?

> > Secure and trusted should be defined I guess, because secure and
> > protected at least seem redundant to me.
>=20
> Depending on the use case, the protected buffer is only accessible to
> a specific set of devices. This is typically configured by the TEE
> firmware based on which heap we're using. To distinguish between the
> different heaps, I've simply added the name of the use case after the
> comma. So the name of the heap for the Trusted-UI use case is
> "protected,trusted-ui".

I guess my point is that, without any prior knowledge of how that heap
works, I have no idea what the "trusted-ui" use case actually is.

> What would a heap called "protected,ui" represent? Protected buffers
> for a UI use case? What kind of UI use case?

I agree with all those questions. They apply equally to trusted-ui and
secure-video though.

If you want to have a vendor-specific name, I guess that's fine. But you
should at the very least document what all these heaps are for and the
subtleties like the set of device that can access those buffers (or how
to figure out that list if it's somewhat dynamic).

Maxime

--uh2g5nrijwsim4uc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaN/ZtwAKCRAnX84Zoj2+
dk9GAYDf6fryp88Ahl12b+j+v2rumlMEN3n/cHougouDTADzYYFHD5FrzdVXoXCH
2w49Sa0BgPbuh4M8qU3Ly9kSPtLFD2tEJs/iA5V+MezAw2Egx8cvBUXOLP8pdylA
HFFK1Cqtug==
=PVWB
-----END PGP SIGNATURE-----

--uh2g5nrijwsim4uc--

