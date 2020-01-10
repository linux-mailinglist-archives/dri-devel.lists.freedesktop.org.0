Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AF6138676
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 13:37:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B58B6E54C;
	Sun, 12 Jan 2020 12:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC756E0F4;
 Fri, 10 Jan 2020 22:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v/oMpQqOxK9kH1C93I2E3/nTCjV+yu7FF8VfHPbRm1Q=; b=YbawNK1Xqe3DFvQIUQVTDDtC1
 At38Guim3/y8dntDG8Lkbg4G0fKyB0pmF9yd+FWk0QSvT0dB1j8oea0iAEEHxtiaRN5HsHn0qu7IL
 3SCldnaqdoAZPvLDQ01Pra3Bd/iKt7ScxDih2/ILfsQL3kOvJ8ZOZmtg+TpTSMTPH9sjJU1za6jsR
 jNztcVnHqCoO5IqcRylGG8rg6l7NQeztAkeKPWd9gCNoYSrzkAreGoz6XS1oU8svmjP+dPgCOCRKx
 GLGbmo7XKOAxb4UNemwhjCpzKKPnQu66snWCp02YjUF4DRvhinBNdcHaPDUoai9Rl688NUtXMUgUa
 ENu5IDIig==;
Received: from [2601:1c0:6280:3f0::ed68]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iq38k-0001FH-Lu; Fri, 10 Jan 2020 22:52:26 +0000
Subject: Re: [PATCH] drm/amd/display: Fix compilation warnings on i386
To: mikita.lipski@amd.com, Alexander.Deucher@amd.com,
 amd-gfx@lists.freedesktop.org
References: <20200110194123.3718-1-mikita.lipski@amd.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <dec1ce40-ccd3-7c5d-3e7b-b03eaab24331@infradead.org>
Date: Fri, 10 Jan 2020 14:52:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200110194123.3718-1-mikita.lipski@amd.com>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 12 Jan 2020 12:36:09 +0000
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/10/20 11:41 AM, mikita.lipski@amd.com wrote:
> From: Mikita Lipski <mikita.lipski@amd.com>
> 
> [why]
> Compilation error "undefined reference to `__udivdi3'" was
> thrown on i386 architecture.
> 
> [how]
> Use div_u64 for unsigned long division instead of a divide operator.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 5a476028ee37..52fb207393ef 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -533,7 +533,7 @@ static int kbps_to_peak_pbn(int kbps)
>  	u64 peak_kbps = kbps;
>  
>  	peak_kbps *= 1006;
> -	peak_kbps /= 1000;
> +	peak_kbps = div_u64(peak_kbps, 1000);
>  	return (int) DIV_ROUND_UP(peak_kbps * 64, (54 * 8 * 1000));
>  }
>  
> @@ -565,7 +565,7 @@ static int bpp_x16_from_pbn(struct dsc_mst_fairness_params param, int pbn)
>  	struct dc_dsc_config dsc_config;
>  	u64 kbps;
>  
> -	kbps = (u64)pbn * 994 * 8 * 54 / 64;
> +	kbps = div_u64((u64)pbn * 994 * 8 * 54, 64);
>  	dc_dsc_compute_config(
>  			param.sink->ctx->dc->res_pool->dscs[0],
>  			&param.sink->sink_dsc_caps.dsc_dec_caps,
> 

Still getting this in a different function:

ld: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.o: in function `compute_mst_dsc_configs_for_link':
amdgpu_dm_mst_types.c:(.text+0x7b8): undefined reference to `__udivdi3'
ld: amdgpu_dm_mst_types.c:(.text+0x956): undefined reference to `__udivdi3'
ld: amdgpu_dm_mst_types.c:(.text+0xa24): undefined reference to `__udivdi3'
ld: amdgpu_dm_mst_types.c:(.text+0xb33): undefined reference to `__udivdi3'
ld: amdgpu_dm_mst_types.c:(.text+0x1028): undefined reference to `__udivdi3'
ld: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.o:amdgpu_dm_mst_types.c:(.text+0x1142): more undefined references to `__udivdi3' follow


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
