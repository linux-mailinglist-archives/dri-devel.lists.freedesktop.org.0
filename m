Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A30EBB2BE6
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 09:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC11910E0C8;
	Thu,  2 Oct 2025 07:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ChFxVhGG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D04C10E0C8
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 07:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759391684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f5NgAjs0FgUvOjNKCgOViw/s6WyhuboPXgN8L2oduk0=;
 b=ChFxVhGG7dzgobkNilhpSGTs3C+iG5azOVKKVU9svJO5wY/6iNknEiiR0kt2w10MWCjX6+
 uMjqsvlfVRppfI7gjbHc6x8gOYETkI8BNOlBUK23PrBmzRXV/n8JAa5UdQ6L/Kgcuttfuk
 v7qYbSwZevdO834ibDTRqO2XezbxJ0s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-RE0q1t47MNSNMZnMiaDnTg-1; Thu, 02 Oct 2025 03:54:41 -0400
X-MC-Unique: RE0q1t47MNSNMZnMiaDnTg-1
X-Mimecast-MFC-AGG-ID: RE0q1t47MNSNMZnMiaDnTg_1759391681
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3ee10a24246so461159f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 00:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759391681; x=1759996481;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f5NgAjs0FgUvOjNKCgOViw/s6WyhuboPXgN8L2oduk0=;
 b=UA/9MXtuBqGsS3To4Yr8dJE3szVXM6M5VejEq+jC4pIPCW9g42j8AeUpZ1rTAQkap3
 ApKSJsl2nAjxKUF+WrkiIkvjRwJg8KlGDEoACDSbWqgMqTrKzOy5RCLh6qxwBe6QIAWk
 dNspCY1SSGMyU4iv3ocv1D5VgF8S//qpNfy/+n3aU6ty4+Ct48HlJD8PIy6eK5NViAm8
 VScx85z21t1Yd/PSYfQYbr3ygAy/kQ36K4OFCTkXq+vIsQjYhxZuQmSTWQ/YYgRTMNYX
 h/7rhnkjBYtF2Is+e/mX2joADphTf0traMQRZANTcRGEgvdDb+CSzMtV/6DtymHkChFU
 raLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXqqiU43I6qEJJJuUJgntCyWNPTdBDN0JkxyHEvFFuzUSFFl+imwQ+vfWGFwwW4i7vWO0qFJR4DuI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsZtmBpk6Lxe49bBeATADnbTGarNcO0TZSqbqkPuPnkU8aQSm9
 OWidxBJ0D9HQCQnY+mviSLj8b8BaLaQ/vth/ONhg2E50opuGIz7/37CexdP0B2sqHFWmkQtZnL7
 7g7buM7bLqPdYonhbF9P3y1Gxw0lyAzK8GXvrhqZrCX72KThcPj8o9crMam3odeyQE6ypkA==
X-Gm-Gg: ASbGncuXDONqWbOtTIsuj2FmGCBzI4pdNQP8Nh0upUOdJ1Ru57QaB7aaiVduNRE9iMl
 KsvS4169E96l8wBxCxee5XmGysnJ8Wb3YQ/zS3d6wYMTzzCE6kPJaX5mkgnAvr/SvpiqeOUDX6g
 LKtRFE9ydvYmPnW7CH4RA0ogw0Lp4oqhn3OF4zK3KYJ9kSDda1t1RRj5q374PEU/CoRVGcrPOQ9
 QDzVN1nYepvelMSp6UO8E3zDaU/DU7yjzkP1h6IkSlI6eb5/qiysHZZdckZWa2DE72yZtHpRxAR
 MlBE8NVEV3VScjFnNoCwow==
X-Received: by 2002:a05:6000:4282:b0:40e:31a2:7efe with SMTP id
 ffacd0b85a97d-425577f4cb8mr4951722f8f.14.1759391680670; 
 Thu, 02 Oct 2025 00:54:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKgb2wuYS24zodpwDlxRHEFq5J/MXUUrEeNEVo0zphJwnjV4MGibFNyYvpxnYvHco/UT9a7w==
X-Received: by 2002:a05:6000:4282:b0:40e:31a2:7efe with SMTP id
 ffacd0b85a97d-425577f4cb8mr4951692f8f.14.1759391680190; 
 Thu, 02 Oct 2025 00:54:40 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8b0068sm2484557f8f.26.2025.10.02.00.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 00:54:39 -0700 (PDT)
Date: Thu, 2 Oct 2025 09:54:39 +0200
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
Message-ID: <20251002-sceptical-goose-of-fame-7b33d6@houat>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
 <20250911135007.1275833-4-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ucqtnbt2ioahlqrj"
Content-Disposition: inline
In-Reply-To: <20250911135007.1275833-4-jens.wiklander@linaro.org>
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


--ucqtnbt2ioahlqrj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v12 3/9] tee: implement protected DMA-heap
MIME-Version: 1.0

On Thu, Sep 11, 2025 at 03:49:44PM +0200, Jens Wiklander wrote:
> +static const char *heap_id_2_name(enum tee_dma_heap_id id)
> +{
> +	switch (id) {
> +	case TEE_DMA_HEAP_SECURE_VIDEO_PLAY:
> +		return "protected,secure-video";
> +	case TEE_DMA_HEAP_TRUSTED_UI:
> +		return "protected,trusted-ui";
> +	case TEE_DMA_HEAP_SECURE_VIDEO_RECORD:
> +		return "protected,secure-video-record";
> +	default:
> +		return NULL;
> +	}
> +}

We've recently agreed on a naming guideline (even though it's not merged yet)

https://lore.kernel.org/r/20250728-dma-buf-heap-names-doc-v4-1-f73f71cf0dfd@kernel.org

Secure and trusted should be defined I guess, because secure and
protected at least seem redundant to me.

Maxime

--ucqtnbt2ioahlqrj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaN4vvgAKCRAnX84Zoj2+
dh5DAYCtjelmpXHr50Khpzx9gOlMaEclQyCYsx0ccN3NkEfrV19Dn1EcsuWOsMM8
FnSLI0wBf20rXmWeBPjWcAcR1B39X7YSjO3A7FgWI4aIrvvEGff3VbIQIgq5c/ST
75QC6+0wWg==
=iJBu
-----END PGP SIGNATURE-----

--ucqtnbt2ioahlqrj--

