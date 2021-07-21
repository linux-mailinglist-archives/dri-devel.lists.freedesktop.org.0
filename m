Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D923D0BB8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 12:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C832D6E890;
	Wed, 21 Jul 2021 10:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3179C6E890
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 10:07:50 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D37A01FE8C;
 Wed, 21 Jul 2021 10:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626862068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C4NubWeG2ovcbxAMfkPElXnWJqbcxkLf6NbwbwLfM7M=;
 b=MdLMMhkI7ONP/nYRE2oIl3sEKkCvlXqrzpPbqfZHjA7OPVUS2yqkubWKHmfWBdumuApQXQ
 ShwF0quhdY4dj8l6GiGjbqOgB5aNRPDzP8eVoV6HTJBxwzd/abxH6cJJxE01qkdshGG3tV
 HAmJWgM41DecaWuRqYe6y48+7KG5QFU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626862068;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C4NubWeG2ovcbxAMfkPElXnWJqbcxkLf6NbwbwLfM7M=;
 b=4c+L9WxPOuGy6w2UomFTa+FhdQtOl3fULCm5CETfr2agEmjy6J9rRlrXIYISZAiUYUpyLI
 axtXvFy4cxgwRFCg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 604DE13BD3;
 Wed, 21 Jul 2021 10:07:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id z79vFvTx92C0RwAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Jul 2021 10:07:48 +0000
Subject: Re: [PATCH v3 0/2] allow simple{fb, drm} drivers to be used on
 non-x86 EFI platforms
To: Javier Martinez Canillas <javierm@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>, Dave Airlie <airlied@gmail.com>,
 linux-efi <linux-efi@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon
 <will@kernel.org>, the arch/x86 maintainers <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Peter Robinson <pbrobinson@gmail.com>,
 Borislav Petkov <bp@suse.de>, Albert Ou <aou@eecs.berkeley.edu>,
 Hans de Goede <hdegoede@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20210625130947.1803678-1-javierm@redhat.com>
 <e61cf77c-6bff-dfcc-d3df-2fb6b48e5897@redhat.com>
 <8dd26141-a09c-39e2-5174-4cad8d21c49c@suse.de>
 <CAPM=9tyfNPa2f5PDBLm4w_H_riEQ5P3rEhX73YGE1y_ygRox+w@mail.gmail.com>
 <CAMj1kXErHteZ+MKYvp=yYmwVxV3A=vjtnG351hZHV+3BPwDQvw@mail.gmail.com>
 <YPbJJ/0tSO/fuW7a@phenom.ffwll.local>
 <03f0edef-e54e-8a2a-4b50-683d3d42e249@redhat.com>
 <YPbWrV/cIODdgu6A@phenom.ffwll.local>
 <37e05f02-b810-0cb1-cc4f-95711cd148d9@suse.de>
 <44a75f18-e3a6-f764-b0ec-ce3ac05805a9@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <1e85fae7-ef95-b2f7-3463-e90958e54684@suse.de>
Date: Wed, 21 Jul 2021 12:07:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <44a75f18-e3a6-f764-b0ec-ce3ac05805a9@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Xa3sKiKw0lskQKjLKRseqrPiBVPqH4fjs"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Xa3sKiKw0lskQKjLKRseqrPiBVPqH4fjs
Content-Type: multipart/mixed; boundary="yNbR0EJmqO1B5PtZC9iiBAmy6gYhoBNLY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>, Dave Airlie <airlied@gmail.com>,
 linux-efi <linux-efi@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon
 <will@kernel.org>, the arch/x86 maintainers <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Peter Robinson <pbrobinson@gmail.com>,
 Borislav Petkov <bp@suse.de>, Albert Ou <aou@eecs.berkeley.edu>,
 Hans de Goede <hdegoede@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Message-ID: <1e85fae7-ef95-b2f7-3463-e90958e54684@suse.de>
