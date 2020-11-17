Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF772B5B56
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 09:52:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E816E161;
	Tue, 17 Nov 2020 08:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276236E155
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 08:52:04 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c17so22290559wrc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 00:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pGfq+HTj2b7jAvETFhtsrMFBaNIHXs1Y5DjrMJw6Tkg=;
 b=FfxQHpuaM5aAo6KrBFWUZi2mQNH+pfyZFss9j0JeOveWZ7+OG8cUJDwzfownPeiIAq
 IKvd+nEpR8IdMMknY5ldAYDDbNGW1CMggnf4t2QGpZ6Wzp94TDmRD1I9Dx+mG0n1hPv8
 ZG1tQm3LE6Dm3OuZZe7hGA/TulPS4AiHa93+0zmxZ6ceEV7zjU/wRuKavOKc0x5EzoSg
 lhQWT7nv0GnO+B2omlr88qeoK1wAXCx9oKYLTEAweakdhbojbG3KWc8O0QKTBEySN2Z0
 5LYxYlc02IjM8DsEfN3Gog95Uf4hiN3jLFQmVfeAN0b3feOqPPtlK2/llQVvIu62ZwHm
 ne7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=pGfq+HTj2b7jAvETFhtsrMFBaNIHXs1Y5DjrMJw6Tkg=;
 b=Cl4cLgoInzAmr/o84+AGr50YktX6KlIfM6Vvzcb0t0iXgXrkU33WaiKalvMT+YZ14O
 T3tM5qPedyJ5LFxSymBPaEbMzCyY3uNB8IWHDqHBQBzp4h/PO/uisMZW45uTTbtqnUM7
 PqSi48Dqw8/Ka03Cr1pnWJzdybMVRr29vGFZF1mHcxEhxd2WqL0qOHS+fiqQLgpyTFB0
 DcigA0mWSYMXkfN5oZ0SLsLnGk03mUJQGP2zYX6vUEUPlRxF1/PVKQzyOim6LAodWOE0
 PlBkm7Q20ngZhNIEFTlHthd/VvPjQb5Yy4tUXv+eetLtI1zTsA07Vt5Cs1dbgHffF4So
 jkkw==
X-Gm-Message-State: AOAM533RGm6/z1AB2q4Mzr2hNXWdb7Km0/RsyPLLD4A9xVfa1UECSVGD
 CQx83l9TOzTK8r1PC9iSD99/lA==
X-Google-Smtp-Source: ABdhPJxCaSHbBBy3cZ1v4p2s2l1c5tPox6rdISBkCO7PmsVyZvmBo5G1y6F3FEIqeqeR1yrGUpDHqQ==
X-Received: by 2002:a5d:4703:: with SMTP id y3mr24342048wrq.416.1605603122631; 
 Tue, 17 Nov 2020 00:52:02 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:1561:9f4b:5829:8e26?
 ([2a01:e35:2ec0:82b0:1561:9f4b:5829:8e26])
 by smtp.gmail.com with ESMTPSA id 18sm2458646wmo.3.2020.11.17.00.51.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 00:52:01 -0800 (PST)
