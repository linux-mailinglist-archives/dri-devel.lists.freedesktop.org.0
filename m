Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yG60ClfTd2mFlwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 21:49:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA81B8D476
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 21:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A3810E495;
	Mon, 26 Jan 2026 20:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TTgmCCKj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4D410E495
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 20:49:24 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-34c708702dfso2689252a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 12:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769460563; x=1770065363; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DgBDIJIrUHpJ6j6lR+sPmz5sI1yJjso51mAmb29uJAg=;
 b=TTgmCCKjwiUvhIjNu//ZU/EOmqSEStCgpJeIpzb6gex2AAoYMkaPHxIAnYRvqRNoEf
 3l3/nJvOS9Z7HaRxLTaomRuZgpRU6g2OvLnXz8b6fgYdG96TZ0+W5eI7zjbU564bjmGC
 WWjOoz9Z2SjJyWGotQlOWbNcTTyPbl/9+thCqXV9GAB9rRSzRJM15ePLxUd4I6HYxIh3
 Arw6dJSdE9pvL/CQQ7Mq5l8CMucHbiXfEn54Pk+ASgKW9XuX0x554YLJrKRHuuzvS38b
 XaExkh3iod6ljuPwDENbdXCLzU3aM0lqHyINuOcl00z3byjsXhHf4e1tDckRKkWZLMii
 p1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769460563; x=1770065363;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DgBDIJIrUHpJ6j6lR+sPmz5sI1yJjso51mAmb29uJAg=;
 b=f0oFfhfZZzj8mLNRGrTamY9AFIujRDsfKcC5GcxOjTNLW4Q6tQxbr5w3tuLbYjwB9o
 Hn86fPB0Dym4A5onn6NGMxQi7JiZMmk9x/kbEbyeVEiVrgn3BbMJZVZF5XNIfh8vgFWd
 Vsu4X/sf61qqJz3xIhCYZt4ZjlAb137QKsB5Um0ZvRN8q5iG3CBHrxGL6h6hC1VhQbhx
 InU2CUhQrT+7ux9rJMlfTu08XZLwZEXubajMOoCURaVlfGLDNAKAm3xxwZabVJPQAyqt
 aDrxgMf37gEOoQlr0n7naUXLzCsGLCUMt7bI09rLspVLXBn7j2r/UFsBeqNZAKLwyJOh
 ACiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPxtIB1YSIs+pWSi8ybD90PwxHcSq70vL83xUxw79b9pcIGp95VTqFr/Xj7T7l9MgHYJbVV5htbbI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywi9/3t13J6RjFNZrbq+vEVhri7W1CN1kAkeZd9L8H9Y92ldPvB
 NMj6NdoAnLdBZschIjgvYoCdHWQbhG5+jmRVyP0IOYWCorT7f6aLLAE=
X-Gm-Gg: AZuq6aLreIEWFfHOKk/Dihd3AQK9LFprRb4l+oUhcbSZwPxW/qZwNEGG/ETH994QUNb
 zW51gR16uruw2RoYwx8epVvkAsykgn9BeeNINCx/w/5L2KebeNCw6AoxECAbleWeo5ytfgCsPE7
 LxIdu0VblCLWbFtWwVZ7wI8pot9UWbMtIOwbJDFsOZXE8PZHFwkAT8FLiKFtnE5LHRJ2MpqiHo/
 nfywn+WUQvo13FcP42AZFJ/g2rzYR4s3IdDyNA1XlIT0+Aot6N1ewxfqFWx10OI2+SPAIy7v89h
 tdkq0YB302OybifmFQ87zOvlcd0kM5oQ04nSxADffv7VKpTuMTdSft9tAh2XFVEjDlh44Y2zAsR
 6KZfgvjwJhDEK5O+1iJKbUnbMesZ1UNGV/MtVQtDhsTqx8GxcfGV7J0ZpVwmhpP46IziWb0B16F
 UvQyVnSZ1jBrnne2LSEvxuj/7zUg==
X-Received: by 2002:a17:90b:350e:b0:341:2b78:61b8 with SMTP id
 98e67ed59e1d1-353c416b90cmr5425981a91.20.1769460563371; 
 Mon, 26 Jan 2026 12:49:23 -0800 (PST)
