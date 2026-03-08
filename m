Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GzbLcz5rWl2+QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 23:35:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F462327A6
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 23:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208D310E03C;
	Sun,  8 Mar 2026 22:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gZYW/dY8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D1F10E028
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 22:35:51 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id
 5614622812f47-46391f4c1f9so6547959b6e.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2026 15:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773009350; x=1773614150; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g+Ky/0ySLRx3afUW2nP+C9zA36XiUSgRRNdvNEiNXm8=;
 b=gZYW/dY8UtSBhwcGIFhwgRxSrgs7urrnWOJJ9dES8dAvLfS1oURuu40/OhKUulukA3
 nx0zOe/FgGNSdiKhGTPyRKjugtTKDcE1XgWjzpHPZnqN5+pJg7rMxJetHUmP6dsjKuen
 hWoEd/z4L/l4q1mMTYVXvSvWRWeJmbMLKUC0RSwaNEAes7jcOlEp5P53/DFvY/EqJ9En
 mxtFrnIT/bMMbHHbaGu7orzFcV7mg+ma9myslySZzXw6wuh54OEe4Hlkz+CEIwZ2NswO
 gb3fb+rw865pekF4sAUn5UN9kMTit/ZeplCFWNahittCerYX+kXdDAlot1tVWLpeVVGj
 I0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773009350; x=1773614150;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g+Ky/0ySLRx3afUW2nP+C9zA36XiUSgRRNdvNEiNXm8=;
 b=wRJabcACMNWjMkeomDZAxYlaXPdixxQ9sRynWZpV9GlZ4/yxmJjdYJXfIDfki26+hQ
 3nzvqQIfd+JZ8L0Whh/pzqiHzWsqsh0DbeLNhkr1Xte2fokV0OhidXRkctkN7cohcopw
 opG77In2osEwmS5g1KUAAY3yiG1gmegDiHpSOp+ZzE4K5tlMV7ocilNXqCtFTZnxt8YN
 3HCAFUjQ8q4YSIX6Jv2NWbSGuhKvNXFpA6lsALXBz9Spr7m5gFIFywO8q/SVIKTxAhNG
 Zj+qDmj1cv0f2IkQhtl6o08eOzpYwo9y7hX4rtOSB69q98EhIeltpmpogV6n7+lEwM5x
 uzZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJg5HG2M9ZlmAn8nqGCKWk598r0P521/s7WY389X/Bqi4uN0w5qrDCwSedoz+SOryyEUzIt+XSSTg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7X5WIO1Cf1H3zzFl7YLYRMeumD5dFbfxl2fnqAjpoBfMQ9fnO
 rHvHsqsUdL7eSYdPNBkSwuYMM8Qx7f+dtCbfS5LgosFhpQEQRd/r39+R
X-Gm-Gg: ATEYQzwSbXU08AffJY4PlMKOjroN5M9JtDfB+hqflF2/Zaozsmuw200EYlIGrfRzTCs
 qBHw4XXrzC7Vo9pbe37J5QR5c5WJ7oadO7KUh0OIeb3ChoYaYvYtPf2b72XPHUDCCabNLQaPeaY
 eqEk+pg0dodge+zz8XLRo7LbNE5DRLM3M6HuSrqmz3OwTxCqWgFFqtDlmJIYR74YmDH3ylx7Kj9
 2adr54N0GNFsVGxSIK7KYY/cDHjrXvgUAv9DJVc96+6D7Z7Hbk5+AG3Y36/klPGfWwSVdViMQ9N
 7q++Bicu1azAWsO3CMKD0rqwLFIr7aQ4/w2NvqiPHaTugj3RgJ0JcVoD8aXlrv+gWKY8Ia19ySF
 S5Pfzm8sm9+jChHo4IxOQEfC2zHUikc8Hr93Klgdc7Vwe8+Vd/Ua8U0YAwrC1ZdFBLXXhNwPxiP
 ZPqV/zvE3Yx5VTvq4qn9Q36UmqRaBIu1JLGxug53+0ChcjuiLr
X-Received: by 2002:a05:6808:1523:b0:463:8fba:5e0e with SMTP id
 5614622812f47-466dc9e0aa6mr4266936b6e.12.1773009350579; 
 Sun, 08 Mar 2026 15:35:50 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-466df93ce67sm4529016b6e.1.2026.03.08.15.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 15:35:50 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Matthew Auld <matthew.auld@intel.com>,
 Arun Pravin <arunpravin.paneerselvam@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Luca Coelho <luciano.coelho@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] 2 bugfixes found in DRM-CI
Date: Sun,  8 Mar 2026 16:35:35 -0600
Message-ID: <20260308223538.96729-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
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
X-Rspamd-Queue-Id: 48F462327A6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:jim.cromie@gmail.com,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:christian.koenig@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:luciano.coelho@intel.com,m:jani.nikula@intel.com,m:jimcromie@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,amd.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,drm.debg:url]
X-Rspamd-Action: no action

1st fixes drm-buddy's use of long-int power-of-2 fns on u64 var, on 32
bit arches (like arm32).

2nd is drm_print.c __drm_printfn_dbg() using __drm_print_enabled(),
which short-circuits the drm.debg bit tests because its optimized for
use behind dynamic-debug's per-callsite static-key guard.

__drm_printfn_dbg() doesnt have the guard, so under
CONFIG_DRM_USE_DYNAMIC_DEBUG=Y it floods the log, causing DRM-CI to
timeout on runners with a serial console.

Jim Cromie (2):
  drm_buddy: fix power-of-2 rounding errs
  drivers/gpu/drm/drm_print: fix drm_printer dynamic debug bypass

 drivers/gpu/drm/drm_buddy.c | 4 ++--
 drivers/gpu/drm/drm_print.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.53.0

