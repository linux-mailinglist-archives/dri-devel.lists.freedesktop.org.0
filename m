Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE194B05712
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 11:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B1010E1E9;
	Tue, 15 Jul 2025 09:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="L7C8GmFB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2076.outbound.protection.outlook.com [40.107.236.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B064810E1E9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 09:51:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AWPLkICyS4svFqFE1Dm5yBHB8klqdZULsvCDsmnyd1C7xIq1zHFufdh7e22QvycGErzNxFlO1Fy6HpIqvjP2VEw/i46Q9S5DzmAUoG1LL9EbYceTEpwRhMESiUnsw/LQ0TTisXBk/3zRtNl+UDrnrgJTiORvM2LtZ8CE66Ymc9hz5U4PLx0p+gW29Dutq7mHmLZ73QFS5v4DqCjCd7+rcdvw12gWapEg27rN9p6xZOIm0t9WStjSeIRw1ihkKD2ku62aaWJpnU5/TDipF0Ip0pCd8jwwpPvAlxQxsXYZ4LdrnqsaBSCeY3ujC6Y/77V9HM8hCXwsXm+xGNJ0sg/BCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtXUc+cSoxlqBUA2Hdy0TMvGQ5AsGAaDDvEPShEwuj8=;
 b=CxI9n5rXeTQTVNuTYx35xAArdxvbYP0MT0Tb9DJ3B9dm4+BhTArZn/Eidv2ne6xTeqeLMK8i0C/6OT5gObXwPpx08j1AD19EFzeL1nH7eAZyT9agZtCmXpBSsQXS92aRq/soG8fb/duE5bd5uVFj0LFi5/uwkTPHBo81R6JGzmYeq2O/nyvUQ+Af957Hjt7YleAjBaxMI/9kCZx8/roU0gDHtQfHgQAnclyF42C5uIZtotDhNMCDxPN1I6ikRZu9FAKP94zvM7U0ctU8wo5rAWMwr/g3bKtUsCK9UXYx0o2XZixml2lWW2s5uS6tJ+V5m6lzPa3BOXaMNUav59xdEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtXUc+cSoxlqBUA2Hdy0TMvGQ5AsGAaDDvEPShEwuj8=;
 b=L7C8GmFBTpk0xazC6V6aO+4yANM3SiUkCN7/fve2enClz8rDrwHkxb0IomSaFT/TEMQNTxUP8ZiElxlCOujgjvOIPm6kEIfZuRUSWCXdh7TluZk4e0uAyANIAue7+006y3JH7IwbqXdjDVeG3/vXTbXmgA64CUnDQ8dnMlifeP4=
