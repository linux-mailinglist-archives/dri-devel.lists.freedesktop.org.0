Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D7AAC12F9
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 20:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FAC010E755;
	Thu, 22 May 2025 18:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="i/I+Xszo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36C010E813
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 18:03:03 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-7c5b8d13f73so955513785a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 11:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1747936982; x=1748541782;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=J/udtId/XxzUAgerzFd20anDTdLUkEu2nN7uwbduy4g=;
 b=i/I+Xszo6mRDNgoPOD4UJBiJPyWcJlH81yJkOt0E55Rp9p7aIzTzTVWsqV0/WbQemO
 1OzuISHGDZ6NUENbiz4CGE8455RHcZynsL06XiOETyB70K2TuC9myRN9j+z3sQ1rm8vP
 YKpkbbvo2Pdfgo4XVP4jsrix2EqQ3i5DaK3v/3qxVlaby2mmjtTyiT1XukZ69krZjEs5
 71ZF6FOXBW9+jOsG0fHzpBYvCwGhqbviaLjREdtgxXsOxggbJDDaZ5O4Qo4GCOL48WB3
 eTlSVYatAXrPectfTFUPoQLDNDfVrGxKTrH8wcaEdpioBbUPNsOUuuVENkRukkrJCKK1
 GsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747936982; x=1748541782;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J/udtId/XxzUAgerzFd20anDTdLUkEu2nN7uwbduy4g=;
 b=O1yqBCXdghZ06k50IIrBTXtrer8TrrV37seYXSCODkVhinT0814xHhsf3SmU0SjpaI
 TmWrOPUUihPCHKxOVM0AMtXvufndAEZhkBTUlgk7ihYSQVAoe1G7XkZYddKbFknjeeSi
 +NoBnyqtu3BB/wOZgUtzV7J/g0le4QZye5SFqjtBP8nM53mcUblNMfYMYeuR7ti3lkYY
 7kMOxZh3CZ9QsIY0jNFXrseXuv4SIslcao47VQXO72Il1eK05e8dto2SzJNCwWLDCAF9
 p7CuBru996kwtRzbU2O9rNDwdJ5T2F9ONoI04nWik0yKkfIsG6XPE5r8ci2rbzYCwHam
 Dhzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxlERYC2zPGUyKUWc229EVNKUcCdI6O2fbJJ+8HE+6PYNjKgjMeXCwIgefQENSpixLsiwpl16EG9k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyx/fXhMaWbvk7sUAoClz2n+i7edCODR9Ffd2HU5j/tY39MG6AS
 tN3QbZF6Luq1QwnLWAoYJjXNLac+df4KiCMo0sZ95uJtRqS44X5nIm0yKZr+chdDEkM=
X-Gm-Gg: ASbGnctXQEQHb4aoEgHoLNMy+ZA9pa8ZdqChpCZi8mx9AF6YLm9sTFz1D1DSitvd5JK
 rTi2ha38xFcNrkhUkElH8/bdAy2gr/zFSVQSeweT4lZlahmJVmKneAM9m9DJba7g7nujhXuJjOQ
 QgT8U5y7TmlBTO0nlcPD9HhjWJ6UigslncW49dGsUY8MuDX8iz5aP2mKB6gAGPlLQYNbNkXC6oY
 VLFcMwr/dHWKzsxsTFmnXuZvgoDhjtmwvYejTH6aTtVJETcZaYRWtml/y0Qf9miQ+yPdaTj1stj
 58BOHYVX8ASlkKVyY3D9SV91LUzgCrqwhsJvF6jhgJscx3oPt7dmup+SHjmoiIQe2ag=
X-Google-Smtp-Source: AGHT+IHh4iw4dgUV3S3EY22uzVTY0YQII61ellrTPDPBr9fV911fwzk1oNA0AI/vndoigz6Eq9Za+A==
X-Received: by 2002:a05:620a:d8d:b0:7c5:60c7:339 with SMTP id
 af79cd13be357-7cd46718a88mr4026950085a.9.1747936981809; 
 Thu, 22 May 2025 11:03:01 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::5ac? ([2606:6d00:17:b2fc::5ac])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7cd468b62ecsm1052642185a.82.2025.05.22.11.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 11:03:01 -0700 (PDT)
