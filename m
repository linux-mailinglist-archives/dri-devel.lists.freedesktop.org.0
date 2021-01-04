Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B602E9EFD
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 21:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60F46E041;
	Mon,  4 Jan 2021 20:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760045.outbound.protection.outlook.com [40.107.76.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738806E041;
 Mon,  4 Jan 2021 20:46:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0oCcIMnlt4ylBzWZyVK0M8tuvzYYHI7hGNMcP5m1LsZIx+VpeWnGrEwHBO2zAnPGWR2JMnq8RD7Rb48co0vG4ocjIfIvL1/ykfN6KdiLBVJoryiAN3fmi3AaRHLj9erUQi/g5Y0Z18Spwq+M4yYHoTCGJDUpE8ewEr8F8wCwNF30DpP8gySxJJ86qQhgTwhV7FiGKTYa/uoI225B+JgWClT3SdRdTts9eni38PU12ZHAJu/tdONAwatc4m/5w+3hSGw9v+VQ3UihX6MtDQPbto7lA43zrOrCKrfZQuPJAvPbfd78hU5VnMyVIKUWoswwa52v98UMEeRzYc5wMNCYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oo9F8zatUypE1CiIL4IjZFYx3ce8zt6iz0VoraksBMg=;
 b=Se5v0duua5IV3aCryH7vYI3ltUUf91hAAMXhZuDMs6emwLNa625bhc2JtIXZlrOSBFZZ8UUVXjYowPN51l9m1HmiiVNTsbVw1hdZ9QRRRLnt0k3geg25NjjkRZgFIX/EaJUDQijRtNUJWXyUB+XpJi7/XZkdOosXSxmARAhWQ3xZyCG6XRG7yKq22X0DCwxAbrXCZQH3Yip0UUD2pR0DlHIh2Rxj+TQ8ZoJQP6MHbj6agQ2RBbFWniJ/Zb2sgcrlR85lVydcIpHnXsPuorcQU9gToZU0Y+neOmOFqKz/7Z0ceAnSOXO5Q7NmLpokQCItOPw5Ap7+h/iY109FKkcOjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oo9F8zatUypE1CiIL4IjZFYx3ce8zt6iz0VoraksBMg=;
 b=Iob/ncF/A3a/VeudDnCB8g3Ti9KYipw1imkobXmaTgdo651TA0O9aVdi34++7OBG1Tz2kFNJv30dULTe24zkCMZdLZ6MTvr4L5kpN9d7o540ja9qzgQFPb2PSIt+m43h1kLCnXpdyHcb61P3pwLgs5agpNSV3D5M3Yl8PDC4ahg=
Received: from DM6PR12MB2971.namprd12.prod.outlook.com (2603:10b6:5:118::28)
 by DM5PR12MB1721.namprd12.prod.outlook.com (2603:10b6:3:10d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Mon, 4 Jan
 2021 20:46:02 +0000
Received: from DM6PR12MB2971.namprd12.prod.outlook.com
 ([fe80::64a5:97ca:ceaf:17e0]) by DM6PR12MB2971.namprd12.prod.outlook.com
 ([fe80::64a5:97ca:ceaf:17e0%7]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 20:46:01 +0000
From: "Liu, Zhan" <Zhan.Liu@amd.com>
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, Mario Kleiner
 <mario.kleiner.de@gmail.com>
Subject: Re: [PATCH] drm: Check actual format for legacy pageflip.
Thread-Topic: [PATCH] drm: Check actual format for legacy pageflip.
Thread-Index: AQHW4Q/ijhWSZnncqUOk53kroda28KoUdpYAgANS5wCAACfwyw==
Date: Mon, 4 Jan 2021 20:46:01 +0000
Message-ID: <DM6PR12MB29719139A32F7BA9037AA45B9ED20@DM6PR12MB2971.namprd12.prod.outlook.com>
References: <20210102140235.514039-1-bas@basnieuwenhuizen.nl>
 <CAEsyxyheUd-jyd7X=7HJcOWqcrHgwsTAFyVhW9rJhutEdb=6MQ@mail.gmail.com>,
 <CAP+8YyHJpE39aea8OhGuQNjaGjLq4vcK-hNL+pC_wL5qsHwv2A@mail.gmail.com>
In-Reply-To: <CAP+8YyHJpE39aea8OhGuQNjaGjLq4vcK-hNL+pC_wL5qsHwv2A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-01-04T20:45:58.803Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: basnieuwenhuizen.nl; dkim=none (message not signed)
 header.d=none;basnieuwenhuizen.nl; dmarc=none action=none
 header.from=amd.com;
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 19c321cc-664e-47c5-4df5-08d8b0f1bf63
x-ms-traffictypediagnostic: DM5PR12MB1721:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB17215C1384564988417E04839ED20@DM5PR12MB1721.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n/heGa1KdDA0JGYFhDg/irMq9YuEQE2LgmlD7lFca4ico2UX59tbaN6CdRu3KPKGezgsO5lXG5pf2Pj6HeKULmxNOZOpFoW23sBlzJKOzGlD/RjnA2vFZRcl7isnV3pkciWLxFvvsNl1VwHc9twa1bdi8+PZfJmtSx27QfbdKOCVNh1Wd7nslR4hdAJxfTeJUzk7Z3WgP3WTdbApfULhffTDMhgXem0TQPxQY7XplnbYo0a1UDjTXHo+c1HW08jJVxzErTvTtvUojYJDxsyIMgLQb5/7OampJiOfQ+SDB62JyZVP58SbeebX66mLLf7cYVlsrZf5sN3vdvHQdzE2Id9rn61nF/oTY8iOCTSLPFFRva0n4uOttFVyCY74E+fw5tgeUiKn4/2rF7/TiQnS9A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2971.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(478600001)(8936002)(86362001)(52536014)(26005)(66946007)(186003)(33656002)(66446008)(76116006)(91956017)(4326008)(66476007)(66556008)(64756008)(2906002)(83380400001)(6506007)(53546011)(9686003)(5660300002)(8676002)(55016002)(54906003)(316002)(110136005)(7696005)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?S+db1oyhjyqRCkazAisGggzRRDLo6OFLTNdZtw1EONJTOkW0JqYy9n1L5Q?=
 =?iso-8859-1?Q?6NfzX/Jt7bUoJG+3LE+T6pgng8A9kSGRlrZYZIfYNUWb0U8IpgB/SPbq2g?=
 =?iso-8859-1?Q?Fd0WnA3065lWwqy+40bKZjuvYdRx1c0FZpp/u4E0V2Npx6hFv0xv/i3IS5?=
 =?iso-8859-1?Q?7sC8zVYBNoC6IjdTwAzQoX+K1kPzG4nsErhElQaGCGbxqSySuMEGa/uJf8?=
 =?iso-8859-1?Q?gENeqi+chE3Zm2SjBVZO5RKa78S/la3YZh+5hLCmjn3QEAmorldRE/mlTZ?=
 =?iso-8859-1?Q?nm/Gndulf1fA9pRglyNsOuuR78jhjfltA5lHsjok5kw7FFt185J8h2Y74N?=
 =?iso-8859-1?Q?ilaSWKvTd0m3KCCcDMOD4GsxvbehXr6Z8E8EqKDtoo7lpQTFVafFqJdJAJ?=
 =?iso-8859-1?Q?UqzcSJBwMU97SYVlEMVmw50JgA8e86qwVcpRHU8a+ifeDcnVdOv+8K10+F?=
 =?iso-8859-1?Q?h18n9xz084oDwPm1EKdMpOnxSloLzhqb1q7CNVwm7f+4OvR3JLfAjR2cSS?=
 =?iso-8859-1?Q?7fMN8vetCRc8/oiDxu7gp5A/eDmMJmQPQmEOsBpyPYvxlvzoMSRi5CPje7?=
 =?iso-8859-1?Q?JisWpwz2PjKmJgIHZbIeDNcCnSAWzQqSH5q9AF2vk6eV7JLUKhNAXjz6SL?=
 =?iso-8859-1?Q?LGI7zHYvcegYbALuGmurGLqDaFQxIJu8tlsMSkWOtLTUCwXFvUZTJk7D4O?=
 =?iso-8859-1?Q?+iUDuP7YDvW0OQicDJF7ExCHFi1KbcYu2sxYe6xskeOHqFLRuPvLfqpEfO?=
 =?iso-8859-1?Q?TLCFJJeomslQxnWrZMu5JEZxAd6/fP1kMUBd9KZ3LNvdXxY6rSN0QIre8/?=
 =?iso-8859-1?Q?ANKwfF8uHDTDg/P2PnLYgv/jZFW7neLXI/xZjrzLYAV44t9yoWfqDouSxT?=
 =?iso-8859-1?Q?W4yf5t6rCwcszMSrN30RVx14JV4drF8JxDrp2j9lKwGuPO0XWLFh3cEKIq?=
 =?iso-8859-1?Q?BiwV4F5H706jXqsjdgUv4C/wdhEE5/XJDQCMAiqw6MVB3tTqiN0bibKmml?=
 =?iso-8859-1?Q?iN+FUaeatgt2zTwJ4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2971.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c321cc-664e-47c5-4df5-08d8b0f1bf63
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2021 20:46:01.6458 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XZZaYoBsP28V4+jBKnKWI7z6Kl78bKJ3v2J+fDmCM6GL97bmVguvTTjdKmiZ3EEG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1721
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

+ Ville

On Sat, Jan 2, 2021 at 4:31 PM Mario Kleiner <mario.kleiner.de@gmail.com> wrote:
>
> On Sat, Jan 2, 2021 at 3:02 PM Bas Nieuwenhuizen
> <bas@basnieuwenhuizen.nl> wrote:
> >
> > With modifiers one can actually have different format_info structs
> > for the same format, which now matters for AMDGPU since we convert
> > implicit modifiers to explicit modifiers with multiple planes.
> >
> > I checked other drivers and it doesn't look like they end up triggering
> > this case so I think this is safe to relax.
> >
> > Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > Fixes: 816853f9dc40 ("drm/amd/display: Set new format info for converted metadata.")
> > ---
> >  drivers/gpu/drm/drm_plane.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > index e6231947f987..f5085990cfac 100644
> > --- a/drivers/gpu/drm/drm_plane.c
> > +++ b/drivers/gpu/drm/drm_plane.c
> > @@ -1163,7 +1163,7 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
> >         if (ret)
> >                 goto out;
> >
> > -       if (old_fb->format != fb->format) {
> > +       if (old_fb->format->format != fb->format->format) {
>

I agree with this patch, though considering the original way was made by Ville, I will wait for Ville's input first. Adding my "Acked-by" here.

This patch is:
Acked-by: Zhan Liu <zhan.liu@amd.com>

> This was btw. the original way before Ville made it more strict about
> 4 years ago, to catch issues related to tiling, and more complex
> layouts, like the dcc tiling/retiling introduced by your modifier
> patches. That's why I hope my alternative patch is a good solution for
> atomic drivers while keeping the strictness for potential legacy
> drivers.
>
> -mario
>
> >                 DRM_DEBUG_KMS("Page flip is not allowed to change frame buffer format.\n");
> >                 ret = -EINVAL;
> >                 goto out;
> > --
> > 2.29.2
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
