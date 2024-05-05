Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D94C8BC30D
	for <lists+dri-devel@lfdr.de>; Sun,  5 May 2024 20:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBAB112D00;
	Sun,  5 May 2024 18:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="R0l1QcHP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDAC112D00
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2024 18:29:06 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5AC9A40E024C; 
 Sun,  5 May 2024 18:29:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id T-3NwLK1gWyt; Sun,  5 May 2024 18:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1714933740; bh=2c3rsJd5+C9gOUqICAJkWhmVm4gYvJcQn1yN6aN3iuo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R0l1QcHPcURtc+luuPBnrsq8jO1czQN5/BzhAxRPkLw36GkYIe8a519flkhX/PJP4
 JSG8xL7YZPfCL7hklEE8y2UdGecuylXI9rUVaRRK6jPPVjlWTkw+v2O7jVoGI1VeGX
 F3D9o7yELJP04bHX9q1ECpQwLDHdpw65XghukIJNfDYuJvO56DoExK2f7VDsFKUdJA
 hcfcwDAUmwp78SfTZrYtsJO9N676Vm+UVnEzZqgFH3DGGSDK6PGRARyFZz9CJKEMUk
 OnT+Qf3xjiQns4jKyL3KAvzB8GftOm3KGEc3yiNB9W07whKTmRClNOR4XnTTTO+OG1
 50ekC/avKv6+M3b78bfc6Id6vD2Iq2SlEln54H1Sg4BIOamC2yidcIDjsb32kLbJXy
 hqiF9ca5RU5Smg/3ugEj1STdtoYwj4lgUmvsxVVNhBK3PJbCOutXCyaKOhm4yy5Xoe
 1gPzWKeR+bJXtJyjbxQ2SwPYTfdv0rFnkDpaREAnt8J2R1NjvfNssf+CzPuE4ggfQ5
 OgwNDcIeMCk9KmNJD0xJjKBtX5svvHPY/Ci9RHqcFnKIryPkEacccnDRgsCiWz+els
 5uLzMLm6EGGDj8yDUA1h6bzlztrgLnUcMNCqIbe+TT7J0O9WPWBRhE3xzdqTYES9WK
 9l3IMFoVPT9iJN58SgHOlHWI=
Received: from zn.tnic (pd953020b.dip0.t-ipconnect.de [217.83.2.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6E30340E0187;
 Sun,  5 May 2024 18:28:34 +0000 (UTC)
Date: Sun, 5 May 2024 20:28:29 +0200
From: Borislav Petkov <bp@alien8.de>
To: Alexey Makhalov <alexey.makhalov@broadcom.com>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de, x86@kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-input@vger.kernel.org,
 dmitry.torokhov@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 timothym@vmware.com, akaher@vmware.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, horms@kernel.org,
 kirill.shutemov@linux.intel.com, Nadav Amit <nadav.amit@gmail.com>
Subject: Re: [PATCH v9 2/8] x86/vmware: Move common macros to vmware.h
Message-ID: <20240505182829.GBZjfPzeEijTsBUth5@fat_crate.local>
References: <adcbfb9a-a4e1-4a32-b786-6c204d941e9f@broadcom.com>
 <20240424231407.14098-1-alexey.makhalov@broadcom.com>
 <20240424231407.14098-2-alexey.makhalov@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240424231407.14098-2-alexey.makhalov@broadcom.com>
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

On Wed, Apr 24, 2024 at 04:14:07PM -0700, Alexey Makhalov wrote:
> +#define VMWARE_CMD_GETVERSION		10
> +#define VMWARE_CMD_GETHZ		45
> +#define VMWARE_CMD_GETVCPU_INFO		68
> +#define VMWARE_CMD_STEALCLOCK		91

Ok, what part in

"* first patch: sole code movement, no changes whatsoever"

wasn't clear?

You're adding those macros above to a patch which claims that it does
code movement only. Don't do that.

Let me try again:

* first patch: *ONLY* code movement. No new code, no new defines, no new
functions, no nada! Only move code and do fixups so that it still builds
like the export you're doing.

* follow-on patches: other changes.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
