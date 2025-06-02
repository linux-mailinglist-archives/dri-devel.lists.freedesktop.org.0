Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C27B5ACB83C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 17:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4EC10E55E;
	Mon,  2 Jun 2025 15:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="NgK31F0D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD93910E55E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 15:37:59 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-4a44b9b2af8so17356971cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jun 2025 08:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748878678; x=1749483478;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=x1dHqucytNvJE5sOBJHQ1JgixIBWN/66qkZtbhARHsQ=;
 b=NgK31F0DSqGpetYMLlU6jTEx17lI7soOcPXOXzQjUqgwrcB82mjWo0OFdVX5U19Dtu
 eORcSAJco/qQ6n1ZXj/tPwaOpXAlJ0xKXltj09HPxAjghmRZ09naYiiGvVzkc2+OdV28
 I+sz+sh/+l6stWzmoZ5vAwnftSowwgjePCyXinKfNlDE454irG6RzX7og/BGlUdo+Q1q
 1oT5SrahSJZI5pf3XTA2FpaDGk9xg9JWr2I/VfRO1gsVBIW4mEol6oRj5SbFrhpIQ8w+
 R4edR/h9VlIHZcvmjHsMVS/+Ewsjbx8sybX0umCGXPIgI8BjbnZYPYZHmJiZseU4oJWi
 79XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748878678; x=1749483478;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x1dHqucytNvJE5sOBJHQ1JgixIBWN/66qkZtbhARHsQ=;
 b=rA43oZRiSdFWaGHj5Tt17PRygzrjM8MeK9G/oVT0gkYG6X0Kv8Ht34mwyyFKgp3eWn
 cLxW8WMVf9nd1XLW0DBYc6zRBg+7zXpSXI+ItR4fIjbz2G5+KxZaFwyAjccR5D67v0Rx
 EjeI25akUtPtEFsLXuJr41k8kThdIfYCKzzoIySG0RLbYrLcPVvc+RYWm98mZMnToFEj
 yTHj0u9poF2Q8Zy0ig5MmVG9i2jqXNW4TeZzxhNd4V5rXlvBW6TIXKFjmi9+cn37cnzo
 xUYc4DiYKQ4UUxMDWjujQTkzuQNYm9hzyygZdSydtSg0Rt/mguCVP/C8AGJrEDlP8yob
 8zXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAkp0jA9/yk/RRHr/HjQWSfy7hvReGZa27xKnl7RHTjeDWqyzkdlWpKDLLJTWj5SggiD4UwyIwEHs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzO1TzMElqn/C4il63k34jYLWdEyNy4c0KGECr4JS/XaCTMYoaY
 HX0gSkkiBJViCrQm40n5aSElrk2vsFxfSD8R/OmiTTB1KVHaj5Ieq64Gk5ksUJbcqBk=
X-Gm-Gg: ASbGncsMbDXkk9QIW7X+3F7+WRWOMGzQZe91dVRFQkqCayEbhQQI60TmNjCzT1CvD8I
 KMVoGGtMVhUeSdYTWmBVQr8xkcWPbLx6OKIwjvY7fcMqELa/bRF4ULexp2a5J6FJfJnn2dXpAEY
 UMgy4UHCvyMzaXxAdUwW7Cg5AT1tSqp5IO/x6lFf0Lsag5uBlRHorLDaGNu+Q2jvmQS98wR73gW
 bCDlT8uqUwORPTOFSNNdC3EM7Y0ol0LnnS6nW0XUJN6+/agWohyFSTa/0d4zFpi15Fw6FW4jDBS
 4JYgVaenXa6h0tK9vqj81ObZjCto+BpuVYQSQqaYgzRhunnDoc4FxYjl
X-Google-Smtp-Source: AGHT+IFAxvbyts/4W1PU88jgJRJyPWsVyM/w1Qedjlhc5oIe8j+5+JXf7JzKMu2VMp0D7TLMJ22XCQ==
X-Received: by 2002:a05:622a:5598:b0:4a4:3d27:77a0 with SMTP id
 d75a77b69052e-4a4a5ec583fmr144502391cf.2.1748878677932; 
 Mon, 02 Jun 2025 08:37:57 -0700 (PDT)
Received: from ?IPv6:2606:6d00:10:5285::5ac? ([2606:6d00:10:5285::5ac])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a435772fb1sm56762721cf.8.2025.06.02.08.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 08:37:57 -0700 (PDT)
Message-ID: <01ee4dbe14917dff1e0d256dde6724f81a23ba4b.camel@ndufresne.ca>
Subject: Re: [PATCH v6 17/20] media: platform: mtk-mdp3: Use
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
 Chen	 <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, Xavier
 Chang	 <xavier.chang@mediatek.com>, Xiandong Wang
 <xiandong.wang@mediatek.com>,  Sirius Wang <sirius.wang@mediatek.com>, Fei
 Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 	linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, 	linux-media@vger.kernel.org
Date: Mon, 02 Jun 2025 11:37:56 -0400
In-Reply-To: <20250601173355.1731140-18-jason-jh.lin@mediatek.com>
References: <20250601173355.1731140-1-jason-jh.lin@mediatek.com>
 <20250601173355.1731140-18-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
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

Hi,

Le lundi 02 juin 2025 =C3=A0 01:31 +0800, Jason-JH Lin a =C3=A9crit=C2=A0:
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
rs/media/platform/mediatek/mdp3/mtk-mdp3-
> cmdq.c
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

Did I miss something or this reverts the change made in 15/20 ? I'm also
unsure if its correct to ask for backports of this with Fixes tag. Isn't th=
is
for MT8196, a new board ?

Nicolas

> =C2=A0
> =C2=A0	for (i =3D 0; i < num_comp; i++) {
> =C2=A0		s32 inner_id =3D MDP_COMP_NONE;
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drive=
rs/media/platform/mediatek/mdp3/mtk-mdp3-
> core.c
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
rs/media/platform/mediatek/mdp3/mtk-mdp3-
> core.h
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
