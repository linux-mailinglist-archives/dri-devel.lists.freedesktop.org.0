Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97101A020FE
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 09:40:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C0510E5BB;
	Mon,  6 Jan 2025 08:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fMy3kVIt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B40610E5A4;
 Mon,  6 Jan 2025 07:31:23 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2ee8e8e29f6so16279123a91.0; 
 Sun, 05 Jan 2025 23:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736148623; x=1736753423; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VhopYvmnLfR8zOu9NuMUWww2rDAX0F1EVvVj5wT7j1M=;
 b=fMy3kVItMLo04h0j1wwTIiGn6ICXMdO9Xj70hMdnjEmseF5p/dY8/7+deby0BtPAPE
 wSGc6j+bP7E4K5K2ypNQzJOhfj4cacTjwRyu54kKpvP+l6eEPpH3EgLbQ68VEK0/mcyH
 Htjz/aMUM4e0gZ+XWHALdpSuK0dz9lyrvTPXZnV1aU8rQLPD6Itx3iKNrhjdVrlkAeah
 UkXVd4fbWdn0gbm65MDQs3FL9koA9vhvWcrDX0wpv8/8mrNt/j9ZPRu1935jbxVZV4NI
 brioAO6+Q+X6oNGy7dMUOTCy5J7/5qQDiABeVvwlih7nxutcm91V2+pt/hHlAJOOgiR8
 NpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736148623; x=1736753423;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VhopYvmnLfR8zOu9NuMUWww2rDAX0F1EVvVj5wT7j1M=;
 b=XOQIQf/sMncy4lTcUdU3KNsAyEFKH+RbrWD6SXp2Y4K5okdzwcbATlR3anzwRTwovh
 Pj2WDzuPIL4bEGxjTyyQ40iGHkstV0duPzICBBgHE3yn0S16eQD+LN1gFYLycKDAVQAB
 NOZGofqK4gNlLnHnBGB+hrhoR55GaTQHxdDe/umLd6iboqM+W+d0BdP/JtzVcidasbRw
 fq1CIU8GKIBA7eVD8aDoKrt0BGsmp+n36TdyMcp5Ffzlp3X4/rd+GM11NIf7WUfD2P83
 mWbs02YprB4O1VXgGswHMBGuBkfGytCPkx6amBIMr+zzz63lYDePyjOmjchaYiqxHCdK
 9ADQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0kDxQqoX6iAD+o818ynkDvDmiVZIgzUp7PBATGyh+G8mwrNjKyEDyC3snQyXcUqlw/iCn1xEiYEVcn7edkQ==@lists.freedesktop.org,
 AJvYcCW3ZkW0lv4MaFs5hoON6fxXM4C0UTapze/cM0ii0x1+y3nLtAwH29BjJ4VV/cUy2hw+yymXO9D3Ltw=@lists.freedesktop.org,
 AJvYcCXgylTqmgGswGpblLWtPc6Tr2/pO8pJpGpTCk8psUQcQzaZHCuofMCG16cvHwZPSCKWv3M3WwNtbBZF@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7x50nbi5EF+R+C92jnxyTOK4JepIwP0hSsWS+Du6uN38PET1n
 QZM9BAw+f2iwu9eu51yGT9Cw+AIWtMeUjbGsw7bxBaXupO0reOl2
X-Gm-Gg: ASbGncso6YsLuAH+A0Y7x5gRc6/wnYmdzkKRs1ygXwol2i1PSNC/5Cjq7IcvWHN8aE6
 wh2KZYqTwTT9iCwqs22uNhcaDyZgceeRSHpJooGcOS7wH/yf9/5eh9bhqQIgnNYwe1Rp3AafIE5
 x18eTjrljxjyF6T8k7qRBDoMurp5stmQ+OW4kzvn0i45TEg3FEJaMrSdlZupowKXAOmMje7f91+
 0Bs0KjQ1jnUjtQvezqyh5f6qa+RVKyPpPnzV2cw0LX6U7Gsn9kjVwWUhRtPx03FPKZIEimSNbKM
 ALkQ+9LwDpgPoQ==
X-Google-Smtp-Source: AGHT+IFV954Mt07Q4rwNohnnMK3EDO9puYnbfJXeppuA+eV8AyVTcOT9PYQI4ykqkopgP4CUCJyavQ==
X-Received: by 2002:a17:90a:e187:b0:2ee:d024:e4e2 with SMTP id
 98e67ed59e1d1-2f452dfaec0mr86450522a91.7.1736148622982; 
 Sun, 05 Jan 2025 23:30:22 -0800 (PST)
Received: from localhost (softbank060124177046.bbtec.net. [60.124.177.46])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc9d4c06sm277776735ad.126.2025.01.05.23.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 23:30:22 -0800 (PST)
Date: Mon, 6 Jan 2025 16:30:20 +0900
From: Zhenyu Wang <zhenyuw.linux@gmail.com>
To: "Dr. David Alan Gilbert" <linux@treblig.org>, rodrigo.vivi@intel.com
Cc: zhi.wang.linux@gmail.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] drm/i915/gvt: Deadcoding
Message-ID: <Z3uGjO36tfhQsnfp@dell-wzy>
References: <20241222002043.173080-1-linux@treblig.org>
 <Z2dcZfW8eNMnxT0v@gallifrey>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2dcZfW8eNMnxT0v@gallifrey>
X-Mailman-Approved-At: Mon, 06 Jan 2025 08:39:56 +0000
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

On Sun, Dec 22, 2024 at 12:25:09AM +0000, Dr. David Alan Gilbert wrote:
> Note: zhenyuw@linux.intel.com's address bounces:
> 

yeah, I've left Intel so can't use that box any more, looks Rodrigo hasn't
queue up my address change patch yet. Rodrigo?
