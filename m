Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DA193B486
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 18:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0583410E748;
	Wed, 24 Jul 2024 16:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="c6yROS90";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B1D10E748
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 16:08:42 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-5c66909738fso519076eaf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 09:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721837321; x=1722442121; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mT4eYVQs87DJMXQ+M8KCQPXJkwJfWh66QnvkaWHb17g=;
 b=c6yROS90AAl1+AoL1+GrvQzrV6vYdLE3W895o8XZhd5VgjfixKpcQ9mtMcD1zn0bUL
 YmVkngchRH1gtMCkWwWElMwin7Uw3QkikzA+hpdFQpbX1E5aKdHw+qkiyRR9R6pPb/hS
 2sdTbC7q3YQb75jQeSJ/7mZ+Ms0FDPCD/RgkAhc3aIcQcu7rNamKz2jf4DivuDrreRjy
 05d7KmdctEbdWEL6T/74m1oK7XUZCm0mbo5BJla3jrort5DpDPk6ldwMJmkjz0aFkNmv
 RrwRazt8ea0MTBawkao7b1g6HvrVO96gdX+Xs5T3p7jNKPGNoAA+Zj/DOVPD6HOoHPJy
 jn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721837321; x=1722442121;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mT4eYVQs87DJMXQ+M8KCQPXJkwJfWh66QnvkaWHb17g=;
 b=R3MTcW5p3bxdlwM2x/99fPsf6gKjEeOeiO9TS01Z69bGigmxa52Tl1Px55C7FDwa4v
 Cok2TRE6g7LmgUPPo5GWpVFlyE29EbWf96bGUWMI7Kd2mMEiNd0c4lmd5JbmA9Yo3VBc
 Br5oJ2VWeYc0KJeYAEX4/LSe5ax5rP0+bIfrTY/6DJK3wmgVoP0mB3tyk5a24reHvaGE
 +SsbP+V2SJgfrns5dSAtEDqjoqX4LfSSpe9AKqTfIwCWBpbukXo1LfplxyIulyUFjtiu
 7poockd/47jW/xqKL3owA0SWusF6efNrGmWCHflFkgNoFpTFoXsI45Ef5OjazzauaSEL
 jsRA==
X-Gm-Message-State: AOJu0YwwVwT9evivyVOKwnBsO2glXSebWpb3HGS13LICyjgiyiNSBGRG
 +juQ/awuYNbD9tOneMjxBBnmrZ7kwtlKF4u69OW6sxBeC0q1JOh0U/mXUE5IVxs=
X-Google-Smtp-Source: AGHT+IFRBKG5+eehi5W6qAj5lOu83dSm6cD3ucdWeIAZ7OyVviCxXxrY5z92TXNAPPUaowvRrEZ+lg==
X-Received: by 2002:a05:6870:d1c9:b0:254:a6ab:e10f with SMTP id
 586e51a60fabf-2649fc89e26mr67909fac.13.1721837320908; 
 Wed, 24 Jul 2024 09:08:40 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:23ae:46cb:84b6:1002])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-708f60a4b4esm2486633a34.15.2024.07.24.09.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 09:08:40 -0700 (PDT)
Date: Wed, 24 Jul 2024 11:08:33 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomer Tayar <ttayar@habana.ai>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] accel/habanalabs: enforce release order of compute
 device and dma-buf
Message-ID: <71169637-1e35-48d5-ba04-161d30073495@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Tomer Tayar,

Commit 09524eb8824e ("accel/habanalabs: enforce release order of
compute device and dma-buf") from Jan 22, 2023 (linux-next), leads to
the following Smatch static checker warning:

	drivers/accel/habanalabs/common/memory.c:1844 hl_release_dmabuf()
	error: dereferencing freed memory 'ctx' (line 1841)

drivers/accel/habanalabs/common/memory.c
    1827 static void hl_release_dmabuf(struct dma_buf *dmabuf)
    1828 {
    1829         struct hl_dmabuf_priv *hl_dmabuf = dmabuf->priv;
    1830         struct hl_ctx *ctx;
    1831 
    1832         if (!hl_dmabuf)
    1833                 return;
    1834 
    1835         ctx = hl_dmabuf->ctx;
    1836 
    1837         if (hl_dmabuf->memhash_hnode)
    1838                 memhash_node_export_put(ctx, hl_dmabuf->memhash_hnode);
    1839 
    1840         atomic_dec(&ctx->hdev->dmabuf_export_cnt);
    1841         hl_ctx_put(ctx);
                            ^^^
This will free ctx on the last reference

    1842 
    1843         /* Paired with get_file() in export_dmabuf() */
--> 1844         fput(ctx->hpriv->file_priv->filp);
                      ^^^
Potential use after free

    1845 
    1846         kfree(hl_dmabuf);
    1847 }

regards,
dan carpenter
