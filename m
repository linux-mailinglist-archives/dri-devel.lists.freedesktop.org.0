Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D6ECB10B1
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 21:47:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B3410E184;
	Tue,  9 Dec 2025 20:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="eVZJMgad";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA6810E184
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 20:47:13 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-4ee0ce50b95so2249791cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Dec 2025 12:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765313232; x=1765918032;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
 :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=c4INrajJZxer3eDvKBBVTy/6pmKf+B5vk/ryF/UUlog=;
 b=eVZJMgadqdGbgKuB0uvoJ+6Mchf0eYusgNwUTpN9tQrIopytPh1B/fgBdI6bEMVjRJ
 WhT5BhCTdkc9MZY1aiPJ+Ymo/Kb+J373Jb/OEz+K6qDFH3CpOneEStNGzk6kpwaJ7PKK
 U8VqkvA0vdFFIEoeEVDAqNcmTEbS6IYoO7lTOHvglrSdUUndr3vc6iCnPDZH0FDKQM7L
 2KlaQiidgKsGjDFMDZiUvVg1oYkcmEJQ9pHVMkiPCxUpiE6Zf+ueIoDa852YI2XPMqBN
 rl86+0XXQ8/IromaO1aXccCmTuvwTPS7r2gO2WUPBVnQIssPfG/1JFT9/u1+rdNlttSm
 zcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765313232; x=1765918032;
 h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
 :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c4INrajJZxer3eDvKBBVTy/6pmKf+B5vk/ryF/UUlog=;
 b=Fnm0TV1HeJL/cf3R57nkiz8urDqhMpa/8hA2ya5LZbVSnSnTK53ZIzHSl4KDN/I122
 5qlwDOAo229jsa+4Oldqlt++y0msdbiKHxYYzOtlbxyAlnAiTXqJk9YeNyvrBNYMLVEV
 OJBR1P7az6Xm2dZM1k43qukqXXoLTiDQWkJJu4DdJAAP8uWFM9BGBRN67sq0IYT1yVIq
 ieUV5dW/3Uf/Ux16+sAFuL3sbrx7+Sv1I1swR8RauXmHrUOvyW6G7quNb8Exp760rOmh
 qTwuYcSqwDpF7ub4QIECUechuNII+KzRPpfnjhh+JPjYEfMPzPLWGxdJPcDk5K36i5Dw
 3KMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZBSS6WLKh7xkOy+6Nivl6w8WQc6jF8Hwy8XXZfxNMulmA+WzdmE/aCrAe7giJo/YqmK9k79vrLyc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVIr8JcfVfVKy2KspmTaD5UijDlfdBoHBoS3RsbO56O6ByG9cx
 J5aAtnl64ZkmKuyOy5bbO/lDBbGXRonu1XJKxkOAaKVUOUvWgyDswjD1INx/QPvSsII=
X-Gm-Gg: ASbGncvOZuz10qQCpsIi8bt0qS6abaD/3BIWBhQfwpM2XcT/uhL6vGl16CIpZFFwcPL
 HRDaXauwVafKoA6z3UBeFY5yOGedS7WbipK9icFbm3U0xZ4lMjpPEeAYVYd+xDGzVnoKdHGMIgU
 wCgUL/DNZfTTBTWvVrNUfz7SzT6MdmRVItFs86tTbzHdfj+nFygA54m8yEZQXCCVZdIraHlK33y
 rGN07OJqXLgRDbcuUj5eUQvKNHIzl242H/E4FeebAoY4pGSxomEZnxW5OdO4vdvBF35dyORbfAS
 ++BJ50Z5faDwZbhNwwP5l4q1ZYEh7MdwBF5gNfvNWQ10nsDB+9JOjM6nCslgZoL5faJo37OzG5w
 +9lA1071yiD10VsjPedTHjfz7bhnvFCgMoEOj1rsAi0T4WXmlLuNNUUXvXDXaZWj0e8C04XVhHE
 LThCJ5GH80Nx2/jaA4
