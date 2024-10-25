Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF879B0682
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 16:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5971810E094;
	Fri, 25 Oct 2024 14:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="lsT0ohrO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com
 [95.215.58.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E06910E094
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 14:58:07 +0000 (UTC)
Message-ID: <07766e5e-6009-4b8e-8a50-30ba0fe763f5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1729868285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a8cGWjeBVtubT1nOUtGsNOA8VZMw6hKLHJizMjgK7rM=;
 b=lsT0ohrOh5E5xFM4/dj8E2d6LS9jzHhErfRZvWVngnIdLZIK7DuzuMzxTL+5FIV4LeCWN+
 U/20Ma87/13Nzno2oI+HQ5PtOK5L7+Jks9xkOZWaXhupqk0lEsFH/AtfUIT+Sa7/dD0CJJ
 yt+rOq5RPn/O0mA6h1enlPz24Aq4YXI=
Date: Fri, 25 Oct 2024 10:58:00 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v6 0/8] drm: zynqmp_dp: IRQ cleanups and debugfs support
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 David Airlie <airlied@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Sagar, Vishal" <vishal.sagar@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org
References: <20240809193600.3360015-1-sean.anderson@linux.dev>
 <5e9769dd-459a-4ff3-aebb-bb7057192733@linux.dev>
 <a023bd66-8f42-4f27-9aa2-5097b2574562@ideasonboard.com>
 <e959a01f-b466-4076-8219-a6c83a7194c0@linux.dev>
Content-Language: en-US
In-Reply-To: <e959a01f-b466-4076-8219-a6c83a7194c0@linux.dev>
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

Hi Tomi,

On 10/3/24 10:53, Sean Anderson wrote:
> On 10/2/24 10:50, Tomi Valkeinen wrote:
>> Hi,
>> 
>> On 01/10/2024 21:31, Sean Anderson wrote:
>>> On 8/9/24 15:35, Sean Anderson wrote:
>>>> This series cleans up the zyqnmp_dp IRQ and locking situation. Once
>>>> that's done, it adds debugfs support. The intent is to enable compliance
>>>> testing or to help debug signal-integrity issues.
>> 
>> I think the patches 1-7 look fine, and I think I can pick those already to drm-misc if you're ok with that.
>> 
>> I'm a bit unsure about patch 8, probably mainly because I don't have experience with the compliance testing.
>> 
>> How have you tested this? With some DP analyzer/tester, I presume?
> 
> For my test setup I used an oscilloscope hooked up to the displayport
> output using a fixture that broke the signals out to SMA. Since the
> oscilloscope cannot emulate a sink, I first had the output connected to
> a monitor. Then I disabled HPD and reconnected the output to my fixture.
> This process is described in more detail in the documentation.
> 
>> I think none of this (patch 8) is needed by almost anybody.
> 
> Well, I found it very useful for debugging a signal integrity issue I
> was having. Once I could have a look at the signals it was very clear
> what the problem was.
> 
>> Even among zynqmp_dp developers I assume it's very rare to have the
>> hardware for this. I wonder if it would make sense to have the debugfs
>> and related code behind a compile option (which would be nice as the
>> code wouldn't even compiled in), or maybe a module parameter (which
>> would be nice as then "anyone" can easily enable it for compliance
>> testing). What do you think?
> 
> Other drivers with these features just enabled it unconditionally, so I
> didn't bother with any special config.
> 
>> I also somehow recall that there was some discussion earlier about
>> how/if other drivers support compliance testing. But I can't find the
>> discussion. Do you remember if there was such discussion, and what was
>> the conclusion? With a quick look, everything in the debugfs looks
>> generic, not xilinx specific.
> 
> The last it got discussed was back in [1], but I never got any further
> response. I agree that some of this is generic, and could probably be
> reworked into some internal helpers. But I don't have the bandwidth at
> the moment to do that work.
> 
> --Sean
> 
> [1] http://lore.kernel.org/dri-devel/cda22b0c-8d7c-4ce2-9a7c-3b5ab540fa1f@linux.dev

Does this all make sense to you? At the moment I don't believe I have any
changes I need to resend for (although this series is archived in patchwork [1]
for some reason).

--Sean

[1] https://patchwork.kernel.org/project/dri-devel/list/?series=878338&archive=both
