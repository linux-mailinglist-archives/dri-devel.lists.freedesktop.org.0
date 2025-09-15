Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 862E7B56D08
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 02:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8144510E029;
	Mon, 15 Sep 2025 00:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pKLF6LNB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7805910E029
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 00:01:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3F186601AC;
 Mon, 15 Sep 2025 00:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD3DC4CEF0;
 Mon, 15 Sep 2025 00:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757894483;
 bh=25c4vqp6oKm/TO4MjO51ZowS30kDKMGfPS6LktFlvdc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pKLF6LNBjBe9/5mqPSMyd3gJxRNQNfWcK9YXlbYztVOzLRmASl1132gNPGgOSZJLL
 ls0sUhHhIjdIZwVq8mMpt2AmAeh3mZUPulArNv4cYK7t2abZ4hsiZkO0W4x5dX96Ul
 tLYYeEyzaiuIhqcN5xS2K6QL+OvnNpmh3L4O5FvsJF5lBjRQ6IGIHSqSGLuiThcnt0
 xWjsSwCoEbU7aCaYR2N/g4WzxT+1yZSWFah+12id6VORVaYFjOPb/XwC6RuY9z0IBS
 YQohl4J84mgzycsZ/FuqZOo6/0+4GNxZ2vlRlsJLBMnFYuqzVDlfKNAmQNYNPSft2x
 0jWjia0mr55Ug==
Date: Sun, 14 Sep 2025 19:01:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 devicetree@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 linux-media@vger.kernel.org, Daniel Thompson <danielt@kernel.org>,
 linux-leds@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
 Hans de Goede <hansg@kernel.org>, Pavel Machek <pavel@kernel.org>,
 threeway@gmail.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: leds: add generic LED consumer
 documentation
Message-ID: <175789448207.2281753.18020125976595732486.robh@kernel.org>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
 <20250910-leds-v5-1-bb90a0f897d5@vinarskis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-leds-v5-1-bb90a0f897d5@vinarskis.com>
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


On Wed, 10 Sep 2025 14:01:08 +0200, Aleksandrs Vinarskis wrote:
> Introduce common generic led consumer binding, where consumer defines
> led(s) by phandle, as opposed to trigger-source binding where the
> trigger source is defined in led itself.
> 
> Add already used in some schemas 'leds' parameter which expects
> phandle-array. Additionally, introduce 'led-names' which could be used
> by consumers to map LED devices to their respective functions.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  .../devicetree/bindings/leds/leds-consumer.yaml    | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

