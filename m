Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UA6wAA+NoGkokwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C20B11AD5DF
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3646110E9F4;
	Thu, 26 Feb 2026 18:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hcHHlIcD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CDE10E16C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 08:32:11 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-4398dd671daso604004f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 00:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772094730; x=1772699530; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SvBtbVzSnnIxPFqeiTXs5zLXQvNtZRORQCiFTVJDUcU=;
 b=hcHHlIcDSHXWbZ/3dMSQJIhjswMnug4GYzf5NnqM4U/Dxcso6YL3NkcBjaY86x4Yhg
 i01afAUYfkZaigXewpaiLhDKwirPHR9tV3hGJwxMBfeKiP7+8OZVSXF2nHr40/SUCPRc
 hvOjFuEs+/aP9DBYp560B2MmN5HMvyROn9P6NorsVFBJAGve/yirC252YEL4hzZqAvXg
 KUhrbe++n2lrpq5DJb3GcKAGTj3dGU7/k1d+If4F72NtitA+TUihZAH2997p0UyR2NSj
 RiAl1lNCRb+SWu8eUnYIdMsXAVWkhCT9P2wr2LVPV8gqGPHJiPz24wKZES76kX1FcTvA
 ysYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772094730; x=1772699530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SvBtbVzSnnIxPFqeiTXs5zLXQvNtZRORQCiFTVJDUcU=;
 b=c+Yb1ym7KK5Zn8FQLkacJ7Wut5UikhjiJ03Y3BCoscZ7i/drBGvhl6IQKrhTkok14x
 0+D65FVyRi12wjpV4l8R1NlMoA9gkoQg1PfcoBpslBLnBntu1rKOTF6HxaF0LFAl2kPS
 uEYMoohFqud/rZYOchfLvw8fIZFVSqQyFjbaQg+Uj9nKOYWVSFM4ahagnqyPbEOyKNx7
 ZAEPxkLyxAEHkjJAwAqiycTVbcBYJQqL1+W2uRqYEnzwgvxSE/GPb9P3QIaW56+15mDM
 IT3BhaSDPvxKYLnT9DoqugsKPwA6Uf0l4MEkDEcpGYOPN8an1vuJDLw0jA8Bq6i+XP6l
 EWaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUb+hLzom6nH5T3cosih2YU713GIoYf+qvPtbaEa2BSXxjj7FKdJHKHLjCloBncfzynD/i7PPebdn4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzD8IfuGB0HeRBaNe/t5I6+IojoQkDbiC9qo6FYKdB5eoRcGJiI
 mWfjKbp+G3BNdxS7sSldxjex3z+PIbe7WvwcrOH+wmcIezTARlL7zNeiCAKTVNg1
X-Gm-Gg: ATEYQzwV/qRrn2nqyk3DRleBnR7kMPbvvUiveYpLIWnJGdKubEGSWF0CfLzEEBsc/tR
 ImMCO782EYsVdI+mU0U6njMgCV7b/1Y7IvMcGwQWZ4w8pqpnmjm79ud1HlOCaqF+pt6jlW9djlk
 ZB10HRiiH8JLJ47iYZI0c5rdp9U5JeBJmEwKkCXNcBRHVk+m77T1zzx9OsvcZuWubcrQU4ItFVI
 nO90KUwCrIaUqHgsbSRZ33y+9LDuZf42+Sb+9o1Yru+Pbb9clBOCxNaAzxAyxsNCxSVWKodq/TB
 yeNk2Mxao3liQGn7XOn2D1R0TeKivECPS9UrNMYEgEGY7IKoGP0DP3Q1fEAPXBmW1P8EknuVwDb
 zZ0D/6w6LnVYJdFX/tXvP86OoVQnzD70L12KAjRpn4dpMVTceaohXCIaw5fVOhV06zeytb1ZmwZ
 lzZ7KLG5k9LG2Yxq3f38xW59UGjgmH/M4w+7gz3tk=
X-Received: by 2002:a05:6000:2dc6:b0:439:8f6f:1b2a with SMTP id
 ffacd0b85a97d-43997ed6d0dmr2654481f8f.4.1772094729583; 
 Thu, 26 Feb 2026 00:32:09 -0800 (PST)
Received: from localhost.localdomain ([83.231.69.9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439934cc51csm7951057f8f.3.2026.02.26.00.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 00:32:09 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andriy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 "Jose A . Perez de Azpillaga" <azpijr@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: fbtft: fb_ra8875: replace udelays with fsleep
Date: Thu, 26 Feb 2026 09:31:49 +0100
Message-ID: <20260226083151.186260-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aZ_6QvJPZplh6xtd@smile.fi.intel.com>
References: <aZ_6QvJPZplh6xtd@smile.fi.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 26 Feb 2026 18:11:59 +0000
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
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,lists.freedesktop.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:andy@kernel.org,m:azpijr@gmail.com,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[azpijr@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C20B11AD5DF
X-Rspamd-Action: no action

Hi Andy,

write_reg8_bus8() calls par->fbtftops.write(), which in this driver
resolves to write_spi(), which calls spi_sync(). Since spi_sync()
requires sleepable context, write_reg8_bus8() is transitively guaranteed
to run in non-atomic context, making fsleep() safe to use.

Best regards, Jose
