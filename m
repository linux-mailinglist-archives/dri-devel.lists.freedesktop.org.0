Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NWmK7F2g2mFmwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 17:41:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09695EA63A
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 17:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD5E10E6CA;
	Wed,  4 Feb 2026 16:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="mY6N7D0P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6DD810E6CA
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 16:41:17 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b8860d6251bso1067597966b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 08:41:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770223276; cv=none;
 d=google.com; s=arc-20240605;
 b=Lr0e2ykEkSGCB7xCRaCeQmdXjQsrNA9TJTHxf0ymzICSpOTmYNWHfR4lb22PY6KGhQ
 eH+6umO6i0ahVyV53vRHEqxr8432FBP6XBC5er5k3wiVyB6jDuYlDJ0AF1VXlr5KJE7a
 n9k3A+ABTXIrJp5D07cMebsnEFOzM3pHhLTeWjf5cggJIgZyVoMbDzmyUFcet2gYsCTx
 FNlp7Jfe2wNC703dVZnRkwyKsQC3ImZtvRzj6DH0/A6q/baeic8vcQ2hTasSNExjKwFJ
 cdtfJhXr14utaBosXtEZ7OLqJgYEc8KiWtZ+CFXEvmzTueYL1snkLZ8/1tzcrdVonZVW
 rZkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=6H20zi8+AvWZmoZ2d8/Vb8BEwBllRonR5eGO+tKukdg=;
 fh=jQ2MEFHYtfAluhTh/HfL0/vGIPdgobaM1T+TNocmAr4=;
 b=SVcMJ0kdPCKDbQsBgkj1dmg6pez9j8Jwi0kyBtPS2dWCFES3vU1+Zq/yaSXhqxTFPQ
 Ye8Y1XYoQPPmakqlXWdNsje5AOVo2tgSQ2IfnH+mAUtVAz2doI8H5vWQGJO3PH8ZIAvz
 bHV9DzuTTgRJhiqxUSM2fB73HY/J9mlEzvtxnocGpvV8g/d7gX9cjEjl61kPeCPgK0hS
 60uFVS7+EY4KF06kY7PYLPRqJEhIcjcNWk4lCHU/+OWLMoX1ZK4W1HJpzL5y1EyhpORw
 8CdtV9XrdfjWlB1kLE9n9EL5CnoTHnOdz7GCFr9Bef2IKyX9gx3tufPrsY6BxH2l9aMU
 YaSw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1770223276;
 x=1770828076; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6H20zi8+AvWZmoZ2d8/Vb8BEwBllRonR5eGO+tKukdg=;
 b=mY6N7D0P9i+L7zxZDUZg/pdPJueowWKl0nyWO0bqr1cYxNndUsU2Sdv75ZNXmXy60u
 Qa4DpI5Y461FYBfK9Ip2Kg9iTuV5nR3/rfwCCBofwU6+ENhc/vtumcaRCw4HO09XZSjW
 gT0GNyrenbeu60fIC9jQ6eDQbxKEoqCUvkly8SVMe+9T+xW4Fax5KwnqNcwwZg+sRRau
 m+psfg9KF42rQfaoEY5BuQK/9a+TGQGVTooMzGvshIg+V8+ezyIZPVLQpFIHTGVKztbJ
 9d5RAyIPLKtfLtQVe2cJ74ueZJPfgh0EuDCq6RBF/TCMVXoaiJtf7YNAQC2neYVkAJW2
 OKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770223276; x=1770828076;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6H20zi8+AvWZmoZ2d8/Vb8BEwBllRonR5eGO+tKukdg=;
 b=hi8ostp5t2QKsemDWNK10bEf7C7T5OM0jwfKTNBzZWzMVe2SjoYrmRUDVxBF0+amiU
 2n4IbSmqalcpsspi/6TriVtS8ws99OCauS5z3Q2BXa29vwFSfTS5aqTh+E7WPKhwrfZh
 IfV0gpJ9nJgKzEwfxQiNK/WIrQ8dkicoFZYEgsq5PV3V5AygHYlemaZGumlEL4l0iKmC
 mrewjutWzfVGB2CyVUF82dPPmiBOtA+CPa7ngSgLO+w9LdGzaU8vt2GO3mLjO/gVGzRy
 YR7+vD3U8tboJUJHZ3HD+AVgGFpXf5fBlmtBqLNT/t+nx+ER88gCmgbQ9LWOIEqKJ3MY
 bhMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkDZ8+kuPMKN3S9GwGC4Us5+aZYeCICSbu8tPBaQCr2s3WZVYip/YLTw2g8WrUfgBK66WbU18jbIM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywx9nhyHhCUwdwOKv4qQaJMkdoAy8pW7gpB+QrA/tAbOkEAuMGQ
 viPr9aavBZUDymX6LTTvy1aQhTSaCPQhnadASOQpvqNXHVf58RemLjVAxCRyhWhcDdpoltJ6ZVM
 WQR7YjSt4H+wlSg5iTUWgPw4Q2y7wTwBtJeNnm0iNHg==
X-Gm-Gg: AZuq6aLnA75cAEkZrr4GllLhCzZWXsKZgLfSSVVhb6CjXjm5yArdo460Xk0vcpL+eQ2
 FEFPMj7wpdzj6VV64Hng8dP0HuSWZEUWVPGR+nyVhi4F1lj7cVonIFONQVMAGwCuQ1EpapHD7Ln
 eVEoa4goCDimPQHfhX5jYWE1zz3d3wFSmijQxzcFw1lIWlSCRyuqbzLSBAPEaa1ZRrW5HkWM/rh
 TJTnjFCNhjxP0Hy3f/un9Y4IKQEkvWhu7JEFZTpQVP1YF6Av+Q3KeijseVfKogF5pdbPhk=
X-Received: by 2002:a17:906:eec9:b0:b87:117f:b6f0 with SMTP id
 a640c23a62f3a-b8e9f3e2e97mr253155066b.30.1770223275965; Wed, 04 Feb 2026
 08:41:15 -0800 (PST)
MIME-Version: 1.0
References: <20260204030208.2313241-1-airlied@gmail.com>
 <aYM-9GzXxbExyiVi@caroline>
In-Reply-To: <aYM-9GzXxbExyiVi@caroline>
From: M Henning <mhenning@darkrefraction.com>
Date: Wed, 4 Feb 2026 11:40:50 -0500
X-Gm-Features: AZwV_Qh0Tr7h06-qOfBSaU9OUFifYwXkh1UdL4-plmXRgoSDFWkz1WJIbTln44Q
Message-ID: <CAAgWFh2=8ecCCSMp4eKx7ubvmeC3fRnbtboPYC4Lf1cWH3RORw@mail.gmail.com>
Subject: Re: [PATCH 0/3] nouveau/vmm: fix switching between small and large
 PTEs (series v2)
To: Mary Guillemard <mary@mary.zone>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[darkrefraction-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[darkrefraction.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mary@mary.zone,m:airlied@gmail.com,m:nouveau@lists.freedesktop.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mhenning@darkrefraction.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[darkrefraction-com.20230601.gappssmtp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhenning@darkrefraction.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 09695EA63A
X-Rspamd-Action: no action

I also tested this and it fixes the issues I was seeing in both cts
and my reproducer script.

Tested-by: Mel Henning <mhenning@darkrefraction.com>
