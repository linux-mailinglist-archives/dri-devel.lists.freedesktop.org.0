Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7889830754
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 14:49:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052B210E6D2;
	Wed, 17 Jan 2024 13:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D0910E6FD
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 13:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705499364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9tfLMF8D9oKQokbMf8xX4/RpiMIC9oK/PN7AWqeaVyY=;
 b=ZrUXHivVwtNU8uQ3lxoDS/kl7OWTqXBRIS3eMLRvYDzc5kqjZ1TD4Iixpihx1Q3yZNJxpa
 qLu3a6mjI73miFgsv4biqyLhUf/h7U/zDW8q9cO/ABojHN3bNedz+qgHAanUEGWLxBvzef
 4LD0sz8cx9BHJBSFXasadZ5Kb3kwK6o=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-hJ3vS5uNMqea2DEHgVzo4g-1; Wed, 17 Jan 2024 08:49:21 -0500
X-MC-Unique: hJ3vS5uNMqea2DEHgVzo4g-1
Received: by mail-yb1-f197.google.com with SMTP id
 3f1490d57ef6-dc227f548a1so292958276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 05:49:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705499360; x=1706104160;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9tfLMF8D9oKQokbMf8xX4/RpiMIC9oK/PN7AWqeaVyY=;
 b=kN5CMJKBZQXhTRQFidBvEt9a9nDYHwP9nkDJL0D5GSaMP2iDyWRMWqLt9QA74ezrgQ
 7DBYsXfwR8w4Q/2aFfv+MGKgAspKgHSiQ0VHz3Sj8Gug9Evz2dCPgttLEL/QyF5CMo++
 M0sis/zTXNiBxluRdlxqSeKH/cIsVKinNWrr4TH1ZzyuICQ3AZMR1Se3sCATEhaRB4Oi
 w7eAWIHPpOaNBhbLc90Dzhn5meojARpKLse95BhhQKPErYPtRRm4q+VFIVkJscfS7hIP
 ld5eIJUkJAObKaxmDoXqa1JRDePwENthA+5K8cbg0WZTbLrR93HX4yRlmQn4kh0EAkzf
 /NLA==
X-Gm-Message-State: AOJu0YwmZsATcVo0rlAQX08GpN7Z9iFWwTTUALJvFjNqU4gDC8+Kqyk4
 YaxnS2o5neC+Xmu7FFFKSmI0rNjYpQti1s7zk3dXoXCBMsTmHSykeqDrt4sYUDm+PdcU1ewSigZ
 trrJPOEu0o61uez4T0T4da6FbyraSuDhRvXK9
X-Received: by 2002:a25:8148:0:b0:dbc:d44e:4ba5 with SMTP id
 j8-20020a258148000000b00dbcd44e4ba5mr8480321ybm.3.1705499360507; 
 Wed, 17 Jan 2024 05:49:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkrBjM+COoqsF6GAkOv/uc9j2UsNiTaqG5gnxQZ8JGCa3W1u6QSyFkx6IypdKek1QXtq7gPA==
X-Received: by 2002:a25:8148:0:b0:dbc:d44e:4ba5 with SMTP id
 j8-20020a258148000000b00dbcd44e4ba5mr8480312ybm.3.1705499360234; 
 Wed, 17 Jan 2024 05:49:20 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a0cf7c9000000b00680c49f8650sm5015703qvo.112.2024.01.17.05.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 05:49:19 -0800 (PST)
Message-ID: <33b7c1a458df27bfb36ea4f53ef1cc7abc2a4897.camel@redhat.com>
Subject: Re: [PATCH 09/10] pci: devres: remove legacy pcim_release()
From: Philipp Stanner <pstanner@redhat.com>
To: andy.shevchenko@gmail.com
Date: Wed, 17 Jan 2024 14:49:16 +0100
In-Reply-To: <Zab3yr6J1S-2ujT9@surfacebook.localdomain>
References: <20240115144655.32046-2-pstanner@redhat.com>
 <20240115144655.32046-11-pstanner@redhat.com>
 <Zab3yr6J1S-2ujT9@surfacebook.localdomain>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sam Ravnborg <sam@ravnborg.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2024-01-16 at 23:40 +0200, andy.shevchenko@gmail.com wrote:
> Mon, Jan 15, 2024 at 03:46:20PM +0100, Philipp Stanner kirjoitti:
> > Thanks to preceding cleanup steps, pcim_release() is now not needed
> > anymore and can be replaced by pcim_disable_device(), which is the
> > exact
> > counterpart to pcim_enable_device().
> > This permits removing further parts of the old devres API.
> >=20
> > Replace pcim_release() with pcim_disable_device().
> > Remove the now surplus get_dr() function.
>=20
> ...
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0devm_add_action(&pdev->dev, =
pcim_disable_device, pdev);
>=20
> No error check?
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return pci_enable_device(pde=
v);
>=20
> Maybe
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D pci_enable_device=
(...);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return ret;
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return devm_add_action_or=
_reset(...)?
>=20
> I could think of side effects of this, so perhaps the commit message
> and/or
> code needs a comment on why the above proposal can _not_ be used?
>=20

That proposal can be used, so this was simply a bug.

P.

