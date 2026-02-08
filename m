Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LcHGJuEiWl8+QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 07:54:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9A810C437
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 07:54:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238D810E196;
	Mon,  9 Feb 2026 06:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="I8guTTB/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB91410E2C5
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Feb 2026 00:02:58 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-8c6af798a83so356709685a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Feb 2026 16:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770508977;
 x=1771113777; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/ixKYwI8fU81gZ+QKkq1WjH9E+1EyNt8hakHtj7h1q4=;
 b=I8guTTB/pfz2/bUtNifKS+rcaVywzGRtYzYN5Mk4YqIAeGZjbg4ZYfcIB4Fl8iZmwN
 5Kr8tAAiul/pEzIp9mVTDLVJqWDmnBk6V39aelx8V5rRSYSj/5VjgMYpBuCbyPUK4BIB
 UfcOnKzPjr+83FyzytXn0I1bfF2JmuqbrtfdTP6P6b8sg4OHac+/JXr8gyYP1GTTvOwe
 T3VCxm+46zN3XC1ZGufekA28zx5jQnX3XefCCwfhcjfMdRhdv6AXRvdOG2QTgLTTScVz
 5WVfDsVPbuditIY6l55/s0s7PPmpoqIPUig2+t0EtU434EaMVhtSsw++Zgd9P1+z0/Zs
 O3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770508977; x=1771113777;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ixKYwI8fU81gZ+QKkq1WjH9E+1EyNt8hakHtj7h1q4=;
 b=XkWou8H4w4M98CaGt/Mdpc3WXaKq8sLdnVoeE11Mx0ivMoLMr/VjBu2cYY13wQlAwf
 f6kC7+A9MbrqjwtfUw8kG5pAsPFHOhhasoT9Ac9ajjKhz4/oSgDIqDfp4fYer49KVS60
 IbD45lRuT/LDP1BzlWymP/BB1WUWmwjHhvRFMeva1pRPAo2tL1I6lRCkoOAYyxe05Agc
 IGDtML1BBCS0oli/oJP7B4CsYUyLS8d3gwCgcVK54Qt+wQHYeBu1kuv4hpGw5FFi+5tA
 h5VWQ2q1GXUrw2ddDlTAfZyaeqqL9dhlUP0MC0nutA8TzImrkukLHig5p5UFRBYSYXR/
 11Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoMWIvAxcNxc7pvYjiGcSn2VGGyF7sAP2W/YiUc6yQcCt8OZMZ5ynFNXGXc0zvCDOvBhDvjfvJDV8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRy67gg6T7F7LUjEBpon/PMU97qZiFdnhI5pQxGRXM84t4/iaN
 lpU2iQoJipaNbI9zlb+6uLE2WrB8TNK5VRyRA8UlcqvdQlq9XvMRNFIIKJePjBBbFTU=
X-Gm-Gg: AZuq6aINfrXl/fyiuwvDReT4OAsstW5qmXdMwaZbi71uKA37IsnHHjWTOsZ1lcySKki
 dFR4hjqcvFa8UhzMN3UW9wtk+bALTi87wVjcxZ9kaQor3kd0AT+QLFQQHIxAhRpxkm6uG7knoS4
 Sc+vEwBWujHZwvl3vrCnswxLS2W6sNHvFY9b1fuQQbImiwd4IXTL9nOGxPduj6FAa8fG3mSwvHo
 VlrM5l3BdYfTkQCyKvMNxNadv4DaRy8TuMwPvU2nmQdAw4580tboA+cKHzXfk6fDx8RWOqneWnv
 /IuW1ss7O0yYMyS+L02aWYBWt3ZknRKTfpiI1LnsDOjcS/jskh6e5kPr4blmP8FSnH3rHDCv6LI
 i1eQwyTwq35rW0vQY51WuEqRGYH1BMrUN4OZxvKLKXAO//G5TtMm3ileDASnQMJ9OSfYB2FI4aQ
 +gM3yWtV4pg+bD4LNHgbBMz++REap9TCID7px9EvUeb9T537/g/pe4M4S/JfUrm+aHzBVyQs2Lg
 7XcZEtgj0EXmE/89PilvAZVIq6kLiE=
X-Received: by 2002:a05:620a:4485:b0:8c6:a5bb:f464 with SMTP id
 af79cd13be357-8caf17e3e69mr972256985a.66.1770508977586; 
 Sat, 07 Feb 2026 16:02:57 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu.
 [165.124.184.136]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89546b09f77sm30968746d6.31.2026.02.07.16.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Feb 2026 16:02:57 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH] drm/amdgpu: check num_entries in GEM_OP GET_MAPPING_INFO
Date: Sun,  8 Feb 2026 00:02:55 +0000
Message-Id: <20260208000255.4073363-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 09 Feb 2026 06:54:11 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.79 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[30];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[u-northwestern-edu.20230601.gappssmtp.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[northwestern.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,u.northwestern.edu];
	FORGED_SENDER(0.00)[n7l8m4@u.northwestern.edu,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:n7l8m4@u.northwestern.edu,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[u-northwestern-edu.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[n7l8m4@u.northwestern.edu,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,u.northwestern.edu:mid]
X-Rspamd-Queue-Id: BB9A810C437
X-Rspamd-Action: no action

kvcalloc(args->num_entries, sizeof(*vm_entries), GFP_KERNEL) at
amdgpu_gem.c:1050 uses the user-supplied num_entries directly without
any upper bounds check. Since num_entries is a __u32 and
sizeof(drm_amdgpu_gem_vm_entry) is 32 bytes, a large num_entries
produces an allocation exceeding INT_MAX, triggering
WARNING in __kvmalloc_node_noprof(), causing a kernel WARNING,
TAINT_WARN, and panic on CONFIG_PANIC_ON_WARN=y systems.

Add a size bounds check before we invoke the kvzalloc() to
reject oversized num_entries early with -EINVAL.

Fixes: 4d82724f7f2b ("drm/amdgpu: Add mapping info option for GEM_OP ioctl")
Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 3e38c5db2987..ef5d8bd216b2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -1047,6 +1047,11 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
 		 * If that number is larger than the size of the array, the ioctl must
 		 * be retried.
 		 */
+		if (args->num_entries > INT_MAX / sizeof(*vm_entries)) {
+			r = -EINVAL;
+			goto out_exec;
+		}
+
 		vm_entries = kvcalloc(args->num_entries, sizeof(*vm_entries), GFP_KERNEL);
 		if (!vm_entries)
 			return -ENOMEM;
-- 
2.34.1

