Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFKXILzMlWl+UwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 15:29:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F3F157111
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 15:29:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E6610E5C3;
	Wed, 18 Feb 2026 14:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=shenghaoyang.info header.i=@shenghaoyang.info header.b="fj1GikZc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA9210E5C3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 14:29:12 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-824b621ef8aso675750b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 06:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shenghaoyang.info; s=google; t=1771424951; x=1772029751;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EH4cAj3djOvOxnCkM+Img75vgB9C+ClsbXPCd4KEsAY=;
 b=fj1GikZc327fUkChY3JI+m3963I0l7MpeAsssUnX//qfk0C3RUWa+EYmR+lTfpTpgH
 Tupow1yInEJZD51OItL/4I/egYdpB033NXdveZegMt7GHyljWgWXB1dEo3tbc2uBkJR7
 390FZ87IfPM00SIeEHElwx7GJp9NQmJZ831T6aAytzgKoko9X114iG7eSVhVpJh3Ta6V
 B5zAhvhs0JRpkqwQupkHrKgJ1WVz7DVsYmbDqtltypx8v6a+BpOS2hPZ27oJQLBSSKAQ
 PHIXLjBQjSD7JWu7Z87y0ojK+s+9omE+r23/t++0fuc9CJADAxcdSjJAnjCGP/w3j1YK
 /kHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771424951; x=1772029751;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EH4cAj3djOvOxnCkM+Img75vgB9C+ClsbXPCd4KEsAY=;
 b=pTJKGoCQemxo5P9wU3m6RHfrUg3XUPEes+cPvZ4J8akfSBCm764m1ABUlrs+sIX/QW
 dmsl1/esFcKYGsitjx37Gq527XCclkKJ8H3MhhdcB4OMJL++RNe2+JQYBFEqdis1yJVu
 53r5ay3PUOaOlQ2KjY1VdCvQz2taY+V69NqiFGUoumEDrGOIdcg8ZRB4rqhFvaRf1q4w
 Y0xG0+DdBw8EKvs/Ee0BleC1cOQ27wlnY+UckEpqKRJH6U7HbbopFOby+tdOpcoSFiwh
 lWgr2EhhDs6v+7SV83Zw9XOxFVWpDWryvzuAkUstVUjSaCEpUpgUvYThQTvKfE61jYnH
 vQ/w==
X-Gm-Message-State: AOJu0YykQU56ZY/5xgGgWMs2VtdPLaRZdqk9bxFtEUnmCCnBuRESM3kC
 NcyFEhFJLTD/6VPd1FEPKAVoaFg9sTyA+Zp/guGBVtIHgmTO5LVkCvQOCXQ1kPMiwUU=
X-Gm-Gg: AZuq6aJObpqezon7dwJBKe5QOHi1zwAIpcPDYOs2saq/+wFCGlrSjCBNi1Bye/OLzlo
 OVhV1UC1NzXZYQ+XP+pwKqXP3qNbx1EE99FtPVqICdD1DUlQj7U068INy9LQFpa7iroWtq01Mqg
 MnyPcLvTiIDouWiFoSDg4ysGKcUAP/XuIXEOjs+Py9g0mGKLInMSQODSJSzpYUqW9yQZKPTj+RR
 ZsD1uG83en0uVosxAQDntlhtsFvEwHYzcSFZAyqlS2EE83HHf3bHTQ3OuWEWuVU1oNqB4fM1IuS
 QxWmPzY+U8+1yaskPCHYEc9+FPnFr61k7gzlOIZR0b8rZoHQNOdL46/oye7HiVb44gNMQBjWQ7e
 wFm5ucWMr8GQV3kVJ8EF3haLiggD4pL5Nb2vdqkyitdB5e1v9/LBHYLMolzKwFHDNfu3gFjtao1
 1ZHh+GPNgedJTbgpWVMJ4r3Vyg6lsn3GJmTeI=
