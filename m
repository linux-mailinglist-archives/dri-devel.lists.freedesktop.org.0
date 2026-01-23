Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rUJLIZ93c2k2wAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 14:29:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB47F763FC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 14:29:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BCC410E27E;
	Fri, 23 Jan 2026 13:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dxMHNvqi";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QFybBuqM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8460410E27E
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 13:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769174937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ffNID3lES/rvD/wRrz1/dUM8poewF7Ay9LgcS6R1JVY=;
 b=dxMHNvqiI72KuBLDeNXwwGiAd2iyOdXU1SlGwjtqm8c/yBcSyAQamIXl0OW51MBx2XWmg7
 /Xgszrpcjl/jCwEAuqXENJUuqnaJN15Tj+XMnuQUgPegttaisgRYMU7ayVI1v3ofRWa3x2
 AWpKes/aiot+TRr9ojgjv+5Wmy9oG9k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-nyMckbh4Oh2hOrI4ndnYUw-1; Fri, 23 Jan 2026 08:28:53 -0500
X-MC-Unique: nyMckbh4Oh2hOrI4ndnYUw-1
X-Mimecast-MFC-AGG-ID: nyMckbh4Oh2hOrI4ndnYUw_1769174932
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-47d62cc05daso21216215e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 05:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1769174932; x=1769779732; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ffNID3lES/rvD/wRrz1/dUM8poewF7Ay9LgcS6R1JVY=;
 b=QFybBuqMNTGLEaj9impbsbS9Mz8ynRDSWJk7BdiIPd1VGC71TTb8qSGhsuq/GVVijV
 cb/IsrV5X0tExt2lNph9YKkA5aYgMbz4hk09zgoPBfRbhwuVeNXRBhjD0OI/9rIiKaVb
 sQsVAMxYf0Jnem2G1ZpLRcx//xoBiVQiPBWxsZjH3tMkr+Il9CYZndkktdeNTu4AZ1pt
 cO+fYB29jBK8vK3yqHpwkB30I1jKdpJE+pBPNCSF480IdAlM3fYjPj9IPJsc7lrF7Orm
 7iS0xwdMyxNwyTQ/6hbeguPe2/dTPnGw6JhWXEg02lNVO/BPi9U8JLaZ8D0BjcmLXrrf
 iRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769174932; x=1769779732;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ffNID3lES/rvD/wRrz1/dUM8poewF7Ay9LgcS6R1JVY=;
 b=d+2xMHYTi0JPiyom/3a7seXa1oyD0L0OGs4qIRWckPJGaE5e/UUMEsuebkipWTg1r2
 bbosca0ttKDILabUsJKG0xzUXq99j0sZMt854xQDNfoqn8CdbCStoH+HQAecVCeJfufJ
 xgHrSUlGWJgLaeUUt0R9pIkWiqjRS+YcIt+2PEUpgBCuxpe2x895O1rmBFBSNCqg8R16
 I7ISx0URwy7VuQ2wioJQesQuOdilxuzB5AkcSqW+dbEcArvi2by6oU1Ip/9xu8IsEhoT
 3va0ExI1Wq+uD6dWSWWKZOEVFStif/m/7rwqVSUIIcCO7nEMYvaJ3/pvpbqIM2r66d4s
 5wwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNIPFl2MPgrRMGD0/L28+nykbZZm0d5ezvwMocPNXv6dNPalN8DsHTYVxpGszhfxoIe+hKT0+n09U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcbeKo9dRX4i0kTYkxFkeL9EEeDl1dfIFFxCjJeDf5ANAkH57l
 wORDE5Abn8buDWluXSFNkvQCzzKLcu3OSWxV0k1XJkU9H8Xw9zw/8nY6bZ29ocapt9nePOyXVNu
 JFNml92U4B5lGQoSLlE7zsQaFy1pn+KUAaDSBkyWiNgvg3oI9delvhhW6XN2aBGhyzzfV1Q==
