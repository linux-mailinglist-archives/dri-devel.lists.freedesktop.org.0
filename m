Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XddUD3zHfWmMTgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 10:12:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8F3C153C
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 10:12:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C877E10E049;
	Sat, 31 Jan 2026 09:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=0x0f.com header.i=@0x0f.com header.b="trQwS2JL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A30010E049
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 09:12:22 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-34f634dbfd6so2188802a91.2
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 01:12:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769850742; cv=none;
 d=google.com; s=arc-20240605;
 b=Nib4f0dArrx7Vn9ACLYKqcO8OpphIBLlSfFo/S66TQgMVSmoOQNd2ui03bxzrzwXHP
 NzeVQYRjpjVqVWHA6rRIBenNILuk9nydZWs0goyNQgYs4h2Es266qH7YtyDNYXN0Ia6b
 hJTHfZioeRogPoL+mdg9u0DLo5K8cDUIb4NUl6EdxpVPXihJY4qimS6g1bjC7WilmCV0
 0gsMjICvuO2LqdTQdvr5F/SziqixUcDN5+qBkB4Sqj8UkPowyh4Payt4QzpQpZDdgXEQ
 m76sbt4YfJAe93e790LYWkzSjdIqVYxcaNbMfGi75TflYvxKm8ogwYsGeIM4XM6SgCgx
 n26w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=+jGI+5RyfB3vCtuiCc54Q03oyhwJyVoh3orqwK7JVeU=;
 fh=SCuVHqB8KKR6xPI1zNST8SKZVgsveuUnkIbKLT3fes8=;
 b=TTUY+0d1T4VFmhUKDHjX/M7h9TE7NTpafO/XSjgW32IlN7+gNDYLSU7osTFXC4AB8S
 2PUcGIHG4egSXyAm4+hgu6cH7PyQuGLD6HH4hYH9a953XgT/rRQnFhgeoA8yp/K0xP9Y
 vjOtL23c6PK7xLonD6/mVsmMwKz4IisZu+Ygsl8wPhhBlXkXtXwWQOsmuH9In4Kb1yr0
 qZJtAq2zS129HP/tuxjsF+wqphkuG9cfEwsLnkPG+nM99rxHYt/A6T3cTS9XMbet6IK0
 X7XmbJ58cM/EM4Vo8FGdG4HE77rZGIMAcUkTcNeZk3ETTQsbaYWIIa8MkVUlUNmRKRXR
 cRvw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0x0f.com; s=google; t=1769850742; x=1770455542; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+jGI+5RyfB3vCtuiCc54Q03oyhwJyVoh3orqwK7JVeU=;
 b=trQwS2JLKANr7zewUtWG2V2Cq6axyv5KN9jyO9AcS8KhCIGpH4iwsNs88GPBKU3Dwo
 TFN/brDUZGy3ApjhEDMflQhMNMKB71ruda1jcv3HMPiOEH/YsNAMGwPVeZyu5Of2Z80d
 IJTB+BgNMUkbNarVdDwhLDwtJo/I4wOuOiVSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769850742; x=1770455542;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+jGI+5RyfB3vCtuiCc54Q03oyhwJyVoh3orqwK7JVeU=;
 b=AeyHP8Dg9afQOEBliWOjJVOzj08szLhbbbh25CXxMg03E8F4wCBvrsHeg18EPiuJuk
 fDrFbAXysJbAjX0YFLcXDUe2Hy5BFGVyhW+pYSNAeT+Ft/DEfIshtzkeQzmnb+H6cH7T
 G8IdHlTs1CqlvNJ/INH2LGcWMO1OVkO05B66zB7GxVTobODlL4P9uDgz2vt5ht/V+I3y
 Cax2F1Ylf3XY9QBqZ8TkDKypF6Hf9rwFxAFOndetrqSXoDVqO/J4nVeeHpP4c6Ru7myz
 WhzdSqJjjOYE52zQum/M9/Hx05AldshGIDM6e/uk7a89M+sKMk+oKwwoDpcrw3ojOOwd
 WH7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtLvAd/5EzaihyNS22izH2bktSZK7ydh3VxEG8VH4jD+Dg8LbZOSM+6Bh4XoV6B1fFaSFvVcHZXpc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWaeBA/VUfJgAGlMvk8ZE/uN6mjggpS1fACNJQfqB+oKP7YR1k
 rZvFrEa3/0KkN/RPk99lYCYHDt8JK8gJpQxZbGQIDUTo3TewI7T10QhaaTiC8vZYvejstaLPmSO
 eJRjbB15KFnL6gUKVrJ64DAd4os2CxYlP2hfM89xj/g==
X-Gm-Gg: AZuq6aIvqo63MY/QAYDJQTqcUlldP+d+XpFSU3LObyh3shqDcyleljUjKDkanvgyuTk
 AUnL2hOz0uWoXTvLDBuL6Doxda6v9yWSP0M38A3pziOgkt02XBhmidDEfBV7VFgNv3FfaAxizjE
 N4MznT9j+jr35OWWmWpDgVYC2DLmQQjRsKPjC3XjYec1D/JX1QeC9EqplLiOXCzYsCu4yW0Ezob
 6DIPHAn6sa38biBMpe68Z4Be5LiG3ne9dW92E/OXFDXUpS4yzgKoW/e7ZV36aN1zawWhl77RQ==
X-Received: by 2002:a17:90a:c10f:b0:341:88c1:6a7d with SMTP id
 98e67ed59e1d1-3543b39c9e1mr6128743a91.18.1769850741806; Sat, 31 Jan 2026
 01:12:21 -0800 (PST)
MIME-Version: 1.0
References: <20260130113230.2311221-1-john.ogness@linutronix.de>
In-Reply-To: <20260130113230.2311221-1-john.ogness@linutronix.de>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 31 Jan 2026 18:12:11 +0900
X-Gm-Features: AZwV_QiCcHKEwTXVFMBGY0Y2JoDZenczPK4LMjBrq120HRde884UUkrfy0S9Vjw
Message-ID: <CAFr9PXkCGTvOatJKwTTEyBc8r8kEyJGdDtPwKuKTfJK586LzKg@mail.gmail.com>
Subject: Re: [PATCH drm] Revert "drm/nouveau/disp: Set
 drm_mode_config_funcs.atomic_(check|commit)"
To: John Ogness <john.ogness@linutronix.de>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[0x0f.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[0x0f.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[daniel@0x0f.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:john.ogness@linutronix.de,m:lyude@redhat.com,m:dakr@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:airlied@redhat.com,m:nouveau@lists.freedesktop.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[0x0f.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@0x0f.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,thingy.jp:email,linutronix.de:email,0x0f.com:dkim]
X-Rspamd-Queue-Id: 4B8F3C153C
X-Rspamd-Action: no action

Hi John,

On Fri, 30 Jan 2026 at 20:32, John Ogness <john.ogness@linutronix.de> wrote:
>
> This reverts commit 604826acb3f53c6648a7ee99a3914ead680ab7fb.

This seems to fix the boot crash on my sun ultra 5[0] with a geforce 6200.

Tested-by: Daniel Palmer <daniel@thingy.jp>

0 - https://gist.github.com/fifteenhex/0255982bcd76e8b2f53e15f809c2b6ed
