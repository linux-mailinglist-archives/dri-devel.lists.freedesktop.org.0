Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIMsFpvdb2n8RwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 20:55:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DD44AD8C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 20:55:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA2110E12D;
	Tue, 20 Jan 2026 19:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BT94GSZn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com
 [74.125.82.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9EEB10E12D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 19:55:03 +0000 (UTC)
Received: by mail-dy1-f170.google.com with SMTP id
 5a478bee46e88-2b6c6f89f23so7347064eec.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 11:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768938903; x=1769543703; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GQSNIybqd3//ZKhTtvTbCXW0y0uZ8xcJxwgof6wQOVw=;
 b=BT94GSZnYa1NpZ1y+ZZLmdlH9LLJZmcW1WXXnt+Q7sTa5I7mRkO29zpOXU6zBmjc9i
 YAzaV9+O8Rzc6Pg9plI8SPV3uNtIi9wqRuM20nxfk+dYCNwyDN5FL81MgZ78XSVlt0le
 Qqla0tufiiUY5B5nQfLe1DfxVQnUaWYGdixNgJz8u+7IwIP6LcO1scD0d+iKPra70hSX
 Ri2X9kezQYaQevRMYN9owMB8j75P/amPXvnAICVznp44Fob+g0j+lyNKiUas0zxT8XfF
 E+dhD1V8Jp7Juoc3hbPjm0O0fkBgS+L1fJ7O4I/vOWrmMgNXIVAWjsHTsV035B0lU+9r
 wwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768938903; x=1769543703;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GQSNIybqd3//ZKhTtvTbCXW0y0uZ8xcJxwgof6wQOVw=;
 b=EwvE0Y3ZR/LRrGLFM1qdH+e0Yxa7PVjmMIGkbhcZTOiKhXljinQxImjYxTKjOmyeEK
 SEKuQw7A1VygNR6s0VDZ5op6SZE2tV68VB+S2ACR5uW+Kgb3wC6++XoRB+pSLNrshipF
 A3NRGMmDfF53/lbHg+hk2Jiy9S2Xi7gqr6oui15vn1i62Jmlbmrk1rVdgpTzsjbB4YBw
 VoicUI9TDLMQLqhAFAxYI2v9R/8lrI4EmeivNYlNcDAM8tljP1gwCNSGV7FYMBi9UyGB
 eFjPq1Gd42q6OIDuZZnkJ5yIkDp8axi/N1f0OUgZIH6SKJF7/Zitq+Xc6ZWijLGgNCpR
 rjOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3Xx9F2FoM77J5WvUbkFgMq4Mv5sc/uJyodPp2wZG+QEl/YST5MMmJHFx6ixDfxZIcMoWpZXoQMjo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkMbJ77S26zo8xPbpd8yyAIoSVKzqMwdkA6flEClnI8yeU9rjp
 cYmhzrJ6pnobNZsusuFz3a9DurGk50rqMvo17VS5xWBZUTbKrQMPDZ2+
X-Gm-Gg: AZuq6aKV8pp7bE9mpQhPfciqDGUBZbKlpPODupdAWp+V4UWPcD9VsJ8D/VS4o2j3WEk
 /n8Oqa0CR8pUjRqDXFht84/VIPvnlXCUoKmQx1cCqQMDfs0Ci0Andcw7QkRGBB9hUjuBQ4iruKR
 +7pj4ky7ODTvWpx8+neZkEPSM4c70GnvsF0p3ZbqcLdkSp3Fyj1G53JFCex17oQr99ucv9YNXUy
 xWeo2L+Tw1veETjTn99uV/nh1VRh/psW0ts0dIG3SBFaTK87qJjKFBaWRGBJAiK7La2VEYmtMd+
 m7kbU77EdaYd2/4uwfWC9Cmu218BQ2o/KyFB0h/8SfxO4s7QuJ0Sow7fvcRIghZLPOiFtoTshCp
 fVogk+dC95G8Aqsj0InNIauUZiUAbscduJC17nWk8oytg/4zctdnTVk9Z/gfxpagUW02sXlQTvf
 exnmhUsBkfrYh0/kd1xqXi4/uxf7Mwc1P0qupGs4Cq20IH30VKVko/
X-Received: by 2002:a05:693c:6001:b0:2b6:c617:f7a0 with SMTP id
 5a478bee46e88-2b6c617f916mr8511359eec.6.1768938902933; 
 Tue, 20 Jan 2026 11:55:02 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:d631:e554:f0bd:4106])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b6b34c0eefsm18611112eec.4.2026.01.20.11.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 11:55:02 -0800 (PST)
Date: Tue, 20 Jan 2026 11:54:59 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, 
 Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 simona@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org, 
 maarten.lankhorst@linux.intel.com, jesszhan0024@gmail.com,
 neil.armstrong@linaro.org, 
 jagan@edgeble.ai, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
 aweinzerl13@yahoo.com, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 5/6] dt-bindings: input: touchscreen: goodix: Add "panel"
 property
Message-ID: <4dkhkwtbxmvns335xahyrwijvy5qjyifieuo27eluiehkjzman@v52ihb3o6o3s>
References: <20260113195721.151205-1-macroalpha82@gmail.com>
 <20260113195721.151205-6-macroalpha82@gmail.com>
 <7863194.oDFzTOozpa@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7863194.oDFzTOozpa@diego>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:macroalpha82@gmail.com,m:devicetree@vger.kernel.org,m:simona@ffwll.ch,m:airlied@gmail.com,m:tzimmermann@suse.de,m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:jesszhan0024@gmail.com,m:neil.armstrong@linaro.org,m:jagan@edgeble.ai,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:aweinzerl13@yahoo.com,m:macromorgan@hotmail.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,gmail.com,lists.freedesktop.org,vger.kernel.org,ffwll.ch,suse.de,kernel.org,linux.intel.com,linaro.org,edgeble.ai,yahoo.com,hotmail.com];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: B7DD44AD8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Jan 16, 2026 at 10:49:25AM +0100, Heiko Stübner wrote:
> Hi Chris,
> 
> Am Dienstag, 13. Januar 2026, 20:57:20 Mitteleuropäische Normalzeit schrieb Chris Morgan:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add a "panel" property to define a relationship between a touchscreen
> > and an associated panel when more than one of each exist in a device.
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 2 ++
> 
> This patch is part of a diverse series right now (drm-panel, input, dts)
> and therefore possibly could be overlooked by Dmitry, as the patch should
> likely go through the input subsystem (or would at least need an Ack from
> Dmitry, for me to take it along) .
> 
> Best way would probably be to pick Rob's Ack and resend it separately
> (pointing to this series as user).

You can definitely take it through another tree.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
