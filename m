Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE16AB93FE
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 04:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 913D810E991;
	Fri, 16 May 2025 02:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kAimtgWs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2075.outbound.protection.outlook.com [40.107.102.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F03B10E991;
 Fri, 16 May 2025 02:21:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBXPOWnM5CVt7KjoiqFAfmO+Vh1mTYV2xt2Z2bZZX02+7/4oCSNhFanLfRpS7pwWCwitOHBL93fQKHdDNrQmx+S+mNtzXZUGeQ7PCeU4I0IBOrTgL/FoS4bqu1oXN76frhUbrBG3XfcKzFnHcY/4MLQkqKRax+gsb2T6ppAJhz2/4maRGlX0MQ8AVt2o+60nzOjV+ZtcF99m5rTXAWrfNq/ZNEMxuKY6eJc2fPwDtOnozT6X8XkMpPgcVRpOTq53Ga1kovR+opW9GMQXc2RbXrtUJrYX8mwPWDhyJsFDMuba+7j/eDSMhreWwMKopG+UTVp8e/9aTQqqJCFkeEZ+NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/ia9kuPnmGyfafDRbctMw9zru+nV8AZALEPq4RpAOc=;
 b=o3mAlJudkGh+2/gjI1QnR5T8LIZIJ1P/zoEQFZVNW4vVg48ycLrzmGCvVlVD+7kwxAsRWGeJmot96XiF/Awbo27IwvC7m3Qscrw4F0a5dQLU2h3H2IiBTPagSywyhlRCjmxaJWs8O9MfhcpZK8SjuNwnj+4ZeIt8t0VFPiuwYOngXcDF3oOjZrvpOHvV5rnzCSIzoTSr6GA8Z2vKDN6byYuvTJbIvxiAzE5LcZR8R/U9g/OhUFmTMN9EB9E6/d9H67UV1RCREG4dVoOzBtH3l6aSLqgAGcrjiF4hjX1UzdAjjpSp+OxvNJPCkSXd54p07BZ9mwOarAmuNC+I381FDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/ia9kuPnmGyfafDRbctMw9zru+nV8AZALEPq4RpAOc=;
 b=kAimtgWsAmUJNQzhRuR41uIscsAXfbPrdxYkQznYE51xKKLXkGnsXXQmPwQMvBdbZocQ2h7k4YWPf80QybEyKterhjaHIBN4FC44maHcMawczJbF7F1hww2k4jTuS4ULwY4MV6jh7sA/Cz5tiYsCMXh9bJoZuCheB73epxRWW98=
Received: from PH0PR12MB5497.namprd12.prod.outlook.com (2603:10b6:510:eb::22)
 by SJ0PR12MB6709.namprd12.prod.outlook.com (2603:10b6:a03:44a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 16 May
 2025 02:21:02 +0000
Received: from PH0PR12MB5497.namprd12.prod.outlook.com
 ([fe80::662f:f49f:2ba1:ca55]) by PH0PR12MB5497.namprd12.prod.outlook.com
 ([fe80::662f:f49f:2ba1:ca55%6]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 02:21:01 +0000
From: "cao, lin" <lin.cao@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "phasta@kernel.org"
 <phasta@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
CC: "Chang, HaiJun" <HaiJun.Chang@amd.com>, "Yin, ZhenGuo (Chris)"
 <ZhenGuo.Yin@amd.com>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH] drm/scheduler: signal scheduled fence when kill job
Thread-Topic: [PATCH] drm/scheduler: signal scheduled fence when kill job
Thread-Index: AQHbxT4YJAcpLYAUuk66vDTfCxsUbLPTYbKAgAAEvwCAADvdgIAA4wIw
Date: Fri, 16 May 2025 02:21:01 +0000
Message-ID: <PH0PR12MB5497CABD981161A39BF2EDB2F593A@PH0PR12MB5497.namprd12.prod.outlook.com>
References: <20250515020713.1110476-1-lincao12@amd.com>
 <74e69f8c-a918-478d-b3f1-24c405abbb71@amd.com>
 <5c1f021f4aa808f2cd5d8da76e40662ba10b97d6.camel@mailbox.org>
 <7fa0a034-80ae-45c9-84bf-9841f9b28a93@amd.com>
In-Reply-To: <7fa0a034-80ae-45c9-84bf-9841f9b28a93@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-16T02:21:01.856Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5497:EE_|SJ0PR12MB6709:EE_
x-ms-office365-filtering-correlation-id: 74e5b19b-c3e3-461e-634d-08dd94204da2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?zGwY4UFYDdq0h0uwMUebPyr+YKtPh+zmpO9yxdtE/uMlJTD53t9Ip3IW3O?=
 =?iso-8859-1?Q?WcKag+RcoCklNaUvc895yL4wBvVQB/0bP1fo+t5FaDp7lQxVarlbzIgH2E?=
 =?iso-8859-1?Q?PyTBtbaebtSIHYu179SJfdG9EMH4dSGzgcaLHPJmLFjE/iEMY5kkVs8Mdw?=
 =?iso-8859-1?Q?XCG/zy6XMkhPRYfj0rl6IgGdH8xPvEG6EIgLMA2C8+NwDzPvFr/fTV5IsS?=
 =?iso-8859-1?Q?KW0E5PtWgfxWO50JGln6umNBkloiQx1Tb0GbNTkuDJPUEP+xhMMNdXSsxd?=
 =?iso-8859-1?Q?sQsXTxvXw3omnJ3+CoY3RlscmLlq0Ii+XehaiFSVdc/OUNfo8UufKcY7ZR?=
 =?iso-8859-1?Q?O+/1c2UtNYkAxU/EMuw6jQSSg2B+CFrIeFCSvYRxJXbBgxWkbZCx8Z/oLK?=
 =?iso-8859-1?Q?QdJx+zbz4Lyy1YcCU+ZwyUrkKruTgK3nD5uPr/cPCTFKidkVDgfSftSCKQ?=
 =?iso-8859-1?Q?qWHJtCl9ZCB54p/9y/Wi1ymZheSDeQaTe972m01v2Zt7vI0crsWsFSWiX7?=
 =?iso-8859-1?Q?xNKbDuO7f0J1sZYFs0NBtEil/VuTPj7+589MbzIoXD8wAN8GuwsVqINpDr?=
 =?iso-8859-1?Q?lBJBfv4xKXMI+kJQQk5Qf1qOrXAwOrmb+ngn1bFF/m4AfMpDBVuvWYIjeo?=
 =?iso-8859-1?Q?PmR/tK6YqrI1FR5d+h2FWBTw2wciiC6yGmzzChD6Gri2QLm104Vxn7rJAA?=
 =?iso-8859-1?Q?7ct4S5uqIbwqqjh+tEl+N50fGDap+0QH+uHjrqr1S5dsSz1Y/ZPPfrTuj6?=
 =?iso-8859-1?Q?524eoVPntN8DE6qKBSBTAioZ33lfPmF3QRsbqke0wlovy3WORKvxUB14XI?=
 =?iso-8859-1?Q?miR4hj/liN5tA/szuPLAoIZJAej8O1RaqgjQ1qgXCi/t+/dfAKOc1SXlN2?=
 =?iso-8859-1?Q?vaDYGd10DXAJ45ag0JVfEUN4kVnzU4x9OZBlm586dh9e2/f46iFrfEpMfW?=
 =?iso-8859-1?Q?evskCt4mN5wgWb/I2eS3a4eszZvhkKS31uR4s14LkDxoehYqYnSm/uBsB0?=
 =?iso-8859-1?Q?FBdtJEQ0PUj9yn+LNLInuetGt+dGaJ2ewK2+NufQFaw460NhR1xsfa0l2X?=
 =?iso-8859-1?Q?lMJMV22EHJoZclrpi3KxA1Y2Xo+VWp8jrMTGeBv8TWsNBI6p2+OT07P2Qo?=
 =?iso-8859-1?Q?KLuf6VnFxcs7B9NVxo5SdDuRy4zwhj9LoIskPtndejLgLQUpEd6nwMo7zX?=
 =?iso-8859-1?Q?eaubfqWAZdrhU4/qZiLDU17rrZzSXEgnT77cf0K3+KNFWAoY4EXVGspFWV?=
 =?iso-8859-1?Q?oYhy+o/THl33o/GWIq8SPcbOgQU0oGfUhapgDf21EVtkiEc1SFJ+q/qh/1?=
 =?iso-8859-1?Q?9sDASGGlg23fuKJP4oPSZQZaOG8JmlQYVwgSsN6lEWpM98rYp7ZwAZZfFj?=
 =?iso-8859-1?Q?YxDfC9Jz0SFSwbecOE+sBQ9NV8dJeLvDnniCV93X/X2vM4gDWxXtcgMNS/?=
 =?iso-8859-1?Q?61kNJgX3JSDZauIwAhYE65KcLwDOsYaVzZBeSYwMHp6X22v+vdXXZV1KJK?=
 =?iso-8859-1?Q?j8V0dQgAMN5nwR2kR7tJkWxGKniANBOt4wXw1yubu7zgdNjkgTmgm06bLg?=
 =?iso-8859-1?Q?DJAKRNE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5497.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(8096899003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sVBMUBNFz7EP3Zt4sGe92MV3/Uw/0AHuc5SwygPG0D/Iiudirtz0mi1iIN?=
 =?iso-8859-1?Q?qs41e9RVJvifjMflTRjr+vPwf5ZZqYhr3hytlTw2KGFG9v95WSMSS+PGJH?=
 =?iso-8859-1?Q?QeFNMCSmOvN6KWSIdR57WweL1vBmP89kwLwl4f/46EL7IksFniA9fiWA/o?=
 =?iso-8859-1?Q?n1jHFE7EVyLF4e/M8bDlpIpxojiujIXO6HouYngUq8MHilaAO5XTrPY4rF?=
 =?iso-8859-1?Q?qRJBIZWtGb0UwedptCJlKOU65y02K0Uzn/yYAIIQsum6M8l/IhqSpsTvHm?=
 =?iso-8859-1?Q?jkVYOPTY41ZPCeQkUD0RvJXsSxPua9Irbi98y5zVRw0U4rTHQEZ6sBzb8W?=
 =?iso-8859-1?Q?eh+S3sZ/xaTQIkYrL8DoyqOR3OSh1dcyxMKjNi93KaDbchm0O5T82w71Kp?=
 =?iso-8859-1?Q?PsMBwVT2dHbTWg+uq4IlkA6AAH3ko853QdHeIEJdy3oLl2zL5Qr8Sd6c/y?=
 =?iso-8859-1?Q?YHmqNXtBERRicR4hgKsUAtpvG7NwrRE7FUgGUaBPOcU13YeJKg4z4XZtyh?=
 =?iso-8859-1?Q?NQpzANqPo8q/boKbqmDlZnI9O2FEErs425BpLtlKisJROBFjrRV8sYOPxn?=
 =?iso-8859-1?Q?QgT6QxmHkSg0KU++1cVC0xtAg0d7G3TgnoyacNoOfd2SuxURWYw/s2lP/9?=
 =?iso-8859-1?Q?Ggzcwl+Df8etMXntXKbW8FNLDnuwfPGX8goVlO4Hv0tKWJYLkR/yMZ75xO?=
 =?iso-8859-1?Q?rS5HSlruc+PSvOZ2qS41cRS/SKNJxaT+ON2Zk1IbpdMGy12h0rl4BGVWHF?=
 =?iso-8859-1?Q?uuxCSoGrCS9rpClXY+odLTSMmxzJOWMMZCoO7br1GzCZ+xwwChhGm3BM8S?=
 =?iso-8859-1?Q?/lsDTcQKjpZfHXXPz78sBp3XgnDfABHwm3BmLVRlVXNkPcs4thWgKupUHw?=
 =?iso-8859-1?Q?MfpPJ/MzQk5waK5q1/eie2baI10lNBTMaZ8erS747WybfQ02tWfj5xw59n?=
 =?iso-8859-1?Q?DD99QEKD237bLCXwp5N4GOiqikMhweW0I1AeZ9+PBXv1nidluNr2maWrWO?=
 =?iso-8859-1?Q?wwX8wKax2qowc0vibHutmGdxEgtIJHBYCxMDAJi1jfKbUMPolkqEkH03zh?=
 =?iso-8859-1?Q?+6dMJyJOxcdqKZbteZXpRRSGmTE0KdFyftN5acAwv1Fa8A9tQBhLM4zjFy?=
 =?iso-8859-1?Q?aBFN/TkXN3BInZKF+teoeXb8XxZEWW8Gha/nQYXRD+i05CY3qq0HDyFx3q?=
 =?iso-8859-1?Q?hVhbg2SIcN6x2JzDULWetcIEnEV7j6L7eFSlnMZJhoRYK7aragYn3efdKZ?=
 =?iso-8859-1?Q?0hCz7qh46smUh/jGcPne87cNwG8cUrmV38+4AQyGgm/utqkjpKYS9ETNZE?=
 =?iso-8859-1?Q?FHhOda5tiQ9mhC83Y6FYz50C1cIn7Cfng0XlnaKTGsAE1LVSxWOokBijtM?=
 =?iso-8859-1?Q?G3QyNd7cZzv3fXWXiqtAwualaL073qjqjGVNDByCBh4dev6bu+cxhEekr7?=
 =?iso-8859-1?Q?gEIhT+AhCBBAClLji06/3a5z0X9eV8cKY5GOHMh/WpkN1/deNpeGSvTBan?=
 =?iso-8859-1?Q?RXJispjwmwDsNOmOl51qtj9d225jOvmxDCv9tWRzKmRMb7qGew7IYkGPjm?=
 =?iso-8859-1?Q?QOCgacPyoTF7ndtkOR58IrOJ/W44nKve9TWqI1xhaCRDKX4Ln6p570MTTx?=
 =?iso-8859-1?Q?sZe7n/0auR+fg=3D?=
Content-Type: multipart/alternative;
 boundary="_000_PH0PR12MB5497CABD981161A39BF2EDB2F593APH0PR12MB5497namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5497.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e5b19b-c3e3-461e-634d-08dd94204da2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 02:21:01.8291 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SRN4fpDulE/YtBu+nQcIJwbe9QbB4Op0/WiVy1tPL45NkHElhTrS6wEK8kjm2FM4XPaz5k91VCO+GheCFOkcxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6709
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

--_000_PH0PR12MB5497CABD981161A39BF2EDB2F593APH0PR12MB5497namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Philipp,

I updated the commit message to better clarify the issue. Would you mind re=
viewing if this revised description adequately explains the bug and the rat=
ionale behind the fix?

When an entity from application B is killed, drm_sched_entity_kill()
removes all jobs belonging to that entity through
drm_sched_entity_kill_jobs_work(). If application A's job depends on a
scheduled fence from application B's job, and that fence is not properly
signaled during the killing process, application A's dependency cannot be
cleared.

This leads to application A hanging indefinitely while waiting for a
dependency that will never be resolved. Fix this issue by ensuring that
scheduled fences are properly signaled when an entity is killed, allowing
dependent applications to continue execution.

Thanks,
Lin

________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Thursday, May 15, 2025 20:39
To: phasta@kernel.org <phasta@kernel.org>; cao, lin <lin.cao@amd.com>; dri-=
devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; aamd-gfx@lis=
ts.freedesktop.org <aamd-gfx@lists.freedesktop.org>
Cc: Chang, HaiJun <HaiJun.Chang@amd.com>; Yin, ZhenGuo (Chris) <ZhenGuo.Yin=
@amd.com>; Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH] drm/scheduler: signal scheduled fence when kill job

On 5/15/25 11:05, Philipp Stanner wrote:
> On Thu, 2025-05-15 at 10:48 +0200, Christian K=F6nig wrote:
>> Explicitly adding the scheduler maintainers.
>>
>> On 5/15/25 04:07, Lin.Cao wrote:
>>> Previously we only signaled finished fence which may cause some
>>> submission's dependency cannot be cleared the cause benchmark hang.
>>> Signal both scheduled fence and finished fence could fix this
>>> issue.
>
> Code seems legit to me; but be so kind and also pimp up the commit
> message a bit, Christian. It's not very clear what the bug is and why
> setting the parent to NULL solves it. Or is the issue simply that the
> fence might be dropped unsignaled, being a bug by definition? Needs to
> be written down.

The later, we simply forgot to signal the scheduled fence when an applicati=
on was killed.

> Grammar is also a bit too broken.
>
> And running the unit tests before pushing is probably also a good idea.

And maybe even writing a new unit test for that.

Regards,
Christian.

>
>>>
>>> Signed-off-by: Lin.Cao <lincao12@amd.com>
>
> Acked-by: Philipp Stanner <phasta@kernel.org>
>
>>
>> Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>
>>
>> Danilo & Philipp can we quickly get an rb for that? I'm volunteering
>> to push it to drm-misc-fixes and add the necessary stable tags since
>> this is a fix for a rather ugly bug.
>>
>> Regards,
>> Christian.
>>
>>
>>> ---
>>>  drivers/gpu/drm/scheduler/sched_entity.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index bd39db7bb240..e671aa241720 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -176,6 +176,7 @@ static void
>>> drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
>>>  {
>>>     struct drm_sched_job *job =3D container_of(wrk,
>>> typeof(*job), work);
>>>
>>> +   drm_sched_fence_scheduled(job->s_fence, NULL);
>>>     drm_sched_fence_finished(job->s_fence, -ESRCH);
>>>     WARN_ON(job->s_fence->parent);
>>>     job->sched->ops->free_job(job);
>>
>


--_000_PH0PR12MB5497CABD981161A39BF2EDB2F593APH0PR12MB5497namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Philipp,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I updated the commit message to better clarify the issue. Would you mind re=
viewing if this revised description adequately explains the bug and the rat=
ionale behind the fix?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend" style=3D"color: inherit;"></div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
When an entity from application B is killed, drm_sched_entity_kill() &nbsp;=
</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
removes all jobs belonging to that entity through &nbsp;</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
drm_sched_entity_kill_jobs_work(). If application A's job depends on a &nbs=
p;</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
scheduled fence from application B's job, and that fence is not properly &n=
bsp;</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
signaled during the killing process, application A's dependency cannot be &=
nbsp;</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
cleared. &nbsp;</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
This leads to application A hanging indefinitely while waiting for a &nbsp;=
</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
dependency that will never be resolved. Fix this issue by ensuring that &nb=
sp;</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
scheduled fences are properly signaled when an entity is killed, allowing &=
nbsp;</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);">
dependent applications to continue execution.</div>
<div class=3D"elementToProof"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Lin</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Koenig, Christian &lt;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b>&nbsp;Thursday, May 15, 2025 20:39<br>
<b>To:</b>&nbsp;phasta@kernel.org &lt;phasta@kernel.org&gt;; cao, lin &lt;l=
in.cao@amd.com&gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.fre=
edesktop.org&gt;; aamd-gfx@lists.freedesktop.org &lt;aamd-gfx@lists.freedes=
ktop.org&gt;<br>
<b>Cc:</b>&nbsp;Chang, HaiJun &lt;HaiJun.Chang@amd.com&gt;; Yin, ZhenGuo (C=
hris) &lt;ZhenGuo.Yin@amd.com&gt;; Danilo Krummrich &lt;dakr@kernel.org&gt;=
<br>
<b>Subject:</b>&nbsp;Re: [PATCH] drm/scheduler: signal scheduled fence when=
 kill job </div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">On 5/15/25 11:05, Philipp Stanner wrote:<br=
>
&gt; On Thu, 2025-05-15 at 10:48 +0200, Christian K=F6nig wrote:<br>
&gt;&gt; Explicitly adding the scheduler maintainers.<br>
&gt;&gt;<br>
&gt;&gt; On 5/15/25 04:07, Lin.Cao wrote:<br>
&gt;&gt;&gt; Previously we only signaled finished fence which may cause som=
e<br>
&gt;&gt;&gt; submission's dependency cannot be cleared the cause benchmark =
hang.<br>
&gt;&gt;&gt; Signal both scheduled fence and finished fence could fix this<=
br>
&gt;&gt;&gt; issue.<br>
&gt;<br>
&gt; Code seems legit to me; but be so kind and also pimp up the commit<br>
&gt; message a bit, Christian. It's not very clear what the bug is and why<=
br>
&gt; setting the parent to NULL solves it. Or is the issue simply that the<=
br>
&gt; fence might be dropped unsignaled, being a bug by definition? Needs to=
<br>
&gt; be written down.<br>
<br>
The later, we simply forgot to signal the scheduled fence when an applicati=
on was killed.<br>
<br>
&gt; Grammar is also a bit too broken.<br>
&gt;<br>
&gt; And running the unit tests before pushing is probably also a good idea=
.<br>
<br>
And maybe even writing a new unit test for that.<br>
<br>
Regards,<br>
Christian.<br>
<br>
&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Lin.Cao &lt;lincao12@amd.com&gt;<br>
&gt;<br>
&gt; Acked-by: Philipp Stanner &lt;phasta@kernel.org&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Reviewed-by: Christian K=F6nig &lt;christian.koenig@amd.com&gt;<br=
>
&gt;&gt;<br>
&gt;&gt; Danilo &amp; Philipp can we quickly get an rb for that? I'm volunt=
eering<br>
&gt;&gt; to push it to drm-misc-fixes and add the necessary stable tags sin=
ce<br>
&gt;&gt; this is a fix for a rather ugly bug.<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Christian.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; &nbsp;drivers/gpu/drm/scheduler/sched_entity.c | 1 +<br>
&gt;&gt;&gt; &nbsp;1 file changed, 1 insertion(+)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/drivers/gpu/drm/scheduler/sched_entity.c<br>
&gt;&gt;&gt; b/drivers/gpu/drm/scheduler/sched_entity.c<br>
&gt;&gt;&gt; index bd39db7bb240..e671aa241720 100644<br>
&gt;&gt;&gt; --- a/drivers/gpu/drm/scheduler/sched_entity.c<br>
&gt;&gt;&gt; +++ b/drivers/gpu/drm/scheduler/sched_entity.c<br>
&gt;&gt;&gt; @@ -176,6 +176,7 @@ static void<br>
&gt;&gt;&gt; drm_sched_entity_kill_jobs_work(struct work_struct *wrk)<br>
&gt;&gt;&gt; &nbsp;{<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp; struct drm_sched_job *job =3D container_of(=
wrk,<br>
&gt;&gt;&gt; typeof(*job), work);<br>
&gt;&gt;&gt; &nbsp;<br>
&gt;&gt;&gt; +&nbsp;&nbsp; drm_sched_fence_scheduled(job-&gt;s_fence, NULL)=
;<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp; drm_sched_fence_finished(job-&gt;s_fence, -=
ESRCH);<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp; WARN_ON(job-&gt;s_fence-&gt;parent);<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp; job-&gt;sched-&gt;ops-&gt;free_job(job);<br=
>
&gt;&gt;<br>
&gt;<br>
<br>
</div>
</div>
</body>
</html>

--_000_PH0PR12MB5497CABD981161A39BF2EDB2F593APH0PR12MB5497namp_--
