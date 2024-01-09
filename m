Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 581D0827FAF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 08:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC46E10E368;
	Tue,  9 Jan 2024 07:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C106010E368;
 Tue,  9 Jan 2024 07:47:33 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e461c1f5cso20758395e9.3; 
 Mon, 08 Jan 2024 23:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704786452; x=1705391252; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=bhwJ9IVFQFfFzYg7GS2dpHoXBkDisLzOWEY9CuEh46I=;
 b=ZYF7Q6G4sfPw4jq0Umr8a9+wvTQcM5fSDQWcGTfiQDiqH5hh5PbUzjhPkF+2CemKEN
 Eq91Jg6cxuQ6Hfz8alMLiLYdYvKPpJvsFP3R56RmJJhjP038XzbZmMS5KSyilKROZEkf
 HDR1JoUXW2hSiUp/3lzMBHN/TiMEp6MFRHM7H31GiNcbgj3DkZfeXaZA3guJypYLzelw
 /ToJWOELA9YF16uKo/8d2LVCxPCa3OmjZvLXDOrdgQbof1cKEjBmc0aKKMPpwx2ijJcR
 +6XKUCP1yJMHC7IQ9sZW58O1aDUoWWZoifIxUExSVpk6ljXXGnjKrvDJJstfnqoQnai6
 A1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704786452; x=1705391252;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bhwJ9IVFQFfFzYg7GS2dpHoXBkDisLzOWEY9CuEh46I=;
 b=mHRc2njqUifyHzBrP0uP7ew/CpThicF8ILfaAessCX79cz6+HtXUYhe78r2DnVGv/T
 b2cvDvRvXWh1+adzEX7q3ZT3N1cfhoowDQVfoEo/2HzeL9kRbst6rxkZHHMEilaZ/aoe
 fCcJZi3FrxQM4731N/7OCOXEL2oEChgIo+q1zFpRZyoqm6V2bq+5M3clNGv/ou7TaCHG
 gKhPOc7HMQwoxRJ1l/By2cBIPiWcdywbyAFZ4rOTeWKunjquTY4CcPSc/nGH4ghAYVdD
 DvhroyjbVJqeGJzvjDrRO7d1OhUQlBJfY1ynAVFIKhkZifMdM87wXR4rSNtI48YO99Fk
 KW7A==
X-Gm-Message-State: AOJu0Yw+OcBDhCLjupu2hbAGq0WnzB+EydOcATN6S0OQYn3gng97sC0a
 ECrfynQkJItfkGxVvCUV8sw=
X-Google-Smtp-Source: AGHT+IGgXtSk2/fVLSY9u5zbUdFWpxzZKxDXvOshB26eua/PKB2VsQJ0n2dljMYxQTL2diocpykMlQ==
X-Received: by 2002:a05:600c:a084:b0:40d:9232:f32b with SMTP id
 jh4-20020a05600ca08400b0040d9232f32bmr1786539wmb.277.1704786451957; 
 Mon, 08 Jan 2024 23:47:31 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15f1:d900:3a74:b44a:2376:22bd])
 by smtp.gmail.com with ESMTPSA id
 bm3-20020a170906c04300b00a2a4efe7d3dsm731563ejb.79.2024.01.08.23.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 23:47:31 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: zack.rusin@broadcom.com, thomas.hellstrom@linux.intel.com,
 lyude@redhat.com, kherbst@redhat.com, jani.nikula@linux.intel.com,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Rework TTMs busy handling
Date: Tue,  9 Jan 2024 08:47:24 +0100
Message-Id: <20240109074729.3646-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi guys,

I'm trying to make this functionality a bit more useful for years now
since we multiple reports that behavior of drivers can be suboptimal
when multiple placements be given.

So basically instead of hacking around the TTM behavior in the driver
once more I've gone ahead and changed the idle/busy placement list
into idle/busy placement flags. This not only saves a bunch of code,
but also allows setting some placements as fallback which are used if
allocating from the preferred ones didn't worked.

Zack pointed out that some removed VMWGFX code was brought back because
of rebasing, fixed in this version.

Intel CI seems to be happy with those patches, so any more comments?

Regards,
Christian.


