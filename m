Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8046FC49B75
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 00:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCAC10E0B4;
	Mon, 10 Nov 2025 23:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l2xgqcl4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD6410E0B4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 23:15:58 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-297d4ac44fbso2311975ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 15:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762816558; x=1763421358; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tTCBfyjKL85nI7lncbdUck6wtAuHEbruuMTez3UdOuA=;
 b=l2xgqcl4J+OZFodF/QXCfjcJ26eiK+S4ZCV+Xi1T/mySwVWbqzepR8f2hUGI2dyXxa
 Ws26HFpQ24zMoFAEhRiH75Vi8+hMqhkkYzaYQUAjBoJpjphTMndPJk/QMmmq0xYkPSKp
 AV5aTMoae+dMR5iZRUOoKUzYJ2V0bVPdW0gKFTt0hNJMEW6+ddaf1WIdcQ42Dtopvn0x
 gPJjbR0fOQrUENeNSmQnEtAKrlgjAIJfGKksgtbaRZy11GsLrBm57kqZzQwcrnK7P0A7
 EYGZ6kcRoP3uW6VQVjjYplvhuWsu/+thbLxCSvB54Zl3NH5S7VtqFBt3qvDMUGXuZdKr
 47IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762816558; x=1763421358;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tTCBfyjKL85nI7lncbdUck6wtAuHEbruuMTez3UdOuA=;
 b=TIMaRSk3uhC/F8hRnKhbwvyTzhUDe7NlXZUmWHmOsIRCrxFVDN6PXXi1wFUrCdPFL9
 ShNH8HOJYjadmkDs6N1dtqkzk62gPNP7JHIdbLVUrqO0xZ7U5j2iBpd/fRnE7h0S+iIb
 3Hj43p4EbB9Z1d5Reg2DFxhB2e9/azOmkRv5K7092rXVwClmsuN4Nh0zDBQKZYvRxi1E
 MDTsk8oni+97HoHhZEEodWR5D+sDd6XhnEMCyNCk6M2ioDZLiqVLYMfzO4Bho0pKkJ3a
 O//OKSz/Vp5McfyznoAHryTGkuo4Kufj+EO2gfWHOKhiqex7vL++dT/QWoFsP0mPCIS8
 uF7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCg0awV5zFI4+UKs2S0Wx6PZi6kxDGqPfLrKrf1BaaHAAEy4bFLQdqFS0u3YWRJOSEuQQZrFfhNaI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/Vb8jUlDruxxr6DxYhgeitSVBXj2nB4gxQy+Cl2N7mCcG3uQ1
 EuPMauujGTBCKNnVIzwzEQWV3iJftwwgnrgU1xcRejkUcfNE2/rkiEpB
X-Gm-Gg: ASbGncttRC5N9wtJyGM7mgdQzYRVW3Jh2R51TLt5oX8ErHV5csXVDR74AKCES2Uq2yi
 WOg6H7Q/lBaPqcLuttMubbRrRwT0C8gFLexxg52LQE2rheDLmBPEVWBIqRklMRNPp+qIaFchARB
 +hEsN0bkDc4lCrhzLEgbtQzevy0c9OV8CHJWoktN/8hg3f6pFLfUrBcsfiR+Y0KH8Qj6YyCJ98D
 1pmFVvR5nJrUNylHpVQtZ8ZkAZ4laZ3fBvnXOnA91AdRFBdY6Zecr7FTOT9GUkIq5/lF401wY0a
 Ra7a0Of1ce1a33m6sbDREG34rHvBe4Q6mv65WqCOnXHAMnhtwv3YTRUHpTYAhkgYR+5IgSiX486
 KTUEonxLkdv4Z0bKRZZUPohZbrwpT3llLX612MiJ+1s4IRrIKprRWrgX0qiYAwMLyMhvby6sCyf
 Vc
X-Google-Smtp-Source: AGHT+IGwvLf3ZgdUd4iAsN+CriZ8KUEaW9yxRhFdFBiIvi5V0uUTvjVhxvMH6yq504eeDgLltAEolQ==
X-Received: by 2002:a17:903:18d:b0:297:df99:6bd4 with SMTP id
 d9443c01a7336-29840842cb3mr12574055ad.18.1762816557960; 
 Mon, 10 Nov 2025 15:15:57 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29836cce339sm25144965ad.59.2025.11.10.15.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 15:15:57 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 34C6A4206925; Tue, 11 Nov 2025 06:15:55 +0700 (WIB)
Date: Tue, 11 Nov 2025 06:15:54 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux ARM MSM <linux-arm-msm@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 Aswin Venkatesan <aswivenk@qti.qualcomm.com>
Subject: Re: [PATCH 0/2] accel/qaic documentation fixes
Message-ID: <aRJyKlRkihq1OcGk@archie.me>
References: <20251110035952.25778-2-bagasdotme@gmail.com>
 <e44c8f40-b6ff-4369-8d86-ded225b41544@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e44c8f40-b6ff-4369-8d86-ded225b41544@oss.qualcomm.com>
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

On Mon, Nov 10, 2025 at 11:54:59AM -0700, Jeff Hugo wrote:
> Thank you for the fixes. Yet again I am impressed by having your fixes in my
> inbox before I even see the reports.
> 
> I'll get these merged to drm-misc-next where the offending issues currently
> reside.  I anticipate getting that done later today.

Thank you for the compliment!

-- 
An old man doll... just what I always wanted! - Clara
