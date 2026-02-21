Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGpnMSIMnGlL/QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 09:13:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B12F172F77
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 09:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA91A10E271;
	Mon, 23 Feb 2026 08:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y69RQlh+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F3410E0F9
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 01:39:21 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-38706b63929so24593471fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 17:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771637960; x=1772242760; darn=lists.freedesktop.org;
 h=in-reply-to:references:mime-version:content-transfer-encoding:from
 :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
 :reply-to; bh=VxhPVUyoO3hiTWkFoFkhmqlDhO5q4VD+zDs9agEE6iI=;
 b=Y69RQlh+tvkaCQ7IigtHgjdBYMJCNp9K4II8BncJo7LeQWQl6ZthX3dIGlw4v63CgP
 BHGZw5c0vLxIQscrfSpLwzjjOlxDe1OlQm3EoPf/tuyfQBKYPMAP/P09vm0cF7ynTPtU
 ennFuC/FRg+S8KPybEQNjD2nCyA9ShmyiaSSeqWjP5bkOOyNSyLUhwAkL4/lWMUbnV8u
 cmBDgp0UmBPW3QUV/neV/Wowti/RQSFkkOGC4doOy+rGtf7AF8ZXdUUtyhhM/c3NhCFp
 1TVguOfSxOuM45e/BWbjT4SR0GLYbqOjSiDyGuNq+4BZdqmF230wLfVMuYGvU/ILMiSE
 56XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771637960; x=1772242760;
 h=in-reply-to:references:mime-version:content-transfer-encoding:from
 :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VxhPVUyoO3hiTWkFoFkhmqlDhO5q4VD+zDs9agEE6iI=;
 b=iUT5tuGy8Sxytmn9QEukp9Eekvd9U+ZgaROf7fQDeun9xxm9g6igb2pVfmhlqm5TW1
 +MGF7ALGEsglN3yY/o6v4zQms4E9xD/2322/CMH181BtdDLzVcN/uhqvCqVAkhVgN0LY
 rjVrxUcxKlZtMR/y+9OMhwG5Tqkf1rUYLqpU4Qa7+QQarfh38fClImjUYnrmbytHVnME
 EGIWq4qpTdnVyU+B9Xg8Av5n70i4ZmWSpkUI5xLIm3JWEG3ke8lyjhYSbZhuUJX+b3jr
 Nj1nOcqrt9i9KS/zaVWmFMYUuF/zpByU/LmtQoOKVMwT51yGSYULVUaSzSyLp331jit3
 wuew==
X-Gm-Message-State: AOJu0YzDPlsKPGR1cFWIpM35xvwcAwpRg1C2Kn0nq7jXXuAa9Y3clbe5
 GVwlwwonZPHSxSnx7fdSjBeymMNHUIAouwR801G8S8nR6ZboVtjgaFE=
X-Gm-Gg: AZuq6aJw9YQz59Rgx2mEtHu3qu6becVDGq7egp8J7eHsuRKu/HncfSl+lLp2oaokkhm
 +wpbyR7yP3kHfYCLoQ7ja0nUuvBVYqnr2DbzuQ5dUIYx6HNAtI4atWrGYh/XMfn5oEN0JDMXvcw
 imKr+Sj7IIckTLm1UDGX3RHCV8hLjAaYmfCh8Y/z9vAJ1alrxbTXfDB++MFKKoD9sCQ8ZlM7yZH
 faQWamvNxtNOycrzR3p9BJ7GBHtUp2JGmZrTPm6V+n78ot64hqyRV8ODMcx2W1fPgF48iDnXkcO
 eIPJXSx08GX5EYMZ2SkREgyrJE2t/Ds2tOzLSf5laVrML8bYsSSjqmvJOHjf0A5nl5jpAT68Jlj
 UMDnwDQZKkEwnrCHVdiGIyrgDLWE1oc9Slvaj1MMkDdqE0hd4KX9rPdr7pBX5DqU+SbMPtG+S0A
 pXvgguUvll
X-Received: by 2002:a05:651c:31dc:b0:386:8f97:d0b4 with SMTP id
 38308e7fff4ca-389a5e4cf70mr5274401fa.33.1771637959898; 
 Fri, 20 Feb 2026 17:39:19 -0800 (PST)
