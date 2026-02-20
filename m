Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mC9GBgIfmGnhAgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:44:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD994165DB7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31B910E7EE;
	Fri, 20 Feb 2026 08:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mIp/6N7K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E809610E771
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 03:35:22 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-59e6491f1a2so1912523e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 19:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771558521; x=1772163321; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qs3XtAW37afRA0+1P/Gos74N1AN9EdwS5RQcuwJVsX8=;
 b=mIp/6N7K3VXw4zFwiXo2IzSuOnqy2bdz06eHp+3qdAvdyD0hujxFwRMjNF+cfJ7NBI
 JKkMmn7XUBQHC4UMfjHPBAIcKNTSbIrqn//WVFVg3Cuv0LqX+37R0oZR5qF48OM4rw0D
 B1rTT6RmRZl1uodsrQO93jjj0k9XqUBoJBbwcADVYQ0020GUE6rt/PSjukFTSYHZD0Je
 mnoxiNv+x1zaNk3pG+dwAoinlHTuRePxSPp0Z0Mi8OsngmLhEFRa3VivXUEHlnSuJrhY
 a2i1dA63s3W+j/hRUsYn/PrIUA+HZNY57Dbb/cSzrAATwKwvXMmj/hG/1b452cW3kC8i
 m05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771558521; x=1772163321;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qs3XtAW37afRA0+1P/Gos74N1AN9EdwS5RQcuwJVsX8=;
 b=hjXalVncwge8dqNlLGMDIIrB4DsHXBMENhUt4GIfh3Tl6nRu6JEw9SbXegeLTICFj+
 CKgRHp5F2fesP71Njls/Ij+FgSJn6vw4avSUygz9N+2qx0JVrZZk6F+/7qKUSoouddmt
 yLVyWSXVIknGm354slgef0GN4WWEWwZAuj/PI8rpVLxGrP/5dfA+McVa1CHn6jTL4G1b
 yPd60AN6iTsb4L/x3RGA6bJq8KheMTiE5Awk3JDtoW+2z7YpaUIbeDTsYmbil0EBc2Vf
 3xg+9ASK3itSYpABOpAvnrgoZ8yJAehytHf65DMNKDQ1aWMI/zhGBEbZH9do4c7iHhGd
 se7Q==
X-Gm-Message-State: AOJu0Ywcg2YzhdP6vUBY2BoSrHZw8gZdrsinpAh1srn/r6uMsUIk9SmL
 d/IDjDBHOIc2fWyTrJs4a+dJJUOl0GqELr419M8ZswMWQDmpaOBvGGw=
X-Gm-Gg: AZuq6aIFVE3CZnMDlSGNOG1J8AZEvrWdYF2dC07BeqJBcktqXRp1CRub57MNnlNxL/Z
 +cxMQG8lMANgWTNmyaUvZOnLJdyqF/CIHuAox6f6B+HEnkchACe2HynzBy9IZ+ekvMhlB1xNPlE
 uTu3YMNK5iOHW2HvQ//YlRE+xmoKCyu13DZMTIAdjSadurTqyI4FuUbghJ0kaeLVOzSmZDBn3z6
 19voN4vPt/ReJjFKHhoHtww1L2oDxadNjWgAqwojX4JshVCrWtnS12vcBChiDASccxTMgWZU7XO
 UGgsOx9/SJh4BKz/Y60ULWthX9+ZrE9rUGLCaU5CDQO0wBbevi0pvjFw/BBHWJjG46isZIqU0B6
 rzaVyqNjLIrYtUWBDWsbgz4tZOTgLvM4GJGhOey/tqCFS6sHgf32m5AAcIfiSP+GVwwboKxEiAY
 LL/W2/1g0=
X-Received: by 2002:a05:6512:acf:b0:59e:62ea:239c with SMTP id
 2adb3069b0e04-5a011eb09e2mr110065e87.8.1771558521108; 
 Thu, 19 Feb 2026 19:35:21 -0800 (PST)
Received: from localhost ([2a0e:e6c0:20d0:4f00::1d])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e5f5ad733sm5745912e87.69.2026.02.19.19.35.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 19:35:20 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 06:35:19 +0300
Message-Id: <DGJH30US2XMK.S2HOHR14LIW0@gmail.com>
Cc: <dri-devel@lists.freedesktop.org>, <regressions@lists.linux.dev>,
 <mwen@igalia.com>, <mario.limonciello@amd.com>, <alex.hung@amd.com>,
 <daniel.wheeler@amd.com>, <rodrigo.siqueira@amd.com>,
 <alexander.deucher@amd.com>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, <christian.koenig@amd.com>, <huangalex409@gmail.com>
Subject: Re: [REGRESSION] VRR not detected on a DisplayPort monitor using an
 AMD GPU
From: "Ivan Sergeev" <ivan8215145640@gmail.com>
To: "Mario Limonciello" <superm1@kernel.org>, "Ivan Sergeev"
 <ivan8215145640@gmail.com>, <amd-gfx@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <CAKx_Wg7_HBxuq5W4T_AmoFYJGQpa6TAS_Fx9SUzyy1itPmj5Bw@mail.gmail.com>
 <090d89a2-4f80-44ef-827c-6462d8948493@kernel.org>
 <DGJFVPAQJA15.378GMU7XZXLU@gmail.com> <DGJGDIRQWDG7.XHHKF6UQP0HG@gmail.com>
 <c70fe261-7fb0-4af5-b755-f02b193c8c5f@kernel.org>
In-Reply-To: <c70fe261-7fb0-4af5-b755-f02b193c8c5f@kernel.org>
X-Mailman-Approved-At: Fri, 20 Feb 2026 08:44:31 +0000
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
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.linux.dev,igalia.com,amd.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ivan8215145640@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DD994165DB7
X-Rspamd-Action: no action

On Fri Feb 20, 2026 at 6:14 AM MSK, Mario Limonciello wrote:
>
> Can you check out at your bad commit and apply just 7f2b5237e313 at the=
=20
> bad commit?  Confirm that fixes it.

Applied 7f2b5237e313 on top of 0159f88a99c9 and the issue persists.
