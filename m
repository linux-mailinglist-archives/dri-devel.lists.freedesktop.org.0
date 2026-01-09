Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBEAD0B075
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 16:48:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6364E10E8F0;
	Fri,  9 Jan 2026 15:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="QLxjpT8D";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="cTxe+DFS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108B910E8F0
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 15:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=Message-ID:Subject:To:From:Date; t=1767973552; bh=kgvZjKseW7XXTgnrU98FYJ4
 WNKjj7962wN9LQSN4pQU=; b=QLxjpT8Dbhd4TzBlDG75uESVugiOBVAoKrIZWZl3lJ9Ev8v+WC
 dK001qV0uMX8X09R2aRjv2rwdeHqjexEyiwRRd0ncngJuhnrsUy52uklW1g5K3PgvpmcJYVmmQ+
 X55Vzr8fxvAdyJYOYQozC3M1JwhIOxdKcZMx7fLeJr/xYiLZkmv56NqLml4HJUWrwSGcswXqmol
 8Ny8YHrDyZPa+wpG4KU1Auc+BT7QBgFn+nxM1Ol6g+TgwUXXU+XutF073c0LtqSbEc6EHdHMuXr
 IFpUi26VOcvux943bUcRj//X7qUdPGI4caDimixKdJOlVrOsJQ+GeZdFRprVn6ZgFkw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=Message-ID:Subject:To:From:Date; t=1767973552; bh=kgvZjKseW7XXTgnrU98FYJ4
 WNKjj7962wN9LQSN4pQU=; b=cTxe+DFSSiJPDx479bcskm4p/mkHkx+Mqh+oGQiFuhdZACZCLW
 1RBJWE2fhFC791X49V2CyvO4ySJZpew74jBg==;
MIME-Version: 1.0
Date: Fri, 09 Jan 2026 16:45:52 +0100
From: barnabas.czeman@mainlining.org
To: Daniel Thompson <danielt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Lee Jones
 <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Pavel Machek
 <pavel@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller
 <deller@gmx.de>, Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio
 <konradybcio@kernel.org>, Eugene Lepshy <fekz115@gmail.com>, Gianluca Boiano
 <morf3089@gmail.com>, Alejandro Tafalla <atafalla@dnyon.com>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 2/7] backlight: qcom-wled: Support ovp values for
 PMI8994
In-Reply-To: <00d0c357d31463272d786bcc9abfe295@mainlining.org>
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-2-8687f23147d7@mainlining.org>
 <aV-UyhP7wllSBpYj@aspen.lan>
 <67acbe8ff2496e18a99165d794a7bae8@mainlining.org>
 <0fe51f7f-9b77-4bff-ab1c-21c44a863a7a@oss.qualcomm.com>
 <aWEDr3O9T7bASnj9@aspen.lan>
 <00d0c357d31463272d786bcc9abfe295@mainlining.org>
Message-ID: <886d98f40c8f99c7d6d236ddbec487be@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
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

On 2026-01-09 16:42, barnabas.czeman@mainlining.org wrote:
> On 2026-01-09 14:33, Daniel Thompson wrote:
>> On Fri, Jan 09, 2026 at 12:09:11PM +0100, Konrad Dybcio wrote:
>>> On 1/9/26 7:36 AM, barnabas.czeman@mainlining.org wrote:
>>> > On 2026-01-08 12:28, Daniel Thompson wrote:
>>> >> On Thu, Jan 08, 2026 at 04:43:20AM +0100, Barnabás Czémán wrote:
>>> >>> WLED4 found in PMI8994 supports different ovp values.
>>> >>>
>>> >>> Fixes: 6fc632d3e3e0 ("video: backlight: qcom-wled: Add PMI8994 compatible")
>>> >>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> >>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> >>> ---
>>> >>>  drivers/video/backlight/qcom-wled.c | 41 +++++++++++++++++++++++++++++++++++--
>>> >>>  1 file changed, 39 insertions(+), 2 deletions(-)
>>> >>>
>>> >>> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
>>> >>> index a63bb42c8f8b..5decbd39b789 100644
>>> >>> --- a/drivers/video/backlight/qcom-wled.c
>>> >>> +++ b/drivers/video/backlight/qcom-wled.c
>>> >>> @@ -1244,6 +1244,15 @@ static const struct wled_var_cfg wled4_ovp_cfg = {
>>> >>>      .size = ARRAY_SIZE(wled4_ovp_values),
>>> >>>  };
>>> >>>
>>> >>> +static const u32 pmi8994_wled_ovp_values[] = {
>>> >>> +    31000, 29500, 19400, 17800,
>>> >>> +};
>>> >>> +
>>> >>> +static const struct wled_var_cfg pmi8994_wled_ovp_cfg = {
>>> >>> +    .values = pmi8994_wled_ovp_values,
>>> >>> +    .size = ARRAY_SIZE(pmi8994_wled_ovp_values),
>>> >>> +};
>>> >>> +
>>> >>
>>> >> Do these *have* to be named after one of the two PMICs that implement
>>> >> this OVP range.
>>> >>
>>> >> Would something like wled4_alternative_ovp_values[] (and the same
>>> >> throughout the patch) be more descriptive?
>>> > I don't know. I don't like the PMIC naming either but at least it
>>> > descriptive about wich PMIC is needing these values.
>> 
>> It's the descriptive but wrong element I dislike (pmi8994_wled_ovp_cfg
>> is used by pmi8550).
> No, pmi8950 is using pmi8994_wled_opts struct what is using 
> pmi8994_wled_ovp_cfg.
Maybe would be better move opts to compatible data.
>> 
>> I know these things crop up for "historical reasons" when is appears 
>> in
>> the same patchset I have to question the naming.
>> 
>> 
>>> > I think PMIC naming would be fine if compatibles what representing the
>>> > same configurations would be deprecated and used as a fallback compatbile
>>> > style.
>>> > I mean we could kept the first added compatible for a configuration.
>>> > Maybe they should be named diferently i don't know if WLEDs have subversion.
>>> 
>>> Every PMIC peripheral is versioned.
>>> 
>>> WLED has separate versioning for the digital and analog parts:
>>> 
>>> PMIC		ANA	DIG
>>> ---------------------------
>>> PMI8937		2.0	1.0 (also needs the quirk)
>>> PMI8950		2.0	1.0
>>> PMI8994		2.0	1.0
>>> PMI8996		2.1	1.0
>>> PMI8998		3.1	3.0
>>> PM660L		4.1	4.0
>>> 
>>> I don't know for sure if "PMIC4 with WLED ANA/DIG 3.x" a good
>>> discriminant though..
>> 
>> Peronally I'd prefer that to making them all use pmi8994 structures.
>> It's a much better link back to the docs (at least for those with the
>> power to read them ;-) ).
>> 
>> 
>> Daniel.
