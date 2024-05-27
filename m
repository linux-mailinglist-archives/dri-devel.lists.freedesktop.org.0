Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A82D8CFC8A
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 11:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCD810E5D9;
	Mon, 27 May 2024 09:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="Kbyu4WXF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9625810E5D9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 09:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1716801200; x=1717406000; i=markus.elfring@web.de;
 bh=cQmjal3CjS/j+6M+2XYTIrwdOTGkVSbVdktpb0tEJ1Q=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Kbyu4WXFrqFMYYDiwq8+/drLDGuOgt32T3LyYMnRObmRwndKFg/e3lhC3G5SZMrP
 BLtThCnMYBfLYsr1Svpu6RVDW1Mv8i1JPcSxE9UUmH3p/cXDnvl4lPQyv4aiJhiS1
 n4ncXV4WOdsyuH3kuNFDVcTvsIcruxlRRziYl41iefy8XQXIxQWOzNb0UjfO0iW3H
 TYdhNxcLsWiiHVJ8JVIf56E2yBBbyCUrvff6RkQ+KjxH1VfO5dXogsyt+dBzt/ZpO
 ieTtBUpMJ148xNw9N87G6F2tefuBg4k4LghWlJHLp4kASoI8nHEsBcDnyosWX5CAP
 eqbE084wGxGPkMFUKQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N4vRm-1sauyp37Bs-010xJV; Mon, 27
 May 2024 11:07:43 +0200
Message-ID: <6ee0b36c-5ea0-4a0a-9d30-865f5b823e78@web.de>
Date: Mon, 27 May 2024 11:07:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/loongson: Add a helper for creating child
 devices
To: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20240526195826.109008-1-sui.jingfeng@linux.dev>
 <20240526195826.109008-2-sui.jingfeng@linux.dev>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240526195826.109008-2-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fuak37MKdt1gdQD3nd04PvrGf9PL1iGX348e3REJD+6AlRnnm4i
 H9i03KpL3MUnrdt47SQs446hFV10lycuGT5nmaqo36Bc+hdPZ1nqQDEK88yYhae24RJbrqw
 j1DT3hB0OKdZPo7gB8bNhfybJE0uZDjt9oupAP6FiLJDb/3h/X5xictayypvsAmq7SIcvE7
 AiK2U8XMEPG52POAFy4TQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:W/r4YSFSM28=;OcTn1HBcOTWnKyiD2N/pbQCCESk
 BWTXE6F1mgJuurRIBNT6obCFmg9X22OOcXaG/sADVqHhr8Vj6oVadOc5lJhP4fv+qf+UFoDQ5
 dhWq6tKYTVKagII0DFniInVaoyvePa27lFLKNUSzEzww+Eil9S5t66pTjUZCi6Xy6yAlJOgCC
 jXcd08ivUgwKb2CE+c93/WB9AOlTm2WBgH82DTCoeEfl49AcaoQASMo1RVaFYDcdZNYbhJWoM
 XfMoPcle3KLQ8XALEUcNFxu9W8+ItpgZzDIcigPhFt2Dpqgf21fMwSKrcIO1Q7+uqt1AOxJ0Y
 4lq1Z3KvvGqQSHLhnYA0FJ7Ybf6fYytxNBHwr55bFbq29JWi9Wr+WKp7bpOIYzdK92ASmm8WJ
 vd4tfALECI8B1ucuPvjqI7olTJUjbGnfQY1ClMTtXFCqbUGfdlZZfnRNG6rMI7rq8tHCYh8dh
 xnYIMFNGnSLAs/p1hCcPUJhXd1Ef3+HOXXsOlkMoNMl9d7Qviag12DpdUiqLIa8G7UJs4rb79
 wucwj6qE1HXDu0YdCisDL9VyrF9VI0ojCBMHdAzoSOa3AcsJTcsk0NAqj/5/OJu0IgPrEsyZg
 S33FI604xiYGI8WfvImsmcfXJlUT0S7Tazi8t5bIGQu9KPofYemjkmXLvUZuq3w2nMZy9ByPZ
 PeCfT7mMr3yMcKMSqdn2z4dZ8UDp5XhS+PILX2LqQU4ZksSb8AYrpCCFs+9dBIOMZiRhefS+E
 V0nzkGXHEwy+PlYGe43ntL1sIW1TbgchPW5Rglg1kdOvrNjuEL11WeKjcraI1ibhT3weldrpy
 YPlXVUPyVitw3GRfSIeFZGLqwPVHzKjaJ+J14XStFxO3A=
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

> In some display subsystems, the functionality of a PCIe device may too

                                                                 might be?


=E2=80=A6
> into child devices can helpful to =E2=80=A6

                         be?


> Another benefit is that we could migrate the dependency on exterinal

                                                             external?


=E2=80=A6
> and rising cyclic dependency problems if not process correctly.

                                               processed?


=E2=80=A6
> driver to create sub-devices for it. The manually created decice acts as

                                                            device?


> agents for the principal part, migrate the potential issue to submodule.

  an agent?


Please improve your change descriptions considerably.


=E2=80=A6
> +++ b/drivers/gpu/drm/loongson/loongson_device.c
=E2=80=A6
> @@ -100,3 +101,44 @@ lsdc_device_probe(struct pci_dev *pdev, enum loongs=
on_chip_id chip_id)
>  {
>  	return __chip_id_desc_table[chip_id];
>  }
> +
> +int loongson_create_platform_device(struct device *parent,
> +				    const char *name, int id,
> +				    struct resource *pres,
> +				    void *data,
> +				    struct platform_device **ppdev)
> +{
=E2=80=A6
> +		ret =3D platform_device_add_resources(pdev, pres, 1);
> +		if (ret) {
> +			platform_device_put(pdev);
> +			return ret;
> +		}
=E2=80=A6
> +	ret =3D platform_device_add(pdev);
> +	if (ret) {
> +		platform_device_put(pdev);
> +		return ret;
> +	}
=E2=80=A6

Please use a goto chain for common exception handling.
https://wiki.sei.cmu.edu/confluence/display/c/MEM12-C.+Consider+using+a+go=
to+chain+when+leaving+a+function+on+error+when+using+and+releasing+resourc=
es

Regards,
Markus
