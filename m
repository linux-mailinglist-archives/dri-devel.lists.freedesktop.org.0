Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E21B0728C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 12:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952D110E786;
	Wed, 16 Jul 2025 10:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="X0cLhHki";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E7710E787
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 10:05:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUqZblh29K0KgPj5nexEQ7tQL40Mv6SpyOUxA+4yT3lnG3CRh1klOTJ3NHGfUnBD5oxOYaFZOnmA0JFRZV2/SFX4sR9wLsUXxOxnjGYFV9oGnFryILI+OVFV6PyI0DBFfOI8tBSh0F5aB/i+XIKiUuh736gKuovttcf6IBaUesNXDQVDbSjgYzHTnAR7MOUAKYKT1sjRPMOKSyZ1+4UNN3kvXY+hOVHHR/XyAUnai/pHpVWldNo+nydRQQM1hML3f7osOMpG3Fr1hMnRK2SAMxhHKu5lnaKFK3fRT1B9CKk5xo1w0vcU1FEGeo30C1f23k48XG7/517io1pYivGVFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8y0KKchtVIGAF8fvPiz6I+dg0men/MeLXlJJoV2fSw=;
 b=B+xkySAUFYw6QzAcM/xx837z0jPNu+1OaXRP4wMRSmdfHXTGzMI7Uesv/ntfhDJwKsUakMOGXcd/hrweVSKNVa8NhKkfPig7cUJeRfXtWcBQlDBPn4EiaYUqm8fv3YubumFNCvhnK8oKF5nv4klX9TLObPMQAmUwUVPA5xMlDylGGoh4zG81VWTdyXXfQfhHv+2rXPOpACOJmRBpo9So7C4RklxxTmhPhSVAxCBH5vP+w51pYNbQ4PdSl4e9c9C+IGOTLdEAJhwsMIDT3yR/6JDn8xmpqk8Hry+2SRJ2ggaBdqs48m+fP4PHcg0Qrtp0i7nUgduU2oOm7uhadFXSEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8y0KKchtVIGAF8fvPiz6I+dg0men/MeLXlJJoV2fSw=;
 b=X0cLhHkiMpjfWQwnAELp6pDXYZ8oW1oDqVVo05H2Id5bZxY/D2rMP/ZFsuUXp091Ia71VAG3Vq9yqTbvdj+ZWnXe0KRSb8+AZTs/9ksvKAo3eSwzADi1K+4ez3+p4CwG67FVx275LNeNu4Q0pYViOg9MhyuZSeKGD7bZz1nZUL4=
