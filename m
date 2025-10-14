Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8B1BD9DA1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 16:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF6610E5EA;
	Tue, 14 Oct 2025 14:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="N0KCt+9H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC2210E61C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 14:03:46 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cmGCf6pgSz9tSv;
 Tue, 14 Oct 2025 16:03:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760450623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yCyb2ibX28AxJ/J6U5+s4yIqyUkd+qFW22qoG96WL28=;
 b=N0KCt+9H1/tPccmwN4tQFcvZaZaUwKMvPrSwOqzEqQTRikWBpGXYOorSBJYLR404EtnYLM
 7K8Bqrte59xBIChslWPL4Yo4fbKTjrN2G2JwmZEpLHvdcwcgA2ESK1nV/vucswU9WsHy8Y
 fCRMBNsPqyA/wrTyyRel1EGx2Ya8u5lQ/7H5t+V0BXsTXQs570Kf+HHeaBEOOPkTXXefGC
 R91u0UhOcPXqWYRL3tC6K9WyKQpEFRFk2GbMqk8mKqSJmFnTIdNqjDonbDSyjaEHD02G2n
 zxLreKd0N783qBZEZmq0BzOr4ekY1OuuKlX6WWgu+O7VROvyrgd8u7PTu9NncQ==
Message-ID: <c7fee270-f3ff-402f-8266-0ffbb5077a61@mailbox.org>
Date: Tue, 14 Oct 2025 16:03:37 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 05/39] drm/imx: dc: Rework dc_subdev_get_id() to drop
 ARRAY_SIZE() use
To: Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-6-marek.vasut@mailbox.org>
 <aO0vLbkpXejre2Ta@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO0vLbkpXejre2Ta@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 593cda8ecce9591adfa
X-MBO-RS-META: rdmw869wa3nhjapcf1653gyr3tf5in1e
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

On 10/13/25 6:56 PM, Frank Li wrote:
> On Sat, Oct 11, 2025 at 06:51:20PM +0200, Marek Vasut wrote:
>> Rework dc_subdev_get_id() to drop ARRAY_SIZE() use and use empty trailing
>> entry in each ID look up array instead. This allows passing of those arrays
>> around as OF match data, which will be useful when using this pipeline on
>> i.MX95, which has different address-to-ID mapping.
>>
>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> 
> This change is okay. but my questions is why need map register to id.

This seems to be a recurring pattern in the driver, where some 
components need to find other components to link with them. The mapping 
is fixed, and since the DT does not encode link IDs, the resolution of 
the mapping has to happen by mapping the component base addresses to the 
IDs first.