Received: from PH0PR12MB5497.namprd12.prod.outlook.com (2603:10b6:510:eb::22)
 by DM4PR12MB6661.namprd12.prod.outlook.com (2603:10b6:8:b7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.35; Tue, 15 Jul 2025 09:51:49 +0000
Received: from PH0PR12MB5497.namprd12.prod.outlook.com
 ([fe80::662f:f49f:2ba1:ca55]) by PH0PR12MB5497.namprd12.prod.outlook.com
 ([fe80::662f:f49f:2ba1:ca55%3]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 09:51:49 +0000
From: "cao, lin" <lin.cao@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "phasta@kernel.org"
 <phasta@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Yin, ZhenGuo (Chris)" <ZhenGuo.Yin@amd.com>, "Deng, Emily"
 <Emily.Deng@amd.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "matthew.brost@intel.com" <matthew.brost@intel.com>
Subject: Re: [PATCH v2] drm/scheduler: Fix sched hang when killing app with
 dependent jobs
Thread-Topic: [PATCH v2] drm/scheduler: Fix sched hang when killing app with
 dependent jobs
Thread-Index: AQHb9Ifle3aMOyNGSECQ7l7yFOLmX7QxkXAAgAAGNYCAAAVZgIAAA2OAgADpj8+AAF4dAIAACh43
Date: Tue, 15 Jul 2025 09:51:49 +0000
Message-ID: <PH0PR12MB54974724ECC2262A6F00AE18F557A@PH0PR12MB5497.namprd12.prod.outlook.com>
References: <20250714062349.588235-1-lincao12@amd.com>
 <87d61f5b7809828a55caf779b10a90be802fe83a.camel@mailbox.org>
 <a8e473bd-6ea8-41e0-b5b2-10c420e5a935@amd.com>
 <70d9c6a43846c3a3c266d4a7a431c1c4b3fcd05f.camel@mailbox.org>
 <164c69fe-9ab1-4e04-8103-b25e4804e74d@amd.com>
 <PH0PR12MB549781447809324DF9A7E0D6F557A@PH0PR12MB5497.namprd12.prod.outlook.com>
 <8dc0a31c06d33f45bbcb32d8805579015db91b21.camel@mailbox.org>
In-Reply-To: <8dc0a31c06d33f45bbcb32d8805579015db91b21.camel@mailbox.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-15T09:51:49.1260000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5497:EE_|DM4PR12MB6661:EE_
x-ms-office365-filtering-correlation-id: 1a6ff64b-126f-47e4-77a9-08ddc38537db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?Windows-1252?Q?4TBxtCT4DvacCTri4w2majOr5o+5ZwvXsiPE8vdN0+IKUUvEQoXj59PM?=
 =?Windows-1252?Q?0ms6ORoBk4iRd2R0Xrl4RlU0MASUISnr252ifMcPbrx9gK8cb7+qig+o?=
 =?Windows-1252?Q?LFBOy2G0KGSvsIWWUMVRxtFqdjR6QaWn6rtQ4j2bow2GGOLsfN009Bgb?=
 =?Windows-1252?Q?4J+wO2Xy+PmMgead0fvNymXM4Y2HLVeprbWC3t5ybKtUdHkWXvfm49P2?=
 =?Windows-1252?Q?FTjJStlMv2XS1QrTevd6cTaWzJf4ibeFZoVbhX/bSHoVYUbY+3vTY/95?=
 =?Windows-1252?Q?PX4DiMS4Rmv1jSMyYFtBap1+DnWoee/4ixdAOkaylF1JqPXm8cakdU52?=
 =?Windows-1252?Q?ohFLlvdHlA40WObiZrzExEojZ2KjvMRKAeX/YEjVyLKlowqGC6Xa9aKU?=
 =?Windows-1252?Q?6b/5JX9dPBqcCx1pl5jsXiwNws5WRFnRsKPwCSz5MiNa/+82Mt6hdpXA?=
 =?Windows-1252?Q?jlvCeYLPmTBEElhl/r29jDghc1uhYxtnvjR/HM9hIqucvXlTGMF/fMpi?=
 =?Windows-1252?Q?1+BIPwDU/vmh7sOBQQX0epu6/zIAhRd+0xeVolXGrAqzy2KqBYWiEOu/?=
 =?Windows-1252?Q?w2FnSQk3qbYec1u+AXMVvN47m2YBcq7HuAHS46iHiJzxkmc9ucywmd1S?=
 =?Windows-1252?Q?LIqBwvcVPu4sBwu8kEtF2ukLsQH+Vq4dP5y2H4nhnwM8TwMEn7FB7IDc?=
 =?Windows-1252?Q?5hIKJTVRPQIyi3i7a33k4ZvZv+6YVT1Ms0dgj26nEzOhsDyI3LRpJ91n?=
 =?Windows-1252?Q?K49fC/CHaWmbXu9JuISalf1wH0UyrkYlXUP+AoVIPc8CVAQlBvaDIOfs?=
 =?Windows-1252?Q?4cCQ9DN+8groyLUiehKeBsA9kP1lzIkRq3/rxDdNQa+flx3ZkLlR2hMr?=
 =?Windows-1252?Q?AqGjmfD/4jssQmY9y86EPhSueNJz8gLLHxAI7VKywuB+qyHX/td2gdjh?=
 =?Windows-1252?Q?a4uBhPu9shcV5eJrnIJpaWX7eRQnPlwBG1Dj5kFxrYCMnfcPlZPJHmOD?=
 =?Windows-1252?Q?4wkvfGZZVtp0CIsrtaehMztP6RInfQsTyQRTNAfbAGzZYeDUDXTRfToy?=
 =?Windows-1252?Q?BXvQ75nb4LSITVPUSG88sMA42FEaOdXLCKdwb3iEHpA9Yex/c7zCBtBh?=
 =?Windows-1252?Q?22RJACRjsPD4CZpJyzmM747eXTTIzDPN2YJ66eXdhp7ezgyUDMm1CrYo?=
 =?Windows-1252?Q?8/iac7enBlygqWXKD4GIUdwtbvTX83tbaCU0hPKRGG6l0QHCtrxX67+N?=
 =?Windows-1252?Q?OgKKdw29uU16irk1Tn/csCw0CjeNLSOcKALiqEXa6dDPky2pQrx86sg7?=
 =?Windows-1252?Q?KWSZwV+dwBI+LheJNyyWCkRRtTOINp7ocnRzPPCJNf3WAfYMQg+nt26V?=
 =?Windows-1252?Q?56nJqvED7gszwyeBCdaktnhx0rcqVsRP4SKcDpfmdIwBlpAxkeJeKLJ7?=
 =?Windows-1252?Q?ysuw3zp3VvPoB680EB48Aun0kgjawDknMHMEfcMG2YHoGKNvWHE5mqGw?=
 =?Windows-1252?Q?7S9GBDSQmswH3wCOGzRPSkYZvbZnKOcwYX7JtzJOz0LYp2I2Y9TnQVxN?=
 =?Windows-1252?Q?Yd7PrgMpVuojvbBPl280klniV45x9AJw13DfaA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5497.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?pQSro+bUIR+o0pVURNt6TKihKovbqYXLM3/cog/ukx9+JkYTThZrdDCn?=
 =?Windows-1252?Q?d2s1nVJvuSpXaQxaYsU2LJVkKNzFKjXVqvWBp0xKqT9WDg3Re5cGA6mU?=
 =?Windows-1252?Q?eAQiy1FU1zg4mlSV8e9HoNKxqTCxHUBpgY9YC2yBI/COXGvFDK7Ge0jZ?=
 =?Windows-1252?Q?jWHRD+A15LCmoZkjqe5Sce3OYpczPyAF0SBvIudwqs7kn4F4zIhxLpb6?=
 =?Windows-1252?Q?pCd5cuPP+wp1O5YlWoIIMjQAh8OOVH4pViEtg1ZyueB9uok3DDkalThv?=
 =?Windows-1252?Q?dt98uyORwEFi6m04Mp8hbOKQqIQY7l6LRfX0v42xSOnVJMe7oSd7B5Tu?=
 =?Windows-1252?Q?+LpHlUJFsbFXJk/1bgwuEaR22NGxOTvfyPhNgS/ycRF7kSu1i70XwmX1?=
 =?Windows-1252?Q?mNHn6oSuIjZB8+zeSgHUf3ESWUD7wGk4ecLf78ga557xa6Nw+xIkT/fe?=
 =?Windows-1252?Q?S2IjGfj2mpnwAuHD/yrFKlaAyptnhdw+UpGpbfxzkuxKaBW+erjYodPn?=
 =?Windows-1252?Q?YznQ6Z7z7cWFnlWZpe4lFQLyceWxmkBWor1qtJz/MaM4LAfrPHYr4LXC?=
 =?Windows-1252?Q?tLbDilDFln3+F7EPUft1C69xVlIfIgapj2aTyRuhUVmlOgTB8aenUnIK?=
 =?Windows-1252?Q?NSwkWnKjf6vNVO62Sdnvcx/a4dZhMfS4k51H1ytx9TV2Da9td3U/6TbX?=
 =?Windows-1252?Q?JVayS6gNNDL+6zIaIxJcUKSy0P2JHZxHqMxGy0Jysh1/AFkD3AYLEFw2?=
 =?Windows-1252?Q?R1qr7wrgHXIyIdFiKltfWaGnag7UkXqorwmyxtUMwT76B7DTSPm/xsa2?=
 =?Windows-1252?Q?CGqrf9gKCqttNJZyN1C2tNkwvWaxX0ZMUXGVB2Ro8TD8JyqPmjtf+YCR?=
 =?Windows-1252?Q?TWHciq2F70DWbAZBP2zGMC+Hrvb8SsCUQ27J5c3SAwVPoec4oztmWPOP?=
 =?Windows-1252?Q?mYVfpD+AGr3vvDabmxen5/BecvLysOcJWqQ+PHsLSXgoQ3ReMz8cfCnx?=
 =?Windows-1252?Q?Z9Gpy1rLBaW0cQn/OU2cZ01dOr0NHYSrlTYfwvJqzIITZBY51fkrYMsX?=
 =?Windows-1252?Q?eCHpJJaFHdYazBux9IsIHaDp+AubgF1h1jdGwntK2I0mcCeFb6DUw9Qx?=
 =?Windows-1252?Q?aKxAaycyY4I3aRevJwnNPeXYmK10LSAbxaSKCOvl4DMP5xXWlzQ8OXvH?=
 =?Windows-1252?Q?1c+9T+pvFqtmEIj6KJhw1yW2dwanDlK1GrLpG/XJF7etUp7hfy7gixQY?=
 =?Windows-1252?Q?DSvLsWlyzckSNJ/JNY0JAXddvbzVBh5zWhZKcs1RaaH+HpkH/rizyOU0?=
 =?Windows-1252?Q?SeOJh4DnVNHvYMpofw4xxdrph/U31W/bTuxKqhDirR74/4HDGrqRFxwt?=
 =?Windows-1252?Q?1+Z/sbeTnAeKWx+wPYQ7lfMqSXiJQHlKvWzoMdpBZGJm2XUCKAQ/Yd7C?=
 =?Windows-1252?Q?8WRyr7bWjLE/lXG9sgHpJ6LvW7Y0ARF/Or8WUCneGFfRnhp65aTgrb9T?=
 =?Windows-1252?Q?4WGaW8XQLUn2HL/TStPy0f3XghukQ4W7KJM6KgfrrfJpmyRmOo7bmZ6E?=
 =?Windows-1252?Q?YNTJ98+/mjNA5tVRQVRnHEksYDt0uJdFqrNpqsjvwC3jmeSEDXwBO4tO?=
 =?Windows-1252?Q?QCobwOGKQcQHSiMmaiEHUYxJ+gIP74W2uZlJDk5urrefF++fxvtJjGMw?=
 =?Windows-1252?Q?Cc7HcPCj9Ak=3D?=
Content-Type: multipart/alternative;
 boundary="_000_PH0PR12MB54974724ECC2262A6F00AE18F557APH0PR12MB5497namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5497.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6ff64b-126f-47e4-77a9-08ddc38537db
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 09:51:49.1430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2cV2T80Ka8FIeBlXWVWSg8GXbKnv0aMFUtlWevqKZqkQTbE0Wo+zAHsrxfBHby5R8H4qso1Z+/o/0gz4md6vrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6661
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

--_000_PH0PR12MB54974724ECC2262A6F00AE18F557APH0PR12MB5497namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Philipp,

Thanks for your review, let me try to clarify why I added drm_sched_wakeup(=
) to drm_sched_entity_kill_jobs_work():

When application A submits jobs (a1, a2, a3) and application B submits job =
b1 with a dependency on a1's scheduled fence, the normal execution flow is =
(function drm_sched_run_job_work()):
1. a1 gets popped from the entity by the scheduler
2. run_job(a1) executes
3. a1's scheduled fence gets signaled
4. drm_sched_run_job_work() calls drm_sched_run_job_queue() at the end
5. The scheduler wakes up and re-selects entities to pop jobs
6. Since b1's dependency is cleared, the scheduler can select b1 and contin=
ue the same flow

However, if application A is killed before a1 gets popped by the scheduler,=
 then a1, a2, a3 are killed sequentially by drm_sched_entity_kill_jobs_cb()=
. During the kill process, their scheduled fences are still signaled, but t=
he kill process itself lacks work_run_job. This means b1's dependency gets =
cleared, but there's no work_run_job to drive the scheduler to continue run=
ning, or we can say step 4 in the normal flow is missing, and the scheduler=
 enters sleep state, which causes application B to hang.
So if we add drm_sched_wakeup() in drm_sched_entity_kill_jobs_work() after =
drm_sched_fence_scheduled(), the scheduler can be woken up, and application=
 B can continue running after a1's scheduled fence is force signaled.

Thanks,
Lin

________________________________
From: Philipp Stanner <phasta@mailbox.org>
Sent: Tuesday, July 15, 2025 17:12
To: cao, lin <lin.cao@amd.com>; Koenig, Christian <Christian.Koenig@amd.com=
>; phasta@kernel.org <phasta@kernel.org>; dri-devel@lists.freedesktop.org <=
dri-devel@lists.freedesktop.org>
Cc: Yin, ZhenGuo (Chris) <ZhenGuo.Yin@amd.com>; Deng, Emily <Emily.Deng@amd=
.com>; dakr@kernel.org <dakr@kernel.org>; matthew.brost@intel.com <matthew.=
brost@intel.com>
Subject: Re: [PATCH v2] drm/scheduler: Fix sched hang when killing app with=
 dependent jobs

On Tue, 2025-07-15 at 03:38 +0000, cao, lin wrote:
>
> [AMD Official Use Only - AMD Internal Distribution Only]
>
>
>
> Hi Christian, Philipp,
>
>
> I modified the commit msg, and I hope it makes more sense:
>
>
> drm/sched: wake up scheduler when killing jobs to prevent hang

nit:
s/wake/Wake

>
>
> When application A submits jobs (a1, a2, a3) and application B submits
> job b1 with a dependency on a2's scheduler fence, killing application A
> before run_job(a1) causes drm_sched_entity_kill_jobs_work() to force
> signal all jobs sequentially. However, the optimization in
> drm_sched_entity_add_dependency_cb() waits for the fence to be scheduled
> by adding a callback (drm_sched_entity_clear_dep) instead of immediately
> waking up the scheduler. When A is killed before its jobs can run, the
> callback gets triggered but drm_sched_entity_clear_dep() only clears the
> dependency without waking up the scheduler, causing the scheduler to ente=
r
> sleep state and application B to hang.

That now reads as if drm_sched_entity_clear_dep() is supposed to wake
up the scheduler. But you add the wakeup to a different function (the
work item).

Also the code actually looks like that:


                xa_erase(&job->dependencies, index);
                if (f && !dma_fence_add_callback(f, &job->finish_cb,
                                                 drm_sched_entity_kill_jobs=
_cb))
                        return;

                dma_fence_put(f);
        }

        INIT_WORK(&job->work, drm_sched_entity_kill_jobs_work);
        schedule_work(&job->work);
}

