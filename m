Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D339B52E3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 20:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D3610E060;
	Tue, 29 Oct 2024 19:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="ifqK9fbw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB9310E060
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 19:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1730231022; x=1730835822; i=markus.elfring@web.de;
 bh=KVa6sUoEsISVLJqp9YsSnJ2+WbranhY7bY8+FHwY44g=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ifqK9fbwLK+gLHsYeyU+P71H8xovjIwRv5UnNrmBicB/c75bIIpIGHn+X7To7evM
 iHIgLH4jzH/tx0zHyX1bHV8W4Z51AYsQW0SOMyEBlsqYb+E3IXeBhAepZKLLh9DCp
 H73Sl46AYzEJRLhdszUuqEXpYp89yiRKhp7ed1dXImHoWfKsof20jz8EolYD9cPb+
 yjukjxUVDVA5juNr5j4WQeePGlyDPGr7cPiMrWLJaQv6TkLZrAEUdqs++V900HGLJ
 TfXVXzKC6wch3RflUet2lQ6+rHcBCm3TBt01uvl0lFSXxi0WyV2oEzisoGOwkLm2f
 sOmvd4Jse6g3xqp3dA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MNORC-1tUf2q1qyA-00QntE; Tue, 29
 Oct 2024 20:43:42 +0100
Message-ID: <58a77f5d-74a1-4ea2-942e-a352f30f66bd@web.de>
Date: Tue, 29 Oct 2024 20:43:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Li Huafei <lihuafei1@huawei.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 David Airlie <airlied@gmail.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: LKML <linux-kernel@vger.kernel.org>, Hawking Zhang
 <Hawking.Zhang@amd.com>, Le Ma <le.ma@amd.com>, Likun Gao
 <Likun.Gao@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 Pratap Nirujogi <Pratap.Nirujogi@amd.com>, Tim Huang <Tim.Huang@amd.com>,
 Victor Lu <victorchengchi.lu@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Yifan Zhang <yifan1.zhang@amd.com>
References: <20241029202758.2764535-1-lihuafei1@huawei.com>
Subject: Re: [PATCH v3] drm/amdgpu: Fix the memory allocation issue in
 amdgpu_discovery_get_nps_info()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241029202758.2764535-1-lihuafei1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1eb1mV/sniekV3cSxKRVEOdxvIGkwE3QOfs5C6TbZLC6LbNAORa
 npSbXL1ta54UfT/tJNlaAU7eceDkl2BOSVQszkTX0QzOpY299Uejg0csBbz9Q9oarjvZILm
 rg/OpEwzNhIyXbR4DJtJcYZ/2Pk+RT06aTl8wbqtFMpq2q+bEN8ic49EbISdHBrrzwB83L0
 1ftm2HB80Bxp2+nVLxT2g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:A3tpIWfB9Jo=;Bwm5NKtzLxrKjtJICunaYKav7OO
 kYF2ea69SdM85f5S/D3XirydhUz2+YVfvNksB/WN8hJFpOBojftb2xA/SYQxa7t7QX98vAM0t
 GjkKU5YN/zoCC4Hs7qA4uBRIcVpNMlx57tWSLYmfd6gYp5hj0h/a1kD2La/7GuALLq7YUCXg1
 qJEiootAC1Hh5UVt7zxv7Om2xrr1DPdIP+lqJrO5GYTFsURORQ1qyKXfMOclw+57KHkVwHfT8
 mXEw37TN/NSs4EsCOpYgwg35Megj8cefm8hlkgRfwkbphU6wjpj9b6y0v9T2tcNtmA6NfJlg3
 TCZmljQtIqTLhU/jK+x0vPGN55bXOpx8CJG8tZZB7zfHjADBckW2vVIzm3zRpEZRmGTkiwfmn
 G68BDiqabygifX5gLrgJiebRjcsG4pmUp9CeREsDqOFDECCXG+WF7dyUk8Ia8aKQ5HChDMzlT
 Rzi7mTj3jBwUAj3qUrj0/obqgRgws2PQQTpqIOJyjKvzSYCZmR/EVjmhsG8WC6mGQsvm+omB7
 D2W9Qa15FyK58c0h7Fr2nYrAW95h6QLSIOrIBlLQ3CTqQlRBgs+ftgsJi/2nmHSsqEe2OcXzQ
 fydWniwO3RH1U8F2qZWEWQhpYqKE4wCnAxSeKl2sctl9gvxO8eYQM0IcIOeoI5CGRNBmHp6+f
 03Bi9r5tGgCZ+WEYkXb9N4oUkIjvgGVWcC101kHz4H2HHuFzoUcY1JWa8ysXPHkZxAVrU6JK/
 65oXIv2m2vI11LtfT2JrDEjIikPio1zduizOfUJI9YSR/M68XV1qIeZlAG+kAhkJFUKGEhI+Z
 GF8/UmMKyJFh8p7oYlXydypw==
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

=E2=80=A6
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -1757,11 +1757,13 @@ int amdgpu_discovery_get_nps_info(struct amdgpu_=
device *adev,
>
>  	switch (le16_to_cpu(nps_info->v1.header.version_major)) {
>  	case 1:
> +		mem_ranges =3D kvcalloc(nps_info->v1.count,
> +				      sizeof(struct amdgpu_gmc_memrange),
> +				      GFP_KERNEL);
=E2=80=A6

Can the specification =E2=80=9Csizeof(*mem_ranges)=E2=80=9D be more approp=
riate here?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv6.12-rc5#n941

Regards,
Markus
