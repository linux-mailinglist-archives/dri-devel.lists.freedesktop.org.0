Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E01FCB1145
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 22:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02EB10E623;
	Tue,  9 Dec 2025 21:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="S6Z5dHal";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AD810E623
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 21:01:47 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-8b2da83f721so27225685a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Dec 2025 13:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765314106; x=1765918906;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
 :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=bdB60+eboYB8mcQkNMp1+tLftnngs0TeTeQCleurBBU=;
 b=S6Z5dHalB0+19bPRC7r/bHUihXe2/ieb9b7onPKyfgkeUVmCtLBBCDloO8JWMq52Hg
 sYIIBO5A3PuAn5+eDgnwPx2vDwmEdpKQtL2S8qn9STv02tlDIlfge6DhstpKduAHx9m4
 7qhi5pgezk6DUZ9Yt7lOHNKWmfwaxhr4fRB5fhrSbhQHSj02yx/mWnt4SnK6mZCSSmXV
 XcZB81tzmQMIAk5Dzp2c8l686MKQ+2xKhmrzjwfAuUU8W/WsenGRKSCf8kIk3RQ6dwd9
 6m2jJdgA3P0Dj8IOF4URXh6g+aDCaOnKCpzZWcHUdILlGb0bHLZIi5GXUwh8c6JdqLGV
 9EFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765314106; x=1765918906;
 h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
 :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bdB60+eboYB8mcQkNMp1+tLftnngs0TeTeQCleurBBU=;
 b=bhd3IsMrmAeLydui9wnx3NUTYWDjtnxOzAGRlUq6DRXn0Ijs1TUorvXDzK0Dnfw++A
 fXWlAO4vSiGRfiXJniWLuMgGtK6tpSwbcSHn49DxOEmrD/B709D9zQymVZHIZuzFmbPT
 D4m2CZeL15SLZTbGvH+sgMJ5h8gNEkdOP+oH4M4itFuUDXyPrIb9iaH/8tPhA4mLSPXM
 gLAzw0qZUpMk75r+RNEIQFzUUfNMauuTFKe3Selio1EWIGmZc7yLhXH80JfBDgGrvIeC
 YC+JCYKctYhhTCS97LQF7VuQKTSXnhnDwPEScaf3SMHvzjptUebEAeVhjbzTf74Q8GGE
 zflQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcEncxW/BxYcYes6w9DmBEei44v6zr2tq4bmcpFf/zihdSEQdRlUsbveiwRGwv1HtuAix078Bs2OE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyw+msuzPAqUYBZjcgGduCsQoAw81C1ldx9BxcxE45JNb8F6v4T
 iuqtAQLgFVv3IAcn2GFIzAhLQGabnIkJNREBwEQgVCFEpUg/c1tlMmGx1laXQOgG7lU=
X-Gm-Gg: ASbGncttV2sThQ65R4X8fn73/N7THOHR1Xk/ia/CXmyXHOWbeysrR+p1c36c4FcPMRK
 UvM8+Eq45AUUtbLXCAgm9AD4m+uhq2CW35K0trtLfWW4Du7Iq2bCCqsG+J7tnib8FGaLi+fle8g
 MlAW/xeBh1Tf7QVANX+DmiJkUh7ESNxzxiNRTemRXeuHDo5Y+ZlIXsh7L6cewfyD9JLNQx3Rf/u
 k2R/HxjLj0pcTTNuFCnmEluJEmUF3lGl0QwZg6dAPispjzTtLjnhv81AWwt77a4TLhrN5aNYX+D
 uL7Xf/rlK5U05zf8WhZSXqf9TruzyQnCF2mllMqrLIXQUQTYlYCKJC+3tSXnRf3PP8jYKVdQ6gg
 OZ+QCw46r6LqYIiEojKCgzEFEdSUJYJJlAxhC6Skg37YfC7n8YIhq23KYygZjSwhy04cn6LORcC
 J+JrCycS5vSTimr9CN
X-Google-Smtp-Source: AGHT+IE70E6Yg8SvO7c4cluG29AN/MEVghrbdBWJ2DadPgU4cJuuz1Fy4vVBOHbqQWY07mt5r6xw3Q==
X-Received: by 2002:a05:620a:31a6:b0:891:8c16:283b with SMTP id
 af79cd13be357-8b9ccd08e72mr386130085a.9.1765314106344; 
 Tue, 09 Dec 2025 13:01:46 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8b6252b61f1sm1375838185a.17.2025.12.09.13.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Dec 2025 13:01:45 -0800 (PST)
