Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30ADBAA2A2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 19:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475D810E46A;
	Mon, 29 Sep 2025 17:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LsSf/eAj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0DF10E04A
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 23:29:23 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-73f20120601so40574767b3.2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 16:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759102162; x=1759706962; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iVT14YXhZO/vL323RFIMRVmhhyNgiqUs7sCBFMwP2Vc=;
 b=LsSf/eAjUQK4jCF6o830BqL4YHTXcth9H5JsO9+FrqLCRcEU8lKYpIIMGU2ESieeTM
 SBE9e7iXFnY4f4kAlOufl5Znf7pchcj/MfM70VYbktR/pOpQapVfuPaCoMFsipMpb6Ey
 u6rHU6jRKRb5Mlo98FGOf9TiJtpQsQFvhzAJqL9OMKBGSSAb5DWyWbMF1eAyrB4ocAeX
 ezi2SjsKX2UjxKVx4KZZDqdMPZEudYHUKy6jaNbZHDaxADjEx7H4s4rYfBDaGSYvfcz+
 4qGPTxbk6y+AmwTePiCu53B4c4D0DopVMfwxjRx2a6M8MwrsArZqehh4vpZCnVIaJDHZ
 V6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759102162; x=1759706962;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iVT14YXhZO/vL323RFIMRVmhhyNgiqUs7sCBFMwP2Vc=;
 b=pQc8tOIBXsyPk0J0y4ZTS4x9gfmZhnTIs0+YAzqZoXiEnIeb9+k05f8BT4CoZ7T5cy
 nxIaCYOV8nB9wQdQxplPKLYchnhFcPnBiQ1HS4hjjFomQqV+xA9NqMz2TIzx0Ey8Ilk1
 EbLfVn9Yg7M2LKcl48PmaG4O6nq+/OE2P6cbm5sEytug2s19BV9rzrqDI3h/ZZCu3pYF
 zFfai2WGWUs1X3v01VVmjIPL7s7eZmBdPn4fyvg0CorhGyfFVzNLdWNz95uWYTPOA/Zx
 pMkoADLCZszNGQD5hTDo85Vr5NbjyRl25qa5VQbTyD+1e7578hoBhp+hCwpFBFGViKod
 p3/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBNQaUwzuYTabav1t3zmcnWpkampBgJC62Y1x80Rkye0RMmk5hGEdQUxLUxym5H855PFmu+rq2IRg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDwKqW8B/LQZ/Xezk7pUlwPPrt7EIsvtnVyjIZ4JrQCWQ4dgC3
 BKiJTkuM9tBDWIRqQYuJ6WmybypHUhc/CxtWV4cjXjWFQIg5QDrptbX6
X-Gm-Gg: ASbGncu+D0tFLrG7SAb9Z2vL4v2EPvQH00b6qA0Obto4n3fg/bKDE6A+8Q89+S4u/3t
 gdxY6T1gyxC2PI7WHDGoweiuFLwf8W0URyFhkJlyDMkhBE7eBg/esq9RN1fKWb4pUQsvkYVMhLV
 T8hwp0JqQyot2IdiOUF1Qw42JXzL5PJcpRfm4vPRgMrueV0mnkesuQAwlXNGvgub/yOWKkqysnm
 8i52x8Tee2/oun1TYAkmRaooU2r9ibUE4sYpsuDLmdg0esDWiSkqOwgf8knHVVVabNzzagor7/l
 IdIrSdQISB5rNWPKf5V7RjaGJnVfCk7w4eg3YcbiFAe5BYdfeJiidx71AsXFGo2FXUwFQKucVvj
 0H+qvOGzc3iVCMtdU3Q+AVg3HNAoce8UGDv3SlKWZ
X-Google-Smtp-Source: AGHT+IHskYhayDwfzsV8lkE/Uops7xgSMHfw6Sw7Fk1JVYa5Q3Ma+PAZWIZOs7Aj8ggB//5BDs9q8w==
X-Received: by 2002:a05:690c:6f85:b0:727:1d96:46aa with SMTP id
 00721157ae682-76405202175mr180066857b3.53.1759102162293; 
 Sun, 28 Sep 2025 16:29:22 -0700 (PDT)
Received: from [192.168.201.155] ([76.200.76.117])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-636d5b1d960sm2016142d50.31.2025.09.28.16.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Sep 2025 16:29:21 -0700 (PDT)
Message-ID: <bb9d90ca-aa4d-4168-bdc5-543109c74493@gmail.com>
Date: Sun, 28 Sep 2025 19:29:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: udlfb: make CONFIG_FB_DEVICE optional
To: kernel test robot <lkp@intel.com>, Sukrut Heroorkar <hsukrut3@gmail.com>, 
 Helge Deller <deller@gmx.de>, Bernie Thompson <bernie@plugable.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Zsolt Kajtar <soci@c64.rulez.org>,
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 skhan@linuxfoundation.org
References: <20250924175743.6790-1-hsukrut3@gmail.com>
 <202509272320.3K8kdDCw-lkp@intel.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <202509272320.3K8kdDCw-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 29 Sep 2025 17:27:40 +0000
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

On 9/27/25 12:12, kernel test robot wrote:
> Hi Sukrut,
> 
> kernel test robot noticed the following build errors:
> 

Did you compile and test this code before submitting this patch?


