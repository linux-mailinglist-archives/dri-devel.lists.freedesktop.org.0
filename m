Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JG1GoJLg2n4kwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 14:37:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B58E685F
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 14:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C652410E63F;
	Wed,  4 Feb 2026 13:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="JTOP2Gc1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B994510E63F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 13:37:02 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-59e0d5c446cso8167034e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 05:37:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770212221; cv=none;
 d=google.com; s=arc-20240605;
 b=OV6S/2WrQrMQythW/cPTNw0Mh4BjdlNGa/zByHa5Smc3La2HFX4tgQlsNuQ8YvGEkw
 m+qzSsQBZ0GQ6ZYNb0T3Jzj8HxWbDFmp3vERzlcoQvQE0+2Rbf3KNK51zSfqV7iPdZrq
 GqTWFUQb7lbvJntPEdQ1sXOhtOyWfK435mFfAW25RAkRSQscn9Q/epiSaYFCVoXMXOxC
 NLQKzn25pkPVvtlMKG6aKfJSgaNYkvBFojHjpVzFdXPmfAMyrKhJ4jNIayQbr2Mm2CSs
 uytvoh7bTTEgsxEd5bkyiql9B3qOGlEU7TWKZPzP5AYLC4F7zQuAqdt/1ik9WE7xEFrh
 1WjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vxF2i0OvQTmSW5YarbsckLsO9UOkfwYncc/6WoZn/jg=;
 fh=Sg4x5BvIEYB8WmJcL0jSpmIE/NJtiOuwSe8udzW/NfM=;
 b=dhoo5CSQ2Pde/NOFTp/RkJfuzpjAtiftI1LCwxOE8u8TBqk+0w/UGN6UeepxB78mdR
 yLhiqvnT2/Hfm1GvuuouIZZo/VPZwo38YJJUQ62cVJcyTYZp8+QaT8iLvlabXxKhdRMB
 fQcO6kDew8kEhWCTGFS/9YEmWOcQH+OhGoU9a0BRu3hbm7x9nbOFrTqB+cUuM4KQ95B7
 Im8hYEriLm77EKHyetCuvUAXjqT56iR9XiopF60cPkrp8R36ZKUp6rqkFxfKqbqkT4zn
 6/aaDKtxU+GWUkRSXPzpnuS5gQNNxiOWInWgE5WqwBy7wqF3NpkBhoptQNwxsnNelLjt
 5LhA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770212221; x=1770817021; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vxF2i0OvQTmSW5YarbsckLsO9UOkfwYncc/6WoZn/jg=;
 b=JTOP2Gc1yGl1PVbC+2JePeJhUnV9whVxsKLZDKXRRqJ2UUoJs48Nlzi3T0zbg8MwcN
 fB3B0sK9/FZGOQ6/GUH1WEVvKexl1NjhqPodTPBt2TQNSTWcFJ18NIY1A9fud1yqyLXa
 ERhU7oGQsjuf0kEA015q21/eJNZ5pXsTOKFVgWGpNRJNyi66BRoxc6kYFNDZq6sKmluK
 nuDbEJti5QxhoH49/vHp8AeoI1SnaIbEtHprQcv9hYGGN7TN/+Ksvd56B97UW6fvJWmv
 oHlhdi1siD3zEOiark4DOBFeF5gD2evMKlbHJHyuoLyYIee6aS8peyA1D7kzqvOBBgOx
 uT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770212221; x=1770817021;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vxF2i0OvQTmSW5YarbsckLsO9UOkfwYncc/6WoZn/jg=;
 b=pSvWTzundBUPZBGXTd6u/hI7SeHkGR1n90+XOy+8eZhUUTBVl12Gjt7/JKe5nBgIna
 fOITJlOu9PKNK/Z7yYyR61QsZ1qfWTaN1MoYizm+Ab1EYVZd4YROkMy0qKanI8EMEWBW
 uz85kS2J/FqeDceePZx/GWpgTlA3VkvTKb5rEUOpyodl6oNf78mWgoTajRJ70HHVH5Du
 MGHlZ9xSVdh9o1q3+zHyBwvPDKm4FtLBOq1SOg/MGpEsNhiHOR96YEnbpAfWs7KHBuvN
 tXFPp2r2QwIlyFkHnX/kx62Fd8Sr5qeooGjGl12ze1oX0lbMR2DmQ8pUf8o0vBthSyPp
 +Qxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFsYkZxgQz3rJp2vxxutesdX3GDmYuVpj0XkLIYJjLIrfYPLbequIrumq/ysgkDFqKWSZZ2+2mcRE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3+4/Z5wn+v+nkg4c1srip9oz7hjwcHxqK2qFm4mpaCrFhCJRq
 jyZ0oYqcyzPCjAqpiM+AXGzvVr1OUyTL+Lb0EdL5xlOOlCrWmnxPajX4ENCORsuZkp63eefZsos
 FwDiAlL9mvBjNBe/5n5G8jUIN//kWLnRYe6HTVntidw==
