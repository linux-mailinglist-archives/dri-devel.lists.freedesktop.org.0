Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6482FB04F2F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 05:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDDD10E136;
	Tue, 15 Jul 2025 03:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="j06nQir6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B5A10E136
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 03:39:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQLBxrlM15LzVI8sCRfvYHQhAzbii1gqIdmwbDQa+4j4pl/GNMa46EYDwTmfrxNjfexnCynA/mKhI/QKVufVlCBP5mdZ9NCUlr0/D9vxJGdTN/PGMbwl+rQRslM97/chvbjp8jJMxh2uvrFT+BJ0dLIZ9Be/hJiJijQfrT+76x/UkBW5XQTuKOVwpn+lGTGeeq4rTJGeyLQB/VLdoPuSm6wpF/LqQXZmpRopa90LpXsbcywHoSEYABZHIxMaU6e5mAAkPSDGa9xccrnoxiYhudGYn/XvrNcl5WUqO5OQe8+XK8XS1zhVvcWVNeE/igAa3IHoGqFH20Eu62ZDm8deKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRnAryXvy+aqsj+AAkLQGxhKExP+D/gzd61lCe65XY8=;
 b=YO5/CgRmht7pmffEyDNm+EQJ0tVaEUdK5DiWc9kanHw2Ni8+atvHX8/lTmEZAQs4scxSRXo4T360mefwKRvAQL7qPsg7t0GR7E4VZ74KvHzAKNZN13YJDPHKV4Zuj/iYK8ekU+VPu32vFxdVhztlDQqcZpYkbirpG8Bdwktw0/LSNKtqXt7BKRF6jDPATry9i4TyQ3dZEaKvUUa3DvupEqYkHnIWnPhByUsKePQ5Cn7D4tJXeC9VYWEf/kRQ8bhxdg96gwY3Qtk7PtxdINM0E9EIaAhLVW9uAhwzMO5/UThf0P1F/6otpjqosoQwly/JvjZNlc6+UJ8Trqh2asDwsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRnAryXvy+aqsj+AAkLQGxhKExP+D/gzd61lCe65XY8=;
 b=j06nQir6qIwmVmEqiEra34QBcQsmd9H/2RqdXi3bugAIi22F9OyNYpnf6WOABfYEYzJ0hn8w36K5FGYMAnLJwFqcwPyqSBQh18CT/+Uul1OzGVVSMJGIjRexeOB+XCQuBX7/gOonZFXnUZ0xsX5TWqSnrCKWqZAyIHVAVMVe7EU=
Received: from PH0PR12MB5497.namprd12.prod.outlook.com (2603:10b6:510:eb::22)
 by SJ5PPF7B9E98CB6.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::99a) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 15 Jul
 2025 03:38:55 +0000
