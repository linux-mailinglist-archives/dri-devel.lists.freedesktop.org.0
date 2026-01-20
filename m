Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODuTHKurb2mhEwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:22:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09574475D5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:22:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC76710E5CC;
	Tue, 20 Jan 2026 12:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VuIrJPzp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E1910E5D4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 12:07:08 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-650854d9853so1010039a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 04:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768910827; x=1769515627; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding
 :disposition-notification-to:references:in-reply-to:date:cc:to:from
 :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=6mJN4EWiKZWaSZItRX0vL+7HkWk5OupdgIHdp6FGDiU=;
 b=VuIrJPzpMsP4ftNNjh88B4HdKAbfjvCz3R3aY86rJkjFP9OH9DrDNx7B1vc/Xey3Qr
 vRDCb/3cHAy4Tyl8YDRXy9r0Xqdnf82kMTzcux1PQ/o8P5mafZfh/iAVMMuuUuoWOSyH
 EZYOdYebmqT3/n7bYJOBDuZHZRa/bb2WOfjhyIJy55JMooW+ZmZKteguBBPzep55oEpG
 lNbT/AhqjJp05WvdhfaSJ5oLQO2PEpP1Ds1jW28DeU1B4pnvZw5xUCjaRthbq2nenUca
 j0kAuH0kB1on0XrcAtnA6sOKOkJxj1G8V+TLcDGX7mamd9Chgn0clxWuq+naCR3M3Flj
 /7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768910827; x=1769515627;
 h=mime-version:user-agent:content-transfer-encoding
 :disposition-notification-to:references:in-reply-to:date:cc:to:from
 :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6mJN4EWiKZWaSZItRX0vL+7HkWk5OupdgIHdp6FGDiU=;
 b=EQ8y8QpFySMWs8UuFVnsZi8G5diRlvSys+6W2fIRdAjCBcvcERUGnTxJvfbSnLZ1RH
 yrHMcjgC9HmOq+IhocqQWAX9P9iiS880b6XVEHjSO3OPTYdeLThQwDJoRALqTCRNMsgK
 uSbHN1hKSSHOo3rHyGe6iMeZye/8n3L2Vvc1KxWG07S9CavE59ITJlBWdY9CzxQi6jtq
 9MNym4HwqZOALkHUfB3+JsohBEhsCC4VyWp1+NcXaFNgEPPvba0aKxyl5ny7YOe4b+NG
 uAlk8zNZvxoA91kso+OplVcabH3/VaDFlK+8x9tR3NSy/66MM5gJzRDq5mfDnCmGszlJ
 cV+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBGNwF9CNlp0qxXW0vZ7sIPuGm633+SYOL7CnMyJQAqRIM30o239ms+l6L6aRon6AcEWWuOJ03A/E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqV73uB5+3q4QBO3tyXfhh2vMaMVQpZlZbIxCWlOoXsNfyfeSF
 EvbfddivM+/mjxMgVfoezwoobgAKdcdfJW4rk/eBrK3UxJ+ADxm5X5bK
X-Gm-Gg: AZuq6aLmTVNTdbVEiiiwpnHZFtSyyh9k3uJFGa5cwiERD1zT1eoUJZXkJczKqXjGZgN
 3yPyrL05K3qEADyDDV9q/Eyskpn0/OtMedn0euiw3rGfLq1C9FdOMjIMrby1hKEMtzGohcK5Rg+
 Ij2BYLeVUvYs4BilAXUqTdrtbVjaC9T/iXg2/Ls6ut0CMKSwDouQhUp2G0isb0sxBglK6/aNPj/
 ybdKIhx6GCev3GVEwQIDSh+32iJWapgL1KFM/+1PYq5D7yGsA2NsTOxA24cJpxEuNIMHjBrIwEu
 VUZ1nE4sQLiKcqHLbW3inO3dg0Mnqo02c+RwZRVSBvMRcaYYQ4sUSMBqhHIk5d8XgbrqJR8G9KV
 4U6GqLzv5ceRTFuG09NzFWjXbRB3QG6jpD0LORte/0xMl8oOAKyB5lLRA3xRz08gTnmUXPNWdgz
 gnKZqdWw34q9e+Gi+B7uCgLiwwVF0pnalOsDDim+J879VvYyIoWOL9FEsd52hpkuM1GOyIYiM=
X-Received: by 2002:aa7:d74d:0:b0:658:dc6:6d08 with SMTP id
 4fb4d7f45d1cf-6580dc6702dmr167598a12.7.1768910827175; 
 Tue, 20 Jan 2026 04:07:07 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl.
 [87.205.5.123]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65452bce433sm13190978a12.3.2026.01.20.04.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 04:07:06 -0800 (PST)
Message-ID: <222c4c14ee6c20f18381580b249d160d197ce3e4.camel@gmail.com>
Subject: Re: [PATCH 01/17] drm/amd/display: Return if DisplayID not found in
 parse_amd_vsdb()
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, alexander.deucher@amd.com, 
 harry.wentland@amd.com, sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, 	airlied@gmail.com, simona@ffwll.ch,
 siqueira@igalia.com, 	dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, 	linux-kernel@vger.kernel.org,
 bernhard.berger@gmail.com
Date: Tue, 20 Jan 2026 13:07:03 +0100
In-Reply-To: <b535614d27e30831628b4a70b7ed825fd03791d4@intel.com>
References: <20260119011146.62302-1-tomasz.pakula.oficjalny@gmail.com>
 <20260119011146.62302-2-tomasz.pakula.oficjalny@gmail.com>
 <b535614d27e30831628b4a70b7ed825fd03791d4@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
MIME-Version: 1.0
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
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jani.nikula@linux.intel.com,m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:bernhard.berger@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 09574475D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 2026-01-19 at 15:23 +0200, Jani Nikula wrote:
> On Mon, 19 Jan 2026, Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.co=
m> wrote:
> > [Why]
> > The function would continue to try to parse EDID even if DisplayID
> > extension block wasn't found. Sometimes it got lucky and found AMD vsdb
> > in CEA extension block which made debugging harder.
> >=20
> > [How]
> > Add a return if DisplayID extension block wasn't found
>=20
> Maybe don't use homegrown EDID parsing, but use drm_edid.c instead?
>=20
> BR,
> Jani.
>=20

I would be all for it but I didn't want to make even more changes. I
cannot refactor the whole amdgpu on my own :)

Plus, the generic drm code doesn't yet parse AMD vsdb. I could certainly
add such functionality, especially since it's already in projects like
edid-decode but amdgpu seems to be doing a lot of home-grown edid
parsing and I'm not really sure why, even sending stuff to firmware.

Especially confusing is the part where AMD vsdb is parsed differently if
it's in CTA extensiton block or DisplayID. They honestly are identical.

At least, here in, setting the freesync caps, getting info from generic
drm should be ok. I'll think about it and probably intoroduce AMD vsdb
parsing to drm in a separate series.

>=20
Tomasz