So if adding that callback succeeds we.. return immediately but we.. do
that for the first dependency, not for all of them?

Oh boy. That code base. We(tm) should look into pimping that up. Also
lacks documentation everywhere.


Anyways. If this solves a bug for you the patch looks fine (i.e., not
potentially harmful) by me and if the tests succeed we can merge it.
However, I'd feel better if you could clarify more why that function is
the right place to solve the bug.


Thanks,
P.


>
>
> Add drm_sched_wakeup() in entity_kill_job_work() to prevent scheduler
> sleep and subsequent application hangs.
>
>
> v2:
> - Move drm_sched_wakeup() to after drm_sched_fence_scheduled()
>
>
> Thanks,
> Lin
>
>
> From: Koenig, Christian <Christian.Koenig@amd.com>
> Sent: Monday, July 14, 2025 21:39
> To: phasta@kernel.org <phasta@kernel.org>; cao, lin <lin.cao@amd.com>; dr=
i-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
> Cc: Yin, ZhenGuo (Chris) <ZhenGuo.Yin@amd.com>; Deng, Emily <Emily.Deng@a=
md.com>; dakr@kernel.org <dakr@kernel.org>; matthew.brost@intel.com <matthe=
w.brost@intel.com>
> Subject: Re: [PATCH v2] drm/scheduler: Fix sched hang when killing app wi=
th dependent jobs
>
>
>
>
> On 14.07.25 15:27, Philipp Stanner wrote:
> > On Mon, 2025-07-14 at 15:08 +0200, Christian K=F6nig wrote:
> > >
> > >
> > > On 14.07.25 14:46, Philipp Stanner wrote:
> > > > regarding the patch subject: the prefix we use for the scheduler
> > > > is:
> > > > drm/sched:
> > > >
> > > >
> > > > On Mon, 2025-07-14 at 14:23 +0800, Lin.Cao wrote:
> > > >
> > > > > When Application A submits jobs (a1, a2, a3) and application B
> > > > > submits
> > > >
> > > > s/Application/application
> > > >
> > > > > job b1 with a dependency on a2's scheduler fence, killing
> > > > > application A
> > > > > before run_job(a1) causes drm_sched_entity_kill_jobs_work() to
> > > > > force
> > > > > signal all jobs sequentially. However, due to missing
> > > > > work_run_job or
> > > > > work_free_job
> > > > >
> > > >
> > > > You probably mean "due to the work items work_run_job and
> > > > work_free_job
> > > > not being started [=85]".
> > > >
> > > > However, the call you add, drm_sched_wakeup(), immediately only
> > > > triggers work_run_job. It's not clear to me why you mention
> > > > work_free_job, because drm_sched_entity_kill_jobs_work() directly
> > > > invokes the free_job() callback.
> > >
> > > Yeah the description is rather confusing, took me more than one try
> > > to understand what's going on here as well. Let me try to explain it
> > > in my words:
> > >
> > > When an application A is killed the pending submissions from it are
> > > not executed, but rather torn down by
> > > drm_sched_entity_kill_jobs_work().
> > >
> > > If now a submission from application B depends on something
> > > application A wanted to do on the same scheduler instance the
> > > function drm_sched_entity_add_dependency_cb() would have optimized
> > > this dependency and assumed that the scheduler work would already run
> > > and try to pick a job.
> > >
> > > But that isn't the case when the submissions from application A are
> > > all killed. So make sure to start the scheduler work from
> > > drm_sched_entity_kill_jobs_work() to handle that case.
> >
> > Alright, so the bug then depends on B setting a dependency on A _after_
> > A was killed, doesn't it? Because the optimization in
> > _add_dependency_cb() can only have an effect after A's jobs have been
> > torn down.
>
> No, application A and application B submit right behind each other. Appli=
cation A is then killed later on.
>
> The optimization in _add_dependency_cb() just waits for As submission to =
be handled by the scheduler, but that never happens because it was killed.
>
> > If there is such a timing order problem, the commit message should
> > mention it.
> >
> > The commit message definitely also needs to mention this optimization
> > in drm_sched_entity_add_dependency_cb() since it's essential for
> > understanding the bug.
>
> +1
>
> Christian.
>
> >
> >
> > Danke
> > P.
> >
> >
> > >
> > > Regards,
> > > Christian.
> > >
> > > >
> > > > >  in entity_kill_job_work(), the scheduler enters sleep
> > > > > state, causing application B hang.
> > > >
> > > > So the issue is that if a1 never ran, the scheduler will not
> > > > continue
> > > > with the jobs of application B, correct?
> > > >
> > > > >
> > > > > Add drm_sched_wakeup() when entity_kill_job_work() to preventing
> > > >
> > > > s/to preventing/to prevent
> > > >
> > > > > scheduler sleep and subsequent application hangs.
> > > > >
> > > > > v2:
> > > > > - Move drm_sched_wakeup() to after drm_sched_fence_scheduled()
> > > >
> > > > Changelogs are cool and useful, but move them below the Signed-off
> > > > area
> > > > with another --- please, like so:
> > > >
> > > > Signed-off by: =85
> > > > ---
> > > > v2:
> > > > =85
> > > > ---
> > > > drivers/gpu/drm/scheduler/sched_entity.c | 1 +
> > > >
> > > >
> > > > >
> > > > > Signed-off-by: Lin.Cao <lincao12@amd.com>
> > > >
> > > > This fixes a bug. Even a racy bug, it seems. So we need a Fixes tag
> > > > and
> > > > put the stable kernel in CC.
> > > >
> > > > Please figure out with git blame, git log and git tag --contains
> > > > which
> > > > commit your patch fixes and which is the oldest kernel that
> > > > contains
> > > > the bug. Then add a Fixes: tag and Cc: the stable kernel. You'll
> > > > find
> > > > lots of examples for that in git log.
> > > >
> > > >
> > > > Thx
> > > > P.
> > > >
> > > > > ---
> > > > >  drivers/gpu/drm/scheduler/sched_entity.c | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > index e671aa241720..66f2a43c58fd 100644
> > > > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > @@ -177,6 +177,7 @@ static void
> > > > > drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
> > > > >    struct drm_sched_job *job =3D container_of(wrk,
> > > > > typeof(*job), work);
> > > > >
> > > > >    drm_sched_fence_scheduled(job->s_fence, NULL);
> > > > > +  drm_sched_wakeup(job->sched);
> > > > >    drm_sched_fence_finished(job->s_fence, -ESRCH);
> > > > >    WARN_ON(job->s_fence->parent);
> > > > >    job->sched->ops->free_job(job);
> > > >
> > >
> >
>


