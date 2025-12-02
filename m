Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347EBC9B49C
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 12:19:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184B910E629;
	Tue,  2 Dec 2025 11:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bi/POMSi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533C510E638
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 11:19:09 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b75c7cb722aso774219666b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 03:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764674348; x=1765279148; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AFKm5TgCbXMywR9ztCslk4pzbDCGqU8JaRErdSAZu5w=;
 b=bi/POMSixBHaLFFp6QI644ym8Ysp4cu2aamve9RBRVc2NJKA7gccC/NOvEi4XSCD2Z
 mU82rXTMhtHJiACebsiIOBwwQnv790xmKQuYLTsCb4e9kDRgPsKds2Zp4jaDgAaeDZns
 PzAKMJVoaP+twhqhSJtBBtTl4nc1TyDb7LwvfTsHup/8/IYRzrODy3/yX1sXM7L1Mb2h
 dxAyVCcHphC+BzUfQLl9HrmWwhcSVS3kOl4n6Zpx0sV57Anlu05Cz4emz1ekdnu2jGtL
 5ywfgOc8P8j+vrzIsAoiqxIg1dkkeQghpuwbnzS4GQMMrhNivDK4J8pXx36kp9hOPDW7
 HvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764674348; x=1765279148;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AFKm5TgCbXMywR9ztCslk4pzbDCGqU8JaRErdSAZu5w=;
 b=hvRKgM//5BC4nCmWJbdY9uEb5CFNaQVJ0NvX/G9s+ldRdYKxYZb033gl6NaH2TS2Jf
 aHEWSYw/3i9EkLeYXuMNgRagVkfGDP2Mb7mXLPWUsTiwlGsn+/bEUveh4OPODYQZulBh
 NR8ICbUaZxDfcIBuvX1AiBG3NnkDHygEY9/fbh4Ti8VgpnksQCqCx+F8gTr1QIuj4Tq5
 QzNZWdbssJrlIQ1Tw9I5if1tq2sVDGkR0Hz2epN6E0PH6RKmmEkxz9i1QKoNvKYrWO98
 8GNBWQxTrsCJBSmblP4ld4MiUKeTlUYyfGkBmhhmcGnLnz5K7Tlmofg9q+8OyYrEcnPJ
 +chA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfIbTe3stVubFZdLv01p0nBaZtUei85N84LvGW3P5WRWsTFre+lK86Q0NFCsfAcXg613OY85BWIrU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0PD7wWpHh273US62P8S08e5JHhh65L5SHO5Tl+JFymcQfaZds
 gqtvmF09g75CkEohjMFRoKrasjDIKNE58u0cqiWq5AhZpYuDuTha/q66
X-Gm-Gg: ASbGncvNo4x7/72tYaSOCQRIMsdG1c/QyRqChdrx40a29bPw76Nr6FleN5gpZPEkDv0
 QWeMB2Rox7McIq+PF23aUIXFwTBz54eYX0D6JbYjcPErqCHAt5qIatD3Uz5bJ6NmKio6poBoTaR
 FOmr7PdI/yqGmnrdRlwaUYMihuy+g6vVm/vOdCmMKv040ZSu1tsHcpBRrfwLdieTYXRatsBd8dc
 7IMWJHSfRFiXGEb8jFZuSxYBlX+lzZhbNet20S9qwNQzvyp9oKJogVAjOI62RTVrswqSlNjIrpF
 6gglXuKses2edie91l5E9Me4EsMa/X619pGS7ok8RNvMydpG2bHLwNc1dA6FWCh/152JL69ihkl
 3x5cQ1I2TQNiMplqczZtHq197+lfvSsSPAiqU8PD/Q7d+DBRoFzw1T8JFXHWxz5fkIAnO3NOxot
 c8Eyy4PSsXKiQBc5ygmGjxt3lH0BsmuWKanXhwsv3+eK67RQLLNw==
X-Google-Smtp-Source: AGHT+IHY9Fm4775G9TVCUUeZO3LX6VYmaVn80vEWW1L95jQOyW7g8hXV8wnuSO7FTN6GjpPobn6rDw==
X-Received: by 2002:a17:907:9289:b0:b73:5a8b:c9af with SMTP id
 a640c23a62f3a-b767184bcafmr4940716066b.42.1764674347634; 
 Tue, 02 Dec 2025 03:19:07 -0800 (PST)
Received: from [10.251.131.228] (93-44-9-97.ip94.fastwebnet.it. [93.44.9.97])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f59a695esm1464431066b.33.2025.12.02.03.19.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Dec 2025 03:19:07 -0800 (PST)
Message-ID: <cd607656-90d3-4821-98ea-4dad48288fc9@gmail.com>
Date: Tue, 2 Dec 2025 12:19:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: ignore PLL_UNLOCK errors
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, Francesco Dolcini <francesco@dolcini.it>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Philippe Schenker <philippe.schenker@impulsing.ch>,
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, =?UTF-8?Q?Herv=C3=A9_Codina?=
 <herve.codina@bootlin.com>
