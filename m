Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJkkAj0ccWmodQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 19:34:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0F75B54B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 19:34:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DA110E87A;
	Wed, 21 Jan 2026 18:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fhvQLv0L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E832B10E872
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 18:34:32 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-658072a4e56so325781a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 10:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1769020469; x=1769625269;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tKg27RxPMhcJshWGV6uvx5MlXydL7NaCMm4Mk7HtTf8=;
 b=fhvQLv0LKY64J8k1EU4dXPFsgD2CVEkj4nINhvbBOOod4TwT3BQO2lFZYsGn01uR+P
 CgCw7buaIkwG4BMJh11WRLewRI/AIOwHUXig+z1G7Pbmgveccftmm96TQ+fSCWPn6Dfl
 qahW0ux/qL6p6umvJIPkOazq5Yf8rmjMIynBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769020469; x=1769625269;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tKg27RxPMhcJshWGV6uvx5MlXydL7NaCMm4Mk7HtTf8=;
 b=ULQ124bC41ZHChNFKBp786Tnoy1KLWNLwC6DtY5Y5ZBinfoUzN6Vk234BvY2Cuv40z
 Wzu4IzBBzkqIKc/pKTKrdIh5+b4wZ4dHpdTedn5GeVd0CI86vb2/X/0wuk1W9xq0kBZb
 XoTbYqLWPPWYUVbdgqh2NFIcdBORlCRpKonqSWatM5H3RYqYRj4uAOaCBDnDro9Lr/09
 UdFY2sPiiMoB4JlTDVYYt7YI7LCr5k8kg3On9GtgOHr5hsB78hCzrHtWg7KLS0zxHoE4
 KHgnOFZ8n42LREpi+vGPA9xKEZH5GYIDAqBefM5NM/I6OFiUcjSAcbWIFUAiy1njFmNt
 LYig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX5cYoI3zbE8cSuxhNIQegeL0DALn7hkEm1D4YzyFpRU2hMvvdTZML+B4KdINojjuNXz7Rhg3YdEs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVLLnxa+qboHVZsxlQ6ZP2uwXfChrGIy50/K4Y4mEMBD1hZM+P
 i0VNN5/vuhg7gKueRLIlEhGMon/Yo6oE6CGu6Zjc2pwr+sBrydYa2aC4IrKDR73GFZwjvlLtBXp
 fAyW7Edee
X-Gm-Gg: AZuq6aKcZOn0fVUoOfzkNartm3oawvaQ3BBZZq6LaxezQfuPxDcdO4onYfb8HSYWU+x
 2MaeuyWuttof4AxVYeur5IfDRzI3ZtYiK1X7X31QQZKmi4oc9PFyMNAJ5yKVdH1WWGcNwC/NC8C
 8wkumQnTGJqXCZ8HO3HYPrbF6KjUni+VSLymKeoavFiX5D65QXXnVpdlWcXt2cqc3q83Caec94Q
 pOgO2+KWpM/Yx56JrMipvpAw4XED0f0cf02AqPP/VyXpPetsNENyWoQ6SeSrA0bm2EiX1yuJBvb
 1I7gh8AhVzL4pRS3546QNjqHrxy8v3AhJp++sckcOGcJAoCEiY9NrC2t0CdqMOKPZQ5CAotOrmX
 m32BUwLLuR3s3Kk4xSHGhQSmzVgXFgcSYKoj11/22c7nhzT90oQcD/41LmR+IFPby1kY1EFgdSJ
 lB0HZLypCXLjhUwA+26XbKBXCRQcP9rntIKdrTvHZLJLEslU4Xrg==
X-Received: by 2002:a17:907:7b99:b0:b84:2fe8:b5d8 with SMTP id
 a640c23a62f3a-b8792d594e8mr1544902566b.14.1769020468506; 
 Wed, 21 Jan 2026 10:34:28 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87959c9f98sm1677838766b.42.2026.01.21.10.34.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 10:34:28 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-432755545fcso96031f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 10:34:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUiVt7d0OUKCkvbaLLxs4L1YuzQfe8BC9RdDXtMQtS51pX5PVvr1k/PfaPQm6jPmU3piOLa3PrN/Tg=@lists.freedesktop.org
X-Received: by 2002:a05:6000:24c8:b0:435:a647:a3c3 with SMTP id
 ffacd0b85a97d-435a647a475mr489726f8f.23.1769020466585; Wed, 21 Jan 2026
 10:34:26 -0800 (PST)
MIME-Version: 1.0
References: <20260121060428.5602-1-terry_hsiao@compal.corp-partner.google.com>
In-Reply-To: <20260121060428.5602-1-terry_hsiao@compal.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 21 Jan 2026 10:34:15 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WMapKrrd=KMOQFn0Rvc2DqPy90LB-cG0sCDGUr7ZjgiQ@mail.gmail.com>
X-Gm-Features: AZwV_QjjehSTnJ6CmtpoujIisjFv02Z6G1tz2LVQOfNsKHHlUMQpz5pALF-iQ_I
Message-ID: <CAD=FV=WMapKrrd=KMOQFn0Rvc2DqPy90LB-cG0sCDGUr7ZjgiQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel-edp: Add AUO B116XAT04.1 (HW: 1A)
To: "terry_hsiao@compal.corp-partner.google.com"
 <terry_hsiao@compal.corp-partner.google.com>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:terry_hsiao@compal.corp-partner.google.com,m:linux-kernel@vger.kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org]
X-Rspamd-Queue-Id: 6A0F75B54B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Tue, Jan 20, 2026 at 10:04=E2=80=AFPM
terry_hsiao@compal.corp-partner.google.com
<terry_hsiao@compal.corp-partner.google.com> wrote:
>
> Add support for the AUO - B116XAT04.1 (HW: 1A) panel.
> This panel is used on MT8186 Chromebooks
>
> The raw EDID:
> 00 ff ff ff ff ff ff 00 06 af ba 89 00 00 00 00
> 0c 23 01 04 95 1a 0e 78 02 9e a5 96 59 58 96 28
> 1b 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 ce 1d 56 ea 50 00 1a 30 30 20
> 46 00 00 90 10 00 00 18 df 13 56 ea 50 00 1a 30
> 30 20 46 00 00 90 10 00 00 18 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
> 00 10 48 ff 0f 3c 7d 0c 0a 2a 7d 20 20 20 00 21
>
> Signed-off-by: terry_hsiao@compal.corp-partner.google.com <terry_hsiao@co=
mpal.corp-partner.google.com>

Sorry, this is still not right. This should include your name, not
just your mail address twice.

-Doug