--_000_PH0PR12MB54974724ECC2262A6F00AE18F557APH0PR12MB5497namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
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
Thanks for your review, let me try to clarify why I added drm_sched_wakeup(=
) to drm_sched_entity_kill_jobs_work():</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
When application A submits jobs (a1, a2, a3) and application B submits job =
b1 with a dependency on a1's scheduled fence, the normal execution flow is =
(function drm_sched_run_job_work()):</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
1. a1 gets popped from the entity by the scheduler</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
2. run_job(a1) executes</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
3. a1's scheduled fence gets signaled&nbsp;</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
4. drm_sched_run_job_work() calls drm_sched_run_job_queue() at the end</div=
>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
5. The scheduler wakes up and re-selects entities to pop jobs</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
6. Since b1's dependency is cleared, the scheduler can select b1 and contin=
ue the same flow</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
However, if application A is killed before a1 gets popped by the scheduler,=
 then a1, a2, a3 are killed sequentially by drm_sched_entity_kill_jobs_cb()=
. During the kill process, their scheduled fences are still signaled, but t=
he kill process itself lacks work_run_job.
 This means b1's dependency gets cleared, but there's no work_run_job to dr=
ive the scheduler to continue running, or we can say
<b>step 4 in the normal flow is missing</b>, and the scheduler enters sleep=
 state, which causes application B to hang.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
