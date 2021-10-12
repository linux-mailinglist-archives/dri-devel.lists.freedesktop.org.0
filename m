Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0609142A06D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 10:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5704C6E7EC;
	Tue, 12 Oct 2021 08:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E726E7EC
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 08:56:47 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id r7so64663268wrc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 01:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M26QgNKHVwINnFDN5ZpyN6NPNBXWBB9Q2t3/HJe1M0k=;
 b=KX7DlKXLdINg0hkrXzVXLeuSbJ3oQpyZ3QSJV9vXGUSoRkDqQsEpRrsvDUXlpSxRvg
 Tga2wh68JYGLd8WYLVnn91Tj1P9BbwFI8YypqFAaKq1+yhG3tDeqH33ZNqG40W4m1+TW
 qXFdteUGOreIqR9hWWB3fhRjp3Fqd46Vq4XLSxth1BiCCGh9scg6emOrfmoPecPuUGsT
 MX3c+tF5u8hGkrA80BntDmXKPX3uflLDvkvpu50QMVKLUWS3P2JN4Ln+ycwh9X6s0st2
 fLTbSmf/YxBJ+E9HDdqrEqlI3A4DtbWKYxAsGRKM8y7jiN5bNMmmWaRZbZcHAOoQNVyn
 cpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=M26QgNKHVwINnFDN5ZpyN6NPNBXWBB9Q2t3/HJe1M0k=;
 b=4rQt2hxdxYvKWcp/epCoIwzEpPXrfKJeTs2JCv0RTWhsL1I5uuIX2F54IF7dgreLe2
 GTFCrsqjpW5I2Dax7aQ0AkTWJjvCvhuthW5p5zgzafSSa7tyWq5QWiO2HEEeR87fsHlH
 MIRwZfkLRqIECeJH6BnhYk+GTbTNtu+knsC4GtI1kjmAk9vzovMOjEEhx4CAJM7zS2+r
 g92kXSPBoGva9EjN+uqh1z84Y/P22SRv8ntDvUiF8+3pdo13seCKfPDMnqsf10X3866R
 Q72sagN1RCYK7sqhrY4xjZUJw/2DpWURZ5x99Rb2OrZDD9YAhHgn9zrq+T7Coqn7F2bE
 wVWA==
X-Gm-Message-State: AOAM530+1P5Ednn69zWP0d/X/vIHzRJZQ4TKj9/22RyPyPqsAD7/igRj
 AzoqvkFQxNA4SUTkIIaDtVHE9w==
X-Google-Smtp-Source: ABdhPJyBLbijYLOTA9vu2h7atyJw8y8MmMU/KKsZSa62Q9ItyGn52l9j8W64U2Lvl1BgBpRcmOUTyQ==
X-Received: by 2002:a1c:740e:: with SMTP id p14mr4143429wmc.109.1634029006194; 
 Tue, 12 Oct 2021 01:56:46 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:4e93:9fa7:4d66:4f5c?
 ([2001:861:44c0:66c0:4e93:9fa7:4d66:4f5c])
 by smtp.gmail.com with ESMTPSA id y8sm1778590wmi.43.2021.10.12.01.56.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 01:56:45 -0700 (PDT)
Subject: Re: [PATCH v5 4/8] drm/omap: omap_plane: subclass drm_plane_state
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com,
 Benoit Parrot <bparrot@ti.com>
References: <20210923070701.145377-1-narmstrong@baylibre.com>
 <20210923070701.145377-5-narmstrong@baylibre.com>
 <b9bb0e4b-26b8-72f0-937b-1a08145352d8@ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <9814d390-6bfd-5b95-4ea0-412e255ef840@baylibre.com>
Date: Tue, 12 Oct 2021 10:56:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b9bb0e4b-26b8-72f0-937b-1a08145352d8@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 12/10/2021 10:13, Tomi Valkeinen wrote:
> On 23/09/2021 10:06, Neil Armstrong wrote:
>> From: Benoit Parrot <bparrot@ti.com>
>>
>> In preparation to add omap plane state specific extensions we need to
>> subclass drm_plane_state and add the relevant helpers.
>>
>> The addition of specific extension will be done separately.
>>
>> Signed-off-by: Benoit Parrot <bparrot@ti.com>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>   drivers/gpu/drm/omapdrm/omap_plane.c | 38 +++++++++++++++++++++++++---
>>   1 file changed, 35 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
>> index 0df5381cc015..bda794b4c915 100644
>> --- a/drivers/gpu/drm/omapdrm/omap_plane.c
>> +++ b/drivers/gpu/drm/omapdrm/omap_plane.c
>> @@ -16,6 +16,13 @@
>>    * plane funcs
>>    */
>>   +#define to_omap_plane_state(x) container_of(x, struct omap_plane_state, base)
>> +
>> +struct omap_plane_state {
>> +    /* Must be first. */
>> +    struct drm_plane_state base;
>> +};
>> +
>>   #define to_omap_plane(x) container_of(x, struct omap_plane, base)
>>     struct omap_plane {
>> @@ -207,11 +214,17 @@ void omap_plane_install_properties(struct drm_plane *plane,
>>   static void omap_plane_reset(struct drm_plane *plane)
>>   {
>>       struct omap_plane *omap_plane = to_omap_plane(plane);
>> +    struct omap_plane_state *omap_state;
>>   -    drm_atomic_helper_plane_reset(plane);
>> -    if (!plane->state)
>> +    if (plane->state)
>> +        drm_atomic_helper_plane_destroy_state(plane, plane->state);
>> +
>> +    omap_state = kzalloc(sizeof(*omap_state), GFP_KERNEL);
>> +    if (!omap_state)
>>           return;
>>   +    __drm_atomic_helper_plane_reset(plane, &omap_state->base);
>> +
>>       /*
>>        * Set the zpos default depending on whether we are a primary or overlay
>>        * plane.
>> @@ -222,6 +235,25 @@ static void omap_plane_reset(struct drm_plane *plane)
>>       plane->state->color_range = DRM_COLOR_YCBCR_FULL_RANGE;
>>   }
>>   +static struct drm_plane_state *
>> +omap_plane_atomic_duplicate_state(struct drm_plane *plane)
>> +{
>> +    struct omap_plane_state *state;
>> +    struct omap_plane_state *copy;
>> +
>> +    if (WARN_ON(!plane->state))
>> +        return NULL;
>> +
>> +    state = to_omap_plane_state(plane->state);
>> +    copy = kmemdup(state, sizeof(*state), GFP_KERNEL);
>> +    if (!copy)
>> +        return NULL;
>> +
>> +    __drm_atomic_helper_plane_duplicate_state(plane, &copy->base);
>> +
>> +    return &copy->base;
>> +}
>> +
> 
> omap_crtc.c has similar, but slightly different, functions. I think it would be good to use the same style in omap_plane, or, if the approach above is better, change omap_crtc to match the style here.

Indeed the crtc version is better, I used the same style.

Thanks,
Neil

> 
>  Tomi

