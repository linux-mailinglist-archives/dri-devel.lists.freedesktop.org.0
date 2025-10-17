Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA03BE63FD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 06:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF92D10E13E;
	Fri, 17 Oct 2025 04:05:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kMJIjgPc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F405A10E13E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 04:05:01 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-29091d29fc8so15978175ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 21:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760673901; x=1761278701; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0yTr8XYfVKTbUORpK+gdA/VSO6LmqQtreJ6mNFyN7AA=;
 b=kMJIjgPc4sQoTbBpDIyD13o5OoDdWtznFIKBlT9z1MA8rFXQM37YOn8GJF071dE2UK
 UrYha9vUOcN28IhcRnz+9s2SypC9gxMGi7588rZgzIX6zsbPGA1/aAwsGb6gUrt0kYoh
 UxeYFnN7FJQ0ap/IpKJv19eEGjLGPbZD/8hokw74Ja60BiOt0M8zf3nj3hDDeTv9JSgJ
 Mp/2sltEW1wgG1pkkWC46qs7eExYQffGgyKGu+b+pdH220zVDgG3gcHBOc9G+oqEHP9M
 G/1v5kASgfDp0BkonGwnuRBA+FmHKjkBXm1rC7kWhfMI5QN/I7U0XPVVGSTg8ri4LoGM
 10XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760673901; x=1761278701;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0yTr8XYfVKTbUORpK+gdA/VSO6LmqQtreJ6mNFyN7AA=;
 b=DoxDYfTB12xrJu6b6vCjJ8+lmUcsn7nW9iV1v7tyEYD7DrQCGy1F8WPOjYJzFbIJ6D
 mPpvbYtAfJxjszC6tB5HuMhRyWgFg8vCEhm0CWkzJt2eJ5/Q7Lk+nftEqzdkHBySJdlh
 HQ1zTBRH0xZaJXyAmkwxEom6KSth2TWVMoTsqidzjC+wtgUG1971pepNH2SDsIZwmmpi
 K/Lp+0e1CWXLdZB0FjeuMtMYL8NUXEWjkoEQWZ95NJNLX87H9SAWbyXOZIm75mce7vEG
 IZ5ClpUsVtSH8KrWkGA4ADWvITbym9vWXL9FRQkoqYjh7pAAAzO6QQ/UxLXzlnP7fNty
 Xz6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVanMJLy7cMHNkr+xrSHLQb+AgT8jrh3ogVbAIvctyBanIw4llSrNuzdRkxGmQFvR0c963NSYADHj4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsdwZurLEPORwvxrzPIcONXeciRcd1QnHtJQk/BwxbkXi87mQ5
 qRIGYNyXRENS8j/OVLxXwpMWq7bLwwGTIyuvs7IKEdc0Fv1HBEXEftEQep0i53k5vJI=
X-Gm-Gg: ASbGncsZiSbO/2vEZrUPmsf3UhowdDHHJUNjqTwGSbjSSocPtBzA3Y3ETt2CS8T4csi
 Sv1fPm0JdrEYbHp6sXyrd8AdrhsxlSZGoUDgzKtsOzWqLz+9YKgZMGN2ZEK71/VjgXEk2dfftSf
 /qI6z4wCSMhp9pOcbLnK9fNB26P+IPtoTIji+uHZ2vw1BzjI87qikwRy8I95lKfA+40I8BXTZfc
 bX+X4DT9du6PpU28M+uxUAzbLVNk85jOWgYmesNcSrWgCOWi/rL2JwjMIZKnEmzBX32/2cNBxQ8
 N4pYwMTiZnOrLSinFCJ5Jq3TJtKR9zRBvMvyqu6o2jxCpkKinJTk0ijMTZSARqnOmN23pFPyqT8
 /UnXX+v4ACNbh53b2udigACv81JfFTRtAEblEIG2tBNipnvv78koNBSRHgoH8F/h1774dbuin6H
 Zmmw==
X-Google-Smtp-Source: AGHT+IGPSjlNzo0y0i/+GbYPAiFlc7JbgHfBpNrj/C4bxPOi+I7rIKsQiv4+wobJzyD79esO6O++kw==
X-Received: by 2002:a17:903:1746:b0:28e:7ea4:2023 with SMTP id
 d9443c01a7336-290cb07d430mr27595565ad.46.1760673901015; 
 Thu, 16 Oct 2025 21:05:01 -0700 (PDT)
Received: from localhost ([122.172.87.183]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-290cd93f570sm13832535ad.25.2025.10.16.21.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 21:05:00 -0700 (PDT)
Date: Fri, 17 Oct 2025 09:34:58 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, acourbot@nvidia.com, 
 ira.weiny@intel.com, leon@kernel.org, daniel.almeida@collabora.com, 
 bhelgaas@google.com, kwilczynski@kernel.org, abdiel.janulgue@gmail.com, 
 robin.murphy@arm.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, 
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
 rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: driver: let probe() return impl PinInit<Self, Error>
Message-ID: <co76tfqycdxhrigoxv5expmozqzgq2rjzxvfkfwqzyvlplrfih@gsi5yarmilut>
References: <20251016125544.15559-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016125544.15559-1-dakr@kernel.org>
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

On 16-10-25, 14:55, Danilo Krummrich wrote:
>  drivers/cpufreq/rcpufreq_dt.rs        |  4 +-
>  rust/kernel/cpufreq.rs                |  4 +-

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