So if we add drm_sched_wakeup() in drm_sched_entity_kill_jobs_work() after =
drm_sched_fence_scheduled(), the scheduler can be woken up, and application=
 B can continue running after a1's scheduled fence is force signaled.</div>
<div id=3D"appendonsend"></div>
<div><br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Lin</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Philipp Stanner &lt;phasta@mailbox.org&gt;<br>
<b>Sent:</b>&nbsp;Tuesday, July 15, 2025 17:12<br>
<b>To:</b>&nbsp;cao, lin &lt;lin.cao@amd.com&gt;; Koenig, Christian &lt;Chr=
istian.Koenig@amd.com&gt;; phasta@kernel.org &lt;phasta@kernel.org&gt;; dri=
-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;<br>
<b>Cc:</b>&nbsp;Yin, ZhenGuo (Chris) &lt;ZhenGuo.Yin@amd.com&gt;; Deng, Emi=
ly &lt;Emily.Deng@amd.com&gt;; dakr@kernel.org &lt;dakr@kernel.org&gt;; mat=
thew.brost@intel.com &lt;matthew.brost@intel.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [PATCH v2] drm/scheduler: Fix sched hang when kill=
ing app with dependent jobs
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">On Tue, 2025-07-15 at 03:38 +0000, cao, lin=
 wrote:<br>
