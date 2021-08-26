Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7F83F86DF
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 14:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E356E81A;
	Thu, 26 Aug 2021 12:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78BD6E817;
 Thu, 26 Aug 2021 12:00:23 +0000 (UTC)
Received: by mail-ua1-x932.google.com with SMTP id x6so1444972uai.11;
 Thu, 26 Aug 2021 05:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7O0DpguIfoMFlxHqLUWJcj/zKxfzY71EH7i8rv1D3jM=;
 b=UPIWWCc3Tgmw7T2W/FDsjR9keI/qso5JVl47AA6Vr5baocfErrUVusQx9J882G8UfZ
 1M+YVhbL73kGPzXqqX9OHhCZRwzsPP1bv+BkG3rrQGtJZaaNfYJD/fFaIhjHGyG62RLW
 DFFBmJHV4Bv/xAMVBDwaA4xtwTS/zzBBTUbCig2BazKQmJcI/m3scUAbB6iT0xeDBM4f
 rBN2/fqLjPw+ptPUbr4cU52IV55teUjzqgqpcKMkS5yjeiaIzcRvQHCcCw6g0HnzhWuB
 NA3vQRpCaok8us/aPnitC+xLyVTt2WqKYBHqTJZflu3O6rJ880q8V9WV1Rqc+LT1pyar
 X+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7O0DpguIfoMFlxHqLUWJcj/zKxfzY71EH7i8rv1D3jM=;
 b=n4DrSCzlLyl3sCwePq2FlRkTiu+lqkQB9U2+/oXzLDdSZgrTGf2v3w5pamp84XfVPN
 Cd0aN/q64udmSttYxQkpAMpKyn81AYILI9erKHlndGlNgE4erN1GRLTgPMGPqvNjs+f8
 adAV9YrtHINsMWGflrRr6RsNYeLLdJUHilq0B3Ux5r9ZnpGSBWK1Tjm3xjHyTcxSY09I
 MuIpI9lGvt2+B6Cplhwx/nGpw02SS63TXCt97y2MfVz6UzQh5qzknUhVaEj4LoNG32IB
 Or8L4PVEShj3zpRovA0pCaKa6Y90QQHT8bZSB1oH5kuJp4XHXH2AeY/nnroxeWPR1fNa
 bI/w==
X-Gm-Message-State: AOAM531vZZeFfXJgNuy1xHJvkm0SADK6aCtO2BUC40sNgNgaIXys7SUT
 Dkv5btcr/NVZbQL69fVicGbVYkqStH3YtjdiP4i/esQWcGHIKw==
X-Google-Smtp-Source: ABdhPJzgqBa6dEqf72uMhuFSX5dYEZDZ4Ss1VzPSh4nm1mqs5t9T5Jv3xolvd54j3Vrh6Xv+FldyZznO8+8gN6TZVXA=
X-Received: by 2002:ab0:734f:: with SMTP id k15mr1744820uap.138.1629979222950; 
 Thu, 26 Aug 2021 05:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210820201830.2005563-1-l.stach@pengutronix.de>
 <20210820201830.2005563-8-l.stach@pengutronix.de>
In-Reply-To: <20210820201830.2005563-8-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 26 Aug 2021 14:00:11 +0200
Message-ID: <CAH9NwWcV7-bk44Ux4nLgDggDMTK5pd09OfbAXpjUx7g7OE12hA@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/etnaviv: add missing MMU context put when reaping
 MMU mapping
To: Lucas Stach <l.stach@pengutronix.de>
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>, 
 DRI mailing list <dri-devel@lists.freedesktop.org>, 
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Sascha Hauer <kernel@pengutronix.de>, patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
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

Am Fr., 20. Aug. 2021 um 22:18 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
>
> When we forcefully evict a mapping from the the address space and thus the
> MMU context, the MMU context is leaked, as the mapping no longer points to
> it, so it doesn't get freed when the GEM object is destroyed. Add the
> mssing context put to fix the leak.
>
> Cc: stable@vger.kernel.org # 5.4
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Tested-by: Michael Walle <michael@walle.cc>

Series is:
Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> index dab1b58006d8..9fb1a2aadbcb 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> @@ -199,6 +199,7 @@ static int etnaviv_iommu_find_iova(struct etnaviv_iommu_context *context,
>                  */
>                 list_for_each_entry_safe(m, n, &list, scan_node) {
>                         etnaviv_iommu_remove_mapping(context, m);
> +                       etnaviv_iommu_context_put(m->context);
>                         m->context = NULL;
>                         list_del_init(&m->mmu_node);
>                         list_del_init(&m->scan_node);
> --
> 2.30.2
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