Received: from PH0PR12MB5497.namprd12.prod.outlook.com
 ([fe80::662f:f49f:2ba1:ca55]) by PH0PR12MB5497.namprd12.prod.outlook.com
 ([fe80::662f:f49f:2ba1:ca55%3]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 03:38:55 +0000
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
Thread-Index: AQHb9Ifle3aMOyNGSECQ7l7yFOLmX7QxkXAAgAAGNYCAAAVZgIAAA2OAgADpj88=
Date: Tue, 15 Jul 2025 03:38:54 +0000
Message-ID: <PH0PR12MB549781447809324DF9A7E0D6F557A@PH0PR12MB5497.namprd12.prod.outlook.com>
References: <20250714062349.588235-1-lincao12@amd.com>
 <87d61f5b7809828a55caf779b10a90be802fe83a.camel@mailbox.org>
 <a8e473bd-6ea8-41e0-b5b2-10c420e5a935@amd.com>
 <70d9c6a43846c3a3c266d4a7a431c1c4b3fcd05f.camel@mailbox.org>
 <164c69fe-9ab1-4e04-8103-b25e4804e74d@amd.com>
In-Reply-To: <164c69fe-9ab1-4e04-8103-b25e4804e74d@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-15T03:38:55.0620000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5497:EE_|SJ5PPF7B9E98CB6:EE_
x-ms-office365-filtering-correlation-id: 5064eaf9-c17d-474a-46c4-08ddc3511fc6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|8096899003|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?Windows-1252?Q?GiwOv2LpBDkDHuN6e5E8cXWOzWbxHowyV6mdgtWlmVHJE3eJSR++y+QT?=
 =?Windows-1252?Q?96z7qujG3TJN5u02bkdtXks1AFC6P3DCFgfq6pzNBOeTAlulK0AlVjGw?=
 =?Windows-1252?Q?7FSgyTHkRITzT7/8AuV2iMmOJnT7l8PaCxZVThz9ePbEhdwxe+vO2XPM?=
 =?Windows-1252?Q?h3WNOOa17r9E+1mo9odYaZA1jexGx/lP1Oa3qc1m9bZDsfFlS0anVacZ?=
 =?Windows-1252?Q?ef8ZqupatqDpI+3B6KqkMN/XJCfCgJvv7IflYjMmaEQytTGkMtN9AzSo?=
 =?Windows-1252?Q?6tEFPxp+ShKZZz6DbRhjmff+SQsxEnt+mJDKnQqegJqH6fmf0fCVuV2y?=
 =?Windows-1252?Q?Pj9VGK3siXWzZyLGnQ40WeZNmBhqDzexmq3fwbfkSapBbXJGcKWbOW+V?=
 =?Windows-1252?Q?9+Utl5M8SKepcXnNd7/M3WUeeqNGN2NsIiz2zPD23kfRUSx/Ixs0ryiP?=
 =?Windows-1252?Q?lyzUKUdWuBzKKVbgZKc6brKHyzml+7E2gCwUVDmgR6/CB3o0mJNsVksL?=
 =?Windows-1252?Q?7gIJj/eSVxdoLYuXSx8cYMheB960Fv6ul1G3UChN3X2ZCio1LPhn0Z9w?=
 =?Windows-1252?Q?Cs3T9fXaMk8O6g5gC5SobgDckPEUxJXGCp6GdfCy3rvZ1hH4BZUTI/Ed?=
 =?Windows-1252?Q?h+dHN1yg7LVZaMCRwBYm9GLteWBNofexo/FKdvW2KA23haynBGr/Kg9J?=
 =?Windows-1252?Q?cjr1H5SpcWO8M1woFENTqkNeYiIBMxxBCVGcrOIGKzLQ6DQCZPD0nzKh?=
 =?Windows-1252?Q?C4NhguTbEphS+c3zvwlXXwFgLlJB3ejotKlNFMAm3BVSZ5ocSUxLT97P?=
 =?Windows-1252?Q?MpYDon/jxSavXv/1W6cWmwUFFG9mYOoEiaLn1Tli/Vo9KymyrAtTmzEg?=
 =?Windows-1252?Q?xEYG56r6JODAIWa49ABe+hbocPXKa4ChVnRqW6jTZvUToE/yzrmSWRY1?=
 =?Windows-1252?Q?4sIy56ijMps+u6hTb7vB+cYxogGKBLBthBrrh0IhlH/LEC0y4eXSo0AL?=
 =?Windows-1252?Q?zV35DQONwXCo1rV5xsyR5lGITpEOnowD57Y3HRE2QNQF7WQzybp0eEn3?=
 =?Windows-1252?Q?CuATL0YB/SzoSD/fCjK8qHDskVqWBPn/y27WexVniFykX3dcQL/DBk/z?=
 =?Windows-1252?Q?PEBVRUdMP3g0FoYKDtnUcs2GujOKJ9+YB8P6a5vifDkAayLKFBvDIx4J?=
 =?Windows-1252?Q?X9Vtc4bqrS2TM0ubO2cf0BX9CrXBtwbyccSK5Jdj4cs+Fjn3v0+sIb1e?=
 =?Windows-1252?Q?LiYQXonOICGDeJMXNNZ9Mswc2BpAOS+ZYGpYu6+pXKNgmgHeLpGRITic?=
 =?Windows-1252?Q?vbYrA3PkcgpZXrtfGML/OdnNhD6zXQJ6HyOWyL7IoKS9R/cvkn05b2MU?=
 =?Windows-1252?Q?go/5P7mablPUo0Y3ygaLKNODpzmnzxwJzLH6eM+3Qr+0IXN2uWnhlpID?=
 =?Windows-1252?Q?MSbO1fyugWnmgdxJozLhKLjB4LKOWn2+28yi53Iij2lcNFlHMhJIOegk?=
 =?Windows-1252?Q?hCAAM8NWq36lRoX76QT8TX4uhORXbzDlk07goGMaRGH2IeAiBRnKzgqx?=
 =?Windows-1252?Q?cVscRho+0qgNzYvE43ZtHvjXLpJ5Va6wnWU6TQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5497.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?9IvVldYkMjpInLH7hMos6nqotRqLnHNIf2TJnDSlo60FqxzEnDMCEuD7?=
 =?Windows-1252?Q?GK+y/uLg75cjVsVMfoqPbkdM2sELETYXADYs11b0Fle0hIw4lIPsXeMj?=
 =?Windows-1252?Q?XEninPqedntIKA7uFZYPghteKTydrzdNXFew0l+w12c0FLPuT7e9JLOC?=
 =?Windows-1252?Q?E9gAoEoLewxt9/dCDOg6x3DmwD0kWzmrtF52RkBJWkNswWYIXAbVDaGI?=
 =?Windows-1252?Q?1oPAy+8hqfye78r+cdXjyRfTVFP2zb3LjYjoOMHb0sGTF6tG/dgjQOYe?=
 =?Windows-1252?Q?2mVuaG1b1DR42WUYfR/5VArwizKPw6NX5wC6xBwG8b9cjcLo7J6Hs60U?=
 =?Windows-1252?Q?GUhtL+xy0pZghnJGc8WYSA5StTm1vigQur0aKKocuWN6FlLH3KbQd4IS?=
 =?Windows-1252?Q?i+EI/CTuusG1D8lRD6RDhZA+rMHiD+FxbuTzSed7FKPg23hOCFbh5chO?=
 =?Windows-1252?Q?zVfd9p/Tp0UjJqRnyFMcAB8JnzBnCPMf3Tyl6tPsw35NbaO7yOw8hO3e?=
 =?Windows-1252?Q?1a7X1SvxB/VMVELpB7pHmzVjZD62i3GKE+Ysv3oJzrkxpqQ810MQqRLH?=
 =?Windows-1252?Q?qqG2Uy6HsGFtJ/P/OajZKIp6SNXZczNg4utfPre49I+NhxnvQEXSDk4R?=
 =?Windows-1252?Q?Mq7ZtU7Kgr232rTmFviT6enQo4wQ6Mr26xkgB2nR3Lwo16t3QiS5euVe?=
 =?Windows-1252?Q?MW68jmmzpytGDuQvXmJdEA5t1LVFAGQOksApfrZWMjwSjyNkKm8OXHNO?=
 =?Windows-1252?Q?nF2cOKJjuGiwBWPeIOjpGpg2AS/O+UFcJvBamiu/xJ1hdP5Ex6hhFqyE?=
 =?Windows-1252?Q?FRs0ruv0PymcLlRJOfBlS/PbaMHXgbWU3JL53jH3HCdk9lsQns90cGNp?=
 =?Windows-1252?Q?XbNuTWKYcZD1wSCPKBXXiE0Lrng7qbAIjo18eZe3c421qmX2b4Jn3bFs?=
 =?Windows-1252?Q?AWq8CVSvziyIHpJPhURZM7ZBvL9vWeng1xvchJ42/qD7JkogblfiZ/qi?=
 =?Windows-1252?Q?sTMKnGolaeidQSD3JxxPkSA/2GeiBwQtYUOPHiNraEm54/0fheVY5VDZ?=
 =?Windows-1252?Q?3KHIz0QekO6/xyx9D2fzw07XNUKTixPxwGBzf0wu1rJvqbLm/A0jFXe2?=
 =?Windows-1252?Q?QcIaOTLQYAfv+KuphinNIzvBoEDIZ5U2rf6hqADrA8dB2CTXB5nEjvmt?=
 =?Windows-1252?Q?ZIiOKyYCBCyj/DzCFHM6cTpL7abdqOkkE2FMpco6zHGOFcMdYHuVzhep?=
 =?Windows-1252?Q?+9yPRTMmUnzIZXj/FWMC0KmhjrQgVy3nmOEdENr31CTSVCdU4qdZqaak?=
 =?Windows-1252?Q?5i2XXoFf7OBAwC4Xy31vyqNvvgH7B/7dQ6OvpKs5+V7paSKMWzggTxxC?=
 =?Windows-1252?Q?NvqhP6bnnsMwJDpKbDgCN9ph6HbCvqcZ05V/kc2/P7uoN1QRFKwHFXjy?=
 =?Windows-1252?Q?jU1BqRMWSQW9OA1rM37dE12wu/MJwwCupFOucFFN9Flh4WVY/E+PFD5a?=
 =?Windows-1252?Q?1ArNPmAWJ3gSppQOQJAlRvTZ9k6/Nku1b7puCPjFY35bAxbEgTsvSYVc?=
 =?Windows-1252?Q?6ZFRW446A1zS9sNu/t+COuY+xv79W9pb7tf/qh+WR8TAV68RhMq9o0D+?=
 =?Windows-1252?Q?pW5ILSg5xxe17/22LQPopCwyV7hU50rpXuwYp6b2/V1bpmi2wTWu108A?=
 =?Windows-1252?Q?NyKt/caSAuM=3D?=
Content-Type: multipart/alternative;
 boundary="_000_PH0PR12MB549781447809324DF9A7E0D6F557APH0PR12MB5497namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5497.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5064eaf9-c17d-474a-46c4-08ddc3511fc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 03:38:54.9251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5DcONdX0CGPWuHkmxNovwMDOpJ1nntVDDL8kOYwhxTJZgn4ZfyVQZcLa9qHqX2L4ZwjiVaTmSrWptfzb+jCbIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7B9E98CB6
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

--_000_PH0PR12MB549781447809324DF9A7E0D6F557APH0PR12MB5497namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Christian, Philipp,

I modified the commit msg, and I hope it makes more sense:

drm/sched: wake up scheduler when killing jobs to prevent hang

When application A submits jobs (a1, a2, a3) and application B submits
job b1 with a dependency on a2's scheduler fence, killing application A
before run_job(a1) causes drm_sched_entity_kill_jobs_work() to force
signal all jobs sequentially. However, the optimization in
drm_sched_entity_add_dependency_cb() waits for the fence to be scheduled
by adding a callback (drm_sched_entity_clear_dep) instead of immediately
waking up the scheduler. When A is killed before its jobs can run, the
callback gets triggered but drm_sched_entity_clear_dep() only clears the
dependency without waking up the scheduler, causing the scheduler to enter
sleep state and application B to hang.

Add drm_sched_wakeup() in entity_kill_job_work() to prevent scheduler
sleep and subsequent application hangs.

v2:
- Move drm_sched_wakeup() to after drm_sched_fence_scheduled()

Thanks,
Lin
________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Monday, July 14, 2025 21:39
To: phasta@kernel.org <phasta@kernel.org>; cao, lin <lin.cao@amd.com>; dri-=
devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
Cc: Yin, ZhenGuo (Chris) <ZhenGuo.Yin@amd.com>; Deng, Emily <Emily.Deng@amd=
.com>; dakr@kernel.org <dakr@kernel.org>; matthew.brost@intel.com <matthew.=
brost@intel.com>
Subject: Re: [PATCH v2] drm/scheduler: Fix sched hang when killing app with=
 dependent jobs

On 14.07.25 15:27, Philipp Stanner wrote:
> On Mon, 2025-07-14 at 15:08 +0200, Christian K=F6nig wrote:
>>
>>
>> On 14.07.25 14:46, Philipp Stanner wrote:
>>> regarding the patch subject: the prefix we use for the scheduler
>>> is:
>>> drm/sched:
>>>
>>>
>>> On Mon, 2025-07-14 at 14:23 +0800, Lin.Cao wrote:
>>>
>>>> When Application A submits jobs (a1, a2, a3) and application B
>>>> submits
>>>
>>> s/Application/application
>>>
>>>> job b1 with a dependency on a2's scheduler fence, killing
>>>> application A
>>>> before run_job(a1) causes drm_sched_entity_kill_jobs_work() to
>>>> force
>>>> signal all jobs sequentially. However, due to missing
>>>> work_run_job or
>>>> work_free_job
>>>>
>>>
>>> You probably mean "due to the work items work_run_job and
>>> work_free_job
>>> not being started [=85]".
>>>
>>> However, the call you add, drm_sched_wakeup(), immediately only
>>> triggers work_run_job. It's not clear to me why you mention
>>> work_free_job, because drm_sched_entity_kill_jobs_work() directly
>>> invokes the free_job() callback.
>>
>> Yeah the description is rather confusing, took me more than one try
>> to understand what's going on here as well. Let me try to explain it
>> in my words:
>>
>> When an application A is killed the pending submissions from it are
>> not executed, but rather torn down by
>> drm_sched_entity_kill_jobs_work().
>>
>> If now a submission from application B depends on something
>> application A wanted to do on the same scheduler instance the
>> function drm_sched_entity_add_dependency_cb() would have optimized
>> this dependency and assumed that the scheduler work would already run
>> and try to pick a job.
>>
>> But that isn't the case when the submissions from application A are
>> all killed. So make sure to start the scheduler work from
>> drm_sched_entity_kill_jobs_work() to handle that case.
>
> Alright, so the bug then depends on B setting a dependency on A _after_
> A was killed, doesn't it? Because the optimization in
> _add_dependency_cb() can only have an effect after A's jobs have been
> torn down.

No, application A and application B submit right behind each other. Applica=
tion A is then killed later on.

The optimization in _add_dependency_cb() just waits for As submission to be=
 handled by the scheduler, but that never happens because it was killed.

> If there is such a timing order problem, the commit message should
> mention it.
>
> The commit message definitely also needs to mention this optimization
> in drm_sched_entity_add_dependency_cb() since it's essential for
> understanding the bug.

+1

Christian.

>
>
> Danke
> P.
>
>
>>
>> Regards,
>> Christian.
>>
>>>
>>>>  in entity_kill_job_work(), the scheduler enters sleep
>>>> state, causing application B hang.
>>>
>>> So the issue is that if a1 never ran, the scheduler will not
>>> continue
>>> with the jobs of application B, correct?
>>>
>>>>
>>>> Add drm_sched_wakeup() when entity_kill_job_work() to preventing
>>>
>>> s/to preventing/to prevent
>>>
>>>> scheduler sleep and subsequent application hangs.
>>>>
>>>> v2:
>>>> - Move drm_sched_wakeup() to after drm_sched_fence_scheduled()
>>>
>>> Changelogs are cool and useful, but move them below the Signed-off
>>> area
>>> with another --- please, like so:
>>>
>>> Signed-off by: =85
>>> ---
>>> v2:
>>> =85
>>> ---
>>> drivers/gpu/drm/scheduler/sched_entity.c | 1 +
>>>
>>>
>>>>
>>>> Signed-off-by: Lin.Cao <lincao12@amd.com>
>>>
>>> This fixes a bug. Even a racy bug, it seems. So we need a Fixes tag
>>> and
>>> put the stable kernel in CC.
>>>
>>> Please figure out with git blame, git log and git tag --contains
>>> which
>>> commit your patch fixes and which is the oldest kernel that
>>> contains
>>> the bug. Then add a Fixes: tag and Cc: the stable kernel. You'll
>>> find
>>> lots of examples for that in git log.
>>>
>>>
>>> Thx
>>> P.
>>>
>>>> ---
>>>>  drivers/gpu/drm/scheduler/sched_entity.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> index e671aa241720..66f2a43c58fd 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -177,6 +177,7 @@ static void
>>>> drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
>>>>    struct drm_sched_job *job =3D container_of(wrk,
>>>> typeof(*job), work);
>>>>
>>>>    drm_sched_fence_scheduled(job->s_fence, NULL);
>>>> +  drm_sched_wakeup(job->sched);
>>>>    drm_sched_fence_finished(job->s_fence, -ESRCH);
>>>>    WARN_ON(job->s_fence->parent);
>>>>    job->sched->ops->free_job(job);
>>>
>>
>


--_000_PH0PR12MB549781447809324DF9A7E0D6F557APH0PR12MB5497namp_
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
Hi Christian, Philipp,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I modified&nbsp;the commit msg, and I hope it makes more&nbsp;sense:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
drm/sched: wake up scheduler when killing jobs to prevent hang</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
When application A submits jobs (a1, a2, a3) and application B submits</div=
>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
job b1 with a dependency on a2's scheduler fence, killing application A</di=
v>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
before run_job(a1) causes drm_sched_entity_kill_jobs_work() to force</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
signal all jobs sequentially. However, the optimization in</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
drm_sched_entity_add_dependency_cb() waits for the fence to be scheduled</d=
iv>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
by adding a callback (drm_sched_entity_clear_dep) instead of immediately</d=
iv>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
waking up the scheduler. When A is killed before its jobs can run, the</div=
>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
callback gets triggered but drm_sched_entity_clear_dep() only clears the</d=
iv>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
dependency without waking up the scheduler, causing the scheduler to enter<=
/div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
sleep state and application B to hang.</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
Add drm_sched_wakeup() in entity_kill_job_work() to prevent scheduler</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
sleep and subsequent application hangs.</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
v2:</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
- Move drm_sched_wakeup() to after drm_sched_fence_scheduled()</div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Koenig, Christian &lt=
;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b> Monday, July 14, 2025 21:39<br>
<b>To:</b> phasta@kernel.org &lt;phasta@kernel.org&gt;; cao, lin &lt;lin.ca=
o@amd.com&gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesk=
top.org&gt;<br>
<b>Cc:</b> Yin, ZhenGuo (Chris) &lt;ZhenGuo.Yin@amd.com&gt;; Deng, Emily &l=
t;Emily.Deng@amd.com&gt;; dakr@kernel.org &lt;dakr@kernel.org&gt;; matthew.=
brost@intel.com &lt;matthew.brost@intel.com&gt;<br>
<b>Subject:</b> Re: [PATCH v2] drm/scheduler: Fix sched hang when killing a=
pp with dependent jobs</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 14.07.25 15:27, Philipp Stanner wrote:<br>
&gt; On Mon, 2025-07-14 at 15:08 +0200, Christian K=F6nig wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 14.07.25 14:46, Philipp Stanner wrote:<br>
&gt;&gt;&gt; regarding the patch subject: the prefix we use for the schedul=
er<br>
&gt;&gt;&gt; is:<br>
&gt;&gt;&gt; drm/sched:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Mon, 2025-07-14 at 14:23 +0800, Lin.Cao wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; When Application A submits jobs (a1, a2, a3) and applicati=
on B<br>
&gt;&gt;&gt;&gt; submits<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; s/Application/application<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; job b1 with a dependency on a2's scheduler fence, killing<=
br>
&gt;&gt;&gt;&gt; application A<br>
&gt;&gt;&gt;&gt; before run_job(a1) causes drm_sched_entity_kill_jobs_work(=
) to<br>
&gt;&gt;&gt;&gt; force<br>
&gt;&gt;&gt;&gt; signal all jobs sequentially. However, due to missing<br>
&gt;&gt;&gt;&gt; work_run_job or<br>
&gt;&gt;&gt;&gt; work_free_job<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; You probably mean &quot;due to the work items work_run_job and=
<br>
&gt;&gt;&gt; work_free_job<br>
&gt;&gt;&gt; not being started [=85]&quot;.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; However, the call you add, drm_sched_wakeup(), immediately onl=
y<br>
&gt;&gt;&gt; triggers work_run_job. It's not clear to me why you mention<br=
>
&gt;&gt;&gt; work_free_job, because drm_sched_entity_kill_jobs_work() direc=
tly<br>
&gt;&gt;&gt; invokes the free_job() callback.<br>
&gt;&gt;<br>
&gt;&gt; Yeah the description is rather confusing, took me more than one tr=
y<br>
&gt;&gt; to understand what's going on here as well. Let me try to explain =
it<br>
&gt;&gt; in my words:<br>
&gt;&gt;<br>
&gt;&gt; When an application A is killed the pending submissions from it ar=
e<br>
&gt;&gt; not executed, but rather torn down by<br>
&gt;&gt; drm_sched_entity_kill_jobs_work().<br>
&gt;&gt;<br>
&gt;&gt; If now a submission from application B depends on something<br>
&gt;&gt; application A wanted to do on the same scheduler instance the<br>
&gt;&gt; function drm_sched_entity_add_dependency_cb() would have optimized=
<br>
&gt;&gt; this dependency and assumed that the scheduler work would already =
run<br>
&gt;&gt; and try to pick a job.<br>
&gt;&gt;<br>
&gt;&gt; But that isn't the case when the submissions from application A ar=
e<br>
&gt;&gt; all killed. So make sure to start the scheduler work from<br>
&gt;&gt; drm_sched_entity_kill_jobs_work() to handle that case.<br>
&gt; <br>
&gt; Alright, so the bug then depends on B setting a dependency on A _after=
_<br>
&gt; A was killed, doesn't it? Because the optimization in<br>
&gt; _add_dependency_cb() can only have an effect after A's jobs have been<=
br>
&gt; torn down.<br>
<br>
No, application A and application B submit right behind each other. Applica=
tion A is then killed later on.<br>
<br>
The optimization in _add_dependency_cb() just waits for As submission to be=
 handled by the scheduler, but that never happens because it was killed.<br=
>
<br>
&gt; If there is such a timing order problem, the commit message should<br>
&gt; mention it.<br>
&gt; <br>
&gt; The commit message definitely also needs to mention this optimization<=
br>
&gt; in drm_sched_entity_add_dependency_cb() since it's essential for<br>
&gt; understanding the bug.<br>
<br>
+1<br>
<br>
Christian.<br>
<br>
&gt; <br>
&gt; <br>
&gt; Danke<br>
&gt; P.<br>
&gt; <br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Christian.<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; &nbsp;in entity_kill_job_work(), the scheduler enters slee=
p<br>
&gt;&gt;&gt;&gt; state, causing application B hang.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; So the issue is that if a1 never ran, the scheduler will not<b=
r>
&gt;&gt;&gt; continue<br>
&gt;&gt;&gt; with the jobs of application B, correct?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Add drm_sched_wakeup() when entity_kill_job_work() to prev=
enting<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; s/to preventing/to prevent<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; scheduler sleep and subsequent application hangs.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; v2:<br>
&gt;&gt;&gt;&gt; - Move drm_sched_wakeup() to after drm_sched_fence_schedul=
ed()<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Changelogs are cool and useful, but move them below the Signed=
-off<br>
&gt;&gt;&gt; area<br>
&gt;&gt;&gt; with another --- please, like so:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off by: =85<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; v2:<br>
&gt;&gt;&gt; =85<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; drivers/gpu/drm/scheduler/sched_entity.c | 1 +<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Lin.Cao &lt;lincao12@amd.com&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This fixes a bug. Even a racy bug, it seems. So we need a Fixe=
s tag<br>
&gt;&gt;&gt; and<br>
&gt;&gt;&gt; put the stable kernel in CC.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Please figure out with git blame, git log and git tag --contai=
ns<br>
&gt;&gt;&gt; which<br>
&gt;&gt;&gt; commit your patch fixes and which is the oldest kernel that<br=
>
&gt;&gt;&gt; contains<br>
&gt;&gt;&gt; the bug. Then add a Fixes: tag and Cc: the stable kernel. You'=
ll<br>
&gt;&gt;&gt; find<br>
&gt;&gt;&gt; lots of examples for that in git log.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thx<br>
&gt;&gt;&gt; P.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt; &nbsp;drivers/gpu/drm/scheduler/sched_entity.c | 1 +<br>
&gt;&gt;&gt;&gt; &nbsp;1 file changed, 1 insertion(+)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; diff --git a/drivers/gpu/drm/scheduler/sched_entity.c<br>
&gt;&gt;&gt;&gt; b/drivers/gpu/drm/scheduler/sched_entity.c<br>
&gt;&gt;&gt;&gt; index e671aa241720..66f2a43c58fd 100644<br>
&gt;&gt;&gt;&gt; --- a/drivers/gpu/drm/scheduler/sched_entity.c<br>
&gt;&gt;&gt;&gt; +++ b/drivers/gpu/drm/scheduler/sched_entity.c<br>
&gt;&gt;&gt;&gt; @@ -177,6 +177,7 @@ static void<br>
&gt;&gt;&gt;&gt; drm_sched_entity_kill_jobs_work(struct work_struct *wrk)<b=
r>
&gt;&gt;&gt;&gt; &nbsp;&nbsp; struct drm_sched_job *job =3D container_of(wr=
k,<br>
&gt;&gt;&gt;&gt; typeof(*job), work);<br>
&gt;&gt;&gt;&gt; &nbsp;<br>
&gt;&gt;&gt;&gt; &nbsp;&nbsp; drm_sched_fence_scheduled(job-&gt;s_fence, NU=
LL);<br>
&gt;&gt;&gt;&gt; +&nbsp; drm_sched_wakeup(job-&gt;sched);<br>
&gt;&gt;&gt;&gt; &nbsp;&nbsp; drm_sched_fence_finished(job-&gt;s_fence, -ES=
RCH);<br>
&gt;&gt;&gt;&gt; &nbsp;&nbsp; WARN_ON(job-&gt;s_fence-&gt;parent);<br>
&gt;&gt;&gt;&gt; &nbsp;&nbsp; job-&gt;sched-&gt;ops-&gt;free_job(job);<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_PH0PR12MB549781447809324DF9A7E0D6F557APH0PR12MB5497namp_--