&gt;<br>
&gt; [AMD Official Use Only - AMD Internal Distribution Only]<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Hi Christian, Philipp,<br>
&gt;<br>
&gt;<br>
&gt; I modified&nbsp;the commit msg, and I hope it makes more&nbsp;sense:<b=
r>
&gt;<br>
&gt;<br>
&gt; drm/sched: wake up scheduler when killing jobs to prevent hang<br>
<br>
nit:<br>
s/wake/Wake<br>
<br>
&gt;<br>
&gt;<br>
&gt; When application A submits jobs (a1, a2, a3) and application B submits=
<br>
&gt; job b1 with a dependency on a2's scheduler fence, killing application =
A<br>
&gt; before run_job(a1) causes drm_sched_entity_kill_jobs_work() to force<b=
r>
&gt; signal all jobs sequentially. However, the optimization in<br>
&gt; drm_sched_entity_add_dependency_cb() waits for the fence to be schedul=
ed<br>
&gt; by adding a callback (drm_sched_entity_clear_dep) instead of immediate=
ly<br>
&gt; waking up the scheduler. When A is killed before its jobs can run, the=
<br>
&gt; callback gets triggered but drm_sched_entity_clear_dep() only clears t=
he<br>
&gt; dependency without waking up the scheduler, causing the scheduler to e=
nter<br>
&gt; sleep state and application B to hang.<br>
<br>
That now reads as if drm_sched_entity_clear_dep() is supposed to wake<br>
up the scheduler. But you add the wakeup to a different function (the<br>
work item).<br>
<br>
Also the code actually looks like that:<br>
<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; xa_erase(&amp;job-&gt;dependencies, index);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (f &amp;&amp; !dma_fence_add_callback(f, &amp;job-&gt;fi=
nish_cb,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_sched_e=
ntity_kill_jobs_cb))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; dma_fence_put(f);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INIT_WORK(&amp;job-&gt;work, drm=
_sched_entity_kill_jobs_work);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; schedule_work(&amp;job-&gt;work)=
;<br>
}<br>
<br>
So if adding that callback succeeds we.. return immediately but we.. do<br>
that for the first dependency, not for all of them?<br>
<br>
Oh boy. That code base. We(tm) should look into pimping that up. Also<br>
lacks documentation everywhere.<br>
<br>
<br>
Anyways. If this solves a bug for you the patch looks fine (i.e., not<br>
potentially harmful) by me and if the tests succeed we can merge it.<br>
However, I'd feel better if you could clarify more why that function is<br>
the right place to solve the bug.<br>
<br>
<br>
Thanks,<br>
P.<br>
<br>
<br>
&gt;<br>
&gt;<br>
&gt; Add drm_sched_wakeup() in entity_kill_job_work() to prevent scheduler<=
br>
&gt; sleep and subsequent application hangs.<br>
&gt;<br>
&gt;<br>
&gt; v2:<br>
&gt; - Move drm_sched_wakeup() to after drm_sched_fence_scheduled()<br>
&gt;<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Lin<br>
&gt;<br>
&gt;<br>
&gt; From: Koenig, Christian &lt;Christian.Koenig@amd.com&gt;<br>
&gt; Sent: Monday, July 14, 2025 21:39<br>
&gt; To: phasta@kernel.org &lt;phasta@kernel.org&gt;; cao, lin &lt;lin.cao@=
amd.com&gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedeskto=
p.org&gt;<br>
&gt; Cc: Yin, ZhenGuo (Chris) &lt;ZhenGuo.Yin@amd.com&gt;; Deng, Emily &lt;=
Emily.Deng@amd.com&gt;; dakr@kernel.org &lt;dakr@kernel.org&gt;; matthew.br=
ost@intel.com &lt;matthew.brost@intel.com&gt;<br>
&gt; Subject: Re: [PATCH v2] drm/scheduler: Fix sched hang when killing app=
 with dependent jobs<br>
