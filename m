Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35625AFE83B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 13:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2822B10E79F;
	Wed,  9 Jul 2025 11:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="uPsDAqc6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6B210E79F;
 Wed,  9 Jul 2025 11:49:45 +0000 (UTC)
Received: from [192.168.42.116] (p5b1645eb.dip0.t-ipconnect.de [91.22.69.235])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 326C52FC004A;
 Wed,  9 Jul 2025 13:49:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1752061783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z4tPrpohIKzA9dpzM7fgM3lnG/w3QgoJ+fb9JhKfdC4=;
 b=uPsDAqc6/GRcnySbr4rLZwJ33I0X5BpdBk4Q51cS1ERVD7G8HdXp5zP98woiX7YiTJqH/D
 oY+zZo39jMWR5dGAV6x5IYJgb2RbPK79kNq8koKODyfO/M0RLOt0L/JW8obNrLD+Ea6m+D
 Eep5mkPx9ZXWPpSUdsRE54IHXFb4vGw=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <513aa035-8a00-4943-abc1-d68824a5c0c6@tuxedocomputers.com>
Date: Wed, 9 Jul 2025 13:49:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/1] drm/i915/display: Avoid unsupported 300Hz output
 mode on a TUXEDO device
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, t.guttzeit@tuxedocomputers.com
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250704192007.526044-1-wse@tuxedocomputers.com>
 <aG2IL07UtZ4YICMn@intel.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <aG2IL07UtZ4YICMn@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi all,

Am 08.07.25 um 23:05 schrieb Rodrigo Vivi:
> On Fri, Jul 04, 2025 at 09:03:45PM +0200, Werner Sembach wrote:
>> RFC because I'm not sure if this is the right approach.
> Could you please file a gitlab issue for us so we can get someone from our
> display team to take a look and see if there's anything else that could be done
> before we take the quirk route?
>
> https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html

Tim can you follow up with this? Reducing the communication chain to avoid 
dropping information.

Best regards,

Werner Sembach

>
> Thanks for the investigation and the quirk,
> Rodrigo.
>
>> The flicker manifests ever few seconds 1-3 black frames in quick
>> succession.
>>
>> On windows 300Hz can not be selected for the iGPU, but the panel advertises
>> it.
>>
>> A cleaner solution would probably to go over the pixel clock, but for this
>> device there is only one 300Hz mode in the panels edid and that is at the
>> nativ resolution. Chroma subsampling was not tested as linux afaik offers
>> no way to easily enforce it for intel gpus.
>>
>> Tim Guttzeit (1):
>>    drm/i915/display: Avoid unsupported output mode with 300Hz on TUXEDO
>>      device
>>
>>   drivers/gpu/drm/i915/display/intel_dp.c     |  5 ++++
>>   drivers/gpu/drm/i915/display/intel_quirks.c | 30 +++++++++++++++++++++
>>   drivers/gpu/drm/i915/display/intel_quirks.h |  1 +
>>   3 files changed, 36 insertions(+)
>>
>> -- 
>> 2.43.0
>>