Subject: Re: [PATCH 1/4] drm/meson: Free RDMA resources after tearing down DRM
To: Marc Zyngier <maz@kernel.org>, Kevin Hilman <khilman@baylibre.com>
References: <20201116200744.495826-1-maz@kernel.org>
 <20201116200744.495826-2-maz@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 mQENBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAG0KE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT6JATsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIW5AQ0ETVkGzwEIALyKDN/O
 GURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYpQTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXM
 coJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hi
 SvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY4yG6xI99NIPEVE9lNBXBKIlewIyVlkOa
 YvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoMMtsyw18YoX9BqMFInxqYQQ3j/HpVgTSv
 mo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUXoUk33HEAEQEAAYkBHwQYAQIACQUCTVkG
 zwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfnM7IbRuiSZS1unlySUVYu3SD6YBYnNi3G
 5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa33eDIHu/zr1HMKErm+2SD6PO9umRef8V8
 2o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCSKmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+
 RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJ
 C3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTTQbM0WUIBIcGmq38+OgUsMYu4NzLu7uZF
 Acmp6h8guQINBFYnf6QBEADQ+wBYa+X2n/xIQz/RUoGHf84Jm+yTqRT43t7sO48/cBW9vAn9
 GNwnJ3HRJWKATW0ZXrCr40ES/JqM1fUTfiFDB3VMdWpEfwOAT1zXS+0rX8yljgsWR1UvqyEP
 3xN0M/40Zk+rdmZKaZS8VQaXbveaiWMEmY7sBV3QvgOzB7UF2It1HwoCon5Y+PvyE3CguhBd
 9iq5iEampkMIkbA3FFCpQFI5Ai3BywkLzbA3ZtnMXR8Qt9gFZtyXvFQrB+/6hDzEPnBGZOOx
 zkd/iIX59SxBuS38LMlhPPycbFNmtauOC0DNpXCv9ACgC9tFw3exER/xQgSpDVc4vrL2Cacr
 wmQp1k9E0W+9pk/l8S1jcHx03hgCxPtQLOIyEu9iIJb27TjcXNjiInd7Uea195NldIrndD+x
 58/yU3X70qVY+eWbqzpdlwF1KRm6uV0ZOQhEhbi0FfKKgsYFgBIBchGqSOBsCbL35f9hK/JC
 6LnGDtSHeJs+jd9/qJj4WqF3x8i0sncQ/gszSajdhnWrxraG3b7/9ldMLpKo/OoihfLaCxtv
 xYmtw8TGhlMaiOxjDrohmY1z7f3rf6njskoIXUO0nabun1nPAiV1dpjleg60s3OmVQeEpr3a
 K7gR1ljkemJzM9NUoRROPaT7nMlNYQL+IwuthJd6XQqwzp1jRTGG26J97wARAQABiQM+BBgB
 AgAJBQJWJ3+kAhsCAikJEBaat7Gkz/iuwV0gBBkBAgAGBQJWJ3+kAAoJEHfc29rIyEnRk6MQ
 AJDo0nxsadLpYB26FALZsWlN74rnFXth5dQVQ7SkipmyFWZhFL8fQ9OiIoxWhM6rSg9+C1w+
 n45eByMg2b8H3mmQmyWztdI95OxSREKwbaXVapCcZnv52JRjlc3DoiiHqTZML5x1Z7lQ1T3F
 8o9sKrbFO1WQw1+Nc91+MU0MGN0jtfZ0Tvn/ouEZrSXCE4K3oDGtj3AdC764yZVq6CPigCgs
 6Ex80k6QlzCdVP3RKsnPO2xQXXPgyJPJlpD8bHHHW7OLfoR9DaBNympfcbQJeekQrTvyoASw
 EOTPKE6CVWrcQIztUp0WFTdRGgMK0cZB3Xfe6sOp24PQTHAKGtjTHNP/THomkH24Fum9K3iM
 /4Wh4V2eqGEgpdeSp5K+LdaNyNgaqzMOtt4HYk86LYLSHfFXywdlbGrY9+TqiJ+ZVW4trmui
 NIJCOku8SYansq34QzYM0x3UFRwff+45zNBEVzctSnremg1mVgrzOfXU8rt+4N1b2MxorPF8
 619aCwVP7U16qNSBaqiAJr4e5SNEnoAq18+1Gp8QsFG0ARY8xp+qaKBByWES7lRi3QbqAKZf
 yOHS6gmYo9gBmuAhc65/VtHMJtxwjpUeN4Bcs9HUpDMDVHdfeRa73wM+wY5potfQ5zkSp0Jp
 bxnv/cRBH6+c43stTffprd//4Hgz+nJcCgZKtCYIAPkUxABC85ID2CidzbraErVACmRoizhT
 KR2OiqSLW2x4xdmSiFNcIWkWJB6Qdri0Fzs2dHe8etD1HYaht1ZhZ810s7QOL7JwypO8dscN
 KTEkyoTGn6cWj0CX+PeP4xp8AR8ot4d0BhtUY34UPzjE1/xyrQFAdnLd0PP4wXxdIUuRs0+n
 WLY9Aou/vC1LAdlaGsoTVzJ2gX4fkKQIWhX0WVk41BSFeDKQ3RQ2pnuzwedLO94Bf6X0G48O
 VsbXrP9BZ6snXyHfebPnno/te5XRqZTL9aJOytB/1iUna+1MAwBxGFPvqeEUUyT+gx1l3Acl
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <1cdb7832-f400-8a11-210a-0cf33be76039@baylibre.com>
Date: Tue, 17 Nov 2020 09:51:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116200744.495826-2-maz@kernel.org>
Content-Language: en-US
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/11/2020 21:07, Marc Zyngier wrote:
> Removing the meson DRM module results in the following splat:
> 
> [ 2179.451346] Hardware name:  , BIOS 2021.01-rc2-00012-gde865f7ee1 11/16/2020
> [ 2179.458316] Workqueue: events drm_mode_rmfb_work_fn [drm]
> [ 2179.463597] pstate: 80c00009 (Nzcv daif +PAN +UAO -TCO BTYPE=--)
> [ 2179.469558] pc : meson_rdma_writel_sync+0x44/0xb0 [meson_drm]
> [ 2179.475243] lr : meson_g12a_afbcd_reset+0x34/0x60 [meson_drm]
> [ 2179.480930] sp : ffffffc01212bb70
> [ 2179.484207] x29: ffffffc01212bb70 x28: ffffff8044f66f00
> [ 2179.489469] x27: ffffff8045b13800 x26: 0000000000000001
> [ 2179.494730] x25: 0000000000000000 x24: 0000000000000001
> [ 2179.499991] x23: 0000000000000000 x22: 0000000000000000
> [ 2179.505252] x21: 0000000000280000 x20: 0000000000001a01
> [ 2179.510513] x19: ffffff8046029480 x18: 0000000000000000
> [ 2179.515775] x17: 0000000000000000 x16: 0000000000000000
> [ 2179.521036] x15: 0000000000000000 x14: 0000000000000000
> [ 2179.526297] x13: 0040000000000326 x12: 0309030303260300
> [ 2179.531558] x11: 03000000054004a0 x10: 0418054004000400
> [ 2179.536820] x9 : ffffffc008fe4914 x8 : ffffff8040a1adc0
> [ 2179.542081] x7 : 0000000000000000 x6 : ffffff8042aa0080
> [ 2179.547342] x5 : ffffff8044f66f00 x4 : ffffffc008fe5bc8
> [ 2179.552603] x3 : 0000000000010101 x2 : 0000000000000001
> [ 2179.557865] x1 : 0000000000000000 x0 : 0000000000000000
> [ 2179.563127] Call trace:
> [ 2179.565548]  meson_rdma_writel_sync+0x44/0xb0 [meson_drm]
> [ 2179.570894]  meson_g12a_afbcd_reset+0x34/0x60 [meson_drm]
> [ 2179.576241]  meson_plane_atomic_disable+0x38/0xb0 [meson_drm]
> [ 2179.581966]  drm_atomic_helper_commit_planes+0x1e0/0x21c [drm_kms_helper]
> [ 2179.588684]  drm_atomic_helper_commit_tail_rpm+0x68/0xb0 [drm_kms_helper]
> [ 2179.595410]  commit_tail+0xac/0x190 [drm_kms_helper]
> [ 2179.600326]  drm_atomic_helper_commit+0x16c/0x390 [drm_kms_helper]
> [ 2179.606484]  drm_atomic_commit+0x58/0x70 [drm]
> [ 2179.610880]  drm_framebuffer_remove+0x398/0x434 [drm]
> [ 2179.615881]  drm_mode_rmfb_work_fn+0x68/0x8c [drm]
> [ 2179.620575]  process_one_work+0x1cc/0x49c
> [ 2179.624538]  worker_thread+0x200/0x444
> [ 2179.628246]  kthread+0x14c/0x160
> [ 2179.631439]  ret_from_fork+0x10/0x38
> 
> caused by the fact that the RDMA buffer has already been freed,
> resulting in meson_rdma_writel_sync() getting a NULL pointer.
> 
> Move the afbcd reset and meson_rdma_free calls after the DRM
> unregistration is complete so that the teardown can safely complete.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Fixes: d1b5e41e13a7 ("drm/meson: Add AFBCD module driver")

> ---
>  drivers/gpu/drm/meson/meson_drv.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 8b9c8dd788c4..324fa489f1c4 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -389,15 +389,15 @@ static void meson_drv_unbind(struct device *dev)
>  		meson_canvas_free(priv->canvas, priv->canvas_id_vd1_2);
>  	}
>  
> -	if (priv->afbcd.ops) {
> -		priv->afbcd.ops->reset(priv);
> -		meson_rdma_free(priv);
> -	}
> -
>  	drm_dev_unregister(drm);
>  	drm_irq_uninstall(drm);
>  	drm_kms_helper_poll_fini(drm);
>  	drm_dev_put(drm);
> +
> +	if (priv->afbcd.ops) {
> +		priv->afbcd.ops->reset(priv);
> +		meson_rdma_free(priv);
> +	}
>  }
>  
>  static const struct component_master_ops meson_drv_master_ops = {
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
