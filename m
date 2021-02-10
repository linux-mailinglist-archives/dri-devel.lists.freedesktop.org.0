Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD17E316B2B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 17:27:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9676ECB6;
	Wed, 10 Feb 2021 16:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by gabe.freedesktop.org (Postfix) with ESMTP id 804876E0BC
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 16:22:42 +0000 (UTC)
Received: from [192.168.1.184] ([79.10.42.7])
 by Aruba Outgoing Smtp  with ESMTPA
 id 9sGEl0x2gl6ts9sGElboW6; Wed, 10 Feb 2021 17:22:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1612974160; bh=+zT/ViXdsyEqsM0XxHGfPKmXnHFZ85zQgkpYMgBh4Oo=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=KZRe+R9tdGmlGRClWHts7qbM0AWGy6q8nqNyi04jXGTU8LIdASdhyQ7BH+gCswyha
 kzN4Ke8kQ2Cy6eyOZI5MTXLqzpf4XW49Cic0UNmD5KyChQzHoSgOCk1krEtxJ9K4/c
 WBNiWfoTdcpwDI/kSTmjTVSDLv7s0UdXpp5iDzV/DPmigVnHDOzMoiQaORVFFTgpOz
 UUnyr2bf3j/0N0BXfwZdCRU1+On7qJguMG53FMBaGgZZNBN5bCZBSQF6/93Nlm0O3D
 7q1CsUjb/FAiDXdCOCsZ7aU5By1owYruUoJemu7wLTcT5SUbG/H1MN4wzwh5tJxOhB
 KvChlSqrzX+Yg==
Subject: [PATCH] pinctrl/sunxi: adding input-debounce-ns property
To: Maxime Ripard <maxime@cerno.tech>, wens@csie.org,
 Jernej Skrabec <jernej.skrabec@siol.net>
References: <d244aa6b-00b7-d768-83cb-e5a228b7ee08@trexom.it>
 <20210114081732.9386-1-giulio.benetti@benettiengineering.com>
 <20210114114219.faulkwww3dhdqwmc@gilmour>
From: Marjan Pascolo <marjan.pascolo@trexom.it>
Message-ID: <c3bc06e3-4193-dc0b-b2b3-d54636481e28@trexom.it>
Date: Wed, 10 Feb 2021 17:22:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210114114219.faulkwww3dhdqwmc@gilmour>
Content-Language: it
X-CMAE-Envelope: MS4wfH6oTAFv1UAc1UHjeT7fAUES0ERDDBsJcmnoqFOgFC4ptHAeVTLQat5FeTa3CPXA5acPN5BTNTXELXNkmdiwK4JcdZovN+luGUaxplPcy95PLoftAoUr
 M5mpLLDSjADTP7z+8Ou0rzlTA6ofdIK6AiHqwlfsmOEPQTGD1feR+1zp6kUEs0dQHr2AL3VLgpUIt+qQ3qqNqRGPF41/LkEK0HuBtmvn4CvQ875aG7XWb59t
 uneMi4ET4xtInHSFyOf7NCULykYkLkFIP+EqY+ygFeWFqUada0m8ywN0eWwtru5r261rWaqYkbSJX4sxRnxsXxD0yJb/FalRjeGQ8RHOhJlYTdMjMcaEPKtK
 R/CH/zYX3rdF0oGLCcE1ErnL8nsZBA==
X-Mailman-Approved-At: Wed, 10 Feb 2021 16:27:52 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Allwinner SoC interrupt debounce can be controlled by two oscillator
(32KHz and 24MHz) and a prescale divider.
Oscillator and prescale divider are set through
device tree property "input-debounce" which have 1uS accuracy.
For acheive nS precision a new device tree poperty is made
named "input-debounce-ns".
"input-debounce-ns" is checked only if "input-debounce"
property is not defined.


Suggested-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Marjan Pascolo <marjan.pascolo@trexom.it>
---
---
 =A0.../pinctrl/allwinner,sun4i-a10-pinctrl.yaml=A0 |=A0 9 +++++++
 =A0drivers/pinctrl/sunxi/pinctrl-sunxi.c=A0=A0=A0=A0=A0=A0=A0=A0 | 25 ++++=
++++++++++++---
 =A02 files changed, 30 insertions(+), 4 deletions(-)

diff --git =

a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yam=
l =

b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 5240487dfe50..346776de3a44 100644
--- =

a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ =

b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -93,6 +93,15 @@ properties:
 =A0=A0=A0=A0 minItems: 1
 =A0=A0=A0=A0 maxItems: 5