&gt;<br>
&gt; &nbsp;<br>
&gt;<br>
&gt;<br>
&gt; On 14.07.25 15:27, Philipp Stanner wrote:<br>
&gt; &gt; On Mon, 2025-07-14 at 15:08 +0200, Christian K=F6nig wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On 14.07.25 14:46, Philipp Stanner wrote:<br>
&gt; &gt; &gt; &gt; regarding the patch subject: the prefix we use for the =
scheduler<br>
&gt; &gt; &gt; &gt; is:<br>
&gt; &gt; &gt; &gt; drm/sched:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Mon, 2025-07-14 at 14:23 +0800, Lin.Cao wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; When Application A submits jobs (a1, a2, a3) and a=
pplication B<br>
&gt; &gt; &gt; &gt; &gt; submits<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; s/Application/application<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; job b1 with a dependency on a2's scheduler fence, =
killing<br>
&gt; &gt; &gt; &gt; &gt; application A<br>
&gt; &gt; &gt; &gt; &gt; before run_job(a1) causes drm_sched_entity_kill_jo=
bs_work() to<br>
&gt; &gt; &gt; &gt; &gt; force<br>
&gt; &gt; &gt; &gt; &gt; signal all jobs sequentially. However, due to miss=
ing<br>
&gt; &gt; &gt; &gt; &gt; work_run_job or<br>
&gt; &gt; &gt; &gt; &gt; work_free_job<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; You probably mean &quot;due to the work items work_run_=
job and<br>
&gt; &gt; &gt; &gt; work_free_job<br>
&gt; &gt; &gt; &gt; not being started [=85]&quot;.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; However, the call you add, drm_sched_wakeup(), immediat=
ely only<br>
&gt; &gt; &gt; &gt; triggers work_run_job. It's not clear to me why you men=
tion<br>
&gt; &gt; &gt; &gt; work_free_job, because drm_sched_entity_kill_jobs_work(=
) directly<br>
&gt; &gt; &gt; &gt; invokes the free_job() callback.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Yeah the description is rather confusing, took me more than =
one try<br>
&gt; &gt; &gt; to understand what's going on here as well. Let me try to ex=
plain it<br>
&gt; &gt; &gt; in my words:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; When an application A is killed the pending submissions from=
 it are<br>
