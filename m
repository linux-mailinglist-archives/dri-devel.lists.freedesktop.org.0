Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCazNP1adWm5EQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 00:51:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F717F4B6
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 00:51:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0603C10E26D;
	Sat, 24 Jan 2026 23:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="XNoLVWWp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A0010E26D
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 23:51:20 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b884ad1026cso498813466b.2
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 15:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1769298678; x=1769903478;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JvEA1f9ONRPJvobNgmX24gX18ZQa14zvBpNonY0IgwI=;
 b=XNoLVWWpZvbpAbBHEoq4meDT0WdG0PuIajtHEZ/prwRwOkbvgJndP9Blt1nkQCzeF8
 tAt2TYgGkDkIP928sojh5hnJQiywK4SlNFWgUmiz3b2vHfn9bER6CeWrqqvPYsqYHNsN
 4FV0xwavQMuK89YQY0uOkPaaB8DfichEDhsRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769298678; x=1769903478;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JvEA1f9ONRPJvobNgmX24gX18ZQa14zvBpNonY0IgwI=;
 b=PDNQEx4FrZqM0bjCis0CyIifm4zX2xv7GNXD8Xe8GDbgdgVTI1LNakrORw1J/LtEPF
 YB+/5B06tMew3vuFpejBXhO53EYJNU/IhlA/CF0wHgmcE9Jaca6sM4H+YoSf25E7RRpU
 eaDrvBuakWBZFqW1+KpRHlQizdsx8djUVo8fMZYSBcRzq3avzUE6reEd9ze7/2XNmsOu
 rXZmYlh4jlnb12ImQ16+OpQFRHDjoM8DRFa6BFSwzhWrPJ0j0aJiQYO//A5EV466rIXX
 ofWKmfoW0KKancdixUP1gvOOUgJgLzPaqbriuokZF/I6S+bFDVHwKHim2Vxu1avj44d+
 Y6bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyEQXn+5Aq5zWf6Aft9aGjPjLlBsIcKgs8MOQz2spgYEpUSH6IM9XHmDU+JgNsSWOI9yjZgSSSSUE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwPDH7xr2UI91M8W4d46EdVgckW6uR+NC1D4FNsu+wLEXtL/An
 1oa/Ci10g1fpXQ2bfAgYa2S0XhwNGgfl7IfsTiArXB4Mi1/iKaft3QM1jkSJu8KKUk0pFVk/+kI
 i0WOOmA==
X-Gm-Gg: AZuq6aJIjWnZ7lCZkz9TV52+yN1nKWewQoNnSfXrZN/lFXEySqkiqjUibZmMK2Pbtbs
 4o8Wn3uyQfreSnaTznps1uTATvjIuWOoCcJ4Z/UUyij9ycGXK+6vBAEjGFxV39qh0GaIAnkiCDC
 oJONkTQNIG01jWeamrtdehwMG2USvbuXcmt4VN7hKqUrNHAFBLel7YMOIB0i/H/RFbk+owQ7hOt
 a6DYZDI5qdfcSiHPjeXH6fcO6U1KjNsurR5w7eVz2hoK1xOMdf++IoDTnXdtEERkVagfYGnNFD1
 95cr+RQQGuc42nOmdVqcWWlAm4XHn1bf0dhL1UqlR29TJfbUzduHU9s41pFQOLh6HT2gAg8FCCB
 SNM16D7EAWkrEOc3bgIWMctoIyg8K14JOKSgFb0YxUhiFoWWkIEu9ArZoyd+5dcPmPrwb9l1afx
 Mm+7Cpkdy1SEKDTevfOz+ibeTah99I0qj2TQ0zB7K0n4Im+X65Og==
X-Received: by 2002:a17:907:60cd:b0:b87:7cb9:c3dc with SMTP id
 a640c23a62f3a-b8d20e2ce54mr12363666b.32.1769298677633; 
 Sat, 24 Jan 2026 15:51:17 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b7bcda3sm353406366b.66.2026.01.24.15.51.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jan 2026 15:51:16 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so48562675e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 15:51:16 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUaZ5ZeAEJGTTNx/tisTKfdV/o6YJvgbn+MmXuep13q/wgyqTPRcpMdME6PcenIzzM9K3oY32U9Xiw=@lists.freedesktop.org
X-Received: by 2002:a5d:5f93:0:b0:427:23a:c339 with SMTP id
 ffacd0b85a97d-435ca06bd9amr202107f8f.14.1769298676341; Sat, 24 Jan 2026
 15:51:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1769191673.git.robin.murphy@arm.com>
 <c7f6f75d55a4801eab63a0dc81d14ae27866aca9.1769191673.git.robin.murphy@arm.com>
In-Reply-To: <c7f6f75d55a4801eab63a0dc81d14ae27866aca9.1769191673.git.robin.murphy@arm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 24 Jan 2026 15:51:04 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W+hbNiDmSmzPqGQsmH2WD_3Nm1vb1ZsvE2CORdVdR=DA@mail.gmail.com>
X-Gm-Features: AZwV_QgOnwu8ZDNoMgAedT6RUZDiRd84e1b3_o2xjJbMyBz7YJt7WbVufA8oGT4
Message-ID: <CAD=FV=W+hbNiDmSmzPqGQsmH2WD_3Nm1vb1ZsvE2CORdVdR=DA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: Move FriendlyElec
 HD702E to eDP
To: Robin Murphy <robin.murphy@arm.com>
Cc: heiko@sntech.de, neil.armstrong@linaro.org, thierry.reding@gmail.com, 
 sam@ravnborg.org, jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[sntech.de,linaro.org,gmail.com,ravnborg.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.murphy@arm.com,m:heiko@sntech.de,m:neil.armstrong@linaro.org,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:jesszhan0024@gmail.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,chromium.org:email,chromium.org:dkim,arm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 42F717F4B6
X-Rspamd-Action: no action

Hi,

On Fri, Jan 23, 2026 at 11:22=E2=80=AFAM Robin Murphy <robin.murphy@arm.com=
> wrote:
>
> The "E" alludes to the fact that FriendlyElec's HD702E is actually an
> eDP panel - move its compatible to the appropriate binding doc.
>
> Cc: <devicetree@vger.kernel.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  .../devicetree/bindings/display/panel/panel-edp-legacy.yaml     | 2 ++
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
