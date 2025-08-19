Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E43EB2BF7E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 12:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC8C10E32D;
	Tue, 19 Aug 2025 10:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AuDtasGQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9617110E32D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 10:57:18 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-76e2e89e89fso6645563b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 03:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755601038; x=1756205838; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/h8vcXy6qR27gP1YZ8Yc6zSfsz6DAOWe2QXpuI2UdEs=;
 b=AuDtasGQIzGP1ghpuKiLkv8+VHcNpRqhUDiZemHZArHuD6Ro3SKbwWcqbeAOE/gMv3
 Q5SSO+sMGZlxiFparjaVE9q492eOFkuTg4PUu65lRdoSwYUvNgKVWWZEc+b6cAhYjyW9
 IBsdyFbtgWNxS5onwpMl8GbYz2E+9T5qj26HrTC+wQ+b7XnsO9W2cg6F7VnZNi4ViUdg
 pKEAzjm2IYc/l15JZ/w40QvNwPTxbXATg8q+yr5W/f8b9AMxwIoWIa9PEYRmOYudpKNr
 sgHZUzPG8P343RhFfqmIXaJjAee5Rs/Or1jRnOhWTrEwYRSqzcEYrwqzK5xarM7i9d8O
 tyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755601038; x=1756205838;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/h8vcXy6qR27gP1YZ8Yc6zSfsz6DAOWe2QXpuI2UdEs=;
 b=wL2djaWUaRW3wfGGkin/0iN4XlOUXsuH5ClBpfYg36OlhS7Vy77wzIjwb3qXWMuzHj
 1WnAr8jp1x45m3JszE8qpSuhJW1eW8WpO0oftgQjiec/ywCJZ9t1NNOKRL9sTTmxN3l5
 1CGFtrZHn90Lc9NdG5bedMZ14TyZOY3x+6SX8pF3AQHKER1A1nJBumXJ3/JC6jipbzc8
 Wt2XLCj5gAksNnQAmvxPWjyAy8dmaBSgotDaJNxvTn27wSwIfR4ijUKz88tCIeRsj5ph
 YzpJxMcgdzlvgp8cN/3XVhJVxZaHR6FFjF0xiqKoBhHcwqOcpxCRv9Aijlh5DWZdkmUO
 yc3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhRf5JzEdTQH3A8Y9mjPkpR1nfCrVLHAU3oe/1EUPQtZYYUvT9mrYzITHdS1+Z2x13w0bUo7bB/fA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz30Tf4k7t17oE4Xl2RstlX+50eyTRjZ+jeTTN1j7fTkh9I9vNw
 ev09/I+ljB8q3ECIMPj/y9EUUCcoNwICKbhmzwgi1xESLslRBWSuSfiy
X-Gm-Gg: ASbGncvduI/+xCQAItqQR0auj10SWgCOj+6dxiAxnugy3NO8+dALvi1MggbqdMt/wKo
 vN+UU94RSVe1T2cDYodGXdfjhTnZBWeUcxGzwO1w6DPraUIlc8rpcj1Yuvr9fBTbm2os01NeXHU
 95mcEKPwyXdfNKHYPm5BkWONj9G3oP57mteYQQkZJSHpwSzUHUVIqyyGe4VssO0/mXW8nRpDWAp
 KOzJaKGSRExJfBw7t93hSeIATSQy5X9/IQfYDx1KbGJGG/hwlR1cVQDrARVfLaYsDqj370QTb5X
 SxHHWtrxUfg8rp1Lut7F6tDt+tHDcVUKQ4LcQ5gLU8o46GCVMXWnTFUYGPIDbxhqerGhT+CR/Qi
 wstzwcc9aCoN9h0CrKQ==
X-Google-Smtp-Source: AGHT+IEHSyz6oaDA7K+RvMSncY8tbf2c7olIXCrk48S43s9RumALFVRcBntKKJA8rU+d1WXngphnug==
X-Received: by 2002:a05:6a00:929c:b0:749:bb6:3a8e with SMTP id
 d2e1a72fcca58-76e80eb487cmr2546976b3a.1.1755601038024; 
 Tue, 19 Aug 2025 03:57:18 -0700 (PDT)
Received: from Terra ([2001:df0:b240:b5e:abe3:8cfd:3fd8:5d8e])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d130cfbsm2218152b3a.40.2025.08.19.03.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 03:57:17 -0700 (PDT)
Date: Tue, 19 Aug 2025 16:27:12 +0530
From: Athul Raj Kollareth <krathul3152@gmail.com>
To: tzimmermann@suse.de, michal.wajdeczko@intel.com
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, skhan@linuxfoundation.org
Subject: Re: [PATCH v2] drm: Replace the deprecated DRM_* logging macros in
 gem helper files
Message-ID: <aKRYiJec3VE7xo7J@Terra>
References: <f94151b4-893a-4758-a118-153076a20d3c@suse.de>
 <20250818192247.58322-1-krathul3152@gmail.com>
 <CAPZGEKyhn1LLZQ7z04_u6pjTf9Uqy+ycH4t7xYMRe5dDR9Vg2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPZGEKyhn1LLZQ7z04_u6pjTf9Uqy+ycH4t7xYMRe5dDR9Vg2Q@mail.gmail.com>
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

Sorry for the html attachments, I forgot to set the email to plain text
based.
