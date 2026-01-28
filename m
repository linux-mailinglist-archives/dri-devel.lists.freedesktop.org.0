Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KlKKR52emmE6wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 21:48:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 593DAA8CEE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 21:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E9D10E76B;
	Wed, 28 Jan 2026 20:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BrWUewjV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E918310E2E8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 20:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769633305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e7NjC70Wbx6k2PSI9JfnskuYqjv2MVHWZWOdPzDzqJk=;
 b=BrWUewjVlSg5XW+TSqJCA7HIwi1/xqYyE4NCvuFJrPVPuw9MCpzapovQ4/Wz5PLoroMnvV
 EcEO3Nxl5FbMWBBd2ATnP0bXJEmCjN6Vv+raA32Is6bAwG1hrBQZtpLCGhOPmqvGoq3PTQ
 kC/fdkS14Mv4B1VscB5EEYUhawOH4sI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-H8j3iNngM8WpQeTgLQRXsQ-1; Wed, 28 Jan 2026 15:48:23 -0500
X-MC-Unique: H8j3iNngM8WpQeTgLQRXsQ-1
X-Mimecast-MFC-AGG-ID: H8j3iNngM8WpQeTgLQRXsQ_1769633303
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-894727de401so11027726d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 12:48:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769633303; x=1770238103;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e7NjC70Wbx6k2PSI9JfnskuYqjv2MVHWZWOdPzDzqJk=;
 b=IblWWTxNw1EL8ZlOXLpWqY954gFa9RlvgW/epBEhsXogfHc2yPwNMyuo0j2b+0ovL7
 QUPKhHcS5JwgAD2qRJ6SvaFOoYyllbN1kQwPwnn5oaIT0dUAWdZVKtD+/dhNvQLWWTfa
 6sFkY9M9lWyIkPr6E4C9PjMqY+7nr5JqhGhKwhzJRxBnG8WgQY9RyEIAnvvjUlM9vcAy
 CYmoRW7+EOztKSyAK7/rpNr3RsgkXyeDCbKhRD2aCviRio9EcPIexDiVySY668fZ6YV4
 cOoCCDiFTdHqk5tk6ZLxf8QZzB7zWZ6PHbMhgUXQl7OXTUgYIQ46cz5/saJ7gLm0adFt
 ZY1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEdiDv9YErUetD971IPIEazt9xk0C8OumMdmhG/L16kPch+Qv8XhIlDyArKJ/kFInTDQVHzv9gmS4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNEANNimHlYsc8U7kUc9SfqhH9yAZInxblKVIxBKEJWGpRY2l2
 mb4jxLKTGVx6t6yUB+WLHvrgkuT/6Y894gFn4cqxEqjQTfETVYok6LeDw+fNT0Q9a0JXHvGndh+
 1mRRJdW/U8pUsjCI6StLESkbdHgOukCWipCkE18Atwi9vWTJ3KNN5ZDsW4vy9Va/oE8GluA==
X-Gm-Gg: AZuq6aKAs/qVLFq+Do1JpgUGINMImSuWCGkkdv3Ti4l5fXXFlmd5hY/G68DlbKmkE+n
 W+aSYv5q5JembR7sqvCRlmmMhK81Jx0Xifp16YbIfrlTwmNnI3u5LvWFeYIvH3T71oiCLojPceO
 RjO4GJYC7olyg73R1Minpbnn/uM15F7i6TyBI8vabDc51he7TjT0kFfD5UcoGvfyKiHHNrPJBkw
 9PgCh2OjW/bHPYC8wmIm9fimB5Sz8GW2skEQg/ZbDASmI3r2nMeY9LO3sU75Kk8iSa9ZXRnRJvX
 GSao1zq8Y7Jellp+yWhSNHAlT3t4BOQ4bKei1CmIVd5oG3D0wZBEeQz8JaJgBY+NRHVwYdjBeIi
 065ureekK
X-Received: by 2002:a05:6214:1c4c:b0:894:6da3:219e with SMTP id
 6a1803df08f44-894dfb2fc42mr12642596d6.25.1769633303102; 
 Wed, 28 Jan 2026 12:48:23 -0800 (PST)
X-Received: by 2002:a05:6214:1c4c:b0:894:6da3:219e with SMTP id
 6a1803df08f44-894dfb2fc42mr12642106d6.25.1769633302582; 
 Wed, 28 Jan 2026 12:48:22 -0800 (PST)
Received: from localhost ([2607:f2c0:b0bc:f100:e97:de30:9768:6518])
 by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-894d375debasm24038726d6.42.2026.01.28.12.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 12:48:22 -0800 (PST)
Date: Wed, 28 Jan 2026 15:48:21 -0500
From: Peter Colberg <pcolberg@redhat.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Ivan Lipski <ivan.lipski@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, "Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: Re: [REGRESSION] drm/amd/display: Add an hdmi_hpd_debounce_delay_ms
 module
Message-ID: <aXp2FRLJh-7Q6TxS@earendel>
Mail-Followup-To: Alex Deucher <alexdeucher@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Ivan Lipski <ivan.lipski@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
References: <aXptBPF3L07zJB1O@earendel>
 <CADnq5_OqFEi_ML9zR-i_WFtFmBBQQcbQNRAiP8pVdD+prvEoiQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADnq5_OqFEi_ML9zR-i_WFtFmBBQQcbQNRAiP8pVdD+prvEoiQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 83D3QA0LIW2WB0DskmVIgDLuUFyzGQ7x33FUpfccot0_1769633303
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexdeucher@gmail.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:ivan.lipski@amd.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:regressions@lists.linux.dev,m:superm1@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[pcolberg@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[pcolberg@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 593DAA8CEE
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 03:17:18PM -0500, Alex Deucher wrote:
> On Wed, Jan 28, 2026 at 3:09 PM Peter Colberg <pcolberg@redhat.com> wrote:
> >
> > Hi,
> >
> > I hit a regression introduced as part of v6.19-rc6 (and still present
> > in v6.19-rc7), where, upon unloading the amdgpu module, __flush_work()
> > is passed a work struct with the work function set to NULL. The issue
> > is seen with an AMD Radeon Pro W7900, but not an AMD Instinct MI210.
> 
> I think this should be fixed in:
> https://gitlab.freedesktop.org/agd5f/linux/-/commit/17b2c526fd8026d8e0f4c0e7f94fc517e3901589

That fix applied to v6.19-rc7 does indeed resolve the issue.

Thank you for the pointer and apologies for the noise.

Peter

