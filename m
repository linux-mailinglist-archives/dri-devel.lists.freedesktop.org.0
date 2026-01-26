Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4O/PKI8/d2mMdQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 11:18:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FA286A9D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 11:18:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5907110E3EB;
	Mon, 26 Jan 2026 10:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ex193uT3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6B910E3EB
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 10:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769422731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZRi6iQH1rseIkOiANq12S/Rs1DVNnpmMGGcReclOaAQ=;
 b=ex193uT3bf0+xyAwrYnCls7QPJ1/Bkzy00tRY91p65zhre8yjNnUuNEc5XrLRMfjEbhrAF
 A9SvbbgzeFxH6tl4aqoG1WldyH8wZB9xpAuAELiuYAMq0q6TaA9NuVYQI9Grp/IMYTx7Tw
 R+rIMGVTyVnOQVB7KXz2EHGKlqRcA6Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-OLl6L_K4NrmBJaqcX8r8xA-1; Mon, 26 Jan 2026 05:18:35 -0500
X-MC-Unique: OLl6L_K4NrmBJaqcX8r8xA-1
X-Mimecast-MFC-AGG-ID: OLl6L_K4NrmBJaqcX8r8xA_1769422713
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-432db1a9589so3379345f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 02:18:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769422713; x=1770027513;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZRi6iQH1rseIkOiANq12S/Rs1DVNnpmMGGcReclOaAQ=;
 b=afCo+d9CSF70qj6/jMab0zRHmE+B6BJ7C1QcdsxbVpI6RKR4KugKD2d/w62iIJxOtc
 sGC+FrCiepRPPHFJFJauAUHhVtOpkNwiq/EgZdwr/zfNRxUG5r2BChPq1m+/zqMw6pUe
 hi9Opc7tFpff+qkLRw3HAD1MxMAIMeZLwWiE1wUTy9vXSF68yD0De/mBZdobwKyP0BdK
 eTEmMeWsYuHwCYB1iPZObaTu3YKxtx3aoNeKeeAx9tyELR/f3ZKCNXxb5TDfPKEigzAL
 +aPz3l/eQhsiGV7jsi1mtqxVdCFQHXfHozb12iL1AFF8cLQImTPOgmbm2x/O00Ea0WJL
 ZDtg==
X-Gm-Message-State: AOJu0YxD+hp70HXhhwLe21e6PGGcbBjneKEwbRWO/opdNR5eAOs6VARt
 k+bZjxv6/33UszxWL/aebayiRMwv3SXFIAg5HiLM/qe/gbzhvMTRa5s8FjPZ49v33FrdrIHP/YF
 OHvOSWbugFSBrRkZsRz3Gktl5Aq/BEIHYFJJcl244BY4y+pMBRB5Snrl+RBdnGzZjgpaCRQ==
X-Gm-Gg: AZuq6aIOQPzS/Mlau7lbxWXaGspXUTRi/Y78+Fs9Y2yMBKXS0Zdta9Um+4o417Dfe9T
 wrnUBuzGGt4HNAvBeUdDier8s++W2TBACE7mecbPnkmqisc53lO/UfNHULCxjOhXRHuyk/EaGvw
 c5fX7TDPR9tBXtsDxOexcG4gJSg7m8JvhHkKNpW/sWr6ijWQedaZJlcsvWEvRK40Cu3stxtc3oS
 gxw/wGahQR7hYL63mh+gsnNmprGMiZEM9x1nTA9yR0co2fuGkPPIsq+gPWB6mu1fDAILlItvudC
 fx1QrvQbU0lNbAnrdB7qhZtiHJspb7/l7TDBdxuMxuDFeOJS+qyXJT0zE2bkM/BD5cO0Y11n22W
 fed1OrVsfw6xJNEh+Pltop7BxzTU1HgBgYzAY5vX3aUNfPj4f6QrvQvmqT2YkbPpC49Gw
X-Received: by 2002:a05:6000:1849:b0:435:8fe2:e690 with SMTP id
 ffacd0b85a97d-435ca3a8ffdmr7512907f8f.58.1769422713143; 
 Mon, 26 Jan 2026 02:18:33 -0800 (PST)
X-Received: by 2002:a05:6000:1849:b0:435:8fe2:e690 with SMTP id
 ffacd0b85a97d-435ca3a8ffdmr7512864f8f.58.1769422712692; 
 Mon, 26 Jan 2026 02:18:32 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c01783sm29915795f8f.3.2026.01.26.02.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 02:18:31 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: luyuantao01 <luyuantao01@163.com>, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, luyuantao <luyuantao@kylinos.cn>
Subject: Re: [PATCH v2] drm/panic: Fix the potential loop that causes kmsg
 to not display correctly
In-Reply-To: <20260126100732.365-1-luyuantao01@163.com>
References: <20260126054059.295-1-luyuantao01@163.com>
 <20260126100732.365-1-luyuantao01@163.com>
Date: Mon, 26 Jan 2026 11:18:30 +0100
Message-ID: <874io8vfrd.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pY41Rt-EHEhs89PXOeQYJuINm7DOaDGXbdUwvJMmFTU_1769422713
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:luyuantao01@163.com,m:jfalempe@redhat.com,m:luyuantao@kylinos.cn,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[163.com,redhat.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[javierm@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[javierm@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ocarina.mail-host-address-is-not-set:mid]
X-Rspamd-Queue-Id: 08FA286A9D
X-Rspamd-Action: no action

luyuantao01 <luyuantao01@163.com> writes:

> From: luyuantao <luyuantao@kylinos.cn>
>
> When kmsg_buf completes drawing the screen and yoffset is less than 0,
> kmsg_dump_get_buffer continues to obtain the buffer. This potential loop may
> cause panic_flush not to be executed immediately or even not to be executed
> at all, resulting in a garbled screen display instead of normal logs
>
> So, the loop should be exited immediately after drawing kmsg_buf
>
> Signed-off-by: luyuantao <luyuantao@kylinos.cn>
> ---

Makes sense to me.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

