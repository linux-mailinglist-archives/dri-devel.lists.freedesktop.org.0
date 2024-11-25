Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6052E9D7A00
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 03:16:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A4810E381;
	Mon, 25 Nov 2024 02:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="hHA+W27e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF58510E381
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 02:16:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732500973; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=d/zEjsqwWMHQCfX9UeIEZBI1NzrdTfOFQ+6qOYmIQngA7xv4kCBvk5PYcSLMATUtX+rfJXdOpxbKjz8KEwPXSOoetVNmairxXCzFnxQxQe1VT8xEUifK5GgOaMzU9bxVWVPQcjjSJHtf5jGK3DJWQytfbK0rUlbecST+JX2KV94=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732500973;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=C71cMPdzAIZZF2SjmLQ6f2sLVg9D60jKxvmm/3+ssN0=; 
 b=G3sAQqLGmecYLxaC3yUfY2AKQTtZ9v4ZKZI+g0BvUFWnmSx12UBg5pvA23EvtLmL068T1InQF4Yu4yDEaXGzvJ6NXaaBMDU8ht6Fey6O8K3ddL2qdNE56UxgVMkHhq757Z+5n88cQPcHYE8LQDDrsZn5g3z4OP/+gdO1AGQXKzk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732500973; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=C71cMPdzAIZZF2SjmLQ6f2sLVg9D60jKxvmm/3+ssN0=;
 b=hHA+W27edlYBpxc7AxFeo1cAYqBVgnmqUobDCbgas9P+XqKUe6rdnKr660AnlSLs
 dkJGwN83aGR82ttD01wAUDs09zJBqfVBQy4Z3DoyPB9TiRavofO8yDgZmwBbBv69d8N
 hclHJvkDcC6RxE3Q2IC1RECcRVALx+MC4TJ0B4dw=
Received: by mx.zohomail.com with SMTPS id 1732500972150459.37764541335036;
 Sun, 24 Nov 2024 18:16:12 -0800 (PST)
Message-ID: <43dac778-5bd0-4cac-b86b-46c48f0f3d19@collabora.com>
Date: Mon, 25 Nov 2024 05:16:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/virtio: Add a helper to map and note the dma
 addrs and lengths
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
References: <20240813035509.3360760-1-vivek.kasireddy@intel.com>
 <20240813035509.3360760-3-vivek.kasireddy@intel.com>
 <45fbbd65-7e97-41c3-898a-49b6fa65e27e@collabora.com>
 <IA0PR11MB7185625CF2B9E7635A0CF164F84C2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <071a239f-50fd-44f3-9283-3dc928edb389@collabora.com>
 <IA0PR11MB718548F4F8971C91FCA456CCF84E2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <4feda09d-7a5e-4db4-83f8-f75eb0566b4a@collabora.com>
 <IA0PR11MB7185C176AF07732D39AA4F86F84B2@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <IA0PR11MB7185C176AF07732D39AA4F86F84B2@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 10/29/24 09:18, Kasireddy, Vivek wrote:
> So, I believe we need to call pin and or dma_resv_wait_timeout(resv,
> DMA_RESV_USAGE_WRITE,....) at some point, as part of import, given
> these rules.

On a second look, you should be right. That resv-wait should be needed.

-- 
Best regards,
Dmitry
