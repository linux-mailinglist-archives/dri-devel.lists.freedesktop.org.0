Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5194989847A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 11:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9AD11B275;
	Thu,  4 Apr 2024 09:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Gjalwin8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B84611B271
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 09:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712224714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Zx5v3nrBlZjQvFnVGPfY9pJIBpnHEwFGqi/tX7D1SUI=;
 b=Gjalwin8uSfU4asKee2k+LoVw6mQh6144iAwIP3+Y/SSH1htStu/59hHU4BHrII6Vx334x
 ucfb4zhKAe4DsOrlwMX2qSvmin7ytQ4YRtXpKthPUmU4FhaSfngDcTZrSD+QXq9RF9YJ3f
 fetge6903G2UZVsFy7D8IOP5SMjrFl4=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-12jtGqeVN1WkdZBmLMs9yg-1; Thu, 04 Apr 2024 05:58:32 -0400
X-MC-Unique: 12jtGqeVN1WkdZBmLMs9yg-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2d81e030e77so1383561fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Apr 2024 02:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712224711; x=1712829511;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Orry6me8Y86MAhIHpdcMtXnc6PoIoyVukOysNCbSjdE=;
 b=lbGuWt5J4mdVOJn52PxDoTkpRQS7mi6teWgHF1kCoPkRkOs+L2lEqWXNyy1ZwA3xYB
 3/lI8uL7KZRINz8cHzTRy+5gBQWn5+zId3zWVPmnFTmofWxNs0mkIkqE699nxctfHQn+
 qutuOOFXCP3PERoGJEfKgM2ls9dhevE29iC8/WeDqZZ4/rdlmdFcbmwiLNP1dHsiqRBe
 JzQGxyw0Iotmep1BEKeS5KllYzQ0IZ7MN1Wr1bWYmObtXff6Baus5XwiieMXfU9jnrfL
 XzGjH9TzypkK123FfdQsbAISoEnimEhd1jawhoMr47zPynfGGij62fs1S47dXOamwUSx
 5QwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUc0RGttBVLoLunMjd8QlfRSXhrslYwhjYeAI6WnIFUANe07OH6wCqamhOf/g4tO5Z/aqdvxOWVkpv0oDctVkwjks4buKwJ2BKNWlzxmE/
X-Gm-Message-State: AOJu0YxoXePJKYTd3O/X1pFrO7ymfITew3j0zmy7/o1qRRel7MZA7fqB
 cWR4xl0VsXRGNLBToPZOgx8SlaSLk2zNsqhygFirBE2Nvc+yuHQzVvB6snHsz8+lPIDNiWarQUb
 sajP1dNTPgaeCozzSgq6cpoi6XEUpF0rjsDMY5R8IAjjMXVLvj5XL7dqSZBaCsG3UFA==
X-Received: by 2002:a2e:8495:0:b0:2d4:25c5:df1e with SMTP id
 b21-20020a2e8495000000b002d425c5df1emr1307572ljh.5.1712224710828; 
 Thu, 04 Apr 2024 02:58:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL9iywRDTD5XwyTF1/J3z+dPLA+SbOUXVfOYlOrhd3UzBRJvxC5ppQjeIq9Frucy4B4viYOQ==
X-Received: by 2002:a2e:8495:0:b0:2d4:25c5:df1e with SMTP id
 b21-20020a2e8495000000b002d425c5df1emr1307537ljh.5.1712224710432; 
 Thu, 04 Apr 2024 02:58:30 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-247-213.dyn.eolo.it.
 [146.241.247.213]) by smtp.gmail.com with ESMTPSA id
 m10-20020a05600c4f4a00b0041562a58b75sm2097660wmq.13.2024.04.04.02.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 02:58:29 -0700 (PDT)
Message-ID: <4f44a9cb2d7cbd00d5dfa571bf87068bfd91f622.camel@redhat.com>
Subject: Re: [PATCH net-next v6 3/3] net: ethernet: ti: am65-cpsw: Add
 minimal XDP support
From: Paolo Abeni <pabeni@redhat.com>
To: Julien Panis <jpanis@baylibre.com>, "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Russell King <linux@armlinux.org.uk>,  Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend
 <john.fastabend@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Simon Horman
 <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Ratheesh Kannoth
 <rkannoth@marvell.com>, Naveen Mamindlapalli <naveenm@marvell.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org,  linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linaro-mm-sig@lists.linaro.org
Date: Thu, 04 Apr 2024 11:58:28 +0200
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v6-3-212eeff5bd5f@baylibre.com>
References: <20240223-am65-cpsw-xdp-basic-v6-0-212eeff5bd5f@baylibre.com>
 <20240223-am65-cpsw-xdp-basic-v6-3-212eeff5bd5f@baylibre.com>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2024-04-02 at 12:33 +0200, Julien Panis wrote:
[...]
> +static int am65_cpsw_run_xdp(struct am65_cpsw_common *common, struct am6=
5_cpsw_port *port,
> +=09=09=09     struct xdp_buff *xdp, int desc_idx, int cpu, int *len)
> +{
> +=09struct am65_cpsw_rx_chn *rx_chn =3D &common->rx_chns;
> +=09struct net_device *ndev =3D port->ndev;
> +=09int ret =3D AM65_CPSW_XDP_CONSUMED;
> +=09struct am65_cpsw_tx_chn *tx_chn;
> +=09struct netdev_queue *netif_txq;
> +=09struct xdp_frame *xdpf;
> +=09struct bpf_prog *prog;
> +=09struct page *page;
> +=09u32 act;
> +
> +=09prog =3D READ_ONCE(port->xdp_prog);
> +=09if (!prog)
> +=09=09return AM65_CPSW_XDP_PASS;
> +
> +=09act =3D bpf_prog_run_xdp(prog, xdp);
> +=09/* XDP prog might have changed packet data and boundaries */
> +=09*len =3D xdp->data_end - xdp->data;
> +
> +=09switch (act) {
> +=09case XDP_PASS:
> +=09=09ret =3D AM65_CPSW_XDP_PASS;
> +=09=09goto out;
> +=09case XDP_TX:
> +=09=09tx_chn =3D &common->tx_chns[cpu % AM65_CPSW_MAX_TX_QUEUES];
> +=09=09netif_txq =3D netdev_get_tx_queue(ndev, tx_chn->id);
> +
> +=09=09xdpf =3D xdp_convert_buff_to_frame(xdp);
> +=09=09if (unlikely(!xdpf))
> +=09=09=09break;
> +
> +=09=09__netif_tx_lock(netif_txq, cpu);
> +=09=09ret =3D am65_cpsw_xdp_tx_frame(ndev, tx_chn, xdpf,
> +=09=09=09=09=09     AM65_CPSW_TX_BUF_TYPE_XDP_TX);
> +=09=09__netif_tx_unlock(netif_txq);
> +=09=09if (ret)
> +=09=09=09break;
> +
> +=09=09ndev->stats.rx_bytes +=3D *len;
> +=09=09ndev->stats.rx_packets++;
> +=09=09ret =3D AM65_CPSW_XDP_CONSUMED;
> +=09=09goto out;
> +=09case XDP_REDIRECT:
> +=09=09if (unlikely(xdp_do_redirect(ndev, xdp, prog)))
> +=09=09=09break;
> +
> +=09=09xdp_do_flush();

The above will kill XDP redirect performances. Even if this HW has the
same limitation of cpsw, the above will still deserve an explicit
comment.

Quickly skimming over the code it does not look so, so you could
possibly move xdp_do_flush() in am65_cpsw_nuss_rx_poll().

Cheers,

Paolo

