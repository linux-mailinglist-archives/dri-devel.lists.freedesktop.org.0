Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5AC9C08B1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 15:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11B610E84F;
	Thu,  7 Nov 2024 14:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jmwDTfTD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5BF10E84F;
 Thu,  7 Nov 2024 14:17:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSQBrg6V8Ziwu7fxoEodQzVs7UPJPMRBlAOJ2BXl7v2g3ueIEaxsfpgvez5MFykNRgMzg9CWZoONldGedjYz+9RYkK29R+tpql6D+KNIiJP+sOGn7q5BraWu/agTit3CLsqqbBlzLqxyBGZILO9y1+ptwN2jnlSM+2N/lqKndzCgo6m9mYsp84hXBsHMrFBMO6V1VDbJXVrOOyNZtqBIBBayZgLMHuHAiDEL0kiW1umLyxG7PBaZ6I76SV/eq/F+iE6H27/ZBfK1P+Q40pp7GsAnjZ+9Wo+8FiQSYeRC1LNTgXX1ja0u+A+2t1IyGXKG357G131WIyLubkw1Tk1Jyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmGb+Y9X33ieqY+3a0MKIugW3JGei3jfSK8lIFMmxF4=;
 b=OkdCyvoNHuQt2z+g3+yelcd0jhLjAWpv8JQoxZkfiKEopU5z4XgBWiTlPcMjI7CbErQFyBAmd0Gwq9k4Uv4fekc4S7EnGvxXEkk6caN/WIQGRKZlOWEE9RwkZbaCYhHLsF8IfzaYq2tARUtoMUynL3ziZHXXfKe9GfmuPwMuhpGnyYa2AJle6kRcKoSJ2yodfWWQHfZEBj02H7g4gLTzfWmq00l56f32DJkHk+d9dmdjTUHUAssvY6c0QbU4NuIRyxYs6K5eE0/2mCdtKu0nPy1lFQNKX8NqbHxECWEjbz1KS6RM7BpvHR1J9oRzDPoi0iAcoWslnG7WinaCxqxkUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmGb+Y9X33ieqY+3a0MKIugW3JGei3jfSK8lIFMmxF4=;
 b=jmwDTfTDeWpOOl4nEeHlRM+0nc3dbWlq5/ERKc++OOe8rtnSmJvLYPQAdq2anBB2lg0hNwtxIx8UwyuD6dYxHvYwZ+vvws0qfw4lcZ1nPF0/6ugnoErOV7l/8B3PqfcVUvRf4JvM2rpsq7rlYWozo7BXlTwsJ6DaHvHIwDjWzVs=
