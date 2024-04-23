Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9BF8AEB49
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 17:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF5C10FCCC;
	Tue, 23 Apr 2024 15:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="I1dmGLrD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com
 [91.218.175.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBAB10FCCC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 15:40:07 +0000 (UTC)
Message-ID: <cd183655-e099-4a6d-835d-7555f6f6884d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1713886804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YI+FWVmFzDJ71B2CmVKYD+k5daGrcnKhGtzV6yF5veA=;
 b=I1dmGLrDePb9xsdKYx37/WVWwTbL/tKeQamGlpVeWaSqZ5qRIT6dUDtjWk5L0KK01LwDCa
 LhS5yqosxrq6qWG39HB6KU74TdVFyo78yAAzu7pVTcn2amgDoOMzQKEsn6hLxLhVWOeCcs
 Nj1CTQcKrAvj/4l7kY+drh7WwNrd750=
Date: Tue, 23 Apr 2024 11:39:59 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v3 00/13] drm: zynqmp_dp: IRQ cleanups and debugfs support
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20240422184553.3573009-1-sean.anderson@linux.dev>
 <5334a3cc-bcf9-4791-9ca9-1d0093899707@ideasonboard.com>
 <472464bb-ae10-4452-aedf-a52b3eb8a25a@linux.dev>
 <dd82b42b-4987-4bb8-b16e-580fe21009c3@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <dd82b42b-4987-4bb8-b16e-580fe21009c3@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
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

On 4/23/24 11:30, Tomi Valkeinen wrote:
> On 23/04/2024 17:59, Sean Anderson wrote:
>> On 4/23/24 09:33, Tomi Valkeinen wrote:
>>> Hi Sean,
>>>
>>> On 22/04/2024 21:45, Sean Anderson wrote:
>>>> This series cleans up the zyqnmp_dp IRQ and locking situation. Once
>>>> that's done, it adds debugfs support. The intent is to enable compliance
>>>> testing or to help debug signal-integrity issues.
>>>>
>>>> Last time I discussed converting the HPD work(s) to a threaded IRQ. I
>>>> did not end up doing that for this series since the steps would be
>>>>
>>>> - Add locking
>>>> - Move link retraining to a work function
>>>> - Harden the IRQ
>>>> - Merge the works into a threaded IRQ (omitted)
>>>>
>>>> Which with the exception of the final step is the same as leaving those
>>>> works as-is. Conversion to a threaded IRQ can be done as a follow-up.
>>>
>>> What is the base for this series? I'm having trouble applying it.
>>>
>>> I managed to mostly apply it, but I see the board hang when I unload the modules. I didn't debug it as it might as well be caused by my conflict resolution.
>>
>> The base is v6.8-rc1, but it should probably be v6.9. I can rebase and resend.
> 
> Did you have something extra in your branch before the series? I got "error: sha1 information is lacking or useless".

Nope.

--Sean
