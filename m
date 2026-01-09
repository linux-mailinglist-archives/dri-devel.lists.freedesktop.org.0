Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10481D0B3D3
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 17:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB37E10E905;
	Fri,  9 Jan 2026 16:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="iEYY6yDj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 311 seconds by postgrey-1.36 at gabe;
 Fri, 09 Jan 2026 16:29:23 UTC
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B82910E905;
 Fri,  9 Jan 2026 16:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1767976161; x=1768580961; i=markus.elfring@web.de;
 bh=2AcLpacMqxNiFXbwGlQLWsYnf0jSdTj8J0/TS+C/VFI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=iEYY6yDjCKNSyNG4UCtgeeRn31AxGR6hawUStB6RQ0gaQkOnBHcxJDAjsEIiZrjA
 IYhOXAYnQOz2obde3bbh5Qrx5waWjwMM/n9QvK6/FbSdAFwMUlN0veaX+IlXdn5w/
 Ajo58Bv6QeyCCakoxb/PrBF6Ggbu/bsR1xPouO96lv17MDeDq2PzlX4M9BN0EFIDE
 Ah4KHl/W8tN7ENUQb0rpIJlfqgUe+QaKyGI2ufErnq//FK8iLj7fR7vkncHILuxoo
 GXTYsfVOA6rLVPjJE4L3j400cHIs2AgQPvAnaQlAiSIVLJ2gkSkPqYyhTwBbcpUmG
 MRkQJP0OTc08yAz9iQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.182]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MxpmW-1w4JIx1a1O-016EMW; Fri, 09
 Jan 2026 17:23:57 +0100
Message-ID: <12cd71cb-4139-413e-918c-6245d5d4f10a@web.de>
Date: Fri, 9 Jan 2026 17:23:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, =?UTF-8?Q?Felix_K=C3=BChling?=
 <felix.kuehling@amd.com>, Oak Zeng <ozeng@amd.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260108071822.297364-1-lihaoxiang@isrc.iscas.ac.cn>
