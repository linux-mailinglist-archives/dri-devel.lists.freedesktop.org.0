Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 428B08359DC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 04:46:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A17B10E3C4;
	Mon, 22 Jan 2024 03:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA56B10E3C2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 03:46:28 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id
 71dfb90a1353d-49618e09f16so418939e0c.2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jan 2024 19:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1705895128; x=1706499928;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kE8ms7ryFZW9Ht/e6NRcvd7QnzuOU18cg/pk9kEcOj4=;
 b=RN1YLKsW1/TYAd24wqkj4Y+/4lXPTS3Z1Cv9fBVlgiASzQiufVRJm6dsRardhd13xL
 mWjufjaC/uJxqEXZ+3sLi6n1SI5rOsKMxdmLFR1FBE1FHqVfBqLZE21t6+6i6nE4cgus
 jO2nYzDvh36uCXms9dKbhn4rQqZ2dFxksPkac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705895128; x=1706499928;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kE8ms7ryFZW9Ht/e6NRcvd7QnzuOU18cg/pk9kEcOj4=;
 b=wWDl0ndq7Pu6PNHCurdm4KYdczDXloGxKDf6OQg1VSiEbNP7qEjCWdkt7je4Bn8aDe
 oJaPlaVDHJY17omYrvsa5+QOE+NxnNYGtoTGhQeWlXQE2DUvnx+NNbRoZkuTR6KqxXcF
 e9uHIsSmJh5Nj5nPLbXc8KmemN6nagAX4/RQWrXHSSlVDfGjr/1aVob4ERvwy9QwiZ3A
 7XgpOSay8LZD1sUSB0RJX2mZ9TAwLWNTqb0BYD6h6HpAWsjChjaxcb2yRdluko+WtBLr
 IaC5PIrDBu7LC3VKZmAi7H6YG0VsRlkVOv7P/raCfLv8afAoqCrPKIoqXttEu31wz/QU
 Hqbw==
X-Gm-Message-State: AOJu0YzgGdoZTGk5n3ukXJCSNdiEeDB0IQLFD5+OVCbI0xJm+1fQo0A8
 1fUA2KiQZ/7pW2yX2bG8TevseM2r31/hQenow1w1GhZQ7iGwRje4xdFEdVgk2XqY/qoJP7JWNIo
 fQw==
X-Google-Smtp-Source: AGHT+IHDBPCjsvVVeURb3gdCmdP+MqU2FvpNZxBw8tzHC9nRsUPnU8fIqxBmnHHqlMD3iSvPP+FDAw==
X-Received: by 2002:a05:6122:1691:b0:4b7:30f4:4066 with SMTP id
 17-20020a056122169100b004b730f44066mr851341vkl.25.1705895127538; 
 Sun, 21 Jan 2024 19:45:27 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com.
 [209.85.221.174]) by smtp.gmail.com with ESMTPSA id
 3-20020ac5ce83000000b004b78e4fbfb6sm1957339vke.17.2024.01.21.19.45.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Jan 2024 19:45:26 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id
 71dfb90a1353d-4b978e5e240so471137e0c.0
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jan 2024 19:45:26 -0800 (PST)
X-Received: by 2002:a05:6122:410b:b0:4b7:1658:e66b with SMTP id
 ce11-20020a056122410b00b004b71658e66bmr994565vkb.23.1705895125827; Sun, 21
 Jan 2024 19:45:25 -0800 (PST)
MIME-Version: 1.0
References: <20240119063224.29671-1-jason-jh.lin@mediatek.com>
 <20240119063224.29671-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20240119063224.29671-2-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 22 Jan 2024 11:44:48 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng5v5-LSq6d-R-89N35qiKd7qa8FEo6qakWxrzibYvgSQ@mail.gmail.com>
Message-ID: <CAC=S1ng5v5-LSq6d-R-89N35qiKd7qa8FEo6qakWxrzibYvgSQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mailbox: Add mediatek,gce-props.yaml
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Shawn Sung <shawn.sung@mediatek.com>, devicetree@vger.kernel.org,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 19, 2024 at 2:32=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@mediatek=
.com> wrote:
Hi Jason,

Just few nitpicks about typo:
>
> Add mediatek,gce-props.yaml for common GCE properties that is used for
> both mailbox providers and consumers. We place the common property
> "mediatek,gce-events" in this binding currently.
>
> The property "mediatek,gce-events" is used for GCE event ID corresponding
> to a hardware event signal sent by the hardware or a sofware driver.
software

> If the mailbox providers or consumers want to manipulate the value of
> the event ID, they need to know the specific event ID.
>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  .../bindings/mailbox/mediatek,gce-props.yaml  | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,gc=
e-props.yaml
>
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-props=
.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
> new file mode 100644
> index 000000000000..68b519ff089f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/mediatek,gce-props.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Global Command Engine Common Propertes
Properties

> +
> +maintainers:
> +  - Houlong Wei <houlong.wei@mediatek.com>
> +
> +description:
> +  The Global Command Engine (GCE) is an instruction based, multi-threade=
d,
> +  single-core command dispatcher for MediaTek hardware. The Command Queu=
e
> +  (CMDQ) mailbox driver is a driver for GCE, implemented using the Linux
> +  mailbox framework. It is used to receive messages from mailbox consume=
rs
> +  and configure GCE to execute the specified instruction set in the mess=
age.
> +  We use mediatek,gce-mailbox.yaml to define the properties for CMDQ mai=
lbox
> +  driver. A device driver that uses the CMDQ driver to configure its har=
dware
> +  registers is a mailbox consumer. The mailbox consumer can request a ma=
ilbox
> +  channel corresponding to a GCE hardware thread to send a message, spec=
ifying
> +  that the GCE thread to configure its hardware. The mailbox provider ca=
n also
> +  reserved a mailbox channel to configure GCE hardware register by the s=
pcific
s/reserved/reserve/
s/spcific/specific/

Regards,
Fei


> +  GCE thread. This binding defines the common GCE properties for both ma=
ilbox
> +  provider and consumers.
> +
> +properties:
> +  mediatek,gce-events:
> +    description:
> +      GCE has an event table in SRAM, consisting of 1024 event IDs (0~10=
23).
> +      Each event ID has a boolean event value with the default value 0.
> +      The property mediatek,gce-events is used to obtain the event IDs.
> +      Some gce-events are hardware-bound and cannot be changed by softwa=
re.
> +      For instance, in MT8195, when VDO0_MUTEX is stream done, VDO_MUTEX=
 will
> +      send an event signal to GCE, setting the value of event ID 597 to =
1.
> +      Similarly, in MT8188, the value of event ID 574 will be set to 1 w=
hen
> +      VOD0_MUTEX is stream done.
> +      On the other hand, some gce-events are not hardware-bound and can =
be
> +      changed by software. For example, in MT8188, we can set the value =
of
> +      event ID 855, which is not bound to any hardware, to 1 when the dr=
iver
> +      in the secure world completes a task. However, in MT8195, event ID=
 855
> +      is already bound to VDEC_LAT1, so we need to select another event =
ID to
> +      achieve the same purpose. This event ID can be any ID that is not =
bound
> +      to any hardware and is not yet used in any software driver.
> +      To determine if the event ID is bound to the hardware or used by a
> +      software driver, refer to the GCE header
> +      include/dt-bindings/gce/<chip>-gce.h of each chip.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 1024
> +
> +additionalProperties: true
> --
> 2.18.0
>
>