References: <20251127-drm-ti-sn65dsi83-ignore-pll-unlock-v1-1-8a03fdf562e9@bootlin.com>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <20251127-drm-ti-sn65dsi83-ignore-pll-unlock-v1-1-8a03fdf562e9@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 27/11/2025 09:42, Luca Ceresoli wrote:
> On hardware based on Toradex Verdin AM62 the recovery mechanism added by
> commit ad5c6ecef27e ("drm: bridge: ti-sn65dsi83: Add error recovery
> mechanism") has been reported [0] to make the display turn on and off and
> and the kernel logging "Unexpected link status 0x01".
> 
> According to the report, the error recovery mechanism is triggered by the
> PLL_UNLOCK error going active. Analysis suggested the board is unable to
> provide the correct DSI clock neede by the SN65DSI84, to which the TI
> SN65DSI84 reacts by raising the PLL_UNLOCK, while the display still works
> apparently without issues.
> 
> On other hardware, where all the clocks are within the components
> specifications, the PLL_UNLOCK bit does not trigger while the display is in
> normal use. It can trigger for e.g. electromagnetic interference, which is
> a transient event and exactly the reason why the error recovery mechanism
> has been implemented.
> 
> Idelly the PLL_UNLOCK bit could be ignored when working out of
> specification, but this requires to detect in software whether it triggers
> because the device is working out of specification but visually correctly
> for the user or for good reasons (e.g. EMI, or even because working out of
> specifications but compromising the visual output).
> 
> The ongoing analysis as of this writing [1][2] has not yet found a way for
> the driver to discriminate among the two cases. So as a temporary measure
> mask the PLL_UNLOCK error bit unconditionally.
> 
> [0] https://lore.kernel.org/r/bhkn6hley4xrol5o3ytn343h4unkwsr26p6s6ltcwexnrsjsdx@mgkdf6ztow42
> [1] https://lore.kernel.org/all/b71e941c-fc8a-4ac1-9407-0fe7df73b412@gmail.com/
> [2] https://lore.kernel.org/all/20251125103900.31750-1-francesco@dolcini.it/
> 
> Closes: https://lore.kernel.org/r/bhkn6hley4xrol5o3ytn343h4unkwsr26p6s6ltcwexnrsjsdx@mgkdf6ztow42
> Cc: stable@vger.kernel.org # 6.15+
> Co-developed-by: Hervé Codina <herve.codina@bootlin.com>
> Signed-off-by: Hervé Codina <herve.codina@bootlin.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> Francesco, Emanuele, João: can you please apply this patch and report
> whether the display on the affected boards gets back to working as before?
> 
> Cc: João Paulo Gonçalves <jpaulo.silvagoncalves@gmail.com>
> Cc: Francesco Dolcini <francesco@dolcini.it>
> Cc: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 033c44326552..fffb47b62f43 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -429,7 +429,14 @@ static void sn65dsi83_handle_errors(struct sn65dsi83 *ctx)
>  	 */
>  
>  	ret = regmap_read(ctx->regmap, REG_IRQ_STAT, &irq_stat);
> -	if (ret || irq_stat) {
> +
> +	/*
> +	 * Some hardware (Toradex Verdin AM62) is known to report the
> +	 * PLL_UNLOCK error interrupt while working without visible
> +	 * problems. In lack of a reliable way to discriminate such cases
> +	 * from user-visible PLL_UNLOCK cases, ignore that bit entirely.
> +	 */
> +	if (ret || irq_stat & ~REG_IRQ_STAT_CHA_PLL_UNLOCK) {
>  		/*
>  		 * IRQ acknowledged is not always possible (the bridge can be in
>  		 * a state where it doesn't answer anymore). To prevent an
> @@ -654,7 +661,7 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
>  	if (ctx->irq) {
>  		/* Enable irq to detect errors */
>  		regmap_write(ctx->regmap, REG_IRQ_GLOBAL, REG_IRQ_GLOBAL_IRQ_EN);
> -		regmap_write(ctx->regmap, REG_IRQ_EN, 0xff);
> +		regmap_write(ctx->regmap, REG_IRQ_EN, 0xff & ~REG_IRQ_EN_CHA_PLL_UNLOCK_EN);
>  	} else {
>  		/* Use the polling task */
>  		sn65dsi83_monitor_start(ctx);
> 
> ---
> base-commit: c884ee70b15a8d63184d7c1e02eba99676a6fcf7
> change-id: 20251126-drm-ti-sn65dsi83-ignore-pll-unlock-4a28aa29eb5c
> 
> Best regards,

Well,
I would suggest a couple of tags, thanks.
Emanuele

Fixes: ad5c6ecef27e ("drm: bridge: ti-sn65dsi83: Add error recovery mechanism")
Reported-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