X-Gm-Gg: AZuq6aIFOgtf+MaykpKHiT28IMf5Phs3J6S5Dkos73Hy33nKL3dleyUUVPmNaxb+ub9
 N1VAkfx0W4hglzL9oHmwtA1WvOvfwM4/2JHUVHYkQTaJl6ceBTK2UsNMKl2Dd6IlYek0ME5Gnp3
 u4N3bvmdx4Hfgxn1y3x1T8HZYZ8R4ErI95NhqMeQXbTHDxQ7K++PL+d3ZeX+pA4lnO7+HuvB0Gj
 53bRAndeneY6nj+64xKPWliucrFOIgev36SGxWhHagGk/6DfoG666oI7nf+ZT0bUvWfdeI3j91l
 RfLl9Qfmjkv78XMA9Kw2aw/0Fkpf3qujb4FqAAtnWmm0WtfIOmMXO/8Vfa28OQ==
X-Received: by 2002:a05:600c:35cf:b0:47e:e952:86ca with SMTP id
 5b1f17b1804b1-4804c94550emr57737945e9.2.1769174932347; 
 Fri, 23 Jan 2026 05:28:52 -0800 (PST)
X-Received: by 2002:a05:600c:35cf:b0:47e:e952:86ca with SMTP id
 5b1f17b1804b1-4804c94550emr57737405e9.2.1769174931899; 
 Fri, 23 Jan 2026 05:28:51 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804dbe1fb8sm20935105e9.20.2026.01.23.05.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jan 2026 05:28:51 -0800 (PST)
Date: Fri, 23 Jan 2026 14:28:50 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>,
 Mike Rapoport <rppt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 07/10] arm64: tegra: Add VPR placeholder node on
 Tegra234
Message-ID: <20260123-slim-seal-of-luxury-bdb58b@houat>
References: <20260122161009.3865888-1-thierry.reding@kernel.org>
 <20260122161009.3865888-8-thierry.reding@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="cj5dkpv3cmq4mgtz"
Content-Disposition: inline
In-Reply-To: <20260122161009.3865888-8-thierry.reding@kernel.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[mripard@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linaro.org,kernel.org,collabora.com,arm.com,google.com,linux-foundation.org,redhat.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,kvack.org];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:akpm@linux-foundation.org,m:david@redhat.com,m:rppt@kernel.org,m:sumit.garg@kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-mm@kvack.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-0.755];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.0:email,nvidia.com:email]
X-Rspamd-Queue-Id: BB47F763FC
X-Rspamd-Action: no action


--cj5dkpv3cmq4mgtz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 07/10] arm64: tegra: Add VPR placeholder node on
 Tegra234
MIME-Version: 1.0

On Thu, Jan 22, 2026 at 05:10:06PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> This node contains two sets of properties, one for the case where the
> VPR is resizable (in which case the VPR region will be dynamically
> allocated at boot time) and another case where the VPR is fixed in size
> and initialized by early firmware.
>=20
> The firmware running on the device is responsible for updating the node
> with the real physical address for the fixed VPR case and remove the
> properties needed only for resizable VPR. Similarly, if the VPR is
> resizable, the firmware should remove the "reg" property since it is no
> longer needed.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 34 ++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra234.dtsi
> index 850c473235e3..62a5dfde9e38 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -29,6 +29,40 @@ aliases {
>  		i2c8 =3D &dp_aux_ch3_i2c;
>  	};
> =20
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		vpr: video-protection-region@0 {
> +			compatible =3D "nvidia,tegra-video-protection-region";

The heap name doesn't follow the documented convention, see
https://docs.kernel.org/userspace-api/dma-buf-heaps.html#naming-convention

--cj5dkpv3cmq4mgtz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaXN3kgAKCRAnX84Zoj2+
dgbuAYCUCaHUWqJPUhpJEcWkq2uLIaAHUBUCBbdSNPF5dpiFWDp+QSk3hILjtrCJ
0RNZRFsBfRAntBAG5/xlnModxB1enPz3Z9TuAC/80PaW7OVoKyjeBvgxqbNMjc+5
iM/+K++lbw==
=V4o/
-----END PGP SIGNATURE-----

--cj5dkpv3cmq4mgtz--

