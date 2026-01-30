Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6H4RGaN0fGmAMwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:06:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8DAB8BB1
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520DE10E97D;
	Fri, 30 Jan 2026 09:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vgcm7f1K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com
 [74.125.224.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7276D10E074
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 07:35:49 +0000 (UTC)
Received: by mail-yx1-f47.google.com with SMTP id
 956f58d0204a3-64942021e57so48565d50.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 23:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769758547; x=1770363347; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3pWjCokOak7KJ7tHTLhW+SirnpsC3AhrjF4FgaKm1+0=;
 b=Vgcm7f1Keo3Bv8L/D3DQLgf57L60KxOlubiMiqlsjaIrhQzlLo6oVkovwB2WuB5vSj
 uGz5xPXs/XI/0b/Rh27oYP+fHffiPoZr41egEqixDkmyTQrQAJEjfGjoJiNY7EKLrOUC
 1Cy/iRa08BvbKMw1wQ4nN/0z+cn7Jz1CGMc6H9qlxuWZfxF0vcxwODu9CS4v07KbkEIZ
 CJ9fiGCqjbH8/b5zBSpS8UPssVlrcmmcUEdciAhGL0jRIZTUfiyVZWaXAZrslvTY+bde
 EexTVabYOaNEVqaz7GHFUDv1u+HzwGDDU5COreQ+Qhhd6i2TIiAiSuAhdpOPCIQvH2oz
 MlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769758547; x=1770363347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3pWjCokOak7KJ7tHTLhW+SirnpsC3AhrjF4FgaKm1+0=;
 b=uQizhTsZR85s8T9ZTiuqKFeiwbUhRKd3eizVen1plaP2NKd/Rwz6fT45txSXRT7Zey
 Ty+2fr6HT6mQd+K8w4ZQNW/QYvh9OCIjiXpfbf2AmaxrDenexPuVb83OCL193f0mmCdX
 ZE3X68ieKarYk/CtOkWE/Jx37e0VVQnCflIYF/bW/UemIlyGFx0JTy+1+nD+Q2bkvEXR
 2CVS26NMdXEuX7ap82qRIax+3Q7CFhLp1ivv/a9iWLGxkReBOlj6Ez/6TJc6Av/qDrLc
 6EARzY6PMxlDMDfFpoOgW2KPlFmtnHG7q55MJWnJpl7N2inCTu1xBuJFvfqIXznzyHMu
 HkDA==
X-Gm-Message-State: AOJu0Ywtzak8hRsSWplvD1GsoXxLO69qoyCS0HRmK8SDgtk1O3B7kFtj
 oo5Nnn98EV3Sfdbv2x7aU6EdPESy6tA9UuaHqmFoYJ2kKRbHd8ra7Meb
X-Gm-Gg: AZuq6aLVVRstC3jnA2n5IBJYg6DH2JYvRJGVlO9ORvch63JvN/3uucyv4e8sL56zwHb
 Tq1HWZYm2h+IBI21iOovvhxOJIS2yy0Q1rWylYHBsg/baL78D9A2os7/p8e7UmW2TD49dj+gKhi
 W3GwVn9AJl2AcTx9+hvGN1on5VGV205AzjbgG6LopywM3PAfLfuKJnsGpsbm7BjQAuq/ZFFGZDL
 HyIgJWjSndYX/Xi3hixhhwBb+XVtU8xavzbosHcJxnd19LTMvbwOLNvwcTtUFeDR+NcT49fWe4D
 08qh8deIiHyFsyj+UVuadRilmIiIiiUNfqjVOGNYkp+ZBjoRVu2ay1d5mKbN4hz2dB40v7SNPSX
 C/KhhfHvpELFgojHkN71e9CxibyDgGecIj6dA4u+irEpLL/gDg2YKgo5Rr3d/hVO+6IyqdgufOo
 bjc9+mEpjW7KlBWFV52PhMb9yN4ck17R8URIKd
X-Received: by 2002:a05:690e:1404:b0:649:3bd8:22a0 with SMTP id
 956f58d0204a3-649a8516227mr1359053d50.5.1769758547288; 
 Thu, 29 Jan 2026 23:35:47 -0800 (PST)
Received: from minm-home-ubuntu.attlocal.net
 ([2600:1700:6470:8880:28fa:fda1:cdfa:351b])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-64996063fd5sm3363067d50.4.2026.01.29.23.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 23:35:46 -0800 (PST)
From: Min Ma <mamin506@gmail.com>
To: zishun.yi.dev@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lizhi.hou@amd.com, mamin506@gmail.com, ogabbay@kernel.org
Subject: Re: [PATCH v2] accel/amdxdna: Fix memory leak in amdxdna_ubuf_map
Date: Thu, 29 Jan 2026 23:35:35 -0800
Message-ID: <20260130073535.74467-1-mamin506@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129171022.68578-1-zishun.yi.dev@gmail.com>
References: <20260129171022.68578-1-zishun.yi.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 30 Jan 2026 09:06:10 +0000
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zishun.yi.dev@gmail.com,m:linux-kernel@vger.kernel.org,m:lizhi.hou@amd.com,m:mamin506@gmail.com,m:ogabbay@kernel.org,m:zishunyidev@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mamin506@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,amd.com,gmail.com,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mamin506@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SINGLE_SHORT_PART(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1C8DAB8BB1
X-Rspamd-Action: no action

Looks good.

Reviewed-by: Min Ma <mamin506@gmail.com>
