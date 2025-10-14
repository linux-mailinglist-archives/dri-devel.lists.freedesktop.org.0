Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD11BDA6C4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 17:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D5310E643;
	Tue, 14 Oct 2025 15:36:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.b="V5AYXyx0";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="hnYMKBYU";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="z2rwFirU";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="KiFaKlxx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2D910E633
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:36:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5996C21AC6;
 Tue, 14 Oct 2025 15:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1760456179;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bmE6VzegeivNLjYeACPmfdotkv2L9ReygmMDURtHGPU=;
 b=V5AYXyx0S++iTp/rfCZ9o8zDsWuM1BpXlyH12/ED22L49DzQqerIx8l3AZnOL0wJBjB+U2
 nVHl+If7Kl3gaJsQ5dqcCACvHy4ScZaAAGto5m/o23+Iu4EIatTde+FDVHb+lrkp6QrLBr
 K6/wXKSoInBHZM/0nzQMthkG/kKzNas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1760456179;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bmE6VzegeivNLjYeACPmfdotkv2L9ReygmMDURtHGPU=;
 b=hnYMKBYUsmpt5avGESAkMdg35cYnoH1A+6fqUpI8l6hG8gbSoxxOtYgy4sbPYGnsOXTYgY
 Fm2sfR1X0yLAseDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1760456178;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bmE6VzegeivNLjYeACPmfdotkv2L9ReygmMDURtHGPU=;
 b=z2rwFirUYzayqiygu8dorprLDTBkh1kMEGXz0xJIW13gIdhkpUNvF+WwOm7SSoAfR/HGgu
 361YZyZJg2G/QeK5JWxmf7Vb5kp1N9csfXQ+z0qZFMNUrqToAZ1CQfFVbIsMRdy0bbGCkB
 KCMfagf9p0e1eDvMAK1gpBMW700/J0o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1760456178;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bmE6VzegeivNLjYeACPmfdotkv2L9ReygmMDURtHGPU=;
 b=KiFaKlxxMbb+cSrJaFPO9Bb8rsxQRI/HupQEvEuE6jRS7h3W2EUWvU0oqSTIL4PaPSNnA0
 ST8v8o/fhLnF62BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1F239139B0;
 Tue, 14 Oct 2025 15:36:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id dLNKBvJt7mg6PwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Tue, 14 Oct 2025 15:36:18 +0000
Date: Tue, 14 Oct 2025 17:36:16 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Adrian Larumbe <adrian.larumbe@collabora.com>,
 Simona Vetter <simona@ffwll.ch>, Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH v2 1/2] drm/i915: Change semantics of context isolation
 reporting to UM
Message-ID: <20251014153616.GB181869@pevik>
References: <20251008115632.16333-2-krzysztof.niemiec@intel.com>
 <20251008115632.16333-3-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008115632.16333-3-krzysztof.niemiec@intel.com>
X-Spamd-Result: default: False [-3.50 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 URIBL_BLOCKED(0.00)[suse.cz:replyto,collabora.com:email,intel.com:email,imap1.dmz-prg2.suse.org:helo];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,imap1.dmz-prg2.suse.org:helo];
 RCVD_TLS_ALL(0.00)[]; MISSING_XM_UA(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_SEVEN(0.00)[9];
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -3.50
X-Spam-Level: 
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

> From: Adrian Larumbe <adrian.larumbe@collabora.com>

> I915_PARAM_HAS_CONTEXT_ISOLATION was already being used as a boolean by
> both Iris and Vulkan, and stood for the guarantee that, when creating a
> new context, it would not contain register state from preexisting ones.

> However, the actual param ioctl was returning a bitmask for the
> engines in which isolation is supported, and IGT gem_ctx_isolation was
> exploiting this wrong semantics when making decisions about which
> engines support it.

> This is a uAPI documentation change that precedes the actual change in
> the getparam ioctl.

> Signed-off-by: Adrian Larumbe <adrian.larumbe@collabora.com>
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  include/uapi/drm/i915_drm.h | 4 ----
>  1 file changed, 4 deletions(-)

> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 535cb68fdb5c..5aff550034fc 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -724,10 +724,6 @@ typedef struct drm_i915_irq_wait {
>   * supports) that all state set by this context will not leak to any other
>   * context.
>   *
nit: could you please remove also this trailing line above which contains only
'*'?

Kind regards,
Petr

> - * As not every engine across every gen support contexts, the returned
> - * value reports the support of context isolation for individual engines by
> - * returning a bitmask of each engine class set to true if that class supports
> - * isolation.
>   */
>  #define I915_PARAM_HAS_CONTEXT_ISOLATION 50