X-Google-Smtp-Source: AGHT+IEoy3WsJss4eewDF1IObVZFsEEO8RMc62bsDTegGuaNornhGcbzFkR2E0lJrV1isVMQC9W0cQ==
X-Received: by 2002:ac8:7d86:0:b0:4ed:b570:569 with SMTP id
 d75a77b69052e-4f1b17f042fmr1022671cf.27.1765313232127; 
 Tue, 09 Dec 2025 12:47:12 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f027d2b3a4sm108009241cf.25.2025.12.09.12.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Dec 2025 12:47:11 -0800 (PST)
Message-ID: <e0144120e0943b94454b1cddd5359c34b5a15412.camel@ndufresne.ca>
Subject: Re: [PATCH 5/5] media: platform: mtk-mdp3: Change
 cmdq_pkt_jump_rel() to cmdq_pkt_jump_rel_temp()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar	 <jassisinghbrar@gmail.com>, Chun-Kuang
 Hu <chunkuang.hu@kernel.org>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Nancy Lin	
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Paul-PL
 Chen	 <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 Xiandong Wang	 <xiandong.wang@mediatek.com>, Sirius Wang
 <sirius.wang@mediatek.com>, Fei Shao	 <fshao@chromium.org>, Chen-yu Tsai
 <wenst@chromium.org>, 	Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 	linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, 	linux-media@vger.kernel.org
Date: Tue, 09 Dec 2025 15:47:10 -0500
In-Reply-To: <20251031160309.1654761-6-jason-jh.lin@mediatek.com>
References: <20251031160309.1654761-1-jason-jh.lin@mediatek.com>
 <20251031160309.1654761-6-jason-jh.lin@mediatek.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-MnGLK1uGO3sHzXuy/5rZ"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
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


--=-MnGLK1uGO3sHzXuy/5rZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,


Le samedi 01 novembre 2025 =C3=A0 00:02 +0800, Jason-JH Lin a =C3=A9crit=C2=
=A0:
> To facilitate the removal of the shift_pa parameter from
> cmdq_pkt_jump_rel(), current users of cmdq_pkt_jump_rel() need to
> transition to using cmdq_pkt_jump_rel_temp() before the API change
> is implemented.
>=20
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
> =C2=A0drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drive=
rs/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> index d0b0b072f953..5fc9263ccb78 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> @@ -628,7 +628,7 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct m=
dp_dev *mdp,
> =C2=A0		goto err_free_path;
> =C2=A0	}
> =C2=A0	cmdq_pkt_eoc(&cmd->pkt);
> -	cmdq_pkt_jump_rel(&cmd->pkt, CMDQ_INST_SIZE, mdp->cmdq_shift_pa[pp_idx]=
);
> +	cmdq_pkt_jump_rel_temp(&cmd->pkt, CMDQ_INST_SIZE, mdp->cmdq_shift_pa[pp=
_idx]);

I cannot take that right now in the media tree, as it won't build. Can the =
SoC
maintainer help me know if I just leave that on hold, or perhaps you'd like=
 to
take it ? (or its in next, and I just have to wait for next udpate?)

I also doubt patch 4/5 is make much of a difference without the soc changes=
 ?

regards,
Nicolas

> =C2=A0
> =C2=A0	for (i =3D 0; i < num_comp; i++) {
> =C2=A0		s32 inner_id =3D MDP_COMP_NONE;

--=-MnGLK1uGO3sHzXuy/5rZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTiKzgAKCRDZQZRRKWBy
9HnQAQCvZCLQCXpFlsUfn7DWx1kuIT+I+byuKT/dhCrJ0Qly3gEAh9feswFfhKgL
He/DKiOx62zT1aAhbBCmngiS+Tir/wg=
=/OPV
-----END PGP SIGNATURE-----

--=-MnGLK1uGO3sHzXuy/5rZ--