Subject: Re: [PATCH v3] drm/amdkfd: fix a memory leak in
 device_queue_manager_init()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260108071822.297364-1-lihaoxiang@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zq4yS7x360MSLhrC6qvVg7Q4jPN26r5yrSUVshzSqQHnIH1QDXZ
 eOZhOp20DgxDYYkuB68isJ06qsb0MZ7SFug4sGfkMYd8r+nTCTT9+2U5P+yOaWmqBB7CJyA
 rSXI3z5jmoN9TbTFUnMShEqo8mE3nuq1yIO8mJGK27rMsqGtaNCP54QsEU5SnjP+y49Vc+J
 G1AY38JFOVDOwxNxPwhbQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:M8p5TMkaCfg=;HSiruKusgHYzmpf1DSKykrfHn1K
 nzrzavaa33Gkz1O3ouj/GLEr0L5kYMMr1NBWe7+e4EwMVNotox3avA+7FVe6OmoTIVrCEm15Y
 BFO1NWvqLvJsSVhhNRm6cFeufx3Hj2OQfUZtq23f8l3igi9JeZW+GYuqH5JsUCgQcl2aRYPm+
 gwlp3t0E0mLee8veL5tw/MEKM3x77PP4sPkt/+7YQMV5VRovkp+FzzdR5C7Dz+kex5NG2o8Ng
 UMog4TsAcd95bQyLMKSjY8MpVRs5QoQujOOTa0XBzuCJwKux+sfjh6vB2F1SecIBxs1h0S1JD
 Zg5u/gVgxpPMX12WqyxgSaa1obu6rUty/yJno8Dh+/CjzNYenGH+vWfH8hoboLZzb+cr5mSWF
 NV3UuBTmIqWVctUjtUKYHJg4qZQNRCjlQmO+1Bmq1RNt1uhyxW7DnySjG/EWK/qcO+4BJFdxP
 uWPWnGEHzfJfkOw2FXseBMjwuRBxd+WhZURGb4vAU0LyfaYihN8SQvDjGjqUqo/Q//CwbB/0W
 lLCra45iid6TMe+17eVAbQh6fQeunnRcyR6fffDjWfXHHg06n7DqEYmwRV3FMSJyQ8z3/v/KN
 hetc9T7MYeHuGmD5fGYCfdEUNlWA0DsgiMU0O1FHs8MkM/+BYUYVAoqNR4pROsM1D+Iay1hpz
 LLj0O47pqHJOFOh17k0ugkPG7w8q75Z92888W7JO7zdVdxsDK+uNKKcNRQsE2WSvVSnbPG+d/
 8l2mwvydYI1ZGz+y6enFhIwa0dlqRxZoMBUOlt9GlWE3JFSwfToHZwxONu2ThdHv+pREZW0Ii
 TwAo88pBPQsiZbPkkCzzksDmqdFjNXaAjG2h+p8VG+c7aBqRCBRP4gBgtOViwfriPOoq6mn1x
 EXzZ3DeVFxfykpjHTuNd4f/40+rDV59sZOKYo4aw5EI823ufv9h4G+tjxdY2IV/4FaQWN+SrW
 4FtwDAsdoL/OEv5ibZ/gF/GwjQqeFyh/u3We/2pp1QJ9mFKazVXvIl31sjwRCPzy9D5h/X1HT
 BfHJM/hgULME6V++QacRVAmmbIgHqqAhyovtkzyBftQsyEXtovAo4ShgVgngT6B0eWjgh3eQY
 K9ZwrAcUexbPoAzgMFnb+IQhoP4J95RDt0vGb3qzDkIx/ayNKKBlxrA92nDamuf85jr0W9qXJ
 FxqtOyxC5ALdvV9wHq0Ew50fMsL2T2oj5KCLQagAOm3I3xQwBtNi4nD8VfEjBtZK+RjhFAtW5
 tuE0HS/ziDnpW8OSKahpFlOFpD7FXjS1yrNiZ8H1TfR+ZU3p++U3zGpL0d3Kcs0a59FC8oedh
 b4NX8BUkhGBSVcRooz6SGgxRuicfnFFivcqaMRUg1vNLuyndGmRZejCwqQHAD9D64+DmBNAnF
 Dp50y8O6alpioO2F/WRk48ssd7qTC+WmjIeFsBuZdcu90BQ/dFT+mjrXetMsZeF94yZ9VsJ+D
 ZTV5ke1GtqLDIgpteOibr3P3yU52Lu/gB9hHfI+T/9Gxyoo3ReDNcxEXlPbMrvZStbzb1aE7q
 xwkkeGdky8gOdGx+9UaaPtVEZcGSZcuM35eLaKAwvk33VgcMN2bADV5BArjpZXeIgD/ICHEj3
 EgoenKx44BwSoYDhM7oLxIK8Z1R8nADj036UVEAyIM4YaBh2kWsTqtqlr+1tbF3FjRP1eZuDQ
 YniBXDsCHC98PSiRTckYmlcVgl5CdCnXVxPFqE7AgWCN8oZ380etUAfQ3YZNgjnhzoNvafE8C
 SlC9rsbtgmRt+5AGJEYINFhA61LPCQSDqAnCS7vChv6Qs/v2rK6J2X+LR0Ao9xN5emXrh1ztu
 7kmLmSYo4oITgafB5nhu/vu5FyNICjOkTDD/UQwFB0v86wGQ1QxWtRPaNaFyV9BIyIWngxkMG
 gkro2jfPjTjQC40W+Gz1sS0rmSlhziHQKf5cC9j319uOCEQj53T1JdOMhf9vpG4GFmv5HgUi7
 53OawWkVyt7om0ZRXXvGa93SbLsZzRyMrVKMiQ+bD8+QrCfrsAD8jvzSH0WCK9Ej7SlkXlf9S
 quNCBA7jElkbRg8u9s8x/0OHuWyxqzH1nXDVUkH1Hmdv+68NFeMF9qZmDiMebDUH/bm6t/e5V
 z0IuNRGZZIpHkPBBzKNdjmyLaSki/1QzgYxK5uggbVqK4/3vtLjDPHDC8dRGbJcHfyVuhWHUX
 NY+c4PqHxFrF/7nAL6hy1CUo6M2XCP9QxVHOPGGz43LQgmg7mRrhJVeEVYCZ9usZv2Oyg0tol
 F7FmwSDwTDv07Swta9ytuJ/cNL4KUZUTE9Jvx/z+5/6s+eWYutpc6GHSFFWKe9Hx5e35ndrP5
 JocdclxpB2/RSpwPhMbVrC2OtSVBS4p/w4H/bQ/FWqnmHuA2gLnfoaX3GsOnBWAfK7qpamou6
 C6EfZODtZsyV4AyaL9pgOgmOXa35gX54+C17sS10h/l7qen7x5bawAF48KbsmBuRFN+DwyBry
 N4b5NMzcE7NWYFnADiS/8MTPmj/uOe9PgdoE9shaNFtomhdBbeqC6YutK8F5it8KbrvbXMZ4i
 gQTzNnXnvXpl2+jH3uC9l9Ma9nbS60To8BKlwLTEupweXcDoJs1FZLTY3geeoY+Qg3x/Qac9F
 Nc4QeWOBXkHsnDuaO+pVAci723oxDgKCWKToFTR+zXbYA3lqVefq+CcL8OEMEWtuwIu8PygqG
 71t2wOeYdkf/UsTNPVKjxox048nhYcwpWN6GZlqjyO/oEKo/ecPOjGD720X2hwwLpF8WRCwsF
 dXogEMgYW617jyce/AeO5ojsW4yjFChFqDtHFQ6PrHXnuNKjSzqxUvndy2eyIIAkdurRCjHSh
 FRIiUrGpHyo9qrAdxHX45hQ4c8ROgVaVeGF++Vwy29byKnt9oY8gKiJtLpjTywdVFdHeKppMs
 ZiQA8B2fxjsVvxQ23i0asM3LG0Shx2AA/5s9zLcDKFHMTcm6V/PcXOCaeLFg3IaV3uYd04cBQ
 vYKfSF0iDgoHEmeLZhRJ49cHLxHmBjpqlpMz6NpJcrjl/+2kgpEefRoRkReeXaLs0A4FJtwTA
 JETiv3pMAch3evGx+2B08aotSEss8G5AofwsSV63Zz6G2C1qEkiScjSQJl2LDUHCyb6Ivw/k8
 TD5q5NOEITjPQlEh+aEqWcKT7KkKqB4f1+UxyXLExzkkFwu7RbYAPJRgSEMNMaG1CW/S6eMVB
 8fnj0vjOE3AE+/vWTanwrnb/VOdrq12+QZmcosnEccFQn628x6yi/zfL+0JxKnVu+GoEqpuB8
 KE9ny6NuDK1uZGUNKO9zcdMiv2OARgDH4KNnjqWpFpsz+AZdR48vp+9YSTbjL+657HHBVAE1L
 N51qKn3m8t7G4uWVXkFd7KuX4LvPXGXRkQA9+qf+icEIjYjcIF7e96et7BfBaVnu+5sPNk1pY
 5vC1w9lKN2GBg+exg54P82M1OaKzMVvF3Vxq/c9w0uSEODbQI1laplwljH2OaqOs6x9ZdQ8EG
 anzhm2CMFJ5AgnWwI3/I1nA19YfugpypfyJf6QMjc3F5UpgAJFmEKLkO27gSmTKkwMYVoI5y2
 AI730NStSarqgyNpoFBectR/CaAyU+IILu9QAfMQgm7ju4ml4EdD5mVgfwfcXa2/czmOrnrW2
 QIIa5sDg/+02gsfdmb1LybBYMHZZb6SzMmQFa8jkLQmGMShu73N1L0YBXc6vMlxcKCA2l7jZn
 NADfzGWollawWdt/Gwi2OMhi+ttlUlLiN14bZZODMwuQLv/0hvfqg+QtSiWp83EI9xp+QgPQl
 ZZEJENpdMfFrPOpbn0wMUwV2Vl1hz8wQsTfDcu/08nRS3Tw8MZS7DWwHYbAY15ePAL6vyHC0q
 bpnf6ZIHYZk6cqmdc/FLLHlV7hVmRDRxE4FFCjEfmhUu90PUP8bWQh+CWphghMxB/L/HIOHbm
 DIgu9F6Cxfz7AgcXpSUczHcBN7HGgEW4cdPQKV1OtffgKXVdp9VHj1r/vi2PgjqphtRTF85s0
 s4unjpYhC3eCwpvdD7QHeGn81PuTh+CK/K+5IApSwtL3W2Kfd/kXm6z09cTvMjxoESpF9+7YN
 78g6HLDZbWSs7Sm9GucDSbYreB4z4p2PTQv0vJ155i/CdPgJEktAc3qRFOXVXpk/ijfP3KNWU
 F+/IU5NuUfGFet4d4SFhHYq9mKSOmYRW3B9YEUYgxRd47U8Mhnis9TN0219t6e1Da7UYWh86T
 51yCCZvekIzNts/bi28ZfL5UgYLLFoAiE3Rvl5lHWgCy4pT9Nbz6ste+7RSNYnvSFhAyCCZqh
 eIOGvJ7k1QHybS2fiSzQFEdRXkkfoIKFjYqEkhiKSKAmBt6kqhQww3kLtpopKlYLzbzU/jFVq
 HZxzkQKqZPYL7asjrc158Th1cgmOrWuU6AuvKvX89b+x4cLhX+QOFh37w2afiuk6GI0n2j7DO
 NCYD9Gpj3cz65r6fpr4M/Am0HRFA32TfBScQCTIsKnqiWAivbxYrMcYcU4+vsCekUkDDe03ND
 9g9oikN92SL/UE2Bj7P+SzIjJ8LxlAnRTMquzFrriFtdyY9x8degM/wO4Or7mEmK/BXxu894m
 b+KMK0DjZe5lMJT/Fm0ldTQa65ri19ql7GcgMcYxFhqco8fOKoFeNbiqdcAq6g1OUFyA9kUTb
 TD+IURmI6qAvhuifC0J6jOsPo/96n7OnacgIVGE/RvP2LvuXwtgQHPxB04QVNubU6SiQPBwf1
 ngky3WaLZB52WasjeN+sB31LdmfsrCoeXD7Jj1K7pT2TbebU0C2kGFCvPzdVfRQH23CkHhOma
 KcWVfbVs8rtZVB0M1K6hJLOHzE/z6mYvEYOlgnS6zEsa7EvwKwgWRrZjAUlh/ymbAoNK9GynA
 +PFvvY7AixR7y9fzBquf5rYCGt9g3unl/V7YdE0vMUIkDgGBHlFTQ9D194UdNB2LPkgwANpoM
 dPfGeHCWsDROVpFO9TFsFs4KuNMOoj5FuXhK1rbZUGw7qbz5z2q2rUab0vYznwmj93ZnZRjuG
 G2OwW5RjQawBO5iF0L4YeHcHHGU3EDz4jdJUIH1YcKsylx32/IUc2BxMg/En+CdoA8/WHxxKx
 zHFJY3X2AVeriLLnl03S8K9l5XNryMh5FOIGK+8Acd/iRXIrPX3Jmk1M2MjXa8ZCrMEge2KiG
 EbzqS+i7Wvpvh3PHybrp4y8Q1Dj3tw7WD7VU5m1jc8rvFMoDotrNllOwLLdSn8viLbC5bFiHq
 ZuDL8Qqg=
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
> Move deallocate_hiq_sdma_mqd() up to ensure proper function
> visibility at the point of use.
=E2=80=A6
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -2919,6 +2919,14 @@ static int allocate_hiq_sdma_mqd(struct device_qu=
eue_manager *dqm)
>  	return retval;
>  }
> =20
> +static void deallocate_hiq_sdma_mqd(struct kfd_node *dev,
> +				    struct kfd_mem_obj *mqd)
> +{
> +	WARN(!mqd, "No hiq sdma mqd trunk to free");

Can this macro call be omitted here?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv6.19-rc4#n1242


> +
> +	amdgpu_amdkfd_free_gtt_mem(dev->adev, &mqd->gtt_mem);
> +}
=E2=80=A6

Regards,
Markus