+=A0 input-debounce-ns:
+=A0=A0=A0 description:
+=A0=A0=A0=A0=A0 Debouncing periods in nanoseconds, one period per interrupt
+=A0=A0=A0=A0=A0 bank found in the controller.
+=A0=A0=A0=A0=A0 Only checked if input-debounce is not present
+=A0=A0=A0 $ref: /schemas/types.yaml#/definitions/uint32-array
+=A0=A0=A0 minItems: 1
+=A0=A0=A0 maxItems: 5
+
 =A0patternProperties:
 =A0=A0 # It's pretty scary, but the basic idea is that:
 =A0=A0 #=A0=A0 - One node name can start with either s- or r- for PRCM nod=
es,
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c =

b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index dc8d39ae045b..869b6d5743ba 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1335,14 +1335,31 @@ static int sunxi_pinctrl_setup_debounce(struct =

sunxi_pinctrl *pctl,
 =A0=A0=A0=A0 struct clk *hosc, *losc;
 =A0=A0=A0=A0 u8 div, src;
 =A0=A0=A0=A0 int i, ret;
+=A0=A0=A0 /* Keeping for loop below clean */
+=A0=A0=A0 const char* debounce_prop_name;
+=A0=A0=A0 unsigned long debounce_dividend;

 =A0=A0=A0=A0 /* Deal with old DTs that didn't have the oscillators */
 =A0=A0=A0=A0 if (of_clk_get_parent_count(node) !=3D 3)
 =A0=A0=A0=A0 =A0=A0=A0 return 0;

+=A0=A0=A0 /*
+=A0=A0=A0 =A0* Distinguish between simple input-debounce
+=A0=A0=A0 =A0* and new input-debounce-ns
+=A0=A0=A0 =A0*/
+
 =A0=A0=A0=A0 /* If we don't have any setup, bail out */
-=A0=A0=A0 if (!of_find_property(node, "input-debounce", NULL))
-=A0=A0=A0 =A0=A0=A0 return 0;
+=A0=A0=A0 if (!of_find_property(node, "input-debounce", NULL)) {
+=A0=A0=A0 =A0=A0=A0 if(!of_find_property(node, "input-debounce-ns", NULL))=
 {
+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 return 0;
+=A0=A0=A0 =A0=A0=A0 } else {
+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 debounce_prop_name=3D"input-debounce-ns";
+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 debounce_dividend=3DNSEC_PER_SEC;
+=A0=A0=A0 =A0=A0=A0 }
+=A0=A0=A0 } else {
+=A0=A0=A0 =A0=A0=A0 debounce_prop_name=3D"input-debounce";
+=A0=A0=A0 =A0=A0=A0 debounce_dividend=3DUSEC_PER_SEC;
+=A0=A0=A0 }

 =A0=A0=A0=A0 losc =3D devm_clk_get(pctl->dev, "losc");
 =A0=A0=A0=A0 if (IS_ERR(losc))
@@ -1356,7 +1373,7 @@ static int sunxi_pinctrl_setup_debounce(struct =

sunxi_pinctrl *pctl,
 =A0=A0=A0=A0 =A0=A0=A0 unsigned long debounce_freq;
 =A0=A0=A0=A0 =A0=A0=A0 u32 debounce;

-=A0=A0=A0 =A0=A0=A0 ret =3D of_property_read_u32_index(node, "input-deboun=
ce",
+=A0=A0=A0 =A0=A0=A0 ret =3D of_property_read_u32_index(node, debounce_prop=
_name,
 =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0i, &debo=
unce);
 =A0=A0=A0=A0 =A0=A0=A0 if (ret)
 =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 return ret;
@@ -1364,7 +1381,7 @@ static int sunxi_pinctrl_setup_debounce(struct =

sunxi_pinctrl *pctl,
 =A0=A0=A0=A0 =A0=A0=A0 if (!debounce)
 =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 continue;

-=A0=A0=A0 =A0=A0=A0 debounce_freq =3D DIV_ROUND_CLOSEST(USEC_PER_SEC, debo=
unce);
+=A0=A0=A0 =A0=A0=A0 debounce_freq =3D DIV_ROUND_CLOSEST(debounce_dividend,=
 debounce);
 =A0=A0=A0=A0 =A0=A0=A0 losc_div =3D sunxi_pinctrl_get_debounce_div(losc,
 =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =
=A0 debounce_freq,
 =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =
=A0 &losc_diff);
-- =

2.22.0.windows.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