&gt; &gt; &gt; not executed, but rather torn down by<br>
&gt; &gt; &gt; drm_sched_entity_kill_jobs_work().<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; If now a submission from application B depends on something<=
br>
&gt; &gt; &gt; application A wanted to do on the same scheduler instance th=
e<br>
&gt; &gt; &gt; function drm_sched_entity_add_dependency_cb() would have opt=
imized<br>
&gt; &gt; &gt; this dependency and assumed that the scheduler work would al=
ready run<br>
&gt; &gt; &gt; and try to pick a job.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; But that isn't the case when the submissions from applicatio=
n A are<br>
&gt; &gt; &gt; all killed. So make sure to start the scheduler work from<br=
>
&gt; &gt; &gt; drm_sched_entity_kill_jobs_work() to handle that case.<br>
&gt; &gt;<br>
&gt; &gt; Alright, so the bug then depends on B setting a dependency on A _=
after_<br>
&gt; &gt; A was killed, doesn't it? Because the optimization in<br>
&gt; &gt; _add_dependency_cb() can only have an effect after A's jobs have =
been<br>
&gt; &gt; torn down.<br>
&gt;<br>
&gt; No, application A and application B submit right behind each other. Ap=
plication A is then killed later on.<br>
&gt;<br>
&gt; The optimization in _add_dependency_cb() just waits for As submission =
to be handled by the scheduler, but that never happens because it was kille=
d.<br>
&gt;<br>
&gt; &gt; If there is such a timing order problem, the commit message shoul=
d<br>
&gt; &gt; mention it.<br>
&gt; &gt;<br>
&gt; &gt; The commit message definitely also needs to mention this optimiza=
tion<br>
&gt; &gt; in drm_sched_entity_add_dependency_cb() since it's essential for<=
br>
&gt; &gt; understanding the bug.<br>
&gt;<br>
&gt; +1<br>
&gt;<br>
&gt; Christian.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Danke<br>
&gt; &gt; P.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Regards,<br>
&gt; &gt; &gt; Christian.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &nbsp;in entity_kill_job_work(), the scheduler ent=
ers sleep<br>
&gt; &gt; &gt; &gt; &gt; state, causing application B hang.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; So the issue is that if a1 never ran, the scheduler wil=
l not<br>
&gt; &gt; &gt; &gt; continue<br>
&gt; &gt; &gt; &gt; with the jobs of application B, correct?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Add drm_sched_wakeup() when entity_kill_job_work()=
 to preventing<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; s/to preventing/to prevent<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; scheduler sleep and subsequent application hangs.<=
br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; v2:<br>
&gt; &gt; &gt; &gt; &gt; - Move drm_sched_wakeup() to after drm_sched_fence=
_scheduled()<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Changelogs are cool and useful, but move them below the=
 Signed-off<br>
&gt; &gt; &gt; &gt; area<br>
&gt; &gt; &gt; &gt; with another --- please, like so:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off by: =85<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; v2:<br>
&gt; &gt; &gt; &gt; =85<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; drivers/gpu/drm/scheduler/sched_entity.c | 1 +<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Lin.Cao &lt;lincao12@amd.com&gt;<br=
>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This fixes a bug. Even a racy bug, it seems. So we need=
 a Fixes tag<br>
&gt; &gt; &gt; &gt; and<br>
&gt; &gt; &gt; &gt; put the stable kernel in CC.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Please figure out with git blame, git log and git tag -=
-contains<br>
&gt; &gt; &gt; &gt; which<br>
&gt; &gt; &gt; &gt; commit your patch fixes and which is the oldest kernel =
that<br>
&gt; &gt; &gt; &gt; contains<br>
&gt; &gt; &gt; &gt; the bug. Then add a Fixes: tag and Cc: the stable kerne=
l. You'll<br>
&gt; &gt; &gt; &gt; find<br>
&gt; &gt; &gt; &gt; lots of examples for that in git log.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Thx<br>
&gt; &gt; &gt; &gt; P.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; &nbsp;drivers/gpu/drm/scheduler/sched_entity.c | 1=
 +<br>
&gt; &gt; &gt; &gt; &gt; &nbsp;1 file changed, 1 insertion(+)<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; diff --git a/drivers/gpu/drm/scheduler/sched_entit=
y.c<br>
&gt; &gt; &gt; &gt; &gt; b/drivers/gpu/drm/scheduler/sched_entity.c<br>
&gt; &gt; &gt; &gt; &gt; index e671aa241720..66f2a43c58fd 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/drivers/gpu/drm/scheduler/sched_entity.c<br>
&gt; &gt; &gt; &gt; &gt; +++ b/drivers/gpu/drm/scheduler/sched_entity.c<br>
&gt; &gt; &gt; &gt; &gt; @@ -177,6 +177,7 @@ static void<br>
&gt; &gt; &gt; &gt; &gt; drm_sched_entity_kill_jobs_work(struct work_struct=
 *wrk)<br>
&gt; &gt; &gt; &gt; &gt; &nbsp;&nbsp; struct drm_sched_job *job =3D contain=
er_of(wrk,<br>
&gt; &gt; &gt; &gt; &gt; typeof(*job), work);<br>
&gt; &gt; &gt; &gt; &gt; &nbsp;<br>
&gt; &gt; &gt; &gt; &gt; &nbsp;&nbsp; drm_sched_fence_scheduled(job-&gt;s_f=
ence, NULL);<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp; drm_sched_wakeup(job-&gt;sched);<br>
&gt; &gt; &gt; &gt; &gt; &nbsp;&nbsp; drm_sched_fence_finished(job-&gt;s_fe=
nce, -ESRCH);<br>
&gt; &gt; &gt; &gt; &gt; &nbsp;&nbsp; WARN_ON(job-&gt;s_fence-&gt;parent);<=
br>
&gt; &gt; &gt; &gt; &gt; &nbsp;&nbsp; job-&gt;sched-&gt;ops-&gt;free_job(jo=
b);<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
<br>
</div>
</div>
</body>
</html>

--_000_PH0PR12MB54974724ECC2262A6F00AE18F557APH0PR12MB5497namp_--