X-Gm-Gg: AZuq6aJ40hudNFV9LjvDTGijObe7OmTs/mlQDoFW1hP0l+1I2WprPgPjB07xAMUQRdr
 EGh6A8kgGX+KQsoWqB/2QJjYPGIsEzwgjxaz4nh5YG3krv73wN3Tt1gHDTxKma4SpBz/wd4c5FG
 usA/Ox9zxvZLKDR7QZ9rBgMFNpTphC5kpMtxZRwwATHKbCCntMq0qzh7QK2zTX6GLSOnoThfZah
 FMaAZ4JZcnZfgfErLeNIx4NkHRzEfVMrRKSKtPSxzuC8ekHoa+usAbhb5dSEqLA+NhOVC9R0Nii
 q5O59vMBb9MFpWtw6niVd8msdRox
X-Received: by 2002:a05:6512:ace:b0:59d:fd41:d6e8 with SMTP id
 2adb3069b0e04-59e38c216f7mr1435944e87.34.1770212220919; Wed, 04 Feb 2026
 05:37:00 -0800 (PST)
MIME-Version: 1.0
References: <20251030162043.292468-1-marco.crivellari@suse.com>
 <a68bac38-ac0e-4ad6-8b70-72b09811a21e@suse.de>
In-Reply-To: <a68bac38-ac0e-4ad6-8b70-72b09811a21e@suse.de>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 4 Feb 2026 14:36:49 +0100
X-Gm-Features: AZwV_QgQDp0hj1IWvuuJsXQfuyEKD9QdCdE0oI3PJFmw50J8lM0bY48qNSCAehs
Message-ID: <CAAofZF46ViRF6qv=AEf1mMW-58eTPE0bNvkN=FbL_4j_DMfjZA@mail.gmail.com>
Subject: Re: [PATCH 0/3] replace system_unbound_wq and system_wq with the new
 wqs
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
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
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:linux-kernel@vger.kernel.org,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:frederic@kernel.org,m:bigeasy@linutronix.de,m:mhocko@suse.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,gmail.com,linutronix.de,suse.com,linux.intel.com,ffwll.ch];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B4B58E685F
X-Rspamd-Action: no action

On Wed, Feb 4, 2026 at 12:58=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> [...]
>  From the description, I've found it hard to see if there's a change in
> semantics here. But this series is effectively about renaming AFAICT. If =
so,
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> for all patches.

Hi Thomas,

The new version of the changelog is more clear then this one. In case you
want a cleaner version I can submit a new version.

Anyhow yes, in short the change is the introduction of system_percpu_wq
and system_dfl_wq without changing the behavior:

   system_wq -> system_percpu_wq
   system_unbound_wq -> system_dfl_wq


Many thanks!

--=20

Marco Crivellari

L3 Support Engineer