Message-ID: <0c261c9aad759d791e0a576a47bbd064f28148e9.camel@ndufresne.ca>
Subject: Re: [PATCH v3 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Rob Herring (Arm)" <robh@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org,  Conor Dooley <conor+dt@kernel.org>, Oded
 Gabbay <ogabbay@kernel.org>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, Jeff Hugo
 <jeff.hugo@oss.qualcomm.com>, Sumit Semwal <sumit.semwal@linaro.org>, Heiko
 Stuebner <heiko@sntech.de>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,  Simona Vetter
 <simona@ffwll.ch>, linux-rockchip@lists.infradead.org,
 linux-doc@vger.kernel.org
Date: Thu, 22 May 2025 14:03:00 -0400
In-Reply-To: <174742024812.3649303.12389396177218408388.robh@kernel.org>
References: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
 <20250516-6-10-rocket-v3-1-7051ac9225db@tomeuvizoso.net>
 <174742024812.3649303.12389396177218408388.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
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

Hi Rob,


Le lundi 19 mai 2025 =C3=A0 06:35 -0500, Rob Herring (Arm) a =C3=A9crit=C2=
=A0:
>=20
> On Fri, 16 May 2025 18:53:15 +0200, Tomeu Vizoso wrote:
> > Add the bindings for the Neural Processing Unit IP from Rockchip.
> >=20
> > v2:
> > - Adapt to new node structure (one node per core, each with its own
> > =C2=A0 IOMMU)
> > - Several misc. fixes from Sebastian Reichel
> >=20
> > v3:
> > - Split register block in its constituent subblocks, and only require
> > =C2=A0 the ones that the kernel would ever use (Nicolas Frattaroli)
> > - Group supplies (Rob Herring)
> > - Explain the way in which the top core is special (Rob Herring)
> >=20
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> > =C2=A0.../bindings/npu/rockchip,rknn-core.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 162 +++++++++++++++++++++
> > =C2=A01 file changed, 162 insertions(+)
> >=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:

Yes, and it found and reported it 25 times, can you fix it please ?

Nicolas

>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
pu/rockchip,rknn-core.yaml: properties:reg-
> names: 'oneOf' conditional failed, one must be fixed:
> 	[{'const': 'pc'}, {'const': 'cna'}, {'const': 'core'}] is too long
> 	[{'const': 'pc'}, {'const': 'cna'}, {'const': 'core'}] is too short
> 	False schema does not allow 3
> 	1 was expected
> 	3 is greater than the maximum of 2
> 	hint: "minItems" is only needed if less than the "items" list length
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
pu/rockchip,rknn-core.example.dtb:
> npu-core@fdab0000 (rockchip,rk3588-rknn-core-top): compatible: 'oneOf' co=
nditional failed, one must be fixed:
> 	['rockchip,rk3588-rknn-core-top', 'rockchip,rknn-core-top'] is too long
> 	'rockchip,rk3588-rknn-core-top' is not one of ['rockchip,rk3588-rknn-cor=
e']
> 	from schema $id: http://devicetree.org/schemas/npu/rockchip,rknn-core.ya=
ml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
pu/rockchip,rknn-core.example.dtb:
> npu-core@fdab0000 (rockchip,rk3588-rknn-core-top): reg: [[0, 4255842304, =
0, 36864]] is too short
> 	from schema $id: http://devicetree.org/schemas/npu/rockchip,rknn-core.ya=
ml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
pu/rockchip,rknn-core.example.dtb:
> npu-core@fdac0000 (rockchip,rk3588-rknn-core): compatible: 'oneOf' condit=
ional failed, one must be fixed:
> 	['rockchip,rk3588-rknn-core', 'rockchip,rknn-core'] is too long
> 	'rockchip,rk3588-rknn-core' is not one of ['rockchip,rk3588-rknn-core-to=
p']
> 	from schema $id: http://devicetree.org/schemas/npu/rockchip,rknn-core.ya=
ml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
pu/rockchip,rknn-core.example.dtb:
> npu-core@fdac0000 (rockchip,rk3588-rknn-core): reg: [[0, 4255907840, 0, 3=
6864]] is too short
> 	from schema $id: http://devicetree.org/schemas/npu/rockchip,rknn-core.ya=
ml#
>=20
> doc reference errors (make refcheckdocs):
>=20
> See
> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250516-6=
-10-rocket-v3-1-7051ac9225db@tomeuvizoso.net
>=20
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>=20