Received: from CO6PR12MB5491.namprd12.prod.outlook.com (2603:10b6:303:13b::8)
 by CH2PR12MB4102.namprd12.prod.outlook.com (2603:10b6:610:a9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 10:05:36 +0000
Received: from CO6PR12MB5491.namprd12.prod.outlook.com
 ([fe80::beb1:2544:f31d:b46e]) by CO6PR12MB5491.namprd12.prod.outlook.com
 ([fe80::beb1:2544:f31d:b46e%4]) with mapi id 15.20.8922.037; Wed, 16 Jul 2025
 10:05:35 +0000
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
Thread-Index: AQHb9Y90MU83ZsKFCUKpeVMJYecF4LQ0bWQAgAATGn6AAASUgIAAAVDK
Date: Wed, 16 Jul 2025 10:05:35 +0000
Message-ID: <CO6PR12MB5491D8AC9F0920FA75D2CD6AF556A@CO6PR12MB5491.namprd12.prod.outlook.com>
References: <20250715135033.706126-1-lincao12@amd.com>
 <b7e207ef3a775fed0f344ca24990c5aeb36b2507.camel@mailbox.org>
 <CO6PR12MB5491F9E1F21F95C89CC91DA2F556A@CO6PR12MB5491.namprd12.prod.outlook.com>
 <df5fe40e79db8e988661704ea4f72be1a2e4c14c.camel@mailbox.org>
In-Reply-To: <df5fe40e79db8e988661704ea4f72be1a2e4c14c.camel@mailbox.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-16T10:05:35.6350000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5491:EE_|CH2PR12MB4102:EE_
x-ms-office365-filtering-correlation-id: f589c51b-42d9-4829-d084-08ddc4504f12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?F5KfmIW3o0UEy65MlR50Vx3LtlTgw/prBJzv2JrrmTmwjUEenClRqXwnl+?=
 =?iso-8859-1?Q?avj46rT5l4jbeJtJ/akOP6edvU/f5G+ZK4ndWjulN9pB0l+F/Mh0VnA4TB?=
 =?iso-8859-1?Q?mMQ4su3t7u0O+4xcYt3w8/8TRZum7u4evXi88hJNaD9aKpSknw2/rISpHe?=
 =?iso-8859-1?Q?sGYWDNSuDB2qQ6adzwQLS7RkstHdbESjFZBMnCaKD8A9p+FUc2WcLpAO+D?=
 =?iso-8859-1?Q?PpfsFNukiCP7+MRK01ZILjMaMA3D2+xv9j1lk4Sx7ZsXXv3RNDH61AV18I?=
 =?iso-8859-1?Q?pQyKy/UUpsL/gcpsX59Dv0bd+vdZj8eTfkFwh+naSM+A1old41AjHSLnIu?=
 =?iso-8859-1?Q?rpf9HsOUha9xfyRPNIlX7glEmFyCn/O/u1/Qu4Hu0e+dOGPgCnbF7fqqE+?=
 =?iso-8859-1?Q?x1o4AVRYKSrqEWc7efJwCTIof3+aUB6C8DDXyamLWnK6YhV30UNc2biS6h?=
 =?iso-8859-1?Q?+GiUqyWtj4wAJDuBFefKZaTbxlClrNxdN2esEOdpfudbsJDZp14X4xP6xI?=
 =?iso-8859-1?Q?cIidXoF/ktbbQ30DTl3FyfYGGSGKyl8oS2W49XvsjnplNExfMs1eiPqQOe?=
 =?iso-8859-1?Q?7KbL10fVU+6MlSfK+WxEGmVkLz2E30yS1dP5Fbkca4tJlyFU6GsAGcyJZA?=
 =?iso-8859-1?Q?VXX2SEUtymZEp7hN1U8RHQyaFs/+zb8wwmDouBRLaU77X3Xurjs2pNmJAV?=
 =?iso-8859-1?Q?HgwpBJanA57/sclXPCwpJngn6xshK+aET3xFkvsSGL2BEFUYr0kyk2zDDq?=
 =?iso-8859-1?Q?BtPA/urrPbEBSJymHRZMOGZLOUqgZFQiPQw9K5omy5jaPdBWaJCtP3/WSb?=
 =?iso-8859-1?Q?SQxIsQFf/VdyUiXCAda+2L+uh54ecS6BnHVFA4gYA8H/z6HW/zLIJVgCpp?=
 =?iso-8859-1?Q?wHXByf1OFIMvFxwms2sFM17miZ5/13GT7N3ERKNtA2A4XN7crgj0WYcZIP?=
 =?iso-8859-1?Q?EaYPC9IJs+itzQyI3ehPfcp5Q9a6cy9B8J/9k1/IxgRw4C9OC52v/vyUku?=
 =?iso-8859-1?Q?SDErUqGV03rXW5fnLwvIa2x8QPgNpz8TnJjnLDv3ACXvGdLuDD8vNRGSm6?=
 =?iso-8859-1?Q?Qpl7/Vo8fxspy9soZ6E2aPJWLydhAyBfOmXjwe5qz/aV/bg3GHdrMh6n9K?=
 =?iso-8859-1?Q?HDNctus2laGe3/G2AsloJf80dKLmEZja0jvdM1axsYeQPtKTzYs3aqCSph?=
 =?iso-8859-1?Q?ZDvGxnYxc3tusngZneeS6IjS95y5Jb0WHJnJld0r03oHnyvp2zzr5M67dg?=
 =?iso-8859-1?Q?78EL3W/dk0fKI2fzCp5EoBLIgwpGLoDxWeQC37heHYni4vKBoR1FeoEzBq?=
 =?iso-8859-1?Q?3Pj2jo+EeFentbKfIw26WLKlrm0iMEUX6Tm6dwQnDXFZjuabmFMFcorbr+?=
 =?iso-8859-1?Q?ZRGBCMY+FIF1U3tTsevPU4umyQhRkfvkWPKAtPsMW4d4sGhtNY+VFgREBI?=
 =?iso-8859-1?Q?i7IlN/G0OhoS7okPXxXWEdGDdgvAIBrR5uUepEGCne5oEEdukllPCUDUFR?=
 =?iso-8859-1?Q?UI9yKREZ7Ua/WInJwLpSuuBwyzSwa+nrWKtNIIxLb8Lw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5491.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(8096899003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Iwh9GxKRJEvd7FqeUlW9ac7MN3M+53CK2ZkSdkjJPFMmum3b1t1ScoKF6J?=
 =?iso-8859-1?Q?7lbERCCIEwKAg/xy/wZzGP6GaoUCxAJrbEgjuUO/udKHtEwVo7OifF67SE?=
 =?iso-8859-1?Q?s01g95GsPc8nzAvd9Mk8osxxPNBr7Y7RDNaSQ+7sVffY5fWN4/jVkEcD0Z?=
 =?iso-8859-1?Q?SosvIuXf0VQCRifkCU61GTqJVl6BIiSYWu2lx4jjv9Gq8/rMo/KvNSlfKc?=
 =?iso-8859-1?Q?9JpzCyQQPPkSQbOiD6lcmloyveMbTF9HA3+7HlTHV5CZ2NtgkT1II4i64p?=
 =?iso-8859-1?Q?LOJ5r/Ocr9SHthubbaD0h+T4iVbrtkgxS0DP2YP0C6Hse6CtXimCMH7jmt?=
 =?iso-8859-1?Q?8O3mukaKJgz/psamLnqlXN2acfFwWbDSWpM58tKtR7MScDMSqy5s2Ws0j4?=
 =?iso-8859-1?Q?T4/gc57TnmqFynSJeRe6hKXB9WEMw0WnmzgqToGcKI7jsiP/0wcjpzDSAV?=
 =?iso-8859-1?Q?T2Sbqp1fkd0OyJQwHyhc2QSfHNV1hsD2ylpvs6aV7467xLdK3EnjIQEhuJ?=
 =?iso-8859-1?Q?ObYWFyCArnIjq6T9/Ol6Ou3qdncNWcAjpVjgXKM6q1RPvs6sZCLHclC3ir?=
 =?iso-8859-1?Q?yRpeQLDUl2ifaMx3fum8sNeglEnQjLh/c8BiapwqCeYQFr7NbtrN/mY/FQ?=
 =?iso-8859-1?Q?uFt4p66NIgZ14lxMNq3yeryBmBbmh7D28S7tVxJvQDaierxRpMsFiALGjH?=
 =?iso-8859-1?Q?v2orvX7LRDeFvUdHPDJDgGsLf7wOI5mPW8qImbViCngb9eJ9uDmCXrTz6I?=
 =?iso-8859-1?Q?rqdlPQfINnIrHRgFLfj1wXEXUly45cY+NEOBzeQtpE1issp1buO4VeGrQ/?=
 =?iso-8859-1?Q?ybZovDGKDmMdxQ1TkgyJg9FdjL2nGa8Dyc8AlBRVLW03Pgy3wIO6rnyoIi?=
 =?iso-8859-1?Q?OZU34po0ULNs5SRfY+RaLNulGmUmkkVdSmPCmDIZXiZ6LPSCPf/crLA7yS?=
 =?iso-8859-1?Q?pIla3yIYgZSro8spJyg/ilctDiNeT/2hvuHc2CuZRkyPGdubpjKh87knd8?=
 =?iso-8859-1?Q?p8fvUMPy2VLfhtjQZkShMguHmvs5oXZFswA2ii5YUpplYZSUN6zRY2Xxdk?=
 =?iso-8859-1?Q?uWxHEsxzUIA7FEyaFZWb0F/wGxJG4nDCDGemigPIcwMM4IkSMLSVFzUYRl?=
 =?iso-8859-1?Q?9k7q70HPDSFtx1bRvvbObJZhtJm6yGO9KXaNSrMPuJWUOqswjq0yBKnajF?=
 =?iso-8859-1?Q?kwOnWbpUVV5mJPFNBis+XX2AiNLZfyGDPsM5tE8V7LWA1Qm7/L0U2l71hk?=
 =?iso-8859-1?Q?lMPQfozjTtc8I7IfoY3vhjfBg0taX7qAyD2oZaScLbLjrmbG2Cg2qdUwgT?=
 =?iso-8859-1?Q?9EppCFs7hQu2e0RZ8f90Oe+T+xMBX80T0H6PNRZiapDvMY5yqC1qILmv3b?=
 =?iso-8859-1?Q?KSMe53FBtzL6pLQkN6t7xKqJZ3M74X3zTpaaUMYLnk7gf7DMsXMTvKFt6L?=
 =?iso-8859-1?Q?ZtpSeBJ5OBdzxtV05pV4YSPjhQrp3Ybb3CR+qN1rohSy6RhL17b7hPopn4?=
 =?iso-8859-1?Q?tqr00S80DUfKBnoKICmstUsGjhC7QNxLL3paKQC/PrGAEipoI1N36knqIo?=
 =?iso-8859-1?Q?F35sk5atjXx/CBvDulcCnWu6lHELegf7KhcGRrC95qFyKUD0HqmEvwy6bJ?=
 =?iso-8859-1?Q?rQxYh06DWJQiU=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CO6PR12MB5491D8AC9F0920FA75D2CD6AF556ACO6PR12MB5491namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5491.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f589c51b-42d9-4829-d084-08ddc4504f12
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 10:05:35.9315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8CgXwah9p9HLOghSwj1thwYKWaxf39Iw+GV/QDEx0LTXIpwLUufYItEpi+tqS+hLJ2a5gXPrmSfAtrmwMWbjPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4102
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

--_000_CO6PR12MB5491D8AC9F0920FA75D2CD6AF556ACO6PR12MB5491namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Philipp, Christian,

I modified the commit msg as:

drm/sched: Remove optimization that causes hang when killing dependent jobs

When application A submits jobs and application B submits a job with a
dependency on A's fence, the normal flow wakes up the scheduler after
processing each job. However, the optimization in
drm_sched_entity_add_dependency_cb() uses a callback that only clears
dependencies without waking up the scheduler.

When application A is killed before its jobs can run, the callback gets
triggered but only clears the dependency without waking up the scheduler,
causing the scheduler to enter sleep state and application B to hang.

Remove the optimization by deleting drm_sched_entity_clear_dep() and its
usage, ensuring the scheduler is always woken up when dependencies are
cleared.

Cc: stable@vger.kernel.org # v4.6+
Fixes: 777dbd458c89 ("drm/amdgpu: drop a dummy wakeup scheduler")
Suggested-by: Christian K=F6nig <Christian.Koenig@amd.com>
Signed-off-by: Lin.Cao <lincao12@amd.com>

Thanks,
Lin


________________________________
From: Philipp Stanner <phasta@mailbox.org>
Sent: Wednesday, July 16, 2025 17:57
To: cao, lin <lin.cao@amd.com>; dri-devel@lists.freedesktop.org <dri-devel@=
lists.freedesktop.org>; phasta@kernel.org <phasta@kernel.org>
Cc: Yin, ZhenGuo (Chris) <ZhenGuo.Yin@amd.com>; Deng, Emily <Emily.Deng@amd=
.com>; Koenig, Christian <Christian.Koenig@amd.com>; dakr@kernel.org <dakr@=
kernel.org>; matthew.brost@intel.com <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/sched: Remove optimization that causes hang when k=
illing dependent jobs

On Wed, 2025-07-16 at 09:43 +0000, cao, lin wrote:
>
> [AMD Official Use Only - AMD Internal Distribution Only]
>
>
>
> Hi Philipp,
>
>
> Thank you for the review. I found that this optimization was
> introduced 9 years ago in commit
> 777dbd458c89d4ca74a659f85ffb5bc817f29a35 ("drm/amdgpu: drop a dummy
> wakeup scheduler").
>
>
> Given that the codebase has undergone significant changes over these
> 9 years. May I ask if I still need to include the Fixes: tag?

Yes. It's a helpful marker to see where the problem comes from, and it
adds redundancy helping the stable-kernel maintainers in figuring out
to which kernels to backport it to.

If stable can't apply a patch to a very old stable kernel because the
code base changed too much, they'll ping us and we might provide a
dedicated fix.

So like that:

Cc: stable@vger.kernel.org # v4.6+
Fixes: 777dbd458c89 ("drm/amdgpu: drop a dummy wakeup scheduler")


P.

>
>
> Thanks,
> Lin
>
>
> From: Philipp Stanner <phasta@mailbox.org>
> Sent: Wednesday, July 16, 2025 16:33
> To: cao, lin <lin.cao@amd.com>; dri-devel@lists.freedesktop.org
> <dri-devel@lists.freedesktop.org>
> Cc: Yin, ZhenGuo (Chris) <ZhenGuo.Yin@amd.com>; Deng, Emily
> <Emily.Deng@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>;
> phasta@kernel.org <phasta@kernel.org>; dakr@kernel.org
> <dakr@kernel.org>; matthew.brost@intel.com <matthew.brost@intel.com>
> Subject: Re: [PATCH] drm/sched: Remove optimization that causes hang
> when killing dependent jobs
>
>
>
>
> On Tue, 2025-07-15 at 21:50 +0800, Lin.Cao wrote:
> > When application A submits jobs and application B submits a job
> > with
> > a
> > dependency on A's fence, the normal flow wakes up the scheduler
> > after
> > processing each job. However, the optimization in
> > drm_sched_entity_add_dependency_cb() uses a callback that only
> > clears
> > dependencies without waking up the scheduler.
> >
> > When application A is killed before its jobs can run, the callback
> > gets
> > triggered but only clears the dependency without waking up the
> > scheduler,
> > causing the scheduler to enter sleep state and application B to
> > hang.
> >
> > Remove the optimization by deleting drm_sched_entity_clear_dep()
> > and
> > its
> > usage, ensuring the scheduler is always woken up when dependencies
> > are
> > cleared.
> >
> > Signed-off-by: Lin.Cao <lincao12@amd.com>
>
> This is, still, a bug fix, so it needs Fixes: and Cc: stable :)
>
> Could also include a Suggested-by: Christian
>
> P.
>
> > ---
> >  drivers/gpu/drm/scheduler/sched_entity.c | 21 ++------------------
> > -
> >  1 file changed, 2 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > b/drivers/gpu/drm/scheduler/sched_entity.c
> > index e671aa241720..ac678de7fe5e 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -355,17 +355,6 @@ void drm_sched_entity_destroy(struct
> > drm_sched_entity *entity)
> >  }
> >  EXPORT_SYMBOL(drm_sched_entity_destroy);
> >
> > -/* drm_sched_entity_clear_dep - callback to clear the entities
> > dependency */
> > -static void drm_sched_entity_clear_dep(struct dma_fence *f,
> > -                                    struct dma_fence_cb *cb)
> > -{
> > -     struct drm_sched_entity *entity =3D
> > -             container_of(cb, struct drm_sched_entity, cb);
> > -
> > -     entity->dependency =3D NULL;
> > -     dma_fence_put(f);
> > -}
> > -
> >  /*
> >   * drm_sched_entity_wakeup - callback to clear the entity's
> > dependency and
> >   * wake up the scheduler
> > @@ -376,7 +365,8 @@ static void drm_sched_entity_wakeup(struct
> > dma_fence *f,
> >       struct drm_sched_entity *entity =3D
> >               container_of(cb, struct drm_sched_entity, cb);
> >
> > -     drm_sched_entity_clear_dep(f, cb);
> > +     entity->dependency =3D NULL;
> > +     dma_fence_put(f);
> >       drm_sched_wakeup(entity->rq->sched);
> >  }
> >
> > @@ -429,13 +419,6 @@ static bool
> > drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
> >               fence =3D dma_fence_get(&s_fence->scheduled);
> >               dma_fence_put(entity->dependency);
> >               entity->dependency =3D fence;
> > -             if (!dma_fence_add_callback(fence, &entity->cb,
> > -
> > drm_sched_entity_clear_dep))
> > -                     return true;
> > -
> > -             /* Ignore it when it is already scheduled */
> > -             dma_fence_put(fence);
> > -             return false;
> >       }
> >
> >       if (!dma_fence_add_callback(entity->dependency, &entity->cb,
>


--_000_CO6PR12MB5491D8AC9F0920FA75D2CD6AF556ACO6PR12MB5491namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
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
Hi Philipp, Christian,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I modified the commit msg as:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
drm/sched: Remove optimization that causes hang when killing dependent jobs=
</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
When application A submits jobs and application B submits a job with a</div=
>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
dependency on A's fence, the normal flow wakes up the scheduler after</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
processing each job. However, the optimization in</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
drm_sched_entity_add_dependency_cb() uses a callback that only clears</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
dependencies without waking up the scheduler.</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
When application A is killed before its jobs can run, the callback gets</di=
v>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
triggered but only clears the dependency without waking up the scheduler,</=
div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
causing the scheduler to enter sleep state and application B to hang.</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
Remove the optimization by deleting drm_sched_entity_clear_dep() and its</d=
iv>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
usage, ensuring the scheduler is always woken up when dependencies are</div=
>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
cleared.</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
Cc: stable@vger.kernel.org # v4.6+</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
Fixes: 777dbd458c89 (&quot;drm/amdgpu: drop a dummy wakeup scheduler&quot;)=
</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
Suggested-by: Christian K=F6nig &lt;Christian.Koenig@amd.com&gt;</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
Signed-off-by: Lin.Cao &lt;lincao12@amd.com&gt;</div>
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
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<b>From:</b>&nbsp;Philipp Stanner &lt;phasta@mailbox.org&gt;<br>
<b>Sent:</b>&nbsp;Wednesday, July 16, 2025 17:57<br>
<b>To:</b>&nbsp;cao, lin &lt;lin.cao@amd.com&gt;; dri-devel@lists.freedeskt=
op.org &lt;dri-devel@lists.freedesktop.org&gt;; phasta@kernel.org &lt;phast=
a@kernel.org&gt;<br>
<b>Cc:</b>&nbsp;Yin, ZhenGuo (Chris) &lt;ZhenGuo.Yin@amd.com&gt;; Deng, Emi=
ly &lt;Emily.Deng@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@amd.c=
om&gt;; dakr@kernel.org &lt;dakr@kernel.org&gt;; matthew.brost@intel.com &l=
t;matthew.brost@intel.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [PATCH] drm/sched: Remove optimization that causes=
 hang when killing dependent jobs
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">On Wed, 2025-07-16 at 09:43 +0000, cao, lin=
 wrote:<br>
&gt;<br>
&gt; [AMD Official Use Only - AMD Internal Distribution Only]<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Hi Philipp,<br>
&gt;<br>
&gt;<br>
&gt; Thank you for the review. I found that this optimization was<br>
&gt; introduced 9 years ago in commit<br>
&gt; 777dbd458c89d4ca74a659f85ffb5bc817f29a35 (&quot;drm/amdgpu: drop a dum=
my<br>
&gt; wakeup scheduler&quot;).<br>
&gt;<br>
&gt;<br>
&gt; Given that the&nbsp;codebase has undergone significant changes over th=
ese<br>
&gt; 9 years. May I ask if I still need to include the Fixes: tag?<br>
<br>
Yes. It's a helpful marker to see where the problem comes from, and it<br>
adds redundancy helping the stable-kernel maintainers in figuring out<br>
to which kernels to backport it to.<br>
<br>
If stable can't apply a patch to a very old stable kernel because the<br>
code base changed too much, they'll ping us and we might provide a<br>
dedicated fix.<br>
<br>
So like that:<br>
<br>
Cc: stable@vger.kernel.org # v4.6+<br>
Fixes: 777dbd458c89 (&quot;drm/amdgpu: drop a dummy wakeup scheduler&quot;)=
<br>
<br>
<br>
P.<br>
<br>
&gt;<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Lin<br>
&gt;<br>
&gt;<br>
&gt; From: Philipp Stanner &lt;phasta@mailbox.org&gt;<br>
&gt; Sent: Wednesday, July 16, 2025 16:33<br>
&gt; To: cao, lin &lt;lin.cao@amd.com&gt;; dri-devel@lists.freedesktop.org<=
br>
&gt; &lt;dri-devel@lists.freedesktop.org&gt;<br>
&gt; Cc: Yin, ZhenGuo (Chris) &lt;ZhenGuo.Yin@amd.com&gt;; Deng, Emily<br>
&gt; &lt;Emily.Deng@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@amd=
.com&gt;;<br>
&gt; phasta@kernel.org &lt;phasta@kernel.org&gt;; dakr@kernel.org<br>
&gt; &lt;dakr@kernel.org&gt;; matthew.brost@intel.com &lt;matthew.brost@int=
el.com&gt;<br>
&gt; Subject: Re: [PATCH] drm/sched: Remove optimization that causes hang<b=
r>
&gt; when killing dependent jobs<br>
&gt;<br>
&gt; &nbsp;<br>
&gt;<br>
&gt;<br>
&gt; On Tue, 2025-07-15 at 21:50 +0800, Lin.Cao wrote:<br>
&gt; &gt; When application A submits jobs and application B submits a job<b=
r>
&gt; &gt; with<br>
&gt; &gt; a<br>
&gt; &gt; dependency on A's fence, the normal flow wakes up the scheduler<b=
r>
&gt; &gt; after<br>
&gt; &gt; processing each job. However, the optimization in<br>
&gt; &gt; drm_sched_entity_add_dependency_cb() uses a callback that only<br=
>
&gt; &gt; clears<br>
&gt; &gt; dependencies without waking up the scheduler.<br>
&gt; &gt;<br>
&gt; &gt; When application A is killed before its jobs can run, the callbac=
k<br>
&gt; &gt; gets<br>
&gt; &gt; triggered but only clears the dependency without waking up the<br=
>
&gt; &gt; scheduler,<br>
&gt; &gt; causing the scheduler to enter sleep state and application B to<b=
r>
&gt; &gt; hang.<br>
&gt; &gt;<br>
&gt; &gt; Remove the optimization by deleting drm_sched_entity_clear_dep()<=
br>
&gt; &gt; and<br>
&gt; &gt; its<br>
&gt; &gt; usage, ensuring the scheduler is always woken up when dependencie=
s<br>
&gt; &gt; are<br>
&gt; &gt; cleared.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Lin.Cao &lt;lincao12@amd.com&gt;<br>
&gt;<br>
&gt; This is, still, a bug fix, so it needs Fixes: and Cc: stable :)<br>
&gt;<br>
&gt; Could also include a Suggested-by: Christian<br>
&gt;<br>
&gt; P.<br>
&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; &nbsp;drivers/gpu/drm/scheduler/sched_entity.c | 21 ++-----------=
-------<br>
&gt; &gt; -<br>
&gt; &gt; &nbsp;1 file changed, 2 insertions(+), 19 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/scheduler/sched_entity.c<br>
&gt; &gt; b/drivers/gpu/drm/scheduler/sched_entity.c<br>
&gt; &gt; index e671aa241720..ac678de7fe5e 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/scheduler/sched_entity.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/scheduler/sched_entity.c<br>
&gt; &gt; @@ -355,17 +355,6 @@ void drm_sched_entity_destroy(struct<br>
&gt; &gt; drm_sched_entity *entity)<br>
&gt; &gt; &nbsp;}<br>
&gt; &gt; &nbsp;EXPORT_SYMBOL(drm_sched_entity_destroy);<br>
&gt; &gt; &nbsp;<br>
&gt; &gt; -/* drm_sched_entity_clear_dep - callback to clear the entities<b=
r>
&gt; &gt; dependency */<br>
&gt; &gt; -static void drm_sched_entity_clear_dep(struct dma_fence *f,<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct d=
ma_fence_cb *cb)<br>
&gt; &gt; -{<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp; struct drm_sched_entity *entity =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; container_of(cb, struct drm_sched_entity, cb);<br>
&gt; &gt; -<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp; entity-&gt;dependency =3D NULL;<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp; dma_fence_put(f);<br>
&gt; &gt; -}<br>
&gt; &gt; -<br>
&gt; &gt; &nbsp;/*<br>
&gt; &gt; &nbsp; * drm_sched_entity_wakeup - callback to clear the entity's=
<br>
&gt; &gt; dependency and<br>
&gt; &gt; &nbsp; * wake up the scheduler<br>
&gt; &gt; @@ -376,7 +365,8 @@ static void drm_sched_entity_wakeup(struct<br=
>
&gt; &gt; dma_fence *f,<br>
&gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_sched_entity *entity =
=3D<br>
&gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; container_of(cb, struct drm_sched_entity, cb);<br>
&gt; &gt; &nbsp;<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp; drm_sched_entity_clear_dep(f, cb);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; entity-&gt;dependency =3D NULL;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; dma_fence_put(f);<br>
&gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_sched_wakeup(entity-&gt;rq-&gt=
;sched);<br>
&gt; &gt; &nbsp;}<br>
&gt; &gt; &nbsp;<br>
&gt; &gt; @@ -429,13 +419,6 @@ static bool<br>
&gt; &gt; drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entit=
y)<br>
&gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; fence =3D dma_fence_get(&amp;s_fence-&gt;scheduled);<br>
&gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; dma_fence_put(entity-&gt;dependency);<br>
&gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; entity-&gt;dependency =3D fence;<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; if (!dma_fence_add_callback(fence, &amp;entity-&gt;cb,<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; &nbsp;&nbsp;&nbsp;<br>
&gt; &gt; drm_sched_entity_clear_dep))<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;<br>
&gt; &gt; -<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; /* Ignore it when it is already scheduled */<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; dma_fence_put(fence);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; return false;<br>
&gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; &nbsp;<br>
&gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!dma_fence_add_callback(entity=
-&gt;dependency, &amp;entity-&gt;cb,<br>
&gt;<br>
<br>
</div>
</div>
</body>
</html>

--_000_CO6PR12MB5491D8AC9F0920FA75D2CD6AF556ACO6PR12MB5491namp_--
