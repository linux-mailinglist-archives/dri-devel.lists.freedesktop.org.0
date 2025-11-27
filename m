Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5526C8D52A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 09:23:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE8210E79D;
	Thu, 27 Nov 2025 08:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="C9z0lRkm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9EE10E79E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 08:23:07 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-297d4a56f97so9208615ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 00:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764231787; x=1764836587; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=w6hBnm1WTlzOV43F8Rg8NMwBpW3sVO5XoameZRwTC+k=;
 b=C9z0lRkmU7O5OKy3xTjVIjtJWPPl8K/m/0NYwDBDhNqDW2QqQK7tBGViDrXRfqlTl4
 DbwKUATFuqIDAhs4t5IxZp5ZqZ86mGrmCFhzsUX6dAMU+QhdgE5FzwA3LudjWKweem6H
 1Amcm+IFRxpEPXi8Zk3BFx5zy5ow37uWk4jcE2GLWo+7/shBUdZiAr4V56JOeL/lnsss
 Sm9v1ZK31V65E/XDgL6+9hmUSD2j93Duv2kSkABGFT4jL4p9PUd6Gf8tLJ2CnT54BTlj
 DWpBHQzGjBkwyndPd2DVaFXNpO5IA5zFuL+pXF9rx8HStRUjorgw69yy5nSXD+hAKr2v
 fGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764231787; x=1764836587;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w6hBnm1WTlzOV43F8Rg8NMwBpW3sVO5XoameZRwTC+k=;
 b=QRq1wYNB+FHa4/o0dmW2/Gp8xBXHcSWwOYEjN4jrSfgs52N8StffxZ28jgu57DKpYV
 1KUij/1TDC7OahOESqSYI9Nnx2x4jAaa0Wuk0O+W+e22EcfMWeY0euH0LhLsjeVLj5eW
 piV2NCu4X9tZpEYd9+duKOLj3wixRlM+NXH4lKHAfl4mzx7CbmiYwRks2TgwVspqEdlq
 +hJr7ENqybJCiLp4xuQzTK0clM1x55z12KfcozEu6uCNza8BCo5QWUoTAT1Iz6Ns4Zgw
 tHTQ7p/XGcI0UNnQiZA3Rw2HQbu8DGmeDxnYb6jSZu8j+mocTZnrhdxts5SJlCyTU0ZO
 MiuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFB1yC/azmMzw+X2k4aA9TnjJqFCVs0XI1whhdXeLEUkvHE2894gTZeumRsGBt2/B40wWebcFXLTs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLU5ypLwcnwQkXw3V/lG/FKPcBHwWXE4reRstlIVkHinkL2gUa
 9hoQY6y3u5k66oxGFknrLdtDsAhR+nR/dc3eRm8btf3SGTpyMcRnodquuRUTeS+H4Qs=
X-Gm-Gg: ASbGncvvctYhWb5+GU+yoDFgGfRLKdexYVs+7Uf9jXQWK9lv/dr6x36d9zoX/KLRQhx
 RiseRsS+OL70OPx9ZBkcT6aDVfWKl+x37MY6DrToGDppgDC2tYlEryrfmqaI7SPgCgNDOX/7taL
 Zz1j1avw86xF0pvow0hMJiwAdqQdAGX/i7pbfgVeiWCpNG0XUMFj7Gy4KR6RN/kjwken+kwdkJf
 YsqkC+7b/Ld6iZhgpY5Uvxro2LPUPdN/qSUrfAIqTFK3vDm/KhQVBCxJWFmdnQTZVs6RUTBEcEl
 URD9vr5OMaBZHpXEt2FUOuGKEEatCERlfAefYioyWFFrJJ7OH8bPOuLV7bBUvaEq2gRZq5ul26o
 k0M01q/zILI/sFzJfVtPhn9U+BdmMOIu4NpRhKdx9EcmR5Oqy7O+3mi5k3Kso37Y/XQ96ddXerD
 KPAZgMEKECncs=
X-Google-Smtp-Source: AGHT+IH+qULnt5IiDwVZs4RSPJiSUXQVGTLH6/7d6HCRpJINYmlZt5FbShE8rGka4cxnUizRSOqJTw==
X-Received: by 2002:a17:903:1b43:b0:294:cc1d:e28d with SMTP id
 d9443c01a7336-29b6c50c704mr246709565ad.25.1764231786633; 
 Thu, 27 Nov 2025 00:23:06 -0800 (PST)
Received: from localhost ([122.172.86.94]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-be4fb2490bcsm1176810a12.2.2025.11.27.00.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 00:23:06 -0800 (PST)
Date: Thu, 27 Nov 2025 13:53:03 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dma-buf: add no-op stubs when CONFIG_DMA_SHARED_BUFFER
 is disabled
Message-ID: <4o3meb52jvgjrtqswpmrgkgjhn4zbzkvmyen4zqrkzeypsthpt@nt4vm7jwqash>
References: <6202945f4af2d10e0fb6602b25ff9cb454c1ee85.1764229204.git.viresh.kumar@linaro.org>
 <8d5ae067-e1bf-46a7-9137-d5936197ad5c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d5ae067-e1bf-46a7-9137-d5936197ad5c@amd.com>
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

On 27-11-25, 09:07, Christian König wrote:
> On 11/27/25 08:40, Viresh Kumar wrote:
> > Move several dma-buf function declarations under
> > CONFIG_DMA_SHARED_BUFFER and provide static inline no-op implementations
> > for the disabled case to allow the callers to build when the feature is
> > not compiled in.
> 
> Good point, but which driver actually needs that?

This broke some WIP stuff [1] which isn't posted upstream yet. That's why I
didn't mention anything in the commit log, though I could have added a comment
about that in the non-commit-log part.

> In other words there should be a concrete example of what breaks in the commit message.

There is time for those changes to be posted and not sure if they will be
accepted or not. But either way, this change made sense in general and so I
thought there is nothing wrong to get this upstream right away.

> > +static inline struct dma_buf *dma_buf_get(int fd)
> > +{
> > +	return NULL;
> 
> And here ERR_PTR(-EINVAL).

I am not really sure if this should be EINVAL in this case. EOPNOTSUPP still
makes sense as the API isn't supported.

> > +static inline struct dma_buf *dma_buf_iter_begin(void)
> > +{
> > +	return NULL;
> > +}
> > +
> > +static inline struct dma_buf *dma_buf_iter_next(struct dma_buf *dmbuf)
> > +{
> > +	return NULL;
> > +}
> 
> Those two are only for BPF and not driver use.

Will drop them.

-- 
viresh

[1] https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git/log/?h=virtio/msg