Received: from SA1PR12MB8599.namprd12.prod.outlook.com (2603:10b6:806:254::7)
 by DM4PR12MB6183.namprd12.prod.outlook.com (2603:10b6:8:a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.33; Thu, 7 Nov
 2024 14:17:19 +0000
Received: from SA1PR12MB8599.namprd12.prod.outlook.com
 ([fe80::25da:4b98:9743:616b]) by SA1PR12MB8599.namprd12.prod.outlook.com
 ([fe80::25da:4b98:9743:616b%3]) with mapi id 15.20.8114.028; Thu, 7 Nov 2024
 14:17:19 +0000
From: "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH v6 4/5] drm: add drm_memory_stats_is_zero
Thread-Topic: [PATCH v6 4/5] drm: add drm_memory_stats_is_zero
Thread-Index: AQHbJwUreKOy/1AozECwrzxHk7/fobKrtQ4AgAA1CRA=
Date: Thu, 7 Nov 2024 14:17:19 +0000
Message-ID: <SA1PR12MB8599D376A7EBAB3F46302297ED5C2@SA1PR12MB8599.namprd12.prod.outlook.com>
References: <20241025174113.554-1-Yunxiang.Li@amd.com>
 <20241025174113.554-5-Yunxiang.Li@amd.com>
 <b31fd5b2-094a-4d3a-bab9-83102726eefa@igalia.com>
In-Reply-To: <b31fd5b2-094a-4d3a-bab9-83102726eefa@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=2ebe77d3-dccd-4b71-9f3d-af6527fb8ef7;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-11-07T13:50:54Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8599:EE_|DM4PR12MB6183:EE_
x-ms-office365-filtering-correlation-id: f6750eaa-0860-457d-e050-08dcff36e3c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?WM+MievlisT/8/7T5dZ2mQ3b0YEpJR/fR3AAliPwqPl4ut6O1NX3lRuZX+Vz?=
 =?us-ascii?Q?dv2o6lQvQkW/cAl6bXEatF8YnT2nUZEPsAmuGkzgG3dZfZszxhN9R4baXxDB?=
 =?us-ascii?Q?uGyWh5QE470/spJTfa0onpGea2G5u0fulMqQ2U/ecIREX51KGJ1/DP3iChi3?=
 =?us-ascii?Q?SLnnNfHbPmKmXmB/LDMdOhsR/zYmHD5yj/SdZ6yGj0+XkIYGmZ6/POa9FdED?=
 =?us-ascii?Q?DxkQxMogZQNUuk2cyrU4zitN5oKu1rzqfsKBZSj0KOWnBUQ7JHuNA1qKtNSp?=
 =?us-ascii?Q?4r9igDUA7lYOk6FqOoCbea+8iO+/X7hrl5Jp6Zt1UI/0YIQRsdL8EdnOsae0?=
 =?us-ascii?Q?MQbh2saJsAlovl+dlF1cbKVmLRnCL/KfxzH3AuBD0/v5pFxzTFFxX1rOMMLX?=
 =?us-ascii?Q?HB9ZSYHbLIltOiUYA+A5UhdjN0n7AhJv7hMcR6NOyBRti69wjLXSFe5gPa1w?=
 =?us-ascii?Q?WlMe1HafEHCVfdT+Xq1LCM534LVc1DG6gPR9STiBKUtN7PMNYg/Sjjnu5uVs?=
 =?us-ascii?Q?6hdwrQBT9lkAHp4xGYxH6GuEo79tmw4qh4HIr1gUYbT0192IgiNPm4/n5FOF?=
 =?us-ascii?Q?E9rmq0yPcheZbkq2Ol5tyJRmXAPL+Xh9wVWPEKpXBxp2chp8uLBWiXRKxZZZ?=
 =?us-ascii?Q?hgdy9mrJ8+HkNKk2/BhoXNXrA6D2IwpZu2VOcqw27pqKjBekGpj+xSpe8Rit?=
 =?us-ascii?Q?PAYRY9BWJTXRmmShXqNRWx6soVD4od7cYZBFHzGrlIdQMY5YqVOmmPPo78zn?=
 =?us-ascii?Q?HSQDc7HZabmSq/RnUCpVcepOTW5Va3lpkbniu/RL2W/h6HD1f/ftkYQl1Tuz?=
 =?us-ascii?Q?5Ra0TZwml+hFPioIma+xe1s+8nO8aIl2ulYSPCnsvRrMDml9j/WAN2ttzwv/?=
 =?us-ascii?Q?oCFQcunw8EUmObzxePrvXyvDYXmw2yrSMNZ8MeS1OsJ2HgdGf5Jtt/rEp7Ek?=
 =?us-ascii?Q?zuFR+gWy8AnrWt/XeFk6EagHn1pKK8Y1k7VUuwoEvKmrpoavtx/BHTIDGIRz?=
 =?us-ascii?Q?am7o/QiHkOh29SWdElKELGSMYvGnRnMuhKbXvxJ/hNbp3iAVa1YH9MnF0UI+?=
 =?us-ascii?Q?Z29PiDzjbyIxI+y1aqgmpOYLNIIlld3oC4aL+xGuAjW4OUsfa9W2EIpBAw8s?=
 =?us-ascii?Q?05OZ5oF58BECz55JoY2lutmWF16lSKCRyNyziJ8IXtc6heDrh8wMuMrYUHlF?=
 =?us-ascii?Q?gSNsQTy7cYTyiyEAQ4t8nYOdtY7wzBSn0mqwJvKkzpdU7GW4IAAHsvdaqMnZ?=
 =?us-ascii?Q?gLS3ebjSU6WW/zf+jga17Ui/NHhhjk9uK0d5htMlBvQLqKY8z5wLStVXZ96s?=
 =?us-ascii?Q?OddUBpYCvkx4zVrt7QkIrMmgY5kdUsfo+jn1f0TBPJbKfAZGQ48JCGnk9d+T?=
 =?us-ascii?Q?s+AVoA8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8599.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KNDqv0o16woXqhFU8v3aiaSu1f2JcTeJYThJ0aZwv/v4t0m5u53ZHNpzbiHT?=
 =?us-ascii?Q?qfPdqeaKdT4hlxvOu3b0tiCb7+9/8Vu5Aq6eC4/rg5b7gG3mmpWe3vqRQeZR?=
 =?us-ascii?Q?jDZzcUP0z336n290+F+UFJDTaNY9gQG+wJxi3tD90S5pZF/BU58XSa33ZWVI?=
 =?us-ascii?Q?e1Z5UveLLdfs/UdLxFR5xV0J83LZoF+rbUtbPOkM5epIFV5saNOg39YhS424?=
 =?us-ascii?Q?nis2g7bG7qMtKBTijY9vw1k2r2E3rXCjJQgwrONDVcQZ8TKL8RcyuS9TAncs?=
 =?us-ascii?Q?3VaPbLBpAMXBhJL+gTPy4o+385Ea43sZNO32hecm/nsUnQLsUESNfiOL1X7g?=
 =?us-ascii?Q?qbFKfEaovjTvrodQWO8hnxb4RtaboTpu6sPUcvYXxzYwHJ15zpxsV6hWbqBP?=
 =?us-ascii?Q?FQU4A+sSmLWFjZism4qFgmTNHhcmu9Ahc79VLo3vQd5DzdtpJJlFbR0q0tLY?=
 =?us-ascii?Q?t5EZVkcR4brOe5YiWVEL4WKq5bAWcP4sxk5l4TyQc4lCvGYRNuWM6ew23F9q?=
 =?us-ascii?Q?CnwcJKyxPnkAlhI9ttJk7yYmbWAxlxF+H3aAeCSiyifZ9e5wlywZcnhmHH07?=
 =?us-ascii?Q?kyvgAtIPFwONv0sa/bovDesxYQpNuG0BIBF8ulTrbifzpE2DpPBzTsBoQ+M6?=
 =?us-ascii?Q?V6NPcbXhzAYteq6nFysftWPQBBIJb8Zub8yrnq596dl1kQCZLpDqRcbLWESR?=
 =?us-ascii?Q?i7WzK2otFxtxKDPAMFczRpkwJ8F9DYKLIOftFlh+yZgU2KVr3qqy4oU+zY4R?=
 =?us-ascii?Q?Aj6cV4cEQSVG8ikLiSTyxdr0CrxmV9uAeL1N2FGGJBQ9Fps/s79VWpdijndO?=
 =?us-ascii?Q?PybLaN6GK6Ry7zh+nxuOmrpvWSoKttd48S/EkjiePcz2Xm6r7dIbv4V583KN?=
 =?us-ascii?Q?m2uFU54IN11V0OYQp/B/DkrTijXPOjzvBReN8PfsfaPjubI3jXT5PtcHoYwx?=
 =?us-ascii?Q?D+ssJOWSWJLQPS85yfpGqKnx/JS1yNCUxQz3SlpXqti4lStp+kWVAfP7YBhX?=
 =?us-ascii?Q?PWSikVHB12WVhkP76wiEkmZtloGu6qU3vgM/V9PqSJW3HqUeIoJLV1hP/x+O?=
 =?us-ascii?Q?L4j1psc5u7fARj4XvN7vcn65+4dMNXxOSie3QqQOgGgjh3bggIeu9/kB2SQu?=
 =?us-ascii?Q?f5Nodbh1UPa3hG0hN3UzZTTAT2BRxD0GRSGuRHCTYnPpaASQTE392HXInwlk?=
 =?us-ascii?Q?UkYeq6PCxJjM/1s35v3eK9fPtHxbgJUg/A7BTC2E/s/Q4ZB3ZCpQzi0ETUmt?=
 =?us-ascii?Q?qrzwpa3+rtPKuSiw+JP2LsAn2c02ZdcVAynnPN8l7KfXiV020/DRBC7Sava6?=
 =?us-ascii?Q?XbKkj/M6ZLb/sSMZDZWYKaAG2YqmsKPuZAh4sw8cHHtD1xBUBMSQCS8pPNmN?=
 =?us-ascii?Q?wKNrjzUeSWeQCMlXlIEQdFqdp27rKP0n4N4L6BsnBYm8hMFrR7LzLFZsojiM?=
 =?us-ascii?Q?tRERfm/u8VIaJ/0AXGh4I+F42UaOiPymJEouRF2FjGlfaQohfeDIaEeEinBh?=
 =?us-ascii?Q?v7PvLm2JurMi8A+WpAHiLPxSpV9GAp7z7ocC+E5wNWotB59JzPM05bFtLjLW?=
 =?us-ascii?Q?JJsVGcprSgN/qYH/748=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8599.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6750eaa-0860-457d-e050-08dcff36e3c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2024 14:17:19.4321 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6cKznEF3EEzmp9e6nnWZW777RlQ/jmSo6LASR2Cskp2orMucmakrdUY6L9uBYO1Cex3MDeTadOa/vAViq2esgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6183
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

[AMD Official Use Only - AMD Internal Distribution Only]

> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Sent: Thursday, November 7, 2024 5:41
> On 25/10/2024 18:41, Yunxiang Li wrote:
> > Add a helper to check if the memory stats is zero, this will be used
> > to check for memory accounting errors.
> >
> > Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
> > ---
> >   drivers/gpu/drm/drm_file.c | 9 +++++++++
> >   include/drm/drm_file.h     | 1 +
> >   2 files changed, 10 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> > index 714e42b051080..75ed701d80f74 100644
> > --- a/drivers/gpu/drm/drm_file.c
> > +++ b/drivers/gpu/drm/drm_file.c
> > @@ -859,6 +859,15 @@ static void print_size(struct drm_printer *p, cons=
t char
> *stat,
> >     drm_printf(p, "drm-%s-%s:\t%llu%s\n", stat, region, sz, units[u]);
> >   }
> >
> > +int drm_memory_stats_is_zero(const struct drm_memory_stats *stats) {
> > +   return (stats->shared =3D=3D 0 &&
> > +           stats->private =3D=3D 0 &&
> > +           stats->resident =3D=3D 0 &&
> > +           stats->purgeable =3D=3D 0 &&
> > +           stats->active =3D=3D 0);
> > +}
>
> Could use mem_is_zero() for some value of source/binary compactness.

Yeah, the patch set started out with that when it's just a function in amdg=
pu, but Christ didn't like it.

> > +EXPORT_SYMBOL(drm_memory_stats_is_zero);
> > +
>
> I am not a huge fan of adding this as an interface as the only caller app=
ears to be a
> sanity check in amdgpu_vm_fini():
>
>       if (!amdgpu_vm_stats_is_zero(vm))
>               dev_err(adev->dev, "VM memory stats is non-zero when fini\n=
");
>
> But I guess there is some value in sanity checking since amdgpu does not =
have a
> notion of debug only code (compiled at production and exercised via a tes=
t suite).
>
> I do suggest to demote the dev_err to notice log level would suffice and =
be more
> accurate.

I think it's very important to have a check like this when we have a known =
invariant, especially in this case where there's stat tracking code spread =
out everywhere and we have very little chance of catching a bug right when =
it happened. And since whenever this check fails we know for sure there is =
a bug, I don't see the harm of keeping it as an error.

Now that I think about it, I probably want to have the process & task name =
in here to aid in reproduction.

Teddy
