Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sxz0C6s+lWmvNgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 05:23:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72221152F83
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 05:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5996410E2D5;
	Wed, 18 Feb 2026 04:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=shenghaoyang.info header.i=@shenghaoyang.info header.b="TFPJuvtu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA5310E2D5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 04:23:01 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-c6e7e3f92adso305126a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 20:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shenghaoyang.info; s=google; t=1771388581; x=1771993381;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xaLRm8oBRzb3tsHJEfC+iuEacgZ+IRlxzqNo46X4hhk=;
 b=TFPJuvtuxeurYfSBbgxc3gpZfXrFA5b+UPOs6hL7D8BgXL/8E2e7T1GoAFcO56VGX+
 ykNYOsoEVsEd90tR/FO2HzMmKWlFmhIsS1/poRjyeWMi6RDQGYhyC7mg1P4sEOG0Bj5H
 36PIvt3N30b64iRXUFtvf90BecUL2vawgvacQhpyBZ+T/xcXNx4YkRBO1jSeCCIty6ch
 nfiQXeMnLKB6oiRzA6cqzbuuuwy2b3BKFv0CQY0EEfqcPvkEfyAE/FR7I/RmsLXBXYpg
 jG28fQy2Cvo7i034jszWggfGarj3xIzDRZ0W/Jmc/tHzE2qFJRe+2LV/X+8qzJVud+tg
 ogXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771388581; x=1771993381;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xaLRm8oBRzb3tsHJEfC+iuEacgZ+IRlxzqNo46X4hhk=;
 b=lve3jqMrM9ylKBeNCrh8MosCeeBk2kn5qGBREMIgvUcQirWM8ztO4539VmXGejn4TJ
 wMpxZ0GxWqQ8okvom2E8mLb5C/fJ3XuJhSuTuEQz0czY5tHQEYbo1kHQW1cs7L/tq4/P
 m2frgh7Z9/5VKT3NWw1pb+sESdGfA2823v/pOVwyvL4IOUWY5TN2YfjbxjiUtVL6DUGV
 juUzROJXcsTorntGAUw/tFTURFZ56WbJw6pGLl/KZKhag+cRBg/j5FJj3S3KRBUKsSbR
 dpQY9QpRLbS3E1ghkOimujIcNnIpDADRIqxHgd0M3jGWbxJ3U8HrYL1Ps9X8noZid91u
 Q3NQ==
X-Gm-Message-State: AOJu0YwbnFvdLF3Q5VQVIZH9hQefBCtOquRmqzneE+XC7j/F8xcBbhDr
 AwEzENtfFBTZXWEYlksozq/xg7EYNJFDz4R+CCWb9GM7YkdXYoOtCmF5BkmofBolDtg=
X-Gm-Gg: AZuq6aIB4rX7LlWBzHi/xoyz8Vg1hlPI+QT+1HUTrykY7mppaMDt1Pd9HCu2hcmpgFS
 jaffbqFarP0/p0zYo9gAnfScfcaXWUgN8tCeXgzTUaa+N17u1NiOPbTaONOJlZuecvQ+uwlEqmI
 Wa7kenVs6pO5dr11OdmWh0FXufmW1RrJGpCBweEHAMk/ZUbNjPScUFVKZcphMQcBnwqM/hcNjDg
 2KnNpvbGc5sa9fBLjcn3PLyYAdKY5OmKSlKPAXdaXZYwOny70x0/LbnNP3s+GK6eZUyLZH4fYxM
 d6GZLcLwbFobm0aY98fckJZtbjXxj19i0Jfzy+eDwh8eRwn3Z9s+vmQshC7qSLbiRmz7hE/61HP
 7fMNqHAny8toyYTwOIQ7X7TPF7WxaoajR0gZaZqRk1tJDp7zsM6eGmQQdaSXVrGXzHwQzA2e9b/
 UrTQRsxPofSAxtNawh+Y5085Ft37dapDfImJg=
X-Received: by 2002:a17:90b:47:b0:356:216c:ed64 with SMTP id
 98e67ed59e1d1-356a7a8adf3mr11334824a91.6.1771388580765; 
 Tue, 17 Feb 2026 20:23:00 -0800 (PST)
Received: from [10.0.0.102] ([132.147.84.99]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3588767038esm465111a91.2.2026.02.17.20.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 20:23:00 -0800 (PST)
Message-ID: <8c5ff095-539e-4c63-b811-efb7de8002ce@shenghaoyang.info>
Date: Wed, 18 Feb 2026 12:22:55 +0800
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
Content-Language: en-US
From: Shenghao Yang <me@shenghaoyang.info>
In-Reply-To: <0356024b-e951-4f87-98fc-2ecaf25f0ac4@suse.de>
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[shenghaoyang.info,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[shenghaoyang.info:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:rubenru09@aol.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:lkp@intel.com,m:dan.carpenter@linaro.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[suse.de,aol.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	FORGED_SENDER(0.00)[me@shenghaoyang.info,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@shenghaoyang.info,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[shenghaoyang.info:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,shenghaoyang.info:mid,shenghaoyang.info:dkim]
X-Rspamd-Queue-Id: 72221152F83
X-Rspamd-Action: no action

Hi,

Thanks for taking a look!

On 6/2/26 15:52, Thomas Zimmermann wrote:

>>   +void gud_crtc_atomic_enable(struct drm_crtc *crtc,
>> +               struct drm_atomic_state *state)
>> +{
>> +    struct drm_device *drm = crtc->dev;
>> +    struct gud_device *gdrm = to_gud_device(drm);
>> +    int idx;
>> +
>> +    if (!drm_dev_enter(drm, &idx))
>> +        return;
>> +
>> +    if (crtc->state->mode_changed || crtc->state->connectors_changed) {
> 
> I think you can do this unconditionally. Atomic_enable is supposed to be a full modeset and take some time.  For simple pageflips, this function doesn't run at all.
> 

I was trying this with proptest and toggling DPMS - the atomic_disable() and
atomic_enable() functions get called in that path even if the mode doesn't
change.

The driver in 6.12 LTS (before the atomic changes) didn't send
SET_CONTROLLER_ENABLE commands on DPMS changes either, so I thought it'd be
safer to do the same here.

>> +        gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 1);
>> +        gud_usb_set(gdrm, GUD_REQ_SET_STATE_COMMIT, 0, NULL, 0);
>> +    }
>> +
>> +    gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, crtc->state->active);
> 
> Why not write '1' unconditionally? IIRC the active bit is always true in atomic_enable.
>

Yup looking at drm_atomic_helper_commit_crtc_enable() the call to
atomic_enable() is skipped if !active - I'll sort this in v4!

drm_atomic_helper_commit_crtc_enable(struct drm_device *dev, struct drm_atomic_state *state)
{
...
	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
...
		if (!new_crtc_state->active)
			continue;
}

Shenghao


