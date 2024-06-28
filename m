Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B3A91C551
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 20:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232CC10ECEA;
	Fri, 28 Jun 2024 18:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=valvesoftware.com header.i=@valvesoftware.com header.b="hmJsJEe1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Fri, 28 Jun 2024 17:32:14 UTC
Received: from us-smtp-delivery-172.mimecast.com
 (us-smtp-delivery-172.mimecast.com [170.10.133.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4286B10ECE3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 17:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valvesoftware.com;
 s=mc20150811; t=1719595933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XKtCW3Er86rGfQYrPBdk0AkxyGBnrD1aUtOlms/i3Os=;
 b=hmJsJEe1oy5ePitOcXdUpQffxGUbLKYv+40goaQhBfDqcjpMVa4lP+Or8scRs4jI44xmrz
 sUQ3NDN9++6r1kDP81xna1PasYaZP9slqvruPETAhbCc+uuWdOvTNZshMxGG4xc+hkDeC9
 bxPm7P2CaqVPwpoU/loAxNzjZP1yHx4=
Received: from smtp-01-blv1.valvesoftware.com
 (smtp-01-blv1.valvesoftware.com [208.64.203.181]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384)
 id us-mta-509-YeRFSs92OJut8_BO1Wnqyw-1; Fri, 28 Jun 2024 13:26:04 -0400
X-MC-Unique: YeRFSs92OJut8_BO1Wnqyw-1
Received: from antispam.valve.org ([172.16.1.107])
 by smtp-01-blv1.valvesoftware.com with esmtp (Exim 4.93)
 (envelope-from <johns@valvesoftware.com>) id 1sNFMJ-004VPm-K4
 for dri-devel@lists.freedesktop.org; Fri, 28 Jun 2024 10:26:03 -0700
Received: from antispam.valve.org (127.0.0.1) id hfrp2m0171sj for
 <dri-devel@lists.freedesktop.org>;
 Fri, 28 Jun 2024 10:26:03 -0700 (envelope-from <johns@valvesoftware.com>)
Received: from mail2.valvemail.org ([172.16.144.23])
 by antispam.valve.org ([172.16.1.107]) (SonicWall 10.0.15.7233)
 with ESMTP id o202406281726030074293-5; Fri, 28 Jun 2024 10:26:03 -0700
Received: from [172.16.36.27] (172.16.36.27) by mail2.valvemail.org
 (172.16.144.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 28 Jun
 2024 10:26:03 -0700
Message-ID: <884684ce-53b1-48db-8dcb-6b2bcd0d151d@valvesoftware.com>
Date: Fri, 28 Jun 2024 10:25:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm: panel-orientation-quirks: Add quirk for Valve
 Galileo
To: Matthew Schwartz <mattschwartz@gwmail.gwu.edu>, Hamza Mahfooz
 <hamza.mahfooz@amd.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Mario
 Limonciello <mario.limonciello@amd.com>, Kyle Gospodnetich
 <me@kylegospodneti.ch>, Hans de Goede <hdegoede@redhat.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Matthew
 Schwartz <mattschwartz@gwu.edu>
References: <20240627203057.127034-1-mattschwartz@gwu.edu>
 <20240627203057.127034-2-mattschwartz@gwu.edu>
 <19ca1a46-6a74-4eec-9e84-0092faaee7a1@amd.com>
 <CAD9O9Dp89CprZFMn=ysduPmUTkmJ5y6qDw18X9pLr7=ChoD0Uw@mail.gmail.com>
From: John Schoenick <johns@valvesoftware.com>
In-Reply-To: <CAD9O9Dp89CprZFMn=ysduPmUTkmJ5y6qDw18X9pLr7=ChoD0Uw@mail.gmail.com>
X-ClientProxiedBy: mail2.valvemail.org (172.16.144.23) To mail2.valvemail.org
 (172.16.144.23)
X-Mlf-DSE-Version: 6871
X-Mlf-Rules-Version: s20240627204322; ds20230628172248;
 di20240626213040; ri20160318003319; fs20240628163459
X-Mlf-Smartnet-Version: 20210917223710
X-Mlf-Envelope-From: johns@valvesoftware.com
X-Mlf-Version: 10.0.15.7233
X-Mlf-License: BSV_C_AP____
X-Mlf-UniqueId: o202406281726030074293
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: valvesoftware.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 28 Jun 2024 18:01:07 +0000
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


On 6/27/24 5:17 PM, Matthew Schwartz wrote:
> On Thu, Jun 27, 2024 at 2:28=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz@amd.=
com> wrote:
>> On 6/27/24 16:30, Matthew Schwartz wrote:
>>> From: John Schoenick <johns@valvesoftware.com>
>> Since this patch is from John, you would need his S-o-b in here as well
>> (assuming you have his permission to add it).
> This patch will be pending approval from them in that case. The panel qui=
rk
> follows the same structure as the Steam Deck Jupiter revision, but the qu=
irk
> has only been signed during merges by people who were not the original au=
thor.
> Link: https://gitlab.com/evlaV/linux-integration/-/commit/b90ac393

Hey, thanks for taking the initiative to upstream this -- feel free to=20
add my S-o-b

>>
>>> Valve's Steam Deck Galileo revision has a 800x1280 OLED panel
>>>
>>> Suggested-by: John Schoenick <johns@valvesoftware.com>
>>> Link: https://gitlab.com/evlaV/linux-integration/-/commit/d2522d8bf88b3=
5a8cf6978afbbd55c80d2d53f4f
>>> Signed-off-by: Matthew Schwartz <mattschwartz@gwu.edu>
>>> ---
>>>    drivers/gpu/drm/drm_panel_orientation_quirks.c | 7 +++++++
>>>    1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/g=
pu/drm/drm_panel_orientation_quirks.c
>>> index 3d127127e7cb..ac8319d38e37 100644
>>> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
>>> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
>>> @@ -427,6 +427,13 @@ static const struct dmi_system_id orientation_data=
[] =3D {
>>>                  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
>>>                },
>>>                .driver_data =3D (void *)&lcd800x1280_rightside_up,
>>> +     }, {    /* Valve Steam Deck */
>>> +             .matches =3D {
>>> +               DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
>>> +               DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galileo"),
>>> +               DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
>>> +             },
>>> +             .driver_data =3D (void *)&lcd800x1280_rightside_up,
> Unless I get a S-o-b, is authoring a different DMI check the only solutio=
n
> to get a functioning panel quirk upstreamed for the Galileo revision?
> Not quite sure how I'd maintain conformity with the existing Jupiter
> quirk while also writing something original here.
>
>>>        }, {    /* VIOS LTH17 */
>>>                .matches =3D {
>>>                  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "VIOS"),
>> --
>> Hamza
>>
> --
> Matt
>

