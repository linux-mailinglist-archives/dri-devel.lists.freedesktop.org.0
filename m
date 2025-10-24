Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 917E8C0A087
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 00:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB8E710E09D;
	Sat, 25 Oct 2025 22:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="F2SmIfiK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F41B10E1F0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 12:58:43 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-378cffe5e1aso22374561fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 05:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761310722; x=1761915522; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zv16Kke8yqgjiJWpmjUKPrYOhlKmP4/uuWFc5yGXvxM=;
 b=F2SmIfiKZVTBWCKF2g/wIDomY134wb9GqRZUq+uTRfB1p7s59cHddiYZ8oPXYgaFD2
 H8EwVw3I2ZUXYAcyzvzPWgO/xJcI4jOrOA9SFuOeunA2bNWC/AgXNHWSeJVYjude9o2g
 hoRbQHjHF538q4kclHMq+zHBwnv34ow7yjmSvofClHijG0UkO+28l22dvdKBfyf8NAD3
 2UzZKb5BvtBQ1auNCeg2CNNkAySAE/RLUCFvhYuwj7ggEo/5UAhs9sEWrFg7BvLJC+Zw
 5EE1Oc2695CxZnUtkl3+/RdeLQlskkhfJeJrYhJ1Do5MeMWhNQ41/3+qPul+d5Ns+22z
 iyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761310722; x=1761915522;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zv16Kke8yqgjiJWpmjUKPrYOhlKmP4/uuWFc5yGXvxM=;
 b=OqWbRqRtndZ1vMBKnUGrQd/jwbMECQTAXf0puHesD4nMFRoSQceiauW07lym+0ctVK
 2rL3udGfR0sLeTOFUul78js5PEyA8lvMFTJPvz3V4UOqvzGxd8+YVtmRKu6ziHlLy++J
 Sgwy/FzNnfL6To1ur3gXALxq9aH9WzHeU0LLV4V6Qef0YQhGMq6glRY8eaOtl18Rf0In
 6koi1hYEFha7oVA54EAhZUPlEQFsoerElLdgHoYmllV9AFhdFmdSI9abO0thjvryh91P
 HtKpn0WO11mmYExpasu/tVpdP6Yvil/VjiFRO6BVxRftyW0laCIS8Q3MbaVL4cVwKjHz
 2HSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAcskFcQYRMeMMfWX4W2uvjE2OW5gvRUVPen+gVo+KdNNz3pgnCKNOJ88dGYO4kvlJVnzaaGMMjRg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhVFu/6nkvI3Zz9J7Meu5cJI0pJ06+HqMoQ0MCEHLCLijDEAaw
 D5PGwzQ2PlCymQrlzMinTrobzexP9K8fS2opBm1HXPd6aL6s+gO4lekMmQGCMal0385+NHb1ehK
 YJod1L93T4vRpTmd/RbP+FYlhsUhBjK+a3uAI/gl7qA==
X-Gm-Gg: ASbGncuhLtpb/7MEcJGWHIcufDiInvojNtEFr/Bf4TqOOIuR4qQ+F8bGOtEDYVO3Ta+
 8ZEzf+Kug+Yj1RSGy5ico12ZYxC767unbQ+rYxVt7uf1b5/0ECbVKdAiVVRiFtYL29WUdSDjpd1
 FvVMiW9UEOLCBC6F9eln9OR/yIa7meuIKsuCGUxVRU2MmjiuEUN1kVU3+xnXvrdl1bwMugx/7Hy
 K9vXHxZ81A5h7AuXiBxU1FXCA4HVutd3qbIpoS+S6FB/50T4hWDb+7L5XOFmojRQa+cBvIcjyTm
 Q+SlmZpPbd1+/6MWKw==
X-Google-Smtp-Source: AGHT+IHF9LkpNIRrlRpVu99l7ev0LdpwqQhfXRuIQZZ0ncl5gX4GTf5lVW8kJ+14MFqbskyOhZZ7aJPuqPi9SZUWgRk=
X-Received: by 2002:a05:651c:556:b0:376:5027:7f37 with SMTP id
 38308e7fff4ca-378e4518459mr6475001fa.41.1761310721630; Fri, 24 Oct 2025
 05:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251024095205.123123-1-marco.crivellari@suse.com>
 <20251024095205.123123-3-marco.crivellari@suse.com>
 <dc2662f4-98b5-4fc8-9ed7-5e4a88168f9a@linux.intel.com>
In-Reply-To: <dc2662f4-98b5-4fc8-9ed7-5e4a88168f9a@linux.intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 24 Oct 2025 14:58:29 +0200
X-Gm-Features: AWmQ_bkaAAD-el4jxtvs6F6wp2vtCaDr3ajdRFuMESUH0b5iIQ4HTA0RNeg3HAo
Message-ID: <CAAofZF7FXixByyXm9fKo8aMjdD95wzaCanWbBV-cRzy5UYWTdg@mail.gmail.com>
Subject: Re: [PATCH 2/2] accel/ivpu: replace use of system_wq with
 system_percpu_wq
To: Karol Wachowski <karol.wachowski@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 25 Oct 2025 22:07:05 +0000
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

On Fri, Oct 24, 2025 at 12:49=E2=80=AFPM Karol Wachowski
<karol.wachowski@linux.intel.com> wrote:
> [...]
> Thanks for the patch. Please fix the checkpatch warning:
>
> WARNING: line length of 104 exceeds 100
> columns
> Also there's a typo "consistentcy" -> "consistency" that can get fixed
> with together with that warning.
>
> [...]
> Tested-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>
>

Hello Karol, thank you, I will fix both.

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product
