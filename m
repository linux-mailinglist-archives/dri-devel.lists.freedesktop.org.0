Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mL8iCJGbqWnGAwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:04:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E6C2141FA
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E0C10EC14;
	Thu,  5 Mar 2026 15:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="CECVRg2f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A99B10EC14
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 15:04:45 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5a12c19affeso1007634e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 07:04:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772723084; cv=none;
 d=google.com; s=arc-20240605;
 b=MHO+FLKKg7pb5FfDXEGUHDffyZT9OCQT7kINRliISeqC7n/1Pja2gCGFc5o7kOu894
 VfnP28r8AcqPk188LqwcUuvxM0xH7XCsz+z/vQ3lnHnLp+JeRz7mh544wsVpLQSiXeNY
 1TNLrSx3x3B+aKchszcFOtE3yAKQmZIUDlTyVlp8n3GIYBaA2ARuFha+5Ye2JBbbq/YJ
 ugZ6EBxtyHwLw6SQvKDOo/EcX/ssk1+KQlRrmJtUvQsRZ91tFG7MaRb7CXR0drjfzVFV
 yV6NBECVoeByF/1dfm5pVSPEr0MaAGJp4/ubh5wPpxFuUQHu2XlCcbo4EhUagjzWJAXj
 1sfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=bAzlDiATw0sReZVnHLqMUNDe8YNqfvDhHHmieW05wFY=;
 fh=dYwUcEyMChBCVMRKs3C2+RHjQi8j5UzK3OUy8A0SBdk=;
 b=CO814egi4H/JLLqSM2wI8E+hYFGGoBKVjbc6ZsX6oZ5k2TdNmrPR1ka2mVDDDKgEim
 Y1/9AKzcKLD0U2A9zHTQGlOwFQjLSURpCaYLGB1YKyP1pkNsV0/cTzJrwsNz5zR+qydP
 mb9ofUFZCIxUAijyUxPfJtj5X45xaRUE0xJAvjY45/yPMa+8DeCb4HI3fvFVgbXoO4pP
 iFSx6pOO16BR+hbFY4wlJGMXyEsVlljaxSdoHClYRKY6MibJUmvk87upkwe1IKPNa07o
 nRhcjnnF38LLQQIQS8IqYTAjcUBHO/0tCbU6cZS7pfNhL8B7R0/WCGEyUKMGYkKWI2aD
 wvJQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1772723084; x=1773327884; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bAzlDiATw0sReZVnHLqMUNDe8YNqfvDhHHmieW05wFY=;
 b=CECVRg2fijigNQJYZywOWLSQ/ztrEfJH8ZjViKnrTIcPHPLb39+HMGhMp9oFvxoU7x
 y2Vr7i+4KtatWJm1HHPzjRxpOqsMbJYwzx0syNN3El5stM+8Ucmg8ZBeF0fE+I70iJf2
 7TFRuctAuOxs7/zHsD5dQlpcn0F9kBTdriNTun2dn7pDR7uPN3IZ4JJweOcPHDtfjyeO
 x1e//WpEWEpvHRhZJyoXT1kAuiD1cN9V63pPada48FG9vkGZwMpWhyDuUhSUvcfJTXJi
 t7JA9k+UH49DKsdJEqMt8/1dxzCmqna20H7MKCfjy19L42jsz3k2OtBmCv//QN/V6wx5
 4GMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772723084; x=1773327884;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bAzlDiATw0sReZVnHLqMUNDe8YNqfvDhHHmieW05wFY=;
 b=HiAsVu7iXmOumi6q/spWYFimgf+OVSk+KXAbRDnQ5qwPygr6gDz9Zct7hbTNfIp0bp
 wDP/EbINoIiDuj4qLsfErCugA+pkS8bgyqjpB+3hHLdd0yA/6ed1Q/AJzLoJ7uTHee4Z
 jZ7mMu6Q2otuP2kBcXN6Muwp2DgBiFX2UBL26DPCXau9eyD9dsh6xouXUYZqWq3xLu21
 XW1178M8QdFc9stXxVu3EsRck+0pbBc3wICACBTuww+u+Gztr94wirigbAUakT855TXS
 q80gs44nD99VXmbyvR0Tp2Z7YbjtGa8W6kNixH+58Jaavpvh5QFGEB+BlX2tJO1JoXHN
 J8HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVyOB5pKlqZ1sfIi55yTXpKDywo5fvqu4ONOR6EP9O16YIYKOV+XVbnVB00vDHtOFJrwzHCXEYC4I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAE/WmoSUI373CtIRi50wftIbDRXMBi1rWeykwJN3RcLESaGT/
 CO6gxzO1F164ZkJB5gVNoO174yzVg1JxfMYfo0Wq2ltqG4r8o7Y+vlYDS+Ov/TwARMpDTn/dQ/C
 GgSzDqarYFShPLiLECBX7gfFBe5SRwaZpRO5YgG9KOA==
X-Gm-Gg: ATEYQzxSFqAnuwVmT+3/ytntEmZtsFlN2xXjm3NG8xMZFwSeL4Ss6807Q8XzIazCwvl
 CDVhDa4Ymypk+OYsNO8lDSujL9BkmUOFB2VW9rYvVFPYgK3dc6ZSu1tU0KCJcO6QWsFm61FHJuf
 KASBjFWKQkBarxu/7QkI+e/jZ3A4IXR7BPeKYYd2nbQ6OZDeWvISMy6u6FX+6vofvoNcpsefHZv
 Z5NsVemEM6VheIpVW6L7lA5z89O/1M4+XT8ibK5Nrb26rBq02XYinDsnG32ihpNCLQuYLJPwF9E
 TiX5HHPWg7/PsZCRn68y4Te0aTicp5+uWTpY1PLB
X-Received: by 2002:a05:6512:3d02:b0:5a0:ecb2:c0c2 with SMTP id
 2adb3069b0e04-5a131ee685dmr1018802e87.4.1772723083472; Thu, 05 Mar 2026
 07:04:43 -0800 (PST)
MIME-Version: 1.0
References: <20251104100032.61525-1-marco.crivellari@suse.com>
In-Reply-To: <20251104100032.61525-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 5 Mar 2026 16:04:32 +0100
X-Gm-Features: AaiRm51Fwf7l48SqEBCdWz3UtmH6UJ4sv_2IzU_K0N4uV9iItuAT5-zrxEN7IQA
Message-ID: <CAAofZF4bvBoecKaJv_sEEK54htXBv_dc23tJRrwhXrGb3O_D7A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] replace old wq(s), add WQ_PERCPU to alloc_workqueue
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Karas <krzysztof.karas@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Queue-Id: B8E6C2141FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:frederic@kernel.org,m:bigeasy@linutronix.de,m:mhocko@suse.com,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzysztof.karas@intel.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,linux.intel.com,intel.com,ursulin.net,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,suse.com:dkim,suse.com:email]
X-Rspamd-Action: no action

Hi,

On Tue, Nov 4, 2025 at 11:00=E2=80=AFAM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> Marco Crivellari (3):
>   drm/i915: replace use of system_unbound_wq with system_dfl_wq
>   drm/i915: replace use of system_wq with system_percpu_wq in the
>     documentation
>   drm/i915: add WQ_PERCPU to alloc_workqueue users

Gentle ping.
I checked patchwork and seems still in the "New" state.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer
