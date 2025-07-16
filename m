Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D12B07DAB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 21:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B28510E3C1;
	Wed, 16 Jul 2025 19:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VZznVnO1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8081B10E3C1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 19:31:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C184E601CF;
 Wed, 16 Jul 2025 19:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D602C4CEE7;
 Wed, 16 Jul 2025 19:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752694311;
 bh=eBe8s1XgfnGkHifuAa5Fbx70CJfHUg3nJuCjIt3mEik=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VZznVnO1NqAzTOARXAeGzxBt8qYlSfVcjMxU4BCDgN/H8bk74cjMjfsu43DVCzozh
 UQapc7Vw0Nr16SZf23tE2ntBY4npTEmAci30pMTX9Vto584FzSjNsD1fg6Kq442fiU
 DqAU52F/jaNHnpP+Uxw1zAehZjT2+RwSMec9lRduWjPVfzCGU0wds1ruzVHCakSnNx
 1HjZw4Dz0dqyM7I+Do3QhC5XTz7G7NVPdRdjY1D3VdR8rmqLTQ+fAp/2/U0ai1i4Yh
 WTpAtsWUGVHzZaiPwz/y1BqINqBr1e0D91dmkdySRTjtdktHkLEO1cxM8aUty2Vf6t
 pHQ0iSk4IVYhw==
Date: Wed, 16 Jul 2025 14:31:48 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, quic_kuiw@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/4] misc: fastrpc: add support for gdsp remoteproc
Message-ID: <qg7uvhr2pazrjqrqyraj7pr3hxbzadhenbkps7q4uqhilao2o2@653xyxcx2iak>
References: <20250714054133.3769967-1-quic_lxu5@quicinc.com>
 <20250714054133.3769967-5-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714054133.3769967-5-quic_lxu5@quicinc.com>
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

On Mon, Jul 14, 2025 at 11:11:33AM +0530, Ling Xu wrote:
> Some platforms (like sa8775p) feature one or more GPDSPs (General
> Purpose DSPs). Similar to other kinds of Hexagon DSPs, they provide
> a FastRPC implementation, allowing code execution in both signed and
> unsigned protection domains. Extend the checks to allow domain names
> starting with "gdsp" (possibly followed by an index).
> 

This was called cdsp1 before patch 3 where you removed it and now the
same id is introduced but this time with the name GDSP.

Iirc there was a cdsp1 in SA8295P/SA8540P, are you silently dropping
support for that here? Or perhaps just renaming it?

Regards,
Bjorn

> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 85b6eb16b616..d05969de406e 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -27,6 +27,7 @@
>  #define MDSP_DOMAIN_ID (1)
>  #define SDSP_DOMAIN_ID (2)
>  #define CDSP_DOMAIN_ID (3)
> +#define GDSP_DOMAIN_ID (4)
>  #define FASTRPC_MAX_SESSIONS	14
>  #define FASTRPC_MAX_VMIDS	16
>  #define FASTRPC_ALIGN		128
> @@ -2249,6 +2250,8 @@ static int fastrpc_get_domain_id(const char *domain)
>  		return MDSP_DOMAIN_ID;
>  	else if (!strncmp(domain, "sdsp", 4))
>  		return SDSP_DOMAIN_ID;
> +	else if (!strncmp(domain, "gdsp", 4))
> +		return GDSP_DOMAIN_ID;
>  
>  	return -EINVAL;
>  }
> @@ -2323,13 +2326,14 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	case ADSP_DOMAIN_ID:
>  	case MDSP_DOMAIN_ID:
>  	case SDSP_DOMAIN_ID:
> -		/* Unsigned PD offloading is only supported on CDSP */
> +		/* Unsigned PD offloading is only supported on CDSP and GDSP */
>  		data->unsigned_support = false;
>  		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
>  		if (err)
>  			goto err_free_data;
>  		break;
>  	case CDSP_DOMAIN_ID:
> +	case GDSP_DOMAIN_ID:
>  		data->unsigned_support = true;
>  		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
>  		err = fastrpc_device_register(rdev, data, true, domain);
> -- 
> 2.34.1
> 