Received: from at.. ([171.61.166.126]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82339095c85sm5470337b3a.67.2026.01.26.12.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 12:49:22 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: jani.nikula@linux.intel.com
Cc: airlied@gmail.com, atharvatiwarilinuxdev@gmail.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, joonas.lahtinen@linux.intel.com,
 linux-kernel@vger.kernel.org, rodrigo.vivi@intel.com, simona@ffwll.ch,
 tursulin@ursulin.net, ville.syrjala@linux.intel.com
Subject: Re: [PATCH 2/2] drm/i915/display: Disable display for iMac's
Date: Mon, 26 Jan 2026 20:49:15 +0000
Message-ID: <20260126204915.1324-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <c3fc271e9cd1eec5ab96c70c9dc3c971d5ed73d6@intel.com>
References: <c3fc271e9cd1eec5ab96c70c9dc3c971d5ed73d6@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,linux.intel.com,vger.kernel.org,intel.com,ffwll.ch,ursulin.net];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:jani.nikula@linux.intel.com,m:airlied@gmail.com,m:atharvatiwarilinuxdev@gmail.com,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:joonas.lahtinen@linux.intel.com,m:linux-kernel@vger.kernel.org,m:rodrigo.vivi@intel.com,m:simona@ffwll.ch,m:tursulin@ursulin.net,m:ville.syrjala@linux.intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AA81B8D476
X-Rspamd-Action: no action

> Rendering and display are quite separate in the hardware and in the
> driver. Perhaps you do not mean "rendering" here? Perhaps it can be used
> for rendering but not display?

Yeah, it can be used for rendering but not display, sorry for the wording.

> Okay, so perhaps there's no eDP connected. But what about the other
> connectors on the iGPU? What about everything else in the display
> hardware?

You cant use the iGPU to drive the display on any hardware (including external displays).

> If you can figure out that it's specifically link training that fails (a
> dmesg would be useful to show this) there clearly is display hardware,
> right?

As said the iGPU cant drive the display on all monitors (even on macOS), but still heres the dmesg before this patch:

[    5.095489] i915 0000:00:02.0: [drm] Found cometlake (device ID 9bc8) integrated display version 9.00 stepping N/A
[    5.096061] i915 0000:00:02.0: [drm] VT-d active for gfx access
[    5.096102] i915 0000:00:02.0: [drm] Using Transparent Hugepages
[    5.099214] i915 0000:00:02.0: Invalid PCI ROM header signature: expecting 0xaa55, got 0xffff
[    5.099217] i915 0000:00:02.0: [drm] Failed to find VBIOS tables (VBT)
[    5.099324] i915 0000:00:02.0: vgaarb: VGA decodes changed: olddecodes=io+mem,decodes=none:owns=io+mem
[    5.100960] i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/kbl_dmc_ver1_04.bin (v1.4)
[    5.832214] i915 0000:00:02.0: [drm] [ENCODER:105:DDI A/PHY A] failed to retrieve link info, disabling eDP
[    5.835756] i915 0000:00:02.0: [drm] Registered 3 planes with drm panic
[    6.428455] i915 0000:00:02.0: [drm] Cannot find any crtc or sizes
[    6.722404] i915 0000:00:02.0: [drm] Cannot find any crtc or sizes

> There's at least three levels where this could be handled, depending on
> details:
> 
> - Display probe (the patch at hand). Assumes there's no display
>   hardware, at all. The driver doesn't touch the hardware, which
>   continues to consume power, it's not put in low power states. Not
>   optimal if there actually is display hardware.
> 
> - Display disable. See intel_display_device_enabled(). The driver takes
>   over the hardware, puts it to sleep, but prevents all connectors from
>   being connected.
> 
> - eDP disable. Add a quirk somewhere to enforce eDP is disconnected, but
>   other connectors can be used.

The main reason I sent this patch is that after i915 trys to probe the display,
the dGPU (amdgpu) is no longer able to detect the internal display,
resulting in a black screen.

> It would be quite useful to indicate the PCI ID of the device in
> question.

00:02.0 VGA compatible controller [0300]: Intel Corporation CometLake-S GT2 [UHD Graphics 630] [8086:9bc8] (rev 03) (prog-if 00 [VGA controller])
	Subsystem: Apple Inc. CometLake-S GT2 [UHD Graphics 630] [106b:ffff]
