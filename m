Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE74830CFC
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 19:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96BF10E7DC;
	Wed, 17 Jan 2024 18:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BF610E7DC
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 18:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1705517440; x=1706122240; i=markus.elfring@web.de;
 bh=gHbMmG9mjXr6MC8IitFnD6yZiJj8cwylv4XvI4+3y1o=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:
 In-Reply-To;
 b=mxCNEdNa3xyU8eOUI8WnAbdqGIaQ0cD0UwcPi/M0HbzsfNe7Ls7kgnPJ07HB5vEG
 z4BQRbUK18o39eF/MzT381dTPv0/CiU4V6M75zCpLMv7dVmRzId5c6rBFc3/Zm1Ua
 imM00XT3R5/YzL3erdLGow5aI/iTtLZng/awG5FiQ0a5M5MLLiaW4rqGdSiEr+n4c
 yWM4zh5EMmVBTF7iOxBoQ4gXlAyvXXXw4X2Wlg/FiQG16Xv6NZoVFRrJpQIGZLIwi
 7YqUReNd+DXQfz6VAOPR86viIcjmHecSZ8P0dF/OJdhWkWhKWUsAwAV/YwO6lSLE8
 fZ0b2vHp2FT54IRo/Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.84.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MrwsB-1qo4sM3Elp-00nmDL; Wed, 17
 Jan 2024 19:50:39 +0100
Message-ID: <9e390783-05c5-47fc-a0c6-b95e249fe691@web.de>
Date: Wed, 17 Jan 2024 19:50:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kunwu Chan <chentao@kylinos.cn>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20240116032732.65262-1-chentao@kylinos.cn>
Subject: Re: [PATCH] drm/msm/adreno: Add a null pointer check in
 zap_shader_load_mdt()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240116032732.65262-1-chentao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:64Yp8Il+v76dSKALZwOZTLIbWnWicuHh+tqzpvHzm0141/YUBpH
 uQkmmNuiA5pT2tJs3TAAtrvFgkgL1YzbBXndtL1dJL1KPXC9ozY6s5RMSMfVGwWMjw3zVvR
 LEN5+Lxf9bStpvYPOYFO2LznYZK33wtfOpyixYUuvpgZ0clb62hzD0jV9nW+mJlqzbGrswS
 A6BMYtJVPopfHBxUrGSog==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Q1U7tOoGFmc=;2qAZd1fwJ89oCNw5xB+ACGuHRN9
 OlKyRbV/lW8xNgPDwaGaaxGOq1xyBe69U/YdbBszFpCd3SNB9TqgA/eRUInsblCqA244SAUwt
 XPNu/4Xx5qHdunhEctjDVNdVJA/19AYCGlFXQfFiiJZXkB1z5OAXgl5Q0HfKubuhiVBWhL5A3
 +h8/JrGtj5aC0e7GXiXugiNJb6dWDYhaQQt1sJli1cItKY+kxxTaW7ToMzAba4+Hil7A6+cfz
 D3sYWSMde3F/uwa9X7YTHqqOFPzPzueWYJAVr3JnEd0h5yZh8QbdJemPvDxTXUUosrMuZENl1
 c1SxV9ztyPweI/zHprQ3rmZkXe9XjmrpvBYjMXhTxmLy2C0rGqA8ZAY+SrkEGuHxX/fR3pn7a
 Xk5QeesXmU0HgARQW7tsmJDstjvsJk2drLqeevRvX/Vx3Nrwf0Naq7rFR9CKIePee5qNVcieA
 h0xRtXgNKoMHNDmdYMTSp1bgZ6q/u3A1qR4+Edb8+et5vnAaHJhZEYxWKhwuAIlwcPAofi1D+
 rMkWsMW9nGd0U5Es3VGKeareSOnaM4GFHxQ/vzBsqVJUEsHEIHLKPU7K56BAnuojyUuyHCAtx
 KudzjxGpnS7Q+DJucVZKTokP52rozOXWY5SnWzH8GvC7cX1rwL7gBwyLSALGENnk4wTIsWya/
 cw+RG1/ZfLFYab8y+IgTWliHeMYDZfAcktCopcAUileHyE6PDJAIYYccTPxtx3r89YqLnAwrc
 yoeasqhXoAHRUGf1/xa4LcYacHEE7Wv8A+zkleHpfMJEHanb9hkDHMx5Un8XcXtRk19iaSUhZ
 QwERQcA7O8I2ol5pYwVRdBDhLungdrRqD3+ZNwW8iT13Nb8SWthxRRCr82wbIxrqwEZ2qlX+9
 GwcNwQUDOQO5k5ZTZapRo02I9RttueCCWvSGF8U6XM5I5fzRFwo3aZZ9k3u4NWJus9NYgQspw
 PABCvw==
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
Cc: LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> kasprintf() returns a pointer to dynamically allocated memory
> which can be NULL upon failure. Ensure the allocation was successful
> by checking the pointer validity.
=E2=80=A6
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -144,6 +144,10 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu,=
 const char *fwname,
>  		char *newname;
>
>  		newname =3D kasprintf(GFP_KERNEL, "qcom/%s", fwname);
> +		if (!newname) {
> +			ret =3D -ENOMEM;
> +			goto out;
> +		}
=E2=80=A6

How do you think about to avoid the repetition of the pointer check
for the variable =E2=80=9Cmem_region=E2=80=9D?
Can the usage of other labels become more appropriate?

Regards,
Markus