Message-ID: <ae08e53e055a238cde639dc9d9c7263fa296af5f.camel@ndufresne.ca>
Subject: Re: [PATCH v7 17/20] media: platform: mtk-mdp3: Use
 cmdq_pkt_jump_rel() without shift_pa
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
Date: Tue, 09 Dec 2025 16:01:44 -0500
In-Reply-To: <20250827114006.3310175-18-jason-jh.lin@mediatek.com>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
 <20250827114006.3310175-18-jason-jh.lin@mediatek.com>
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
 protocol="application/pgp-signature"; boundary="=-Pkgq2xxV7UQeyr3akCzT"
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


--=-Pkgq2xxV7UQeyr3akCzT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 27 ao=C3=BBt 2025 =C3=A0 19:37 +0800, Jason-JH Lin a =C3=A9crit=
=C2=A0:
> With the removal of the shift_pa parameter, cmdq_pkt_jump_rel_temp()
> can be replaced by the new cmdq_pkt_jump_rel() without shift_pa.
>=20
> Then, remove the cmdq_shift_pa variable in the mdp_dev structure for
> each mbox client.
>=20
> Fixes: ade176534112 ("soc: mediatek: cmdq: Add parameter shift_pa to cmdq=
_pkt_jump()")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
> =C2=A0drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 2 +-
> =C2=A0drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 2 --
> =C2=A0drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h | 1 -
> =C2=A03 files changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drive=
rs/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> index 7575ec376367..c35fe0e3a4d5 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> @@ -638,7 +638,7 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct m=
dp_dev *mdp,
> =C2=A0		goto err_free_path;
> =C2=A0	}
> =C2=A0	cmdq_pkt_eoc(&cmd->pkt);
> -	cmdq_pkt_jump_rel_temp(&cmd->pkt, CMDQ_INST_SIZE, mdp->cmdq_shift_pa[pp=
_idx]);
> +	cmdq_pkt_jump_rel(&cmd->pkt, CMDQ_INST_SIZE);

That effectively revert another patch that is pending, and remove the use o=
f the
new cmdq_pkt_jump_rel_temp(). I don't follow what is doing on here, I think=
 some
context must be lost.

Nicolas

> =C2=A0
> =C2=A0	for (i =3D 0; i < num_comp; i++) {
> =C2=A0		s32 inner_id =3D MDP_COMP_NONE;
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drive=
rs/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> index 8de2c8e4d333..2f8147481bd6 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> @@ -293,8 +293,6 @@ static int mdp_probe(struct platform_device *pdev)
> =C2=A0			ret =3D PTR_ERR(mdp->cmdq_clt[i]);
> =C2=A0			goto err_mbox_destroy;
> =C2=A0		}
> -
> -		mdp->cmdq_shift_pa[i] =3D cmdq_get_shift_pa(mdp->cmdq_clt[i]->chan);
> =C2=A0	}
> =C2=A0
> =C2=A0	init_waitqueue_head(&mdp->callback_wq);
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drive=
rs/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> index 05cade1d098e..430251f63754 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> @@ -126,7 +126,6 @@ struct mdp_dev {
> =C2=A0	u32					id_count;
> =C2=A0	struct ida				mdp_ida;
> =C2=A0	struct cmdq_client			*cmdq_clt[MDP_PP_MAX];
> -	u8					cmdq_shift_pa[MDP_PP_MAX];
> =C2=A0	wait_queue_head_t			callback_wq;
> =C2=A0
> =C2=A0	struct v4l2_device			v4l2_dev;

--=-Pkgq2xxV7UQeyr3akCzT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTiOOAAKCRDZQZRRKWBy
9OdCAP9jVzg+QpGog3Qs+E1aiutQSW6I8TrxlaZxB+Nqe/V4dQEAvcTe47Q5IdHE
la5jsdG9ICyO0vG59Lcb7msMNvmnEg4=
=ZEQI
-----END PGP SIGNATURE-----

--=-Pkgq2xxV7UQeyr3akCzT--
