Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FCB2278FB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 08:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7946E296;
	Tue, 21 Jul 2020 06:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808026E296
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 06:44:26 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z15so19980812wrl.8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 23:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=XLBH/lbG1JbNPQLhLMpr3SrlFtcwyho8npoZGQi+xP8=;
 b=BuM3Qstq98QzNt6F6557hx6512dd4iOZTH4thAXryG44zbI+lvZd5+QoVZbTSqDBMP
 93zrlUiVHzVjzkZXnqixGeMLr8mYZbxkniN2HeI12MrVNA9hJlgFl08gS1UfZ/FUgxET
 QackozUdZsBf0DC0Rnj9uBlkyblIgKnaHlpPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=XLBH/lbG1JbNPQLhLMpr3SrlFtcwyho8npoZGQi+xP8=;
 b=a9W4/crEW3oUkuy/GzBi8dLs6Mb7s/EDr5+A2JXUe9piILW8WrOlNMGDVYLj5NFBX8
 jOr4xUSBs/7sgcmv8PEj3QAaAxMNnXSfph2UlQ+R/xaRdt4EOjceYMsC+SmRxndzJcJu
 +yBUMWSMjYocvAZVXMEC0K9pvkhLBMatE/cfth4JmyrKNIu0gH3PF+BFke0tF1NmmBmf
 UB213zsNrcgIsEcRgqGZiKsApBFTk5gb6YOcXgjh1QSGPe2i7kJYrSUmNIuLDr0cqZsP
 0eMX7FveX5O67T3OLlxZ1INGzV3M3cVf39FKSCVpm8c0Rn4pf8MVTumBhDC3RyBm0ZKc
 6oDw==
X-Gm-Message-State: AOAM5306RjdOG/S3A/t2lqecX7Jh/HDRt4r6hjICWnEg1yWI+jyLFr4V
 MwU+HcYQgJ/MoKmxb93lyTEGGw==
X-Google-Smtp-Source: ABdhPJx+1B27Md5ydM87FoadIhvwV71ppyIKT5LibLTn5acfdCI2eItikuk2Fwco1jPIYmE9L30yRw==
X-Received: by 2002:adf:ab46:: with SMTP id r6mr25441574wrc.260.1595313865141; 
 Mon, 20 Jul 2020 23:44:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w2sm35779083wrs.77.2020.07.20.23.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 23:44:24 -0700 (PDT)
Date: Tue, 21 Jul 2020 08:44:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sidong Yang <realwakka@gmail.com>
Subject: Re: [PATCH] drm/vkms: add wait_for_vblanks in atomic_commit_tail
Message-ID: <20200721064422.GZ3278063@phenom.ffwll.local>
Mail-Followup-To: Sidong Yang <realwakka@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200713160621.GQ3278063@phenom.ffwll.local>
 <20200714102009.4qxgdq5bkpwhhhio@smtp.gmail.com>
 <CAJeY4oF9k--dGOYaC9qAXiVbx6aX2a6isXpfOg+JV2s+UskKGA@mail.gmail.com>
 <20200714140904.GF3278063@phenom.ffwll.local>
 <20200714183513.6zah7wqlo2bpalum@smtp.gmail.com>
 <CAKMK7uFF=CuuTQQJ+MSZD-7+gDzcN-jKB3Uojgps+hY0jdz1bg@mail.gmail.com>
 <20200715124337.GA18441@realwakka>
 <20200715155715.73zaveklxrakib37@smtp.gmail.com>
 <CAKMK7uFLwyLgP3tAmw3s-PC0m_1CaNKR1aLvO3ES1PrTAdX-6A@mail.gmail.com>
 <20200721053300.GA2338@realwakka>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721053300.GA2338@realwakka>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Melissa Wen <melissa.srw@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 21, 2020 at 05:33:00AM +0000, Sidong Yang wrote:
> Hi, Daniel and Melissa
> 
> I tested some code for this problem trying to find the code that make problem in igt test.
> kms_cursor_crc test in igt test has 3 steps (preparation, test, cleanup). I check each steps
> and I found that without cleanup step, the problem solved.
> In cleanup step, igt test code seems like this.
> 
> drmModeSetCrtc(display->drm_fd, crtc_id, 0 /* fb_id */, 0, 
> 		0 /* x, y */, NULL /* connector */, 0, NULL /* mode */)
> 
> I commented out this function call and there is no problem in executing tests repeatedly.
> I'm trying to find out what's happen in this call. but don't know until now
> I hope this information help to solve the problem.

Ah yes that fits the evidence we have from Melissa pretty well: Not
turning off the CRTC means the next test wont have to turn it back on
again. And the vblank bug seems to be in the code which turns the crtc
back on. At least inserting a vblank wait in there is enough to paper over
all the issues, per Melissa's testing.

So at least we're now fairly confident where the bug is, that's some solid
progress.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
