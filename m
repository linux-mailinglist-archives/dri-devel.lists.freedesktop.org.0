Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDA1D177A7
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 10:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388FC10E477;
	Tue, 13 Jan 2026 09:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fwrAErEE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831A810E477
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 09:06:04 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id
 5b1f17b1804b1-4775895d69cso36092295e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 01:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768295163; x=1768899963; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oQVbzReVaCOjbseqkmeJ4F8mIO4/HJrr2/RcKEppRuA=;
 b=fwrAErEEl1Uf4Z1rev6VrUyndo/xjpERMLjM3DR1IvYteT+nYgmKQawD6Ay4eIg8Iw
 XCc3Tz9Y946Rkk3C1b2N5Ja3JDcM9n4XTbN9AxCpeR1vOP8fPDKeYRQuVT62EGzLHi/z
 gJObTEfaO1k734TJ80TpQwq9ivVRjDucnHm8r0XWATGvsxi0OoTAuR6SuS2/pV3Fmrh8
 dUQ0dTceUOddPX470PzQnpXgMXY7aSwGbs85H3awHOH/xAzbIo75QiOy0KgMQgLfONWI
 XSmtJVJo3pkSuHGRpZAG6AhCdRwI+PaAEqTF+digCGjPAoEKEwlOrJ/Qs/ajiiQSmFf7
 RoCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768295163; x=1768899963;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oQVbzReVaCOjbseqkmeJ4F8mIO4/HJrr2/RcKEppRuA=;
 b=TZWFR8fSrXKYcdLRF0axtmnAbv2Bi/uicDm/Vu7+VgY76FCOepZySG2AI161AFht/B
 Q+AogX47jTWmtfy1nqFpgrv4Czg+pPKvjmLg18+cwfo8mu4fM96eV5nXvTITj8c18nV0
 LdZTVlR36HoohUWP1YTmxoHqUuRLdgAaC1bOK2NZ96FMKwVETBDDWFDFVj0KK1BMDHzO
 o0BsEuMaOI3tQok4Rzvy2viTR3jx2jVj+uRXK4Zv+d2aDhOQpcRm8WH7PkY5RugCKnSD
 fgn3CRTiaOh//8WMC41kpMv6Ojxe0Q7PiVyNxNLSPfWf9hw5dM7CaDJxfFjQChQYq1wY
 +5jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiuhR5HsoHxl42hu2cjDrXgVHFx+NV8sWeDcy2PiprMmFGT+909g1JCDiacwZAB/el1uonY7Ni55I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydlwX7JXdbqXrZqOMPHRJkJCtml/G0O4f75MaJNeuR8mskMzi1
 TWAt05/H3U2JmTEgCnLLQsh/X/JuNlXo9c90JzgOjyYHoojxgNFMtjzLmZMbfk6goJw=
X-Gm-Gg: AY/fxX7nFrdkTNN9FiWj5pKZI7R9ayOakkkxj/NUBfSvppEt2Q0GSuv64rRHAb1Vv3l
 L7P6VTOG+LdF6liMVuVJg8IroJPgxjxssuRchzN6Wu17MczRmpQy+tFRkUK6U9xTkBjO54fyAnz
 BWLoZ94aYBlSMp0k2jBLtbpV1K9sHRwDjckJLQir9a9I1p76Iy9baFdzq97cNzeT440H0GCAtLj
 n3DfbVFDJKhHJ72RD2K8I4ATbmMVFcgqPAJauTK7IRpHx9e63TfQe//HpoJzQ3j5iwcYaYQAkh9
 J820h76AQN+NID4ljJBnQBPosp0lXxkXQLg84NtZYj5i93s0n/yLiDZg5z46BTU9a/2G0+jgaO1
 Qk4QgRXtozHtKa9BLLPOxVsY8yWXCFEB2CihQZLJCEjH+Ui2vG+ORSZAh1QJ4y63Vt14+eJet0V
 W3/bKMQG1FVPR/RHjlG/M=
X-Google-Smtp-Source: AGHT+IE5oxGi5BcctmqcFTS+LS6xBFAy5ImxA6AoRo+BNpmpFn2RZeA1MyxYoBoziJVowToHvAqypA==
X-Received: by 2002:a05:600c:4f0e:b0:470:fe3c:a3b7 with SMTP id
 5b1f17b1804b1-47d84b1a3dfmr239967365e9.5.1768295162881; 
 Tue, 13 Jan 2026 01:06:02 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080::17ad:35a9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ed9fe7ac3sm11118635e9.4.2026.01.13.01.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 01:06:02 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: jesszhan0024@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: dianders@chromium.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251216075530.1966327-1-yelangyan@huaqin.corp-partner.google.com>
References: <20251216075530.1966327-1-yelangyan@huaqin.corp-partner.google.com>
Subject: Re: [PATCH RESEND] drm/panel: ilitek-ili9882t: Switch Tianma
 TL121BVMS07 to DSC 120Hz mode
Message-Id: <176829516214.3839584.5633639501004642162.b4-ty@linaro.org>
Date: Tue, 13 Jan 2026 10:06:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

Hi,

On Tue, 16 Dec 2025 15:55:30 +0800, Langyan Ye wrote:
> Migrate the TL121BVMS07 panel from non-DSC 60 Hz to DSC-enabled 120 Hz,
> including updated init sequence, DSC configuration, and display timings.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: ilitek-ili9882t: Switch Tianma TL121BVMS07 to DSC 120Hz mode
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/65ce1f5834e9598e5120048010b4fe220e70473c

-- 
Neil

