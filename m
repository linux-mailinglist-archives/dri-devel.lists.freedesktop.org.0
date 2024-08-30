Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 181D6966C13
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 00:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA2210EA1A;
	Fri, 30 Aug 2024 22:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="goptsK/H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4FC10EAC8
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 17:55:40 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-8278b0ba494so88870039f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 10:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725040539; x=1725645339; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6MF+sXceWEcBfG7p4hvfyj5a5Bti98QDvGTaVeFBZ7w=;
 b=goptsK/HQ58RfV0tQo7vlnUkbLbaM4s+WevwctmvtnP25ZYiIWU8MpoLXeH1Febsft
 8LYqKz60bHwYT+oubeCgugPYzQ2hTVJLlQfAo1Qwj4gZ9pm8JkLWnDhsKWXHiFYD6w/l
 5hLjnUNxoQhlNIIGs5Gg5yTYQow0+cFT6wkyzNUrMkvcmK+zENaBoK8QlFY2hMd8OrPQ
 NSaqhnIheR5WVzwXvdciUxA22+IE3jE39qB5Gs5BXiqTfQjvZndrh6RqUylciTPHhk9k
 ReTpogxoKXky7CJNc7bM9AAbne/RGMlkasVI1X7W1MwtSYXLI3j5umjlxb1nzYboq/iA
 uaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725040539; x=1725645339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6MF+sXceWEcBfG7p4hvfyj5a5Bti98QDvGTaVeFBZ7w=;
 b=et5h8+EkB1hwFGpSxICAqmycplw3j+4JicBUvselSpKyCEsebT9l0pzR/JTK2keIxx
 Koa2xqRgubD2mzPs7ZfpTUQBPUNkYyZG9L4exf3uTyfwWQyxCJvUAur+jRvxT0jFHhIo
 PnEHyu2lf7qfGZfE8oEerKG8oTz4+huNTsksMAzQoBMZtzhlQaTQKIe/6H4UNefoQ5PS
 CDkqXci0yRi+PtYYm5XwjQcgeEs+aYi3hQ7Hf/6TroC7PIjndL44GWxiMajQtjFcDp2N
 /dXWnZokVxZE7TEVKzdXcwCtUrd9aldEjhMIKWG8clLQfM3FP0+hyeL3JXmbKXKe50IQ
 Adxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYQSM0jCGjafK6qIHOgImdQf9s6XnN7GpdnzR1EJmClFntEmx1oqodBQ4+sN+Z8m9/pW9OCPvttLU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy37wIdzaKYeIRxdQoLGDt+5ej3ESXfoC6Dy2JtMtb21cTqyz/L
 tNeFCFO/RIwBsUJbNAyDZ/rF0ZiDWBM96kuvbcrApXRNaDii5KBN
X-Google-Smtp-Source: AGHT+IEJO+rT64x31n995BvsAz22y/GdYxKgQSigICRU69AK6S1WIiCNnm+JI0H61qKRycetlf7dgQ==
X-Received: by 2002:a05:6e02:b46:b0:376:410b:ae67 with SMTP id
 e9e14a558f8ab-39f379376bamr77474555ab.16.1725040539147; 
 Fri, 30 Aug 2024 10:55:39 -0700 (PDT)
Received: from localhost.localdomain (174-20-195-90.mpls.qwest.net.
 [174.20.195.90]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-39f3b03fb67sm9548685ab.67.2024.08.30.10.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 10:55:38 -0700 (PDT)
From: Shimrra Shai <shimrrashai@gmail.com>
To: cristian.ciocaltea@collabora.com
Cc: Laurent.pinchart@ideasonboard.com, aarnoud@me.com, airlied@gmail.com,
 algea.cao@rock-chips.com, andrzej.hajda@intel.com, andy.yan@rock-chips.com,
 conor+dt@kernel.org, daniel@ffwll.ch, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, heiko@sntech.de, hjc@rock-chips.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, krzk+dt@kernel.org,
 ldearquer@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, markyao0591@gmail.com,
 mripard@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 robh@kernel.org, s.hauer@pengutronix.de, shimrrashai@gmail.com,
 tzimmermann@suse.de
Subject: Re: Re: [PATCH v5? 0/6] Tweaked basic Synopsys DW HDMI QP TX driver
 for Rockchip RK3588
Date: Fri, 30 Aug 2024 12:54:40 -0500
Message-ID: <20240830175440.2596-1-shimrrashai@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <68e78629-5a2c-433b-8c83-50ffced04268@collabora.com>
References: <68e78629-5a2c-433b-8c83-50ffced04268@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 30 Aug 2024 22:08:56 +0000
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

Cristian Ciocaltea wrote:
> Please stop doing this!
>
> I appreciate your intention to help, but this is not the proper way of
> doing it.  This is a work-in-progress series and you should have asked
> before taking over.  Please do not interfere with other people's work
> without having a preliminary agreement with the author(s).
>
> Additionally, before submitting any other patches, you should get
> familiar with the process - see [1] for a starting point.
>

Hi Cristian,

Sorry, I did not know what the rules/norms/customs were around this
kind of thing here as I figured it was an open contribution space. I
did not know that I should have asked for agreement with you
beforehand. So go ahead and ignore this patch series if it goes
against the rules/customs. Even more if these points have already been
addressed, as redundant work is obviously not helpful.

That said, if there is some way to help along this project "the right
way", I would like to for sure! Just tell me what you'd _really_ need
help/assistance with to get this moved ahead and I'll see if I can
give it.

Thank you!

- Shimrra

(BTW, I thought I read a lot of that stuff in your [1], but I guess I
glossed over some of the finest details; unfortunately my mind tends
to do that a lot [drop details], so I will not contest your complaint
about the substance of the submission as containing mistakes, either.

And I only think I submitted one other patch before so I am not very
experienced at this group, despite being much more experienced with
coding. So again I apologize.)