Subject: Re: [PATCH v3 0/2] allow simple{fb, drm} drivers to be used on
 non-x86 EFI platforms
References: <20210625130947.1803678-1-javierm@redhat.com>
 <e61cf77c-6bff-dfcc-d3df-2fb6b48e5897@redhat.com>
 <8dd26141-a09c-39e2-5174-4cad8d21c49c@suse.de>
 <CAPM=9tyfNPa2f5PDBLm4w_H_riEQ5P3rEhX73YGE1y_ygRox+w@mail.gmail.com>
 <CAMj1kXErHteZ+MKYvp=yYmwVxV3A=vjtnG351hZHV+3BPwDQvw@mail.gmail.com>
 <YPbJJ/0tSO/fuW7a@phenom.ffwll.local>
 <03f0edef-e54e-8a2a-4b50-683d3d42e249@redhat.com>
 <YPbWrV/cIODdgu6A@phenom.ffwll.local>
 <37e05f02-b810-0cb1-cc4f-95711cd148d9@suse.de>
 <44a75f18-e3a6-f764-b0ec-ce3ac05805a9@redhat.com>
In-Reply-To: <44a75f18-e3a6-f764-b0ec-ce3ac05805a9@redhat.com>

--yNbR0EJmqO1B5PtZC9iiBAmy6gYhoBNLY
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 21.07.21 um 07:09 schrieb Javier Martinez Canillas:
=2E..
>>
>> Can I simply put the patches in to drm-misc-next? There was some talk
>> about a topic branch?
>>
>=20
> ... which AFAIU means that there's no need for a topic branch, since th=
e
> patches will be present in linux-next. And the EFI folks can use that t=
o
> check if there are any integration issues or regressions caused by thes=
e.

Merged into drm-misc-next.

Best regards
Thomas

>  =20
>> Best regards
>> Thomas
>>
>=20
> Best regards,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--yNbR0EJmqO1B5PtZC9iiBAmy6gYhoBNLY--

--Xa3sKiKw0lskQKjLKRseqrPiBVPqH4fjs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmD38fMFAwAAAAAACgkQlh/E3EQov+A+
gQ//cm3YmrkvVs/l/xoo2fbJXBc0h9CfisiQrI+6/Vgdc3c/PL9jM/5VoqsUajcScfXFmfpBDlZn
6zTFAYqUVTntYMnSrTwbuaY/Tmo0Y2Unrh66bIDzlKz4ZWjYPczolpW40ke/l6C5/dSgR2wu8zRv
FqynPxu8Y2TroBgDGHuUbUjFYNc5g80xUq7/Qvik+YOQG25iiNw3Y1QQg6y/JO8r0lbBStYchmNP
dSmvkmjovJ/C/98FbrXAMQZtkbe9ar4Oy3lqwA/GdNEnnbCTzc4VP9WVmuVUPbI2gXsdrAttjkSJ
7AMEbAgrrjY73g64k6TCwjZnCvBU8D9vxzjCjVLnlnxewAB4SHq5lq7Z4lucLKXs/c9xLv025Ico
ENgkUhfGrwYBiTVqmJ9edVlgVTvLPyNNpb+J+VcbhMSfWQSeegULqjnEEuqrVxIdxYhNpajp2XXV
pXdwJuGy19o1cZelMVYNZzdwPHjvyEPxIyBGcUxYMzwqEhZAjsk9/8Hw6t2RsiSRPaxVfWTUmATJ
CjHmdmCMSRdp2L9KElXaQpUaXtuDiVMYgVevlFcISs4qVq2TeDX1c/f8NRZp2DQ2pgpht5WY/+/T
WqysfHwiBKtbDY88yUtCQuna4XZm1t6HZvwsL5MGuNX8qwa1sKiAw6zezZZucfPJ/4QbdFGSihC3
T9U=
=OQli
-----END PGP SIGNATURE-----

--Xa3sKiKw0lskQKjLKRseqrPiBVPqH4fjs--