Received: from localhost ([2a0e:e6c0:20d0:4f00::1d])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389a78d2326sm1752321fa.15.2026.02.20.17.39.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Feb 2026 17:39:19 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Feb 2026 04:39:18 +0300
Message-Id: <DGK98QFUDRR2.1RCLDXI8XRBFR@gmail.com>
To: "Melissa Wen" <mwen@igalia.com>, "Ivan Sergeev"
 <ivan8215145640@gmail.com>, "Mario Limonciello" <superm1@kernel.org>,
 <amd-gfx@lists.freedesktop.org>
Cc: <dri-devel@lists.freedesktop.org>, <regressions@lists.linux.dev>,
 <mario.limonciello@amd.com>, <alex.hung@amd.com>, <daniel.wheeler@amd.com>,
 <rodrigo.siqueira@amd.com>, <alexander.deucher@amd.com>,
 <harry.wentland@amd.com>, <sunpeng.li@amd.com>, <christian.koenig@amd.com>,
 <huangalex409@gmail.com>
Subject: Re: [REGRESSION] VRR not detected on a DisplayPort monitor using an
 AMD GPU
From: "Ivan Sergeev" <ivan8215145640@gmail.com>
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Mailer: aerc 0.21.0
References: <CAKx_Wg7_HBxuq5W4T_AmoFYJGQpa6TAS_Fx9SUzyy1itPmj5Bw@mail.gmail.com>
 <090d89a2-4f80-44ef-827c-6462d8948493@kernel.org>
 <DGJFVPAQJA15.378GMU7XZXLU@gmail.com> <DGJGDIRQWDG7.XHHKF6UQP0HG@gmail.com>
 <c70fe261-7fb0-4af5-b755-f02b193c8c5f@kernel.org>
 <DGJH30US2XMK.S2HOHR14LIW0@gmail.com>
 <bed447c7-07a3-46a8-9bcf-da352810883b@igalia.com>
In-Reply-To: <bed447c7-07a3-46a8-9bcf-da352810883b@igalia.com>
X-Mailman-Approved-At: Mon, 23 Feb 2026 08:13:16 +0000
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
	DATE_IN_PAST(1.00)[54];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mwen@igalia.com,m:ivan8215145640@gmail.com,m:superm1@kernel.org,m:amd-gfx@lists.freedesktop.org,m:regressions@lists.linux.dev,m:mario.limonciello@amd.com,m:alex.hung@amd.com,m:daniel.wheeler@amd.com,m:rodrigo.siqueira@amd.com,m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:christian.koenig@amd.com,m:huangalex409@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ivan8215145640@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[igalia.com,gmail.com,kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ivan8215145640@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.linux.dev,amd.com,gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7B12F172F77
X-Rspamd-Action: no action

On Sat Feb 21, 2026 at 1:47 AM MSK, Melissa Wen wrote:
> Can you check if the attached patch resolves the issue?

The patch does resolve the issue!

There was a problem with my particular setup caused by the fact that my
greeter didn't have the VRR feature enabled, which made the desktop
environment take longer to start and the following error messages were
printed to the kernel log:

amdgpu 0000:2d:00.0: amdgpu: SMU: I'm not done with your previous command: =
SMN_C2PMSG_66:0x00000028 SMN_C2PMSG_82:0x00000000
amdgpu 0000:2d:00.0: amdgpu: Failed to enable gfxoff!
amdgpu 0000:2d:00.0: amdgpu: SMU: I'm not done with your previous command: =
SMN_C2PMSG_66:0x00000028 SMN_C2PMSG_82:0x00000000
amdgpu 0000:2d:00.0: amdgpu: Failed to set workload mask 0x00000001
amdgpu 0000:2d:00.0: amdgpu: (-62) failed to disable fullscreen 3D power pr=
ofile mode

These errors do not appear without the patch, nor do they appear with
the patch if the greeter and the DE have VRR enabled (in my case, GDM
and GNOME Shell respectively). I have not tested the case of greeter
having VRR enabled, but disabled in DE.
