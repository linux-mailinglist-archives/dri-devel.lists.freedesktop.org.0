Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD70667710F
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 18:25:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D4E10E18F;
	Sun, 22 Jan 2023 17:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-17.mta0.migadu.com (out-17.mta0.migadu.com [91.218.175.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3382310E18F
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 17:25:42 +0000 (UTC)
Message-ID: <cdf32cb0-4529-6bbd-fdda-ae641d141ee5@ansari.sh>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ansari.sh; s=key1;
 t=1674408340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zNlCaEENnr2E6T9VSpQMskYXTPIwdkrlcdCRQqfBtOM=;
 b=VOT0GTIZywb4evsNGliJqALCozr69B1bLNkLQ2lQ9PQ4fHmFq6vNx482gV3j6w7xxs/oyv
 gWZRY2YBa59rob66gqpjXikqbmNlcf1NKvdNsiZokZxnDhlYNJA3zkK/piNkSfit9o51yD
 NCncQyfn3OYk4fbM9Pc9XGf/ZKJfY8U=
Date: Sun, 22 Jan 2023 17:25:38 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] dt-bindings: display: simple-framebuffer: Document
 physical width and height properties
To: Rob Herring <robh+dt@kernel.org>
References: <20230121153544.467126-1-rayyan@ansari.sh>
 <20230121153544.467126-3-rayyan@ansari.sh>
 <CAL_JsqL+G=Cxkc2j_NowznpqNAnixrU+-6SdccFbpMaP6OYSqQ@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Rayyan Ansari <rayyan@ansari.sh>
In-Reply-To: <CAL_JsqL+G=Cxkc2j_NowznpqNAnixrU+-6SdccFbpMaP6OYSqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, janne@jannau.net,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 ~postmarketos/upstreaming@lists.sr.ht, asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/01/2023 15:36, Rob Herring wrote:
> On Sat, Jan 21, 2023 at 9:36 AM Rayyan Ansari <rayyan@ansari.sh> wrote:
>>
> 
> Why do you need this change?
> 
> The 'simple-framebuffer' contains data on how the bootloader
> configured the display. The bootloader doesn't configure the display
> size, so this information doesn't belong here. The information should
> already be in the panel node, so also no point in duplicating it here.
> 
>> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
>> ---
>>   .../devicetree/bindings/display/simple-framebuffer.yaml   | 8 ++++++++
>>   1 file changed, 8 insertions(+)

Hi Rob,

There is the usecase that Hans has mentioned, but I have also mentioned 
another usecase previously.

Adding the width-mm and height-mm properties allows user interfaces such 
as Phosh (https://puri.sm/posts/phosh-overview/) to scale correctly to 
the screen. In my case, a panel node is not available and the 
aforementioned interface is in fact running on the SimpleDRM driver 
(which binds to the simple-framebuffer device).

Here is the device I have tested this patch on, the Lumia 735 phone: 
https://wiki.postmarketos.org/images/c/c3/Lumia_735_Phosh.png
Without this patch, this would appear quite small on the screen.

See https://patchwork.freedesktop.org/patch/519107/?series=113053&rev=1 
for some background info about this patch.

Regards,
-- 
Rayyan Ansari
https://ansari.sh

