Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0204A40293B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 14:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE3389DFA;
	Tue,  7 Sep 2021 12:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEDF89DFA
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 12:52:26 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id n2so9810806lfk.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 05:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=yd5PddgaDgBJxyg3Hd2rhZ1eCoISlbFX301E70qALbI=;
 b=D3hmfGbPRnrtdbqRPvRfJ0myvNdPkY/I13RZdQrQjUQvm9/zcQisnCpsSz2lWmJokO
 Ehm0Bej1jJ3Q0e2vS+ggrFQ/J3EZ1S/xY5+Kjw0UZu12BPJU0Dz6vpBb1T5L6Y/GdQxW
 jR27OU7Q65hIlMdYA/csg1u7iyJnA5aoeoxUaRIDPUyyO6RalK8FZ6MWfDdpAJOOPRdX
 6IXW/JEQeymp5T0PEbSEXdxi6dvJkQM+r7Gi7eu9uYwhYvrT8ZGkDe7MvNixEhI2X5/S
 o16Wx9S5Eroii27yk02UGo0do8zZxfq4i51KFizDNwb1BTDz42OhuElNXMW1RndLORhD
 Tqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=yd5PddgaDgBJxyg3Hd2rhZ1eCoISlbFX301E70qALbI=;
 b=sUWZf70E2nb3ikQIgyxuMpERnhiogE8jiFRVNWikzCDmB//5Pp5c4cW476VYFPl6eq
 j9uMezSmmBjwUSfzCSpfQJi2CBq5JWpFt/hdVhsTvQ2ftGxWxDeO+jIPJ9ioifV++6Wb
 5/EhQPxFFk3uFFjk/sSv1FLBO8SBSUAY/xosAeWGXRTkA72tbs5BsjhTSwhyd/ZRsX2I
 SfLTcdKDR7RPbXJbao04jpCA2ZgEcViL4PbQOh/J8n8zeTNwCpnKVg/xPzPGxsh14XlK
 NvBsM222L1aJSTTPk4T6rEGIdh8FVwPS6emSTlJkzg0T0Lx1VcB/AxtOd3WsytNfN6lE
 ngCA==
X-Gm-Message-State: AOAM53114g/9P2jqDdtT7KihSUU0t3H2ofUYRzJ/ygGbvax0Xe7ICHge
 2lko65P4xJ2Bn+9gLdfu1bU=
X-Google-Smtp-Source: ABdhPJxLHDzRY/pAyK5b3L92VZJ+Xk6eNdlIqC44a8mEEgIhbC+jmb5pPK2giAE1R02roc/Vu6WSgw==
X-Received: by 2002:ac2:5963:: with SMTP id h3mr12801281lfp.203.1631019144587; 
 Tue, 07 Sep 2021 05:52:24 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id z1sm270993lfe.137.2021.09.07.05.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 05:52:24 -0700 (PDT)
Date: Tue, 7 Sep 2021 15:52:14 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Cc: Dennis Filder <d.filder@web.de>, dri-devel@lists.freedesktop.org, Hans
 de Goede <hdegoede@redhat.com>
Subject: Re: Handling DRM master transitions cooperatively
Message-ID: <20210907155214.285b3561@eldfell>
In-Reply-To: <Kh2hM9odvPcbqNUxhSEwQbnUCLt6nyrAzGhxnQ0JO1CcAzI6y31enf8_AmgAynFxWo3E1QUlW1m8UvKPDAq0gFLQi2CF1b3FFNMRfiUzOAI=@emersion.fr>
References: <YTJypepF1Hpc2YYT@reader> <20210907130746.7b667dac@eldfell>
 <Kh2hM9odvPcbqNUxhSEwQbnUCLt6nyrAzGhxnQ0JO1CcAzI6y31enf8_AmgAynFxWo3E1QUlW1m8UvKPDAq0gFLQi2CF1b3FFNMRfiUzOAI=@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//51fX8W5WNf=smQ2ki/fhaM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_//51fX8W5WNf=smQ2ki/fhaM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 07 Sep 2021 10:19:03 +0000
Simon Ser <contact@emersion.fr> wrote:

> FWIW, I've just hit a case where a compositor leaves a "rotation" KMS
> prop set behind, then Xorg tries to startup and fails because it doesn't
> reset this prop. So none of this is theoretical.
>=20
> I still think a "reset all KMS props to an arbitrary default value" flag
> in drmModeAtomicCommit is the best way forward. I'm not sure a user-space
> protocol would help too much.

Hi Simon,

for the "reset KMS state" problem, sure. Thanks for confirming the
problem, too.

The hand-off problem does need userspace protocol though, so that the
two parties can negotiate what part of KMS state can be inherited by
the receiver and who will do the animation from the first to the second
state in case you want to avoid abrupt changes. It would also be useful
for a cross-fade as a perhaps more flexible way than the current "leak
an FB, let the next KMS client scrape it via ioctls and copy it so it
can be textured from".

Userspace protocol is also useful for starting the next KMS client
first and handing off only later once it's actually running. I'm not
sure if that is already possible with the session switching stuff, but
I have a feeling it might be fragile or miss pieces like the next KMS
client signalling ready before actually switching to it.


Thanks,
pq

--Sig_//51fX8W5WNf=smQ2ki/fhaM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmE3YH4ACgkQI1/ltBGq
qqcu8A//eJak1hn9p+s438qvCqO3Ig62YFUXKGlkoLswr8NjetFDJWl20vfc20pN
m3/TgoWhI2TIgMBlPtVtG/4V5xcM4r7ch/zcKQLg3jJS9BDY8StXe/vvv9HiFB4r
ZMxpykepPqvZm80zURziN7AXTonYYPOxsuP0dLypc0KDUCfdOsPADsPx7qWcAeSj
/P380Bn7I4qKbPgN14fA61IMH2Am3s6bn8RMD5PHuKqg4F1Rjd6biSyg1EErmn94
c0lE2VSXnvY6HHzWGB4e6iYxetrWmtnRi/Fbh9F/M0w9ZaBFLMo/nLWj+ltIHau4
b/O8zP9fbEM+U36652FSjlmcNtdPC2vtOjbqsE2fke6Hbt9qgUExafLkFIPtnqCS
Qa/f60P/gX5L9L9oWCUMev6JsRvlFsJ+hkssd68plv8GASkMi02CcSbMzBee0zl9
J7bepRy1PZwv2hvL9ycI6xQHUYghOjt6c4z+hmi0d/VaAilG59LCFuf0xpZ+riU+
9Qdwte9a0Ddb6f9Pb+wfhUDrfjqzR1Kae2LuU//HdX2Budeao7IzeDUGFkQu0Yz9
LgeiJ1SQgiQIz4v4uCPj5J3T8qXAlbbT3jRzsVFA5nDMALov4neiP/Iwgu6O21Bx
I6u4qNWK1Oh87Zbjgb5z+v26A/roOx6B+bbqsU5jfzEaUu2/bgU=
=X3HL
-----END PGP SIGNATURE-----

--Sig_//51fX8W5WNf=smQ2ki/fhaM--
