Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF399B0720C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 11:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD4210E0B8;
	Wed, 16 Jul 2025 09:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XDv+MfQx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4641710E0B8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 09:43:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z4odgjz6W54RsjQJjG4ZKlBQmSl/BZJvWbp3gZv6iQABm4yNVgi2gWQmRxeDxQ9VjbZIMs7dVfPklsIiMXw4J0YwV/CO7y0SHB9gcuIZSj5sBTvPNHyzGmcKNL6wjilxUc/AQFA9r+kStCYgm84fX0KRTfyNTRosaWze3CNrXsQs6lCSj5mcwiEPoLeVX7xe3hX4yAmC9Tlver/p+NEf2EAJc1OYc4dLzKmgAR41xgXNQY5+CKUHCglYrvPYaFP7Uf60cjkehXB/I4ZXDaMBpDibJI5jZnYGkWDBgtHKEdsU33BOA8BTRc/qj55Rdpb1XUcfAFCSk87lDJA9ta7//g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpMR/8a3Ew4wATa62v0FRk8/9IpgnDcCV8eSFvlh7PA=;
 b=Q8GqCvksIJBQj196CduxJbkXc0+UUYrH8ljuB4WQ0MDoVsV523xL2lj9zPA6qa3KZdRJGHoyy/UDK4cuRYD6bGczRnijtTdp/ix6QcAh1u9QPNPz9BJrFYxD2YmG2z2o33MVguLn/DaWund4BXGMEhPGbJ9zk83kXtzSDz95eUPs/IL00YFwe+IQxlKk77OLegxMbuOnTmCEPVimu8n8C7OEWpXvfz7Ueaks1Gg8Lxa5tXEwWSvqRjTbQqm1FP+Tt9kvwYJRm8QOUwapmV2yQ2ox2sLH4zSpENqUO3+QIiEjDLHqsDHougfXnTUBiOKWUBSLjyOs/xh3vpR0IWobfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpMR/8a3Ew4wATa62v0FRk8/9IpgnDcCV8eSFvlh7PA=;
 b=XDv+MfQxAmywvepAwCYpwxHYxhFAfl3sqG13l/ROfIwT9gIEGNjPhmhIyGEAemmjTwzDzC9X+skdxDxcenfiAxvNMAvOyKH0qPrLO0wJfJCwvRn8JxJ3ascXogfUmibJd718L8co7JMDykEdQAm913Ji1t91fm5h8t21B8SiULc=
