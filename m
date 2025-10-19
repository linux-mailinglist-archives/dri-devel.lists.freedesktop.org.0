Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54311BEE9AD
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 18:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB4510E216;
	Sun, 19 Oct 2025 16:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EJfEo0Cf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com
 [74.125.224.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5910F10E1BC
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 16:16:07 +0000 (UTC)
Received: by mail-yx1-f53.google.com with SMTP id
 956f58d0204a3-63e2c7a3d10so975792d50.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 09:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760890566; x=1761495366; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w65OdgmpV8I1cxj2sfq4rK12q9mD/l6u6jCluPLlwTY=;
 b=EJfEo0Cf8+DN14jjbheL8tRhuW70lHMNn+k5/+m/EIQA+dAA5F0ku3iCb5FfzlR4MI
 7rvinNF335F8fK+NuBWET//3vTA2UruPUJjzJuNHdjMIxkUifb4IBACsWmb8Ne+0sbcM
 QmiOSLdMb8vUe+L1YP77uyt3DHoOKgwmaD4StuAwOKo/v3yvfAZV7KmdCA+a29HnB1v2
 7/XFJxxYQsi5KrNrHJGs6pt3QsR7VuquQyVMyOxHXNTJQ2Tlvq3GgGNzWrluyP0jHHdd
 VJumLwsDwd48yil7gQaAn4gLB4wXsLINjB6l4aUMHSvcf3qY397Q894eSBTDIok+EBju
 9vHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760890566; x=1761495366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w65OdgmpV8I1cxj2sfq4rK12q9mD/l6u6jCluPLlwTY=;
 b=mK0LfcubMbVI3rnZeCEr70I1/s3v38Hl+qja78uyrPPtSPAVEN6mQTbTzYdp3ZgO9C
 5nPuj30Is1rD1CdphgfQAUakRLrAYSaTNPBNTR7E+FkI9alccDOGruW8pPVDdyvuzhBB
 Pum3xuOBUNN/3YO8GNjtgDzGkbMuDJQNuSgGzkl8MU73VPGCtj5Fvx6J7QAflDvsi67T
 WdZgxl/w4TDHbWPIG3FesgD46Ji1Uplfr1FNGqbft/vskQPwAMZQ76hdrBmu6v3qBbat
 3n/QYYr5g+DZw8zG1vjMnqS5kB/+Qw1AsM5CuOxBlwf7Ar4bR/5op4vTgeFSQiu3eDEy
 XmmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFMPhB7Se02qqqbE+6rXQuiCmzbbczEDu/eXGaFc/HpiSFJuSMq2cuTHjloKwNyWrQDLlMMNtjowM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyA1RKnZSRxmnSa5R2Vj2Ivbv+zDEU59lXlwC74a67aryYylJqi
 JltDqFzOkhQyFSBRzU4bbXtib1DLlR0JXMrI5C78CbW8OmnVZvtJrX1F
X-Gm-Gg: ASbGncvQwWUUp6/Z83cZfbZjhA2uQpSsNAfkb/OdJ6PxDcOJVc4dCv2naHEnzroeC9p
 o5cgZkonZBp3unFj8TnCpgiqH0yfDHqvRo0hmyicMOISCRuK72swyQtaIj+/fORRD2vm5QD+hyv
 YAy/433GQ2gfXPIZzh6fI+n3BE8J/HVILlMjmHEOdFMBIXFZLKMxcn84zFVHSLwlz4qXsZ3HWmg
 02AQynoUBZcR8N89oyiu7CCgf1H0f8LYipC/R1B3WzedVEeSk08gAzZ5hdlreWDLEXdmcS+GTla
 toA5eO8r1br3qcd7as8eelWpGdeSZjEJ+sQFIG6hI8i/n1yg9lZ3sTU7Ab08mpgpquMZFROCFuY
 iEUDvWSl9uiWHdpCSXiKMec3L3BpkMfJ6l1IIoP7aJrEa9BU4so2FnnQXyu/jE3P/dCo64aIHSq
 6ASw8RIo8KQKX0IQCgqxMiHI9eqtWR0lksUtcMVrmEkBnwhXu334sV9ir4uSY=
X-Google-Smtp-Source: AGHT+IElWfzAepNqK3LlpQymTFB+dnzq6dId0s4n8cc9tbggmQJHdM08XYTf6C3f7CI5MrGaIVI7tg==
X-Received: by 2002:a05:690e:168c:b0:63c:f5a6:f30f with SMTP id
 956f58d0204a3-63e1626157bmr8254979d50.57.1760890566174; 
 Sun, 19 Oct 2025 09:16:06 -0700 (PDT)
Received: from localhost (104-48-214-220.lightspeed.snantx.sbcglobal.net.
 [104.48.214.220]) by smtp.gmail.com with UTF8SMTPSA id
 956f58d0204a3-63e266bc09csm1738354d50.11.2025.10.19.09.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Oct 2025 09:16:05 -0700 (PDT)
From: Steev Klimaszewski <threeway@gmail.com>
To: devnull+federico.izzo.pro@kernel.org
Cc: abhinav.kumar@linux.dev, agx@sigxcpu.org, airlied@gmail.com, david@ixit.cz,
 dri-devel@lists.freedesktop.org, federico@izzo.pro,
 freedreno@lists.freedesktop.org, jesszhan0024@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 lumag@kernel.org, marijn.suijten@somainline.org, nicola@corna.info,
 phone-devel@vger.kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
 simona@ffwll.ch, ~postmarketos/upstreaming@lists.sr.ht,
 Steev Klimaszewski <threeway@gmail.com>
Subject: Re: [PATCH v3] drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT
 DRM property
Date: Sun, 19 Oct 2025 11:15:59 -0500
Message-ID: <20251019161559.6731-1-threeway@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro>
References: <20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro>
MIME-Version: 1.0
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

Hi Federico,

With this patch applied this also works on the Thinkpad X13s (SC8280XP), thank
you for this, I know a lot of end users have been asking about this for quite a
long time, so nice to see that we might finally get it.

Tested-by: Steev Klimaszewski <threeway@gmail.com>

-- steev
