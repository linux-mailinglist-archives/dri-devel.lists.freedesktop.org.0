Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D21D90B2CE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 16:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F40810E400;
	Mon, 17 Jun 2024 14:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="rRjgk1x0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com
 [95.215.58.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8F010E400
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 14:49:05 +0000 (UTC)
X-Envelope-To: tomi.valkeinen@ideasonboard.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1718635743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ch7cah993AkVkg+y3U7rb0K5ixT//mKQZ75RYDYWvBI=;
 b=rRjgk1x0taQwUoPz9ZFDrKfLRRi/dGvlDhP/onKrUm9rDL68yaXQCbwFuRRpE6BpgutiFX
 YzsKgAPvEarBcalpQ9NMNuEQzn+0p42I0g8FBDZqzDdWu+mC7QD977AODqf6ngZWDIjO7G
 w/+ZO0s0Wxv4i+HLQBPsW3h0qgsays8=
X-Envelope-To: laurent.pinchart@ideasonboard.com
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: airlied@gmail.com
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: michal.simek@amd.com
Message-ID: <5c5aa8ae-75c4-4f0f-ad19-50ad57c61216@linux.dev>
Date: Mon, 17 Jun 2024 10:48:58 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v5 00/10] drm: zynqmp_dp: IRQ cleanups and debugfs support
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>
References: <20240503192922.2172314-1-sean.anderson@linux.dev>
 <e5ca9be5-2918-427a-b7eb-28f1915b5d31@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <e5ca9be5-2918-427a-b7eb-28f1915b5d31@ideasonboard.com>
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

On 6/17/24 03:47, Tomi Valkeinen wrote:
> Hi Sean,
> 
> On 03/05/2024 22:29, Sean Anderson wrote:
>> This series cleans up the zyqnmp_dp IRQ and locking situation. Once
>> that's done, it adds debugfs support. The intent is to enable compliance
>> testing or to help debug signal-integrity issues.
>>
>> Last time I discussed converting the HPD work(s) to a threaded IRQ. I
>> did not end up doing that for this series since the steps would be
>>
>> - Add locking
>> - Move link retraining to a work function
>> - Harden the IRQ
>> - Merge the works into a threaded IRQ (omitted)
>>
>> Which with the exception of the final step is the same as leaving those
>> works as-is. Conversion to a threaded IRQ can be done as a follow-up.
> 
> I tested this, and the "drm: zynqmp_dp: Convert to a hard IRQ" causes a hang for me when unloading the drivers. Unfortunately I'm not in the condition to debug it at the moment.
> 
> I have picked the first three patches into drm-misc-next, though, to decrease the number of patches in the series a bit. They looked independent and safe enough to apply.

Are you running into [1]?

--Sean

[1] https://lore.kernel.org/dri-devel/4d8f4c9b-2efb-4774-9a37-2f257f79b2c9@linux.dev/

