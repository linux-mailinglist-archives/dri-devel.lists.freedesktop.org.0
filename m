Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBAD8D6239
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 14:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AE010E16A;
	Fri, 31 May 2024 12:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="jxKNogid";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com
 [95.215.58.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A04F10E16A
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 12:55:29 +0000 (UTC)
X-Envelope-To: j-choudhary@ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1717160126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mDqBiIbi/4yxm6zJ75PqcXSsLMeSwUbUaDhGcBu3OHw=;
 b=jxKNogido9tKkoNsMpPs8ZjlJaFBXEfWdqvquvV2po66Qhl+FJ72SNmfsGYC1OGfAcWtm0
 j2s2PekNDUTWOeiiY71DcnXbBP7XS1Rot36f5jGjNiUg9huHbeDYFeQSg7GCBJr0AIS4a1
 v0kWXxY0Q7/RekmcB7hcjm6kjutQyM4=
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: dmitry.baryshkov@linaro.org
X-Envelope-To: andrzej.hajda@intel.com
X-Envelope-To: neil.armstrong@linaro.org
X-Envelope-To: rfoss@kernel.org
X-Envelope-To: laurent.pinchart@ideasonboard.com
X-Envelope-To: mripard@kernel.org
X-Envelope-To: sam@ravnborg.org
X-Envelope-To: jonas@kwiboo.se
X-Envelope-To: jernej.skrabec@gmail.com
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: a-bhatia1@ti.com
X-Envelope-To: dri-devel@lists.freedesktop.org
Message-ID: <ba038d60-e399-476d-a4f3-50fc9d8eb390@linux.dev>
Date: Fri, 31 May 2024 20:55:15 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/2] Add mode_valid and atomic_check hooks for sii902x
 bridge
To: Jayesh Choudhary <j-choudhary@ti.com>, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, mripard@kernel.org, sam@ravnborg.org
Cc: jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, a-bhatia1@ti.com, dri-devel@lists.freedesktop.org
References: <20240530092930.434026-1-j-choudhary@ti.com>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240530092930.434026-1-j-choudhary@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,

On 5/30/24 17:29, Jayesh Choudhary wrote:
> Move the mode_valid hook to drm_bridge_funcs structure to take care
> of the case when the encoder attaches the bridge chain with the
> DRM_BRIDGE_ATTACH_NO_CONNECTOR flag in which case, the connector is not
> initialized in the bridge's attach call and mode_valid is not called.

Good catch, as modes being supported is actually a capability of the
bridge itself. The move make the driver reflect the hardware more.