X-Received: by 2002:a05:6a00:1142:b0:81f:453d:1ab9 with SMTP id
 d2e1a72fcca58-824c609f3d3mr13816724b3a.3.1771424951572; 
 Wed, 18 Feb 2026 06:29:11 -0800 (PST)
Received: from [10.0.0.102] ([132.147.84.99]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-824c6a626bfsm16232890b3a.28.2026.02.18.06.29.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Feb 2026 06:29:11 -0800 (PST)
Message-ID: <6b763e11-447a-4db7-9c73-1dc941425d71@shenghaoyang.info>
Date: Wed, 18 Feb 2026 22:29:06 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v3] drm/gud: fix NULL crtc dereference on display disable
To: Thomas Zimmermann <tzimmermann@suse.de>, Ruben Wauters
 <rubenru09@aol.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>
References: <20260203172630.10077-1-me@shenghaoyang.info>
 <0356024b-e951-4f87-98fc-2ecaf25f0ac4@suse.de>
 <8c5ff095-539e-4c63-b811-efb7de8002ce@shenghaoyang.info>
 <6440e721-daea-4d1d-a920-7eb786dec7f5@suse.de>
Content-Language: en-US
From: Shenghao Yang <me@shenghaoyang.info>
In-Reply-To: <6440e721-daea-4d1d-a920-7eb786dec7f5@suse.de>
Content-Type: text/plain; charset=UTF-8
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
X-Spamd-Result: default: False [7.19 / 15.00];
	URIBL_BLACK(7.50)[shenghaoyang.info:mid,shenghaoyang.info:dkim];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_ALLOW(0.00)[shenghaoyang.info:s=google];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:rubenru09@aol.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:lkp@intel.com,m:dan.carpenter@linaro.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[suse.de,aol.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	FORGED_SENDER(0.00)[me@shenghaoyang.info,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[shenghaoyang.info:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[me@shenghaoyang.info,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[shenghaoyang.info,reject];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[shenghaoyang.info:mid,shenghaoyang.info:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E9F3F157111
X-Rspamd-Action: add header
X-Spam: Yes

Hi,

On 18/2/26 16:04, Thomas Zimmermann wrote:

> Hi
> 
> Am 18.02.26 um 05:22 schrieb Shenghao Yang:
>> Hi,
>>
>> Thanks for taking a look!
>>
>> On 6/2/26 15:52, Thomas Zimmermann wrote:
>>
>>>>    +void gud_crtc_atomic_enable(struct drm_crtc *crtc,
>>>> +               struct drm_atomic_state *state)
>>>> +{
>>>> +    struct drm_device *drm = crtc->dev;
>>>> +    struct gud_device *gdrm = to_gud_device(drm);
>>>> +    int idx;
>>>> +
>>>> +    if (!drm_dev_enter(drm, &idx))
>>>> +        return;
>>>> +
>>>> +    if (crtc->state->mode_changed || crtc->state->connectors_changed) {
>>> I think you can do this unconditionally. Atomic_enable is supposed to be a full modeset and take some time.  For simple pageflips, this function doesn't run at all.
>>>
>> I was trying this with proptest and toggling DPMS - the atomic_disable() and
>> atomic_enable() functions get called in that path even if the mode doesn't
>> change.
>>
>> The driver in 6.12 LTS (before the atomic changes) didn't send
>> SET_CONTROLLER_ENABLE commands on DPMS changes either, so I thought it'd be
>> safer to do the same here.
> 
> Leave it as it is if you like. But in DRM, we don't have real DPMS support for atomic modesetting. The DPMS on state is a full atomic_enable and the off and blanking states are atomic_disable IIRC. Doing that would be the correct handling.

Ah - gotcha. I'll do some testing with the conditional removed.
The worry about changing command sequences was a bit pedantic anyway -
DPMS would have caused an instant oops in the current tree and nobody else
has reported anything yet.

Would y'all be happy to take a v5 afterwards? Apologies for all the
iterations here :/

Thanks,

Shenghao