Received: from CO6PR12MB5491.namprd12.prod.outlook.com (2603:10b6:303:13b::8)
 by LV8PR12MB9691.namprd12.prod.outlook.com (2603:10b6:408:295::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 09:43:16 +0000
Received: from CO6PR12MB5491.namprd12.prod.outlook.com
 ([fe80::beb1:2544:f31d:b46e]) by CO6PR12MB5491.namprd12.prod.outlook.com
 ([fe80::beb1:2544:f31d:b46e%4]) with mapi id 15.20.8922.037; Wed, 16 Jul 2025
 09:43:14 +0000
From: "cao, lin" <lin.cao@amd.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "phasta@kernel.org" <phasta@kernel.org>
CC: "Yin, ZhenGuo (Chris)" <ZhenGuo.Yin@amd.com>, "Deng, Emily"
 <Emily.Deng@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "matthew.brost@intel.com"
 <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/sched: Remove optimization that causes hang when
 killing dependent jobs
Thread-Topic: [PATCH] drm/sched: Remove optimization that causes hang when
 killing dependent jobs
Thread-Index: AQHb9Y90MU83ZsKFCUKpeVMJYecF4LQ0bWQAgAATGn4=
Date: Wed, 16 Jul 2025 09:43:14 +0000
Message-ID: <CO6PR12MB5491F9E1F21F95C89CC91DA2F556A@CO6PR12MB5491.namprd12.prod.outlook.com>
References: <20250715135033.706126-1-lincao12@amd.com>
 <b7e207ef3a775fed0f344ca24990c5aeb36b2507.camel@mailbox.org>
In-Reply-To: <b7e207ef3a775fed0f344ca24990c5aeb36b2507.camel@mailbox.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-16T09:43:13.7360000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5491:EE_|LV8PR12MB9691:EE_
x-ms-office365-filtering-correlation-id: 22066cc5-4fee-4cb2-7422-08ddc44d2f8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|8096899003|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?M9cWllJn7OG/umSkS+vW1KVIqCzXF+6CPZUg684CgQMI3E/6hoNwOcDSzxmk?=
 =?us-ascii?Q?sRt2HEqtDcVe7353NI3v77AkQHK8mx6iKq5h95PE4zGIYHJbFM5qvgWlflLQ?=
 =?us-ascii?Q?GlCwvWvZ1G5kX+20SbEogiPfj23YDnUkQA9p2E9+AU0tlKZYIojGRkg+yoaD?=
 =?us-ascii?Q?zNTRusjBvECyknfen+kyKDrbN628oF+dcAiAD+xTVDGETUyQjmCJottDuicO?=
 =?us-ascii?Q?sOchQfdeU7YCZorSISj5HNvaJh4Mvl68gRcZMWk9eQ3zhzb9qOThdfnUD3Hg?=
 =?us-ascii?Q?fUzfmPQ8V+zgOXTRKed2z7dYPOL3DIH6juOGobuiz7e+wRHgP2L0mi67n7Z0?=
 =?us-ascii?Q?JiA8wbTIN6rhHCfY2C9vnYhjfwqDDrf7N/xNGROzpFm0ZwNbHTPVFK63sYbu?=
 =?us-ascii?Q?n/MDIK0sA7q/jMoQjJvRpj/mkIGmTuD06cm1QA58KwzebVMb+moXL1tm/8HL?=
 =?us-ascii?Q?/Hh9CbNj0mV70Ab8vRA2pjs/+pfTOUf86MT6/7mIeVjBubzJIg+IiAMsJ1YQ?=
 =?us-ascii?Q?H2n+9PEgAtj3rZ7ezHv/r5gAxy17Bg7fRI9nLR2VVgkO0zREi6GclThrFxff?=
 =?us-ascii?Q?FWlDE1lznMX6WpZFKpeEOuRxmWf4tfthYQTmkIWW0XzfFik2sPsxvJVz8dRd?=
 =?us-ascii?Q?uwkQcJJ08ppb/RLcfCNL+mNFWsQYHRrgTbs1O74HmutuZuf1xZm6jSDlOxT1?=
 =?us-ascii?Q?V+hB5lKCsQUdEERBc3IEXHG3A0ZTszGWdm0ePhPnBkTu1sxFKX3KG1tj1A3n?=
 =?us-ascii?Q?Q/FQx+kkkdFwoGRscTQgq7T29Hj00g2mPdDiXPRRKP0iNVMl6M4B91PBCOcf?=
 =?us-ascii?Q?btlaJHFobTxpuqbRCMA9kmYhINueQcK11b0VmPPNMh+JCgcqh5bby90BU4RP?=
 =?us-ascii?Q?oWQQKOamXaIo9WtJC6Cr0aXTLw9bQeWPfHQmACK5lNErT2n7uMlWd9LAqetw?=
 =?us-ascii?Q?GvA3nMLC+nG4w1HAbkRuEzFSOnxaKfDszOoLi00JP3dd+YJ8r76Iw3GtSxAI?=
 =?us-ascii?Q?Q/cFT7yk4sV2dU11vUrB00LArhiTUBq7pVXbbBj5iE/95A2nx3W6jrY1HN9M?=
 =?us-ascii?Q?Fw7M/+Sl+INUsGfFshqXPI5uNfLG8pQ6hs85bCbgB874b2BJT/3juA492fFV?=
 =?us-ascii?Q?aNnhA6f2Xx04Y52FeMzO1/W7FoKwoM4SIvZuQbjg28W4bzX0fnTPjlqj7hFR?=
 =?us-ascii?Q?YVbIJYwAOrKBHeeDQ4chlrfQndb8RI/mv9nnzxIO0ql21elkD0sZjc/CpgxW?=
 =?us-ascii?Q?3TgbR9qgGgCoWQ7gAAb9XnIPJDK/Mhk9EYE0yD5YDeojUPk0nHWgXIpdgF0H?=
 =?us-ascii?Q?3WLt814NO1+Y1rCLOjFy3QF4FBlSENL8Pgnn0U8Z3nQplZiDUwU/hEb1W43t?=
 =?us-ascii?Q?yUm/IDHW/7p80stjyoQbHZIlXeTcDLlYdKKTsgOVLiA0UCclK3ibcAT5H0Oc?=
 =?us-ascii?Q?Jp2zNqgZpD6QaJo490h8JW9Ji9tN/tPtJJp4GLRGTNU1smCuGxw/bw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5491.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DVqD04tPWJd5ZaXOOs4mjp44wo2czbevbYqFQRAUwRpM4YyZ3j+nqTAqi5Cl?=
 =?us-ascii?Q?pSxkDiZ9uXpoJv5qf6Y4pNGrmfDECbpb/fmVvnE1RfJcw6G+v6MxLOJhynCb?=
 =?us-ascii?Q?ymAhSv1O7mA2rMCrEfeAA7JcolGqv/SLODmWn/j08kW179lcSrJtBfyrusCO?=
 =?us-ascii?Q?cc3tgZMDXGU44cUGvuMtwEqYMnbcbP7TfLsfbRy1GEnjuOP832GxbESXKwDl?=
 =?us-ascii?Q?W8T7F0JENNQ4NUvUvT3abSdPHz19kQmqKQwNkW7B7zlcFznH/NTUnzic4HuR?=
 =?us-ascii?Q?r1idGV0pHPRdrdbbRA8QClV7XZj5MCzcuRPAtGDkahJZ0Elwk+LcLQB4FaBK?=
 =?us-ascii?Q?6+hkkimTwOaNNzbNTYhmEABl2Nb88DSYeLP5rLJSKAQQpueb/jbbf4ON3HAt?=
 =?us-ascii?Q?5giihoQEr8sORRBoAmvBg/+3rGJqlL8g7KnjxW0h528SjOoBlRI8t2jEfHhZ?=
 =?us-ascii?Q?6ZgKGCMCxxqEgt7AkCWTJgDuVBO5rt/VhUbmPz9IP53g54nOXhiwvNwACihh?=
 =?us-ascii?Q?EW/EW6mpLFocR+MFn9P3g8LVygFtp95tET1dNJB8O8i5vy+2HXKrdyrxDKYy?=
 =?us-ascii?Q?BwpHkeAsZexcotKLKb5NhHblsoj8XnISFfiFv67/5VBX0NB4vsMWvCVR9BVG?=
 =?us-ascii?Q?H8PjDb6DYIr9v2+B+Su/Li/UXQZEqgctN8PXznJEKVC1SUdtUleZN61ybmGz?=
 =?us-ascii?Q?KGynnfBpm1pH2DcEvSF+mee8JBnoGss0UWI1sy41OotO3weBOcyn6+n/TtMw?=
 =?us-ascii?Q?61HyxTxttLHsVLaHKAb/DUyNgZOujOP2sT2iC16UY3Ky0UXD/l2f/jVRrBPB?=
 =?us-ascii?Q?UmoEUNV6fPxHG9nbYiLvMFSZlieiIIf6eOxbNVWueprwBKt0xBJxSZgAfOwg?=
 =?us-ascii?Q?kg8lMqSFas61r8D4uGiwC0APXDTWsUAeTKf0gyjSrrunOa15wIWvxkqz5g2U?=
 =?us-ascii?Q?96/+9R5Kk5vv0fCW13zcDvOh66ipSouglc1eVHnOC0qqg2HoDjGKjwDdkx8b?=
 =?us-ascii?Q?u4ATJTOlwbMRn3bTLz8NZwfWO/dpwJ1JT3LH56AqUZG0bAIaTp55vqFnebnZ?=
 =?us-ascii?Q?83hunSe7vksfMAc9yoMpJ1EHPKLiYQDHc3OkDBFa3kyz5ejgnPmp1eANyEup?=
 =?us-ascii?Q?qW7fi9OsF0V8euzzh9NmTq6sNKdQkFTEtePK1HLHW7KIgOfsoUiV8SbEW3/Y?=
 =?us-ascii?Q?zpcoHL5ntg3CsXJzs+SXZVaCk0IeFoclc+pCZ8awAAS7EGMUQcDajUypb63X?=
 =?us-ascii?Q?t7ch75wqcXzmeMQ+6/gMaPQ2cLd/VsROcJQSlOl8dLa9PZq11sj75DXNf9+6?=
 =?us-ascii?Q?E/7KYsppCovifeZRAeQh6+WdqJokrsYq20cS+xWQzPKZld2sWs+/ZE5nieQx?=
 =?us-ascii?Q?wP81ZZSdmpDxCiCsA6YJVlcBGrDMjifR0KsCzOiP0hkLETSX/RdybOJuKE97?=
 =?us-ascii?Q?20DIrdN5GkNP9jxxwG/b36fCkkSke/nXCOePyE/2vXkB6YVJAYN1/Mp9Coel?=
 =?us-ascii?Q?Ag0WqT70SWJQOLhbp2huaqJoTXvI+2gPyUSLMoBGY8oCENgneslAWUKv/o81?=
 =?us-ascii?Q?i/ufvRUz5Bf7k8bwrY0=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CO6PR12MB5491F9E1F21F95C89CC91DA2F556ACO6PR12MB5491namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5491.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22066cc5-4fee-4cb2-7422-08ddc44d2f8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 09:43:14.5120 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qH9xOoJ7EMZtI86ZM45J80DEskbKmMk/dZj/6SovudgqPm2xdAU09ChqcOxcQ5+7gGdkc5FnFCUE7XDAum6duA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9691
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

--_000_CO6PR12MB5491F9E1F21F95C89CC91DA2F556ACO6PR12MB5491namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Philipp,

Thank you for the review. I found that this optimization was introduced 9 y=
ears ago in commit 777dbd458c89d4ca74a659f85ffb5bc817f29a35 ("drm/amdgpu: d=
rop a dummy wakeup scheduler").

Given that the codebase has undergone significant changes over these 9 year=
s. May I ask if I still need to include the Fixes: tag?

Thanks,
Lin
________________________________
From: Philipp Stanner <phasta@mailbox.org>
Sent: Wednesday, July 16, 2025 16:33
To: cao, lin <lin.cao@amd.com>; dri-devel@lists.freedesktop.org <dri-devel@=
lists.freedesktop.org>
Cc: Yin, ZhenGuo (Chris) <ZhenGuo.Yin@amd.com>; Deng, Emily <Emily.Deng@amd=
.com>; Koenig, Christian <Christian.Koenig@amd.com>; phasta@kernel.org <pha=
sta@kernel.org>; dakr@kernel.org <dakr@kernel.org>; matthew.brost@intel.com=
 <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/sched: Remove optimization that causes hang when k=
illing dependent jobs

On Tue, 2025-07-15 at 21:50 +0800, Lin.Cao wrote:
> When application A submits jobs and application B submits a job with
> a
> dependency on A's fence, the normal flow wakes up the scheduler after
> processing each job. However, the optimization in
> drm_sched_entity_add_dependency_cb() uses a callback that only clears
> dependencies without waking up the scheduler.
>
> When application A is killed before its jobs can run, the callback
> gets
> triggered but only clears the dependency without waking up the
> scheduler,
> causing the scheduler to enter sleep state and application B to hang.
>
> Remove the optimization by deleting drm_sched_entity_clear_dep() and
> its
> usage, ensuring the scheduler is always woken up when dependencies
> are
> cleared.
>
> Signed-off-by: Lin.Cao <lincao12@amd.com>

This is, still, a bug fix, so it needs Fixes: and Cc: stable :)

Could also include a Suggested-by: Christian

P.

> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 21 ++-------------------
>  1 file changed, 2 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index e671aa241720..ac678de7fe5e 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -355,17 +355,6 @@ void drm_sched_entity_destroy(struct
> drm_sched_entity *entity)
>  }
>  EXPORT_SYMBOL(drm_sched_entity_destroy);
>
> -/* drm_sched_entity_clear_dep - callback to clear the entities
> dependency */
> -static void drm_sched_entity_clear_dep(struct dma_fence *f,
> -                                    struct dma_fence_cb *cb)
> -{
> -     struct drm_sched_entity *entity =3D
> -             container_of(cb, struct drm_sched_entity, cb);
> -
> -     entity->dependency =3D NULL;
> -     dma_fence_put(f);
> -}
> -
>  /*
>   * drm_sched_entity_wakeup - callback to clear the entity's
> dependency and
>   * wake up the scheduler
> @@ -376,7 +365,8 @@ static void drm_sched_entity_wakeup(struct
> dma_fence *f,
>       struct drm_sched_entity *entity =3D
>               container_of(cb, struct drm_sched_entity, cb);
>
> -     drm_sched_entity_clear_dep(f, cb);
> +     entity->dependency =3D NULL;
> +     dma_fence_put(f);
>       drm_sched_wakeup(entity->rq->sched);
>  }
>
> @@ -429,13 +419,6 @@ static bool
> drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>               fence =3D dma_fence_get(&s_fence->scheduled);
>               dma_fence_put(entity->dependency);
>               entity->dependency =3D fence;
> -             if (!dma_fence_add_callback(fence, &entity->cb,
> -
> drm_sched_entity_clear_dep))
> -                     return true;
> -
> -             /* Ignore it when it is already scheduled */
> -             dma_fence_put(fence);
> -             return false;
>       }
>
>       if (!dma_fence_add_callback(entity->dependency, &entity->cb,


--_000_CO6PR12MB5491F9E1F21F95C89CC91DA2F556ACO6PR12MB5491namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi Philipp,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thank you for the review. I found that this optimization was introduced 9 y=
ears ago in commit 777dbd458c89d4ca74a659f85ffb5bc817f29a35 (&quot;drm/amdg=
pu: drop a dummy wakeup scheduler&quot;).</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Given that the&nbsp;codebase has undergone significant changes over these 9=
 years. May I ask if I still need to include the Fixes: tag?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Lin</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Philipp Stanner &lt;p=
hasta@mailbox.org&gt;<br>
<b>Sent:</b> Wednesday, July 16, 2025 16:33<br>
<b>To:</b> cao, lin &lt;lin.cao@amd.com&gt;; dri-devel@lists.freedesktop.or=
g &lt;dri-devel@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Yin, ZhenGuo (Chris) &lt;ZhenGuo.Yin@amd.com&gt;; Deng, Emily &l=
t;Emily.Deng@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@amd.com&gt=
;; phasta@kernel.org &lt;phasta@kernel.org&gt;; dakr@kernel.org &lt;dakr@ke=
rnel.org&gt;; matthew.brost@intel.com &lt;matthew.brost@intel.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/sched: Remove optimization that causes hang=
 when killing dependent jobs</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue, 2025-07-15 at 21:50 +0800, Lin.Cao wrote:<=
br>
&gt; When application A submits jobs and application B submits a job with<b=
r>
&gt; a<br>
&gt; dependency on A's fence, the normal flow wakes up the scheduler after<=
br>
&gt; processing each job. However, the optimization in<br>
&gt; drm_sched_entity_add_dependency_cb() uses a callback that only clears<=
br>
&gt; dependencies without waking up the scheduler.<br>
&gt; <br>
&gt; When application A is killed before its jobs can run, the callback<br>
&gt; gets<br>
&gt; triggered but only clears the dependency without waking up the<br>
&gt; scheduler,<br>
&gt; causing the scheduler to enter sleep state and application B to hang.<=
br>
&gt; <br>
&gt; Remove the optimization by deleting drm_sched_entity_clear_dep() and<b=
r>
&gt; its<br>
&gt; usage, ensuring the scheduler is always woken up when dependencies<br>
&gt; are<br>
&gt; cleared.<br>
&gt; <br>
&gt; Signed-off-by: Lin.Cao &lt;lincao12@amd.com&gt;<br>
<br>
This is, still, a bug fix, so it needs Fixes: and Cc: stable :)<br>
<br>
Could also include a Suggested-by: Christian<br>
<br>
P.<br>
<br>
&gt; ---<br>
&gt; &nbsp;drivers/gpu/drm/scheduler/sched_entity.c | 21 ++----------------=
---<br>
&gt; &nbsp;1 file changed, 2 insertions(+), 19 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/scheduler/sched_entity.c<br>
&gt; b/drivers/gpu/drm/scheduler/sched_entity.c<br>
&gt; index e671aa241720..ac678de7fe5e 100644<br>
&gt; --- a/drivers/gpu/drm/scheduler/sched_entity.c<br>
&gt; +++ b/drivers/gpu/drm/scheduler/sched_entity.c<br>
&gt; @@ -355,17 +355,6 @@ void drm_sched_entity_destroy(struct<br>
&gt; drm_sched_entity *entity)<br>
&gt; &nbsp;}<br>
&gt; &nbsp;EXPORT_SYMBOL(drm_sched_entity_destroy);<br>
&gt; &nbsp;<br>
&gt; -/* drm_sched_entity_clear_dep - callback to clear the entities<br>
&gt; dependency */<br>
&gt; -static void drm_sched_entity_clear_dep(struct dma_fence *f,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dma_fe=
nce_cb *cb)<br>
&gt; -{<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; struct drm_sched_entity *entity =3D<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; container_of(cb, struct drm_sched_entity, cb);<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; entity-&gt;dependency =3D NULL;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; dma_fence_put(f);<br>
&gt; -}<br>
&gt; -<br>
&gt; &nbsp;/*<br>
&gt; &nbsp; * drm_sched_entity_wakeup - callback to clear the entity's<br>
&gt; dependency and<br>
&gt; &nbsp; * wake up the scheduler<br>
&gt; @@ -376,7 +365,8 @@ static void drm_sched_entity_wakeup(struct<br>
&gt; dma_fence *f,<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_sched_entity *entity =3D<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; container_of(cb, struct drm_sched_entity, cb);<br>
&gt; &nbsp;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; drm_sched_entity_clear_dep(f, cb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; entity-&gt;dependency =3D NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; dma_fence_put(f);<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_sched_wakeup(entity-&gt;rq-&gt;sche=
d);<br>
&gt; &nbsp;}<br>
&gt; &nbsp;<br>
&gt; @@ -429,13 +419,6 @@ static bool<br>
&gt; drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)<br=
>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; fence =3D dma_fence_get(&amp;s_fence-&gt;scheduled);<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; dma_fence_put(entity-&gt;dependency);<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; entity-&gt;dependency =3D fence;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (!dma_fence_add_callback(fence, &amp;entity-&gt;cb,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &n=
bsp;&nbsp;&nbsp;<br>
&gt; drm_sched_entity_clear_dep))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Ignore it when it is already scheduled */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; dma_fence_put(fence);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return false;<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &nbsp;<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!dma_fence_add_callback(entity-&gt;=
dependency, &amp;entity-&gt;cb,<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_CO6PR12MB5491F9E1F21F95C89CC91DA2F556ACO6PR12MB5491namp_--
